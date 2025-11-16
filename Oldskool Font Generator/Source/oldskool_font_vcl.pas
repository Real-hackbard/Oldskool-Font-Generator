
unit oldskool_font_vcl;

interface

uses
  SysUtils, Types, Graphics, oldskool_font_mapper;

type
  TOldskoolFontBitmapVcl = class
  private
    BitmapFont: TBitmap;
    CharsMap: TCharsMap;
    BCols: Integer;
    CharWidth, CharHeight: Integer;
    function IndexToPoint(const Index: Integer): TPoint;
  public
    constructor Create(CharsEnum: string; const NullIndex: Byte;
      const NullChar: Char; BFont: TBitmap; const Lines, Cols: Integer);
    destructor Destroy; override;
    procedure DrawString(const S: string; var Output: TBitmap);
  end;

implementation

constructor TOldskoolFontBitmapVcl.Create(CharsEnum: string; const NullIndex: Byte;
      const NullChar: Char; BFont: TBitmap; const Lines, Cols: Integer);
begin
  // sysutils for uppercase, you can code the function yourself
  CharsEnum := UpperCase(CharsEnum);
  CreateCharsMap(CharsEnum, NullIndex, Self.CharsMap);
  // NullChar indicates all the holes in CharsEnum
  CharsMap[NullChar] := NullIndex;
  CopyUpIndexToLo(CharsMap);
  Self.BitmapFont := TBitmap.Create;
  Self.BitmapFont.Height := BFont.Height;
  Self.BitmapFont.Width := BFont.Width;
  Self.BitmapFont.Assign(BFont);
  CharHeight := BitmapFont.Height div Lines;
  CharWidth := BitmapFont.Width div Cols;
  BCols := Cols;
end;

destructor TOldskoolFontBitmapVcl.Destroy;
begin
  Self.BitmapFont.Free;

  inherited;
end;

function TOldskoolFontBitmapVcl.IndexToPoint(const Index: Integer): TPoint;
begin
  Result.X := (Index mod BCols) * CharWidth;
  Result.Y := (Index div BCols) * CharHeight;
end;

procedure TOldskoolFontBitmapVcl.DrawString(const S: string; var Output: TBitmap);
const
  OFFSET_X = 0;
  OFFSET_Y = 0;
var
  P: PChar;
  i, len: integer;
  Dr, Sr: TRect;
begin
  P := PChar(S);
  len := Length(S);
  Output.Height := CharHeight;
  Output.Width := (len * CharWidth);
  
  for i := 0 to len - 1 do begin
    Sr.TopLeft     := IndexToPoint(CharsMap[P[i]]);
    Sr.BottomRight := Point(Sr.Left+CharWidth, Sr.Top+CharHeight);
    Dr.TopLeft     := Point(OFFSET_X + (CharWidth*i), OFFSET_Y);
    Dr.BottomRight := Point(OFFSET_X + (CharWidth*(i+1)), OFFSET_Y + CharHeight);
    Output.Canvas.CopyRect(Dr, BitmapFont.Canvas, Sr);
  end;
end;

end.
