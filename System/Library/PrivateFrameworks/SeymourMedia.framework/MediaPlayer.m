@implementation MediaPlayer

- (_TtC12SeymourMedia11MediaPlayer)init
{
  _TtC12SeymourMedia11MediaPlayer *result;

  result = (_TtC12SeymourMedia11MediaPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_analyticsReporter);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_screenCaptureMonitor);
  sub_21A131308((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_sessionOrigin);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_timeJumpCoordinator);
  v3 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_workout;
  v4 = sub_21A1A8548();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_21A191728((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_state);
  swift_release();

  sub_21A0E0118(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_onReadyToPlay));
  v5 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer__startTimeOverride;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550C6F18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer__audioFormatMediaKind;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550C6F20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  id v6;
  id v7;
  _TtC12SeymourMedia11MediaPlayer *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21A1A84AC();

  v9 = (void *)sub_21A1A9D60();
  swift_bridgeObjectRelease();
  return v9;
}

@end
