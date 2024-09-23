@implementation SummaryQueueCompleteView

- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24SummaryQueueCompleteView *)sub_22B90C07C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B90DFD8();
}

- (void)doneButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onDoneButtonTapped);
}

- (void)saveButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onSaveButtonTapped);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalTimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalTimeDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalEnergyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalEnergyDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalDistanceTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalDistanceDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_saveButton));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onDoneButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onSaveButtonTapped));
}

@end
