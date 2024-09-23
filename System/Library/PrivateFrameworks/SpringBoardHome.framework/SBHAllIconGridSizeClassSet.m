@implementation SBHAllIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  return 1;
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

- (BOOL)isAllGridSizeClassSet
{
  return 1;
}

- (id)allGridSizeClassesInDomain:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allGridSizeClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SBHMutableAllIconGridSizeClassSet);
}

- (id)description
{
  return CFSTR("<SBHIconGridSizeClassSet: all>");
}

@end
