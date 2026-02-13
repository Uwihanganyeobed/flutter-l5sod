import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
// a Reusable Drawer Widget

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Icon(Icons.home),
          ),
          SizedBox(height: 30),
          // our navigation items
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

/*what we gonna do in navigation
1. we will create a home page with /home route
2. we will create a about page with /about route
3. we will create a contact page with /contact route
4. we will create a login page with /login route
5. connect all the pages with each other using 
Navigator.pushNamed(context, '/routeName') method
*/
//===============================home screen===============================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        onTap: (value) => {
            if(value == 0){
              Navigator.pushNamed(context, '/home')
            } else if(value == 1){
              Navigator.pushNamed(context, '/about')
            } else if(value == 2){
              Navigator.pushNamed(context, '/contact')
            } else if(value == 3){
              Navigator.pushNamed(context, '/login')
            }
        },
      ),
      drawer: Sidebar(),
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(child: Text('Welcome to Home Screen')),
    );
  }
}
//===============================about screen===============================

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Screen')),
      body: Center(child: Text('Welcome to About Screen')),
    );
  }
}
//===============================contact screen===============================

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contact Screen')),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage(  'assets/item.png')),
            Image(image: NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d'))
          ],
        ),
      ),
    );
  }
}
//===============================login screen===============================

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
              child: Padding(padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.lock, size: 60,color: Colors.blue,),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                
             
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => {},
                    child: Text('SUBMIT',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  )
                ],
              ),
              
              ),
          ),
        ),
      ),
    );
  }
}
