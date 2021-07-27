part of native_widgets;

class NativeTabScaffold extends StatelessWidget {
  final List<BottomNavigationBarItem> tabs;
  final List<NativeTabView> pages;

  NativeTabScaffold({
    Key key,
    @required this.tabs,
    this.pages,
  })  : assert(tabs.length == pages?.length ?? 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      key: key,
      cupertino: (BuildContext context, _ ) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: tabs),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return pages[index]?.child;
              },
              defaultTitle: pages[index]?.title,
            );
            ;
          },
        );
      },
      material: (BuildContext context, _ ) {
        return _BottomTabs(
          tabs: tabs,
          pages: pages,
        );
      },
    );
  }
}

class NativeTabView extends StatelessWidget {
  final Widget child;
  final String title;

  NativeTabView({
    Key key,
    @required this.child,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      key: key,
      cupertino: (BuildContext context, _ ) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return child;
          },
          defaultTitle: title,
        );
      },
      material: (BuildContext context, _ ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: child,
        );
      },
    );
  }
}

class _BottomTabs extends StatefulWidget {
  final List<BottomNavigationBarItem> tabs;
  final List<NativeTabView> pages;

  _BottomTabs({
    Key key,
    @required this.tabs,
    this.pages,
  }) : super(key: key);

  @override
  _BottomTabsState createState() {
    return new _BottomTabsState();
  }
}

class _BottomTabsState extends State<_BottomTabs> {
  int _currentIndex = 0;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget?.pages?.length ?? 0,
        child: Scaffold(
          body: widget?.pages[_currentIndex]?.child ?? Container(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              if (!_isDisposed)
                setState(() {
                  _currentIndex = index;
                });
            },
            currentIndex: _currentIndex,
            items: widget.tabs,
          ),
        ));
  }
}
