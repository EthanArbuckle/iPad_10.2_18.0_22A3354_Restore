@implementation StoreCollectionViewController

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  return (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)sub_10DBEC(a3);
}

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10EDE8();
}

- (void)loadView
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;

  v2 = self;
  sub_10DD10();

}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;

  v2 = self;
  sub_10DFC4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v4;

  v4 = self;
  sub_10E624(a3, (SEL *)&selRef_viewWillAppear_, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v4;

  v4 = self;
  sub_10E1AC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v4;

  v4 = self;
  sub_10E3B0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v4;

  v4 = self;
  sub_10E624(a3, (SEL *)&selRef_viewDidDisappear_, 3);

}

- (void)viewWillLayoutSubviews
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;

  v2 = self;
  sub_10E724();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;
  id v3;
  char *v4;

  v2 = self;
  v3 = -[StoreCollectionViewController traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (_BYTE *)&dword_0 + 1)
    return 30;
  else
    return 2;
}

- (void)appEnteredWhileAppeared
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;

  v2 = self;
  sub_10E9B8();

}

- (void)appExitedWhileAppeared
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v2;

  v2 = self;
  sub_10E9F4();

}

- (void)applicationDidBecomeActive:(id)a3
{
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v4;
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v5;
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v6;
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *v7;

  v4 = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)a3;
  v7 = self;
  v5 = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)-[StoreCollectionViewController collectionView](v7, "collectionView");
  if (v5)
  {
    v6 = v5;
    -[StoreCollectionViewController selectItemAtIndexPath:animated:scrollPosition:](v5, "selectItemAtIndexPath:animated:scrollPosition:", 0, 1, 0);

    v4 = v7;
    v7 = v6;
  }

}

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews29StoreCollectionViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.StoreCollectionViewController", 53, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10ED6C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_lifecycleObserver);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_statusBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_overlayViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_navigationAccessories));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_collectionViewDelegate));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_collectionViewDataSource));
}

@end
