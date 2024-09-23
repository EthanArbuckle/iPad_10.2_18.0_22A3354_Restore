@implementation NSFileManager

+ (id)systemCacheDirectoryPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if ((v7 & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v13 = 0,
          v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v13), v10 = v13, v8, v11 = 0, v9)&& !v10)
    {
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)userCacheDirectoryPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if ((v7 & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v13 = 0,
          v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v13), v10 = v13, v8, v11 = 0, v9)&& !v10)
    {
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)userLibraryPath
{
  NSArray *v2;
  void *v3;
  void *v4;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  else
    v4 = 0;

  return v4;
}

@end
