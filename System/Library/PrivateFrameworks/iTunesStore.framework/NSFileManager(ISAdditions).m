@implementation NSFileManager(ISAdditions)

+ (uint64_t)cacheDirectoryPathWithName:()ISAdditions
{
  uint64_t v4;

  v4 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", a3);
  if (objc_msgSend(a1, "ensureDirectoryExists:", v4))
    return v4;
  else
    return 0;
}

+ (uint64_t)ensureDirectoryExists:()ISAdditions
{
  uint64_t v3;
  id v4;

  v3 = a3;
  if (a3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  }
  return v3;
}

+ (BOOL)_storeMovePath:()ISAdditions toPath:
{
  const std::__fs::filesystem::path *v5;
  const std::__fs::filesystem::path *v6;
  std::error_code *v7;
  int v8;

  v5 = (const std::__fs::filesystem::path *)objc_msgSend(a3, "fileSystemRepresentation");
  v6 = (const std::__fs::filesystem::path *)objc_msgSend(a4, "fileSystemRepresentation");
  rename(v5, v6, v7);
  return v8 == 0;
}

@end
