@implementation AccountViewController

- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_29A14C();
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews21AccountViewController *v2;

  v2 = self;
  sub_29876C();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC23ShelfKitCollectionViews21AccountViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_298D3C((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews21AccountViewController *v6;

  v5 = a3;
  v6 = self;
  sub_298EFC((uint64_t)a3);

}

- (void)tappedDoneButton
{
  -[AccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC23ShelfKitCollectionViews21AccountViewController *result;

  v3 = a3;
  result = (_TtC23ShelfKitCollectionViews21AccountViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.AccountViewController", 45, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_activityIndicator));
}

@end
