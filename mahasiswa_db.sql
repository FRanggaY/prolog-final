CREATE DATABASE mahasiswa_db;
USE mahasiswa_db;

CREATE TABLE mahasiswa (
    nim INT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(50) NOT NULL
);

CREATE TABLE mata_kuliah (
    kode_mata_kuliah VARCHAR(10) PRIMARY KEY,
    nama_mata_kuliah VARCHAR(100)
);

CREATE TABLE dosen (
    kode_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100)
);

CREATE TABLE nilai (
    nim INT,
    kode_mata_kuliah VARCHAR(10),
    nilai FLOAT,
    PRIMARY KEY (nim, kode_mata_kuliah),
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kode_mata_kuliah) REFERENCES mata_kuliah(kode_mata_kuliah)
);
