@implementation FCMoveModeNotificationConstants

+ (NSString)nextMoveModeUserInfoKey
{
  return (NSString *)sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DC60, (uint64_t)&qword_10086A798, &qword_10086A7A0, (uint64_t)sub_1003AC148);
}

+ (NSString)notificationTypeUserInfoKey
{
  return (NSString *)sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081DC68, (uint64_t)&qword_10086A7A8, (uint64_t *)algn_10086A7B0, (uint64_t)sub_1003AC188);
}

- (FCMoveModeNotificationConstants)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessCoachingMoveModeNotificationConstantsBridging();
  return -[FCMoveModeNotificationConstants init](&v3, "init");
}

@end
