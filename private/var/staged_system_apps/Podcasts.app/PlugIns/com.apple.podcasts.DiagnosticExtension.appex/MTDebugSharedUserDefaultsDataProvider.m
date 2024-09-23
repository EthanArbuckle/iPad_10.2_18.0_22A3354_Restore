@implementation MTDebugSharedUserDefaultsDataProvider

- (id)debugDataFileName
{
  return CFSTR("SharedUserDefaults.txt");
}

- (id)debugData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryRepresentation"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  return v5;
}

@end
