<!DOCTYPE html>
<html>
<head>
    <title>Laundry Bersih Selalu</title>
    <style>
        body {font-family: "Times Now Roman", Arial, Helvetica, sans-serif;}
        table {border-collapse: collapse;}
        th, td {font-size: 13px; border: 1px solid #DEDEDE; padding: 3px 5px; color: #303030;}
        th {background: #CCCCCC; font-size: 12px; border-color: #B0B0B0;}
    </style>
</head>
<body>
    <center><h1>Laundry Bersih Selalu</h1></center>
    <h1>Table Pelanggan</h1>
    <table>
        <thead>
            <tr>
                <th>ID_Pelanggan</th>
                <th>Nama</th>
                <th>Alamat</th>
                <th>TGL_Lahir</th>
		<th>Nomor_Telepon</th>
		<th>Nama_Paket</th>
		<th>Durasi_Paket</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include 'koneksi.php';
            $sql = 'SELECT * FROM Pelanggan';
            $query = mysqli_query($koneksi, $sql);
            while ($row = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><?php echo $row['ID_Pelanggan'] ?></td>
                    <td><?php echo $row['Nama'] ?></td>
                    <td><?php echo $row['Alamat'] ?></td>
                    <td><?php echo $row['TGL_Lahir'] ?></td>
		     <td><?php echo $row['Nomor_Telepon'] ?></td>
		     <td><?php echo $row['Nama_Paket'] ?></td>
		     <td><?php echo $row['Durasi_Paket'] ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>

    <h2>Table Detail_Transaksi</h2>
    <table>
        <thead>
            <tr>
                <th>ID_Transaksi</th>
                <th>ID_Layanan</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT * FROM Detail_Transaksi';
            $query = mysqli_query($koneksi, $sql);
            while ($row = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><?php echo $row['ID_Transaksi'] ?></td>
                    <td><?php echo $row['ID_Layanan'] ?></td>
                    <td><?php echo $row['Jumlah'] ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>

    <h3>Table Layanan</h3>
    <table>
        <thead>
            <tr>
                <th>ID_Layanan</th>
                <th>Nama_Layanan</th>
                <th>Harga</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT * FROM Layanan';
            $query = mysqli_query($koneksi, $sql);
            while ($row = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><?php echo $row['ID_Layanan'] ?></td>
                    <td><?php echo $row['Nama_Layanan'] ?></td>
                    <td><?php echo $row['Harga'] ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>

    <h4>Table Pegawai</h4>
    <table>
        <thead>
            <tr>
                <th>ID_Pegawai</th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>No_Telpon</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT * FROM Pegawai';
            $query = mysqli_query($koneksi, $sql);
            while ($row = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><?php echo $row['ID_Pegawai'] ?></td>
                    <td><?php echo $row['Nama'] ?></td>
                    <td><?php echo $row['Jabatan'] ?></td>
                    <td><?php echo $row['No_Telpon'] ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>

    <h5>Table Transaksi</h5>
    <table>
        <thead>
            <tr>
                <th>ID_Transaksi</th>
                <th>ID_Pelanggan</th>
                <th>ID_Pegawai</th>
                <th>Tgl_Transaksi</th>
                <th>Total_Biaya</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT * FROM Transaksi';
            $query = mysqli_query($koneksi, $sql);
            while ($row = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><?php echo $row['ID_Transaksi'] ?></td>
                    <td><?php echo $row['ID_Pelanggan'] ?></td>
                    <td><?php echo $row['ID_Pegawai'] ?></td>
                    <td><?php echo $row['Tgl_Transaksi'] ?></td>
                    <td><?php echo $row['Total_Biaya'] ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>
</body>
</html>
