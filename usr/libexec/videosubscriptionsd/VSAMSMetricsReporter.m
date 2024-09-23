@implementation VSAMSMetricsReporter

+ (_TtC19videosubscriptionsd20VSAMSMetricsReporter)shared
{
  _BYTE v3[24];

  if (qword_10001ED30 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  swift_beginAccess(&static VSAMSMetricsReporter.shared, v3, 0, 0);
  return (_TtC19videosubscriptionsd20VSAMSMetricsReporter *)(id)static VSAMSMetricsReporter.shared;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE v6[24];

  v3 = qword_10001ED30;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  swift_beginAccess(&static VSAMSMetricsReporter.shared, v6, 1, 0);
  v5 = (void *)static VSAMSMetricsReporter.shared;
  static VSAMSMetricsReporter.shared = (uint64_t)v4;

}

- (_TtC19videosubscriptionsd20VSAMSMetricsReporter)init
{
  return (_TtC19videosubscriptionsd20VSAMSMetricsReporter *)sub_10000E1B0();
}

- (void)flush
{
  void *v2;
  _TtC19videosubscriptionsd20VSAMSMetricsReporter *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics);
  v3 = self;
  v4 = objc_msgSend(v2, "flush");

}

- (void)enqueue:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics), "enqueueEvent:", a3);
}

- (void)enqueueEvents:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC19videosubscriptionsd20VSAMSMetricsReporter *v8;
  Class isa;

  v5 = sub_10000E43C();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics);
  v8 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v7, "enqueueEvents:", isa);

  swift_bridgeObjectRelease(v6);
}

- (void).cxx_destruct
{

}

@end
