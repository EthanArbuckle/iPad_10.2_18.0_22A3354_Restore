@implementation NotificationService

- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC26FindMyNotificationsService19NotificationService *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1000134F8(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)serviceExtensionTimeWillExpire
{
  _TtC26FindMyNotificationsService19NotificationService *v2;

  v2 = self;
  sub_100012744();

}

- (void)dealloc
{
  char *v3;
  _TtC26FindMyNotificationsService19NotificationService *v4;
  objc_super v5;
  _BYTE v6[24];
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v3 = (char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService, v6, 33, 0);
  v4 = self;
  sub_100012B50((uint64_t)v7, (uint64_t)v3);
  swift_endAccess(v6);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for NotificationService();
  -[NotificationService dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  sub_100012C20(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler), *(_QWORD *)&self->contentHandler[OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler]);
  sub_100012BE0((uint64_t)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService);
}

- (_TtC26FindMyNotificationsService19NotificationService)init
{
  _QWORD *v3;
  char *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
  v5 = (objc_class *)type metadata accessor for NotificationService();
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[NotificationService init](&v7, "init");
}

@end
