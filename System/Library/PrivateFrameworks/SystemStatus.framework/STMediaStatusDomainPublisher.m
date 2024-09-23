@implementation STMediaStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 6;
}

+ (id)emptyData
{
  return objc_alloc_init(STMediaStatusDomainData);
}

@end
