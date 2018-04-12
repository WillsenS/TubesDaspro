// Nama 	: Bram Musuko P
// Tanggal	: 9 - April - 2018

unit F10;

interface
	uses typetubes;
	procedure istirahat(var tIstirahat : tabSimulasi);
	//I.S : tIstirahat telah terdefinisi
	//F.S : Menambahkan energi sebanyak 1 dengan maksimal 6 kali istirahat dalam sehari
	
implementation
	
	procedure istirahat(var tIstirahat : tabSimulasi);
		begin
			if (tIstirahat.tab[s].JumlahIstirahat = 6 ) then // melebihi batas istirahat dalam sehari
			begin
				writeln('Tidak dapat beristirahat');
			end else // memenuhi syarat istirahat
			begin
				tIstirahat.tab[s].JumlahIstirahat := tIstirahat.tab[s].JumlahIstirahat + 1 ;
				tIstirahat.tab[s].JumlahEnergi := tIstirahat.tab[s].JumlahEnergi + 1;
				if ( tIstirahat.tab[s].JumlahEnergi > 10 ) then
				begin
					tIstirahat.tab[s].JumlahEnergi := 10;
				end;
			end;
		end;

end.
