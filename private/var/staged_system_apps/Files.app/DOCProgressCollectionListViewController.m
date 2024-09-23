@implementation DOCProgressCollectionListViewController

- (void)viewDidLoad
{
  _TtC5Files39DOCProgressCollectionListViewController *v2;

  v2 = self;
  sub_10044A08C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files39DOCProgressCollectionListViewController *v4;

  v4 = self;
  sub_10044A698(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files39DOCProgressCollectionListViewController *v4;

  v4 = self;
  sub_10044A8EC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController(0);
  v4 = (char *)v7.receiver;
  -[DOCViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_source + 8];
  ObjectType = swift_getObjectType(*(_QWORD *)&v4[OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_source]);
  (*(void (**)(char *, _QWORD, _QWORD, uint64_t, uint64_t))(v5 + 16))(v4, 0, 0, ObjectType, v5);

}

- (CGSize)preferredContentSize
{
  _TtC5Files39DOCProgressCollectionListViewController *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = sub_100449F8C();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController(0);
  v6 = v8.receiver;
  -[DOCProgressCollectionListViewController setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
  v7 = sub_100449F8C();
  objc_msgSend(v7, "setEditing:", v5, v8.receiver, v8.super_class);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (_TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView)primaryScrollView
{
  _TtC5Files39DOCProgressCollectionListViewController *v2;
  id v3;

  v2 = self;

  v3 = sub_100449F8C();
  return (_TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView *)v3;
}

- (_TtC5Files39DOCProgressCollectionListViewController)init
{
  _TtC5Files39DOCProgressCollectionListViewController *result;

  result = (_TtC5Files39DOCProgressCollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionListViewController", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_source));
  v3 = (char *)self + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_cancelAccessoryDisplayedState;
  v4 = type metadata accessor for UICellAccessory.DisplayedState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_collectionViewTopConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_reloadGuardian));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files39DOCProgressCollectionListViewController_diffable));
}

@end
