@implementation STCallingStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 3;
}

+ (id)emptyData
{
  return objc_alloc_init(STCallingStatusDomainData);
}

@end
