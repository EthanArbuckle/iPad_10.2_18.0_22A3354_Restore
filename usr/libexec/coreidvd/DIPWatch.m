@implementation DIPWatch

- (_TtC8coreidvd8DIPWatch)init
{
  return (_TtC8coreidvd8DIPWatch *)sub_100016AFC();
}

- (void)dealloc
{
  _TtC8coreidvd8DIPWatch *v2;

  v2 = self;
  sub_100016FC4();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd8DIPWatch_currentSession));

  swift_bridgeObjectRelease(*(_QWORD *)&self->currentSession[OBJC_IVAR____TtC8coreidvd8DIPWatch_DIPWatchErrorDomain]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd8DIPWatch_partitions));
  sub_10001D07C((uint64_t)self + OBJC_IVAR____TtC8coreidvd8DIPWatch_delegate);
}

- (void)identityRemoteDeviceService:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC8coreidvd8DIPWatch *v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  sub_100018BBC(v11, a4, v8, v10);

  swift_bridgeObjectRelease(v10);
}

@end
