@implementation FMPISDebugLocationRow

- (_TtC6FindMy21FMPISDebugLocationRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A728C();
}

- (_TtC6FindMy21FMPISDebugLocationRow)initWithFrame:(CGRect)a3
{
  _TtC6FindMy21FMPISDebugLocationRow *result;

  result = (_TtC6FindMy21FMPISDebugLocationRow *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPISDebugLocationRow", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMPISDebugLocationRow_locationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMPISDebugLocationRow_confidenceLabel));

  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy21FMPISDebugLocationRow_palette));
}

@end
