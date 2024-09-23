@implementation SharePlayTogetherSessionManagementViewController

- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1007C4614();
}

- (void)viewDidLoad
{
  _TtC5Music48SharePlayTogetherSessionManagementViewController *v2;

  v2 = self;
  sub_1007B4030();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC5Music48SharePlayTogetherSessionManagementViewController *v4;

  v4 = self;
  sub_1007B7ABC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SharePlayTogetherSessionManagementViewController(0);
  v4 = v5.receiver;
  -[SharePlayTogetherSessionManagementViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_viewDidAppearOnce] = 1;
  sub_1007B7F40();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music48SharePlayTogetherSessionManagementViewController *v2;

  v2 = self;
  sub_1007B7CF8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SharePlayTogetherSessionManagementViewController(0);
  v4 = (char *)v8.receiver;
  -[SharePlayTogetherSessionManagementViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v5 = *(void (**)(__n128))&v4[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss + 8];
    v7 = swift_retain();
    v5(v7);
    sub_10004BA30((uint64_t)v5, v6);
  }

}

- (_TtC5Music48SharePlayTogetherSessionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music48SharePlayTogetherSessionManagementViewController *result;

  v4 = a4;
  result = (_TtC5Music48SharePlayTogetherSessionManagementViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.SharePlayTogetherSessionManagementViewController", 54, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_session));
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss), *(_QWORD *)&self->session[OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_onDismiss]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_dataSource));
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_lastPendingParticipantScrolledTo, (uint64_t *)&unk_1011C8E40);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music48SharePlayTogetherSessionManagementViewController_sessionAssertion));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music48SharePlayTogetherSessionManagementViewController *v12;
  id v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = -[SharePlayTogetherSessionManagementViewController traitCollection](v12, "traitCollection");
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 == (id)3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music48SharePlayTogetherSessionManagementViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1007B9724(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  sub_1007C473C((uint64_t)v10);
  LOBYTE(a1) = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

@end
