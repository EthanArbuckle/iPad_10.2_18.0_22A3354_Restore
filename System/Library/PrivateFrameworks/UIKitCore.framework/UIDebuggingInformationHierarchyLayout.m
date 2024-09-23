@implementation UIDebuggingInformationHierarchyLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  -[UICollectionViewLayout prepareLayout](&v3, sel_prepareLayout);
  -[UIDebuggingInformationHierarchyLayout _recomputeAttributes](self, "_recomputeAttributes");
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  NSMutableArray *indexPathsToDelete;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *allLineAttributes;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  -[UICollectionViewLayout prepareForCollectionViewUpdates:](&v25, sel_prepareForCollectionViewUpdates_, v4);
  indexPathsToDelete = self->_indexPathsToDelete;
  if (indexPathsToDelete)
  {
    -[NSMutableArray removeAllObjects](indexPathsToDelete, "removeAllObjects");
  }
  else
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_indexPathsToDelete;
    self->_indexPathsToDelete = v6;

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        allLineAttributes = self->_allLineAttributes;
        objc_msgSend(v13, "indexPathBeforeUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](allLineAttributes, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = self->_indexPathsToDelete;
          objc_msgSend(v13, "indexPathBeforeUpdate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v17, "addObject:", v18);

          v19 = self->_allLineAttributes;
          objc_msgSend(v13, "indexPathBeforeUpdate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[UIDebuggingInformationHierarchyLayout invalidateLayout](self, "invalidateLayout");
}

- (void)_recomputeAttributes
{
  unint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double Width;
  id *p_delegate;
  id WeakRetained;
  unint64_t v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  double v26;
  id v27;
  NSDictionary *allAttributes;
  NSDictionary *v29;
  NSMutableDictionary *allLineAttributes;
  NSMutableDictionary *v31;
  NSDictionary *v32;
  UIDebuggingInformationHierarchyLayout *v33;
  id v34;
  CGRect v35;

  v32 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = self;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "numberOfSections"))
  {
    v3 = 0;
    v4 = -1.0;
    v5 = 0.0;
    do
    {
      if (objc_msgSend(v34, "numberOfItemsInSection:", v3))
      {
        v6 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](UICollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "bounds");
          Width = CGRectGetWidth(v35);
          p_delegate = (id *)&v33->_delegate;
          WeakRetained = objc_loadWeakRetained((id *)&v33->_delegate);
          v12 = objc_msgSend(WeakRetained, "indentationLevelForIndexPath:", v7);
          v13 = (double)v12;

          objc_msgSend(v8, "setZIndex:", 2);
          objc_msgSend(v8, "setFrame:", v13 * 10.0, v5, Width - v13 * 10.0, 32.0);
          v14 = objc_loadWeakRetained((id *)&v33->_delegate);
          objc_msgSend(v8, "setHidden:", objc_msgSend(v14, "shouldCollapseAtIndexPath:", v7));

          -[NSDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v8, v7);
          +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](UIDebuggingInformationHierarchyLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("line"), v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_loadWeakRetained((id *)&v33->_delegate);
          objc_msgSend(v16, "colorForIndentationLevel:", (unint64_t)(double)v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setLineColor:", v17);

          if (v12 < 2 || v4 == v13)
          {
            ++v6;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", ++v6, v3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_loadWeakRetained(p_delegate);
            v20 = (double)(unint64_t)objc_msgSend(v19, "indentationLevelForIndexPath:", v18);

            if (v20 >= v13)
            {
              v21 = 32.0;
              v22 = v18;
              do
              {
                v23 = objc_loadWeakRetained(p_delegate);
                v24 = objc_msgSend(v23, "shouldCollapseAtIndexPath:", v22);

                if (!v24)
                  v21 = v21 + 35.0;
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v22, "row") + 1, v3);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v25 = objc_loadWeakRetained(p_delegate);
                v26 = (double)(unint64_t)objc_msgSend(v25, "indentationLevelForIndexPath:", v18);

                v22 = v18;
              }
              while (v26 >= v13);
            }
            else
            {
              v21 = 32.0;
            }
            objc_msgSend(v15, "setFrame:", v13 * 10.0 + -10.0, v5 + 0.0, 2.0, v21);
            objc_msgSend(v15, "setSize:", 2.0, v21);
            v27 = objc_loadWeakRetained(p_delegate);
            objc_msgSend(v15, "setHidden:", objc_msgSend(v27, "shouldCollapseAtIndexPath:", v7));

            objc_msgSend(v15, "setZIndex:", 1);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v15, v7);

          }
          if (!objc_msgSend(v8, "isHidden"))
            v5 = v5 + 35.0;

          v4 = v13;
        }
        while (v6 < objc_msgSend(v34, "numberOfItemsInSection:", v3));
      }
      else
      {
        v13 = v4;
      }
      ++v3;
      v4 = v13;
    }
    while (v3 < objc_msgSend(v34, "numberOfSections"));
  }
  allAttributes = v33->_allAttributes;
  v33->_allAttributes = v32;
  v29 = v32;

  allLineAttributes = v33->_allLineAttributes;
  v33->_allLineAttributes = v31;

}

- (void)invalidateLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  -[UICollectionViewLayout invalidateLayout](&v3, sel_invalidateLayout);
  -[UIDebuggingInformationHierarchyLayout _recomputeAttributes](self, "_recomputeAttributes");
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double Width;
  void *v5;
  BOOL v6;
  CGRect v8;

  Width = CGRectGetWidth(a3);
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = Width != CGRectGetWidth(v8);

  return v6;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  return self->_indexPathsToDelete;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[UIDebuggingInformationHierarchyLayout allAttributes](self, "allAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  if (a4)
  {
    v5 = a4;
    -[UIDebuggingInformationHierarchyLayout allLineAttributes](self, "allLineAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIDebuggingInformationHierarchyLayout allAttributes](self, "allAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__UIDebuggingInformationHierarchyLayout_layoutAttributesForElementsInRect___block_invoke;
  v14[3] = &unk_1E16E7C10;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

void __75__UIDebuggingInformationHierarchyLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id WeakRetained;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CGRect v16;

  v15 = a2;
  v5 = a3;
  objc_msgSend(v5, "frame");
  v16.origin.x = v6;
  v16.origin.y = v7;
  v16.size.width = v8;
  v16.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v16))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    v11 = objc_msgSend(WeakRetained, "shouldCollapseAtIndexPath:", v15);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "objectForKeyedSubscript:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "objectForKeyedSubscript:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
    }
  }

}

- (CGSize)collectionViewContentSize
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  CGFloat Width;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4)
  {
    v5 = 0;
    v6 = 0.0;
    do
    {
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfItemsInSection:", v5);

      if (v8)
      {
        v9 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v12 = objc_msgSend(WeakRetained, "shouldCollapseAtIndexPath:", v10);

          if (!v12)
            v6 = v6 + 35.0;

          ++v9;
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "numberOfItemsInSection:", v5);

        }
        while (v9 < v14);
      }
      ++v5;
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfSections");

    }
    while (v5 < v16);
  }
  else
  {
    v6 = 0.0;
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  Width = CGRectGetWidth(v22);

  v19 = Width;
  v20 = v6;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIDebuggingInformationHierarchyLayoutDelegate)delegate
{
  return (UIDebuggingInformationHierarchyLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)allAttributes
{
  return self->_allAttributes;
}

- (void)setAllAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_allAttributes, a3);
}

- (NSMutableDictionary)allLineAttributes
{
  return self->_allLineAttributes;
}

- (void)setAllLineAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_allLineAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLineAttributes, 0);
  objc_storeStrong((id *)&self->_allAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexPathsToDelete, 0);
}

@end
