@implementation SketchSurfaceHistory

- (_TtC7Measure20SketchSurfaceHistory)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC7Measure20SketchSurfaceHistory *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC7Measure20SketchSurfaceHistory_surfaceView;
  v9 = objc_allocWithZone((Class)UIView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for SketchSurfaceHistory();
  return -[SketchSurfaceHistory initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure20SketchSurfaceHistory)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7Measure20SketchSurfaceHistory *v8;
  _TtC7Measure20SketchSurfaceHistory *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC7Measure20SketchSurfaceHistory_surfaceView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SketchSurfaceHistory();
  v9 = -[SketchSurfaceHistory initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

- (void).cxx_destruct
{

}

@end
