@implementation CRLCanvasDotGridBackgroundView

+ (Class)layerClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasDotGridLayer();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for CRLCanvasDotGridBackgroundView();
  return -[CRLCanvasBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLCanvasDotGridBackgroundView();
  return -[CRLCanvasBackgroundView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
