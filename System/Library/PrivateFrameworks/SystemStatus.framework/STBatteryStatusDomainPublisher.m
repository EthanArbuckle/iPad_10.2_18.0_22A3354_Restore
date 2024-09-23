@implementation STBatteryStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 2;
}

+ (id)emptyData
{
  return objc_alloc_init(STBatteryStatusDomainData);
}

@end
