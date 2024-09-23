@implementation MetricsPageViewController

- (_TtC8ShelfKit25MetricsPageViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC8ShelfKit25MetricsPageViewController *result;

  v3 = a3;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtC8ShelfKit25MetricsPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000000030B670, "ShelfKit/MetricsPageViewController.swift", 40, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8ShelfKit25MetricsPageViewController *v2;

  v2 = self;
  MetricsPageViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8ShelfKit25MetricsPageViewController *v4;

  v4 = self;
  MetricsPageViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8ShelfKit25MetricsPageViewController *v4;

  v4 = self;
  MetricsPageViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8ShelfKit25MetricsPageViewController *v4;

  v4 = self;
  MetricsPageViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[MetricsPageViewController viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[MetricsPageViewController viewWillLayoutSubviews](&v15, "viewWillLayoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController], "view", v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "view");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC8ShelfKit25MetricsPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8ShelfKit25MetricsPageViewController *result;

  v4 = a4;
  result = (_TtC8ShelfKit25MetricsPageViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.MetricsPageViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_metricsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController));
}

@end
