@implementation BackdropLayerView

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)init
{
  return -[BackdropLayerView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_10BBC(0, (unint64_t *)&qword_261978, CABackdropLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for BackdropLayerView();
  return -[BackdropLayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropLayerView();
  return -[BackdropLayerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
