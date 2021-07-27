part of native_widgets;

// Native App Bar
class NativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  // final Color foregroundColor;
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  // final List<Widget> tabs;
  // final bool showMaterial;
  // final ValueChanged<dynamic> onValueChanged;
  // final dynamic groupValue;
  final bool automaticallyImplyLeading;
  final MaterialAppBarData android;
  final CupertinoNavigationBarData ios;

  // final TabBar bottom;

  NativeAppBar({
    Key key,
    // this.foregroundColor,
    this.backgroundColor,
    this.leading,
    this.title,
    this.actions,
    // this.tabs,
    // this.showMaterial = false,
    this.preferredSize = const Size.fromHeight(56.0),
    // this.groupValue,
    // this.onValueChanged,
    this.automaticallyImplyLeading,
    this.ios,
    this.android,
  });

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    // final bool _isIos = showCupertino(showMaterial: showMaterial);
    // final Map<int, Widget> iosTabs = const <int, Widget>{};

    // if (tabs != null && tabs.isNotEmpty) {
    //   int _index = 0;
    //   for (Widget item in tabs) {
    //     iosTabs[_index] = item;
    //   }
    //   _index++;
    // }

    // if (_isIos) {
    //   return CupertinoNavigationBar(
    //     middle: tabs == null || tabs.length < 2
    //         ? title
    //         : CupertinoSegmentedControl<dynamic>(
    //             onValueChanged: onValueChanged,
    //             children: iosTabs,
    //             groupValue: groupValue,
    //           ),
    //     backgroundColor:
    //         backgroundColor == null ? Colors.transparent : backgroundColor,
    //     leading: leading,
    //     actionsForegroundColor: foregroundColor,
    //     trailing: actions == null
    //         ? null
    //         : Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: actions.map((Widget item) => item).toList(),
    //           ),
    //   );
    // }

    // return AppBar(
    //   backgroundColor: backgroundColor,
    //   key: key,
    //   title: title,
    //   actions: actions,
    //   leading: leading,
    //   bottom: tabs == null ? null : TabBar(tabs: tabs),
    // );
    return PlatformAppBar(
      key: key,
      backgroundColor: backgroundColor,
      title: title,
      trailingActions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      cupertino: (BuildContext context, _ ) => ios,
      material: (BuildContext context, _ ) => android,
    );
  }
}
