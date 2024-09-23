@implementation PointRender

- (SCNVector3)position
{
  float v2;
  float v3;
  float v4;
  SCNVector3 result;

  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_point), "position");
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _TtC7Measure11PointRender *v13;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_point);
  v13 = self;
  *(float *)&v7 = x;
  *(float *)&v8 = y;
  *(float *)&v9 = z;
  objc_msgSend(v6, "setWorldPosition:", v7, v8, v9);
  *(float *)&v10 = x;
  *(float *)&v11 = y;
  *(float *)&v12 = z;
  objc_msgSend(*(id *)((char *)&v13->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_pointPrime), "setWorldPosition:", v10, v11, v12);

}

- (_TtC7Measure11PointRender)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC7Measure11PointRender *)sub_10012F214();
}

- (_TtC7Measure11PointRender)init
{
  _TtC7Measure11PointRender *result;

  result = (_TtC7Measure11PointRender *)_swift_stdlib_reportUnimplementedInitializer("Measure.PointRender", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure11PointRender____lazy_storage___pointMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure11PointRender____lazy_storage___pointPrimeMaterial));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_pointNodes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11PointRender_lines));
}

@end
