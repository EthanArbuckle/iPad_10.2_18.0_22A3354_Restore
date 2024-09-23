@implementation NSFileManager(ThreeBars)

+ (id)wifiCacheDirectoryPath
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v9;

  objc_msgSend(a1, "userCacheDirectoryPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultsDomain");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(v4, "fileExistsAtPath:", v3);

    if ((v2 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = 0,
          v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9), v7 = v9, v5, v1 = 0, v6)&& !v7)
    {
      v3 = v3;
      v1 = v3;
    }
  }
  else
  {
    v3 = 0;
  }

  return v1;
}

+ (id)userCacheDirectoryPath
{
  void *v0;
  void *v1;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (const)defaultsDomain
{
  return CFSTR("com.apple.wifid");
}

@end
