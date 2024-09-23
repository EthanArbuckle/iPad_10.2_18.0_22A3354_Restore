@implementation SBHMutableAllIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHMutableIconGridSizeClassSet _removedGridSizeClasses](self, "_removedGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

- (id)description
{
  return CFSTR("<SBHMutableIconGridSizeClassSet: all>");
}

@end
