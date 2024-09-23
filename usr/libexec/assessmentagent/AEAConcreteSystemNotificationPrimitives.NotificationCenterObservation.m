@implementation AEAConcreteSystemNotificationPrimitives.NotificationCenterObservation

- (void)cancel
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  __CFNotificationCenter *v5;
  __CFString *v6;

  v3 = *(uint64_t (**)(uint64_t))self->centerBuilder;
  v4 = swift_retain(self);
  v5 = (__CFNotificationCenter *)v3(v4);
  v6 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterRemoveObserver(v5, self, v6, 0);
  swift_release(self);

}

@end
