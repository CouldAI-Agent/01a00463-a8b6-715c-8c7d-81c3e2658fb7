import 'package:flutter/material.dart';

void main() {
  runApp(const BrownieRecipeApp());
}

class BrownieRecipeApp extends StatelessWidget {
  const BrownieRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brownie Recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RecipeScreen(),
      },
    );
  }
}

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fudgy Brownie Recipe'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: isDesktop
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: IngredientsList()),
                  VerticalDivider(width: 1),
                  Expanded(flex: 2, child: InstructionsList()),
                ],
              )
            : ListView(
                children: const [
                  IngredientsList(),
                  Divider(),
                  InstructionsList(),
                ],
              ),
      ),
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      '1/2 cup (115g) unsalted butter, melted',
      '1 tablespoon cooking oil',
      '1 1/8 cup (225g) superfine sugar',
      '2 large eggs',
      '2 teaspoons vanilla extract',
      '1/2 cup (65g) all-purpose flour',
      '1/2 cup (50g) unsweetened cocoa powder',
      '1/4 teaspoon salt',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ...ingredients.map((ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_box_outline_blank, size: 20),
                    const SizedBox(width: 8),
                    Expanded(child: Text(ingredient)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class InstructionsList extends StatelessWidget {
  const InstructionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final instructions = [
      'Preheat oven to 350°F (175°C).',
      'Lightly grease an 8-inch square baking pan with cooking oil spray. Line with parchment paper.',
      'Combine melted butter, oil, and sugar together in a medium-sized bowl. Whisk well to combine.',
      'Add the eggs and vanilla; beat until lighter in color (another minute).',
      'Sift in flour, cocoa powder, and salt. Gently fold the dry ingredients into the wet ingredients until JUST combined (do not overmix).',
      'Pour batter into prepared pan, smoothing the top out evenly.',
      'Bake for 20-25 minutes, or until the center of the brownies in the pan no longer jiggles and is just set to the touch.',
      'Remove and allow to cool to room temperature before slicing.',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instructions',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ...instructions.asMap().entries.map((entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Text('${entry.key + 1}', style: const TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(entry.value)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
