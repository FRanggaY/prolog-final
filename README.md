## Connect

Install library ODBC in SWI-Prolog

?- pack_install(odbc).


## Consult

'''sh
consult mahasiswa.pl
'''

## Connect

'''sh
connect_to_db.
'''

## INSERT DATA

add mahasiswa
'''sh
add_mahasiswa(NIM, Nama, Jurusan).
'''

'''sh
add_dosen(KodeDosen, NamaDosen).
'''

'''sh
add_mata_kuliah(KodeMataKuliah, NamaMataKuliah).
'''

'''sh
add_nilai(NIM, KodeMataKuliah, Nilai).
'''

## READ DATA

add mahasiswa
'''sh
show_mahasiswa.
'''

'''sh
show_dosen.
'''

'''sh
show_mata_kuliah.
'''

'''sh
show_nilai.
'''