@implementation TSApplicationBackgroundFetchScheduler

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  TSApplicationBackgroundFetchScheduler *v4;

  v4 = self;
  ApplicationBackgroundFetchScheduler.setMinimumBackgroundFetchInterval(_:)(a3);

}

- (TSApplicationBackgroundFetchScheduler)initWithApplication:(id)a3
{
  TSApplicationBackgroundFetchScheduler *result;

  ApplicationBackgroundFetchScheduler.init(application:)((uint64_t)a3);
  return result;
}

- (TSApplicationBackgroundFetchScheduler)init
{
  ApplicationBackgroundFetchScheduler.init()();
}

- (void).cxx_destruct
{

}

@end
