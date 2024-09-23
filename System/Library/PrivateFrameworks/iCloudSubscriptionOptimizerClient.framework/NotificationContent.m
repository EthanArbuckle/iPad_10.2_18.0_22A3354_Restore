@implementation NotificationContent

- (BOOL)shouldCallMlDaemon
{
  uint64_t v2;

  sub_21C5124EC();
  v2 = sub_21C5124E0();
  return v2 == sub_21C5124E0();
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient19NotificationContent *v2;
  void *v3;

  v2 = self;
  sub_21C512810();
  sub_21C512768();
  sub_21C512504();
  sub_21C512828();
  sub_21C512768();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient19NotificationContent *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[NotificationContent description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient19NotificationContent)init
{
  _TtC33iCloudSubscriptionOptimizerClient19NotificationContent *result;

  result = (_TtC33iCloudSubscriptionOptimizerClient19NotificationContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C506208((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient19NotificationContent_context);
}

@end
