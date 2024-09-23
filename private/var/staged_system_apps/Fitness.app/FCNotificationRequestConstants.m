@implementation FCNotificationRequestConstants

+ (NSString)moveModeNotificationCategory
{
  return (NSString *)sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081D8E8, (uint64_t)&qword_10086A388, &qword_10086A390, (uint64_t)sub_10024F9B4);
}

+ (NSString)moveModeChangeModeNotificationCategory
{
  return (NSString *)sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081D8F0, (uint64_t)&qword_10086A398, &qword_10086A3A0, (uint64_t)sub_10024F9F4);
}

+ (NSString)moveModeChangeGoalsNotificationCategory
{
  return (NSString *)sub_10024FA74((uint64_t)a1, (uint64_t)a2, &qword_10081D8F8, (uint64_t)&qword_10086A3A8, &qword_10086A3B0, (uint64_t)sub_10024FA34);
}

- (FCNotificationRequestConstants)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessCoachingNotificationRequestConstantsBridging();
  return -[FCNotificationRequestConstants init](&v3, "init");
}

@end
