@implementation SketchSurface

- (void)layoutSubviews
{
  _TtC7Measure13SketchSurface *v2;

  v2 = self;
  sub_100044CA8();

}

- (_TtC7Measure13SketchSurface)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC7Measure13SketchSurface *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC7Measure13SketchSurface_surfaceView;
  v9 = objc_allocWithZone((Class)UIView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_rectSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_horizontalLineSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_verticalLineSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_dotLayers) = (Class)_swiftEmptyArrayStorage;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for SketchSurface();
  return -[SketchSurface initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13SketchSurface)initWithCoder:(id)a3
{
  return (_TtC7Measure13SketchSurface *)sub_10004539C(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure13SketchSurface_horizontalLineSublayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure13SketchSurface_verticalLineSublayer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure13SketchSurface_dotLayers));
}

@end
