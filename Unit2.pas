unit Unit2;

interface

uses
  System.SysUtils, System.Classes, Data.DB;

type
  TDateTimeDataModule = class(TDataModule)
    DateTimeDataModule: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateTimeDataModule: TDateTimeDataModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
