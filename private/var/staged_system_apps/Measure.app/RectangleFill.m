@implementation RectangleFill

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state);
}

- (void)setState:(int64_t)a3
{
  uint64_t v3;
  _TtC7Measure13RectangleFill *v5;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state) = (Class)a3;
  if (v3 != a3)
  {
    v5 = self;
    sub_1001599F4(a3);

  }
}

- (_TtC7Measure13RectangleFill)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7Measure13RectangleFill *result;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state) = (Class)1;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_currentPoints) = 0;
  v5 = OBJC_IVAR____TtC7Measure13RectangleFill_rectangleFill;
  v6 = objc_allocWithZone((Class)SCNNode);
  v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC7Measure13RectangleFill *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/RectangleFill.swift", 27, 2, 33, 0);
  __break(1u);
  return result;
}

- (_TtC7Measure13RectangleFill)init
{
  _TtC7Measure13RectangleFill *result;

  result = (_TtC7Measure13RectangleFill *)_swift_stdlib_reportUnimplementedInitializer("Measure.RectangleFill", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7Measure13RectangleFill_currentPoints));

}

@end
