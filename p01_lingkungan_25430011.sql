-- Modul 1: Lingkungan Basis Data
-- Database: kopma_123
-- User kerja: mhs_123

CREATE DATABASE kopma_123
 CHARACTER SET utf8mb4
 COLLATE utf8mb4_unicode_ci;

CREATE USER 'mhs_123'@'localhost'
 IDENTIFIED BY '<password_kerja>';

GRANT ALL PRIVILEGES ON kopma_123.* 
TO 'mhs_123'@'localhost';
-- Verifikasi lingkungan
-- MariaDB: 10.4.32
-- phpMyAdmin: 5.2.1