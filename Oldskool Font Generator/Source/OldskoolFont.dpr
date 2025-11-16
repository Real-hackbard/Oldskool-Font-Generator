program OldskoolFont;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  oldskool_font_mapper in 'oldskool_font_mapper.pas',
  oldskool_font_vcl in 'oldskool_font_vcl.pas',
  Zoom in 'Zoom.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
