library damp_physics;

import 'package:flutter/material.dart';

/// Disables the bouncing underscroll effect present in IOS's ClampingScrollPhysics
class NoBouncingUnderscrollPhysics extends ScrollPhysics {
  const NoBouncingUnderscrollPhysics({
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  NoBouncingUnderscrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoBouncingUnderscrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Inspired by ClampingScrollPhysics.applyBoundaryConditions
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      // Underscroll
      return value - position.pixels;
    }
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      // Overscroll

      return parent!.applyBoundaryConditions(position, value);
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      // Hit top edge
      return value - position.minScrollExtent;
    }
    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      // Hit bottom edge
      return parent!.applyBoundaryConditions(position, value);
    }
    return 0.0;
  }
}

/// Disables the bouncing overscroll effect present in IOS's ClampingScrollPhysics
class NoBouncingOverscrollPhysics extends ScrollPhysics {
  const NoBouncingOverscrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  NoBouncingOverscrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoBouncingOverscrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Inspired by ClampingScrollPhysics.applyBoundaryConditions
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      // Underscroll
      return parent!.applyBoundaryConditions(position, value);
    }
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      // Overscroll

      return value - position.pixels;
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      // Hit top edge
      return parent!.applyBoundaryConditions(position, value);
    }
    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      // Hit bottom edge
      return value - position.maxScrollExtent;
    }
    return 0.0;
  }
}
