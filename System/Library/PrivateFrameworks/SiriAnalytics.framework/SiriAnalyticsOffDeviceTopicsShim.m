@implementation SiriAnalyticsOffDeviceTopicsShim

+ (NSString)unordered
{
  void *v2;

  static OffDeviceTopicsShim.unordered.getter();
  v2 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (SiriAnalyticsOffDeviceTopicsShim)init
{
  return (SiriAnalyticsOffDeviceTopicsShim *)OffDeviceTopicsShim.init()();
}

@end
