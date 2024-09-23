@implementation DataLinkHealthKitHostConnection

- (void)dealloc
{
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *v3;
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore31DataLinkHealthKitHostConnection_recorder))
  {
    v3 = self;
    swift_retain();
    sub_2285BF0F0();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DataLinkHealthKitHostConnection();
  -[DataLinkHealthKitHostConnection dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore31DataLinkHealthKitHostConnection_lastResetOfSequences;
  v4 = sub_22874BCB0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

- (_TtC11WorkoutCore31DataLinkHealthKitHostConnection)init
{
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *result;

  result = (_TtC11WorkoutCore31DataLinkHealthKitHostConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = sub_22874BCB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22874BC8C();
  sub_228661F98();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_228662184(v8);

}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;

  v5 = sub_22874C9A0();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = a3;
    v8 = self;
    v9 = (unint64_t *)(v5 + 40);
    do
    {
      v10 = *(v9 - 1);
      v11 = *v9;
      sub_22859BFB4(v10, *v9);
      sub_228662344(v10, v11);
      sub_228598BD0(v10, v11);
      v9 += 2;
      --v6;
    }
    while (v6);

  }
  else
  {
    v12 = a3;
  }
  swift_bridgeObjectRelease();

}

- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _TtC11WorkoutCore31DataLinkHealthKitHostConnection *v13;

  v6 = qword_25598D168;
  v7 = a3;
  v13 = self;
  v8 = a4;
  if (v6 != -1)
    swift_once();
  v9 = sub_22874C5D4();
  __swift_project_value_buffer(v9, (uint64_t)qword_255992D58);
  v10 = sub_22874C5BC();
  v11 = sub_22874CB44();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_22858A000, v10, v11, "We received a disconnection notice!", v12, 2u);
    MEMORY[0x22E2B4580](v12, -1, -1);
  }

}

@end
