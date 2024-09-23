@implementation NSURL(TSPersistence)

- (uint64_t)isAssetsLibraryURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("assets-library"));

  return v2;
}

- (id)pathExceptPrivate
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "rangeOfString:", CFSTR("/private")))
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)URLExceptPrivate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "pathExceptPrivate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)isUbiquitous
{
  uint64_t result;
  id v2;

  v2 = 0;
  result = objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x24BDBCCA8], 0);
  if ((_DWORD)result)
    return objc_msgSend(v2, "BOOLValue");
  return result;
}

- (uint64_t)isOnNonHFSVolume
{
  return 0;
}

@end
