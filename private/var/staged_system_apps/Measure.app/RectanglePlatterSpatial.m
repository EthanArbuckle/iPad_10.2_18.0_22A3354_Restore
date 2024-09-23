@implementation RectanglePlatterSpatial

- (_TtC7Measure23RectanglePlatterSpatial)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000215C4();
}

- (_TtC7Measure23RectanglePlatterSpatial)initWithFrame:(CGRect)a3
{
  _TtC7Measure23RectanglePlatterSpatial *result;

  result = (_TtC7Measure23RectanglePlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer("Measure.RectanglePlatterSpatial", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_numberOfRowsChangedCallback), *(_QWORD *)&self->numberOfRowsChangedCallback[OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_numberOfRowsChangedCallback]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_containerConfiguration));
  swift_bridgeObjectRelease(*(_QWORD *)&self->numberOfRowsChangedCallback[OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->numberOfRowsChangedCallback[OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_measurementID]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_labelStrip));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilityLength));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilityWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilitySeparator));
}

@end
