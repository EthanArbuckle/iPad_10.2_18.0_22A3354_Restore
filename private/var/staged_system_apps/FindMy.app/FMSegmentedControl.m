@implementation FMSegmentedControl

- (_TtC6FindMy18FMSegmentedControl)initWithItems:(id)a3
{
  uint64_t v4;
  NSArray v5;
  _TtC6FindMy18FMSegmentedControl *v6;
  objc_super v8;

  if (a3)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSegmentedControl();
  v6 = -[FMSegmentedControl initWithItems:](&v8, "initWithItems:", v5.super.isa);

  return v6;
}

- (_TtC6FindMy18FMSegmentedControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSegmentedControl();
  return -[FMSegmentedControl initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy18FMSegmentedControl)initWithCoder:(id)a3
{
  _TtC6FindMy18FMSegmentedControl *result;

  result = (_TtC6FindMy18FMSegmentedControl *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMSegmentedControl.swift", 31, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6FindMy18FMSegmentedControl *v11;
  id v12;
  Class isa;
  objc_super v14;

  v7 = sub_10011D624();
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  v12 = -[FMSegmentedControl selectedSegmentIndex](v11, "selectedSegmentIndex");
  isa = Set._bridgeToObjectiveC()().super.isa;
  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for FMSegmentedControl();
  -[FMSegmentedControl touchesEnded:withEvent:](&v14, "touchesEnded:withEvent:", isa, v10);

  if (v12 == -[FMSegmentedControl selectedSegmentIndex](v11, "selectedSegmentIndex"))
    -[FMSegmentedControl sendActionsForControlEvents:](v11, "sendActionsForControlEvents:", 64);

  swift_bridgeObjectRelease(v9);
}

@end
