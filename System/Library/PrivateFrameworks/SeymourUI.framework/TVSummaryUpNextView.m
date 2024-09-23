@implementation TVSummaryUpNextView

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
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_startButton);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_doneButton);
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

- (_TtC9SeymourUI19TVSummaryUpNextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19TVSummaryUpNextView *)sub_22B438974(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19TVSummaryUpNextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B43A6C8();
}

- (void)startButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onStartButtonTapped);
}

- (void)doneButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onDoneButtonTapped);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_gymKitIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_workoutSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_summaryQueueCountView));

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onStartButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onDoneButtonTapped));
}

@end
