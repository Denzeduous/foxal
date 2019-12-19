package console_win

import "core:sys/win32"

BOOL    :: b32;
SHORT   :: i16;
WORD    :: u16;
WCHAR   :: u16;
CHAR    :: u8;
LPVOID  :: rawptr;
LPDWORD :: ^win32.DWORD;

GENERIC_READ_ACCESS  :: 0x80000000;
GENERIC_WRITE_ACCESS :: 0x40000000;

FILE_SHARE_NONE  :: 0x00000000;
FILE_SHARE_READ  :: 0x00000001;
FILE_SHARE_WRITE :: 0x00000002;

CONSOLE_TEXTMODE_BUFFER :: 0x00000001;

Access :: enum win32.DWORD {
    READ  = GENERIC_READ_ACCESS,
    WRITE = GENERIC_WRITE_ACCESS,
}

Share_Mode :: enum win32.DWORD {
    NONE  = FILE_SHARE_NONE,
    READ  = FILE_SHARE_READ,
    WRITE = FILE_SHARE_WRITE,
}

Buffer_Type :: enum win32.DWORD {
    TEXTMODE = CONSOLE_TEXTMODE_BUFFER,
}

Coord :: struct {
    X: SHORT,
    Y: SHORT,
}

Small_Rect :: struct {
    left:   SHORT,
    top:    SHORT,
    right:  SHORT,
    bottom: SHORT,
}

Char_Info :: struct {
    using Char: struct #raw_union {
        unicode_char: WCHAR,
        ascii_char: CHAR,
    }

    attributes: win32.WORD,
}

Console_Screen_Buffer_Info :: struct {
    dw_size               : Coord,
    dw_cursor_position    : Coord,
    w_attributes          : WORD,
    sr_window             : Small_Rect,
    dw_maximum_window_size: Coord,
}