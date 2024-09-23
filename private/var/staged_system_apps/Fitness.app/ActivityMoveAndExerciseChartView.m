@implementation ActivityMoveAndExerciseChartView

- (CGSize)intrinsicContentSize
{
  void *v3;
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v3 = (void *)objc_opt_self(UIScreen);
  v4 = self;
  v5 = objc_msgSend(v3, "mainScreen");
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  -[ActivityMoveAndExerciseChartView sizeThatFits:](v4, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *result;

  sub_100305CCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithCoder:(id)a3
{
  sub_1003060A8(a3);
  return 0;
}

- (void)updateFonts
{
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v2;

  v2 = self;
  sub_1003062A4();

}

- (void)reloadDataWithShowFull:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v6;

  v4 = a4;
  v5 = a3;
  v6 = self;
  sub_1003064CC(v5, v4);

}

- (void)layoutSubviews
{
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v2;

  v2 = self;
  sub_1003071E4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_chartHeight);
  sub_100307E60();
  v6 = v4 + v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
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

  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_dataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_unitManager));
  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___mainHistogram), *(_QWORD *)&self->dataProvider[OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___mainHistogram]);
  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___workoutOverlayHistogram), *(_QWORD *)&self->dataProvider[OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___workoutOverlayHistogram]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___mainBarLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___workoutOverlayBarLayer));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_labels), v3, v4, v5, v6, v7, v8, v9);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_topAxisLabel));
}

- (NSArray)moveAndExerciseChartPoints
{
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v2;
  CHWorkoutDetailHeartRateTableViewCell *v3;
  Class isa;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = self;
  v3 = (CHWorkoutDetailHeartRateTableViewCell *)sub_10030782C();

  type metadata accessor for CGPoint(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  return (NSArray *)isa;
}

- (double)moveAndExerciseChartMaxYValue
{
  _TtC10FitnessApp32ActivityMoveAndExerciseChartView *v2;
  uint64_t v4[7];

  v2 = self;
  sub_100304F10(v4);
  sub_10003EDC4(v4);

  return *(double *)&v4[3];
}

- (int64_t)moveAndExerciseChartViewType
{
  return *((unsigned __int8 *)&self->super.super.super.isa
         + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_chartViewType);
}

@end
