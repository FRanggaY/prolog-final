:- use_module(library(odbc)).

% Mengatur koneksi ke database MySQL
connect_to_db :-
    odbc_connect('myodbc', _,
                 [user(root), password(''), alias(mahasiswa_db), open(once)]).


% Menutup koneksi ke database
disconnect_from_db :-
    odbc_disconnect(mahasiswa_db).


% Menambahkan data mahasiswa ke dalam database
add_mahasiswa(NIM, Nama, Jurusan) :-
    format(atom(Query), 'INSERT INTO mahasiswa (nim, nama, jurusan) VALUES (~w, \'~w\', \'~w\')', [NIM, Nama, Jurusan]),
    odbc_query(mahasiswa_db, Query).

% Menampilkan data mahasiswa dari database
show_mahasiswa :-
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~a~46t~*||~n',['mahasiswa', 70]),
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~w~46t~*|',['NIM', 50]),
    format('|~46t~w~46t~*|',['Nama', 30]),
    format('|~46t~w~46t~*||~n',['Jurusan', 70]),
    format('-----------------------------------------------------------------------~n'),
    odbc_query(mahasiswa_db, 'SELECT nim, nama, jurusan FROM mahasiswa ORDER BY nama DESC', row(NIM, Nama, Jurusan)),
    format('|~46t~w~46t~*|',[NIM, 50]),
    format('|~46t~w~46t~*|',[Nama, 30]),
    format('|~46t~w~46t~*||~n',[Jurusan, 70]),
    fail.
show_mahasiswa :-
    format('-----------------------------------------------------------------------~n').

% Menambahkan data dosen ke dalam database
add_dosen(KodeDosen, NamaDosen) :-
    format(atom(Query), 'INSERT INTO dosen (kode_dosen, nama_dosen) VALUES (\'~w\', \'~w\')', [KodeDosen, NamaDosen]),
    odbc_query(mahasiswa_db, Query).

% Menampilkan data dosen dari database
show_dosen :-
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~a~46t~*||~n',['dosen', 70]),
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~w~46t~*|',['KodeDosen', 50]),
    format('|~46t~w~46t~*||~n',['Nama', 70]),
    format('-----------------------------------------------------------------------~n'),
    odbc_query(mahasiswa_db, 'SELECT kode_dosen, nama_dosen FROM dosen ORDER BY nama_dosen ASC', row(KodeDosen, NamaDosen)),
    format('|~46t~w~46t~*|',[KodeDosen, 50]),
    format('|~46t~w~46t~*||~n',[NamaDosen, 70]),
    fail.
show_dosen :-
    format('-----------------------------------------------------------------------~n').

% Menambahkan data mata_kuliah ke dalam database
add_mata_kuliah(KodeMataKuliah, NamaMataKuliah) :-
    format(atom(Query), 'INSERT INTO mata_kuliah (kode_mata_kuliah, nama_mata_kuliah) VALUES (\'~w\', \'~w\')', [KodeMataKuliah, NamaMataKuliah]),
    odbc_query(mahasiswa_db, Query).

% Menampilkan data mata_kuliah dari database
show_mata_kuliah :-
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~a~46t~*||~n',['mata_kuliah', 70]),
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~w~46t~*|',['KodeMataKuliah', 50]),
    format('|~46t~w~46t~*||~n',['Nama', 70]),
    format('-----------------------------------------------------------------------~n'),
    odbc_query(mahasiswa_db, 'SELECT kode_mata_kuliah, nama_mata_kuliah FROM mata_kuliah ORDER BY nama_mata_kuliah ASC', row(KodeMataKuliah, NamaMataKuliah)),
    format('|~46t~w~46t~*|',[KodeMataKuliah, 50]),
    format('|~46t~w~46t~*||~n',[NamaMataKuliah, 70]),
    fail.
show_mata_kuliah :-
    format('-----------------------------------------------------------------------~n').

% Menambahkan data nilai ke dalam database
add_nilai(NIM, KodeMataKuliah, Nilai) :-
    format(atom(Query), 'INSERT INTO nilai (nim, kode_mata_kuliah, nilai) VALUES (~w, \'~w\', ~w)', [NIM, KodeMataKuliah, Nilai]),
    odbc_query(mahasiswa_db, Query).

% Menampilkan data nilai dari database
show_nilai :-
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~a~46t~*||~n',['nilai', 150]),
    format('-----------------------------------------------------------------------~n'),
    format('|~46t~w~46t~*|',['NIM', 50]),
    format('|~46t~w~46t~*|',['NamaMahasiswa', 70]),
    format('|~46t~w~46t~*|',['KodeMataKuliah', 100]),
    format('|~46t~w~46t~*|',['NamaMataKuliah', 120]),
    format('|~46t~w~46t~*||~n',['Nilai', 150]),
    format('-----------------------------------------------------------------------~n'),
    odbc_query(mahasiswa_db, 'SELECT n.nim, m.nama, n.kode_mata_kuliah, mk.nama_mata_kuliah, n.nilai FROM nilai n LEFT JOIN mahasiswa m on n.nim = m.nim LEFT JOIN mata_kuliah mk on n.kode_mata_kuliah = mk.kode_mata_kuliah order by m.nama', row(NIM, NamaMahasiswa, KodeMataKuliah, NamaMataKuliah, Nilai)),
    format('|~46t~w~46t~*|',[NIM, 50]),
    format('|~46t~w~46t~*|',[NamaMahasiswa, 70]),
    format('|~46t~w~46t~*|',[KodeMataKuliah, 100]),
    format('|~46t~w~46t~*|',[NamaMataKuliah, 120]),
    format('|~46t~w~46t~*||~n',[Nilai, 150]),
    fail.
show_nilai :-
    format('-----------------------------------------------------------------------~n').

% Contoh penggunaan
main :-
    connect_to_db,
    show_mahasiswa,
    disconnect_from_db.

% Jalankan main untuk menjalankan contoh
:- main.
