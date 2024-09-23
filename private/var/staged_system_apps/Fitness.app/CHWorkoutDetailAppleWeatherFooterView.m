@implementation CHWorkoutDetailAppleWeatherFooterView

- (CHWorkoutDetailAppleWeatherFooterView)init
{
  return (CHWorkoutDetailAppleWeatherFooterView *)sub_1004FCE08();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CHWorkoutDetailAppleWeatherFooterView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  v5 = self;
  -[CHWorkoutDetailAppleWeatherFooterView frame](v5, "frame");
  -[CHWorkoutDetailAppleWeatherFooterView sizeThatFits:](v5, "sizeThatFits:", CGRectGetWidth(v13), INFINITY);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CHWorkoutDetailAppleWeatherFooterView)initWithCoder:(id)a3
{
  CHWorkoutDetailAppleWeatherFooterView *result;

  result = (CHWorkoutDetailAppleWeatherFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailAppleWeatherFooterView.swift", 52, 2, 61, 0);
  __break(1u);
  return result;
}

- (CHWorkoutDetailAppleWeatherFooterView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  CHWorkoutDetailAppleWeatherFooterView *result;

  v4 = a4;
  result = (CHWorkoutDetailAppleWeatherFooterView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailAppleWeatherFooterView", 46, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

@end
