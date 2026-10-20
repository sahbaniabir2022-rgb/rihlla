
import 'package:flutter/material.dart';

import '../data/destinations.dart';
import '../models/destination.dart';
import '../widgets/home_header.dart';
import '../widgets/search_box.dart';
import '../widgets/hero_banner.dart';
import '../widgets/destination_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categorie = 'Tout';

  // État du menu de navigation
  int _onglet = 0;

  List<Destination> get _filtrees {
    if (_categorie == 'Tout') {
      return destinations;
    }

    return destinations
        .where((d) => d.categorie == _categorie)
        .toList();
  }

  // Contenu de la page d'accueil
  Widget _construireAccueil() {
    const categories = [
      'Tout',
      'Désert',
      'Plage',
      'Culture',
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const HomeHeader(prenom: 'Abir'),

        const SizedBox(height: 20),

        const SearchBox(),

        const SizedBox(height: 24),

        HeroBanner(
          destination: destinations.first,
        ),

        const SizedBox(height: 24),

        const SectionTitle(title: 'Catégories'),

        const SizedBox(height: 12),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((c) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(c),
                  selected: _categorie == c,
                  onSelected: (selected) {
                    setState(() {
                      _categorie = c;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitle(
          title: 'Populaires',
          action: 'Voir tout',
        ),

        const SizedBox(height: 12),

        if (_filtrees.isEmpty)
          const Center(
            child: Text(
              'Aucune destination dans cette catégorie.',
            ),
          )
        else
          for (final d in _filtrees)
            DestinationCard(
              key: ValueKey(d.nom),
              destination: d,
            ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _onglet == 0
            ? _construireAccueil()
            : const Center(
                child: Text('Bientôt disponible'),
              ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _onglet,
        onDestinationSelected: (index) {
          setState(() {
            _onglet = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explorer',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
