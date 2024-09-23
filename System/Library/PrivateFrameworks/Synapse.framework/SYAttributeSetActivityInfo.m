@implementation SYAttributeSetActivityInfo

- (SYAttributeSetActivityInfo)initWithAttributeSet:(id)a3
{
  id v5;
  SYAttributeSetActivityInfo *v6;
  SYAttributeSetActivityInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYAttributeSetActivityInfo;
  v6 = -[SYAttributeSetActivityInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributeSet, a3);

  return v7;
}

- (NSString)activityType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYAttributeSetActivityInfo attributeSet](self, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForCustomKey:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E757CA18;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  return (NSString *)v8;
}

- (NSURL)webpageURL
{
  void *v2;
  void *v3;

  -[SYAttributeSetActivityInfo attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)canonicalURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_canonicalURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYAttributeSetActivityInfo attributeSet](self, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForCustomKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (NSString)targetContentIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityTargetContentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYAttributeSetActivityInfo attributeSet](self, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForCustomKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)persistentIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityPersistentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYAttributeSetActivityInfo attributeSet](self, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForCustomKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

@end
