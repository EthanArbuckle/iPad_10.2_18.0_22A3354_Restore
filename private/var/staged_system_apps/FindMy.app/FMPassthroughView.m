@implementation FMPassthroughView

- (_TtC6FindMy17FMPassthroughView)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy17FMPassthroughView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMPassthroughView_enabled) = 1;
  v4 = a3;

  result = (_TtC6FindMy17FMPassthroughView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPassthroughView.swift", 30, 2, 29, 0);
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC6FindMy17FMPassthroughView *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_1002B0070(v4, x, y);

  return v4 & 1;
}

- (_TtC6FindMy17FMPassthroughView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy17FMPassthroughView *result;

  result = (_TtC6FindMy17FMPassthroughView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPassthroughView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy17FMPassthroughView_exemptViews));
}

@end
