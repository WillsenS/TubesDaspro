Program Baca;
uses typetubes;

var
	f : text;
	data : string;
	mentah : bahanMentah;
	v2,e,i : integer;
	v1 : longint;
	tBahanMentah : tabBahanMentah;
	
begin
	assign(f, 'BahanMentah.dat');
	reset(f);
	tBahanMentah.neff := 0;
	
	while not(eof(f)) do
	begin
		readln(f, data);
		mentah.NamaBahanMentah := copy(data,1,pos('|',data)-2);
		delete(data,1,pos('|',data)+1);
		
		val(copy(data,1,pos('|',data)-2), v1, e);
		mentah.HargaSatuan := v1;
		delete(data,1,pos('|',data)+1);
		
		val(data, v2, e);
		mentah.DurasiKadaluarsa := v2;
		
		tBahanMentah.neff := tBahanMentah.neff + 1;
		tBahanMentah.tab[tBahanMentah.neff] := mentah;
	end;
	close(f);
	
	for i := 1 to tBahanMentah.neff do
	begin
		writeln(tBahanMentah.tab[i].DurasiKadaluarsa);
	end;
	
end.
	
	