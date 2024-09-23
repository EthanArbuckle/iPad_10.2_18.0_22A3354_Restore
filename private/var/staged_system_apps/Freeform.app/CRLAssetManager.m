@implementation CRLAssetManager

+ (id)readonlyAssetFromURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = sub_100964C2C((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

+ (id)readonlyAssetFromData:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  objc_class *v16;
  id v17;
  double v18;
  id v19;
  objc_super v21;
  _QWORD v22[5];

  v6 = a3;
  v7 = a4;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v13 = v12;

  v14 = type metadata accessor for CRLDataAssetStorage(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  sub_1004BE310(v8, v10);
  swift_bridgeObjectRetain(v13);
  v15 = sub_10070F1A8(v8, v10, v11, v13);
  v22[3] = v14;
  v22[4] = &off_101279F20;
  v22[0] = v15;
  v16 = (objc_class *)type metadata accessor for CRLAsset();
  v17 = objc_allocWithZone(v16);
  sub_1004E90B0((uint64_t)v22, (uint64_t)v17 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v21.receiver = v17;
  v21.super_class = v16;
  *(_QWORD *)&v18 = swift_retain(v15).n128_u64[0];
  v19 = objc_msgSendSuper2(&v21, "init", v18);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v22);
  swift_bridgeObjectRelease();
  swift_release(v15);
  sub_1004BBBC8(v8, v10);
  return v19;
}

- (void)removeAllDownloadObserversWithIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t Strong;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _TtC8Freeform15CRLAssetManager *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v24 - v13;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform15CRLAssetManager_store);
  if (Strong)
  {
    v17 = Strong;
    v18 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v7, 1, 1, v18);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
    v19 = *(unsigned __int8 *)(v9 + 80);
    v20 = (v19 + 40) & ~v19;
    v21 = (char *)swift_allocObject(&unk_10128B928, v20 + v10, v19 | 7);
    *((_QWORD *)v21 + 2) = 0;
    *((_QWORD *)v21 + 3) = 0;
    *((_QWORD *)v21 + 4) = v17;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v20], v11, v8);
    v22 = self;
    v23 = sub_100521B98((uint64_t)v7, (uint64_t)&unk_1013FFE80, (uint64_t)v21);

    v16 = swift_release(v23);
  }
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v14, v8, v16);
}

+ (void)addCullingListener:(id)a3
{
  sub_100963208((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

+ (void)removeCullingListener:(id)a3
{
  sub_100963208((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (_TtC8Freeform15CRLAssetManager)init
{
  _TtC8Freeform15CRLAssetManager *result;

  result = (_TtC8Freeform15CRLAssetManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLAssetManager", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform15CRLAssetManager_store);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLAssetManager_lock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLAssetManager_assets));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform15CRLAssetManager_garbageCollectionWorkItem));
}

@end
