unit resepinventori;

interface
	uses typetubes;
	procedure cariResep(Rtemp: tabResep; nResep: string);
	//I.S.: nResep atau nama resep yang ingin dicari serta Rtemp atau tabresep terdefinisi
	//F.S.: seluruh informasi dari resep dengan nama nResep ditampilkan ke layar apabila terdapat dalam Rtemp
	procedure tambahResep(var Rtemp:tabResep; bMentah:tabBahanMentah; bOlahan:tabBahanOlahan);
	//I.S: Rtemp terdefinisi, tidak penuh
	//F.S: elemen Rtemp bertambah satu dan telah divalidasi berdasarkan syarat yang ada
	procedure upgradeInventori(var bMentah:tabInventoriBahanMentah; var bOlahan:tabInventoriBahanOlahan);
	//I.S.: bMentah dan bOlahan terdefinisi
	//F.S.: bMentah dan bOlahan ditambahn kapasitasnya sebanyak 25
	
implementation

	procedure cariResep(Rtemp: tabResep; nResep: string);
		var
			i:integer; //variabel untuk looping
			found:boolean; //variabel untuk looping
		begin
			found:=false;
			i:=1;
			while ((i<=Rtemp.neff) and (not(found))) do
				begin
					if (Rtemp.tab[i].NamaResep=nResep) then 
						found:=true
					else 
						i:=i+1;
				end;
			if (found=true) then
				begin
					writeln('Nama resep: ',Rtemp.tab[i].NamaResep);
					writeln('Harga jual: ',Rtemp.tab[i].HargaJual);
					writeln('Jumlah bahan: ',Rtemp.tab[i].JumlahBahan);
					writeln('Bahan yang diperlukan: ');
					for i:=1 to Rtemp.tab[i].JumlahBahan do
						begin
							writeln('-',Rtemp.tab[i].Bahan[i]);
						end;
				end
			else
				writeln('Resep tidak ditemukan!');
		end;
	
	procedure tambahResep(var Rtemp:tabResep; bMentah:tabBahanMentah; bOlahan:tabBahanOlahan);
		var
			i,j:integer; //variabel untuk looping
			strtemp:string; //variabel untuk menerima masukan string
			jmlbhn:integer;
			hargabahan:integer; //total harga dari bahan-bahan yang telah diinput
			found:boolean;
			inharga:integer;
		begin
			hargabahan:=0;
			write('Masukkan nama resep: ');
			readln(strtemp);
			write('Masukkan jumlah bahan: ');
			readln(jmlbhn);
			while (jmlbhn<2) do
				begin //validasi input jumlah bahan
					writeln('Jumlah bahan minimal adalah 2!');
					write('Masukkan jumlah bahan: ');
					readln(jmlbhn);
				end;
			Rtemp.neff:=Rtemp.neff+1;
			Rtemp.tab[Rtemp.neff].NamaResep:=strtemp;
			Rtemp.tab[Rtemp.neff].JumlahBahan:=jmlbhn;
			for i:=1 to jmlbhn do
				begin
					write('Masukkan bahan ke-',i,': ');
					readln(strtemp);
					//Pendcarian nama dan harga bahan
					found:=false;
					j:=1;
					while ((j<=bMentah.neff) and (not(found))) do
					begin
						if (bMentah.tab[j].NamaBahanMentah=strtemp) then 
							begin
								found:=true;
								hargabahan:=hargabahan+bMentah.tab[j].HargaSatuan;
							end
						else 
							j:=j+1;
					end;
					j:=1;
					while ((j<=bOlahan.neff) and (not(found))) do
					begin
						if (bOlahan.tab[j].NamaBahanOlahan=strtemp) then 
							begin
								found:=true;
								hargabahan:=hargabahan+bOlahan.tab[j].HargaJual;
							end
						else 
							j:=j+1;
					end;
					//Loop pesan kesalahan, pemasukan input kembali, pencarian nama dan harga bahan
					while (not(found)) do
						begin
							writeln('Bahan yang anda masukkan tidak ditemukan!');
							write('Masukkan bahan ke-',i,': ');
							readln(strtemp);
							found:=false;
							j:=1;
							while ((j<=bMentah.neff) and (not(found))) do
							begin
								if (bMentah.tab[j].NamaBahanMentah=strtemp) then 
									begin
										found:=true;
										hargabahan:=hargabahan+bMentah.tab[j].HargaSatuan;
									end
								else 
									j:=j+1;
							end;
							j:=1;
							while ((j<=bOlahan.neff) and (not(found))) do
							begin
								if (bOlahan.tab[j].NamaBahanOlahan=strtemp) then 
									begin
										found:=true;
										hargabahan:=hargabahan+bOlahan.tab[j].HargaJual;
									end
								else 
									j:=j+1;
							end;
						end;
					//Validasi harga jual 
					write('Masukkan harga jual: ');
					readln(inharga);
					while (inharga<(9/8*Real(hargabahan))) do
						begin
							writeln('Keuntungan minimal 12,5%!');
							write('Masukkan harga jual: ');
							readln(inharga);
						end;
					//Masukkan nama dan jumlah harga ke parameter
					Rtemp.tab[Rtemp.neff].Bahan[i]:=strtemp;
					Rtemp.tab[Rtemp.neff].HargaJual:=hargabahan;
				end;
			
		end;
	
	procedure upgradeInventori(var bMentah:tabInventoriBahanMentah; var bOlahan:tabInventoriBahanOlahan);
		begin
			bMentah.kapasitas:=bMentah.kapasitas+25;
			bOlahan.kapasitas:=bOlahan.kapasitas+25;
		end;
	
end.