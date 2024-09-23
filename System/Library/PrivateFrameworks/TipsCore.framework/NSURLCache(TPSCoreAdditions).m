@implementation NSURLCache(TPSCoreAdditions)

+ (id)tps_urlCacheWithIdentifier:()TPSCoreAdditions memoryCapacity:diskCapacity:
{
  void *v8;
  void *v9;

  if (a3)
  {
    objc_msgSend(a1, "_tps_cacheDirectoryURLForIdentifier:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMemoryCapacity:diskCapacity:directoryURL:", a4, a5, v8);

  return v9;
}

+ (id)_tps_cacheDirectoryURLForIdentifier:()TPSCoreAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines appGroupIdentifier](TPSCommonDefines, "appGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerURLForSecurityApplicationGroupIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "URLsForDirectory:inDomains:", 13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Library/Caches/SharedURLCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "URLByAppendingPathComponent:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

@end
