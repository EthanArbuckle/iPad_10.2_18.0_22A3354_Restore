@implementation CHWorkoutDetailFourColumnTableViewCell

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
  return 32.0;
}

- (CHWorkoutDetailFourColumnTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHWorkoutDetailFourColumnTableViewCell *)sub_1001BB8EC(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailFourColumnTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001BBF04();
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTableViewCell();
  v2 = v3.receiver;
  -[CHWorkoutDetailFourColumnTableViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1001BB6F4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnOneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnTwoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewBottomAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewBottomAnchorLastRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewTopAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewTopAnchorHeader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_topAnchorStandardRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_topAnchorHeaderRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnOneWidthAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnTwoWidthAnchorCustom));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeWidthAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeWidthAnchorSwimSet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourWidthAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourWidthAnchorSwimSet));
}

@end
