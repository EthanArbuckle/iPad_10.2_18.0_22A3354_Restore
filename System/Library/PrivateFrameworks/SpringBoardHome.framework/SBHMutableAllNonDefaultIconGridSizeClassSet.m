@implementation SBHMutableAllNonDefaultIconGridSizeClassSet

- (void)addGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = v4;
  if (!*(&self->super._containsAllNonDefaultGridSizeClasses + 1)
    && (!v4 || objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))))
  {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHMutableAllNonDefaultIconGridSizeClassSet;
  -[SBHMutableIconGridSizeClassSet addGridSizeClass:](&v6, sel_addGridSizeClass_, v5);

}

- (void)removeGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = v4;
  if (*(&self->super._containsAllNonDefaultGridSizeClasses + 1)
    && (!v4 || objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))))
  {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHMutableAllNonDefaultIconGridSizeClassSet;
  -[SBHMutableIconGridSizeClassSet removeGridSizeClass:](&v6, sel_removeGridSizeClass_, v5);

}

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  -[SBHMutableIconGridSizeClassSet _removedGridSizeClasses](self, "_removedGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = (v6 & 1) == 0
    && (v4 && !objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))
     || *(&self->super._containsAllNonDefaultGridSizeClasses + 1));

  return v7;
}

- (void)intersectGridSizeClassSet:(id)a3
{
  if (objc_msgSend(a3, "containsGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault")))
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 0;
}

- (void)unionGridSizeClassSet:(id)a3
{
  if (objc_msgSend(a3, "containsGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault")))
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 1;
}

- (id)description
{
  return CFSTR("<SBHMutableIconGridSizeClassSet: all non-default>");
}

@end
