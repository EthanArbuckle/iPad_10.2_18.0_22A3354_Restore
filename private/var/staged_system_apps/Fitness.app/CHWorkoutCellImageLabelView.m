@implementation CHWorkoutCellImageLabelView

- (CHWorkoutCellImageLabelView)initWithFrame:(CGRect)a3
{
  return (CHWorkoutCellImageLabelView *)sub_1005EBF5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  CHWorkoutCellImageLabelView *v17;

  v12 = _Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject(&unk_1007ADEA8, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1005EEFF8;
  }
  else
  {
    v13 = 0;
  }
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_1005ED270(v14, v15, v16, a6, 1, (uint64_t)v12, v13);
  sub_100022BA4((uint64_t)v12, v13);

}

- (void)setShowsSeparator:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView), "setHidden:", !a3);
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[CHWorkoutCellImageLabelView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 1.79769313e308, v3, v4);
  return v5;
}

- (CHWorkoutCellImageLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005EEC64();
}

- (void).cxx_destruct
{

}

@end
