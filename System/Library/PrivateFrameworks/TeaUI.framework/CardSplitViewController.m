@implementation CardSplitViewController

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI23CardSplitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1B13ACFD4(a3);

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  _TtC5TeaUI23CardSplitViewController *v7;

  v6 = a3;
  v7 = self;
  CardSplitViewController.splitViewController(_:willChangeTo:)(&v7->super, (UISplitViewControllerDisplayMode)a4);

}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v8;
  UIViewController *v9;
  UIViewController *v10;
  _TtC5TeaUI23CardSplitViewController *v11;

  v8 = a3;
  v9 = (UIViewController *)a4;
  v10 = (UIViewController *)a5;
  v11 = self;
  LOBYTE(self) = CardSplitViewController.splitViewController(_:collapseSecondary:onto:)(&v11->super, v9, v10);

  return self & 1;
}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI23CardSplitViewController *v2;

  v2 = self;
  sub_1B13B1234();

}

- (void)setViewControllers:(id)a3
{
  uint64_t v4;
  _TtC5TeaUI23CardSplitViewController *v5;

  sub_1B13A1818(0, (unint64_t *)&qword_1ED183800);
  v4 = sub_1B16B9B54();
  v5 = self;
  sub_1B13C4468(v4);

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC5TeaUI23CardSplitViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B141D7CC((uint64_t)v2);

  return (UIViewController *)v3;
}

- (NSArray)viewControllers
{
  _TtC5TeaUI23CardSplitViewController *v2;
  void *v3;

  v2 = self;
  sub_1B141DAF8();

  sub_1B13A1818(0, (unint64_t *)&qword_1ED183800);
  v3 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)toggleResponderPane
{
  _TtC5TeaUI23CardSplitViewController *v2;

  v2 = self;
  sub_1B145986C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI23CardSplitViewController *v3;

  v3 = self;
  sub_1B1459AE4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5TeaUI23CardSplitViewController *v3;

  v3 = self;
  sub_1B13A3B4C();

}

- (void)viewDidLoad
{
  _TtC5TeaUI23CardSplitViewController *v2;

  v2 = self;
  sub_1B1459B98((const char **)&selRef_viewDidLoad);

}

- (void)loadView
{
  _TtC5TeaUI23CardSplitViewController *v2;

  v2 = self;
  sub_1B13AD32C();

}

- (_TtC5TeaUI23CardSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CardSplitViewController.init(coder:)();
}

- (_TtC5TeaUI23CardSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  CardSplitViewController.init(nibName:bundle:)();
}

- (_TtC5TeaUI23CardSplitViewController)initWithStyle:(int64_t)a3
{
  CardSplitViewController.init(style:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23CardSplitViewController_primaryCardContainerController));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (uint64_t)presentationTransitionDidEndWithNotification:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v2 = sub_1B16B7910();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B78E0();
  v7 = a1;
  sub_1B1522CB8();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

- (BOOL)splitViewController:(id)a3 showViewController:(id)a4 sender:(id)a5
{
  return sub_1B1523194(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))CardSplitViewController.splitViewController(_:show:sender:));
}

- (BOOL)splitViewController:(id)a3 showDetailViewController:(id)a4 sender:(id)a5
{
  return sub_1B1523194(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, void *))CardSplitViewController.splitViewController(_:showDetail:sender:));
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6;
  UIViewController *v7;
  _TtC5TeaUI23CardSplitViewController *v8;
  UIViewController_optional *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  CardSplitViewController.splitViewController(_:separateSecondaryFrom:)(v9, &v8->super, v7);
  v11 = v10;

  return v11;
}

- (NSArray)keyCommands
{
  _TtC5TeaUI23CardSplitViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = CardSplitViewController.keyCommands.getter();

  if (v3)
  {
    sub_1B13A1818(0, (unint64_t *)&qword_1ED1837A8);
    v4 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)toggleSideBarVisibility
{
  _TtC5TeaUI23CardSplitViewController *v2;

  v2 = self;
  sub_1B152517C();

}

@end
