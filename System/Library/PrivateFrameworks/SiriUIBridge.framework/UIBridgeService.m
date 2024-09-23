@implementation UIBridgeService

- (void)preheat
{
  _TtC12SiriUIBridge15UIBridgeService *v2;

  v2 = self;
  sub_2474515A8();

}

- (void)siriDismissed
{
  self;
  sub_2474515DC();
}

- (void)siriPrompted
{
  self;
  sub_24745162C();
}

- (void)stopAttendingWithReason:(unint64_t)a3
{
  _TtC12SiriUIBridge15UIBridgeService *v3;

  v3 = self;
  sub_247451930();

}

- (void)stopAttendingForReason:(unint64_t)a3
{
  _TtC12SiriUIBridge15UIBridgeService *v3;

  v3 = self;
  sub_24745198C();

}

- (void)siriWillPrompt
{
  _TtC12SiriUIBridge15UIBridgeService *v2;

  v2 = self;
  sub_247451DD4();

}

- (void)startAttending
{
  self;
  sub_247451EB4();
}

- (void)connectionInterrupted
{
  self;
  sub_2474543E8();
}

- (void)connectionInvalidated
{
  self;
  sub_247454428();
}

- (_TtC12SiriUIBridge15UIBridgeService)init
{
  UIBridgeService.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener));
}

@end
