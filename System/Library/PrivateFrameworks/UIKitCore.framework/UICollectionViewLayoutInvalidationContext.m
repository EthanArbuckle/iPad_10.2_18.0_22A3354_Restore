@implementation UICollectionViewLayoutInvalidationContext

- (void)_removeInvalidatedItemIndexPath:(id)a3
{
  -[NSMutableSet removeObject:](self->_invalidatedItemIndexPaths, "removeObject:", a3);
}

- (BOOL)invalidateDataSourceCounts
{
  return *(_BYTE *)&self->_invalidationContextFlags & 1;
}

- (int64_t)_intent
{
  return self->_intent;
}

- (BOOL)invalidateEverything
{
  return (*(_BYTE *)&self->_invalidationContextFlags >> 1) & 1;
}

- (NSArray)invalidatedItemIndexPaths
{
  return (NSArray *)-[NSMutableSet allObjects](self->_invalidatedItemIndexPaths, "allObjects");
}

- (NSDictionary)invalidatedSupplementaryIndexPaths
{
  void *v3;
  NSMutableDictionary *invalidatedSupplementaryIndexPaths;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!self->_invalidatedSupplementaryIndexPaths)
    return (NSDictionary *)0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_invalidatedSupplementaryIndexPaths, "count"));
  invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__UICollectionViewLayoutInvalidationContext_invalidatedSupplementaryIndexPaths__block_invoke;
  v7[3] = &unk_1E16BDFD8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](invalidatedSupplementaryIndexPaths, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

- (NSDictionary)invalidatedDecorationIndexPaths
{
  void *v3;
  NSMutableDictionary *invalidatedDecorationIndexPaths;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!self->_invalidatedDecorationIndexPaths)
    return (NSDictionary *)0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_invalidatedDecorationIndexPaths, "count"));
  invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__UICollectionViewLayoutInvalidationContext_invalidatedDecorationIndexPaths__block_invoke;
  v7[3] = &unk_1E16BDFD8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](invalidatedDecorationIndexPaths, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

- (CGSize)contentSizeAdjustment
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeAdjustment.width;
  height = self->_contentSizeAdjustment.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)contentOffsetAdjustment
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffsetAdjustment.x;
  y = self->_contentOffsetAdjustment.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_shouldInvalidateCollectionViewContentSize
{
  return (*(_BYTE *)&self->_invalidationContextFlags >> 2) & 1;
}

- (BOOL)_requiresFullCacheInvalidation
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;

  if (!a1)
    return 0;
  if ((a1[112] & 0x10) != 0
    || dyld_program_sdk_at_least() && (objc_msgSend(a1, "invalidateEverything") & 1) != 0)
  {
    return 1;
  }
  objc_msgSend(a1, "invalidatedItemIndexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "invalidatedSupplementaryIndexPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(a1, "invalidatedDecorationIndexPaths");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "count") == 0;

    }
  }

  v6 = objc_msgSend(a1, "_intent");
  v7 = v6;
  if (v6 > 0xF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__requiresFullCacheInvalidation, a1, CFSTR("UICollectionViewLayout.m"), 986, CFSTR("UICollectionView internal bug: Created context with unknown intent: %lld. Context: %@"), v7, a1);

    return 1;
  }
  if (((1 << v6) & 0xE5B) == 0)
    return ((1 << v6) & 0x71A4) != 0;
  return v3;
}

- (void)_setInvalidateEverything:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_invalidationContextFlags = *(_BYTE *)&self->_invalidationContextFlags & 0xFD | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexPathsForItemsRequiringPreferredAttributes, 0);
  objc_storeStrong((id *)&self->_orthogonalSectionsWithContentSizeChanges, 0);
  objc_storeStrong((id *)&self->_targetIndexPathsForReorderedItems, 0);
  objc_storeStrong((id *)&self->_previousIndexPathsForReorderedItems, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_invalidatedDecorationIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedSupplementaryIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedItemIndexPaths, 0);
}

- (void)_setInvalidateDataSourceCounts:(BOOL)a3
{
  *(_BYTE *)&self->_invalidationContextFlags = *(_BYTE *)&self->_invalidationContextFlags & 0xFE | a3;
}

- (void)_setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (void)_setUpdateItems:(id)a3
{
  NSArray **p_updateItems;
  NSArray *updateItems;

  updateItems = self->_updateItems;
  p_updateItems = &self->_updateItems;
  if (updateItems != a3)
    objc_storeStrong((id *)p_updateItems, a3);
}

- (id)_invalidatedSupplementaryViews
{
  return self->_invalidatedSupplementaryIndexPaths;
}

void __79__UICollectionViewLayoutInvalidationContext_invalidatedSupplementaryIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  objc_msgSend(a3, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

- (void)invalidateItemsAtIndexPaths:(NSArray *)indexPaths
{
  NSMutableSet *invalidatedItemIndexPaths;
  NSMutableSet *v6;
  NSMutableSet *v7;

  if (-[NSArray count](indexPaths, "count"))
  {
    invalidatedItemIndexPaths = self->_invalidatedItemIndexPaths;
    if (!invalidatedItemIndexPaths)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_invalidatedItemIndexPaths;
      self->_invalidatedItemIndexPaths = v6;

      invalidatedItemIndexPaths = self->_invalidatedItemIndexPaths;
    }
    -[NSMutableSet addObjectsFromArray:](invalidatedItemIndexPaths, "addObjectsFromArray:", indexPaths);
  }
}

- (void)setContentOffsetAdjustment:(CGPoint)contentOffsetAdjustment
{
  self->_contentOffsetAdjustment = contentOffsetAdjustment;
}

- (void)_invalidateSupplementaryElementsOfKind:(id)a3 atIndexPaths:(id)a4
{
  NSMutableDictionary *invalidatedSupplementaryIndexPaths;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  if (a3 && a4)
  {
    invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
    if (!invalidatedSupplementaryIndexPaths)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_invalidatedSupplementaryIndexPaths;
      self->_invalidatedSupplementaryIndexPaths = v8;

      invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](invalidatedSupplementaryIndexPaths, "objectForKeyedSubscript:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v11, "addObjectsFromArray:", a4);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_invalidatedSupplementaryIndexPaths, "setObject:forKeyedSubscript:", v10, a3);

    }
  }
}

- (_QWORD)_orthogonalSectionsWithContentSizeChanges
{
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[13];
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v4 = (void *)v1[13];
      v1[13] = v3;

      v2 = (void *)v1[13];
    }
    a1 = v2;
  }
  return a1;
}

- (void)invalidateDecorationElementsOfKind:(NSString *)elementKind atIndexPaths:(NSArray *)indexPaths
{
  NSMutableDictionary *invalidatedDecorationIndexPaths;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
  if (!invalidatedDecorationIndexPaths)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_invalidatedDecorationIndexPaths;
    self->_invalidatedDecorationIndexPaths = v8;

    invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](invalidatedDecorationIndexPaths, "objectForKeyedSubscript:", elementKind);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10)
  {
    objc_msgSend(v10, "addObjectsFromArray:", indexPaths);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", indexPaths);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_invalidatedDecorationIndexPaths, "setObject:forKeyedSubscript:", v11, elementKind);

  }
}

- (BOOL)_retainExistingSizingInfoForEstimates
{
  return self->_retainExistingSizingInfoForEstimates;
}

void __76__UICollectionViewLayoutInvalidationContext_invalidatedDecorationIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  objc_msgSend(a3, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

- (void)_setShouldInvalidateCollectionViewContentSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_invalidationContextFlags = *(_BYTE *)&self->_invalidationContextFlags & 0xFB | v3;
}

- (void)_setInvalidatedSupplementaryViews:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *invalidatedSupplementaryIndexPaths;
  _QWORD v7[5];

  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
  invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
  self->_invalidatedSupplementaryIndexPaths = v5;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__UICollectionViewLayoutInvalidationContext__setInvalidatedSupplementaryViews___block_invoke;
  v7[3] = &unk_1E16B4FF0;
  v7[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
}

void __79__UICollectionViewLayoutInvalidationContext__setInvalidatedSupplementaryViews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(a3, "mutableCopy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  }
  v7 = (id)v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v6, a2);

}

- (void)_removeInvalidatedSupplementaryOfKind:(id)a3 indexPath:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedSupplementaryIndexPaths, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, "removeObject:", a4);
    v9 = objc_msgSend(v10, "count");
    v8 = v10;
    if (!v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_invalidatedSupplementaryIndexPaths, "removeObjectForKey:", a3);
      v8 = v10;
    }
  }

}

- (void)_removeInvalidatedDecorationOfKind:(id)a3 indexPath:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedDecorationIndexPaths, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, "removeObject:", a4);
    v9 = objc_msgSend(v10, "count");
    v8 = v10;
    if (!v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_invalidatedDecorationIndexPaths, "removeObjectForKey:", a3);
      v8 = v10;
    }
  }

}

- (NSArray)_updateItems
{
  return objc_retainAutorelease(self->_updateItems);
}

- (void)setContentSizeAdjustment:(CGSize)contentSizeAdjustment
{
  self->_contentSizeAdjustment = contentSizeAdjustment;
}

- (NSArray)previousIndexPathsForInteractivelyMovingItems
{
  return self->_previousIndexPathsForReorderedItems;
}

- (void)_setPreviousIndexPathsForInteractivelyMovingItems:(id)a3
{
  NSArray *v4;
  NSArray *previousIndexPathsForReorderedItems;

  if (self->_previousIndexPathsForReorderedItems != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    previousIndexPathsForReorderedItems = self->_previousIndexPathsForReorderedItems;
    self->_previousIndexPathsForReorderedItems = v4;

  }
}

- (NSArray)targetIndexPathsForInteractivelyMovingItems
{
  return self->_targetIndexPathsForReorderedItems;
}

- (void)_setTargetIndexPathsForInteractivelyMovingItems:(id)a3
{
  NSArray **p_targetIndexPathsForReorderedItems;
  NSArray *targetIndexPathsForReorderedItems;

  targetIndexPathsForReorderedItems = self->_targetIndexPathsForReorderedItems;
  p_targetIndexPathsForReorderedItems = &self->_targetIndexPathsForReorderedItems;
  if (targetIndexPathsForReorderedItems != a3)
    objc_storeStrong((id *)p_targetIndexPathsForReorderedItems, a3);
}

- (CGPoint)interactiveMovementTarget
{
  double x;
  double y;
  CGPoint result;

  x = self->_reorderingTarget.x;
  y = self->_reorderingTarget.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInteractiveMovementTarget:(CGPoint)a3
{
  self->_reorderingTarget = a3;
}

- (void)_setRequiresFullCacheInvalidation
{
  *(_BYTE *)&self->_invalidationContextFlags |= 0x10u;
}

- (void)_setRetainExistingSizingInfoForEstimates:(BOOL)a3
{
  self->_retainExistingSizingInfoForEstimates = a3;
}

@end
