// Nama		: Bram Musuko P
// Tanggal	: 9 - April - 2018

unit typetubes;

interface

const
	arrMin = 1;
	arrMax = 20;

type
	tanggal = record
		hari	: integer;
		bulan	: integer;
		tahun	: integer;
	end;

	bahanMentah = record
		NamaBahanMentah			: string;
		HargaSatuan				: longint;
		DurasiKadaluarsa		: integer;
	end;
	
	tabBahanMentah = record
		tab	: array [arrMin..arrMax] of bahanMentah;
		neff	: integer;
	end;
	
	bahanOlahan = record
		NamaBahanOlahan		: string;
		HargaJual			: longint;
		JumlahBahan			: integer;
		Bahan				: array [arrMin..arrMax] of string;
		DurasiKadaluarsa	: integer // gw tambahin ya  
		//Durasi kadaluarsa 3 hari
	end;
	
	tabBahanOlahan = record
		tab		: array [arrMin..arrMax] of bahanOlahan;
		neff	: integer;
	end;
	
	inventoriBahanMentah = record
		NamaBahanMentah		: string;
		TanggalBeli			: tanggal;	
		Jumlah				: integer;
	end;
	
	tabInventoriBahanMentah = record
		kapasitas: integer;
		tab	: array of inventoriBahanMentah; 
		//Pembuatan array ini harus dinamis krn inventori dapat diperbesar.
		//Karena itu besar array tidak dapat didefinisikan sekarang, apalagi dengan konstanta arrMax yang tidak dapat diubah.
		//Pembuatan array ini harus dilakukan dengan fungsi bawaan Pascal: SetLength(tabInventoriBahanMentah,kapasitas)
		neff	: integer;
	end;
	
	inventoriBahanOlahan = record
		NamaBahanOlahan		: string;
		TanggalBuat			: tanggal;
		Jumlah				: integer;
	end;
	
	tabInventoriBahanOlahan = record
		kapasitas: integer;
		tab	: array of inventoriBahanOlahan;
		//Pembuatan array ini harus dinamis krn inventori dapat diperbesar.
		//Karena itu besar array tidak dapat didefinisikan sekarang, apalagi dengan konstanta arrMax yang tidak dapat diubah.
		//Pembuatan array ini harus dilakukan dengan fungsi bawaan Pascal: SetLength(tabInventoriBahanOlahan,kapasitas)
		neff	: integer;
	end;
	
	resep = record
		NamaResep		: string;
		HargaJual		: longint;
		JumlahBahan	: integer;
		Bahan				: array[arrMin..arrMax] of string;
	end;
	
	tabResep = record
		tab	: array [arrMin..arrMax] of resep;
		neff	: integer;
	end;
	
	simulasi = record
		NomorSimulasi					: integer;
		Tanggal							: tanggal;
		JumlahHariHidup					: integer;
		JumlahEnergi					: integer;
		KapasitasMaksimumInventori		: integer;
		TotalBahanMentahDibeli			: integer;
		TotalBahanOlahanDibuat			: integer;
		TotalBahanOlahanDijual			: integer;
		TotalResepDijual				: integer;
		TotalPemasukan					: longint;
		TotalPengeluaran				: longint;
		TotalUang						: longint;
		{ Variabel diluar file eksternal }
		JumlahIstirahat					: integer;
		JumlahMakan						: integer;
		JumlahAksi						: integer;
	end;
	
	tabSimulasi	= record
		tab	: array [arrMin..arrMax] of simulasi;
		neff	: integer;
	end;
	
	var
	s : integer; // simulasi ke-berapa
	
implementation

end.
