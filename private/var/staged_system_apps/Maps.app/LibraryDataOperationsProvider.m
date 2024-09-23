@implementation LibraryDataOperationsProvider

- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore));
}

- (_TtC4Maps29LibraryDataOperationsProvider)initWithMapsSyncStore:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[LibraryDataOperationsProvider init](&v8, "init");
}

- (void)saveNote:(id)a3 collectionPlaceItem:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC4Maps29LibraryDataOperationsProvider *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  swift_bridgeObjectRetain(v8);
  v9 = a4;
  v10 = self;
  dispatch thunk of CollectionPlaceItem.placeItemNote.setter(v6, v8);
  type metadata accessor for MapsSyncStore(0);
  v11 = (void *)static MapsSyncStore.sharedStore.getter();
  v12 = sub_100008B04((uint64_t *)&unk_101493B10);
  v13 = swift_allocObject(v12, 40, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100E23F50;
  *(_QWORD *)(v13 + 32) = v9;
  v15 = v13;
  specialized Array._endMutation()(v13);
  v14 = v9;
  dispatch thunk of MapsSyncStore.save(_:)(v15);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v8);
}

- (BOOL)saveNote:(id)a3 libraryPlaceItem:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC4Maps29LibraryDataOperationsProvider *v9;
  char v10;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  swift_unknownObjectRetain(a4);
  v9 = self;
  v10 = sub_1001B147C(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

- (void)addToLibraryWithMapItem:(id)a3 customName:(id)a4 alsoAddnote:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _TtC4Maps29LibraryDataOperationsProvider *v16;
  id v17;

  v10 = _Block_copy(a6);
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v14;
LABEL_6:
  v15 = swift_allocObject(&unk_1011A9430, 24, 7);
  *(_QWORD *)(v15 + 16) = v10;
  swift_bridgeObjectRetain(a5);
  v16 = self;
  v17 = a3;
  swift_bridgeObjectRetain(a4);
  sub_1001B7FC0(v17, (uint64_t)sub_1000B5CCC, v15, v16, v17, v11, (uint64_t)a4, v13, (uint64_t)a5);
  swift_bridgeObjectRelease_n(a5, 2);
  swift_bridgeObjectRelease_n(a4, 2);
  swift_release();

}

- (void)deleteFromLibraryWithPlaceItem:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)();
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  _TtC4Maps29LibraryDataOperationsProvider *v18;
  id v19;
  uint64_t v20;

  ObjectType = swift_getObjectType();
  v10 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t (*)())_Block_copy(a5);
  if (v13)
  {
    v14 = swift_allocObject(&unk_1011A9408, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_1001BB884;
  }
  else
  {
    v14 = 0;
  }
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_1011A93E0, 80, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = v13;
  v16[7] = v14;
  v16[8] = a4;
  v16[9] = ObjectType;
  swift_unknownObjectRetain_n(a3, 2);
  v17 = a4;
  v18 = self;
  v19 = v17;
  sub_10000C128((uint64_t)v13, v14);
  sub_1001B0C08((uint64_t)v12, (uint64_t)&unk_10149F1E0, (uint64_t)v16);
  swift_release();
  sub_10000BF74((uint64_t)v13, v14);

  swift_unknownObjectRelease(a3);
}

- (void)deleteFromLibraryWithPlaceItems:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  void (*v8)(uint64_t, _QWORD, __n128);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC4Maps29LibraryDataOperationsProvider *v12;
  id v13;

  v8 = (void (*)(uint64_t, _QWORD, __n128))_Block_copy(a5);
  v9 = sub_100008B04(&qword_10149B560);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  if (v8)
  {
    v11 = swift_allocObject(&unk_1011A93B8, 24, 7);
    *(_QWORD *)(v11 + 16) = v8;
    v8 = (void (*)(uint64_t, _QWORD, __n128))sub_1001BB618;
  }
  else
  {
    v11 = 0;
  }
  v13 = a4;
  v12 = self;
  sub_1001B2D1C(v10, v13, v8, v11);
  sub_10000BF74((uint64_t)v8, v11);
  swift_bridgeObjectRelease(v10);

}

- (void)deleteFromLibraryWithPlaceItems:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  _TtC4Maps29LibraryDataOperationsProvider *v11;

  v6 = _Block_copy(a4);
  v7 = sub_100008B04(&qword_10149B560);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  if (v6)
  {
    v9 = swift_allocObject(&unk_1011A9390, 24, 7);
    *(_QWORD *)(v9 + 16) = v6;
    v10 = sub_10019B44C;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = self;
  sub_1001B285C(v8, (void (*)(_QWORD, __n128))v10, v9);
  sub_10000BF74((uint64_t)v10, v9);
  swift_bridgeObjectRelease(v8);

}

- (void)deleteFromLibraryWithRouteData:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC4Maps29LibraryDataOperationsProvider *v12;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1011A92A0, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_100016024;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1001BA66C(v10, v11, (uint64_t)v8, v9);
  sub_10000BF74((uint64_t)v8, v9);

}

- (void)existingPlaceItemForMapItem:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC4Maps29LibraryDataOperationsProvider *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1001B8760(v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)existingPlaceItemsForMapItem:(MKMapItem *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MKMapItem *v15;
  _TtC4Maps29LibraryDataOperationsProvider *v16;
  uint64_t v17;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A91D8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011A9200, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149F1C0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011A9228, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149F1C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149F1D0, (uint64_t)v14);
  swift_release();
}

- (void)updateSavedPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC4Maps29LibraryDataOperationsProvider *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _TtC4Maps29LibraryDataOperationsProvider *v19;
  uint64_t v20;
  id v21;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a3;
  v10 = a4;
  v11 = self;
  v12 = objc_msgSend(v10, "_geoMapItem");
  if (v12)
  {
    v13 = v12;
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
    v15 = (_QWORD *)swift_allocObject(&unk_1011A91B0, 64, 7);
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v11;
    v16 = v21;
    v15[5] = v21;
    v15[6] = v13;
    v15[7] = v10;
    v17 = v16;
    v18 = v10;
    v19 = v11;
    sub_1001B0C08((uint64_t)v9, (uint64_t)&unk_10149F1B0, (uint64_t)v15);
    swift_release();

  }
  else
  {

  }
}

- (void)deleteFavoriteItem:(id)a3
{
  id v4;
  _TtC4Maps29LibraryDataOperationsProvider *v5;

  v4 = a3;
  v5 = self;
  sub_1001BB1B8(v4);

}

- (void)saveAsFavoriteWithCollectionPlaceItem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC4Maps29LibraryDataOperationsProvider *v11;
  id v12;
  _TtC4Maps29LibraryDataOperationsProvider *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_1011A9108, 48, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a3;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  v12 = v10;
  v13 = v11;
  sub_1001B0C08((uint64_t)v7, (uint64_t)&unk_10149F180, (uint64_t)v9);
  swift_release();

}

- (_TtC4Maps29LibraryDataOperationsProvider)init
{
  _TtC4Maps29LibraryDataOperationsProvider *result;

  result = (_TtC4Maps29LibraryDataOperationsProvider *)_swift_stdlib_reportUnimplementedInitializer("Maps.LibraryDataOperationsProvider", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)alertMessageForDeletingPlaceItem:(_TtP4Maps26LibraryPlaceItemCompatible_ *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC4Maps29LibraryDataOperationsProvider *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A9068, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011A9090, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149F0E0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011A90B8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149A9C0;
  v14[5] = v13;
  swift_unknownObjectRetain(a3);
  v15 = self;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149F0F0, (uint64_t)v14);
  swift_release();
}

@end
