import 'package:flutter/material.dart';

// Fungsi utama yang dijalankan pertama kali saat aplikasi dijalankan
void main() {
  runApp(const MyApp()); // Memulai aplikasi Flutter dengan widget MyApp sebagai root
}

// Definisi kelas MyApp yang merupakan subclass dari StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Metode build yang menggambarkan bagaimana widget ini harus dibangun dalam tree widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema aplikasi dengan warna utama biru
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // Widget home yang ditampilkan pertama kali
    );
  }
}

// Definisi kelas MyHomePage yang merupakan StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title; // Properti untuk menyimpan judul halaman

  // Metode createState untuk membuat state dari StatefulWidget ini
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State untuk MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Kunci global untuk form
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Kunci global untuk scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Menghubungkan scaffold dengan kunci global
      appBar: AppBar(
        title: Text(widget.title), // Menggunakan judul dari widget MyHomePage
        backgroundColor: Colors.orange, // Mengubah warna AppBar menjadi oranye
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0), // Padding untuk container
        child: Form(
          key: formKey, // Menghubungkan form dengan kunci global
          child: Column(
            children: <Widget>[
              // Field input untuk NIM
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nim', // Placeholder untuk input NIM
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Nama
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nama', // Placeholder untuk input Nama
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Program Studi
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Program Studi', // Placeholder untuk input Program Studi
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Semester
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Semester', // Placeholder untuk input Semester
                ),
                keyboardType: TextInputType.number, // Jenis keyboard angka
              ),
              const SizedBox(
                height: 20.0, // Jarak antara field input dan tombol
              ),
              // Tombol submit
              ElevatedButton(
                child: const Text('Submit'), // Teks pada tombol
                onPressed: () {}, // Fungsi yang dijalankan saat tombol ditekan
              ),
            ],
          ),
        ),
      ),
    );
  }
}
