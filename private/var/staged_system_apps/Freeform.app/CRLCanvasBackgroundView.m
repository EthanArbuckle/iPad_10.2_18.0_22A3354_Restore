@implementation CRLCanvasBackgroundView

- (_TtC8Freeform23CRLCanvasBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCanvasBackgroundView();
  return -[CRLCanvasBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform23CRLCanvasBackgroundView)initWithCoder:(id)a3
{
  _TtC8Freeform23CRLCanvasBackgroundView *result;

  result = (_TtC8Freeform23CRLCanvasBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLCanvasBackgroundView.swift", 38, 2, 15, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasBackgroundLayer();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

@end
