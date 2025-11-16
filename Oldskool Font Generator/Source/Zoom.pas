unit Zoom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    bPrev: TButton;
    bNext: TButton;
    CheckBox1: TCheckBox;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure bPrevClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Declarations privates }
  public
    { Declarations public }
    CurrentIndex : Integer;
    procedure UpdateButtons();
    procedure SetZoomWindowSize(OneCharWidth, OneCharHeight : Integer);
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}
procedure TForm2.SetZoomWindowSize(OneCharWidth, OneCharHeight : Integer);
begin
  //Constraints.MinWidth := pLeft.Width + pRight.Width + OneCharWidth * 6;
  //Constraints.MinHeight := pTop.Height + pBottom.Height + sb.Height + OneCharHeight * 6;

  //Width := pLeft.Width + pRight.Width + OneCharWidth * 10;
  //Height := pTop.Height + pBottom.Height + sb.Height + OneCharHeight * 10;
end;

procedure TForm2.UpdateButtons();
begin
  bPrev.Enabled := CurrentIndex - 1 >= 0;
  bNext.Enabled := CurrentIndex + 1 < Form1.TotalChars;
end;

procedure TForm2.bNextClick(Sender: TObject);
begin
  CurrentIndex := CurrentIndex + 1;
  Form1.ZoomOnChar(CurrentIndex);
end;

procedure TForm2.bPrevClick(Sender: TObject);
begin
  CurrentIndex := CurrentIndex - 1;
  Form1.ZoomOnChar(CurrentIndex);
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then
  begin
    Image1.Stretch := true;
  end else begin
    Image1.Stretch := false;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Image1.Stretch := true;
end;

end.
