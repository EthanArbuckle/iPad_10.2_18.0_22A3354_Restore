@implementation MTNotificationTestActionFactory

+ (void)runDefaultAction
{
  _QWORD *v2;

  v2 = sub_1003432B4();
  sub_1002861E0(0xD00000000000001ELL, 0x800000010043EB60, (uint64_t)v2);
  swift_bridgeObjectRelease(v2);
}

+ (id)notificationTestActionsViewController
{
  _QWORD *v2;
  id v3;

  v2 = sub_1003432B4();
  v3 = objc_allocWithZone((Class)type metadata accessor for MTTestActionListViewController());
  return MTTestActionListViewController.init(title:tests:)(0x6163696669746F4ELL, 0xED0000736E6F6974, (unint64_t)v2);
}

+ (void)runOldestNotificationAction
{
  sub_100343B4C((uint64_t (*)(_QWORD))_s22PostOldestNotificationCMa, (uint64_t)&off_1004BEF88, (void (*)(_QWORD *, uint64_t, __n128))sub_100284AA8);
}

+ (void)runRandomNotificationAction
{
  sub_100343B4C((uint64_t (*)(_QWORD))_s22PostRandomNotificationCMa, (uint64_t)&off_1004BEF68, (void (*)(_QWORD *, uint64_t, __n128))sub_100284F64);
}

- (_TtC8Podcasts31MTNotificationTestActionFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTNotificationTestActionFactory();
  return -[MTNotificationTestActionFactory init](&v3, "init");
}

@end
