@implementation PGFeatureExtractor

+ (id)featureExtractor
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)featureLength
{
  return self->featureLength;
}

@end
