@implementation STTelephonyStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 9;
}

+ (id)emptyData
{
  return objc_alloc_init(STTelephonyStatusDomainData);
}

@end
