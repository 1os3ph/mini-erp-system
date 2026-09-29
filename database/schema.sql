-- ==========================================
-- MINI ERP SCHEMA (PostgreSQL)
-- Author: Jose Purba (IT Del)
-- ==========================================

-- 1. MASTER DATA
CREATE TABLE master_vendor (
    id_vendor VARCHAR(50) PRIMARY KEY,
    nama_vendor VARCHAR(255) NOT NULL
);

CREATE TABLE master_customer (
    id_customer VARCHAR(50) PRIMARY KEY,
    nama_customer VARCHAR(255) NOT NULL,
    no_hp VARCHAR(20)
);

CREATE TABLE master_barang (
    id_barang VARCHAR(50) PRIMARY KEY,
    id_vendor VARCHAR(50) REFERENCES master_vendor(id_vendor),
    nama_barang VARCHAR(255) NOT NULL,
    stok_tersedia INT DEFAULT 0,
    harga_beli NUMERIC(12,2) NOT NULL,
    harga_jual NUMERIC(12,2) NOT NULL
);

-- 2. PROCUREMENT (PEMBELIAN KE VENDOR)
CREATE TABLE pembelian (
    id_pembelian VARCHAR(50) PRIMARY KEY,
    id_vendor VARCHAR(50) REFERENCES master_vendor(id_vendor),
    tanggal DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE pembelian_detail (
    id_detail VARCHAR(50) PRIMARY KEY,
    id_pembelian VARCHAR(50) REFERENCES pembelian(id_pembelian) ON DELETE CASCADE,
    id_barang VARCHAR(50) REFERENCES master_barang(id_barang),
    qty INT NOT NULL,
    harga_beli NUMERIC(12,2) NOT NULL
);

-- 3. SALES (PENJUALAN KE CUSTOMER)
CREATE TABLE transaksi (
    id_transaksi VARCHAR(50) PRIMARY KEY,
    id_customer VARCHAR(50) REFERENCES master_customer(id_customer),
    tanggal DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE transaksi_detail (
    id_detail VARCHAR(50) PRIMARY KEY,
    id_transaksi VARCHAR(50) REFERENCES transaksi(id_transaksi) ON DELETE CASCADE,
    id_barang VARCHAR(50) REFERENCES master_barang(id_barang),
    qty INT NOT NULL,
    harga_satuan NUMERIC(12,2) NOT NULL
);