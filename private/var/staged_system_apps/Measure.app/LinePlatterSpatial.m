@implementation LinePlatterSpatial

- (_TtC7Measure18LinePlatterSpatial)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007954C();
}

- (_TtC7Measure18LinePlatterSpatial)initWithFrame:(CGRect)a3
{
  _TtC7Measure18LinePlatterSpatial *result;

  result = (_TtC7Measure18LinePlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer("Measure.LinePlatterSpatial", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->minContentViewHeight[OBJC_IVAR____TtC7Measure18LinePlatterSpatial_title]);
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7Measure18LinePlatterSpatial_numberOfRowsChangedCallback), *(_QWORD *)&self->minContentViewHeight[OBJC_IVAR____TtC7Measure18LinePlatterSpatial_numberOfRowsChangedCallback]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->minContentViewHeight[OBJC_IVAR____TtC7Measure18LinePlatterSpatial_measurementID]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_labelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityLabelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityElevation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityDistance));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityAngle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorOne));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorTwo));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorThree));
}

@end
