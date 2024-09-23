@implementation SXDefaultEmbedVideoComponentClassification

+ (id)typeString
{
  return CFSTR("embed_video");
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules](SXComponentLayoutRules, "twoColumnLayoutRules");
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
