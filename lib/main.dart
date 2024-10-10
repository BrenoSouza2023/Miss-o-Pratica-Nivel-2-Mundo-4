import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agência de Viagens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchText = '';

  void _onSearchChanged(String value) {
    setState(() {
      _searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

  
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. '
        'Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos '
        'mais amplos. Um passeio de teleférico a partir de Kandersteg, seguido '
        'por meia hora de caminhada por pastagens e floresta de pinheiros, '
        'leva você ao lago, que aquece até 20 graus Celsius no verão. As '
        'atividades desfrutadas aqui incluem remo e andar no tobogã de verão.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agência de Viagens'),
        actions: [
          
          PopupMenuButton<String>(
            onSelected: (value) {
              
              switch (value) {
                case 'Destinos':
                  
                  break;
                case 'Pacotes de Viagem':
                 
                  break;
                case 'Contato':
                 
                  break;
                case 'Sobre Nós':
                 
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Destinos', 'Pacotes de Viagem', 'Contato', 'Sobre Nós'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           
            TextField(
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Pesquisar Destinos ou Pacotes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: _searchText.isEmpty
                  ? const Center(
                      child: Text('Insira um destino ou pacote para pesquisar.'),
                    )
                  : ListView.builder(
                      itemCount: 10, 
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text('Resultado ${index + 1} para "$_searchText"'),
                          onTap: () {
                           
                          },
                        );
                      },
                    ),
            ),
            
            const SizedBox(height: 20),
            Image.asset(
              'images/lake.jpg', 
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
