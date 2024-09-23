@implementation CRLBoardItemBase

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_store));
}

- (NSUUID)id
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v8 = *(void (**)(uint64_t))(*(_QWORD *)v7 + 256);
  v9 = self;
  v10 = swift_retain(v7);
  v8(v10);

  swift_release(v7);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (NSUUID)parentUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(__n128);
  _TtC8Freeform16CRLBoardItemBase *v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v3 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v7 = *(void (**)(__n128))(*(_QWORD *)v6 + 264);
  v8 = self;
  v9 = swift_retain(v6);
  v7(v9);

  swift_release(v6);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSUUID *)isa;
}

- (CRLCanvasInfoGeometry)geometry
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 288);
  v4 = self;
  v5 = swift_retain(v2);
  v6 = (void *)v3(v5);

  swift_release(v2);
  return (CRLCanvasInfoGeometry *)v6;
}

- (void)setGeometry:(id)a3
{
  _TtC8Freeform16CRLBoardItemBase *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100776700(v5);

}

- (BOOL)locked
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 312);
  v4 = self;
  v5 = swift_retain(v2);
  LOBYTE(v3) = v3(v5);

  swift_release(v2);
  return v3 & 1;
}

- (void)setLocked:(BOOL)a3
{
  _TtC8Freeform16CRLBoardItemBase *v4;

  v4 = self;
  sub_1007768D8(a3);

}

- (BOOL)canBeGrouped
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 312);
  v4 = self;
  v5 = swift_retain(v2);
  LOBYTE(v3) = v3(v5);

  swift_release(v2);
  return (v3 & 1) == 0;
}

- (BOOL)aspectRatioLocked
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 336);
  v4 = self;
  v5 = swift_retain(v2);
  LOBYTE(v3) = v3(v5);

  swift_release(v2);
  return v3 & 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  _TtC8Freeform16CRLBoardItemBase *v4;

  v4 = self;
  sub_100776A8C(a3);

}

- (NSString)accessibilityDescription
{
  uint64_t v2;
  void (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)v2 + 360);
  v4 = self;
  v5 = swift_retain(v2);
  v3(v5);
  v7 = v6;

  swift_release(v2);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (void)setAccessibilityDescription:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform16CRLBoardItemBase *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100776E58(v4, v6);

  swift_bridgeObjectRelease();
}

- (CRLShadow)shadow
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform16CRLBoardItemBase *v4;
  uint64_t v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 384);
  v4 = self;
  v5 = swift_retain(v2);
  v6 = (void *)v3(v5);

  swift_release(v2);
  return (CRLShadow *)v6;
}

- (void)setShadow:(id)a3
{
  _TtC8Freeform16CRLBoardItemBase *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100776C40(a3);

}

- (BOOL)enableDefaultFloatingEffect
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  return sub_10077BB24(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_10077B870);
}

- (BOOL)crl_isEqualValue:(id)a3
{
  return sub_10077BB24(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_100776558);
}

- (int64_t)hash
{
  _TtC8Freeform16CRLBoardItemBase *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_10077BBDC();

  return v3;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  uint64_t v3;
  uint64_t (*v4)(__n128);
  _TtC8Freeform16CRLBoardItemBase *v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v4 = *(uint64_t (**)(__n128))(*(_QWORD *)v3 + 568);
  v5 = self;
  v6 = swift_retain(v3);
  v7 = v4(v6);
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)v3 + 576))();
  sub_100A634F4(v7);
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = sub_100AF7994(v10);
  swift_bridgeObjectRelease();
  sub_100A634F4(v8);
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = sub_100AF7994(v13);
  swift_bridgeObjectRelease();
  sub_100CA03B4(v14, v11);

  swift_release(v3);
  type metadata accessor for UUID(0);
  sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)isSupported
{
  unint64_t v2;

  v2 = (*(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData))[3];
  return sub_1001E9730() >= v2;
}

- (BOOL)needsDownload
{
  _TtC8Freeform16CRLBoardItemBase *v2;
  char v3;

  v2 = self;
  v3 = sub_100772DAC();

  return v3 & 1;
}

- (NSArray)stringContentForSearch
{
  _TtC8Freeform16CRLBoardItemBase *v2;
  Class isa;

  v2 = self;
  sub_1007763B0();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_TtC8Freeform16CRLBoardItemBase)init
{
  _TtC8Freeform16CRLBoardItemBase *result;

  result = (_TtC8Freeform16CRLBoardItemBase *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardItemBase", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData));
}

@end
