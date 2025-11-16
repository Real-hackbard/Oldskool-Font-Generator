unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  Image1.Picture.Bitmap.Assign(Form1.Image2.Picture.Bitmap);
end;

procedure TForm3.FormResize(Sender: TObject);
begin
  Form3.ClientHeight := Image1.Picture.Bitmap.Height;
  Form3.ClientWidth := Image1.Picture.Bitmap.Width;
end;

end.
