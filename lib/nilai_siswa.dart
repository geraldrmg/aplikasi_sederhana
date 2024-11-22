import 'package:flutter/material.dart';

void main() {
  runApp(NilaiSiswa());
}

class NilaiSiswa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: NilaiKategoriPage(),
    );
  }
}

class NilaiKategoriPage extends StatefulWidget {
  @override
  _NilaiKategoriPageState createState() => _NilaiKategoriPageState();
}

class _NilaiKategoriPageState extends State<NilaiKategoriPage> {
  final TextEditingController _controller = TextEditingController();
  String? _kategori;
  String? _errorMessage;

  void _hitungKategori() {
    setState(() {
      final input = _controller.text;
      final nilai = int.tryParse(input);

      if (nilai == null || nilai < 0 || nilai > 100) {
        _kategori = null;
        _errorMessage = 'Masukkan nilai valid (0-100).';
      } else {
        _errorMessage = null;
        if (nilai >= 85) {
          _kategori = 'A';
        } else if (nilai >= 70) {
          _kategori = 'B';
        } else if (nilai >= 55) {
          _kategori = 'C';
        } else {
          _kategori = 'D';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kategori Nilai Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan nilai siswa',
                border: OutlineInputBorder(),
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitungKategori,
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            if (_kategori != null)
              Text(
                'Kategori: $_kategori',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
