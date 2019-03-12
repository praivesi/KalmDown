unit StopWatchManager;

interface

uses
  SysUtils, DateUtils, FMX.Types;

Type
  TStopWatchManager = class
    time : TDateTime;
    function GetTime(): TDateTime;
  end;

var
 swManager : TStopWatchManager;

implementation
function TStopWatchManager.GetTime(): TDateTime;
begin
//  time := EncodeDateTime(0, 0, 0, 0, 5, 0, 0);
  Result := EncodeDateTime(0, 0, 0, 0, 5, 0, 0);
//  swForm.lblMinute.Text := IntToStr(MinuteOf(time));
end;


end.
