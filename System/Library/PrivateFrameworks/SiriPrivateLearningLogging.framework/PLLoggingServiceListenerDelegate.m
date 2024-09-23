@implementation PLLoggingServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_2118954B4(v7);

  return v9 & 1;
}

- (_TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate)init
{
  _TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate *result;

  result = (_TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue));
  swift_bridgeObjectRelease();
}

@end
