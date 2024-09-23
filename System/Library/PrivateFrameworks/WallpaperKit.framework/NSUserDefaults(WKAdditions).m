@implementation NSUserDefaults(WKAdditions)

- (void)wk_setIgnoreProductTypesForWallpaperBundle:()WKAdditions
{
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isInternalInstall");

  if (v6)
    objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("ignoreProductTypesForWallpaperBundle"));
}

- (uint64_t)wk_ignoreProductTypesForWallpaperBundle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isInternalInstall");

  if (v3)
    return objc_msgSend(a1, "BOOLForKey:", CFSTR("ignoreProductTypesForWallpaperBundle"));
  else
    return 0;
}

- (void)wk_setIgnoreLogicalScreenClassForWallpaperBundle:()WKAdditions
{
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isInternalInstall");

  if (v6)
    objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("ignoreLogicalScreenClassForWallpaperBundle"));
}

- (uint64_t)wk_ignoreLogicalScreenClassForWallpaperBundle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isInternalInstall");

  if (v3)
    return objc_msgSend(a1, "BOOLForKey:", CFSTR("ignoreLogicalScreenClassForWallpaperBundle"));
  else
    return 0;
}

@end
