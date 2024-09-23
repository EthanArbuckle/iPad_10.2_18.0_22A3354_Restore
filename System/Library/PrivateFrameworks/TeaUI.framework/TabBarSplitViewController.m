@implementation TabBarSplitViewController

- (void)splitViewControllerDidCollapse:(id)a3
{
  UISplitViewController *v4;
  _TtC5TeaUI25TabBarSplitViewController *v5;

  v4 = (UISplitViewController *)a3;
  v5 = self;
  TabBarSplitViewController.splitViewControllerDidCollapse(_:)(v4);

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  _TtC5TeaUI25TabBarSplitViewController *v7;

  v6 = a3;
  v7 = self;
  TabBarSplitViewController.splitViewController(_:willChangeTo:)(&v7->super, (UISplitViewControllerDisplayMode)a4);

}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v8;
  UIViewController *v9;
  UIViewController *v10;
  _TtC5TeaUI25TabBarSplitViewController *v11;

  v8 = a3;
  v9 = (UIViewController *)a4;
  v10 = (UIViewController *)a5;
  v11 = self;
  LOBYTE(self) = TabBarSplitViewController.splitViewController(_:collapseSecondary:onto:)(&v11->super, v9, v10);

  return self & 1;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC5TeaUI25TabBarSplitViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TabBarSplitViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  TabBarSplitViewController.viewDidLayoutSubviews()();

}

- (void)setViewControllers:(id)a3
{
  uint64_t v4;
  _TtC5TeaUI25TabBarSplitViewController *v5;

  sub_1B13A1BE4(0, (unint64_t *)&qword_1ED183800);
  v4 = sub_1B16B9B54();
  v5 = self;
  TabBarSplitViewController.viewControllers.setter(v4);

}

- (NSArray)viewControllers
{
  _TtC5TeaUI25TabBarSplitViewController *v2;
  void *v3;

  v2 = self;
  TabBarSplitViewController.viewControllers.getter();

  sub_1B13A1BE4(0, (unint64_t *)&qword_1ED183800);
  v3 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  _TtC5TeaUI25TabBarSplitViewController *v4;

  v4 = self;
  TabBarSplitViewController.preferredDisplayMode.setter(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI25TabBarSplitViewController *v4;

  v4 = self;
  TabBarSplitViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5TeaUI25TabBarSplitViewController *v4;

  v4 = self;
  TabBarSplitViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLoad
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  TabBarSplitViewController.viewDidLoad()();

}

- (void)loadView
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  TabBarSplitViewController.loadView()();

}

- (_TtC5TeaUI25TabBarSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  TabBarSplitViewController.init(coder:)();
}

- (_TtC5TeaUI25TabBarSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  TabBarSplitViewController.init(nibName:bundle:)();
}

- (_TtC5TeaUI25TabBarSplitViewController)initWithStyle:(int64_t)a3
{
  TabBarSplitViewController.init(style:)();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_extendedDelegate);
  OUTLINED_FUNCTION_24_6();
  v3 = OUTLINED_FUNCTION_24_6();
  OUTLINED_FUNCTION_35_12(v3, (unint64_t *)&unk_1ED17E220);
  v5 = v4;
  v6 = *(void (**)(uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v7 = OUTLINED_FUNCTION_66();
  v6(v7);
  v8 = ((uint64_t (*)(char *, uint64_t))v6)((char *)self + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_stagedModalContextCache, v5);
  v9 = (char *)self + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_modalContextCache;
  OUTLINED_FUNCTION_35_12(v8, &qword_1ED17E218);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  OUTLINED_FUNCTION_24_6();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_6();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25TabBarSplitViewController_overlayToolbar));
}

- (int64_t)preferredDisplayMode
{
  _TtC5TeaUI25TabBarSplitViewController *v2;
  id v3;

  v2 = self;
  v3 = TabBarSplitViewController.preferredDisplayMode.getter();

  return (int64_t)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI25TabBarSplitViewController *v6;
  _TtC5TeaUI25TabBarSplitViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  TabBarSplitViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC5TeaUI25TabBarSplitViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  TabBarSplitViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)didReceiveMemoryWarning
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  TabBarSplitViewController.didReceiveMemoryWarning()();

}

- (uint64_t)presentationTransitionDidEndWithNotification:
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_120_0();
  v2 = sub_1B16B7910();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  OUTLINED_FUNCTION_6_3();
  sub_1B16B78E0();
  v5 = v0;
  sub_1B14E1BF0();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
}

- (void)tabBarNavigationControllerDidPopWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5TeaUI25TabBarSplitViewController *v9;
  uint64_t v10;

  v4 = sub_1B16B7910();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B78E0();
  v9 = self;
  sub_1B14E1D4C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)splitViewControllerDidExpand:(id)a3
{
  UISplitViewController *v4;
  _TtC5TeaUI25TabBarSplitViewController *v5;

  v4 = (UISplitViewController *)a3;
  v5 = self;
  TabBarSplitViewController.splitViewControllerDidExpand(_:)(v4);

}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6;
  UIViewController *v7;
  _TtC5TeaUI25TabBarSplitViewController *v8;
  UIViewController_optional *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  TabBarSplitViewController.splitViewController(_:separateSecondaryFrom:)(v9, &v8->super, v7);
  v11 = v10;

  return v11;
}

- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5
{
  return sub_1B14E5CD8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))TabBarSplitViewController.splitViewController(_:show:sender:));
}

- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5
{
  return sub_1B14E5CD8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))TabBarSplitViewController.splitViewController(_:showDetail:sender:));
}

- (int64_t)targetDisplayModeForActionInSplitViewController:(id)a3
{
  UISplitViewController *v4;
  _TtC5TeaUI25TabBarSplitViewController *v5;
  UISplitViewControllerDisplayMode v6;

  v4 = (UISplitViewController *)a3;
  v5 = self;
  v6 = TabBarSplitViewController.targetDisplayModeForAction(in:)(v4);

  return v6;
}

- (NSArray)keyCommands
{
  _TtC5TeaUI25TabBarSplitViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TabBarSplitViewController.keyCommands.getter((uint64_t)v2);

  if (v3)
  {
    sub_1B13A1BE4(0, (unint64_t *)&qword_1ED1837A8);
    v4 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)openNewWindow
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  sub_1B14E7CAC();

}

- (void)toggleResponderPane
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  sub_1B14E7EF8((uint64_t)v2);

}

- (void)toggleSideBarVisibility
{
  _TtC5TeaUI25TabBarSplitViewController *v2;

  v2 = self;
  sub_1B14E81A4((uint64_t)v2);

}

- (int64_t)currentSplitViewFocus
{
  return TabBarSplitViewController.currentSplitViewFocus.getter();
}

- (void)toggleSplitViewFocusTo:(int64_t)a3
{
  _TtC5TeaUI25TabBarSplitViewController *v4;

  v4 = self;
  TabBarSplitViewController.toggleSplitViewFocus(to:)(a3);

}

@end
