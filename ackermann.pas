Program Ackerman;

Uses sysutils;
 
function ackermann(m, n: Integer) : Integer;
begin
   if m = 0 then
      ackermann := n+1
   else if n = 0 then
      ackermann := ackermann(m-1, 1)
   else
      ackermann := ackermann(m-1, ackermann(m, n-1));
end;
 
var
   m, n	: Integer;


begin
    m := StrToInt(ParamStr(1));
    n := StrToInt(ParamStr(2));
    WriteLn(ackermann(m,n));
end.