@implementation SummaryUpNextView

- (_TtC9SeymourUI17SummaryUpNextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17SummaryUpNextView *)sub_22B6B38A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17SummaryUpNextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6B5364();
}

- (void)startButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onStartButtonTapped);
}

- (void)doneButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onDoneButtonTapped);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_gymKitIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_workoutSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_summaryQueueCountView));

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onStartButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onDoneButtonTapped));
}

@end
