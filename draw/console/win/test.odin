package console_win

import "core:c"
import "core:fmt"

main :: proc() {
    set_console_title("Test");

    buffer_handle := create_console_screen_buffer(.WRITE, .NONE, nil, .TEXTMODE, nil);
    set_console_active_screen_buffer(buffer_handle);

    output := [4]u8{'a', 'b', 'c', 'd'};

    num_chars_written: DWORD;
    ok: BOOL;

    ok = write_console(buffer_handle, cast(rawptr)&output, cast(DWORD)4, &num_chars_written, nil);
    
    if (!ok || num_chars_written != 4) {
        fmt.println(win32.get_last_error());
    }

    a: Char_Info;
    a.ascii_char = 0x61;
    a.attributes = 0x0041;

    b: Char_Info;
    b.ascii_char = 0x62;
    b.attributes = 0x0082;

    c: Char_Info;
    c.ascii_char = 0x63;
    c.attributes = 0x0014;

    d: Char_Info;
    d.ascii_char = 0x64;
    d.attributes = 0x0105;

    output_color := [4]Char_Info{a, b, c, d};

    buffer_info: ^Console_Screen_Buffer_Info;
    get_console_screen_buffer_info(buffer_handle, buffer_info);

    write_region := Small_Rect{4, 0, 8, 0};

    ok = write_console_output(buffer_handle, &output_color[0], buffer_info.dw_size, Coord{0, 0}, &write_region);

    if (!ok) {
        fmt.println(win32.get_last_error());
    }

    for {

    }
}
