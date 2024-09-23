@implementation SXScalableImageComponent

+ (id)typeString
{
  return CFSTR("scalable_image");
}

- (unint64_t)traits
{
  return 8;
}

@end
