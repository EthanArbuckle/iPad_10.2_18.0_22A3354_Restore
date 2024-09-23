@implementation RDTimeAlarmProducer

- (NSString)description
{
  _TtC7remindd19RDTimeAlarmProducer *v2;
  Swift::String v3;
  Swift::String v4;
  NSString v5;

  v2 = self;
  v3._countAndFlagsBits = sub_1004E8C68((uint64_t)v2);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (_TtC7remindd19RDTimeAlarmProducer)init
{
  _TtC7remindd19RDTimeAlarmProducer *result;

  result = (_TtC7remindd19RDTimeAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDTimeAlarmProducer", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_timeEventStream));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_dataSource));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_beforeFirstUnlockNotificationEngine));
  sub_1002040BC((uint64_t)self + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_delegate);
}

@end
