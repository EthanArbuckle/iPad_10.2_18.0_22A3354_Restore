@implementation CHWorkoutDetailAwardTableViewCell

- (UIImageView)achievementBadgeView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView));
}

- (_TtC10FitnessApp26AchievementCellContentView)achievementCellContentView
{
  return (_TtC10FitnessApp26AchievementCellContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementCellContentView));
}

- (UIView)insetView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_insetView));
}

- (CHWorkoutDetailAwardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHWorkoutDetailAwardTableViewCell *)sub_10055CFA8(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailAwardTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10055DA60();
}

+ (double)preferredHeightForWorkout:(id)a3
{
  return 90.0;
}

- (void)configureForAchievement:(id)a3 badgeImageFactory:(id)a4 localizationProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHWorkoutDetailAwardTableViewCell *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10055D6A0(v8, v9, v10);

}

- (void)setImageHidden:(BOOL)a3
{
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementCellContentView)+ OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_achievementBadgeView), "setHidden:", a3);
}

- (CGRect)badgeRect
{
  void *v2;
  CHWorkoutDetailAwardTableViewCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView);
  v3 = self;
  objc_msgSend(v2, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = UIEdgeInsets.init(uniform:)(5.0);
  v14 = v13;

  v15 = sub_1002283B8(v5, v7, v9, v11, v12, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_insetView));
}

@end
