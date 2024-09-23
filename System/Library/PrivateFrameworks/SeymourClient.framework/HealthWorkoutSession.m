@implementation HealthWorkoutSession

- (_TtC13SeymourClient20HealthWorkoutSession)init
{
  _TtC13SeymourClient20HealthWorkoutSession *result;

  result = (_TtC13SeymourClient20HealthWorkoutSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1CDFB13F8((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_workout, &qword_1EFA62FF0);
  sub_1CDFC2DA0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_caloriesUpdated));
  sub_1CDFB13F8((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession____lazy_storage___calorieStream, &qword_1EFA62F88);
  sub_1CDFC2DA0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_sessionStateUpdated));
  sub_1CDFB13F8((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession____lazy_storage___sessionStateStream, &qword_1EFA62FA8);
  swift_bridgeObjectRelease();
}

- (void)workoutBuilder:(id)a3 didCollectDataOfTypes:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC13SeymourClient20HealthWorkoutSession *v8;

  sub_1CDFB53C8(0, (unint64_t *)&unk_1ED8F0E48);
  sub_1CE080598();
  v6 = sub_1CE0B668C();
  v7 = a3;
  v8 = self;
  HealthWorkoutSession.workoutBuilder(_:didCollectDataOf:)((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)workoutBuilderDidCollectEvent:(id)a3
{
  uint64_t v4;
  _TtC13SeymourClient20HealthWorkoutSession *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_1ED8F0EB0;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1CE0B6080();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED8F0FD0);
  v7 = sub_1CE0B6068();
  v8 = sub_1CE0B6734();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CDFAA000, v7, v8, "HealthWorkoutSession: Workout Builder Collected Event.", v9, 2u);
    MEMORY[0x1D17C092C](v9, -1, -1);
  }

}

- (void)workoutBuilder:(id)a3 didEndActivity:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  _TtC13SeymourClient20HealthWorkoutSession *v12;

  v6 = qword_1ED8F0EB0;
  v7 = a3;
  v8 = a4;
  v12 = self;
  if (v6 != -1)
    swift_once();
  v9 = sub_1CE0B6080();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED8F0FD0);
  v10._countAndFlagsBits = 0xD000000000000072;
  v10._object = (void *)0x80000001CE0CC270;
  v11._object = (void *)0x80000001CE0CC2F0;
  v11._countAndFlagsBits = 0xD000000000000019;
  Logger.trace(file:function:)(v10, v11);
  sub_1CE07D57C(3u);

}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC13SeymourClient20HealthWorkoutSession *v13;
  uint64_t v14;

  v8 = sub_1CE0B3DF4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CE0B3DD0();
  v12 = a3;
  v13 = self;
  sub_1CE0805F0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC13SeymourClient20HealthWorkoutSession *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1CE0808CC(v8);

}

@end
