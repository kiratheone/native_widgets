part of native_widgets;

class NativeSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isSearching;
  final bool alwaysShowSearchBar;
  final String search;
  final Widget leading, title;
  final List<Widget> actions;
  final ValueChanged<String> onChanged;
  final VoidCallback onSearchPressed;
  final MaterialAppBarData android;
  final CupertinoNavigationBarData ios;
  final Color backgroundColor;

  NativeSearchAppBar({
    this.isSearching = false,
    this.onChanged,
    this.ios,
    this.android,
    this.onSearchPressed,
    this.search,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.alwaysShowSearchBar = false,
    this.preferredSize = const Size.fromHeight(56.0),
  });

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return PlatformAppBar(
        title: title,
        backgroundColor: backgroundColor,
        leading: leading,
        material: (BuildContext context, _ ) => MaterialAppBarData(
                title: MaterialSearchBar(
                  search: search,
                  onSearchChanged: onChanged,
                ),
                actions: <Widget>[
                  PlatformIconButton(
                    icon: const Icon(Icons.search),
                    cupertinoIcon: const Icon(CupertinoIcons.search),
                    onPressed: onSearchPressed,
                  ),
                ]),
        cupertino: (BuildContext context, _ ) => CupertinoNavigationBarData(
              title: CupertinoSearchWidget(
                initialValue: search,
                onChanged: onChanged,
                alwaysShowAppBar: alwaysShowSearchBar,
                onCancel: onSearchPressed,
              ),
              transitionBetweenRoutes: ios?.transitionBetweenRoutes,
              heroTag: ios?.heroTag,
            ),
      );
    }

    return PlatformAppBar(
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
      trailingActions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search',
          onPressed: onSearchPressed,
        ),
      ]..addAll(actions ?? []),
      cupertino: (BuildContext context, _ ) => ios,
      material: (BuildContext context, _ ) => android,
    );
  }
}
