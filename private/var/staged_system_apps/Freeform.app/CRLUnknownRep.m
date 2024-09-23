@implementation CRLUnknownRep

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC8Freeform13CRLUnknownRep *v5;

  v4 = a3;
  v5 = self;
  sub_100C92C20(v4);

}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  _TtC8Freeform13CRLUnknownRep *v4;
  CRLInteractiveCanvasController *v5;
  CRLCanvasLayerHosting *v6;

  v4 = self;
  v5 = -[CRLCanvasRep interactiveCanvasController](v4, "interactiveCanvasController");
  v6 = -[CRLInteractiveCanvasController layerHost](v5, "layerHost");

  if (v6)
  {
    sub_100C94340((uint64_t)v6, 0);

    swift_unknownObjectRelease(v6);
  }
  else
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"handleSingleTap(at:inputType:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUnknownRep.swift", 84, 2, 161, "invalid nil found when unwrapping value", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"handleSingleTap(at:inputType:)", 30, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUnknownRep.swift", 84, 2u, 161, (uint64_t)"invalid nil found when unwrapping value", 39, 2u);

  }
  return v6 != 0;
}

+ (void)presentUnsupportedItemAlertWithLayerHost:(id)a3 forGroup:(BOOL)a4
{
  swift_unknownObjectRetain(a3);
  sub_100C94340((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
}

- (_TtC8Freeform13CRLUnknownRep)initWithLayout:(id)a3 canvas:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUnknownRep_sidePadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUnknownRep_topPadding) = (Class)0x4018000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLUnknownRep();
  return -[CRLCanvasRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
}

@end
