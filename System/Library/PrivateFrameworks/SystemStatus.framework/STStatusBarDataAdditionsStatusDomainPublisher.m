@implementation STStatusBarDataAdditionsStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 12;
}

+ (id)emptyData
{
  return objc_alloc_init(STStatusBarDataAdditionsStatusDomainData);
}

@end
