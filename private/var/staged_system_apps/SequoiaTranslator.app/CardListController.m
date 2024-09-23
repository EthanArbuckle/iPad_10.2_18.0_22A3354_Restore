@implementation CardListController

- (_TtC17SequoiaTranslator18CardListController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002C758();
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator18CardListController *v2;

  v2 = self;
  sub_1000258DC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CardListController(0);
  v4 = v7.receiver;
  -[CardListController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = sub_1000252E8();
  v6 = sub_1000E5888();

  objc_msgSend(v6, "resetSwipedItemAnimated:completion:", 0, 0, v7.receiver, v7.super_class);
}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC17SequoiaTranslator18CardListController *v2;

  v2 = self;
  sub_100025ACC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator18CardListController *v4;

  v4 = self;
  sub_1000261A8(a3);

}

- (_TtC17SequoiaTranslator18CardListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator18CardListController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator18CardListController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.CardListController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_conversation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_session));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_dictionaryManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_subscriptions));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_currentExpandedIndexPath, (uint64_t *)&unk_100290880);
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_newTranslationManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController____lazy_storage___layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18CardListController____lazy_storage___collectionView));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator18CardListController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = -[CardListController view](v5, "view");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "endEditing:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  _TtC17SequoiaTranslator18CardListController *v2;

  v2 = self;
  sub_100028724();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  id v9;
  _TtC17SequoiaTranslator18CardListController *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;

  v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator18CardListController_session);
  KeyPath = swift_getKeyPath(&unk_1001E7810);
  v8 = swift_getKeyPath(&unk_1001E7838);
  v9 = a3;
  v10 = self;
  v11 = swift_retain(v6);
  static Published.subscript.getter(&v16, v11, KeyPath, v8);
  swift_release(v6);
  swift_release(KeyPath);
  swift_release(v8);
  v12 = v16;
  if ((unint64_t)v16 >> 62)
  {
    if (v16 < 0)
      v15 = v16;
    else
      v15 = v16 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v16);
    v13 = _CocoaArrayWrapper.endIndex.getter(v15);

    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v13 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease(v12);

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC17SequoiaTranslator18CardListController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100028ADC(v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC17SequoiaTranslator18CardListController *v12;
  id v13;
  void *v14;
  id v15;
  Class isa;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100027038((uint64_t)v10, 1);
  v13 = -[CardListController view](v12, "view");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "endEditing:", 1);

    v15 = sub_100025650();
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", isa, 4, 1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC17SequoiaTranslator18CardListController *v15;
  uint64_t v16;

  v7 = sub_100006DF4((uint64_t *)&unk_100290880);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  v14 = a3;
  v15 = self;
  sub_100027930((uint64_t)v9, 1);
  sub_10000A020((uint64_t)v9, (uint64_t *)&unk_100290880);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)favorite:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator18CardListController *v5;

  v4 = a3;
  v5 = self;
  sub_10002B2FC((uint64_t)v4);

}

- (void)deleteCell:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator18CardListController *v9;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10002B664((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
