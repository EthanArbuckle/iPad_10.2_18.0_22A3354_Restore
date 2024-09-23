@implementation CRLURLEditor

- (void)tearDown
{
  _TtC8Freeform12CRLURLEditor *v2;

  v2 = self;
  sub_1007126DC();

}

- (void)willResignCurrentEditor
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC8Freeform12CRLURLEditor *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  objc_class *v11;
  objc_super v12;

  v3 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_10127A408, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_100521B98((uint64_t)v5, (uint64_t)&unk_1013EF380, (uint64_t)v9);
  swift_release(v10);
  v11 = (objc_class *)type metadata accessor for CRLURLEditor();
  v12.receiver = v7;
  v12.super_class = v11;
  -[CRLBoardItemEditor willResignCurrentEditor](&v12, "willResignCurrentEditor");

}

- (void)editURL:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1007128CC);
}

+ (BOOL)canOpenItemURLFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for CRLBoardItem(0);
  v5 = sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v4, v5);
  LOBYTE(v4) = sub_1007170F8(v6);
  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

+ (void)openItemURLFor:(id)a3
{
  id v3;

  v3 = a3;
  sub_10071718C((uint64_t)v3);

}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  _TtC8Freeform12CRLURLEditor *v7;
  id v8;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v7 = self;
  sub_100712D6C(v8, x, y);

}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform12CRLURLEditor *v7;
  uint64_t v8;
  _TtC8Freeform12CRLURLEditor *v9;
  int64_t v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_1007135CC((uint64_t)a3, (uint64_t)v12);

  sub_1004CB800((uint64_t)v12, &qword_1013E0230);
  return v10;
}

- (void)reloadMetadata:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100713BF8);
}

- (_TtC8Freeform12CRLURLEditor)initWithInteractiveCanvasController:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_editURLAlert) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_reloadTask) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor____lazy_storage___insertingHelper) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_replaceTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLURLEditor();
  return -[CRLBoardItemEditor initWithInteractiveCanvasController:](&v5, "initWithInteractiveCanvasController:", a3);
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_reloadTask));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform12CRLURLEditor____lazy_storage___insertingHelper));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_replaceTask));
}

@end
