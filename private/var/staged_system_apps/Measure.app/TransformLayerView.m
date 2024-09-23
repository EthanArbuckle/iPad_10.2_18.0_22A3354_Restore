@implementation TransformLayerView

+ (Class)layerClass
{
  unint64_t v2;

  v2 = sub_1001C1B88();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC7Measure18TransformLayerView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for TransformLayerView();
  return -[TransformLayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure18TransformLayerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TransformLayerView();
  return -[TransformLayerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
