# Final Task using Prolog (Implementation odbc and create read from database MySQL)

Persist that database configuration is valid

Open SWI-Prolog then do

Install library ODBC in SWI-Prolog

```sh
?- pack_install(odbc).
```

## Consult

```sh
consult mahasiswa.pl
```

## Connect

```sh
connect_to_db.
```

## INSERT DATA

add mahasiswa
```sh
add_mahasiswa(NIM, Nama, Jurusan).
```

add dosen
```sh
add_dosen(KodeDosen, NamaDosen).
```

add mata kuliah
```sh
add_mata_kuliah(KodeMataKuliah, NamaMataKuliah).
```

add nilai
```sh
add_nilai(NIM, KodeMataKuliah, Nilai).
```

## READ DATA

read mahasiswa
```sh
show_mahasiswa.
```

read dosen
```sh
show_dosen.
```

read mata kuliah
```sh
show_mata_kuliah.
```

read nilai
```sh
show_nilai.
```