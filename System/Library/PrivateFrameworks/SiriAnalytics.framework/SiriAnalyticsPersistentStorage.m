@implementation SiriAnalyticsPersistentStorage

+ (SiriAnalyticsDataVault)dataVault
{
  swift_getObjCClassMetadata();
  return (SiriAnalyticsDataVault *)static PersistentStorage.dataVault.getter();
}

- (SiriAnalyticsPersistentStorage)init
{
  return (SiriAnalyticsPersistentStorage *)PersistentStorage.init()();
}

@end
