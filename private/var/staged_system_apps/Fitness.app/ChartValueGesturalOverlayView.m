@implementation ChartValueGesturalOverlayView

- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29ChartValueGesturalOverlayView *)sub_10059E1EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithCoder:(id)a3
{
  sub_10059E4B0(a3);
  return 0;
}

- (void)gestureDidChangeWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp29ChartValueGesturalOverlayView *v5;

  v4 = a3;
  v5 = self;
  sub_10059ECC4(v4);

}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_colors));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_dataSource);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->lineView[OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_currentData], v3, v4, v5, v6, v7, v8, v9);
}

@end
