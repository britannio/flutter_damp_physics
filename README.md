# damp_physics

A Flutter package containing two `ScrollPhysics` classes, `NoBouncingUnderscrollPhysics` and `NoBouncingOverscrollPhysics`.

By default, Flutter's scrollable widgets use `BouncingScrollPhysics` on Cupertino themed platforms, e.g., IOS. If the bouncing behaviour observed when underscrolling at the start of a `Scrollable` or overscrolling at the end of a `Scrollable` then the provided scroll physics classes can be used.


## Example usage:
```dart
@override
  Widget build(BuildContext context) {
    return ListView(
      physics: NoBouncingOverscrollPhysics(
        parent: NoBouncingUnderscrollPhysics(),
      ),
      children: [
        for (int i = 0; i > 10; i++)
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.primaries[i],
          )
      ],
    );
  }
```
