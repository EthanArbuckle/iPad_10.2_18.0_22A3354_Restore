@implementation SBHIconModelDesiredIconStateUnarchiverDelegate

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)393222;
}

- (unint64_t)maxListCountForFoldersForIconStateUnarchiver:(id)a3
{
  return 100;
}

- (unint64_t)maxIconCountForDockForIconStateUnarchiver:(id)a3
{
  return 20;
}

- (id)gridSizeClassSizesForIconStateUnarchiver:(id)a3
{
  return objc_alloc_init(SBHIconGridSizeClassSizeMap);
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  void *v5;

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", v5);

  if ((_DWORD)a4)
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
