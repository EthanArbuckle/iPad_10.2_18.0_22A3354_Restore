@implementation CRLShadowView

- (_TtC8Freeform13CRLShadowView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for CRLShadowView();
  return -[CRLShadowView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform13CRLShadowView)initWithCoder:(id)a3
{
  return (_TtC8Freeform13CRLShadowView *)sub_1009B19CC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLShadowView);
}

+ (Class)layerClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLShadowLayer();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

@end
