@implementation TapToRadarView

- (_TtC7Measure14TapToRadarView)initWithFrame:(CGRect)a3
{
  _TtC7Measure14TapToRadarView *result;

  sub_1001B2D24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure14TapToRadarView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _TtC7Measure14TapToRadarView *result;

  v5 = (char *)self + OBJC_IVAR____TtC7Measure14TapToRadarView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = OBJC_IVAR____TtC7Measure14TapToRadarView_rtlFormat;
  v7 = (void *)objc_opt_self(UIApplication);
  v8 = a3;
  v9 = objc_msgSend(v7, "sharedApplication");
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  *((_BYTE *)&self->super.super.super.super.super.isa + v6) = v10 == (id)1;
  result = (_TtC7Measure14TapToRadarView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/TapToRadarView.swift", 28, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)fileRadar
{
  uint64_t Strong;
  uint64_t v4;
  _TtC7Measure14TapToRadarView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC7Measure14TapToRadarView_delegate, a2);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_1001A779C();

    swift_unknownObjectRelease(v4);
  }
}

- (void)updateForCurrentOrientation
{
  _TtC7Measure14TapToRadarView *v2;

  v2 = self;
  sub_1001B3020();

}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure14TapToRadarView_delegate);
}

@end
