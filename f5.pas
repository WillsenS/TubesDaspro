// Nama/NIM : Willsen Sentosa
// Tanggal : 10 - April - 2018
unit F5; // melakukan pembelian bahan mentah dari supermarket

interface 
	  	    uses typetubes;
		      uses F1;
		      procedure beliBahan;
		      procedure olahBahan;
		
implementation

		    procedure beliBahan;
        
			      {kamus lokal}
			      var
				             	found : boolean; //digunakan untuk mengetahui apakah barang sudah ada di inventori atau belum
					            totalHarga : integer; //total harga dari belanja. jika barang tiddak ada di supermarket, maka harga menjadi 0
					            barang : string; //nama barang yang akan dibeli
					            kuantitas : integer; //kuantitas barang yang akan dibeli
			        		    i : integer; //variabel untuk looping
			      begin
				        	    totalHarga:= 0;
				        	    found:= false;
		
					            //input
				            	write('Nama bahan: ');
				            	readln(barang);
		            			write('Kuantitas: ');
	            				readln(kuantitas);
		
	             				//menghitung total harga
				            	for i:=1 to (tabBahanMentah.neff) do
						              begin
							                  	if ((tabBahanMentah.tab[i].NamaBahanMentah) = barang) then
								                    	begin
										                        	totalHarga:= kuantitas*(tab[i].HargaSatuan);
									                    end;
						              end;
		
					            //output
					            write('Total harga: ',totalHarga);
		
				            	// kondisi jika pembelian gagal
					            if ((totalHarga = 0) or ((tabInventoriBahanMentah.neff + kuantitas) > (tabInventoriBahanMentah.kapasitas)) or (totalHarga > simulasi.TotalUang))then
			              			begin
							                  	writeln('Pembelian barang gagal, silahkan coba lagi. ');
						              end
					            // kondisi jika pembelian sukses
					            else
						              begin
								                  writeln('Pembelian sukses.');
							                  	sukses := true;
						                  		simulasi.JumlahEnergi := simulasi.JumlahEnergi - 1; //mengurangi jumlah energi
								                  simulasi.TotalUang := simulasi.TotalUang - totalHarga; //mengurangi uang
								                  tabInventoriBahanMentah.neff := tabInventoriBahanMentah.neff + kuantitas; //menambah neff inventoriBahanmMentah
								
							          	        //pencarian barang apakah sudah ada dalam inventoriBahanMentah
							      	            for i:= 1 to (tabInventoriBahanOlahan.neff) do
									                    begin
										                            if (tabInventoriBahanOlahan.tab[i].NamaBahanOlahan = barang) then //mencari barang apakah sudah ada atau tidak
												                            begin
											                                  			tabInventoriBahanOlahan.tab[i].Jumlah := tabInventoriBahanOlahan.tab[i].Jumlah + kuantitas ;
														                                  found := true;
												                            end;
									                    end;
								                  //jika barang belum ada
								                  if not found then //menambahkan barang ke dalam tab
								                    	begin
											                          tabInventoriBahanOlahan.tab[i+1].NamaBahanOlahan := barang;
											                          tabInventoriBahanOlahan.tab[i+1].Jumlah := kuantitas;
									                    end;
			              			end;
		      	end.
