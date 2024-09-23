@implementation STVoiceControlStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 10;
}

+ (id)emptyData
{
  return objc_alloc_init(STVoiceControlStatusDomainData);
}

@end
