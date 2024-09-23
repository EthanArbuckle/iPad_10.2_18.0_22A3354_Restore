@implementation GKLRUDequeNode

- (NSObject)key
{
  return AnyHashable._bridgeToObjectiveC()().isa;
}

- (id)value
{
  unsigned __int8 *value;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _BYTE v7[24];
  _QWORD v8[3];
  uint64_t v9;

  value = self->value;
  swift_beginAccess(self->value, v7, 0, 0);
  sub_100161F70((uint64_t)value, (uint64_t)v8);
  v3 = v9;
  v4 = sub_100163928(v8, v9);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_100161FE0(v8);
  return v5;
}

- (void)setValue:(id)a3
{
  _BYTE v5[24];
  _OWORD v6[2];

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  swift_beginAccess(self->value, v5, 33, 0);
  sub_100161FE0(self->value);
  sub_100161F60(v6, self->value);
  swift_endAccess(v5);
  swift_release(self);
}

- (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode)initWithKey:(id)a3 value:(id)a4
{
  uint64_t v5;
  _OWORD v7[2];
  _QWORD v8[5];

  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)(v8, a3, a2);
  v5 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v7, v5);
  swift_unknownObjectRelease(a4);
  return (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode *)sub_1001627BC((uint64_t)v8, v7);
}

@end
