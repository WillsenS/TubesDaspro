// Nama 	: Bram Musuko P
// Tanggal	: 9 - April - 2018
unit F11;

interface 
	uses typetubes;
	procedure tidur(var tTidur : tabsimulasi; var tBahanMentah : tabBahanMentah; var tBahanOlahan : tabBahanOlahan );
	// I.S : Telah melakukan minimal satu aksi pada hari tersebut
	// F.S : Hari akan bertambah 1, Membuang Makanan kadaluarsa, Menambah energi menjadi 10

implementation 
	
	procedure tidur(var tTidur : tabsimulasi; var tBahanMentah : tabBahanMentah; var tBahanOlahan : tabBahanOlahan );
	var
		k : integer; //variabel untuk loop
	begin
		if (tTidur.tab[s].JumlahAksi = 0) then // Belum melakukan aksi
		begin
			writeln('Tidak dapat melakukan tidur');
		end else // telah melakukan aksi lebih dari satu
		begin
			tTidur.tab[s].JumlahHariHidup := tTidur.tab[s].JumlahHariHidup + 1;
			tTidur.tab[s].JumlahEnergi := 10;
			tTidur.tab[s].JumlahIstirahat := 0;
			tTidur.tab[s].JumlahMakan := 0;
			for k := 1 to tBahanMentah.neff do
			begin
				tBahanMentah.tab[k].DurasiKadaluarsa := tBahanMentah.tab[k].DurasiKadaluarsa - 1; //Mengurangi durasi Kadaluarsa bahan mentah
				if (tBahanMentah.tab[k].DurasiKadaluarsa = -1 ) then
				begin
					//mendelete array
				end;
			end;
			for k := 1 to tBahanOlahan.neff do
			begin
			tBahanOlahan.tab[k].DurasiKadaluarsa := tBahanOlahan.tab[k].DurasiKadaluarsa - 1; //Mengurangi durasi Kadaluarsa bahan olahan
				if (tBahanOlahan.tab[k].DurasiKadaluarsa = -1 ) then
				begin
					//mendelete array
				end;
			end;
		end;
	end;
	
end.			
