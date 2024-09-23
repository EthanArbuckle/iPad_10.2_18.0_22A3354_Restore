@implementation CRLMathRecognitionItemsHandler

- (CRLFreehandDrawingRep)rep
{
  return (CRLFreehandDrawingRep *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep);
}

- (void)setRep:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep, a3);
}

- (PKMathRecognitionViewController)mathViewController
{
  return (PKMathRecognitionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController));
}

- (void)setMathViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController) = (Class)a3;
  v3 = a3;

}

- (double)lastStrokeTimestamp
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp);
}

- (void)setLastStrokeTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp) = a3;
}

- (OS_dispatch_queue)expressionsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_expressionsQueue));
}

- (BOOL)isPresentingPopoverUI
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI);
}

- (void)setIsPresentingPopoverUI:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI) = a3;
}

- (BOOL)shouldCallEditMenuTapForRep
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_shouldCallEditMenuTapForRep);
}

- (void)setShouldCallEditMenuTapForRep:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_shouldCallEditMenuTapForRep) = a3;
}

- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController
{
  _TtC8Freeform28CRLMathCalculationController *Strong;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v4;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v5;

  Strong = (_TtC8Freeform28CRLMathCalculationController *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep);
  if (Strong)
  {
    v4 = self;
    v5 = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)-[CRLMathCalculationController interactiveCanvasController](Strong, "interactiveCanvasController");

    if (v5)
    {
      Strong = -[CRLMathRecognitionItemsHandler mathCalculationController](v5, "mathCalculationController");

      v4 = v5;
    }
    else
    {
      Strong = 0;
    }

  }
  return Strong;
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)initWithRep:(id)a3 view:(id)a4 viewController:(id)a5
{
  return (_TtC8Freeform30CRLMathRecognitionItemsHandler *)sub_10075E360((char *)a3, (char *)a4, (char *)a5);
}

- (void)mathHintsModeChanged:(id)a3
{
  sub_10075E9E8(self, (uint64_t)a2, (uint64_t)a3, sub_10075E8C8);
}

- (void)deviceManagementRestrictionsChanged:(id)a3
{
  sub_10075E9E8(self, (uint64_t)a2, (uint64_t)a3, sub_10075E8C8);
}

- (void)updateMathSolvingStyle
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v2;

  v2 = self;
  sub_10075E8D8();

}

- (void)insertExpressionsIntoCalcDocWithPkExpressions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v7;

  v5 = sub_1004B8930(0, (unint64_t *)&unk_1013F0800, PKMathRecognitionItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10075EAF8(v6);

  swift_bridgeObjectRelease(v6);
}

- (void)willBeRemoved
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v2;

  v2 = self;
  sub_1007604C8();

}

- (void)redrawSubviews
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController), "redrawSubviews");
}

- (id)mathViewControllerDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v5 = sub_1004B804C(&qword_1013F07A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_100761224((uint64_t)v7);

  v10 = type metadata accessor for PKDrawing(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    isa = PKDrawing._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (id)mathViewControllerTiledView:(id)a3
{
  id v4;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1007637B8();

  return v6;
}

- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3
{
  retstr->a = 1.0;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = 1.0;
  retstr->tx = 0.0;
  retstr->ty = 0.0;
  return self;
}

- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp);
}

- (id)mathViewController:(id)a3 coordinateSpaceForDrawing:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for PKDrawing(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = a4;
  v13 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)(a4);

  v14 = sub_100763880();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v14;
  void *v15;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = a3;
  v14 = self;
  v15 = (void *)sub_100763A88(v10, v12, a5, a6);

  swift_bridgeObjectRelease(v12);
  return v15;
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v21;
  uint64_t Strong;
  void *v23;
  Class isa;
  uint64_t v25;

  v8 = a8;
  v11 = a4;
  v14 = type metadata accessor for PKStroke(0, a2);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)(a6);

  Strong = swift_unknownObjectWeakLoadStrong((char *)v21 + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep);
  if (Strong)
  {
    v23 = (void *)Strong;
    isa = PKStroke._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v23, "didUpdateShouldSolveMathForTriggerStroke:shouldSolveMath:undoable:", isa, v11, v8);

    v19 = v23;
    v21 = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)isa;
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)mathViewController:(id)a3 willPresentPopoverUI:(int64_t)a4
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI) = 1;
}

- (void)mathViewControllerDidDismissPopoverUI:(id)a3
{
  id v4;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v5;

  v4 = a3;
  v5 = self;
  sub_100763C98();

}

- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v16;
  void *v17;
  uint64_t v19;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = a3;
  v16 = self;
  v17 = (void *)sub_100763D10((uint64_t)v14, a5, a6);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v17;
}

- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v14;
  void *v15;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = a3;
  v14 = self;
  v15 = (void *)sub_100763E4C(v10, v12, a5, a6);

  swift_bridgeObjectRelease(v12);
  return v15;
}

- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, __n128);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v21;

  v13 = type metadata accessor for UUID(0);
  v14 = sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v15 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v13, v14);
  v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v13, v14);
  v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a6, v13, v14);
  v18 = sub_1004B8930(0, (unint64_t *)&unk_1013F0800, PKMathRecognitionItem_ptr);
  v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v18);
  v20 = a3;
  v21 = self;
  sub_1007640C4(v15, v16, v17, v19);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v19);
}

- (void)mathViewControllerUpdateFrameForContainer:(id)a3
{
  id v5;
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v6;
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep);
  v5 = a3;
  v6 = self;
  objc_msgSend(Strong, "didUpdateMathResultView");

}

- (void)updateCalculateDocumentProvider
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v2;

  v2 = self;
  sub_100761A5C();

}

- (NSString)crlaxRecognizedMathDescription
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100762930();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)init
{
  _TtC8Freeform30CRLMathRecognitionItemsHandler *result;

  result = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLMathRecognitionItemsHandler", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_rep);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_expressions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_expressionsQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_pendingDisplayUpdates));
}

@end
