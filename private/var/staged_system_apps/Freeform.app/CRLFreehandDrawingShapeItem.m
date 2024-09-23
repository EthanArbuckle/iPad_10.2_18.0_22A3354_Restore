@implementation CRLFreehandDrawingShapeItem

- (BOOL)isAllowedInFreehandDrawings
{
  return 1;
}

- (BOOL)excludedFromMultiselectResizeInfo
{
  return 1;
}

- (BOOL)shouldForceStrokesToPencilKit
{
  return 1;
}

- (BOOL)isFreehandDrawingShape
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;

  v2 = self;
  sub_100B06D98();

  return 1;
}

- (NSString)localizedName
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  NSString v3;

  v2 = self;
  sub_100B06F60();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSArray)pencilKitStrokes
{
  return (NSArray *)sub_100B094F4(self, (uint64_t)a2, sub_100B08F4C);
}

- (NSArray)pencilKitStrokesInParentSpace
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSArray v6;

  v2 = self;
  v4 = sub_100B0FD1C((uint64_t)v2, v3);
  swift_bridgeObjectRetain(v4);

  if (v4)
  {
    type metadata accessor for PKStroke(0, v5);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }
  return (NSArray *)v6.super.isa;
}

- (NSArray)pencilKitStrokesInRootSpace
{
  return (NSArray *)sub_100B094F4(self, (uint64_t)a2, (uint64_t (*)(void))sub_100B09554);
}

- (CRLCanvasInfoGeometry)geometry
{
  uint64_t v2;
  uint64_t (*v3)(__n128);
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v4;
  __n128 v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(__n128))(*(_QWORD *)v2 + 288);
  v4 = self;
  v5 = swift_retain(v2);
  v6 = (void *)v3(v5);

  swift_release(v2);
  return (CRLCanvasInfoGeometry *)v6;
}

- (void)setGeometry:(id)a3
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v4;
  _QWORD *Strong;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v4 = self;
  sub_100776700(v8);
  Strong = (_QWORD *)swift_unknownObjectWeakLoadStrong((char *)v4 + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  if (Strong
    && (v6 = Strong, v7 = (*(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2F0))(),
                     v6,
                     (v7 & 1) != 0))
  {

  }
  else
  {
    *(Class *)((char *)&v4->super.super.super.super.super.isa
             + OBJC_IVAR____TtC8Freeform27CRLFreehandDrawingShapeItem_cachedPencilKitStrokesInParentSpace) = 0;

    swift_bridgeObjectRelease();
  }
}

- (CRLStroke)stroke
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100B09ABC();

  return (CRLStroke *)v3;
}

- (void)setStroke:(id)a3
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100B0FBD0(a3);

}

- (CRLPathSource)pathSource
{
  _QWORD *v3;
  uint64_t v4;
  CRLPathSource *result;
  uint64_t (*v6)(__n128);
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v7;
  __n128 v8;
  void *v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v4 = *v3;
  result = (CRLPathSource *)swift_conformsToProtocol2(*v3, &protocol descriptor for CRLAbstractShapeItemDataProtocol);
  if (result)
  {
    v6 = *(uint64_t (**)(__n128))(v4 + 704);
    v7 = self;
    v8 = swift_retain(v3);
    v9 = (void *)v6(v8);

    swift_release(v3);
    return (CRLPathSource *)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setPathSource:(id)a3
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100B0FC7C(v5);

}

- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100B09D74();

  return (CRLPKStrokePathCompactData *)v3;
}

- (void)setPencilKitStrokePathCompactData:(id)a3
{
  id v5;
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v6;

  v5 = a3;
  v6 = self;
  sub_100B09FA4(a3);

}

- (CRLBezierPath)maskPath
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  id v3;

  v2 = self;
  v3 = sub_100B0A4C4();

  return (CRLBezierPath *)v3;
}

- (void)setMaskPath:(id)a3
{
  id v5;
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v6;

  v5 = a3;
  v6 = self;
  sub_100B0A720(a3);

}

- (BOOL)canSnapToShape
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100B0AC50();

  return v3;
}

- (BOOL)hasSnappedToShape
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v11;
  uint64_t v12;
  int v13;
  _BYTE v16[24];

  v3 = type metadata accessor for CRLShapeItemParentAffinity(0);
  __chkstk_darwin(v3);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_1004B804C(&qword_1013F5530);
  __chkstk_darwin(v6);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*(_UNKNOWN ****)v9 != &off_1013E3B70)
    v9 = 0;
  v10 = v9 + *(_QWORD *)(*(_QWORD *)v9 + 632);
  swift_beginAccess(v10, v16, 0, 0);
  sub_1004CB7BC(v10, (uint64_t)v8, &qword_1013F5530);
  v11 = self;
  v12 = sub_1004B804C((uint64_t *)&unk_101406B00);
  CRRegister.wrappedValue.getter(v12);
  sub_1004CB800((uint64_t)v8, &qword_1013F5530);
  v13 = v5[*(int *)(v3 + 28) + 8];
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLShapeItemParentAffinity);

  return v13 != 255;
}

- (int64_t)snappedShapeType
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_100B0AF64();

  return v3;
}

- (void)setSnappedShapeType:(int64_t)a3
{
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v4;

  v4 = self;
  sub_100B0B104(a3);

}

- (id)commandsToUpdateModelToMatch:(id)a3
{
  id v4;
  _TtC8Freeform27CRLFreehandDrawingShapeItem *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_100B0B324((uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform27CRLFreehandDrawingShapeItem_cachedPencilKitStrokes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform27CRLFreehandDrawingShapeItem_cachedPencilKitStrokesInParentSpace));
}

- (_TtC8Freeform27CRLFreehandDrawingShapeItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 fill:(id)a7 stroke:(id)a8 headLineEnd:(id)a9 tailLineEnd:(id)a10 pencilKitStrokePathCompactData:(id)a11 maskPath:(id)a12
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v31[2];

  v31[0] = a8;
  v31[1] = self;
  v17 = type metadata accessor for UUID(0);
  __chkstk_darwin(v17);
  v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = v31[0];
  v25 = v31[0];
  v26 = a9;
  v27 = a10;
  v28 = a11;
  v29 = a12;
  return (_TtC8Freeform27CRLFreehandDrawingShapeItem *)sub_100B0BAB0((uint64_t)v20, (uint64_t)v19, v21, v22, a7, v24, a9, a10, a11, a12);
}

+ (id)crlaxDescriptionFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSString v10;
  _QWORD *v12;

  v4 = type metadata accessor for CRLFreehandDrawingShapeItem(0);
  v5 = sub_1004B7878(&qword_101405AF0, type metadata accessor for CRLFreehandDrawingShapeItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v4, v5);
  v12 = _swiftEmptyDictionarySingleton;
  sub_100B0633C(v6, &v12);
  swift_bridgeObjectRetain(v12);
  v8 = sub_100B06628(v7, (uint64_t *)&v12);
  swift_bridgeObjectRelease();
  v9 = sub_100520824(v8);
  swift_bridgeObjectRelease();
  sub_1008858E4((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v10;
}

@end
