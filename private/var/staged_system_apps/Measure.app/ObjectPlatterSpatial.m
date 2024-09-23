@implementation ObjectPlatterSpatial

- (_TtC7Measure20ObjectPlatterSpatial)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10019BCDC();
}

- (_TtC7Measure20ObjectPlatterSpatial)initWithFrame:(CGRect)a3
{
  _TtC7Measure20ObjectPlatterSpatial *result;

  result = (_TtC7Measure20ObjectPlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer("Measure.ObjectPlatterSpatial", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_numberOfRowsChangedCallback), *(_QWORD *)&self->fullContentHeight[OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_numberOfRowsChangedCallback]);
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->fullContentHeight[OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fullContentHeight[OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_measurementID]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_labelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_tableView));
  swift_release();
}

@end
