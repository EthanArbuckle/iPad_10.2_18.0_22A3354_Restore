@implementation RDContactInteractionAlarmProducer

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  int v5;
  _TtC7remindd33RDContactInteractionAlarmProducer *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_shouldNotifyOfInteractionWithPeopleNotifyToken;
  v5 = *(_DWORD *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_shouldNotifyOfInteractionWithPeopleNotifyToken);
  v6 = self;
  if (notify_is_valid_token(v5))
  {
    notify_cancel(*(_DWORD *)((char *)&self->super.isa + v4));
    *(_DWORD *)((char *)&self->super.isa + v4) = -1;
  }
  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[RDContactInteractionAlarmProducer dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_dataSource));
  sub_1002040BC((uint64_t)self + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_delegate);

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_userInteractionSessionManager));
}

- (_TtC7remindd33RDContactInteractionAlarmProducer)init
{
  _TtC7remindd33RDContactInteractionAlarmProducer *result;

  result = (_TtC7remindd33RDContactInteractionAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDContactInteractionAlarmProducer", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
