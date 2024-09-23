@implementation CRLWPStickyNoteEditor

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform21CRLWPStickyNoteEditor *v7;
  uint64_t v8;
  _TtC8Freeform21CRLWPStickyNoteEditor *v9;
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
  v10 = sub_100C0427C((uint64_t)a3, (uint64_t)v12);

  sub_1004D28EC((uint64_t)v12);
  return v10;
}

- (void)updatePreset:(id)a3
{
  _TtC8Freeform21CRLWPStickyNoteEditor *v5;
  uint64_t v6;
  _TtC8Freeform21CRLWPStickyNoteEditor *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100C04420((uint64_t)v8);

  sub_1004D28EC((uint64_t)v8);
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  _TtC8Freeform21CRLWPStickyNoteEditor *v5;
  uint64_t v6;
  _TtC8Freeform21CRLWPStickyNoteEditor *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100C04C50();

  sub_1004D28EC((uint64_t)v8);
}

- (BOOL)wantsStickyNoteMiniFormatterVariant
{
  return 1;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform21CRLWPStickyNoteEditor *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  sub_100C050F4(v7, x, y);

}

- (_TtC8Freeform21CRLWPStickyNoteEditor)initWithInteractiveCanvasController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLWPStickyNoteEditor();
  return -[CRLBoardItemEditor initWithInteractiveCanvasController:](&v5, "initWithInteractiveCanvasController:", a3);
}

@end
