@implementation MapsFavoriteItem

+ (NSString)MapsSuggestionsNearbyTransitShortcutIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)analyticsGrouping
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->cachedSubtitle[OBJC_IVAR____TtC4Maps16MapsFavoriteItem_analyticsGrouping];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (MSFavoriteItem)favoriteItem
{
  return (MSFavoriteItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_favoriteItem));
}

- (int64_t)number
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_number);
}

- (void)setNumber:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_number) = (Class)a3;
}

- (BOOL)isShortcutForSetup
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup);
}

- (void)setIsShortcutForSetup:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup) = a3;
}

- (BOOL)isPersisted
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isPersisted);
}

- (void)setIsPersisted:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isPersisted) = a3;
}

- (BOOL)isAlreadyThere
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isAlreadyThere);
}

- (void)setIsAlreadyThere:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isAlreadyThere) = a3;
}

- (BOOL)isMeCardWritebackEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isMeCardWritebackEnabled);
}

- (void)setIsMeCardWritebackEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isMeCardWritebackEnabled) = a3;
}

- (int64_t)transportType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_transportType);
}

- (void)setTransportType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_transportType) = (Class)a3;
}

- (BOOL)isHomeWorkOrSchool
{
  _TtC4Maps16MapsFavoriteItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100205F3C();

  return v3;
}

- (BOOL)isNearbyTransit
{
  _TtC4Maps16MapsFavoriteItem *v2;
  char v3;

  v2 = self;
  v3 = sub_100206010();

  return v3 & 1;
}

- (_TtC4Maps16MapsFavoriteItem)initWithFavoriteItem:(id)a3
{
  id v3;
  _TtC4Maps16MapsFavoriteItem *v4;

  v3 = a3;
  v4 = (_TtC4Maps16MapsFavoriteItem *)sub_10020E76C(v3);

  return v4;
}

- (_TtC4Maps16MapsFavoriteItem)init
{
  void *v3;
  _TtC4Maps16MapsFavoriteItem *v4;

  type metadata accessor for FavoriteItem(0, a2);
  v3 = (void *)MapsSyncObject.__allocating_init()();
  v4 = -[MapsFavoriteItem initWithFavoriteItem:](self, "initWithFavoriteItem:", v3);

  return v4;
}

- (_TtC4Maps16MapsFavoriteItem)initWithCollectionItem:(id)a3
{
  return (_TtC4Maps16MapsFavoriteItem *)sub_1002061AC(a3);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1002064E8);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->cachedSubtitle[OBJC_IVAR____TtC4Maps16MapsFavoriteItem_cachedSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cachedSubtitle[OBJC_IVAR____TtC4Maps16MapsFavoriteItem_analyticsGrouping]);

}

- (void)saveWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps16MapsFavoriteItem *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011AC430, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011AC458, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1014A0C60;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011AC480, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1014A0C68;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_1014A0C70, (uint64_t)v12);
  swift_release();
}

- (void)deleteWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps16MapsFavoriteItem *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011AC3A0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011AC3C8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1014A0C40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011AC3F0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1014A0C48;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_1014A0C50, (uint64_t)v12);
  swift_release();
}

- (void)deleteWithDeleteFromLibrary:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC4Maps16MapsFavoriteItem *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_1011AC310, 40, 7);
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011AC338, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1014A0C10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011AC360, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1014A0C18;
  v14[5] = v13;
  v15 = self;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_1014A0C20, (uint64_t)v14);
  swift_release();
}

- (void)moveToBackWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps16MapsFavoriteItem *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011AC248, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011AC270, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1014A0BE8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011AC298, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1014A0BF0;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_1014A0BF8, (uint64_t)v12);
  swift_release();
}

- (void)moveToIndex:(int64_t)a3 with:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  _TtC4Maps16MapsFavoriteItem *v12;

  v8 = _Block_copy(a5);
  v9 = type metadata accessor for MapsFavoriteItem();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = swift_allocObject(&unk_1011AC140, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  sub_100208AAC(a3, v10, (uint64_t)sub_10019B44C, v11);

  swift_bridgeObjectRelease(v10);
  swift_release();
}

- (void)moveToPreferredIndexWith:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC4Maps16MapsFavoriteItem *v10;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for MapsFavoriteItem();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_1011AC0C8, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_100209814(v8, (uint64_t)sub_100016024, v9);

  swift_bridgeObjectRelease(v8);
  swift_release();
}

- (id)copyWithZone:(void *)a3
{
  _TtC4Maps16MapsFavoriteItem *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_100209EF0(v8);

  v4 = v9;
  v5 = sub_10000BE88(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_10000BEAC(v8);
  return v6;
}

- (NSString)title
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_10020A75C);
}

- (NSString)subtitle
{
  return (NSString *)sub_10009F900(self, (uint64_t)a2, (void (*)(void))sub_10020A974);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_cachedSubtitle);
  v7 = *(_QWORD *)&self->cachedSubtitle[OBJC_IVAR____TtC4Maps16MapsFavoriteItem_cachedSubtitle];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (NSString)placeName
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_10020AB88);
}

- (NSString)shortAddress
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_10020ACF8);
}

- (GEOFeatureStyleAttributes)proposedFavoriteStyleAttributes
{
  _TtC4Maps16MapsFavoriteItem *v2;
  id v3;

  v2 = self;
  v3 = sub_10020B154();

  return (GEOFeatureStyleAttributes *)v3;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  _TtC4Maps16MapsFavoriteItem *v2;
  id v3;

  v2 = self;
  v3 = sub_10020B25C();

  return (GEOFeatureStyleAttributes *)v3;
}

- (void)updateSubtitleWithViewMode:(int64_t)a3 currentLocation:(CLLocation *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  CLLocation *v17;
  _TtC4Maps16MapsFavoriteItem *v18;
  uint64_t v19;

  v9 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1011ABF88, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1011ABFB0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1014A0B68;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1011ABFD8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10149A9C0;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_10020D758((uint64_t)v11, (uint64_t)&unk_10149F0F0, (uint64_t)v16);
  swift_release();
}

- (BOOL)isSetupPlaceholder
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup);
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC4Maps16MapsFavoriteItem *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  uint64_t v16;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[MapsFavoriteItem uniqueIdentifier](v7, "uniqueIdentifier");
  if (v8)
  {
    v9 = v8;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

  }
  else
  {
    v12 = UUID.init()(0);
    UUID.uuidString.getter(v12);
    v11 = v13;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  }
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return (NSString *)v14;
}

- (NSString)uniqueIdentifier
{
  _TtC4Maps16MapsFavoriteItem *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSString v8;

  v2 = self;
  dispatch thunk of FavoriteItem.shortcutIdentifier.getter();
  if (v3)
  {
    v4 = v3;

  }
  else
  {
    v5 = -[MapsFavoriteItem createUniqueIdentifier](v2, "createUniqueIdentifier");
    if (!v5)
    {

      v8 = 0;
      return (NSString *)v8;
    }
    v6 = v5;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v4 = v7;

  }
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v8;
}

- (int64_t)type
{
  _TtC4Maps16MapsFavoriteItem *v2;
  __int16 v3;

  v2 = self;
  v3 = dispatch thunk of FavoriteItem.type.getter();

  return v3;
}

- (void)setType:(int64_t)a3
{
  _TtC4Maps16MapsFavoriteItem *v4;

  if (a3 < -32768)
  {
    __break(1u);
  }
  else if (a3 < 0x8000)
  {
    v4 = self;
    dispatch thunk of FavoriteItem.type.setter(a3);

    return;
  }
  __break(1u);
}

- (int64_t)entryType
{
  _TtC4Maps16MapsFavoriteItem *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_10020C9C4();

  return v3;
}

- (BOOL)isHidden
{
  _TtC4Maps16MapsFavoriteItem *v2;
  char v3;

  v2 = self;
  v3 = dispatch thunk of FavoriteItem.hidden.getter();

  return v3 & 1;
}

- (void)setIsHidden:(BOOL)a3
{
  _BOOL8 v3;
  _TtC4Maps16MapsFavoriteItem *v4;

  v3 = a3;
  v4 = self;
  dispatch thunk of FavoriteItem.hidden.setter(v3);

}

- (NSString)identifier
{
  return (NSString *)sub_10020CACC(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.shortcutIdentifier.getter);
}

- (void)setIdentifier:(id)a3
{
  sub_10020CB48(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of FavoriteItem.shortcutIdentifier.setter);
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_10020CACC(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.shortcutIdentifier.getter);
}

- (void)setShortcutIdentifier:(id)a3
{
  sub_10020CB48(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of FavoriteItem.shortcutIdentifier.setter);
}

- (NSString)customName
{
  return (NSString *)sub_10020CACC(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.customName.getter);
}

- (void)setCustomName:(id)a3
{
  sub_10020CB48(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of FavoriteItem.customName.setter);
}

- (NSUUID)storageIdentifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC4Maps16MapsFavoriteItem *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = sub_100008B04((uint64_t *)&unk_10149AA90);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  dispatch thunk of MapsSyncObject.identifier.getter(v6);

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)isa;
}

- (void)setStorageIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC4Maps16MapsFavoriteItem *v14;
  uint64_t v15;

  v5 = sub_100008B04((uint64_t *)&unk_10149AA90);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v15 - v10;
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  sub_1000A4FC0((uint64_t)v11, (uint64_t)v7);
  v14 = self;
  dispatch thunk of MapsSyncObject.identifier.setter(v7);
  sub_100010CC4((uint64_t)v11, (uint64_t *)&unk_10149AA90);

}

- (GEOMapItem)geoMapItem
{
  _TtC4Maps16MapsFavoriteItem *v2;
  GEOMapItemStorage *v3;

  v2 = self;
  v3 = -[MapsFavoriteItem mapItemStorage](v2, "mapItemStorage");

  return v3;
}

- (void)setGeoMapItem:(id)a3
{
  void *v5;
  _TtC4Maps16MapsFavoriteItem *v6;
  id v7;

  v5 = (void *)objc_opt_self(GEOMapItemStorage);
  swift_unknownObjectRetain(a3);
  v6 = self;
  v7 = objc_msgSend(v5, "mapItemStorageForGEOMapItem:", a3);
  -[MapsFavoriteItem setMapItemStorage:](v6, "setMapItemStorage:", v7);

  swift_unknownObjectRelease(a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  _TtC4Maps16MapsFavoriteItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)dispatch thunk of FavoriteItem.mapItemStorage.getter(v2);

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  id v5;
  _TtC4Maps16MapsFavoriteItem *v6;

  v5 = a3;
  v6 = self;
  dispatch thunk of FavoriteItem.mapItemStorage.setter(a3);

}

- (MKMapItem)mkMapItem
{
  _TtC4Maps16MapsFavoriteItem *v2;
  GEOMapItem *v3;
  id v4;

  v2 = self;
  v3 = -[MapsFavoriteItem geoMapItem](v2, "geoMapItem");
  v4 = objc_msgSend(objc_allocWithZone((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v3, 0);

  swift_unknownObjectRelease(v3);
  return (MKMapItem *)v4;
}

- (void)setMkMapItem:(id)a3
{
  _TtC4Maps16MapsFavoriteItem *v3;
  id v4;

  v3 = self;
  if (a3)
    v4 = objc_msgSend(a3, "_geoMapItem");
  else
    v4 = 0;
  -[MapsFavoriteItem setGeoMapItem:](v3, "setGeoMapItem:", v4);

  swift_unknownObjectRelease(v4);
}

- (void)removeContact:(id)a3
{
  sub_10020D00C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of FavoriteItem.removeContactHandle(_:));
}

- (void)addContact:(id)a3
{
  sub_10020D00C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of FavoriteItem.addContactHandle(_:));
}

- (NSArray)contacts
{
  _TtC4Maps16MapsFavoriteItem *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = dispatch thunk of FavoriteItem.fetchContactHandles()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setContacts:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC4Maps16MapsFavoriteItem *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = self;
    v7 = (_QWORD *)(v4 + 40);
    do
    {
      v8 = *(v7 - 1);
      v9 = *v7;
      swift_bridgeObjectRetain(*v7);
      dispatch thunk of FavoriteItem.addContactHandle(_:)(v8, v9);
      swift_bridgeObjectRelease(v9);
      v7 += 2;
      --v5;
    }
    while (v5);

  }
  swift_bridgeObjectRelease(v4);
}

- (id)createUniqueIdentifier
{
  return sub_10009F900(self, (uint64_t)a2, (void (*)(void))sub_10020D168);
}

- (id)identifierForCoordinateWithCoordinate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  sub_10020EBA4(a3.var0, a3.var1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (id)cnLabledAddress
{
  _TtC4Maps16MapsFavoriteItem *v2;
  id v3;

  v2 = self;
  v3 = sub_10020D49C();

  return v3;
}

@end
