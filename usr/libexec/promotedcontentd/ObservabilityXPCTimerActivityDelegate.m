@implementation ObservabilityXPCTimerActivityDelegate

- (NSString)taskID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->taskID[OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTaskID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID);
  v6 = *(_QWORD *)&self->taskID[OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (APXPCActivityCriteria)criteria
{
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10003D7C4();

  return (APXPCActivityCriteria *)v3;
}

- (BOOL)runActivity:(id)a3
{
  id v4;
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10003D93C(v4);

  return self & 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  void (*v13)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  id v14;
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v19;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10020E280, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType(Strong);
    v12 = swift_allocObject(&unk_10020E2A8, 32, 7);
    *(_QWORD *)(v12 + 16) = sub_10003E1DC;
    *(_QWORD *)(v12 + 24) = v6;
    v13 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v10 + 24);
    v14 = a3;
    v15 = self;
    _Block_copy(v5);
    swift_retain(v6, v16);
    v13(sub_10003E214, v12, ObjectType, v10);
    swift_release(v6);
    swift_unknownObjectRelease(v9);
    v17 = v12;
  }
  else
  {
    v18 = a3;
    v19 = self;
    _Block_copy(v5);
    (*((void (**)(void *, uint64_t))v5 + 2))(v5, 1);
    v17 = v6;
  }
  swift_release(v17);
  _Block_release(v5);

}

- (void)terminateActivity:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t (*)(), _QWORD, uint64_t, uint64_t);
  id v11;
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v12;

  v5 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(uint64_t (*)(), _QWORD, uint64_t, uint64_t))(v8 + 24);
    v11 = a3;
    v12 = self;
    v10(nullsub_1, 0, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (id)checkinWithCriteria:(id)a3
{
  _TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10003DC80((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return 0;
}

- (_TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate)init
{
  _QWORD *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID);
  *v3 = 0xD000000000000031;
  v3[1] = 0x80000001001EABD0;
  v4 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate;
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4, 0);
  v5 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_currentScheduledTime;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ObservabilityXPCTimerActivityDelegate(0);
  return -[ObservabilityXPCTimerActivityDelegate init](&v8, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->taskID[OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID]);
  sub_10003E238((uint64_t)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate);
  sub_10000D51C((uint64_t)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_currentScheduledTime);
}

@end
