@implementation ClassKitManager

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC8Podcasts15ClassKitManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003039B8();

}

- (_TtC8Podcasts15ClassKitManager)init
{
  _TtC8Podcasts15ClassKitManager *result;

  result = (_TtC8Podcasts15ClassKitManager *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.ClassKitManager", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts15ClassKitManager_dataStoreDelegate));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts15ClassKitManager_playbackController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts15ClassKitManager_subscriptions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts15ClassKitManager__playbackStart));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts15ClassKitManager__lastSignificantChangeTime));

}

@end
