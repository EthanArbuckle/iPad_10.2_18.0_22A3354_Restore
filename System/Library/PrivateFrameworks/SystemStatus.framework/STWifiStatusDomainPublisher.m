@implementation STWifiStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 11;
}

+ (id)emptyData
{
  return objc_alloc_init(STWifiStatusDomainData);
}

@end
