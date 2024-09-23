@implementation APContentDataWrapper

+ (NSString)kind
{
  return (NSString *)CFSTR("d");
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(APContentData);
}

- (BOOL)canBeGarbageCollected
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v4 = sub_10016B8D8((uint64_t)APManagedContentData, v3);

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v7 = sub_10016BB74((uint64_t)APManagedContentData, v6);

  return v7 ^ 1;
}

@end
