program StopWatchProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  StopWatchWindow in 'StopWatchWindow.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TStopWatchForm, swForm);
  Application.Run;
end.
