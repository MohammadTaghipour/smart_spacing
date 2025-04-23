import 'package:flutter/material.dart';
import 'spacing_constants.dart';
import 'spacing_theme.dart';

/// A utility class that provides methods for adding spacing between widgets
/// in a Column or Row.
class SmartSpacing {
  /// Adds spacing between widgets in a list
  /// 
  /// [widgets] - The list of widgets to add spacing between
  /// [vertical] - The vertical spacing to add (for Column)
  /// [horizontal] - The horizontal spacing to add (for Row)
  /// 
  /// Returns a list of widgets with spacing widgets inserted between them
  static List<Widget> between(
    List<Widget> widgets, {
    double? vertical,
    double? horizontal,
  }) {
    if (widgets.isEmpty) return [];
    if (widgets.length == 1) return widgets;

    final result = <Widget>[];
    for (int i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      
      // Add spacing after each widget except the last one
      if (i < widgets.length - 1) {
        if (vertical != null) {
          result.add(SizedBox(height: vertical));
        }
        if (horizontal != null) {
          result.add(SizedBox(width: horizontal));
        }
      }
    }
    
    return result;
  }

  /// Adds adaptive spacing between widgets in a list based on screen size
  /// 
  /// [context] - The build context used to determine screen size
  /// [widgets] - The list of widgets to add spacing between
  /// [vertical] - The base vertical spacing to add (for Column)
  /// [horizontal] - The base horizontal spacing to add (for Row)
  /// 
  /// Returns a list of widgets with adaptive spacing widgets inserted between them
  static List<Widget> adaptiveBetween(
    BuildContext context,
    List<Widget> widgets, {
    double? vertical,
    double? horizontal,
    double? smallVertical,
    double? mediumVertical,
    double? largeVertical,
    double? smallHorizontal,
    double? mediumHorizontal,
    double? largeHorizontal,
  }) {
    if (widgets.isEmpty) return [];
    if (widgets.length == 1) return widgets;

    final result = <Widget>[];
    for (int i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      
      // Add spacing after each widget except the last one
      if (i < widgets.length - 1) {
        if (vertical != null) {
          result.add(SizedBox(
            height: Spacing.adaptive(
              context, 
              vertical,
              small: smallVertical,
              medium: mediumVertical,
              large: largeVertical,
            ),
          ));
        }
        if (horizontal != null) {
          result.add(SizedBox(
            width: Spacing.adaptive(
              context, 
              horizontal,
              small: smallHorizontal,
              medium: mediumHorizontal,
              large: largeHorizontal,
            ),
          ));
        }
      }
    }
    
    return result;
  }

  /// Adds themed spacing between widgets in a list
  /// 
  /// [context] - The build context used to access the theme
  /// [widgets] - The list of widgets to add spacing between
  /// [size] - The size of spacing to use from the theme (xs, sm, md, lg, xl)
  /// [isVertical] - Whether to add vertical spacing (true) or horizontal spacing (false)
  /// 
  /// Returns a list of widgets with themed spacing widgets inserted between them
  static List<Widget> themedBetween(
    BuildContext context,
    List<Widget> widgets, {
    required SpacingSize size,
    required bool isVertical,
  }) {
    if (widgets.isEmpty) return [];
    if (widgets.length == 1) return widgets;

    final spacingTheme = SpacingTheme.of(context);
    final spacingValue = spacingTheme.getValue(size);
    
    return between(
      widgets,
      vertical: isVertical ? spacingValue : null,
      horizontal: !isVertical ? spacingValue : null,
    );
  }
}

/// Extension methods on List<Widget> for easier spacing
extension SmartSpacingExtension on List<Widget> {
  /// Adds spacing between widgets in this list
  List<Widget> withSpacing({
    double? vertical,
    double? horizontal,
  }) {
    return SmartSpacing.between(
      this,
      vertical: vertical,
      horizontal: horizontal,
    );
  }

  /// Adds adaptive spacing between widgets in this list
  List<Widget> withAdaptiveSpacing(
    BuildContext context, {
    double? vertical,
    double? horizontal,
    double? smallVertical,
    double? mediumVertical,
    double? largeVertical,
    double? smallHorizontal,
    double? mediumHorizontal,
    double? largeHorizontal,
  }) {
    return SmartSpacing.adaptiveBetween(
      context,
      this,
      vertical: vertical,
      horizontal: horizontal,
      smallVertical: smallVertical,
      mediumVertical: mediumVertical,
      largeVertical: largeVertical,
      smallHorizontal: smallHorizontal,
      mediumHorizontal: mediumHorizontal,
      largeHorizontal: largeHorizontal,
    );
  }

  /// Adds themed spacing between widgets in this list
  List<Widget> withThemedSpacing(
    BuildContext context, {
    required SpacingSize size,
    required bool isVertical,
  }) {
    return SmartSpacing.themedBetween(
      context,
      this,
      size: size,
      isVertical: isVertical,
    );
  }
}