@implementation AONSenseSampleProvider

+ (BOOL)AONSENSE_FRAMEWORK_AVAILABLE
{
  return 1;
}

+ (_TtC19ProximityDaemonCore22AONSenseSampleProvider)shared
{
  if (qword_10085DAA8 != -1)
    swift_once(&qword_10085DAA8, sub_1002F7E40);
  return (_TtC19ProximityDaemonCore22AONSenseSampleProvider *)(id)static AONSenseSampleProvider.shared;
}

- (void)registerWithQueue:(id)a3 callback:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC19ProximityDaemonCore22AONSenseSampleProvider *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100815248, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  AONSenseSampleProvider.register(queue:callback:)(v8, (uint64_t)sub_1002F9DD8, v7);

  swift_release(v7);
}

- (_TtC19ProximityDaemonCore22AONSenseSampleProvider)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout);
  *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__aonSense) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AONSenseSampleProvider();
  return -[AONSenseSampleProvider init](&v4, "init");
}

- (void).cxx_destruct
{
  sub_1002F80AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout), *(_QWORD *)&self->_callout[OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__aonSense));
}

@end
