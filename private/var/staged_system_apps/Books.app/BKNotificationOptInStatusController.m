@implementation BKNotificationOptInStatusController

- (BKNotificationOptInStatusController)initWithCenter:(id)a3 status:(int64_t)a4
{
  objc_class *ObjectType;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKNotificationOptInStatusController_center) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKNotificationOptInStatusController_status) = (Class)a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = a3;
  return -[BKNotificationOptInStatusController init](&v10, "init");
}

- (void)checkAndReportOptInStatus
{
  BKNotificationOptInStatusController *v2;

  v2 = self;
  NotificationOptInStatusController.checkAndReportOptInStatus()();

}

- (BKNotificationOptInStatusController)init
{
  BKNotificationOptInStatusController *result;

  result = (BKNotificationOptInStatusController *)_swift_stdlib_reportUnimplementedInitializer("Books.NotificationOptInStatusController", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
