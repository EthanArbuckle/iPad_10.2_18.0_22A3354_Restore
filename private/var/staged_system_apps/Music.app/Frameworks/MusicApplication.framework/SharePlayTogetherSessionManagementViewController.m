@implementation SharePlayTogetherSessionManagementViewController

- (_TtC16MusicApplication48SharePlayTogetherSessionManagementViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_A2A42C();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *v2;

  v2 = self;
  sub_A18F04();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *v4;

  v4 = self;
  sub_A1C9BC(a3);

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
  v4[OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_viewDidAppearOnce] = 1;
  sub_A1CE40();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *v2;

  v2 = self;
  sub_A1CBF8();

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
  v5 = *(void (**)(__n128))&v4[OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_onDismiss];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_onDismiss
                      + 8];
    v7 = swift_retain(v6);
    v5(v7);
    sub_5C198((uint64_t)v5, v6);
  }

}

- (_TtC16MusicApplication48SharePlayTogetherSessionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SharePlayTogetherSessionManagementViewController", 65, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_session));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_onDismiss), *(_QWORD *)&self->session[OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_onDismiss]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_dataSource));
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_lastPendingParticipantScrolledTo, (uint64_t *)&unk_14F1128);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_contentSizeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_discoveryPreferenceObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication48SharePlayTogetherSessionManagementViewController_sessionAssertion));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *v13;
  id v14;
  char *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = -[SharePlayTogetherSessionManagementViewController traitCollection](v13, "traitCollection");
  v15 = (char *)objc_msgSend(v14, "userInterfaceIdiom");

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15 == (_BYTE *)&dword_0 + 3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication48SharePlayTogetherSessionManagementViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_A1E628(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:(void *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  char v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = a1;
  sub_A2A554((uint64_t)v10);
  LOBYTE(a1) = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

@end
