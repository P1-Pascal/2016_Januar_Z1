program z1(input, output);

type
  niz = array[1..200] of integer;

var
  a1, a2, a: niz;
  n1, n2, n: integer;

function ucitajNiz(var a: niz; var n: integer): boolean;
var
  i: integer;
  b: boolean;
begin
  i:=0;
  while not eoln(input) do
  begin
    i:=i+1;
    read(a[i]);
  end;
  readln();

  n:=i;

  b:=true;
  for i:=2 to n do
    if a[i]<a[i-1] then
      b:=false;

  ucitajNiz:=b;
end;

procedure spojiNizove(var a1, a2, a: niz; var n1, n2, n: integer);
var
  i, j, k: integer;
begin
  i:=1;
  j:=1;
  k:=1;

  while (i<=n1) and (j<=n2) do
  begin
    if (a1[i]<=a2[j]) then
      begin
        a[k]:=a1[i];
        i:=i+1;
      end
    else
      begin
        a[k]:=a2[j];
        j:=j+1;
      end;

    while a[k]=a1[i] do
      i:=i+1;
    while a[k]=a2[j] do
      j:=j+1;

    k:=k+1;
  end;

  if (i<=n1) then
    while i<=n1 do
    begin
      while a[k-1]=a1[i] do
	i:=i+1;
      a[k]:=a1[i];
      i:=i+1;
      k:=k+1;
    end;
  if (j<=n2) then
    while j<=n2 do
    begin
      while a[k-1]=a2[j] do
	j:=j+1;
      a[k]:=a2[j];
      j:=j+1;
      k:=k+1;
    end;

  n:=k-1;

end;

procedure ispisiNiz(var a: niz; n: integer);
var
  i: integer;
begin
  for i:=1 to n do
  begin
    write(a[i], ' ');
  end;
  writeln();
end;

begin

  repeat
  begin
    write('Unesite prvi niz: ');
  end;
  until ucitajNiz(a1, n1)=true;

  repeat
  begin
    write('Unesite drugi niz: ');
  end;
  until ucitajNiz(a2, n2)=true;

  spojiNizove(a1, a2, a, n1, n2, n);
  ispisiNiz(a, n);

  readln(n);

end.
