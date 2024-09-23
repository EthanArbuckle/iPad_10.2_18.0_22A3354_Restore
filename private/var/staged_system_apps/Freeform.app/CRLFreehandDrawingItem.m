@implementation CRLFreehandDrawingItem

- (PKRecognitionController)pkRecognitionController
{
  return (PKRecognitionController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController));
}

- (void)setPkRecognitionController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController) = (Class)a3;
  v3 = a3;

}

- (PKDrawing)cachedPKDrawing
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_1004B804C(&qword_1013F07A0);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, &qword_1013F07A0);
  v7 = type metadata accessor for PKDrawing(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = PKDrawing._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (PKDrawing *)isa;
}

- (void)setCachedPKDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _TtC8Freeform22CRLFreehandDrawingItem *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8Freeform22CRLFreehandDrawingItem *v12;
  char *v13;
  _BYTE v15[24];

  v5 = sub_1004B804C(&qword_1013F07A0);
  __chkstk_darwin(v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    v8 = self;
    v9 = a3;
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)(a3);

    v10 = type metadata accessor for PKDrawing(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for PKDrawing(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
    v12 = self;
  }
  v13 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing, v15, 33, 0);
  sub_100582338((uint64_t)v7, (uint64_t)v13, &qword_1013F07A0);
  swift_endAccess(v15);

}

- (CGRect)unrotatedFrameAtDataDetection
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10073055C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_unrotatedFrameAtDataDetection);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnrotatedFrameAtDataDetection:(CGRect)a3
{
  sub_10073057C((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_unrotatedFrameAtDataDetection);
}

- (CGRect)unscaledFrameAtDataDetection
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10073055C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_unscaledFrameAtDataDetection);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnscaledFrameAtDataDetection:(CGRect)a3
{
  sub_10073057C((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_unscaledFrameAtDataDetection);
}

- (double)rotationAtDataDetection
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_rotationAtDataDetection);
}

- (void)setRotationAtDataDetection:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_rotationAtDataDetection) = a3;
}

- (BOOL)prohibitsClustering
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform22CRLFreehandDrawingItem *v9;
  uint64_t v10;
  char v11;
  _BYTE v13[8];
  _BYTE v14[24];

  v3 = type metadata accessor for CRLFreehandDrawingCRDTData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v7 = type metadata accessor for CRLFreehandItemData(0);
  v8 = swift_dynamicCastClassUnconditional(v6, v7, 0, 0, 0) + qword_101481578;
  swift_beginAccess(v8, v14, 0, 0);
  sub_1004B8460(v8, (uint64_t)v5, type metadata accessor for CRLFreehandDrawingCRDTData);
  v9 = self;
  v10 = sub_1004B804C((uint64_t *)&unk_1013F5590);
  CRRegister.wrappedValue.getter(v10);
  v11 = v13[7];
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLFreehandDrawingCRDTData);

  return v11;
}

- (void)setProhibitsClustering:(BOOL)a3
{
  _TtC8Freeform22CRLFreehandDrawingItem *v4;

  v4 = self;
  sub_10088D060(a3);

}

- (BOOL)shouldBeTreatedAsBoxForConnectionLinesForPerf
{
  uint64_t v3;
  uint64_t v4;
  _TtC8Freeform22CRLFreehandDrawingItem *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  if (v4)
    v6 = v4;
  else
    v6 = (uint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v9 = v6;
    else
      v9 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v6);
    v7 = _CocoaArrayWrapper.endIndex.getter(v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v4);

  }
  swift_bridgeObjectRelease();
  return v7 > 500;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F6DC0, off_1012298A8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F6DB8, off_1012298B0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F6DB0, off_1012298A0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (void)_willAddNewItemWithItem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  _TtC8Freeform22CRLFreehandDrawingItem *v9;

  v5 = type metadata accessor for CRLFreehandDrawingShapeItem(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5, v6);
  v8 = a3;
  v9 = self;
  if ((objc_msgSend(v8, "isKindOfClass:", ObjCClassFromMetadata) & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"_willAddNewItem(item:)", 22, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingItem.swift", 93, 2, 94, "All items inserted into a freehand drawing should be freehand drawing shapes.", 77, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"_willAddNewItem(item:)", 22, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingItem.swift", 93, 2u, 94, (uint64_t)"All items inserted into a freehand drawing should be freehand drawing shapes.", 77, 2u);
  }

}

- (BOOL)isFreehandDrawing
{
  return 1;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_pkRecognitionController));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLFreehandDrawingItem_cachedPKDrawing, &qword_1013F07A0);
}

- (_TtC8Freeform22CRLFreehandDrawingItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a5;
  return (_TtC8Freeform22CRLFreehandDrawingItem *)sub_10088EEF0((uint64_t)v11, (uint64_t)v10, a5);
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 1;
}

@end
