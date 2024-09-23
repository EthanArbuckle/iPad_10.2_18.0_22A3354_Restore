@implementation CRLUSDZEditor

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v9;
  id v10;
  _TtC8Freeform13CRLUSDZEditor *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1006EB7F8((uint64_t)a3, v10, a5);

}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform13CRLUSDZEditor *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  sub_1006EC5F8(v7, x, y);

}

- (_TtC8Freeform13CRLUSDZEditor)initWithInteractiveCanvasController:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUSDZEditor____lazy_storage___commandProvider) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUSDZEditor();
  return -[CRLBoardItemEditor initWithInteractiveCanvasController:](&v5, "initWithInteractiveCanvasController:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform13CRLUSDZEditor____lazy_storage___commandProvider));
}

- (void)showMediaReplaceUI:(id)a3
{
  _TtC8Freeform13CRLUSDZEditor *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v10, a3);
  swift_unknownObjectRelease(a3);
  v6 = objc_msgSend(objc_allocWithZone((Class)CRLMediaReplacingHelper), "initWithEditor:", v5);
  v7 = v11;
  v8 = sub_1004BB5A4(v10, v11);
  v9 = _bridgeAnythingToObjectiveC<A>(_:)(v8, v7);
  objc_msgSend(v6, "showMediaReplaceUI:", v9);

  swift_unknownObjectRelease(v9);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _TtC8Freeform13CRLUSDZEditor *v14;

  v8 = _Block_copy(a5);
  v9 = type metadata accessor for CRLAsset();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  if (!a4)
  {
    v11 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v12;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = swift_allocObject(&unk_101279118, 24, 7);
  *(_QWORD *)(v13 + 16) = v8;
  v8 = sub_10069934C;
LABEL_6:
  v14 = self;
  sub_1006ECBDC(v10, v11, a4, v8, v13);
  sub_1004C1024((uint64_t)v8, v13);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(a4);
}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _TtC8Freeform13CRLUSDZEditor *v18;
  uint64_t v19;

  v12 = _Block_copy(a7);
  v13 = type metadata accessor for URL(0);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  if (a5)
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  if (!a6)
  {
    v15 = 0;
    if (v12)
      goto LABEL_5;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v16;
  if (!v12)
    goto LABEL_7;
LABEL_5:
  v17 = swift_allocObject(&unk_1012790C8, 24, 7);
  *(_QWORD *)(v17 + 16) = v12;
  v12 = sub_100565828;
LABEL_8:
  v18 = self;
  swift_unknownObjectRetain(a3);
  sub_1006ECDD8(v19, v14, (Class)a5, v15, a6, v12, v17);
  sub_1004C1024((uint64_t)v12, v17);
  swift_unknownObjectRelease(a3);

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
}

- (NSSet)selectedObjectsSupportingReplacement
{
  _TtC8Freeform13CRLUSDZEditor *v2;
  NSSet *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = self;
  v3 = -[CRLBoardItemEditor boardItems](v2, "boardItems");
  v4 = type metadata accessor for CRLBoardItem(0);
  v5 = sub_10058528C();
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v3, v4, v5);

  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSSet *)isa;
}

@end
