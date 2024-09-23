@implementation ApsMessageProcessingOperation

- (_TtC7sportsd29ApsMessageProcessingOperation)init
{
  sub_10003F11C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_message));
  sub_100040004(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_dataRepository);
  sub_100040004(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_playsStore);
  sub_10000A47C((uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateable, &qword_1000D1538);
  sub_10000A47C((uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_subscriptionOperationFactory, &qword_1000D0C20);
  sub_100007618((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_performance));
  sub_100040004(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellable);
  sub_10003F4BC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion), *(_QWORD *)&self->super.lock[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion]);
  sub_10000A47C((uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_processDate, &qword_1000D0570);
  sub_100040004(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityCapUtility);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellables));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.lock[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion]);
}

@end
