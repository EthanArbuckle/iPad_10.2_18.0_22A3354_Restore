@implementation RDAccountPropertiesNotifier

+ (NSString)notificationUserInfoAccountObjectIDKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationUserInfoAccountTypeKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationUserInfoPropertyNameKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)notificationUserInfoPropertyValueKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)observeWithObserver:(id)a3
{
  sub_10047E054(self, (uint64_t)a2, (uint64_t)a3, sub_10047CFB8);
}

- (void)unobserveWithObserver:(id)a3
{
  sub_10047E054(self, (uint64_t)a2, (uint64_t)a3, sub_10047D950);
}

- (RDAccountPropertiesNotifier)init
{
  return (RDAccountPropertiesNotifier *)sub_10047E0B4();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPropertiesNotifier_lock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPropertiesNotifier_l_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPropertiesNotifier_l_cancellables));
}

@end
