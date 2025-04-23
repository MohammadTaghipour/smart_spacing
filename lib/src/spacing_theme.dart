import 'package:flutter/material.dart';
import 'spacing_constants.dart';

/// Enum representing the available spacing sizes
enum SpacingSize {
  /// Extra small spacing
  xs,
  
  /// Small spacing
  sm,
  
  /// Medium spacing
  md,
  
  /// Large spacing
  lg,
  
  /// Extra large spacing
  xl,
  
  /// Extra extra large spacing
  xxl,
}

/// Theme class for customizing spacing values app-wide
class SpacingTheme extends InheritedWidget {
  /// The spacing values for different sizes
  final Map<SpacingSize, double> values;

  /// Creates a spacing theme with custom spacing values
  const SpacingTheme({
    super.key,
    required super.child,
    required this.values,
  });

  /// Default spacing values
  static Map<SpacingSize, double> defaultValues = {
    SpacingSize.xs: Spacing.xs,
    SpacingSize.sm: Spacing.sm,
    SpacingSize.md: Spacing.md,
    SpacingSize.lg: Spacing.lg,
    SpacingSize.xl: Spacing.xl,
    SpacingSize.xxl: Spacing.xxl,
  };

  /// Get the spacing theme from the context
  static SpacingTheme of(BuildContext context) {
    final SpacingTheme? result = context.dependOnInheritedWidgetOfExactType<SpacingTheme>();
    if (result == null) {
      // If no theme is found, create a default one
      return SpacingTheme(
        values: defaultValues,
        child: Container(), // This won't be used as we're just returning the theme
      );
    }
    return result;
  }

  /// Get a spacing value for a specific size
  double getValue(SpacingSize size) {
    return values[size] ?? defaultValues[size]!;
  }

  @override
  bool updateShouldNotify(SpacingTheme oldWidget) {
    return values != oldWidget.values;
  }
}

/// Extension on BuildContext for easier access to spacing values
extension SpacingContextExtension on BuildContext {
  /// Access spacing values through context
  _SpacingContextValues get spacing => _SpacingContextValues(this);
}

/// Helper class for accessing spacing values through context
class _SpacingContextValues {
  final BuildContext _context;

  _SpacingContextValues(this._context);

  /// Extra small spacing from theme
  double get xs => SpacingTheme.of(_context).getValue(SpacingSize.xs);

  /// Small spacing from theme
  double get sm => SpacingTheme.of(_context).getValue(SpacingSize.sm);

  /// Medium spacing from theme
  double get md => SpacingTheme.of(_context).getValue(SpacingSize.md);

  /// Large spacing from theme
  double get lg => SpacingTheme.of(_context).getValue(SpacingSize.lg);

  /// Extra large spacing from theme
  double get xl => SpacingTheme.of(_context).getValue(SpacingSize.xl);

  /// Extra extra large spacing from theme
  double get xxl => SpacingTheme.of(_context).getValue(SpacingSize.xxl);

  /// Get adaptive spacing based on screen size
  double adaptive(
    double baseValue, {
    double? small,
    double? medium,
    double? large,
  }) {
    return Spacing.adaptive(
      _context, 
      baseValue, 
      small: small, 
      medium: medium, 
      large: large,
    );
  }

  /// Create a vertical space with the specified size from theme
  SizedBox vSpace(SpacingSize size) {
    return SizedBox(height: SpacingTheme.of(_context).getValue(size));
  }

  /// Create a horizontal space with the specified size from theme
  SizedBox hSpace(SpacingSize size) {
    return SizedBox(width: SpacingTheme.of(_context).getValue(size));
  }
}