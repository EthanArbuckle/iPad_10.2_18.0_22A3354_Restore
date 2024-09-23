@implementation CRLAsset

+ (_TtC8Freeform8CRLAsset)null
{
  if (qword_1013DD5B8 != -1)
    swift_once(&qword_1013DD5B8, sub_1009608BC);
  return (_TtC8Freeform8CRLAsset *)(id)qword_101480078;
}

- (BOOL)hasOwners
{
  _TtC8Freeform8CRLAsset *v2;
  char v3;

  v2 = self;
  v3 = sub_100960A98();

  return v3 & 1;
}

- (UTType)type
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Class isa;
  uint64_t v21;

  v3 = sub_1004B804C((uint64_t *)&unk_1013E3620);
  __chkstk_darwin(v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v7 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v6);
  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 16);
  v9 = self;
  v8(v6, v7);
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v10, "crl_pathUTI", swift_bridgeObjectRelease().n128_f64[0]);

  if (v11)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    UTType.init(_:)(v12, v14, v15);
  }
  else
  {
    v16 = type metadata accessor for UTType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 1, 1, v16);
  }

  v17 = type metadata accessor for UTType(0);
  v18 = *(_QWORD *)(v17 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v5, 1, v17) != 1)
  {
    isa = UTType._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
  }
  return (UTType *)isa;
}

- (unint64_t)length
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  unint64_t v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (NSUUID)assetUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v10;
  Class isa;
  uint64_t v13;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v8 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 24);
  v10 = self;
  v9(v7, v8);

  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (NSString)filename
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  NSString v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v6(v4, v5);

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform8CRLAsset *v5;
  uint64_t v6;
  _TtC8Freeform8CRLAsset *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100960FF8((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v10;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v14;
  _OWORD v15[4];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init()(v15);
  v7 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v8 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 24);
  v10 = self;
  v9(v7, v8);
  v11 = sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v15, v3, v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v19 = v15[2];
  v20 = v15[3];
  v21 = v16;
  v17 = v15[0];
  v18 = v15[1];
  v12 = Hasher.finalize()();

  return v12;
}

- (int64_t)crl_hash
{
  return -[CRLAsset hash](self, "hash");
}

- (CRLColor)fallbackColor
{
  return (CRLColor *)0;
}

- (id)newData
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v8 = v6(v4, v5);
  v10 = v9;

  if (v10 >> 60 == 15)
    return 0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1004BE2FC(v8, v10);
  return isa;
}

- (CGDataProvider)newCGDataProvider
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  CGDataProvider *v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v8 = (CGDataProvider *)v6(v4, v5);

  return v8;
}

- (CGImageSource)newCGImageSource
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  CGDataProvider *v8;
  CGDataProvider *v9;
  CGImageSource *v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v8 = (CGDataProvider *)v6(v4, v5);
  if (v8)
  {
    v9 = v8;
    v10 = CGImageSourceCreateWithDataProvider(v8, 0);

    v7 = (_TtC8Freeform8CRLAsset *)v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGImage)newCGImage
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  CGDataProvider *v8;
  CGImageRef ImageAtIndex;
  CGImageSource *v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v8 = (CGDataProvider *)v6(v4, v5);
  ImageAtIndex = v8;
  if (v8)
  {
    v10 = CGImageSourceCreateWithDataProvider(v8, 0);

    if (v10)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);

      v7 = (_TtC8Freeform8CRLAsset *)v10;
    }
    else
    {
      ImageAtIndex = 0;
    }
  }

  return ImageAtIndex;
}

- (void)performInputStreamReadWithAccessor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v8;
  _QWORD v9[4];

  v4 = _Block_copy(a3);
  v9[2] = v4;
  v5 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v6 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v5);
  v7 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v6 + 48);
  v8 = self;
  v7(sub_10077F5F8, v9, v5, v6);
  _Block_release(v4);

}

- (id)AVAssetAndReturnError:(id *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v8;
  void *v9;

  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v5 = v4[3];
  v6 = v4[4];
  sub_1004BB5A4(v4, v5);
  v7 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v6 + 56);
  v8 = self;
  v9 = (void *)v7(_swiftEmptyDictionarySingleton, v5, v6);

  return v9;
}

- (id)AVAssetWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v9;
  void *v10;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v6 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v7 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v6);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  v9 = self;
  v10 = (void *)v8(v5, v6, v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)needsDownload
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;
  char v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (void)addDownloadObserverWithIdentifier:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v18;
  __n128 v19;
  uint64_t v20;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = swift_allocObject(&unk_10128B950, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  v15 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v16 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v15);
  v17 = *(void (**)(char *, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v16 + 72);
  v18 = self;
  v17(v12, a4, sub_100964F94, v14, v15, v16);

  v19 = swift_release(v14);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
}

- (void)removeDownloadObserverWithIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v12;
  uint64_t v13;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v10 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v9);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 80);
  v12 = self;
  v11(v8, v9, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)downloadIfNeeded
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform8CRLAsset *v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  v5 = *(_QWORD *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_1004BB5A4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
  v9 = self;
  if ((v6(v4, v5) & 1) != 0)
  {
    v7 = v3[3];
    v8 = v3[4];
    sub_1004BB5A4(v3, v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 88))(v7, v8);
  }

}

- (void)cancelDownload
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC8Freeform8CRLAsset *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v4 = v3[3];
  v5 = v3[4];
  sub_1004BB5A4(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  v7 = self;
  v6(v4, v5);

}

- (_TtC8Freeform8CRLAsset)init
{
  _TtC8Freeform8CRLAsset *result;

  result = (_TtC8Freeform8CRLAsset *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLAsset", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC8Freeform8CRLAsset_storage));
}

@end
