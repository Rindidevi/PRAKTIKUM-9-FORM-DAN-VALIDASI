import 'package:flutter/material.dart';

// Fungsi utama yang dijalankan pertama kali saat aplikasi dijalankan
void main() {
  runApp(
      const MyApp()); // Memulai aplikasi Flutter dengan widget MyApp sebagai root
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
      home: const MyHomePage(
          title:
              'Flutter Demo Home Page'), // Widget home yang ditampilkan pertama kali
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
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Kunci global untuk form
  GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Kunci global untuk scaffold
  late FocusNode myFocusNode; // Deklarasi FocusNode
  final prodiController =
      TextEditingController(); // Deklarasi TextEditingController untuk Program Studi
  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final semesterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode(); // Inisialisasi FocusNode
    prodiController
        .addListener(printValue); // Menambahkan listener untuk prodiController
  }

  @override
  void dispose() {
    myFocusNode.dispose(); // Membersihkan FocusNode
    prodiController.dispose(); // Membersihkan prodiController
    super.dispose();
  }

  // Fungsi untuk memvalidasi input form
  void validateInput() {
    FormState? form = formKey.currentState; // Mendapatkan state form saat ini
    const snackBar = SnackBar(
      content: Text(
          'Semua data sudah tervalidasi'), // Pesan Snackbar untuk validasi berhasil
    );
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); // Menampilkan Snackbar jika validasi berhasil
    }
  }

  // Fungsi untuk mencetak nilai teks pada field Program Studi
  void printValue() {
    print("Teks pada field Program Studi: ${prodiController.text}");
  }

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
                  labelText: 'Nim', // Label untuk input NIM
                  icon: Icon(Icons.person_pin), // Ikon untuk input NIM
                  border: OutlineInputBorder(), // Border untuk input NIM
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nim tidak boleh kosong'; // Pesan error jika NIM kosong
                  }
                  return null;
                },
                autofocus:
                    true, // Field NIM akan otomatis fokus saat aplikasi dijalankan
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Nama
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nama', // Placeholder untuk input Nama
                  labelText: 'Nama', // Label untuk input Nama
                  icon: Icon(Icons.person), // Ikon untuk input Nama
                  border: OutlineInputBorder(), // Border untuk input Nama
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong'; // Pesan error jika Nama kosong
                  }
                  return null;
                },
                focusNode: myFocusNode, // Menghubungkan FocusNode ke field Nama
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Program Studi
              TextFormField(
                controller:
                    prodiController, // Menghubungkan controller dengan field Program Studi
                decoration: const InputDecoration(
                  hintText:
                      'Program Studi', // Placeholder untuk input Program Studi
                  labelText: 'Program Studi', // Label untuk input Program Studi
                  icon: Icon(Icons.dashboard), // Ikon untuk input Program Studi
                  border:
                      OutlineInputBorder(), // Border untuk input Program Studi
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong'; // Pesan error jika Program Studi kosong
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0, // Jarak antara field input
              ),
              // Field input untuk Semester
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Semester', // Placeholder untuk input Semester
                  labelText: 'Semester', // Label untuk input Semester
                  icon: Icon(
                      Icons.format_list_numbered), // Ikon untuk input Semester
                  border: OutlineInputBorder(), // Border untuk input Semester
                ),
                keyboardType: TextInputType.number, // Jenis keyboard angka
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Semester tidak boleh kosong'; // Pesan error jika Semester kosong
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0, // Jarak antara field input dan tombol
              ),
              // Baris tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Submit'), // Teks pada tombol
                    onPressed:
                        validateInput, // Memanggil fungsi validasi saat tombol ditekan
                  ),
                  Container(
                    width: 20, // Jarak antara tombol
                  ),
                  ElevatedButton(
                    child: const Text('Fokus ke Nama'), // Teks pada tombol
                    onPressed: () {
                      FocusScope.of(context).requestFocus(
                          myFocusNode); // Memindahkan fokus ke field Nama
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
