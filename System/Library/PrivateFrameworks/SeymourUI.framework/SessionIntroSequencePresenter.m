@implementation SessionIntroSequencePresenter

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  void *v4;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionCategory))
  {
    if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionMode))
    {
      v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioPlayer);
      *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioPlayer) = 0;

    }
  }
}

- (_TtC9SeymourUI29SessionIntroSequencePresenter)init
{
  _TtC9SeymourUI29SessionIntroSequencePresenter *result;

  result = (_TtC9SeymourUI29SessionIntroSequencePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_display);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_sessionCountdownCoordinator);

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onStartCountdown));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onCountdownSequenceStarted));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onCountdownSequenceCompleted));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_timerProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_sessionRouteMonitor);
  swift_release();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_timer, (uint64_t *)&unk_255B8E220);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionCategory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionMode));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_workoutDeviceConnection, (uint64_t *)&unk_255B8E230);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_catalogWorkout;
  v4 = sub_22BA7A958();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
