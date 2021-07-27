part of native_widgets;

class NativeIcon extends StatelessWidget {
  final IconData iconData;
  final IconData cupertinoIcon;

  NativeIcon(this.iconData, {Key key, this.cupertinoIcon});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      key: key,
      material : (_,__) => Icon(cupertinoIcon ?? iconData),
      cupertino: (_,__) => Icon(iconData),
    );
  }
}
