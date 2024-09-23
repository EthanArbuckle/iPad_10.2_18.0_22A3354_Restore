@implementation LineRender

- (_TtC7Measure10LineRender)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC7Measure10LineRender *)sub_1000D92A0();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7Measure10LineRender *v4;
  _DWORD *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  v5 = sub_1000D3494();
  swift_slowDealloc(v5, -1, -1);
  v6.receiver = v4;
  v6.super_class = ObjectType;
  -[LineRender dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7Measure10LineRender_confirmedLineNodes));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___lineMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___minorSuggestedMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___dashedLineMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___linePrimeMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___visibilityThicknessGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___visibilityGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___thicknessGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___plainGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___objectLineMaterial));

  sub_1000C21E4((uint64_t)self + OBJC_IVAR____TtC7Measure10LineRender_startTime);
}

- (_TtC7Measure10LineRender)init
{
  _TtC7Measure10LineRender *result;

  result = (_TtC7Measure10LineRender *)_swift_stdlib_reportUnimplementedInitializer("Measure.LineRender", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
