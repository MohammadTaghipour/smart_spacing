import 'package:flutter/material.dart';
import 'package:smart_spacing/smart_spacing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SpacingTheme(
      values: {
        SpacingSize.xs: 4.0,
        SpacingSize.sm: 8.0,
        SpacingSize.md: 16.0,
        SpacingSize.lg: 24.0,
        SpacingSize.xl: 32.0,
        SpacingSize.xxl: 48.0,
      },
      child: MaterialApp(
        title: 'Smart Spacing Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Spacing Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: SmartSpacing.between([
            _buildSection(
              'Semantic Spacing Constants',
              _buildSpacingConstants(),
            ),
            _buildSection(
              'Vertical Spacers',
              _buildVerticalSpacers(),
            ),
            _buildSection(
              'Horizontal Spacers',
              _buildHorizontalSpacers(),
            ),
            _buildSection(
              'Smart Spacing Between Widgets',
              _buildSmartSpacingExample(),
            ),
            _buildSection(
              'Adaptive Spacing',
              _buildAdaptiveSpacingExample(context),
            ),
            _buildSection(
              'Context Extensions',
              _buildContextExtensionsExample(context),
            ),
          ], vertical: Spacing.lg),
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        VSpace.md(),
        content,
      ],
    );
  }

  Widget _buildSpacingConstants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpacingItem('Spacing.xs', Spacing.xs),
        _buildSpacingItem('Spacing.sm', Spacing.sm),
        _buildSpacingItem('Spacing.md', Spacing.md),
        _buildSpacingItem('Spacing.lg', Spacing.lg),
        _buildSpacingItem('Spacing.xl', Spacing.xl),
        _buildSpacingItem('Spacing.xxl', Spacing.xxl),
      ],
    );
  }

  Widget _buildSpacingItem(String name, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(name),
          HSpace.md(),
          Container(
            width: value,
            height: 20,
            color: Colors.deepPurple.withOpacity(0.3),
          ),
          HSpace.md(),
          Text('${value.toStringAsFixed(1)} pixels'),
        ],
      ),
    );
  }

  Widget _buildVerticalSpacers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('VSpace.xs()'),
        VSpace.xs(),
        Container(height: 1, color: Colors.grey),

        const Text('VSpace.sm()'),
        VSpace.sm(),
        Container(height: 1, color: Colors.grey),

        const Text('VSpace.md()'),
        VSpace.md(),
        Container(height: 1, color: Colors.grey),

        const Text('VSpace.lg()'),
        VSpace.lg(),
        Container(height: 1, color: Colors.grey),

        const Text('VSpace.xl()'),
        VSpace.xl(),
        Container(height: 1, color: Colors.grey),
      ],
    );
  }

  Widget _buildHorizontalSpacers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text('HSpace.xs()'),
          HSpace.xs(),
          Container(width: 1, height: 40, color: Colors.grey),

          const Text('HSpace.sm()'),
          HSpace.sm(),
          Container(width: 1, height: 40, color: Colors.grey),

          const Text('HSpace.md()'),
          HSpace.md(),
          Container(width: 1, height: 40, color: Colors.grey),

          const Text('HSpace.lg()'),
          HSpace.lg(),
          Container(width: 1, height: 40, color: Colors.grey),

          const Text('HSpace.xl()'),
          HSpace.xl(),
          Container(width: 1, height: 40, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSmartSpacingExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Column with SmartSpacing.between:'),
        VSpace.md(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: SmartSpacing.between([
              _coloredBox(Colors.red),
              _coloredBox(Colors.green),
              _coloredBox(Colors.blue),
            ], vertical: Spacing.md),
          ),
        ),
        VSpace.md(),
        const Text('Row with SmartSpacing.between:'),
        VSpace.md(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: SmartSpacing.between([
              _coloredBox(Colors.red, size: 50),
              _coloredBox(Colors.green, size: 50),
              _coloredBox(Colors.blue, size: 50),
            ], horizontal: Spacing.md),
          ),
        ),
        VSpace.md(),
        const Text('Using List extension:'),
        VSpace.md(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _coloredBox(Colors.red),
              _coloredBox(Colors.green),
              _coloredBox(Colors.blue),
            ].withSpacing(vertical: Spacing.md),
          ),
        ),
      ],
    );
  }

  Widget _buildAdaptiveSpacingExample(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current screen width: ${MediaQuery.of(context).size.width.toStringAsFixed(1)}px',
        ),
        VSpace.md(),
        const Text('Adaptive spacing adjusts based on screen size:'),
        VSpace.md(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: SmartSpacing.adaptiveBetween(
              context,
              [
                _coloredBox(Colors.red),
                _coloredBox(Colors.green),
                _coloredBox(Colors.blue),
              ],
              vertical: Spacing.md,
              smallVertical: Spacing.sm,
              largeVertical: Spacing.lg,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContextExtensionsExample(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Using context.spacing extensions:'),
        VSpace.md(),
        Container(
          padding: EdgeInsets.all(context.spacing.md),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('context.spacing.sm = ${context.spacing.sm}'),
              SizedBox(height: context.spacing.sm),
              Text('context.spacing.md = ${context.spacing.md}'),
              SizedBox(height: context.spacing.md),
              Text('context.spacing.lg = ${context.spacing.lg}'),
              context.spacing.vSpace(SpacingSize.md),
              const Text('Using context.spacing.vSpace(SpacingSize.md)'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _coloredBox(Color color, {double size = 80}) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Center(
        child: Text(
          // Safely extract the color code or use a fallback
          _safeColorString(color),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _safeColorString(Color color) {
    try {
      final colorString = color.toString();
      if (colorString.contains('(0x') && colorString.contains(')')) {
        return colorString.split('(0x')[1].split(')')[0];
      } else {
        // Fallback for colors that don't match the expected format
        return colorString;
      }
    } catch (e) {
      // Return a safe fallback if any error occurs
      return 'Color';
    }
  }
}
