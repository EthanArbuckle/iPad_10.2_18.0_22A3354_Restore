@implementation LoadingPageViewController

- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_26D5F4();
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews25LoadingPageViewController *v2;

  v2 = self;
  sub_26C244();

}

- (void)viewWillLayoutSubviews
{
  _TtC23ShelfKitCollectionViews25LoadingPageViewController *v2;

  v2 = self;
  sub_26C38C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC23ShelfKitCollectionViews25LoadingPageViewController *v2;
  id v3;
  char *v4;

  v2 = self;
  v3 = -[LoadingPageViewController traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (_BYTE *)&dword_0 + 1)
    return 30;
  else
    return 2;
}

- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews25LoadingPageViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.LoadingPageViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_overlayViewController));
}

@end
