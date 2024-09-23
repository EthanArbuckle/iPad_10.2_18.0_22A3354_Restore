@implementation JPKIXPCServer

- (_TtC10seserviced13JPKIXPCServer)init
{
  return (_TtC10seserviced13JPKIXPCServer *)sub_10015E288();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced13JPKIXPCServer_listener));

  v3 = *(_QWORD *)&self->listener[OBJC_IVAR____TtC10seserviced13JPKIXPCServer__debugSkipPassLookup];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_debugSkipPassLookup[OBJC_IVAR____TtC10seserviced13JPKIXPCServer__debugSkipPassLookup]);
  swift_bridgeObjectRelease(v3);
  v4 = *(_QWORD *)&self->listener[OBJC_IVAR____TtC10seserviced13JPKIXPCServer__debugSkipAssociatedApplicationCheck];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_debugSkipPassLookup[OBJC_IVAR____TtC10seserviced13JPKIXPCServer__debugSkipAssociatedApplicationCheck]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->listener[OBJC_IVAR____TtC10seserviced13JPKIXPCServer_serviceName]);
}

+ (uint64_t)kickOff
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for XPCListener.InitializationOptions(0);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100344658 != -1)
    swift_once(&qword_100344658, sub_10015E25C);
  v4 = (void *)qword_100354D40;
  v5 = *(_QWORD *)(qword_100354D40 + OBJC_IVAR____TtC10seserviced13JPKIXPCServer_serviceName);
  v6 = *(_QWORD *)(qword_100354D40 + OBJC_IVAR____TtC10seserviced13JPKIXPCServer_serviceName + 8);
  v7 = swift_allocObject(&unk_10030B170, 24, 7);
  *(_QWORD *)(v7 + 16) = v4;
  swift_bridgeObjectRetain(v6);
  v8 = v4;
  static XPCListener.InitializationOptions.none.getter();
  v9 = type metadata accessor for XPCListener(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v10 = XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(v5, v6, 0, v3, sub_1001621F4, v7);
  v11 = *(_QWORD *)&v8[OBJC_IVAR____TtC10seserviced13JPKIXPCServer_listener];
  *(_QWORD *)&v8[OBJC_IVAR____TtC10seserviced13JPKIXPCServer_listener] = v10;
  return swift_release(v11);
}

@end
