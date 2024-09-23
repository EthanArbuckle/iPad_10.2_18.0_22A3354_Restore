@implementation SketchObject

- (_TtC7Measure12SketchObject)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_topSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_longSideSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_shortSideSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_backgroundLines) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_foregroundLines) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SketchObject();
  return -[SketchObject initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure12SketchObject)initWithCoder:(id)a3
{
  return (_TtC7Measure12SketchObject *)sub_1001D0BC0(a3);
}

- (void).cxx_destruct
{

}

@end
