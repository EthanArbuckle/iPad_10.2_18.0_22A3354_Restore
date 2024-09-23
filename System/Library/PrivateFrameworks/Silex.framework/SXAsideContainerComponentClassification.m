@implementation SXAsideContainerComponentClassification

+ (int)role
{
  return 8;
}

+ (id)roleString
{
  return CFSTR("aside");
}

- (unint64_t)contentRelevance
{
  return 3;
}

@end
