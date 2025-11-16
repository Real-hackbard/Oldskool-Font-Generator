![oldskool_font_vcl pas](https://github.com/user-attachments/assets/b8dd539c-c93a-4ad6-ba00-c76ac5545d88)# Oldskool-Font-Generator:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![oldskool_font_mapper pas](https://github.com/user-attachments/assets/992ee0c0-150e-4142-a498-2f5348bc4112) ![oldskool_font_vcl pas](https://github.com/user-attachments/assets/87aacdef-fe2c-4c87-8ccd-b9f639350497)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Oldskool Font Generator](https://github.com/user-attachments/assets/952a6ccb-c5a1-4184-84ba-86a7c8a438c7)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![112025](https://github.com/user-attachments/assets/6c049038-ad2c-4fe3-9b7e-1ca8154910c2)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

A bitmap font is one that stores each [glyph](https://en.wikipedia.org/wiki/Glyph) as an array of [pixels](https://en.wikipedia.org/wiki/Pixel) (that is, a bitmap). It is less commonly known as a raster font or a pixel font. Bitmap fonts are simply collections of [raster images](https://en.wikipedia.org/wiki/Raster_graphics) of glyphs. For each variant of the font, there is a complete set of glyph images, with each set containing an image for each character. For example, if a font has three sizes, and any combination of bold and italic, then there must be 12 complete sets of images.

</br>

![Oldskool_main](https://github.com/user-attachments/assets/771a24a8-fb6b-4346-91d2-da848b7909a6)

</br>

* Extremely fast and simple to render
* Easier to create than other kinds.
* Unscaled bitmap fonts always give exactly the same output when displayed on the same specification display
* Best for very low-quality or small-size displays where the font needs to be fine-tuned to display clearly

The primary disadvantage of bitmap fonts is that the visual quality tends to be poor when scaled or otherwise transformed, compared to outline and stroke fonts, and providing many optimized and purpose-made sizes of the same font dramatically increases memory usage. The earliest bitmap fonts were only available in certain optimized sizes such as 8, 9, 10, 12, 14, 18, 24, 36, 48, 72, and 96 points (assuming a resolution of 96 DPI), with custom fonts often available in only one specific size, such as a headline font at only 72 points.

The limited processing power and memory of early computer systems forced the exclusive use of bitmap fonts. Improvements in hardware have allowed them to be replaced with outline or stroke fonts in cases where arbitrary scaling is desirable, but bitmap fonts are still in common use in embedded systems and other places where speed and simplicity are considered important.


# Integrate your own bitmap fonts:
The project includes 70 pre-made bitmap fonts, each with a specific image size and a specific character size within the image. The image size must be exactly ```320 × 150 (4-bit) pixels```, and the characters must not exceed a maximum size of ```25 × 25``` to prevent them from being overwritten.

### Example original size:

</br>

![image008](https://github.com/user-attachments/assets/e37c7868-809a-4472-bd79-8660dcf64753)

</br>

The individual characters must be arranged in the same order as shown in the image above to match the keyboard layout. Additional characters, such as special characters, can be inserted in the empty spaces. Then you rename the image to ```image###``` where ```"###"``` stands for the number, without a file extension, and copy it to the ```..\Data\32bit\..``` folder. The program will then automatically recognize the image and add it to the list.

Here are over 500 pre-made font images that you can simply copy into the folder and use:
https://mega.nz/file/sHIkkBqK#m801w9NWEMufaVfNZmELidknu0T09xrpoFWmJcjhhXA

# Chars:
To check whether the characters are exactly the right size, the program has a character manager that allows you to individually visualize or export all characters.

</br>

![Oldskool_chars](https://github.com/user-attachments/assets/aa7f7737-3602-43dd-8f03-a22a0c3355bf)

</br>

If the sizes of the individual characters don't match, one character will overwrite the character below it. This can be checked pixel by pixel using the manager.

</br>

![char](https://github.com/user-attachments/assets/279b818a-8869-4ce1-84a6-917b3f7b7dd6)

</br>

# Size change:
When images are resized, they not only lose quality, but the pixels also become blurred, so the original bit count is no longer correct. Since bitmap fonts are all 4-bit pixel images, the image can only be scaled proportionally to avoid this problem and ensure the image remains 4-bit pixels.

Here's an example:

Original 4 Bit:
</br>

![original 4bit](https://github.com/user-attachments/assets/275866a2-c13a-46e2-871a-228003dc53eb)

</br>

Heavily smeared (fail):

</br>

![smeared](https://github.com/user-attachments/assets/8c30312d-5a2a-4c56-8b83-e45455862cd6)

</br>

It is difficult to see with the naked eye, but the lower image has failed and the pixels have smeared together.  
The function that prevents this problem and preserves the original pixels is applied here.

```pascal

{..]
 private
    { Private-Deklarationen }
     function ScalePercentBmp(bitmp: TBitmap; iPercent: Integer): Boolean;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
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
      bitmp.Assign(TmpBmp); finally
      TmpBmp.Free; end; Result := True;  except  Result := False;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 ScalePercentBmp(Image1.Picture.Bitmap, 1);
end;
```

</br>

### Have fun!




