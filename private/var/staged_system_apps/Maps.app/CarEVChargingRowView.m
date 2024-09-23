@implementation CarEVChargingRowView

- (_TtC4Maps20CarEVChargingRowView)initWithCoder:(id)a3
{
  id v4;
  _TtC4Maps20CarEVChargingRowView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___leadingLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___trailingLabel) = 0;
  v4 = a3;

  result = (_TtC4Maps20CarEVChargingRowView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/CarEVChargingAvailabilityViewController.swift", 50, 2, 182, 0);
  __break(1u);
  return result;
}

- (_TtC4Maps20CarEVChargingRowView)initWithFrame:(CGRect)a3
{
  _TtC4Maps20CarEVChargingRowView *result;

  result = (_TtC4Maps20CarEVChargingRowView *)_swift_stdlib_reportUnimplementedInitializer("Maps.CarEVChargingRowView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps20CarEVChargingRowView_leadingText;
  v4 = type metadata accessor for AttributedString(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___leadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___trailingLabel));
}

@end
