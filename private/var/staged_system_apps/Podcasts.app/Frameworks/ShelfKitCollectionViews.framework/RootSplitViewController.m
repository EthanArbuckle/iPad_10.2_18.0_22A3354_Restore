@implementation RootSplitViewController

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews23RootSplitViewController *v2;

  v2 = self;
  sub_15926C();

}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1632C8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews23RootSplitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_15A820(a3);

}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews23RootSplitViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews23RootSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.RootSplitViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithStyle:(int64_t)a3
{
  _TtC23ShelfKitCollectionViews23RootSplitViewController *result;

  result = (_TtC23ShelfKitCollectionViews23RootSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.RootSplitViewController", 47, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_menuController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_rootTabBarController));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_searchSuggestionsController, &qword_3D8CC8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_destinations));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_actionRunner));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_flowController, &qword_3D31A0);
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController__interfaceMode;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D8C98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController____lazy_storage___loadingViewController));
}

@end
