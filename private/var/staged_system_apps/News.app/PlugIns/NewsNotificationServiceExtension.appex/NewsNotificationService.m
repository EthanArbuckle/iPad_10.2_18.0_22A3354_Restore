@implementation NewsNotificationService

- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC32NewsNotificationServiceExtension23NewsNotificationService *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100019308(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)serviceExtensionTimeWillExpire
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService);
  if (v2)
    objc_msgSend(v2, "serviceExtensionTimeWillExpire");
}

- (_TtC32NewsNotificationServiceExtension23NewsNotificationService)init
{
  return (_TtC32NewsNotificationServiceExtension23NewsNotificationService *)sub_100019004((uint64_t)self, (uint64_t)a2);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_services));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService), v3);
}

@end
