@implementation MapsSyncPlaceItemMapStorageUpdater

- (void)updateMapsSyncPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _TtC4Maps34MapsSyncPlaceItemMapStorageUpdater *v21;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider);
  v11 = a3;
  v12 = a4;
  v21 = self;
  v13 = objc_msgSend(v12, "_geoMapItem");
  if (v13)
  {
    v14 = v13;
    v15 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
    v16 = (_QWORD *)swift_allocObject(&unk_1011A90E0, 64, 7);
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v10;
    v16[5] = v11;
    v16[6] = v14;
    v16[7] = v12;
    v17 = v11;
    v18 = v12;
    v19 = v10;
    sub_1001B0C08((uint64_t)v9, (uint64_t)&unk_10149F160, (uint64_t)v16);

    swift_release();
  }
  else
  {

  }
}

- (_TtC4Maps34MapsSyncPlaceItemMapStorageUpdater)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC4Maps34MapsSyncPlaceItemMapStorageUpdater *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  objc_super v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider;
  type metadata accessor for MapsSyncStore(0);
  v5 = self;
  v6 = static MapsSyncStore.sharedStore.getter();
  v7 = (objc_class *)type metadata accessor for LibraryDataOperationsProvider();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)-[MapsSyncPlaceItemMapStorageUpdater init](&v11, "init");

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return -[MapsSyncPlaceItemMapStorageUpdater init](&v10, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider));
}

@end
