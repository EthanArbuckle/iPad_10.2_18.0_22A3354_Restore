@implementation STAirPlayStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 0;
}

+ (id)emptyData
{
  return objc_alloc_init(STAirPlayStatusDomainData);
}

@end
