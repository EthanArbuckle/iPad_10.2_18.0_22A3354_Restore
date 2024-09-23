@implementation SXArticleLinkComponentClassification

+ (id)typeString
{
  return CFSTR("article_link");
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return CFSTR("article_link");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Article Link"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
