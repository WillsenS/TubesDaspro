// Nama 	: Bram Musuko P
// Tanggal	: 9 - April - 2018
unit F9;

interface 
	uses typetubes;
	procedure makan(var tMakan : tabSimulasi);
	//I.S : tMakan terdefiisi
	//F.S : Menambah 3 energi untuk sekali makan, dengan maksimal 3 kali makan dalam sehari
	
implementation

	procedure makan(var tMakan : tabSimulasi);
		begin
			if (tMakan.tab[s].JumlahMakan = 3 ) then // melebihi batas makan dalam sehari
			begin
				writeln('Tidak dapat makan lagi');
			end else // memenuhi syarat makan
			begin
				tMakan.tab[s].JumlahMakan := tMakan.tab[s].JumlahMakan + 1;
				tMakan.tab[s].JumlahEnergi := tMakan.tab[s].JumlahEnergi + 3;
				if (tMakan.tab[s].JumlahEnergi > 10 ) then
				begin
					tMakan.tab[s].JumlahEnergi := 10;
				end;
			end;
		end;

end.
	
	
