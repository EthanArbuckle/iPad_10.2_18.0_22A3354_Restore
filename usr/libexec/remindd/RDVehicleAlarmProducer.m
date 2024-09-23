@implementation RDVehicleAlarmProducer

- (void)dealloc
{
  _TtC7remindd22RDVehicleAlarmProducer *v2;

  v2 = self;
  sub_100436028();
}

- (void).cxx_destruct
{

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd22RDVehicleAlarmProducer_dataSource));
  sub_1002040BC((uint64_t)self + OBJC_IVAR____TtC7remindd22RDVehicleAlarmProducer_delegate);
}

- (NSString)description
{
  _TtC7remindd22RDVehicleAlarmProducer *v2;
  Swift::String v3;
  Swift::String v4;
  NSString v5;

  v2 = self;
  v3._countAndFlagsBits = sub_1004E8C68((uint64_t)v2);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 10558;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (_TtC7remindd22RDVehicleAlarmProducer)init
{
  _TtC7remindd22RDVehicleAlarmProducer *result;

  result = (_TtC7remindd22RDVehicleAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDVehicleAlarmProducer", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
