@implementation MathRecognitionViewControllerDelegate

- (id)mathViewControllerDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v10;
  uint64_t v11;
  uint64_t v12;
  PKDrawing *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  MathRecognitionViewControllerDelegate.mathViewControllerDrawing(_:)((uint64_t)v8);

  v11 = type metadata accessor for PKDrawing();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    PKDrawing._bridgeToObjectiveC()(v13);
    v14 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }
  return v14;
}

- (id)mathViewControllerTiledView:(id)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t (*v7)(void);
  id v8;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v9;
  void *v10;

  v5 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas, a2);
  if (v5)
  {
    v6 = v5;
    v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x320);
    v8 = a3;
    v9 = self;
    v10 = (void *)v7();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3
{
  id v6;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v7;
  CGAffineTransform *result;
  __int128 v9;
  __int128 v10;
  __int128 v11[3];

  v6 = a4;
  v7 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewControllerDrawingTransform(_:)(v11);

  v9 = v11[1];
  v10 = v11[2];
  *(_OWORD *)&retstr->a = v11[0];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = v10;
  return result;
}

- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3
{
  id v4;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v5;
  double v6;

  v4 = a3;
  v5 = self;
  v6 = specialized MathRecognitionViewControllerDelegate.mathViewControllerLatestEnd(ofStrokeTimestamp:)();

  return v6;
}

- (void)mathViewControllerUpdateFrameForContainer:(id)a3
{
  id v4;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v5;

  v4 = a3;
  v5 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewControllerUpdateFrame(forContainer:)();

}

- (id)mathViewController:(id)a3 expressionIdentifiersForExistingGraphNearLocation:(CGPoint)a4
{
  double y;
  double x;
  objc_class *v8;
  Class isa;
  uint64_t (*v10)(double, double);
  id v11;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v12;
  uint64_t v13;

  y = a4.y;
  x = a4.x;
  v8 = (objc_class *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas, a2);
  isa = v8;
  if (v8)
  {
    v10 = *(uint64_t (**)(double, double))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v8) + 0x740);
    v11 = a3;
    v12 = self;
    v13 = v10(x, y);

    if (v13)
    {
      isa = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      isa = 0;
    }
  }
  return isa;
}

- (void)mathViewController:(id)a3 addGraphForExpression:(id)a4 range:(CGRect)a5 identifier:(id)a6 expressionLocation:(CGPoint)a7 addToExisting:(BOOL)a8
{
  _BOOL8 v8;
  double y;
  double x;
  double height;
  double width;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8, double, double, double, double, double, double);
  id v25;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v26;
  id v27;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v28;

  v8 = a8;
  y = a7.y;
  x = a7.x;
  height = a5.size.height;
  width = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v21 = v20;
  v22 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v22)
  {
    v23 = v22;
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8, double, double, double, double, double, double))((*MEMORY[0x1E0DEEDD8] & *v22) + 0x738);
    v25 = a3;
    v26 = self;
    v24(v16, v18, v19, v21, v8, v14, v13, width, height, x, y);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v27 = a3;
    v28 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v14;

  type metadata accessor for UUID();
  lazy protocol witness table accessor for type UUID and conformance UUID();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PKMathRecognitionItem);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = a3;
  v14 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:didUpdateExpressions:newExpressions:removedExpressions:mathItems:)(v9, v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 replaceStrokes:(id)a4 withStrokes:(id)a5
{
  id v7;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v8;

  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:replace:with:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 setHiddenStrokes:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  void (*v8)(uint64_t);
  id v9;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v10;
  id v11;

  type metadata accessor for PKStroke();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v7)
  {
    v8 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x508);
    v11 = v7;
    v9 = a3;
    v10 = self;
    v8(v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)mathViewController:(id)a3 createScrubberControllerForView:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v11;
  id v12;

  v8 = objc_allocWithZone((Class)type metadata accessor for CalculateScrubberController());
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = a3;
  v11 = self;
  v12 = specialized CalculateScrubberController.init(view:delegate:)();

  swift_unknownObjectRelease();
  return v12;
}

- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v14;
  void *v15;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  v13 = a3;
  v14 = self;
  v15 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetViewControllerForExpression:latex:fontSize:)(a6, v10, v12, a5);

  swift_bridgeObjectRelease();
  return v15;
}

- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v14;
  void *v15;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  v13 = a3;
  v14 = self;
  v15 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetImageForExpression:latex:fontSize:)(a6, v10, v12, a5);

  swift_bridgeObjectRelease();
  return v15;
}

- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6
{
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v16;
  void *v17;
  uint64_t v19;

  v7 = a5;
  v10 = type metadata accessor for UUID();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = a3;
  v16 = self;
  v17 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetImageForItemUUID:showResult:fontSize:)((uint64_t)v14, v7, a6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return v17;
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7
{
  _BOOL8 v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v19;
  id v20;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v21;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v22;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v23;
  uint64_t v24;

  v10 = a4;
  v13 = type metadata accessor for PKStroke();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3;
  v19 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)a5;
  v20 = a6;
  v21 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  v22 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)MEMORY[0x1DF0E666C]((char *)v21+ OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v22)
  {
    v23 = v22;
    (*(void (**)(_BOOL8, char *, unint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v22->super.isa)
                                                                     + 0x730))(v10, v17, a7, 0);

    v19 = v21;
    v21 = v23;
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8
{
  _BOOL8 v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v20;
  id v21;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v22;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v23;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v24;
  uint64_t v25;
  _BOOL4 v26;

  v26 = a8;
  v11 = a4;
  v14 = type metadata accessor for PKStroke();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a3;
  v20 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)a5;
  v21 = a6;
  v22 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  v23 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)MEMORY[0x1DF0E666C]((char *)v22+ OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v23)
  {
    v24 = v23;
    (*(void (**)(_BOOL8, char *, unint64_t, _BOOL4))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v23->super.isa)
                                                                     + 0x730))(v11, v18, a7, v26);

    v20 = v22;
    v22 = v24;
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

- (void)mathViewController:(id)a3 selectStrokes:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v8;

  type metadata accessor for PKStroke();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:select:)(v6);

  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 updatedResult:(id)a4 strokes:(id)a5 expressionUUID:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v16;
  uint64_t v17;

  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PKStroke();
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = a3;
  v16 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:updatedResult:strokes:expressionUUID:)(v14, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (id)mathViewController:(id)a3 resultForLocale:(id)a4 itemUUID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = a3;
  v18 = self;
  v19 = specialized MathRecognitionViewControllerDelegate.mathViewController(_:resultFor:itemUUID:)((uint64_t)v16, (uint64_t)v11);
  v21 = v20;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  if (!v21)
    return 0;
  v22 = (void *)MEMORY[0x1DF0E41AC](v19, v21);
  swift_bridgeObjectRelease();
  return v22;
}

- (_TtC8PaperKit37MathRecognitionViewControllerDelegate)init
{
  _TtC8PaperKit37MathRecognitionViewControllerDelegate *result;

  result = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_controller));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_viewController));
}

@end
