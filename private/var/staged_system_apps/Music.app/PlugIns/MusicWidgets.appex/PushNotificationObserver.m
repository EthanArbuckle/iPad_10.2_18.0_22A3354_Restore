@implementation PushNotificationObserver

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (a4)
  {
    v6 = a3;
    swift_retain(self);
    v7 = a4;
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = v9;

    sub_10003A628(v8, v10);
    swift_release(self);
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_10000B4C8((uint64_t *)&unk_100552B60);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v13;
    if (a5)
    {
LABEL_3:
      v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v15 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
      v16 = (_QWORD *)swift_allocObject(&unk_10050DF48, 64, 7);
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = self;
      v16[5] = v12;
      v16[6] = a4;
      v16[7] = v14;
      swift_bridgeObjectRetain();
      swift_retain_n(self, 2);
      v17 = a3;
      swift_bridgeObjectRetain();
      v18 = sub_10016702C((uint64_t)v11, (uint64_t)&unk_100552170, (uint64_t)v16);
      swift_release(v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release(self);

      return;
    }
  }
  else
  {
    v12 = 0;
    if (a5)
      goto LABEL_3;
  }
  __break(1u);
}

- (_TtC9MusicCore24PushNotificationObserver)init
{
  objc_super v4;

  swift_defaultActor_initialize(self);
  swift_retain(self);
  *(_QWORD *)self->registeredHandlers = sub_100139E40((uint64_t)_swiftEmptyArrayStorage);
  *(_OWORD *)self->connection = 0u;
  *(_OWORD *)&self->connection[16] = 0u;
  *(_QWORD *)&self->pushConfiguration[8] = 0;
  swift_release(self);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PushNotificationObserver();
  return -[PushNotificationObserver init](&v4, "init");
}

@end
