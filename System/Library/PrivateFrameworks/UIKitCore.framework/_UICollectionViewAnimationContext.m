@implementation _UICollectionViewAnimationContext

- (id)initWithDataSourceTranslator:(void *)a3 updates:(void *)a4 layout:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)_UICollectionViewAnimationContext;
    v11 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 5, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = a1[1];
      a1[1] = v12;

      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = a1[2];
      a1[2] = v14;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyVisibleItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_animationsForOnScreenViews, 0);
  objc_storeStrong((id *)&self->_disappearingAnimations, 0);
  objc_storeStrong((id *)&self->_appearingAnimations, 0);
  objc_storeStrong((id *)&self->_dataSourceTranslator, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_disappearingAttributesDict, 0);
  objc_storeStrong((id *)&self->_appearingAttributesDict, 0);
}

- (NSArray)updates
{
  return self->_updates;
}

- (NSArray)appearingAttributes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_updates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v9, "updateAction", (_QWORD)v14))
        {
          objc_msgSend(v9, "indexPathAfterUpdate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UICollectionViewAnimationContext initialLayoutAttributesForAppearingItemAtIndexPath:]((uint64_t)self, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v3, "addObject:", v12);

          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_initialLayoutAttributesForAppearingItemAtIndexPath:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAppearingAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "copy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appearingAttributesDict, "setObject:forKeyedSubscript:", v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (NSArray)disappearingAttributes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_updates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "updateAction", (_QWORD)v14) == 1)
        {
          objc_msgSend(v9, "indexPathBeforeUpdate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UICollectionViewAnimationContext finalLayoutAttributesForDisappearingItemAtIndexPath:]((uint64_t)self, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v3, "addObject:", v12);

          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_finalLayoutAttributesForDisappearingItemAtIndexPath:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDisappearingAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "indexPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)objc_msgSend(v9, "copy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_disappearingAttributesDict, "setObject:forKeyedSubscript:", v12, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  return -[_UICollectionViewUpdateTranslating finalGlobalIndexForInitialGlobalIndex:](self->_dataSourceTranslator, "finalGlobalIndexForInitialGlobalIndex:", a3);
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  return -[_UICollectionViewUpdateTranslating initialGlobalIndexForFinalGlobalIndex:](self->_dataSourceTranslator, "initialGlobalIndexForFinalGlobalIndex:", a3);
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  return (id)-[_UICollectionViewUpdateTranslating finalIndexPathForInitialIndexPath:](self->_dataSourceTranslator, "finalIndexPathForInitialIndexPath:", a3);
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  return (id)-[_UICollectionViewUpdateTranslating initialIndexPathForFinalIndexPath:](self->_dataSourceTranslator, "initialIndexPathForFinalIndexPath:", a3);
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  return -[_UICollectionViewUpdateTranslating finalSectionIndexForInitialSectionIndex:](self->_dataSourceTranslator, "finalSectionIndexForInitialSectionIndex:", a3);
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  return -[_UICollectionViewUpdateTranslating finalSectionIndexForInitialSectionIndex:](self->_dataSourceTranslator, "finalSectionIndexForInitialSectionIndex:", a3);
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return (id)-[_UICollectionViewUpdateTranslating finalIndexPathForSupplementaryElementOfKind:forInitialIndexPath:](self->_dataSourceTranslator, "finalIndexPathForSupplementaryElementOfKind:forInitialIndexPath:", a3, a4);
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return (id)-[_UICollectionViewUpdateTranslating initialIndexPathForSupplementaryElementOfKind:forFinalIndexPath:](self->_dataSourceTranslator, "initialIndexPathForSupplementaryElementOfKind:forFinalIndexPath:", a3, a4);
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UICollectionViewUpdateTranslating initalSectionGlobalItemRangeForSection:](self->_dataSourceTranslator, "initalSectionGlobalItemRangeForSection:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UICollectionViewUpdateTranslating finalSectionGlobalItemRangeForSection:](self->_dataSourceTranslator, "finalSectionGlobalItemRangeForSection:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)initialSectionCount
{
  return -[_UICollectionViewUpdateTranslating initialSectionCount](self->_dataSourceTranslator, "initialSectionCount");
}

- (int64_t)finalSectionCount
{
  return -[_UICollectionViewUpdateTranslating finalSectionCount](self->_dataSourceTranslator, "finalSectionCount");
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setAnimationsForOnScreenViews:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

@end
