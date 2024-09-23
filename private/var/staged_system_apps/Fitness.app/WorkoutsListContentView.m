@implementation WorkoutsListContentView

- (_TtC10FitnessApp23WorkoutsListContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23WorkoutsListContentView *)sub_100110DCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23WorkoutsListContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100112408();
}

- (void)configureWithCurrentWorkout
{
  _TtC10FitnessApp23WorkoutsListContentView *v2;

  v2 = self;
  sub_1001119E4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_workout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_workoutCellImageLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_dateLabel));
}

@end
