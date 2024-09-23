@implementation SBHIconGridSizeClassSet

+ (SBHIconGridSizeClassSet)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (SBHIconGridSizeClassSet *)+[SBHIconGridSizeClassSet allocWithZone:](SBHImmutableIconGridSizeClassSet, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassSet;
  return (SBHIconGridSizeClassSet *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconGridSizeClassSet)initWithGridSizeClasses:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBHIconGridSizeClassSet *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v5, v6);

  return v7;
}

- (SBHIconGridSizeClassSet)initWithGridSizeClass:(id)a3
{
  void *v4;
  void *v5;
  SBHIconGridSizeClassSet *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v4, v5);

  return v6;
}

- (SBHIconGridSizeClassSet)initWithGridSizeClassGroups:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBHIconGridSizeClassSet *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v6, v5);

  return v7;
}

- (SBHIconGridSizeClassSet)initWithGridSizeClassGroup:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SBHIconGridSizeClassSet *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v6, v7);
  return v8;
}

- (SBHIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHIconGridSizeClassSet;
  return -[SBHIconGridSizeClassSet init](&v5, sel_init, a3, a4);
}

- (SBHIconGridSizeClassSet)init
{
  void *v3;
  void *v4;
  SBHIconGridSizeClassSet *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v3, v4);

  return v5;
}

- (SBHIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHIconGridSizeClassSet *v7;

  v4 = a3;
  objc_msgSend(v4, "gridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClassGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v5, v6);
  return v7;
}

+ (id)gridSizeClassSetForAllGridSizeClasses
{
  if (gridSizeClassSetForAllGridSizeClasses_onceToken != -1)
    dispatch_once(&gridSizeClassSetForAllGridSizeClasses_onceToken, &__block_literal_global_36);
  return (id)gridSizeClassSetForAllGridSizeClasses_gridSizeClassSet;
}

void __64__SBHIconGridSizeClassSet_gridSizeClassSetForAllGridSizeClasses__block_invoke()
{
  SBHAllIconGridSizeClassSet *v0;
  void *v1;

  v0 = objc_alloc_init(SBHAllIconGridSizeClassSet);
  v1 = (void *)gridSizeClassSetForAllGridSizeClasses_gridSizeClassSet;
  gridSizeClassSetForAllGridSizeClasses_gridSizeClassSet = (uint64_t)v0;

}

+ (id)gridSizeClassSetForAllNonDefaultGridSizeClasses
{
  if (gridSizeClassSetForAllNonDefaultGridSizeClasses_onceToken != -1)
    dispatch_once(&gridSizeClassSetForAllNonDefaultGridSizeClasses_onceToken, &__block_literal_global_7);
  return (id)gridSizeClassSetForAllNonDefaultGridSizeClasses_gridSizeClassSet;
}

void __74__SBHIconGridSizeClassSet_gridSizeClassSetForAllNonDefaultGridSizeClasses__block_invoke()
{
  SBHAllNonDefaultIconGridSizeClassSet *v0;
  void *v1;

  v0 = objc_alloc_init(SBHAllNonDefaultIconGridSizeClassSet);
  v1 = (void *)gridSizeClassSetForAllNonDefaultGridSizeClasses_gridSizeClassSet;
  gridSizeClassSetForAllNonDefaultGridSizeClasses_gridSizeClassSet = (uint64_t)v0;

}

+ (id)gridSizeClassSetForDefaultGridSizeClass
{
  if (gridSizeClassSetForDefaultGridSizeClass_onceToken != -1)
    dispatch_once(&gridSizeClassSetForDefaultGridSizeClass_onceToken, &__block_literal_global_9);
  return (id)gridSizeClassSetForDefaultGridSizeClass_gridSizeClassSet;
}

void __66__SBHIconGridSizeClassSet_gridSizeClassSetForDefaultGridSizeClass__block_invoke()
{
  SBHImmutableIconGridSizeClassSet *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBHImmutableIconGridSizeClassSet alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBHIconGridSizeClassDefault"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v0, "initWithGridSizeClasses:", v3);
  v2 = (void *)gridSizeClassSetForDefaultGridSizeClass_gridSizeClassSet;
  gridSizeClassSetForDefaultGridSizeClass_gridSizeClassSet = v1;

}

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHIconGridSizeClassSet _removedGridSizeClasses](self, "_removedGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v9 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v8);
            if ((SBHIconGridSizeClassGroupContainsGridSizeClass(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v4) & 1) != 0)
            {
              LOBYTE(v6) = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }

  return v6;
}

- (BOOL)containsGridSizeClass:(id)a3 inDomain:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (-[SBHIconGridSizeClassSet containsGridSizeClass:](self, "containsGridSizeClass:", v6))
    v8 = objc_msgSend(v7, "containsGridSizeClass:", v6);
  else
    v8 = 0;

  return v8;
}

- (NSSet)allGridSizeClasses
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet _removedGridSizeClasses](self, "_removedGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v4, "count"))
  {
    v6 = (id)objc_msgSend(v3, "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          SBHIconGridSizeClassGroupGetSizeClasses(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "unionSet:", v12, (_QWORD)v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (v4)
      objc_msgSend(v6, "minusSet:", v4);
  }
  else
  {
    v6 = v3;
  }
  v13 = (NSSet *)v6;

  return v13;
}

- (id)allGridSizeClassesInDomain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet gridSizeClassSetByIntersectingWithGridSizeClassSet:](self, "gridSizeClassSetByIntersectingWithGridSizeClassSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allGridSizeClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[SBHIconGridSizeClassSet allGridSizeClasses](self, "allGridSizeClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  return -[SBHIconGridSizeClassSet count](self, "count") == 0;
}

- (void)enumerateGridSizeClassesUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHIconGridSizeClassSet allGridSizeClasses](self, "allGridSizeClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (void)enumerateGridSizeClassesInDomain:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBHIconGridSizeClassSet allGridSizeClassesInDomain:](self, "allGridSizeClassesInDomain:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v6);

}

- (id)gridSizeClassSetByUnioningWithGridSizeClassSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBHIconGridSizeClassSet *v9;

  v4 = a3;
  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClassGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToSet:", v6) && objc_msgSend(v7, "isEqualToSet:", v8))
  {
    v9 = self;
  }
  else
  {
    v9 = (SBHIconGridSizeClassSet *)-[SBHIconGridSizeClassSet mutableCopy](self, "mutableCopy");
    -[SBHIconGridSizeClassSet unionGridSizeClassSet:](v9, "unionGridSizeClassSet:", v4);
  }

  return v9;
}

- (id)gridSizeClassSetByIntersectingWithGridSizeClassSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBHIconGridSizeClassSet *v9;

  v4 = a3;
  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClassGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToSet:", v6) && objc_msgSend(v7, "isEqualToSet:", v8))
  {
    v9 = self;
  }
  else
  {
    v9 = (SBHIconGridSizeClassSet *)-[SBHIconGridSizeClassSet mutableCopy](self, "mutableCopy");
    -[SBHIconGridSizeClassSet intersectGridSizeClassSet:](v9, "intersectGridSizeClassSet:", v4);
  }

  return v9;
}

- (id)gridSizeClassSetByAddingGridSizeClass:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[SBHIconGridSizeClassSet containsGridSizeClass:](self, "containsGridSizeClass:", v4))
  {
    v5 = (void *)-[SBHIconGridSizeClassSet copy](self, "copy");
  }
  else
  {
    v5 = (void *)-[SBHIconGridSizeClassSet mutableCopy](self, "mutableCopy");
    objc_msgSend(v5, "addGridSizeClass:", v4);
  }

  return v5;
}

- (id)gridSizeClassSetByRemovingGridSizeClass:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[SBHIconGridSizeClassSet containsGridSizeClass:](self, "containsGridSizeClass:", v4))
  {
    v5 = (void *)-[SBHIconGridSizeClassSet mutableCopy](self, "mutableCopy");
    objc_msgSend(v5, "removeGridSizeClass:", v4);
  }
  else
  {
    v5 = (void *)-[SBHIconGridSizeClassSet copy](self, "copy");
  }

  return v5;
}

- (id)_removedGridSizeClasses
{
  return 0;
}

- (BOOL)isAllGridSizeClassSet
{
  return 0;
}

- (BOOL)isAllNonDefaultGridSizeClassSet
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconGridSizeClassSet *v4;
  void *v5;
  char isKindOfClass;
  SBHIconGridSizeClassSet *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (SBHIconGridSizeClassSet *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconGridSizeClassSet gridSizeClasses](v7, "gridSizeClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualSets();

      if (v10)
      {
        -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconGridSizeClassSet gridSizeClassGroups](v7, "gridSizeClassGroups");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualSets();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SBHIconGridSizeClassSet _removedGridSizeClasses](self, "_removedGridSizeClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  -[SBHIconGridSizeClassSet appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)descriptionWithGridSizeClassDomain:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D01750];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBHIconGridSizeClassSet appendDescriptionToFormatter:gridSizeClassDomain:](self, "appendDescriptionToFormatter:gridSizeClassDomain:", v6, v5);

  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBHMutableIconGridSizeClassSet initWithIconGridSizeClassSet:](+[SBHIconGridSizeClassSet allocWithZone:](SBHMutableIconGridSizeClassSet, "allocWithZone:", a3), "initWithIconGridSizeClassSet:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("gridSizeClasses"));

  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("gridSizeClassGroups"));

}

- (SBHIconGridSizeClassSet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBHIconGridSizeClassSet *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("gridSizeClasses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("gridSizeClasses"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](self, "initWithGridSizeClasses:gridSizeClassGroups:", v9, v14);
  return v15;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSet appendDescriptionToFormatter:gridSizeClassDomain:](self, "appendDescriptionToFormatter:gridSizeClassDomain:", v4, v5);

}

- (void)appendDescriptionToFormatter:(id)a3 gridSizeClassDomain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;

  v14 = a3;
  v6 = a4;
  -[SBHIconGridSizeClassSet gridSizeClasses](self, "gridSizeClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __76__SBHIconGridSizeClassSet_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke;
    v19 = &unk_1E8D890F8;
    v20 = v6;
    objc_msgSend(v8, "bs_map:", &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:withName:skipIfEmpty:", v10, CFSTR("gridSizeClasses"), 1);

  }
  -[SBHIconGridSizeClassSet gridSizeClassGroups](self, "gridSizeClassGroups", v14, v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:withName:skipIfEmpty:", v13, CFSTR("gridSizeClassGroups"), 1);

  }
}

uint64_t __76__SBHIconGridSizeClassSet_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptionForGridSizeClass:", a2);
}

- (SBHIconGridSizeClassSet)initWithCHSWidgetFamilyMask:(unint64_t)a3
{
  void *v5;
  SBHIconGridSizeClassSet *v6;

  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:](self, "initWithCHSWidgetFamilyMask:inDomain:", a3, v5);

  return v6;
}

- (SBHIconGridSizeClassSet)initWithCHSWidgetFamilyMask:(unint64_t)a3 inDomain:(id)a4
{
  id v6;
  id v7;
  uint8x8_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  SBHIconGridSizeClassSet *v12;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v8.i32[0];
  if (v8.i32[0])
  {
    v10 = 0;
    do
    {
      if ((a3 & 1) != 0)
      {
        objc_msgSend(v6, "iconGridSizeClassForCHSWidgetFamily:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v7, "addObject:", v11);
        --v9;

      }
      a3 >>= 1;
      ++v10;
    }
    while (v9 > 0);
  }
  v12 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](self, "initWithGridSizeClasses:", v7);

  return v12;
}

- (unint64_t)chsWidgetFamilyMask
{
  void *v3;
  unint64_t v4;

  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHIconGridSizeClassSet chsWidgetFamilyMaskInDomain:](self, "chsWidgetFamilyMaskInDomain:", v3);

  return v4;
}

- (unint64_t)chsWidgetFamilyMaskInDomain:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SBHIconGridSizeClassSet_SBHCHSWidgetFamily__chsWidgetFamilyMaskInDomain___block_invoke;
  v8[3] = &unk_1E8D8B2D0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBHIconGridSizeClassSet enumerateGridSizeClassesUsingBlock:](self, "enumerateGridSizeClassesUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __75__SBHIconGridSizeClassSet_SBHCHSWidgetFamily__chsWidgetFamilyMaskInDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "chsWidgetFamilyForIconGridSizeClass:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1 << result;
  return result;
}

@end
