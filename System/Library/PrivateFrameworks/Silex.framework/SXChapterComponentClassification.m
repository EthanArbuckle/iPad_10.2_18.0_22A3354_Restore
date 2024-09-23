@implementation SXChapterComponentClassification

+ (int)role
{
  return 6;
}

+ (id)roleString
{
  return CFSTR("chapter");
}

- (id)accessibilityContextualLabel
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Chapter"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
