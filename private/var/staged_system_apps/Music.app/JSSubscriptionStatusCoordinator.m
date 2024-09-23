@implementation JSSubscriptionStatusCoordinator

- (void)dealloc
{
  _TtC11MusicJSCore31JSSubscriptionStatusCoordinator *v2;

  v2 = self;
  JSSubscriptionStatusCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator_lastKnownSubscriptionStatusResponse));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator_subscriptionRequestTimeout));
  sub_100DAE594((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator____lazy_storage___signpost);
}

@end
