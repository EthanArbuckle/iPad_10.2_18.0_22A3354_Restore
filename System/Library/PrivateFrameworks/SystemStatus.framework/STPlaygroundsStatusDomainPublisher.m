@implementation STPlaygroundsStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 7;
}

+ (id)emptyData
{
  return objc_alloc_init(STPlaygroundsStatusDomainData);
}

@end
