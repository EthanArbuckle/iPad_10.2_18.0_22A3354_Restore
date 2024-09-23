@implementation NotificationPendingResponse

- (BOOL)isNotificationPending
{
  return (self->responseError[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis] & 1) == 0
      && *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError) == 0;
}

- (id)maxDelayTimestampMillis
{
  id v2;

  if ((self->responseError[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis] & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithLongLong_, *(Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis));
  return v2;
}

- (id)error
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)sub_21C5121BC();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse *v2;
  void *v3;

  v2 = self;
  sub_21C506370();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[NotificationPendingResponse description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse)init
{
  _TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse *result;

  result = (_TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError));
}

@end
