@implementation DataLinkHealthKitClientConnection

- (_TtC11WorkoutCore33DataLinkHealthKitClientConnection)init
{
  return (_TtC11WorkoutCore33DataLinkHealthKitClientConnection *)sub_22858DBAC();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_session));
  sub_22858FFF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_metricsUpdater));
  sub_22858FFF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_notificationHandler));
  sub_22858FFF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_presenceHandler));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
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
  _TtC11WorkoutCore33DataLinkHealthKitClientConnection *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2286E7470(MEMORY[0x24BEE7910], "Workout session did fail, not logging error");

}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC11WorkoutCore33DataLinkHealthKitClientConnection *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_22874BBA8();
  v10 = v9;

  sub_2286E6C64(v8, v10);
  sub_228598BD0(v8, v10);

}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11WorkoutCore33DataLinkHealthKitClientConnection *v8;

  v6 = sub_22874C9A0();
  v7 = a3;
  v8 = self;
  sub_2286E3F84((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4
{
  id v6;
  _TtC11WorkoutCore33DataLinkHealthKitClientConnection *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_2286E7470(MEMORY[0x24BEE7928], "We received a disconnection notice!");

}

@end
