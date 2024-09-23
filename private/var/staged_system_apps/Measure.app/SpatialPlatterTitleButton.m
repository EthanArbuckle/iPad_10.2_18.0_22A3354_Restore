@implementation SpatialPlatterTitleButton

- (_TtC7Measure25SpatialPlatterTitleButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC7Measure25SpatialPlatterTitleButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchDownCallback);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchUpCallback);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_fadeOutAnimator) = 0;
  v6 = a3;

  result = (_TtC7Measure25SpatialPlatterTitleButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/SpatialPlatterTitleButton.swift", 39, 2, 32, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_size);
  v3 = *(double *)&self->size[OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)onButtonTouchDown
{
  _TtC7Measure25SpatialPlatterTitleButton *v2;

  v2 = self;
  sub_1000EB388();

}

- (void)onButtonTouchUp
{
  _TtC7Measure25SpatialPlatterTitleButton *v2;

  v2 = self;
  sub_1000EB410();

}

- (_TtC7Measure25SpatialPlatterTitleButton)initWithFrame:(CGRect)a3
{
  _TtC7Measure25SpatialPlatterTitleButton *result;

  result = (_TtC7Measure25SpatialPlatterTitleButton *)_swift_stdlib_reportUnimplementedInitializer("Measure.SpatialPlatterTitleButton", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchDownCallback), *(_QWORD *)&self->size[OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchDownCallback]);
  sub_1000217BC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchUpCallback), *(_QWORD *)&self->size[OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchUpCallback]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_fadeOutAnimator));
}

@end
