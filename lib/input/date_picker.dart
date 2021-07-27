part of native_widgets;

class NativeDatePicker extends StatelessWidget {
  NativeDatePicker({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      key: key,
      cupertino: (BuildContext context, _ ) {},
      material: (BuildContext context, _ ) {},
    );
  }
}
