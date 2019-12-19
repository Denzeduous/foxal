package console_win

import "core:sys/win32"

foreign import "system:kernel32.lib"

@(default_calling_convention="std")
foreign kernel32 {
    @(link_name="SetConsoleTitleA") set_console_title :: proc(lp_console_title: cstring) -> BOOL ---;

    @(link_name="CreateConsoleScreenBuffer") create_console_screen_buffer :: proc(dw_desired_access     :  Access,
                                                                                  dw_share_mode         :  Share_Mode,
                                                                                  lp_security_attributes: ^win32.Security_Attributes,
                                                                                  dw_flags              :  Buffer_Type,
                                                                                  lp_screen_buffer_data :  LPVOID) -> win32.Handle ---;
    
    @(link_name="SetConsoleActiveScreenBuffer") set_console_active_screen_buffer :: proc(h_console_output: win32.Handle) -> BOOL ---;

    @(link_name="WriteConsoleA") write_console :: proc(h_console_output          : win32.Handle,
                                                       lp_buffer                 : rawptr,
                                                       n_number_of_chars_to_write: DWORD,
                                                       lp_number_of_chars_written: LPDWORD,
                                                       lp_reserved               : LPVOID) -> BOOL ---;

    @(link_name="WriteConsoleOutputA") write_console_output :: proc(h_console_output:  win32.Handle,
                                                                    lp_buffer       : ^Char_Info,
                                                                    dw_buffer_size  :  Coord,
                                                                    dw_buffer_coord :  Coord,
                                                                    lp_write_region : ^Small_Rect) -> BOOL ---;

    @(link_name="SetConsoleCursorPosition") set_console_cursor_position :: proc(h_console_output: win32.Handle,
                                                                                dw_cursor_position: Coord) -> BOOL ---;

    @(link_name="SetConsoleWindowInfo") set_console_window_info :: proc(h_console_output :  win32.Handle,
                                                                        b_absolute       :  BOOL,
                                                                        lp_console_window: ^Small_Rect) -> BOOL ---;

    @(link_name="GetConsoleScreenBufferInfo") get_console_screen_buffer_info :: proc(h_console_output             :  win32.Handle,
                                                                                     lp_console_screen_buffer_info: ^Console_Screen_Buffer_Info) -> BOOL ---;

    @(link_name="FlushConsoleInputBuffer") flush_console_input_buffer :: proc(h_console_input: win32.Handle) -> BOOL ---;

    @(link_name="SetConsoleTextAttribute") set_console_text_attribute :: proc(h_console_input: win32.Handle,
                                                                              w_attributes: WORD) -> BOOL ---;
}
