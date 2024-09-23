@implementation SBHImmutableIconGridSizeClassSet

- (SBHImmutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4
{
  id v6;
  id v7;
  SBHImmutableIconGridSizeClassSet *v8;
  uint64_t v9;
  NSSet *gridSizeClasses;
  uint64_t v11;
  NSSet *gridSizeClassGroups;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHImmutableIconGridSizeClassSet;
  v8 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](&v14, sel_initWithGridSizeClasses_gridSizeClassGroups_, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    gridSizeClasses = v8->_gridSizeClasses;
    v8->_gridSizeClasses = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    gridSizeClassGroups = v8->_gridSizeClassGroups;
    v8->_gridSizeClassGroups = (NSSet *)v11;

  }
  return v8;
}

- (SBHImmutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3
{
  id v4;
  SBHImmutableIconGridSizeClassSet *v5;
  void *v6;
  uint64_t v7;
  NSSet *removedGridSizeClasses;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHImmutableIconGridSizeClassSet;
  v5 = -[SBHIconGridSizeClassSet initWithIconGridSizeClassSet:](&v10, sel_initWithIconGridSizeClassSet_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_removedGridSizeClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    removedGridSizeClasses = v5->_removedGridSizeClasses;
    v5->_removedGridSizeClasses = (NSSet *)v7;

  }
  return v5;
}

- (id)gridSizeClasses
{
  return self->_gridSizeClasses;
}

- (id)gridSizeClassGroups
{
  return self->_gridSizeClassGroups;
}

- (NSSet)_removedGridSizeClasses
{
  return self->_removedGridSizeClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_gridSizeClassGroups, 0);
  objc_storeStrong((id *)&self->_gridSizeClasses, 0);
}

@end
