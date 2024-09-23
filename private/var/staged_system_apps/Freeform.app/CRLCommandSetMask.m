@implementation CRLCommandSetMask

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CRLMaskInfo)maskInfo
{
  return (CRLMaskInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_maskInfo));
}

- (_TtC8Freeform17CRLCommandSetMask)initWithId:(id)a3 maskInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  id v12;
  _TtC8Freeform17CRLCommandSetMask *v13;
  objc_super v15;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_id, v10, v7);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_maskInfo) = (Class)a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetMask(0);
  v15.receiver = self;
  v15.super_class = v11;
  v12 = a4;
  v13 = -[CRLCommand init](&v15, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(__n128);
  id v13;
  id v14;
  __n128 v15;
  Class isa;
  _TtC8Freeform17CRLCommandSetMask *v17;
  uint64_t v19;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v12 = *(void (**)(__n128))(*(_QWORD *)v11 + 256);
  v13 = a3;
  v14 = a4;
  v15 = swift_retain(v11);
  v12(v15);
  swift_release(v11);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17 = -[CRLCommandSetMask initWithId:maskInfo:](self, "initWithId:maskInfo:", isa, v14);

  return v17;
}

- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskGeometry:(id)a4 maskPath:(id)a5
{
  return (_TtC8Freeform17CRLCommandSetMask *)sub_10099800C((char *)a3, a4, a5);
}

- (_TtC8Freeform17CRLCommandSetMask)init
{
  _TtC8Freeform17CRLCommandSetMask *result;

  result = (_TtC8Freeform17CRLCommandSetMask *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetMask", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
