@implementation STFocusStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 4;
}

+ (id)emptyData
{
  return objc_alloc_init(STFocusStatusDomainData);
}

@end
