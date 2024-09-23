@implementation SBHMutableIconGridSizeClassSet

- (SBHMutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4
{
  id v6;
  id v7;
  SBHMutableIconGridSizeClassSet *v8;
  uint64_t v9;
  NSMutableSet *gridSizeClasses;
  uint64_t v11;
  NSMutableSet *gridSizeClassGroups;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHMutableIconGridSizeClassSet;
  v8 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](&v14, sel_initWithGridSizeClasses_gridSizeClassGroups_, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    gridSizeClasses = v8->_gridSizeClasses;
    v8->_gridSizeClasses = (NSMutableSet *)v9;

    v11 = objc_msgSend(v7, "mutableCopy");
    gridSizeClassGroups = v8->_gridSizeClassGroups;
    v8->_gridSizeClassGroups = (NSMutableSet *)v11;

  }
  return v8;
}

- (SBHMutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3
{
  id v4;
  SBHMutableIconGridSizeClassSet *v5;
  void *v6;
  uint64_t v7;
  NSMutableSet *removedGridSizeClasses;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHMutableIconGridSizeClassSet;
  v5 = -[SBHIconGridSizeClassSet initWithIconGridSizeClassSet:](&v10, sel_initWithIconGridSizeClassSet_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_removedGridSizeClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    removedGridSizeClasses = v5->_removedGridSizeClasses;
    v5->_removedGridSizeClasses = (NSMutableSet *)v7;

  }
  return v5;
}

- (NSSet)gridSizeClasses
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_gridSizeClasses, "copy");
}

- (void)setGridSizeClasses:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *gridSizeClasses;
  id v6;

  v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSMutableSet *)objc_msgSend(v6, "mutableCopy");
    gridSizeClasses = self->_gridSizeClasses;
    self->_gridSizeClasses = v4;

  }
}

- (void)addGridSizeClass:(id)a3
{
  -[NSMutableSet addObject:](self->_gridSizeClasses, "addObject:", a3);
}

- (void)removeGridSizeClass:(id)a3
{
  NSMutableSet *removedGridSizeClasses;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  -[NSMutableSet removeObject:](self->_gridSizeClasses, "removeObject:");
  removedGridSizeClasses = self->_removedGridSizeClasses;
  if (!removedGridSizeClasses)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_removedGridSizeClasses;
    self->_removedGridSizeClasses = v5;

    removedGridSizeClasses = self->_removedGridSizeClasses;
  }
  -[NSMutableSet addObject:](removedGridSizeClasses, "addObject:", v7);

}

- (NSSet)gridSizeClassGroups
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_gridSizeClassGroups, "copy");
}

- (void)setGridSizeClassGroups:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *gridSizeClassGroups;
  id v6;

  v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSMutableSet *)objc_msgSend(v6, "mutableCopy");
    gridSizeClassGroups = self->_gridSizeClassGroups;
    self->_gridSizeClassGroups = v4;

  }
}

- (void)addGridSizeClassGroup:(id)a3
{
  -[NSMutableSet addObject:](self->_gridSizeClassGroups, "addObject:", a3);
}

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4;
  int v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHMutableIconGridSizeClassSet;
  if (-[SBHIconGridSizeClassSet containsGridSizeClass:](&v7, sel_containsGridSizeClass_, v4)
    || self->_containsAllGridSizeClasses)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
    if (v4 && self->_containsAllNonDefaultGridSizeClasses)
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;
  }

  return v5;
}

- (void)unionGridSizeClassSet:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isAllGridSizeClassSet"))
  {
    v4 = 32;
  }
  else
  {
    if (!objc_msgSend(v8, "isAllNonDefaultGridSizeClassSet"))
    {
      -[SBHIconGridSizeClassSet allGridSizeClasses](self, "allGridSizeClasses");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allGridSizeClasses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "unionSet:", v6);
      -[SBHMutableIconGridSizeClassSet _replaceAllGridSizeClassesWithGridSizeClasses:](self, "_replaceAllGridSizeClassesWithGridSizeClasses:", v7);

      goto LABEL_7;
    }
    v4 = 33;
  }
  *((_BYTE *)&self->super.super.isa + v4) = 1;
LABEL_7:

}

- (void)intersectGridSizeClassSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isAllGridSizeClassSet") & 1) == 0)
  {
    self->_containsAllGridSizeClasses = 0;
    self->_containsAllNonDefaultGridSizeClasses = 0;
    -[SBHIconGridSizeClassSet allGridSizeClasses](self, "allGridSizeClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allGridSizeClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    if ((objc_msgSend(v7, "isAllNonDefaultGridSizeClassSet") & 1) != 0)
      objc_msgSend(v6, "removeObject:", CFSTR("SBHIconGridSizeClassDefault"));
    else
      objc_msgSend(v6, "intersectSet:", v5);
    -[SBHMutableIconGridSizeClassSet _replaceAllGridSizeClassesWithGridSizeClasses:](self, "_replaceAllGridSizeClassesWithGridSizeClasses:", v6);

  }
}

- (id)_removedGridSizeClasses
{
  return self->_removedGridSizeClasses;
}

- (void)_replaceAllGridSizeClassesWithGridSizeClasses:(id)a3
{
  NSMutableSet *removedGridSizeClasses;
  id v5;

  removedGridSizeClasses = self->_removedGridSizeClasses;
  v5 = a3;
  -[NSMutableSet removeAllObjects](removedGridSizeClasses, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_gridSizeClassGroups, "removeAllObjects");
  -[NSMutableSet setSet:](self->_gridSizeClasses, "setSet:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBHImmutableIconGridSizeClassSet initWithIconGridSizeClassSet:](+[SBHIconGridSizeClassSet allocWithZone:](SBHImmutableIconGridSizeClassSet, "allocWithZone:", a3), "initWithIconGridSizeClassSet:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClassGroups, 0);
  objc_storeStrong((id *)&self->_removedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_gridSizeClasses, 0);
}

@end
