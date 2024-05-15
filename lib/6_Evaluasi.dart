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
      title: 'Form Validation Demo', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.orange, // Tema aplikasi dengan warna oranye
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Warna tombol oranye
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Radius 5 untuk tombol
            ),
          ),
        ),
      ),
      home: const MyHomePage(
          title:
              'Form Validation'), // Widget home yang ditampilkan pertama kali
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
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Kunci global untuk form
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? role; // Untuk menyimpan pilihan role

  // Fungsi untuk memvalidasi input form
  void validateInput() {
    FormState? form = formKey.currentState; // Mendapatkan state form saat ini
    const snackBar = SnackBar(
      content: Text(
          'Semua data sudah tervalidasi'), // Pesan Snackbar untuk validasi berhasil
    );
    if (form!.validate()) {
      // Jika form valid
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); // Menampilkan Snackbar jika validasi berhasil
      showData(); // Memanggil showData untuk menampilkan data dalam dialog
    }
  }

  // Fungsi untuk menampilkan data dalam AlertDialog
  void showData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              'Username: ${usernameController.text} \nEmail: ${emailController.text}\nNomor HP: ${phoneController.text}\nPassword: ${passwordController.text}\nRole: ${role == '0' ? 'User' : 'Admin'}'),
        );
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Menggunakan judul dari widget MyHomePage
        backgroundColor: Colors.orange, // Mengubah warna AppBar menjadi oranye
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0), // Padding untuk container
        child: Form(
          key: formKey, // Menghubungkan form dengan kunci global
          child: ListView(
            children: <Widget>[
              // Field input untuk Username
              TextFormField(
                controller:
                    usernameController, // Menghubungkan controller dengan field Username
                decoration: const InputDecoration(
                  hintText: 'Username', // Placeholder untuk input Username
                  labelText: 'Username', // Label untuk input Username
                  icon: Icon(Icons.person), // Ikon untuk input Username
                  border: OutlineInputBorder(), // Border untuk input Username
                ),
                keyboardType: TextInputType.text, // Jenis keyboard teks
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Username tidak boleh kosong'; // Pesan error jika Username kosong
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Username harus terdiri dari 4 hingga 25 karakter'; // Pesan error jika panjang Username tidak sesuai
                  }
                  if (RegExp(r'^[0-9]').hasMatch(value)) {
                    return 'Username tidak boleh mengandung angka'; // Pesan error jika Username mengandung angka
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Jarak antara field input

              // Field input untuk Email
              TextFormField(
                controller:
                    emailController, // Menghubungkan controller dengan field Email
                decoration: const InputDecoration(
                  hintText: 'Email', // Placeholder untuk input Email
                  labelText: 'Email', // Label untuk input Email
                  icon: Icon(Icons.email), // Ikon untuk input Email
                  border: OutlineInputBorder(), // Border untuk input Email
                ),
                keyboardType:
                    TextInputType.emailAddress, // Jenis keyboard email
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong'; // Pesan error jika Email kosong
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Email harus terdiri dari 4 hingga 25 karakter'; // Pesan error jika panjang Email tidak sesuai
                  }
                  if (!value.contains('@')) {
                    return 'Email harus mengandung @'; // Pesan error jika Email tidak mengandung '@'
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Jarak antara field input

              // Field input untuk Nomor HP
              TextFormField(
                controller:
                    phoneController, // Menghubungkan controller dengan field Nomor HP
                decoration: const InputDecoration(
                  hintText: 'Nomor HP', // Placeholder untuk input Nomor HP
                  labelText: 'Nomor HP', // Label untuk input Nomor HP
                  icon: Icon(Icons.phone), // Ikon untuk input Nomor HP
                  border: OutlineInputBorder(), // Border untuk input Nomor HP
                ),
                keyboardType: TextInputType.phone, // Jenis keyboard telepon
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nomor HP tidak boleh kosong'; // Pesan error jika Nomor HP kosong
                  }
                  if (value.length < 10 || value.length > 12) {
                    return 'Nomor HP harus terdiri dari 10 hingga 12 karakter'; // Pesan error jika panjang Nomor HP tidak sesuai
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Nomor HP harus berupa angka'; // Pesan error jika Nomor HP tidak berupa angka
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Jarak antara field input

              // Field input untuk Password
              TextFormField(
                controller:
                    passwordController, // Menghubungkan controller dengan field Password
                decoration: const InputDecoration(
                  hintText: 'Password', // Placeholder untuk input Password
                  labelText: 'Password', // Label untuk input Password
                  icon: Icon(Icons.lock), // Ikon untuk input Password
                  border: OutlineInputBorder(), // Border untuk input Password
                ),
                obscureText: true, // Mengaktifkan mode teks tersembunyi
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password tidak boleh kosong'; // Pesan error jika Password kosong
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Password harus terdiri dari 4 hingga 25 karakter'; // Pesan error jika panjang Password tidak sesuai
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Jarak antara field input

              // Field input untuk Konfirmasi Password
              TextFormField(
                controller:
                    confirmPasswordController, // Menghubungkan controller dengan field Konfirmasi Password
                decoration: const InputDecoration(
                  hintText:
                      'Konfirmasi Password', // Placeholder untuk input Konfirmasi Password
                  labelText:
                      'Konfirmasi Password', // Label untuk input Konfirmasi Password
                  icon: Icon(Icons
                      .lock_outline), // Ikon untuk input Konfirmasi Password
                  border:
                      OutlineInputBorder(), // Border untuk input Konfirmasi Password
                ),
                obscureText: true, // Mengaktifkan mode teks tersembunyi
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi Password tidak boleh kosong'; // Pesan error jika Konfirmasi Password kosong
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Konfirmasi Password harus terdiri dari 4 hingga 25 karakter'; // Pesan error jika panjang Konfirmasi Password tidak sesuai
                  }
                  if (value != passwordController.text) {
                    return 'Konfirmasi Password harus sama dengan Password'; // Pesan error jika Konfirmasi Password tidak sama dengan Password
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Jarak antara field input

              // Field input untuk Role
              DropdownButtonFormField<String>(
                value: role,
                decoration: const InputDecoration(
                  labelText: 'Role', // Label untuk input Role
                  icon: Icon(Icons.account_box), // Ikon untuk input Role
                  border: OutlineInputBorder(), // Border untuk input Role
                ),
                items: const [
                  DropdownMenuItem(
                      value: '0', child: Text('User')), // Pilihan User
                  DropdownMenuItem(
                      value: '1', child: Text('Admin')), // Pilihan Admin
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    role = newValue; // Mengubah nilai role berdasarkan pilihan
                  });
                },
                validator: (String? value) {
                  if (value == null) {
                    return 'Role tidak boleh kosong'; // Pesan error jika Role kosong
                  }
                  return null;
                },
              ),
              const SizedBox(
                  height: 20.0), // Jarak antara field input dan tombol

              // Baris tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Submit'), // Teks pada tombol
                    onPressed:
                        validateInput, // Memanggil fungsi validasi saat tombol ditekan
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
