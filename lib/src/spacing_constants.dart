import 'package:flutter/material.dart';

/// Semantic spacing constants that can be used throughout the application.
/// Provides a consistent spacing system with predefined values.
class Spacing {
  /// Extra small spacing - 4.0
  static const double xs = 4.0;

  /// Small spacing - 8.0
  static const double sm = 8.0;

  /// Medium spacing - 16.0
  static const double md = 16.0;

  /// Large spacing - 24.0
  static const double lg = 24.0;

  /// Extra large spacing - 32.0
  static const double xl = 32.0;

  /// Extra extra large spacing - 48.0
  static const double xxl = 48.0;

  /// Returns a spacing value that adapts based on the screen size
  /// [baseValue] is the default spacing value
  /// [context] is used to determine the screen size
  static double adaptive(
    BuildContext context, 
    double baseValue, {
    double? small,
    double? medium,
    double? large,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Breakpoints for different screen sizes
    const smallScreenBreakpoint = 600.0;
    const mediumScreenBreakpoint = 1200.0;
    
    if (screenWidth < smallScreenBreakpoint) {
      return small ?? baseValue * 0.75; // Smaller spacing for small screens
    } else if (screenWidth < mediumScreenBreakpoint) {
      return medium ?? baseValue; // Default spacing for medium screens
    } else {
      return large ?? baseValue * 1.25; // Larger spacing for large screens
    }
  }
}

/// Vertical spacer widgets for quick spacing in Column layouts
class VSpace {
  /// Extra small vertical space - 4.0
  static SizedBox xs() => const SizedBox(height: Spacing.xs);

  /// Small vertical space - 8.0
  static SizedBox sm() => const SizedBox(height: Spacing.sm);

  /// Medium vertical space - 16.0
  static SizedBox md() => const SizedBox(height: Spacing.md);

  /// Large vertical space - 24.0
  static SizedBox lg() => const SizedBox(height: Spacing.lg);

  /// Extra large vertical space - 32.0
  static SizedBox xl() => const SizedBox(height: Spacing.xl);

  /// Extra extra large vertical space - 48.0
  static SizedBox xxl() => const SizedBox(height: Spacing.xxl);

  /// Custom vertical space with the specified height
  static SizedBox custom(double height) => SizedBox(height: height);

  /// Adaptive vertical space that adjusts based on screen size
  static SizedBox adaptive(BuildContext context, double baseHeight, {
    double? small,
    double? medium,
    double? large,
  }) => SizedBox(
    height: Spacing.adaptive(
      context, 
      baseHeight, 
      small: small, 
      medium: medium, 
      large: large,
    ),
  );
}

/// Horizontal spacer widgets for quick spacing in Row layouts
class HSpace {
  /// Extra small horizontal space - 4.0
  static SizedBox xs() => const SizedBox(width: Spacing.xs);

  /// Small horizontal space - 8.0
  static SizedBox sm() => const SizedBox(width: Spacing.sm);

  /// Medium horizontal space - 16.0
  static SizedBox md() => const SizedBox(width: Spacing.md);

  /// Large horizontal space - 24.0
  static SizedBox lg() => const SizedBox(width: Spacing.lg);

  /// Extra large horizontal space - 32.0
  static SizedBox xl() => const SizedBox(width: Spacing.xl);

  /// Extra extra large horizontal space - 48.0
  static SizedBox xxl() => const SizedBox(width: Spacing.xxl);

  /// Custom horizontal space with the specified width
  static SizedBox custom(double width) => SizedBox(width: width);

  /// Adaptive horizontal space that adjusts based on screen size
  static SizedBox adaptive(BuildContext context, double baseWidth, {
    double? small,
    double? medium,
    double? large,
  }) => SizedBox(
    width: Spacing.adaptive(
      context, 
      baseWidth, 
      small: small, 
      medium: medium, 
      large: large,
    ),
  );
}