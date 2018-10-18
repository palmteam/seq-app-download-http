program downloadarchive;

{$APPTYPE CONSOLE}

uses
  SysUtils,Classes,IdHTTP;



var

  entrada,name,url,arquivo: string;

procedure download(url,arquivo: string);
var
  IdHTTP1: TIdHTTP;
  Stream: TMemoryStream;
   FileName: String;
begin
  Filename := 'C:\temp\'+arquivo;
  IdHTTP1 := TIdHTTP.Create(nil);
  Stream := TMemoryStream.Create;
  try
    IdHTTP1.Get(Url, Stream);
    Stream.SaveToFile(FileName);
  finally
    Stream.Free;
    IdHTTP1.Free;
  end;
end;


begin
 url := GetEnvironmentVariable('SEQ_APP_SETTING_URLDOWNLOAD');
 arquivo := GetEnvironmentVariable('SEQ_APP_SETTING_FILELOCALNAME');

 if( (trim(url) <> '') and ( trim(arquivo) <> '' ) ) then
   download(url,arquivo);


end.
 