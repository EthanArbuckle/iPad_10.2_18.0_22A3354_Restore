@implementation TSBackgroundTasksBackgroundFetchScheduler

- (TSBackgroundTasksBackgroundFetchScheduler)initWithApplication:(id)a3 taskIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1B16B9860();
  return (TSBackgroundTasksBackgroundFetchScheduler *)BackgroundTasksBackgroundFetchScheduler.init(application:taskIdentifier:)((uint64_t)a3, v5, v6);
}

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  TSBackgroundTasksBackgroundFetchScheduler *v4;

  v4 = self;
  BackgroundTasksBackgroundFetchScheduler.setMinimumBackgroundFetchInterval(_:)(a3);

}

- (void)prepareForUseWithApplicationDelegate:(id)a3
{
  TSBackgroundTasksBackgroundFetchScheduler *v5;

  swift_unknownObjectRetain();
  v5 = self;
  BackgroundTasksBackgroundFetchScheduler.prepareForUse(with:)((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (TSBackgroundTasksBackgroundFetchScheduler)init
{
  BackgroundTasksBackgroundFetchScheduler.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
