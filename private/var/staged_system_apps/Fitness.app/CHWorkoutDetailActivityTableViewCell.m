@implementation CHWorkoutDetailActivityTableViewCell

- (CHWorkoutDetailNavigationDelegate)navigationDelegate
{
  return (CHWorkoutDetailNavigationDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_navigationDelegate, a3);
}

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 74.0;
}

- (CHWorkoutDetailActivityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailActivityTableViewCell *)sub_1005DD8C4(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailActivityTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005E2114();
}

- (void)prepareForReuse
{
  CHWorkoutDetailActivityTableViewCell *v2;

  v2 = self;
  sub_1005DDEE4();

}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5 dataCalculator:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  CHWorkoutDetailActivityTableViewCell *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (char *)a6;
  v14 = self;
  sub_1005DFDD8(v10, v11, v12, v13);

}

- (void)didTapWorkoutActivity
{
  CHWorkoutDetailActivityTableViewCell *v2;

  v2 = self;
  sub_1005E0D60();

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

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_groupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_durationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_paceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effortImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effortLabel));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_standardAnchors), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_transitionAnchors), v10, v11, v12, v13, v14, v15, v16);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutActivity));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_noteSink));
  sub_10001BE90((uint64_t)self + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effort, &qword_100822220);
  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_navigationDelegate);
}

@end
