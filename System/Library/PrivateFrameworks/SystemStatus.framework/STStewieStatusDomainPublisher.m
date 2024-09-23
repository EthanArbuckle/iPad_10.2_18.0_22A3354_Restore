@implementation STStewieStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 8;
}

+ (id)emptyData
{
  return objc_alloc_init(STStewieStatusDomainData);
}

@end
