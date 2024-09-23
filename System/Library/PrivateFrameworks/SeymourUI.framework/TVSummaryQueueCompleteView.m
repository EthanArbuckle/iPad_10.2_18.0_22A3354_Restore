@implementation TVSummaryQueueCompleteView

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90850;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_doneButton);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_saveButton);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_22BA808D4();
  v6 = v4;
  v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v8 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v8;
}

- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TVSummaryQueueCompleteView *)sub_22B540540(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B542394();
}

- (void)doneButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onDoneButtonTapped);
}

- (void)saveButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onSaveButtonTapped);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalTimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalTimeDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalEnergyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalEnergyDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalDistanceTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalDistanceDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_saveButton));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onDoneButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onSaveButtonTapped));
}

@end
