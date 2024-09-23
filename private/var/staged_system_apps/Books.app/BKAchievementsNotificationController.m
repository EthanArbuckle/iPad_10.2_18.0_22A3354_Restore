@implementation BKAchievementsNotificationController

+ (NSString)categoryIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (id)titleKeyFromNotificationUserInfo:(id)a3
{
  return sub_1005AF828((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s5Books34AchievementsNotificationControllerC8titleKey4fromSSSgSDySSypG_tFZ_0);
}

+ (id)messageKeyFromNotificationUserInfo:(id)a3
{
  return sub_1005AF828((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s5Books34AchievementsNotificationControllerC10messageKey4fromSSSgSDySSypG_tFZ_0);
}

+ (int64_t)goalTypeFromNotificationUserInfo:(id)a3
{
  uint64_t v3;
  int64_t v4;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v4 = _s5Books34AchievementsNotificationControllerC8goalType4from13BookAnalytics011BridgedGoalF0OSDySSypG_tFZ_0(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (BKAchievementsNotificationController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[BKAchievementsNotificationController init](&v3, "init");
}

@end
