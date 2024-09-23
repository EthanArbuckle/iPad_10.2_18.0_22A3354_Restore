@implementation MiniPlayerHostViewController

- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22368C();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[MiniPlayerHostViewController viewDidLoad](&v3, "viewDidLoad");
  sub_222864();

}

- (void)viewDidLayoutSubviews
{
  _TtC23ShelfKitCollectionViews28MiniPlayerHostViewController *v2;

  v2 = self;
  MiniPlayerHostViewController.viewDidLayoutSubviews()();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_contentViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_contentViewController, v4, 0, 0);
  return (UIViewController *)*v2;
}

- (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews28MiniPlayerHostViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews28MiniPlayerHostViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.MiniPlayerHostViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28MiniPlayerHostViewController_contentViewController));
}

@end
