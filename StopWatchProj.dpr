program StopWatchProj;

uses
  System.StartUpCopy,
  FMX.Forms,
  StopWatchForm in 'StopWatchForm.pas' {swForm},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DateTimeDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TswForm, swForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDateTimeDataModule, DateTimeDataModule);
  Application.Run;

end.
