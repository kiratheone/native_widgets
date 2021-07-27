part of native_widgets;

class NativeIconButton extends StatelessWidget {
  final Icon icon, cupertinoIcon;
  final Key widgetKey;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;

  NativeIconButton({
    Key key,
    @required this.icon,
    this.cupertinoIcon,
    this.onPressed,
    this.widgetKey,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      padding: padding,
      key: key,
      widgetKey: widgetKey,
      icon: icon,
      cupertinoIcon: cupertinoIcon,
      materialIcon: icon,
      onPressed: onPressed,
      color: color,
    );
  }
}
