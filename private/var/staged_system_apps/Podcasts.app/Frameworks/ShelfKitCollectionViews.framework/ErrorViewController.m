@implementation ErrorViewController

- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews19ErrorViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ErrorViewController_previouslySelectedTab;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews19ErrorViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ErrorViewController.swift", 49, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC23ShelfKitCollectionViews19ErrorViewController *v2;
  _TtC23ShelfKitCollectionViews19ErrorViewController *v3;
  _TtC23ShelfKitCollectionViews19ErrorViewController *v4;

  v4 = self;
  if ((-[ErrorViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
  {
    v2 = v4;
  }
  else
  {
    v3 = (_TtC23ShelfKitCollectionViews19ErrorViewController *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ErrorShieldView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    -[ErrorViewController setView:](v4, "setView:", v3);

    v2 = v3;
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC23ShelfKitCollectionViews19ErrorViewController *v2;
  id v3;
  char *v4;

  v2 = self;
  v3 = -[ErrorViewController traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (_BYTE *)&dword_0 + 1)
    return 30;
  else
    return 2;
}

- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews19ErrorViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews19ErrorViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ErrorViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ErrorViewController_reachabilityType;
  v3 = type metadata accessor for ErrorPresenter.ReachabilityType(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
