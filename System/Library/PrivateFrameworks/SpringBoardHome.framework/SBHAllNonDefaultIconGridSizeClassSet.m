@implementation SBHAllNonDefaultIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;
  else
    return 0;
}

- (unint64_t)count
{
  return -1;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)gridSizeClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)gridSizeClassGroups
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isAllNonDefaultGridSizeClassSet
{
  return 1;
}

- (id)allGridSizeClassesInDomain:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allNonDefaultGridSizeClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SBHMutableAllNonDefaultIconGridSizeClassSet);
}

- (id)description
{
  return CFSTR("<SBHIconGridSizeClassSet: all non-default>");
}

@end
