@implementation CRLPreinsertionAssetWrapper

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 filename:(id)a4 owner:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v14;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  swift_getObjectType(a5);
  swift_unknownObjectRetain(a5);
  v14 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_1009BDB18((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, (char *)self);
  swift_unknownObjectRelease(a5);
  return v14;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 owner:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSURL *v11;
  void *v12;
  void *v13;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v14;
  uint64_t v16;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_unknownObjectRetain(a4);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = -[CRLPreinsertionAssetWrapper initWithUrl:filename:owner:](self, "initWithUrl:filename:owner:", v12, 0, a4);
  swift_unknownObjectRelease(a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithData:(id)a3 filename:(id)a4 owner:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain(a5);
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v16 = v15;

  return (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_1009BAF98(v11, v13, v14, v16, (uint64_t)a5);
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithAlreadyInsertedAsset:(id)a3 owner:(id)a4
{
  char *v5;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v6;

  v5 = (char *)a3;
  swift_unknownObjectRetain(a4);
  v6 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_1009BDF04(v5, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v6;
}

- (void)createAssetWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10128E720, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10128E748, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013FFA80;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10128E770, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (id)synchronouslyCreateAsset
{
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1009BCA2C();

  return v3;
}

- (id)synchronouslyCreateReadonlyAsset
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v12;
  id v13;
  uint64_t v14;

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__alreadyInsertedAsset);
  if (v6)
  {
    v7 = self;
    v8 = v6;
LABEL_5:
    v13 = v6;

    return v8;
  }
  sub_1004CB7BC((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__url, (uint64_t)v5, &qword_1013E04D0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9);
  if ((_DWORD)result != 1)
  {
    v12 = self;
    v8 = sub_100964C2C((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
    v6 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

- (UTType)type
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v3 = sub_1004B804C((uint64_t *)&unk_1013E3620);
  __chkstk_darwin(v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)&self->_filename[OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__filename];
  v7 = self;
  swift_bridgeObjectRetain(v6);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v8, "crl_pathUTI", swift_bridgeObjectRelease().n128_f64[0]);

  if (v9)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    UTType.init(_:)(v10, v12, v13);
  }
  else
  {
    v14 = type metadata accessor for UTType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 1, 1, v14);
  }

  v15 = type metadata accessor for UTType(0);
  v16 = *(_QWORD *)(v15 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) != 1)
  {
    isa = UTType._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v15);
  }
  return (UTType *)isa;
}

- (CGDataProvider)newCGDataProvider
{
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v2;
  CGDataProvider *v3;

  v2 = self;
  v3 = sub_1009BD3C4();

  return v3;
}

- (CGImageSource)newCGImageSource
{
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v2;
  CGImageSource *v3;

  v2 = self;
  v3 = sub_1009BD574();

  return v3;
}

- (CGImage)newCGImage
{
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v2;
  CGDataProvider *v3;

  v2 = self;
  v3 = sub_1009BD740();

  return v3;
}

- (NSString)filename
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->_filename[OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__filename];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)init
{
  _TtC8Freeform27CRLPreinsertionAssetWrapper *result;

  result = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPreinsertionAssetWrapper", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__url, &qword_1013E04D0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__owner));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__alreadyInsertedAsset));

}

@end
