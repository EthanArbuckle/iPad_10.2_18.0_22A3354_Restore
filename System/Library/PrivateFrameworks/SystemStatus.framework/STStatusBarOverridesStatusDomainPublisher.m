@implementation STStatusBarOverridesStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 13;
}

+ (id)emptyData
{
  return objc_alloc_init(STStatusBarOverridesStatusDomainData);
}

@end
