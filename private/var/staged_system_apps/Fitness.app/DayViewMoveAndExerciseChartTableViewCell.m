@implementation DayViewMoveAndExerciseChartTableViewCell

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)labelPair
{
  return (_TtC10FitnessApp29DayViewTitleAndValueLabelPair *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_labelPair);
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)chartView
{
  return (_TtC10FitnessApp32ActivityMoveAndExerciseChartView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_chartView);
}

- (UILabel)auxiliaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryLabel));
}

- (UIButton)editGoalButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton));
}

- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  _TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell *result;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  sub_1002FEBA0(a3, (uint64_t)a4, v6);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayViewMoveAndExerciseChartTableViewCell();
  v2 = (char *)v5.receiver;
  -[DayViewMoveAndExerciseChartTableViewCell layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton];
  v4 = objc_msgSend(v3, "layer", v5.receiver, v5.super_class);
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v6) * 0.5);

  objc_msgSend(v3, "setNeedsLayout");
}

- (void)dealloc
{
  _TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell *v2;

  v2 = self;
  sub_100300588();
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
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_histogram), *(_QWORD *)&self->chartViewType[OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_histogram]);
  sub_10004A2FC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_workoutHistogram), *(_QWORD *)&self->chartViewType[OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_workoutHistogram]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_onEditGoal), *(_QWORD *)&self->chartViewType[OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_onEditGoal]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryValue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_labelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_chartView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_fontListener, (uint64_t *)&unk_100828420);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_chartData), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_workouts), v10, v11, v12, v13, v14, v15, v16);
}

- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithCoder:(id)a3
{
  sub_100300F64(a3);
  return 0;
}

@end
