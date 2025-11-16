{  Description :

  This unit allows you to create strings of characters drawn with a
  bitmap grid of letters. It's a remake of the source I had
  posted, but with many more advantages:

  - Versatility: It allows the use of different bitmap fonts, more
    or less complete, and broader use in downstream graphics processing
    with GDI, GDI+, DirectX, or OpenGL, thanks to its complete
    independence from these.

  - Performance: Simpler indexing and mapping processing routines;
    everything is pre-calculated before the heavy graphical processing and remains stored
    until the program closes. Resources are lighter with a
    consumption of only 255 bytes for each index table and
    fast string mapping processing.

  - User-friendly: a beginner will be able to use and implement it without difficulty
    with minimal guidance, a graphic designer will immediately understand
    how to build the font image, and a developer will also quickly understand
    that they can save the basic string for
    indexing (CharsEnum) in a file for each font, allowing for
    the creation of more elaborate and flexible programs in terms of customization
    or updates.

  How to test the unit:
  To use this function, the components must be installed in the compiler.

  procedure TForm1.Button1Click(Sender: TObject);
  var
    CharsMap: TCharsMap;
    MapStr: TMappedString;
    i, NullIndex: Integer;
    string_to_map: string;
  
  begin
    // First, we initialize the index array that performs the mapping
    // true ASCII character <-> index in image
    NullIndex := 0;
    CreateCharsMap(' !"****''()'+
                   '**,-. 0123'+
                   '456789:*<='+
                   '>**ABCDEFG'+
                   'HIJKLMNOPQ'+
                   'RSTUVWXYZ*', NullIndex, CharsMap);
    CharsMap['*'] := NullIndex; // "*" indique tous les trous
    CopyUpIndexToLo(CharsMap);

    // on crée la chaine mappée
    string_to_map := 'Hello World!';
    CreateMappedStr(string_to_map, CharsMap, MapStr);

    // on affiche le tableau résultant
    for i := 0 to Length(string_to_map) - 1 do
      ShowMessage(IntToStr(MapStr[i]));
  end;
}
unit oldskool_font_mapper;

interface

uses
  Types;

type
  // contains the character indexes in the image
  TCharsMap     = array[Char] of Byte;
  // allows you to store a "mapped" string
  TMappedString = array of Byte;

procedure CreateCharsMap(const CharsEnum: string; const NullIndex: Byte;
                        var CharsMap: TCharsMap);
procedure CreateMappedStr(const S : string; const CharsMap: TCharsMap;
                        var MappedString: TMappedString);
procedure CopyUpIndexToLo(var CharsMap: TCharsMap);
procedure CopyLoIndexToUp(var CharsMap: TCharsMap);

implementation

(* Procedure to call first: CharsEnum corresponds to the letters present in
   the image in the order (left top > right bottom) of appearance. NullIndex
   corresponds to the "empty" index for characters not present (0 for example).*)
procedure CreateCharsMap(const CharsEnum: string; const
          NullIndex: Byte; var CharsMap: TCharsMap);
var
  N: integer;

begin
  // we fill with NullIndex
  FillChar(CharsMap, 256, NullIndex);
  
  // For each character present, an index is assigned in the image.
  for N := 1 to Length(CharsEnum) do
     CharsMap[CharsEnum[N]] := N-1;
end;

// a procedure for transposing the indexes of uppercase
// characters to lowercase characters
procedure CopyUpIndexToLo(var CharsMap : TCharsMap);
var
  pS, pD: ^Char;

begin
  pS := @CharsMap;
  pD := @CharsMap;
  Inc(pS, $41); {'A'}
  Inc(pD, $61); {'a'}
  Move(pS^, pD^, 26); {de 'A'..'Z' a 'a'..'z'}
end;

// procedure for transposing lowercase character indexes to uppercase characters
procedure CopyLoIndexToUp(var CharsMap : TCharsMap);
var
  pS, pD: ^Char;
  
begin
  pS := @CharsMap;
  pD := @CharsMap;
  Inc(pS, $61); {'a'}
  Inc(pD, $41); {'A'}
  Move(pS^, pD^, 26); {de 'a'..'z' a 'A'..'Z'}
end;
(* Allows mapping a string. `S` is the string to be mapped, `CharsMap` is
   the index table to use for the mapping, and `MapedString`
   is the resulting index table.*)
procedure CreateMappedStr(const S: string; const CharsMap: TCharsMap; var
          MappedString: TMappedString);
var
  N: integer;
begin
  SetLength(MappedString, Length(S));
  for N := 1 to Length(S) do
    MappedString[N-1] := CharsMap[S[N]];
end;

end.
