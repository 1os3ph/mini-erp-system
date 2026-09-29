-- DUMMY DATA FOR TESTING

-- Insert Vendor
INSERT INTO master_vendor (id_vendor, nama_vendor) VALUES 
('VND-001', 'PT Asus Teknologi Indonesia'),
('VND-002', 'PT Indofood Sukses Makmur');

-- Insert Customer
INSERT INTO master_customer (id_customer, nama_customer, no_hp) VALUES 
('CUS-001', 'Tulang Isaac', '081234567890'),
('CUS-002', 'Jose Purba', '089876543210');

-- Insert Barang
INSERT INTO master_barang (id_barang, id_vendor, nama_barang, stok_tersedia, harga_beli, harga_jual) VALUES 
('BRG-001', 'VND-001', 'Laptop Asus ROG', 10, 15000000.00, 18000000.00),
('BRG-002', 'VND-002', 'Indomie Goreng 1 Dus', 50, 100000.00, 120000.00);