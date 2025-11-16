unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Jpeg, GIFImg,
  Vcl.Imaging.pngimage, ShellApi;


type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lCharsH: TLabel;
    lCharsW: TLabel;
    lWarn: TLabel;
    eFontLines: TEdit;
    eFontCols: TEdit;
    Button2: TButton;
    eFontHeight: TEdit;
    eFontWidth: TEdit;
    eCharsWidth: TEdit;
    eCharsHeight: TEdit;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    View: TMenuItem;
    ImageList1: TImageList;
    Panel3: TPanel;
    Edit1: TEdit;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    Splitter1: TSplitter;
    Label10: TLabel;
    ScrollBar1: TScrollBar;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Panel4: TPanel;
    ComboBox1: TComboBox;
    SpeedButton9: TSpeedButton;
    Export1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Save1: TMenuItem;
    SaveDialog2: TSaveDialog;
    View1: TMenuItem;
    CheckBox1: TCheckBox;
    N1: TMenuItem;
    N2: TMenuItem;
    Label12: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    List1: TMenuItem;
    Arrange1: TMenuItem;
    Image3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ViewClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure View1Click(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Arrange1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Declarations privates }
    fTotalChars : Integer;
    CharsCount : Word;
    Font : array of TBitmap;
    procedure LoadFont(const FromFileName : TFileName);
    procedure ShowFontMap;
    procedure Export(ImageIndex : Integer);
    function ScalePercentBmp(bitmp: TBitmap; iPercent: Integer): Boolean;
  public
    { Declarations public }
    path : string;
    procedure ZoomOnChar(ImageIndex : Integer);
    property TotalChars : Integer read fTotalChars;
  end;

var
  Form1: TForm1;

const
  COLOR_NUM = 15;
  ColorConst: array [0..COLOR_NUM] of TColor = (clBlack,
    clMaroon, clGreen, clOlive, clNavy,
    clPurple, clTeal, clGray, clSilver, clRed,
    clLime, clYellow, clBlue, clFuchsia,
    clAqua, clWhite);
  ColorNames: array [0..COLOR_NUM] of string = ('Black',
    'Maroon', 'Green', 'Olive', 'Navy',
    'Purple', 'Teal', 'Gray', 'Silver', 'Red',
    'Lime', 'Yellow', 'Blue', 'Fuchsia',
    'Aqua', 'White');

type
  PBitmap = ^TBitmap;
  TLine = array[0..MaxInt div SizeOf(TRGBQUAD) - 1] of TRGBQUAD;
  PLine = ^TLine;

implementation

uses oldskool_font_vcl, Zoom, Unit3;

{$R *.dfm}
function DeleteFile(const AFile: string): boolean;
var
 sh: SHFileOpStruct;
begin
 ZeroMemory(@sh, sizeof(sh));
 with sh do
   begin
   Wnd := Application.Handle;
   wFunc := fo_Delete;
   pFrom := PChar(AFile +#0);
   fFlags := fof_Silent or fof_NoConfirmation;
   end;
 result := SHFileOperation(sh) = 0;
end;

procedure BitmapFileToPNG(const Source, Dest: String);
var
  Bitmap: TBitmap;
  PNG: TPNGObject;
begin
  Bitmap := TBitmap.Create;
  PNG := TPNGObject.Create;
  {In case something goes wrong, free booth Bitmap and PNG}
  try
    Bitmap.LoadFromFile(Source);
    PNG.Assign(Bitmap);    //Convert data into png

    if Form1.CheckBox1.Checked = true then
    begin
      PNG.TransparentColor := clBlack;
      PNG.Transparent := true;
    end;

    PNG.SaveToFile(Dest);
  finally
    Bitmap.Free;
    PNG.Free;
  end
end;

procedure Highlight(aSource, ATarget: TBitmap; AColor: TColor);
  (* alters ASource to ATarget by making it appear as if looked through
     colored glass as given by AColor ASource, ATarget must have been created.
     Isn't as slow as it looks.*)
var i, j: Integer;
  s, t: pRGBTriple;
  r, g, b: byte;
  cl: TColor;
begin
  cl := ColorToRGB(AColor);
  r := GetRValue(cl);
  g := GetGValue(cl);
  b := GetBValue(cl);
  aSource.PixelFormat := pf24bit;
  ATarget.PixelFormat := pf24bit;
  ATarget.Width := aSource.Width;
  ATarget.Height := aSource.Height;
  for i := 0 to aSource.Height - 1 do
  begin
    s := ASource.Scanline[i];
    t := ATarget.Scanline[i];
    for j := 0 to aSource.Width - 1 do
    begin
      t^.rgbtBlue := (b * s^.rgbtBlue) div 255;
      t^.rgbtGreen := (g * s^.rgbtGreen) div 255;
      t^.rgbtRed := (r * s^.rgbtRed) div 255;
      inc(s);
      inc(t);
    end;
  end;
end;

procedure MirrorV(AImage: TImage);
var
  lBmp: TBitmap;
begin
  (* In geometry, the mirror image of an object or two-dimensional figure
     is the virtual image formed by reflection in a plane mirror; it is
     of the same size as the original object, yet different, unless the
     object or figure has reflection symmetry (also known as a P-symmetry).*)
  lBmp := TBitmap.Create;
  try
    lBmp.Assign(AImage.Picture.Graphic);
    StretchBlt(lBmp.Canvas.Handle,
                 0,
                 0,
                 lBmp.Width,
                 lBmp.Height,
               lBmp.Canvas.Handle,
                 0,
                 lBmp.Height,
                 lBmp.Width,
                 -lBmp.Height,
               SRCCOPY);

    AImage.Picture.Assign(lBmp);
  finally
    lBmp.Free;
  end;
end;

procedure MirrorH(AImage: TImage);
var
  lBmp: TBitmap;
begin
  lBmp := TBitmap.Create;
  try
    lBmp.Assign(AImage.Picture.Graphic);
    StretchBlt(lBmp.Canvas.Handle,
                 0,
                 0,
                 lBmp.Width,
                 lBmp.Height,
               lBmp.Canvas.Handle,
                 lBmp.Width,
                 0,
                -lBmp.Width,
                 lBmp.Height,
               SRCCOPY);

    AImage.Picture.Assign(lBmp);;
  finally
    lBmp.Free;
  end;
end;

function ResampleSubBitmap(Bitmap: TBitmap; XPos, YPos, Width, Height: Integer): TRGBQuad;
var
  r, g, b: Cardinal;
  Line: PLine;
  x, y, z: Integer;
begin
  (* In computer graphics and digital imaging, image scaling is the resizing
     of a digital image. In video technology, the magnification of digital
     material is known as upscaling or resolution enhancement.*)
  z := (Width * Height);
  r := 0;
  g := 0;
  b := 0;

  // Intercept border crossings
  if (YPos + Height) >= Bitmap.Height then Height := (Bitmap.Height - YPos) - 1;
  if (XPos + Width) >= Bitmap.Width then Width := (Bitmap.Width - XPos) - 1;

  // Read and add up the values ​​for each pixel
  for y := YPos to YPos + Height do
  begin
    Line := Bitmap.ScanLine[y];
    for x := XPos to XPos + Width do
    begin
      r := r + Line[x].rgbRed;
      g := g + Line[x].rgbGreen;
      b := b + Line[x].rgbBlue;
      Inc(z);
    end;
  end;

  if (z = 0) then z := 1;
  // Determine the average value and make small brightness corrections
  r := Round((r / z) * 1.4);
  if (r > 255) then r := 255;
  g := Round((g / z) * 1.4);
  if (g > 255) then g := 255;
  b := Round((b / z) * 1.4);
  if (b > 255) then b := 255;

  Result.rgbRed   := r;
  Result.rgbGreen := g;
  Result.rgbBlue  := b;
end;

function ResampleBitmap(Bitmap: TBitmap; NewWidth, NewHeight: Integer): Boolean;
var
  Temp: TBitmap;
  Line: PLine;
  x, y: Integer;
  Blockheight, Blockwidth: Cardinal;
  BlockPosX, BlockPosY: Single;
  BlockDiffX, BlockDiffY: Single;
  XPos, YPos: Single;
  DiffX, Diffy: Single;
begin
  Result := True;

  // Create working bitmap
  Temp := TBitmap.Create;

  // Everything must be 32 bit
  Bitmap.PixelFormat := pf32Bit;
  Temp.PixelFormat   := pf32Bit;

  // New height of our bitmap
  Temp.Height := NewHeight;
  Temp.Width  := NewWidth;

  // Break the old image into blocks, the average value of which is the color
  // of a new pixel
  // Block increment per new pixel
  BlockDiffY := (Bitmap.Height / NewHeight);
  BlockDiffX := (Bitmap.Width / NewWidth);
  // Size of a block
  BlockHeight := Trunc(BlockDiffY);
  BlockWidth  := Trunc(BlockDiffY);

  // Step size of the pixels in the new image
  DiffX := 1;
  DiffY := 1;

  // Initialize all
  BlockPosY := 0;
  YPos      := 0;
  // Every column
  for y := 0 to NewHeight - 1 do
  begin
    BlockPosX := 0;
    XPos      := 0;
    // Every line
    Line := Temp.ScanLine[Trunc(YPos)];
    for x := 0 to NewWidth - 1 do
    begin
      // From a specified block of the old bitmap the average of
      // Determine color
      Line[Trunc(XPos)] := ResampleSubBitmap(Bitmap,
        Round(BlockPosX), Round(BlockPosY), Blockwidth, BlockHeight);

      // One block/pixel further
      BlockPosX := BlockPosX + BlockDiffX;
      XPos      := XPos + DiffX;
    end;
    // One block/pixel further
    BlockPosY := BlockPosY + BlockDiffY;
    YPos      := YPos + DiffY;
  end;
  // Overwrite the old bitmap with the new one
  Bitmap.Assign(Temp);

  // Share auxiliary bitmap
  Temp.Free;
end;

function InvertBitmap(MyBitmap: TBitmap): TBitmap;
var
  x, y: Integer;
  ByteArray: PByteArray;
begin
  MyBitmap.PixelFormat := pf24Bit;
  for y := 0 to MyBitmap.Height - 1 do
  begin
    ByteArray := MyBitmap.ScanLine[y];
    for x := 0 to MyBitmap.Width * 3 - 1 do
    begin
      ByteArray[x] := 255 - ByteArray[x];
    end;
  end;
  Result := MyBitmap;
end;

procedure ImageGrayScale(var AnImage: TImage);
var
  JPGImage: TJPEGImage;
  BMPImage: TBitmap;
  MemStream: TMemoryStream;
begin
  BMPImage := TBitmap.Create;
  try
    BMPImage.Width  := AnImage.Picture.Bitmap.Width;
    BMPImage.Height := AnImage.Picture.Bitmap.Height;

    JPGImage := TJPEGImage.Create;
    try
      JPGImage.Assign(AnImage.Picture.Bitmap);
      JPGImage.CompressionQuality := 100;
      JPGImage.Compress;
      JPGImage.Grayscale := True;

      BMPImage.Canvas.Draw(0, 0, JPGImage);

      MemStream := TMemoryStream.Create;
      try
        BMPImage.SaveToStream(MemStream);
        //you need to reset the position of the MemoryStream to 0
        MemStream.Position := 0;

        AnImage.Picture.Bitmap.LoadFromStream(MemStream);
        AnImage.Refresh;
      finally
        MemStream.Free;
      end;
    finally
      JPGImage.Free;
    end;
  finally
    BMPImage.Free;
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  Image : TImage;
  GIF : TGIFImage;
begin
  if Image2.Picture.Graphic = nil then Exit;

  if SaveDialog2.Execute then
  BEGIN
    if SaveDialog2.FilterIndex = 1 then
    begin
      Image2.Picture.Bitmap.SaveToFile(SaveDialog2.FileName + '.bmp');
    end;

    if SaveDialog2.FilterIndex = 2 then
    begin
      Bmp := TBitmap.Create;
      Jpg := TJPEGImage.Create;
      try
        Bmp.Assign(Image2.Picture.Bitmap);

        if CheckBox1.Checked = true then begin
          Bmp.TransparentColor := clBlack;
          Bmp.Transparent := true;
        end;

        Jpg.Assign(Bmp);
        if CheckBox1.Checked = true then Jpg.Transparent := true;
        Jpg.SaveToFile(SaveDialog2.FileName + '.jpg');
      finally
        Jpg.Free;
        Bmp.Free;
      end;
    end;

    if SaveDialog2.FilterIndex = 3 then
    begin
      bmp := TBitmap.Create;
      bmp.Assign(Image2.Picture.Bitmap);

      if CheckBox1.Checked = true then begin
          Bmp.TransparentColor := clBlack;
          Bmp.Transparent := true;
        end;

      Image := TImage.Create(self);
      Image.Picture.Bitmap.Assign(bmp);
      GIF := TGIFImage.Create;
        try
          // Copy Bitmap Pixel to GIF Data
          GIF.Transparent := true;
          GIF.Assign(bmp);

          // Create GIF File Image
          GIF.SaveToFile(SaveDialog2.FileName + '.gif')
        finally
          GIF.Free;
        end;
    end;

    if SaveDialog2.FilterIndex = 4 then
    begin
      Image2.Picture.Bitmap.SaveToFile(SaveDialog2.FileName + '.bmp');
      BitmapFileToPNG(SaveDialog2.FileName + '.bmp',
                      SaveDialog2.FileName + '.png');
      DeleteFile(SaveDialog2.FileName + '.bmp');
    end;


  END;
end;

function TForm1.ScalePercentBmp(bitmp: TBitmap;
  iPercent: Integer): Boolean;
var
  TmpBmp: TBitmap;
  ARect: TRect;
  h, w: Real;
  hi, wi: Integer;
begin
  Result := False;
  try TmpBmp := TBitmap.Create;
    try
      h := bitmp.Height * (iPercent / 100);
      w := bitmp.Width * (iPercent / 100);
      hi := StrToInt(FormatFloat('#', h)) + bitmp.Height;
      wi := StrToInt(FormatFloat('#', w)) + bitmp.Width;
      TmpBmp.Width := wi;
      TmpBmp.Height := hi; ARect := Rect(0, 0, wi, hi);
      TmpBmp.Canvas.StretchDraw(ARect, Bitmp);
      bitmp.Assign(TmpBmp);
    finally
      TmpBmp.Free;
    end;
      Result := True;
  except
    Result := False;
  end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
{$R-}
  try
    Image2.Picture.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                      'Data\Backup\_img');
    ScalePercentBmp(Image2.Picture.Bitmap, ScrollBar1.Position);
  except
    on E: Exception do
      ShowMessage('Scale Calculate Error!' + E.Message);
  end;
  Image2.Invalidate;
  StatusBar1.Panels[5].Text := 'X-(' + IntToStr(Image2.Width) + ') - Y-(' +
                               IntToStr(Image2.Height) + ')';
  StatusBar1.Panels[7].Text := 'Scale Image..';
{$R+}
  SpeedButton3.Flat := true;
  SpeedButton4.Flat := true;
  SpeedButton5.Flat := true;
  SpeedButton6.Flat := true;
end;

procedure TForm1.LoadFont(const FromFileName : TFileName);
var
  X, Y : Word;
  i : Word;
  _font_src : TBitmap;
begin
  _font_src := TBitmap.Create;
  try
    _font_src.LoadFromFile(FromFileName);

    // initialization of the Bitmap array
    CharsCount := (_font_src.Width div ImageList1.Width) *
                  (_font_src.Height div ImageList1.Height);
    SetLength(Font, CharsCount);

    for i := 0 to CharsCount - 1 do
    begin
      // Destroy the old TBitmap (otherwise there will be a memory leak!)
      if Assigned(Font[i]) then FreeAndNil(Font[i]);
      Font[i] := TBitmap.Create;
      Font[i].Width := ImageList1.Width;
      Font[i].Height := ImageList1.Height;
    end;

    // cutting
    X := 0;
    Y := 0;

    repeat
      i := (X div ImageList1.Width)
        + ((Y div ImageList1.Height) * (_font_src.Width div ImageList1.Width));

      // font extraction
      Font[i].Canvas.CopyRect(Rect(0, 0, ImageList1.Width, ImageList1.Height),
        _font_src.Canvas, Rect(X, Y, ImageList1.Width + X, ImageList1.Height + Y));

      // Font[i].SaveToFile('x\' + IntToStr(i) + '.bmp');

      // offsets
      Inc(X, ImageList1.Width);

      if (X >= _font_src.Width) then
      begin
        Inc(Y, ImageList1.Height);
        X := 0;
      end;

    until (Y >= _font_src.Height);

  finally
    _font_src.Free;
  end;
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
begin
  (* This event is associated with double-clicking, so you need to
   make sure that he double-clicks on an item.*)
  if not Assigned(ListView1.Selected) then Exit;

  // ok
  ZoomOnChar(ListView1.Selected.ImageIndex);
end;

procedure TForm1.Export(ImageIndex : Integer);
var
  current : integer;
  bmp : TBitmap;
begin
  bmp := TBitmap.Create;
  Current := ImageIndex;
  bmp.Assign(Self.Font[Current]);

  if SaveDialog1.Execute then
  begin
    try
      bmp.SaveToFile(SaveDialog1.FileName + '.bmp');
    finally
      bmp.Free;
      StatusBar1.Panels[7].Text := 'Save Char..';
    end;
  end;

end;


procedure TForm1.ZoomOnChar(ImageIndex : Integer);
begin
  with Form2 do
  begin
    CurrentIndex := ImageIndex;
    Image1.Picture.Bitmap := Self.Font[CurrentIndex];

    StatusBar1.SimpleText := 'Character ID : ' + IntToStr(CurrentIndex)
                  + ' (Total : ' + IntToStr(TotalChars) + ')';

    UpdateButtons();
    if not Form2.Showing then
    begin
      SetZoomWindowSize(ImageList1.Width, ImageList1.Height);
      ShowModal;
    end;
  end;
end;

procedure TForm1.ShowFontMap;
var
  i : Integer;
begin
  ListView1.Clear;
  for i := 0 to CharsCount - 1 do
  begin
    ImageList1.Add(Font[i], nil);
    with ListView1.Items.Add do
    begin
      Caption := 'Char Pos('+  IntToStr(i) + ')';
      ImageIndex := i;
    end;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if Image1.Stretch = false then
  begin
    Image1.Stretch := true;
    SpeedButton1.Flat := false;
    StatusBar1.Panels[7].Text := 'Stretch Image..';
  end else begin
    Image1.Stretch := false;
    SpeedButton1.Flat := true;
    StatusBar1.Panels[7].Text := 'Stretch Image return..';
  end;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  if Image2.Transparent = false then
  begin
    Image2.Transparent := true;
    SpeedButton2.Flat := false;
    StatusBar1.Panels[7].Text := 'Transparent aktiv';
  end else begin
    Image2.Transparent := false;
    SpeedButton2.Flat := true;
    StatusBar1.Panels[7].Text := 'Transparent not aktiv';
  end;
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  if SpeedButton3.Flat = true then
  begin
    Image2.Picture.Bitmap.SaveToFile(ExtractFilePath(Application.ExeName) +
                                    'Data\Backup\_gray');
    ImageGrayScale(Image2);
    SpeedButton3.Flat := false;
    StatusBar1.Panels[7].Text := 'Image Grayscale';
  end else begin
    SpeedButton3.Flat := true;
    Image2.Picture.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                    'Data\Backup\_gray');
    StatusBar1.Panels[7].Text := 'Image RGB';
  end;
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  if SpeedButton4.Flat = true then
  begin
    SpeedButton4.Flat := false;
    Image2.Picture.Bitmap := InvertBitmap(Image2.Picture.Bitmap);
  end else begin
    Image2.Picture.Bitmap := InvertBitmap(Image2.Picture.Bitmap);
    SpeedButton4.Flat := true;
  end;
  StatusBar1.Panels[7].Text := 'Image Invert';
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  ResampleBitmap(Image2.Picture.Bitmap,
                Image2.Picture.Bitmap.Width, Image2.Picture.Bitmap.Height);
  StatusBar1.Panels[7].Text := 'Resmaple Image Pixel +1%';
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  if SpeedButton6.Flat = true then
  begin
    SpeedButton6.Flat := false;
    MirrorV(Image2);
  end else begin
    SpeedButton6.Flat := true;
    MirrorV(Image2);
  end;
  StatusBar1.Panels[7].Text := 'Turn Image Vertical';
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  if SpeedButton7.Flat = true then
  begin
    SpeedButton7.Flat := false;
    MirrorH(Image2);
  end else begin
    SpeedButton7.Flat := true;
    MirrorH(Image2);
  end;
  StatusBar1.Panels[7].Text := 'Turn Image Horizontal';
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
var
  color : TColor;
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  case ComboBox1.ItemIndex of
  0 : color := clBlack;
  1 : color := clMaroon;
  2 : color := clGreen;
  3 : color := clOlive;
  4 : color := clNavy;
  5 : color := clPurple;
  6 : color := clTeal;
  7 : color := clGray;
  8 : color := clSilver;
  9 : color := clRed;
  10 : color := clLime;
  11 : color := clYellow;
  12 : color := clBlue;
  13 : color := clFuchsia;
  14 : color := clAqua;
  15 : color := clWhite;
  end;

  Highlight(Image2.Picture.Bitmap, Image2.Picture.Bitmap, color);
  StatusBar1.Panels[7].Text := 'Colorize Image';
  Image2.Invalidate;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  if (Image1.Picture.Graphic = nil) or
     (Image2.Picture.Graphic = nil) or
     (Edit1.Text = '') then
     begin
       StatusBar1.Panels[7].Text := 'Can not generate, no Image or Text.';
       Exit;
     end;

  ScrollBar1.Position := 1;
  ScrollBar1.OnChange(sender);
  StatusBar1.Panels[7].Text := 'Undo';
end;

procedure TForm1.View1Click(Sender: TObject);
begin
  try
    form3 := TForm3.Create(nil);
    form3.ShowModal;
  finally
  end;
end;

procedure TForm1.ViewClick(Sender: TObject);
begin
  //if not Assigned(lv.Selected) then
  //  lv.PopupMenu := nil
  //else
     (* This event is associated with double-clicking, so you need to
   make sure that he double-clicks on an item.*)
  if not Assigned(ListView1.Selected) then Exit;

  // ok
  ZoomOnChar(ListView1.Selected.ImageIndex);
end;

procedure ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(path + SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure BitampCreate;
var  bmp    : TBitmap; i : integer;
begin
  try
  for i := 0 to Form1.Memo1.Lines.Count do
    begin
      bmp:=TBitmap.Create;
      if i > (Form1.Memo1.Lines.Count -1) then break;
      bmp.LoadFromFile(ExtractFilePath(Application.ExeName) +
                        'Data\32bit\' + ExtractFileName(Form1.Memo1.Lines.Strings[i]));
      Form1.ListBox1.Items.AddObject('', bmp);
      //Form1.StatusBar1.Panels[1].Text := IntToStr(Form1.Memo1.Lines.Count);
    end;
  finally
  bmp.Free;
  end;
end;

procedure TForm1.Arrange1Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsList;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  tmp : TImage;
begin
  // delete the listview and the associated imagelist
  ListView1.Clear;
  ImageList1.Clear;

  //  load the bitmap font
  tmp := TImage.Create(Self);
  try
    tmp.Picture.Bitmap.LoadFromFile(path);
    tmp.AutoSize := True;
    eFontWidth.Text := IntToStr(tmp.Width);
    eFontHeight.Text := IntToStr(tmp.Height);

    // char width = bitmap font width div cols
    // char height = bitmap font height div lines
    try
      ImageList1.Width := StrToInt(eFontWidth.Text) div StrToInt(eFontCols.Text);
      ImageList1.Height := StrToInt(eFontHeight.Text) div StrToInt(eFontLines.Text);
    except
      MessageBoxA(Handle, 'Doh ! What are you doing ?', 'Warning', MB_ICONWARNING);
      Exit;
    end;

    // We display this in the readonly edits
    eCharsWidth.Text := IntToStr(ImageList1.Width);
    eCharsHeight.Text := IntToStr(ImageList1.Height);

    // we calculate if it's square
    lWarn.Caption := '';
    if ((ImageList1.Width * StrToInt(eFontCols.Text)) <> tmp.Width)
      or ((ImageList1.Height * StrToInt(eFontLines.Text)) <> tmp.Height) then
        // PROBLEMS !!!
        lWarn.Caption := 'WARNING ! This Bitmap Font is NOT squared !';
  finally
    tmp.Free;
  end;

  // proceed to cut the bitmap font
  try
    //StatusBar1.Panels[5].Text := 'Parsing ...';

    LoadFont(path);
  except
    // StatusBar1.SimpleText := '';
    MessageBoxA(Handle, PAnsiChar('Sorry guy, but at least one entry parameter is wrong.' + #13#10
      + 'Make sure your bitmap font is *REALLY* squared (each chars is '
      + eCharsWidth.Text + 'x' + eCharsHeight.Text + ' *EXACTLY*).'), 'Warning', MB_ICONWARNING);
    Exit;
  end;

  // display the result in the listview
  ShowFontMap;

  fTotalChars := StrToInt(eFontCols.Text) * StrToInt(eFontLines.Text);
  StatusBar1.Panels[3].Text := IntToStr(TotalChars);
end;

procedure TForm1.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (Control as TComboBox).Canvas do
  begin
    FillRect(Rect);
    TextOut(30, Rect.Top,
      ComboBox1.Items[Index]);
    Pen.Color   := clBlack;
    Brush.Color := ColorConst[Index];
    Rectangle(Rect.Left + 2, Rect.Top + 2, 24,
      Rect.Top + 15);
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  BitmapVcl: TOldskoolFontBitmapVcl;
  Bmp : TBitmap;
  Str: string;

begin
  // Here the "*" acts as a "fill-in-the-blank" character. It's a choice. Every time it
  //There will be an "*", which will represent an index of 0 (because NullIndex = 0)
  Str := Edit1.Text;
  BitmapVcl := TOldskoolFontBitmapVcl.Create(' !"****''()' +        // Intigrate Chars
                                             '**,-. 0123' +
                                             '456789:*<=' +
                                             '>**abcdefg' +
                                             'hijklmnopq' +
                                             'rstuvwxyz*', 0, '*',
                                             Image1.Picture.Bitmap, // Bitmap Fon Map
                                             6,                     // Lines
                                             10);                   // Cols

  Bmp := TBitmap.Create;
  try
    BitmapVcl.DrawString(PChar(Str), Bmp);
    Image2.Picture.Assign(Bmp);
    Image2.Picture.Bitmap.SaveToFile(ExtractFilePath(Application.ExeName) +
                                    'Data\Backup\_img');
    ScrollBar1.Position := 1;
  finally
    BitmapVcl.Free;
    Bmp.Free;
  end;

  if Edit1.Text = '' then ScrollBar1.Enabled := false;

  StatusBar1.Panels[5].Text := 'X-(' + IntToStr(Image2.Width) + ') - Y-(' +
                               IntToStr(Image2.Height) + ')';
  StatusBar1.Panels[7].Text := 'Draw Font Image.';
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Edit1.Text = '' then
  Scrollbar1.Enabled := false
  else
  ScrollBar1.Enabled := true;
end;

procedure TForm1.Export1Click(Sender: TObject);
begin
  if ListView1.Items.Count = 0  then Exit;
  Export(ListView1.Selected.ImageIndex);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin
  Form1.DoubleBuffered := true;
  Application.HintPause := 0;
  Application.HintHidePause := 50000;
  ListFileDir(ExtractFilePath(Application.ExeName) + 'Data\32bit\', Memo1.Lines);
  BitampCreate;

  for i := Low(ColorNames) to High(ColorNames) do
    begin
      ComboBox1.Items.Add(ColorNames[i]);
    end;
  ComboBox1.ItemIndex := 8;

  lWarn.Caption := '';
  ScrollBar1.Enabled := false;
  StatusBar1.Panels[1].Text := IntToStr(ListBox1.Items.Count);

  Image2.Picture.Graphic := nil;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  //ShowFontMap;
end;

procedure TForm1.Image2DblClick(Sender: TObject);
begin
  try
    form3 := TForm3.Create(nil);
    form3.ShowModal;
  finally
  end;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsSmallIcon
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  bmp : TBitmap;
begin
{$R-}
  Screen.Cursor := crHourGlass;
  bmp := TBitmap.Create;
  try
    path := ExtractFilePath(Application.ExeName) + 'Data\32bit\' +
                        ExtractFileName(Memo1.Lines[ListBox1.ItemIndex]);

    if not FileExists(path) then
    begin
      MessageBoxA(Handle, 'Please Enter valid a Filename !', 'Warning', MB_ICONWARNING);
      Exit;
    end;
    bmp.LoadFromFile(path);
    Image1.Picture.Bitmap.Assign(bmp);
  finally
    Button2Click(self);
    Edit1.OnChange(sender);
    bmp.Free;
  end;
  StatusBar1.Panels[5].Text := 'X-(' + IntToStr(Image2.Width) + ') - Y-(' +
                               IntToStr(Image2.Height) + ')';

  if Edit1.Text > '' then
  begin
    ScrollBar1.Enabled := true;
  end else begin
    ScrollBar1.Enabled := false;
  end;

  Screen.Cursor := crDefault;
{$R+}
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  Bitmap: TBitmap;
begin
  with ListBox1 do
  begin
    Canvas.FillRect(Rect);
    if Items.Objects[Index] <> nil then
    begin
      Bitmap := Items.Objects[Index] as TBitmap;
      Canvas.BrushCopy(Bounds(Rect.Left + 2, Rect.Top + 2,
        Bitmap.Width-200, Bitmap.Height-100), Bitmap, Bounds(0, 0, Bitmap.Width,
        Bitmap.Height), Bitmap.Canvas.Pixels[0, Bitmap.Height - 1]);
    end;
  end;
end;

end.
