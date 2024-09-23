@implementation SXDividerComponentClassification

+ (id)typeString
{
  return CFSTR("line");
}

+ (id)roleString
{
  return CFSTR("divider");
}

+ (int)role
{
  return 9;
}

- (unint64_t)contentRelevance
{
  return 3;
}

@end
