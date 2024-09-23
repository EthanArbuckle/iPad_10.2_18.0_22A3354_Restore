@implementation CRLBoardItemFactory

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board)
                                                                                     + OBJC_IVAR____TtC8Freeform8CRLBoard_store));
}

- (NSUUID)rootContainerUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(__n128);
  _TtC8Freeform19CRLBoardItemFactory *v10;
  char *v11;
  __n128 v12;
  Class isa;
  uint64_t v15;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board)
                + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  v8 = *(_QWORD *)&v7[OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData];
  v9 = *(void (**)(__n128))(*(_QWORD *)v8 + 256);
  v10 = self;
  v11 = v7;
  v12 = swift_retain(v8);
  v9(v12);

  swift_release(v8);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (_TtP8Freeform14CRLAssetOwning_)assetOwner
{
  return (_TtP8Freeform14CRLAssetOwning_ *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_board));
}

- (id)makeGroupItemWithGeometry:(id)a3
{
  id v4;
  _TtC8Freeform19CRLBoardItemFactory *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100CF1E58(v4);

  return v6;
}

- (id)makeFreehandDrawingItemWithGeometry:(id)a3
{
  id v4;
  _TtC8Freeform19CRLBoardItemFactory *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100CF3564(v4);

  return v6;
}

- (id)makeImageItemWithGeometry:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  _TtC8Freeform19CRLBoardItemFactory *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v24;

  v9 = sub_1004B804C((uint64_t *)&unk_1013E9BE0);
  __chkstk_darwin(v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CRLAssetData(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a3;
  v17 = a4;
  v18 = self;
  v19 = a5;
  sub_100CF36F4((uint64_t)v17, (uint64_t)v15);
  if (v19)
  {
    v20 = v19;
    sub_100CF36F4((uint64_t)v20, (uint64_t)v11);

    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v21, 1, v12);
  v22 = sub_100CF390C(v16, (uint64_t)v15, (uint64_t)v11);
  sub_1004CB800((uint64_t)v11, (uint64_t *)&unk_1013E9BE0);
  sub_1004B84A4((uint64_t)v15, type metadata accessor for CRLAssetData);

  return v22;
}

- (id)makeMovieItemWithGeometry:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  _TtC8Freeform19CRLBoardItemFactory *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v26;

  v11 = sub_1004B804C((uint64_t *)&unk_1013E9BE0);
  __chkstk_darwin(v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for CRLAssetData(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3;
  v19 = a4;
  v20 = self;
  v21 = a5;
  sub_100CF36F4((uint64_t)v19, (uint64_t)v17);
  if (v21)
  {
    v22 = v21;
    sub_100CF36F4((uint64_t)v22, (uint64_t)v13);

    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v23, 1, v14);
  v24 = sub_100CF3DD4(v18, (uint64_t)v17, (uint64_t)v13, a6);
  sub_1004CB800((uint64_t)v13, (uint64_t *)&unk_1013E9BE0);
  sub_1004B84A4((uint64_t)v17, type metadata accessor for CRLAssetData);

  return v24;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _TtC8Freeform19CRLBoardItemFactory *v9;
  id v10;
  _QWORD v12[31];
  _BYTE v13[248];

  v5 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v5);
  v7 = (_QWORD *)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_10054F488((uint64_t)v13);
  sub_1004C4938((uint64_t)v13, (uint64_t)v12, &qword_1013E1B50);
  v9 = self;
  v10 = sub_100CF4294(a3, 0, 0, 0, 0, 0, 1, 0, 1, (_QWORD *)1, (void *)1, (void *)1, (void *)1, 0, v7, v12, 0, 0, 0);
  sub_1004CB800((uint64_t)v7, (uint64_t *)&unk_1013F1500);

  return v10;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  _TtC8Freeform19CRLBoardItemFactory *v12;
  id v13;
  _QWORD v15[31];
  _BYTE v16[248];

  v7 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v7);
  v9 = (_QWORD *)((char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_10054F488((uint64_t)v16);
  sub_1004C4938((uint64_t)v16, (uint64_t)v15, &qword_1013E1B50);
  v11 = a4;
  v12 = self;
  v13 = sub_100CF4294(a3, 0, a4, 0, 0, 0, 1, 0, 1, (_QWORD *)1, (void *)1, (void *)1, (void *)1, 0, v9, v15, 0, 0, 0);
  sub_1004CB800((uint64_t)v9, (uint64_t *)&unk_1013F1500);

  return v13;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _TtC8Freeform19CRLBoardItemFactory *v15;
  id v16;
  _QWORD v19[31];
  _BYTE v20[256];

  v5 = *(_QWORD *)&a5.y;
  v6 = *(_QWORD *)&a5.x;
  v10 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v10);
  v12 = (_QWORD *)((char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_10054F488((uint64_t)v20);
  sub_1004C4938((uint64_t)v20, (uint64_t)v19, &qword_1013E1B50);
  v14 = a4;
  v15 = self;
  v16 = sub_100CF4294(a3, 0, a4, 0, v6, v5, 0, 0, 1, (_QWORD *)1, (void *)1, (void *)1, (void *)1, 0, v12, v19, 0, 0, 0);
  sub_1004CB800((uint64_t)v12, (uint64_t *)&unk_1013F1500);

  return v16;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  _TtC8Freeform19CRLBoardItemFactory *v16;
  id v17;
  uint64_t v19;
  _BOOL4 v20;
  _QWORD v21[31];
  _BYTE v22[256];

  v6 = *(_QWORD *)&a6.y;
  v7 = *(_QWORD *)&a6.x;
  v20 = a5;
  v11 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v11);
  v13 = (uint64_t *)((char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_10054F488((uint64_t)v22);
  sub_1004C4938((uint64_t)v22, (uint64_t)v21, &qword_1013E1B50);
  v15 = a4;
  v16 = self;
  v17 = sub_100CF4294(a3, 0, a4, v20, v7, v6, 0, 0, 1, (_QWORD *)1, (void *)1, (void *)1, (void *)1, 0, v13, v21, 0, 0, 0);
  sub_1004CB800((uint64_t)v13, (uint64_t *)&unk_1013F1500);

  return v17;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  _TtC8Freeform19CRLBoardItemFactory *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  _QWORD v23[31];
  _BYTE v24[256];

  v8 = *(_QWORD *)&a6.y;
  v9 = *(_QWORD *)&a6.x;
  v22 = a5;
  v21 = a3;
  v12 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v12);
  v14 = (uint64_t *)((char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_10054F488((uint64_t)v24);
  sub_1004C4938((uint64_t)v24, (uint64_t)v23, &qword_1013E1B50);
  v16 = a4;
  v17 = self;
  v18 = sub_100CF4294(v21, 0, a4, v22, v9, v8, 0, *(void **)&a7, 0, (_QWORD *)1, (void *)1, (void *)1, (void *)1, 0, v14, v23, 0, 0, 0);
  sub_1004CB800((uint64_t)v14, (uint64_t *)&unk_1013F1500);

  return v18;
}

- (id)makeShapeItemWithShapeType:(int64_t)a3 pathSource:(id)a4 preservePathSourceSize:(BOOL)a5 position:(CGPoint)a6 angleInDegrees:(double)a7 stroke:(id)a8 fill:(id)a9 headLineEnd:(id)a10 tailLineEnd:(id)a11
{
  CGFloat y;
  CGFloat x;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  _TtC8Freeform19CRLBoardItemFactory *v25;
  id v26;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _TtC8Freeform19CRLBoardItemFactory *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  _BOOL4 v37;
  _QWORD v38[31];
  _BYTE v39[256];

  y = a6.y;
  x = a6.x;
  v37 = a5;
  v36 = a3;
  v32 = self;
  v18 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v18);
  v20 = (uint64_t *)((char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = *(_QWORD *)&y;
  v34 = *(_QWORD *)&x;
  v35 = a7;
  v21 = type metadata accessor for CRLWPStorageCRDTData(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_10054F488((uint64_t)v39);
  sub_1004C4938((uint64_t)v39, (uint64_t)v38, &qword_1013E1B50);
  v31 = a4;
  v22 = a8;
  v30 = a8;
  v29 = a9;
  v23 = a10;
  v24 = a11;
  v25 = v32;
  v26 = sub_100CF4294(v36, 0, a4, v37, v34, v33, 0, *(void **)&v35, 0, v22, a9, a10, a11, 0, v20, v38, 0, 0, 0);
  sub_1004CB800((uint64_t)v20, (uint64_t *)&unk_1013F1500);

  return v26;
}

- (id)makeShapeItemForShapeLibrarySwatchWithShapeType:(int64_t)a3 pathSource:(id)a4 position:(CGPoint)a5 angleInDegrees:(double)a6
{
  double y;
  double x;
  id v11;
  _TtC8Freeform19CRLBoardItemFactory *v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v11 = a4;
  v12 = self;
  v13 = sub_100CF63E4(a3, v11, x, y, a6);

  return v13;
}

- (id)makeShapeItemForFreehandDrawingWithPathSource:(id)a3 position:(CGPoint)a4 stroke:(id)a5 fill:(id)a6 pencilKitStrokePathCompactData:(id)a7 maskPath:(id)a8
{
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _TtC8Freeform19CRLBoardItemFactory *v20;
  id v21;

  y = a4.y;
  x = a4.x;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = self;
  v21 = sub_100CF67F4(v15, a5, a6, a7, a8, x, y);

  return v21;
}

- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 adjustedBaseWidth:(double)a4
{
  return sub_100CF6AD4(self, (uint64_t)a2, a3, (SEL *)&selRef_freehandDrawingShapeItemsFromPKStroke_adjustedBaseWidth_boardItemFactory_, a4);
}

- (id)makeShapeItemsForFreehandDrawingWithPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4
{
  return sub_100CF6AD4(self, (uint64_t)a2, a3, (SEL *)&selRef_freehandDrawingShapeItemsFromPKStroke_unadjustedPencilKitBaseWidth_boardItemFactory_, a4);
}

- (id)makeShapeItemForDiagramWithConnectingTo:(id)a3 with:(id)a4 shapeType:(int64_t)a5
{
  id v8;
  id v9;
  _TtC8Freeform19CRLBoardItemFactory *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_100CF2F10(v8, v9, a5);

  return v11;
}

- (id)blockToRunCommandToPostProcessWithNewBoardItem:(id)a3 shapeType:(int64_t)a4 infosToConnect:(id)a5 commandController:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  id v15;
  _TtC8Freeform19CRLBoardItemFactory *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD *v30;

  v11 = type metadata accessor for CRLBoardItem(0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  v13 = sub_100CF9A1C(a4);
  v14 = a3;
  v15 = a6;
  v16 = self;
  if (!v13
    || (v17 = type metadata accessor for CRLConnectionLineItem(0), (v18 = swift_dynamicCastClass(v14, v17)) == 0))
  {

    swift_bridgeObjectRelease();
LABEL_7:
    v22 = 0;
    v23 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:);
    goto LABEL_8;
  }
  v19 = v18;
  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0)
      v26 = v12;
    else
      v26 = v12 & 0xFFFFFFFFFFFFFF8;
    v27 = v14;
    swift_bridgeObjectRetain(v12);
    v28 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease();
    if (v28 > 0)
      goto LABEL_5;
    goto LABEL_13;
  }
  v20 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  v21 = v14;
  if (v20 <= 0)
  {
LABEL_13:

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
LABEL_5:
  v22 = (_QWORD *)swift_allocObject(&unk_1012A0930, 40, 7);
  v22[2] = v15;
  v22[3] = v19;
  v22[4] = v12;

  v23 = sub_100CF9A88;
LABEL_8:

  v29[4] = v23;
  v30 = v22;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = *(_QWORD *)"";
  v29[2] = sub_1005D2FC0;
  v29[3] = &unk_1012A08F8;
  v24 = _Block_copy(v29);
  swift_release(v30);
  return v24;
}

- (id)makeTextboxItemWithString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform19CRLBoardItemFactory *v8;
  void *v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v7 = v6;
  v8 = self;
  v9 = (void *)sub_100CF14E0(v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)makeTextboxItemWithPosition:(CGPoint)a3 string:(id)a4
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8Freeform19CRLBoardItemFactory *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v10 = v9;
  v11 = self;
  v12 = (void *)sub_100CF7278(x, y, v8, v10);

  swift_bridgeObjectRelease();
  return v12;
}

- (id)makeTextboxItemWithAttributedString:(id)a3
{
  char *v4;
  _TtC8Freeform19CRLBoardItemFactory *v5;
  void *v6;

  v4 = (char *)a3;
  v5 = self;
  v6 = (void *)sub_100CF2354(v4);

  return v6;
}

- (id)makeTextBoxItemWithStorage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  id result;
  __n128 v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  id v14;
  _TtC8Freeform19CRLBoardItemFactory *v15;
  void *v16;
  _BYTE v17[248];
  _QWORD v18[31];

  v5 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for CRLWPStorageCRDTData(0);
  v10 = __chkstk_darwin(v8);
  v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform12CRLWPStorage_shapeItemData);
  if (v13)
  {
    (*(void (**)(__n128))(*(_QWORD *)v13 + 760))(v10);
    sub_1004B8460((uint64_t)&v7[*(int *)(v5 + 20)], (uint64_t)v12, type metadata accessor for CRLWPStorageCRDTData);
    v14 = a3;
    v15 = self;
    sub_1004B84A4((uint64_t)v7, type metadata accessor for CRLWPShapeItemCRDTData);
    sub_10054F488((uint64_t)v17);
    sub_1004C4938((uint64_t)v17, (uint64_t)v18, &qword_1013E1B50);
    v16 = (void *)sub_100CF19A8((uint64_t)v12, v18);
    sub_1004B84A4((uint64_t)v12, type metadata accessor for CRLWPStorageCRDTData);

    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)makeStickyNoteItem
{
  id v3;
  _TtC8Freeform19CRLBoardItemFactory *v4;
  id v5;
  void *v6;

  v3 = objc_allocWithZone((Class)NSAttributedString);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  v6 = sub_100CF24F0(v5);

  return v6;
}

- (id)makeStickyNoteItemWithAttributedString:(id)a3
{
  id v4;
  _TtC8Freeform19CRLBoardItemFactory *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100CF24F0(v4);

  return v6;
}

- (id)makeFileItemWithFileData:(id)a3 posterImageData:(id)a4 title:(id)a5 geometry:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC8Freeform19CRLBoardItemFactory *v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = self;
  v13 = (void *)sub_100CF960C((uint64_t)v9, (uint64_t)v10, v11);

  return v13;
}

- (id)makeURLItemWithGeometry:(id)a3 metadataAsset:(id)a4 url:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8Freeform19CRLBoardItemFactory *v15;
  id v16;
  uint64_t v18;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_100CF77E0(v13, (uint64_t)a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (id)makeDuplicateOfBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform19CRLBoardItemFactory *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_100CF1B2C(v4);

  return v6;
}

- (id)makeDuplicateOfBoardItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform19CRLBoardItemFactory *v7;
  double *v8;
  NSArray v9;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  v8 = sub_100CF7A5C(v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (_TtC8Freeform19CRLBoardItemFactory)init
{
  _TtC8Freeform19CRLBoardItemFactory *result;

  result = (_TtC8Freeform19CRLBoardItemFactory *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardItemFactory", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform19CRLBoardItemFactory_insertStyleSettings, type metadata accessor for CRLBoardInsertStyleData);
}

@end
