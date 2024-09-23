@implementation FavoriteCollectionHandler

+ (NSString)FavoriteCollectionIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)title
{
  __int128 v2;
  NSString v3;
  _BYTE v5[24];

  if (qword_101491110 != -1)
    swift_once(&qword_101491110, sub_1001DCC98);
  swift_beginAccess(&static FavoriteCollectionHandler.title, v5, 0, 0);
  v2 = static FavoriteCollectionHandler.title;
  swift_bridgeObjectRetain(*((_QWORD *)&static FavoriteCollectionHandler.title + 1));
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(*((_QWORD *)&v2 + 1));
  return (NSString *)v3;
}

+ (void)setTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  if (qword_101491110 != -1)
    swift_once(&qword_101491110, sub_1001DCC98);
  swift_beginAccess(&static FavoriteCollectionHandler.title, v7, 1, 0);
  v6 = *((_QWORD *)&static FavoriteCollectionHandler.title + 1);
  *(_QWORD *)&static FavoriteCollectionHandler.title = v3;
  *((_QWORD *)&static FavoriteCollectionHandler.title + 1) = v5;
  swift_bridgeObjectRelease(v6);
}

- (BOOL)isFavoriteCollection
{
  return 1;
}

- (NSString)title
{
  uint64_t v2;
  _TtC4Maps25FavoriteCollectionHandler *v3;
  __int128 v4;
  NSString v5;
  _BYTE v7[24];

  v2 = qword_101491110;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_101491110, sub_1001DCC98);
  swift_beginAccess(&static FavoriteCollectionHandler.title, v7, 0, 0);
  v4 = static FavoriteCollectionHandler.title;
  swift_bridgeObjectRetain(*((_QWORD *)&static FavoriteCollectionHandler.title + 1));

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(*((_QWORD *)&v4 + 1));
  return (NSString *)v5;
}

- (UIImage)glyphImage
{
  _TtC4Maps25FavoriteCollectionHandler *v2;
  id v3;

  v2 = self;
  v3 = FavoriteCollectionHandler._glyphImage.getter();

  return (UIImage *)v3;
}

- (UIImage)_glyphImage
{
  _TtC4Maps25FavoriteCollectionHandler *v2;
  id v3;

  v2 = self;
  v3 = FavoriteCollectionHandler._glyphImage.getter();

  return (UIImage *)v3;
}

- (void)set_glyphImage:(id)a3
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage) = (Class)a3;
  v4 = a3;
  sub_100042EEC(v3);
}

- (UIImage)image
{
  return (UIImage *)0;
}

- (int64_t)handlerType
{
  return 0;
}

- (int64_t)contentType
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canAddContent
{
  return 1;
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (BOOL)canEditImage
{
  return 0;
}

- (BOOL)canEditTitle
{
  return 0;
}

- (BOOL)canShare
{
  uint64_t v2;
  void *v3;
  _TtC4Maps25FavoriteCollectionHandler *v4;
  unsigned __int8 v5;

  v2 = MapsConfig_CollectionAllowsURLSharing;
  v3 = off_1014B3378;
  v4 = self;
  if (GEOConfigGetBOOL(v2, v3))
  {
    v5 = -[CollectionHandler isEmpty](v4, "isEmpty");

    return v5 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (NSURL)sharingURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC4Maps25FavoriteCollectionHandler *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSURL *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v3 = sub_100008B04((uint64_t *)&unk_101499B30);
  __chkstk_darwin(v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - v7;
  v9 = self;
  v10 = -[CollectionHandler sharingURLFromContainedMapItems](v9, "sharingURLFromContainedMapItems");
  if (v10)
  {
    v11 = v10;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v10);

    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 0, 1, v12);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 1, 1, v12);
  }
  sub_1001A2A94((uint64_t)v5, (uint64_t)v8);

  type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }
  return (NSURL *)v15;
}

- (BOOL)beingModified
{
  return *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_modficationCount) > 0;
}

- (_TtC4Maps25FavoriteCollectionHandler)init
{
  return (_TtC4Maps25FavoriteCollectionHandler *)FavoriteCollectionHandler.init()();
}

- (void)dealloc
{
  _TtC4Maps25FavoriteCollectionHandler *v3;
  void *v4;
  _TtC4Maps25FavoriteCollectionHandler *v5;
  objc_super v6;

  type metadata accessor for MapsSyncStore(0);
  v3 = self;
  v4 = (void *)static MapsSyncStore.sharedStore.getter(v3);
  v5 = v3;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)(v5);

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for FavoriteCollectionHandler();
  -[FavoriteCollectionHandler dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_queryContents));
  sub_100042EEC(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_storeSubscriptionTypes));
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FavoriteCollectionHandler();
  v4 = a3;
  v5 = v8.receiver;
  v6 = -[CollectionHandler itemForMapItem:](&v8, "itemForMapItem:", v4);

  if (v6)
  return v6 != 0;
}

- (void)addObjects:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC4Maps25FavoriteCollectionHandler *v9;

  v6 = _Block_copy(a4);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1011AA540, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_10019B44C;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  FavoriteCollectionHandler.add(_:completion:)(v7, (uint64_t)v6, v8);
  sub_10000BF74((uint64_t)v6, v8);
  swift_bridgeObjectRelease(v7);

}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC4Maps25FavoriteCollectionHandler *v9;

  v6 = _Block_copy(a4);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1011AA518, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_10019B44C;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  FavoriteCollectionHandler.remove(_:completion:)(v7, (uint64_t)v6, v8);
  sub_10000BF74((uint64_t)v6, v8);
  swift_bridgeObjectRelease(v7);

}

- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5
{
  void (*v8)(id);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC4Maps25FavoriteCollectionHandler *v14;

  v8 = (void (*)(id))_Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (v8)
  {
    v12 = swift_allocObject(&unk_1011AA4F0, 24, 7);
    *(_QWORD *)(v12 + 16) = v8;
    v8 = (void (*)(id))sub_100016024;
  }
  else
  {
    v12 = 0;
  }
  v13 = a4;
  v14 = self;
  FavoriteCollectionHandler.updateTitle(_:for:completion:)(v9, v11, (uint64_t)v13, v8, v12);
  sub_10000BF74((uint64_t)v8, v12);

  swift_bridgeObjectRelease(v11);
}

- (NSArray)storeSubscriptionTypes
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_storeSubscriptionTypes);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_storeSubscriptionTypes, v6, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v3);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_storeSubscriptionTypes);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  _TtC4Maps25FavoriteCollectionHandler *v3;

  v3 = self;
  _s4Maps25FavoriteCollectionHandlerC14storeDidChange5typesySaySSG_tF_0();

}

- (_TtC4Maps25FavoriteCollectionHandler)initWithCollection:(id)a3
{
  _TtC4Maps25FavoriteCollectionHandler *result;

  swift_unknownObjectRetain(a3);
  result = (_TtC4Maps25FavoriteCollectionHandler *)_swift_stdlib_reportUnimplementedInitializer("Maps.FavoriteCollectionHandler", 30, "init(collection:)", 17, 0);
  __break(1u);
  return result;
}

@end
