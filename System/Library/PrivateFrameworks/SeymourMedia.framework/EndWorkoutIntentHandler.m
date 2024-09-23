@implementation EndWorkoutIntentHandler

- (_TtC12SeymourMedia23EndWorkoutIntentHandler)init
{
  _TtC12SeymourMedia23EndWorkoutIntentHandler *result;

  result = (_TtC12SeymourMedia23EndWorkoutIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23EndWorkoutIntentHandler_sessionClient);
}

- (void)handleEndWorkout:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12SeymourMedia23EndWorkoutIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_21A13DA04((uint64_t)sub_21A13D9F4, v7);

  swift_release();
}

@end
