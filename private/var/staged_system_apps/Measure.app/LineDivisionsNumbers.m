@implementation LineDivisionsNumbers

- (_TtC7Measure20LineDivisionsNumbers)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100070428();
}

- (_TtC7Measure20LineDivisionsNumbers)init
{
  _TtC7Measure20LineDivisionsNumbers *result;

  result = (_TtC7Measure20LineDivisionsNumbers *)_swift_stdlib_reportUnimplementedInitializer("Measure.LineDivisionsNumbers", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure20LineDivisionsNumbers_divisionNumbersMaterial));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7Measure20LineDivisionsNumbers_divisionNumbers));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Measure20LineDivisionsNumbers__orientationState));
}

@end
