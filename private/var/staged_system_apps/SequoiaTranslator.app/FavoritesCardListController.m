@implementation FavoritesCardListController

- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithCoder:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator27FavoritesCardListController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_dataSource) = 0;
  v4 = a3;

  result = (_TtC17SequoiaTranslator27FavoritesCardListController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/FavoritesCardListController.swift", 51, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoritesCardListController();
  v2 = v5.receiver;
  -[FavoritesCardListController viewDidLoad](&v5, "viewDidLoad");
  sub_1000BD764();
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v2) + 0xF8))(v3, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoritesCardListController();
  v4 = v5.receiver;
  -[FavoritesCardListController viewWillAppear:](&v5, "viewWillAppear:", v3);
  (*(void (**)(_QWORD))((swift_isaMask & *v4) + 0x100))(0);

}

- (_TtC17SequoiaTranslator27FavoritesCardListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator27FavoritesCardListController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator27FavoritesCardListController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.FavoritesCardListController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_store));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_ttsManager));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_translationSession));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_conversationSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27FavoritesCardListController_dataSource));
}

- (void)controllerDidChangeContent:(id)a3
{
  void (*v4)(uint64_t);
  id v5;
  _TtC17SequoiaTranslator27FavoritesCardListController *v6;

  v4 = *(void (**)(uint64_t))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  v5 = a3;
  v6 = self;
  v4(1);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC17SequoiaTranslator27FavoritesCardListController *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];

  v13 = sub_100006DF4((uint64_t *)&unk_100290880);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)v27 - v17;
  v19 = a3;
  swift_unknownObjectRetain(a4);
  v20 = self;
  v21 = a5;
  v22 = a7;
  _bridgeAnyObjectToAny(_:)(v27, a4);
  swift_unknownObjectRelease(a4);
  if (v21)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v21);

    v23 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 0, 1, v23);
  }
  else
  {
    v24 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  }
  if (v22)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a7);

    v25 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v16, 0, 1, v25);
  }
  else
  {
    v26 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v16, 1, 1, v26);
  }
  sub_1000C0708((uint64_t)v27, (uint64_t)v18, a6);

  sub_10000A020((uint64_t)v16, (uint64_t *)&unk_100290880);
  sub_10000A020((uint64_t)v18, (uint64_t *)&unk_100290880);
  sub_100009C08(v27);
}

@end
