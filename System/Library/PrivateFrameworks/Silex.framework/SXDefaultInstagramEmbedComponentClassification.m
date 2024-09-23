@implementation SXDefaultInstagramEmbedComponentClassification

+ (id)typeString
{
  return CFSTR("instagram_embed");
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
