@implementation SessionCastingPresenter

- (_TtC9SeymourUI23SessionCastingPresenter)init
{
  _TtC9SeymourUI23SessionCastingPresenter *result;

  result = (_TtC9SeymourUI23SessionCastingPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_display);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onExitButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onAirplayButtonTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onStartIntentExpressed));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_sessionClient);
  swift_release();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_workoutDeviceConnection, (uint64_t *)&unk_255B8E230);
}

@end
