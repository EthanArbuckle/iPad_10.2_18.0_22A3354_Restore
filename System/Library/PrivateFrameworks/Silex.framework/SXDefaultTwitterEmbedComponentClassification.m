@implementation SXDefaultTwitterEmbedComponentClassification

+ (id)typeString
{
  return CFSTR("twitter_embed");
}

+ (BOOL)shouldRegister
{
  return 0;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
