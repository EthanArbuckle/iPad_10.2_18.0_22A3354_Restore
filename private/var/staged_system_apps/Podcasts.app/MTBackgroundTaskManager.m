@implementation MTBackgroundTaskManager

- (void)beginBackgroundTask:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  MTBackgroundTaskManager *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100020B18(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (MTBackgroundTaskManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTBackgroundTaskManager_task) = (Class)UIBackgroundTaskInvalid;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundTaskManager();
  return -[MTBackgroundTaskManager init](&v3, "init");
}

- (void)endBackgroundTask
{
  MTBackgroundTaskManager *v2;

  v2 = self;
  sub_100018E74();

}

@end
