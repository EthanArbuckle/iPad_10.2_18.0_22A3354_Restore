@implementation SXArticleThumbnailComponentClassification

+ (id)typeString
{
  return CFSTR("article_thumbnail");
}

+ (id)roleString
{
  return CFSTR("article_thumbnail");
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Article Thumbnail"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
