@implementation _UIDiffableDataSourceExpandCollapseAnimationContext

- (uint64_t)_visibleIndexForIndex:(void *)a3 identifiers:(void *)a4 visibleIdentifiers:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "count") <= a2)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "indexOfObject:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)indexPathsForExpandedParentItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_identifiersOfExpandedItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_identifiersOfExpandedItems, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_identifiersOfExpandedItems;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[NSOrderedSet indexOfObject:](self->_initialVisibleIdentifiers, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, self->_sectionIndex);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)indexPathsForChildItemsInExpandingParent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  -[NSOrderedSet objectAtIndex:](self->_initialVisibleIdentifiers, "objectAtIndex:", objc_msgSend(a3, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceSectionSnapshot _indexesOfChildrenForParent:recursive:](self->_finalSectionSnapshot, "_indexesOfChildrenForParent:recursive:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInExpandingParent___block_invoke;
  v11[3] = &unk_1E16B2978;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)indexPathsForCollapsedParentItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_identifiersOfCollapsedItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_identifiersOfCollapsedItems, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_identifiersOfCollapsedItems;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[NSOrderedSet indexOfObject:](self->_initialVisibleIdentifiers, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, self->_sectionIndex);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)indexPathsForChildItemsInCollapsingParent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  -[NSOrderedSet objectAtIndex:](self->_initialVisibleIdentifiers, "objectAtIndex:", objc_msgSend(a3, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceSectionSnapshot _indexesOfChildrenForParent:recursive:](self->_finalSectionSnapshot, "_indexesOfChildrenForParent:recursive:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInCollapsingParent___block_invoke;
  v11[3] = &unk_1E16B2978;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfCollapsedItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfExpandedItems, 0);
  objc_storeStrong((id *)&self->_finalVisibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialVisibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalSectionSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSectionSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end
