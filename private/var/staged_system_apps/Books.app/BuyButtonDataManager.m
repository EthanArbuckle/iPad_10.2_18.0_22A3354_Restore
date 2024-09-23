@implementation BuyButtonDataManager

- (void)networkReachabilityChangedWithNotification:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;

  Strong = swift_unknownObjectWeakLoadStrong(&self->listener[7]);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    swift_retain(self);
    sub_1004A9FC4();
    sub_1004A9D70();

    swift_release(self);
    swift_unknownObjectRelease(v6);
  }
}

- (void)preorderedStateChanged
{
  uint64_t Strong;
  uint64_t v4;

  Strong = swift_unknownObjectWeakLoadStrong(&self->listener[7]);
  if (Strong)
  {
    v4 = Strong;
    swift_retain(self);
    sub_1004A9FC4();
    sub_1004A9D70();
    swift_release(self);
    swift_unknownObjectRelease(v4);
  }
}

@end
