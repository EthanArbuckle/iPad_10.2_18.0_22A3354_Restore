@implementation FMBatteryWrapperView

- (_TtC6FindMy20FMBatteryWrapperView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC6FindMy20FMBatteryWrapperView *v10;
  _TtC6FindMy20FMBatteryWrapperView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC6FindMy20FMBatteryWrapperView_batteryView;
  v9 = objc_allocWithZone((Class)type metadata accessor for FMBatteryView());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for FMBatteryWrapperView();
  v11 = -[FMBatteryWrapperView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_100383414();

  return v11;
}

- (_TtC6FindMy20FMBatteryWrapperView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy20FMBatteryWrapperView *result;

  v5 = OBJC_IVAR____TtC6FindMy20FMBatteryWrapperView_batteryView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMBatteryView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy20FMBatteryWrapperView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMBatteryView.swift", 26, 2, 39, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
