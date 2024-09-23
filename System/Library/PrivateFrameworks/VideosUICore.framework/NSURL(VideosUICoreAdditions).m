@implementation NSURL(VideosUICoreAdditions)

+ (id)vui_URLWithString:()VideosUICoreAdditions
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)vuicore_isAppIconURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("appicon"));

  return v2;
}

- (BOOL)vuicore_imageURLType
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "compare:options:", CFSTR("lcr"), 1) == 0;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)vuicore_isResourceURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("resource"));

  return v2;
}

- (uint64_t)vuicore_isSymbolURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("symbol"));

  return v2;
}

- (uint64_t)vuicore_isResourceOrSymbolURL
{
  if ((objc_msgSend(a1, "vuicore_isResourceURL") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "vuicore_isSymbolURL");
}

- (id)vuicore_resourceName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
