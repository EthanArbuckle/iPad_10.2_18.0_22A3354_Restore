@implementation _UIFloatingTabBarCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (_UIFloatingTabBarCollectionViewLayout)initWithFloatingTabBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIFloatingTabBarCollectionViewLayout *v12;
  _UIFloatingTabBarCollectionViewLayout *v13;
  objc_super v15;
  _QWORD aBlock[4];
  id v17[5];
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  objc_msgSend(v4, "_currentPlatformMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundInsets");
  v7 = v6;
  v9 = v8;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIFloatingTabBarCollectionViewLayout_initWithFloatingTabBar___block_invoke;
  aBlock[3] = &unk_1E16EA818;
  objc_copyWeak(v17, &location);
  v17[1] = v7;
  v17[2] = 0;
  v17[3] = v9;
  v17[4] = 0;
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setScrollDirection:", 1);
  objc_msgSend(v11, "setContentInsetsReference:", 1);
  v15.receiver = self;
  v15.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  v12 = -[UICollectionViewCompositionalLayout initWithSectionProvider:configuration:](&v15, sel_initWithSectionProvider_configuration_, v10, v11);
  v13 = v12;
  if (v12)
    objc_storeWeak((id *)&v12->_floatingTabBar, v4);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v13;
}

- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing
{
  objc_super v4;

  if (-[_UIFloatingTabBarCollectionViewLayout _supportsGroupClusters](self, "_supportsGroupClusters"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  return -[UICollectionViewLayout _initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing](&v4, sel__initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing);
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  if (a5 == 2 && -[_UIFloatingTabBarCollectionViewLayout _supportsGroupClusters](self, "_supportsGroupClusters"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
    aBlock[3] = &unk_1E16EA868;
    aBlock[4] = self;
    v13 = v8;
    v14 = v9;
    v10 = _Block_copy(aBlock);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **p_vtable;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _UIFloatingTabBarCollectionViewLayout *v18;
  id v19;
  void **v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  id v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  -[UICollectionViewLayout prepareForCollectionViewUpdates:](&v31, sel_prepareForCollectionViewUpdates_, v4);
  if (-[_UIFloatingTabBarCollectionViewLayout _supportsGroupClusters](self, "_supportsGroupClusters"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      p_vtable = _UIDocumentUnavailablePageBackgroundAccessoryView.vtable;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v11, "updateAction", v25) == 1)
          {
            -[UICollectionViewLayout collectionView](self, "collectionView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "indexPathBeforeUpdate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cellForItemAtIndexPath:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "listItem");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "expandedGroupItem");
              v17 = v8;
              v18 = self;
              v19 = v5;
              v20 = p_vtable;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v15, "isEqual:", v21);

              p_vtable = v20;
              v5 = v19;
              self = v18;
              v8 = v17;

              if (v26)
              {
                objc_msgSend(v14, "contentView");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setHidden:", 1);

                objc_msgSend(v14, "frame");
                self->_expandingGroupCellOrigin.x = v23;
                self->_expandingGroupCellOrigin.y = v24;
              }
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    v4 = v25;
  }

}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  -[UICollectionViewCompositionalLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v16, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIFloatingTabBarCollectionViewLayout _supportsGroupClusters](self, "_supportsGroupClusters"))
  {
    -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifierForIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "expandedGroupItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if (v12)
    {
      -[_UIFloatingTabBarCollectionViewLayout _groupItemCellItemFrameForItemAtIndex:offset:](self, "_groupItemCellItemFrameForItemAtIndex:offset:", objc_msgSend(v8, "itemIndex"), self->_expandingGroupCellOrigin.x, self->_expandingGroupCellOrigin.y);
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v8, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "children");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setZIndex:", objc_msgSend(v14, "count") - objc_msgSend(v8, "itemIndex"));

      objc_msgSend(v5, "setAlpha:", 1.0);
      objc_msgSend(v5, "setGroupItemMinimized:", 1);
    }

  }
  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  -[UICollectionViewCompositionalLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v23, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIFloatingTabBarCollectionViewLayout _supportsGroupClusters](self, "_supportsGroupClusters"))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "listItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "outgoingExpandedGroupItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v11);

      if (v12)
      {
        objc_msgSend(v7, "listItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "indexPathForItemIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[UICollectionViewCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v13, "itemIndex");
        objc_msgSend(v18, "frame");
        -[_UIFloatingTabBarCollectionViewLayout _groupItemCellItemFrameForItemAtIndex:offset:](self, "_groupItemCellItemFrameForItemAtIndex:offset:", v19);
        objc_msgSend(v5, "setFrame:");
        objc_msgSend(v13, "parent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "children");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setZIndex:", objc_msgSend(v21, "count") - objc_msgSend(v13, "itemIndex"));

        objc_msgSend(v5, "setAlpha:", 1.0);
        objc_msgSend(v5, "setGroupItemMinimized:", 1);

      }
    }

  }
  return v5;
}

- (CGRect)_groupItemCellItemFrameForItemAtIndex:(int64_t)a3 offset:(CGPoint)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v35;
  CGRect v36;
  CGRect result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIFloatingTabBarGroupCell layoutFrameForItemAtIndex:traitCollection:](_UIFloatingTabBarGroupCell, "layoutFrameForItemAtIndex:traitCollection:", a3, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBar);
  objc_msgSend(WeakRetained, "_currentPlatformMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageMargins");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v35.origin.x = v9 - v21;
  v35.origin.y = v11 - v19;
  v35.size.width = v13 - (-v25 - v21);
  v35.size.height = v15 - (-v23 - v19);
  v36 = CGRectOffset(v35, a4.x, a4.y);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)_supportsGroupClusters
{
  void *v2;
  void *v3;
  char v4;

  -[_UIFloatingTabBarCollectionViewLayout floatingTabBar](self, "floatingTabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsGroupClusters");

  return v4;
}

- (_UIFloatingTabBar)floatingTabBar
{
  return (_UIFloatingTabBar *)objc_loadWeakRetained((id *)&self->_floatingTabBar);
}

- (void)setFloatingTabBar:(id)a3
{
  objc_storeWeak((id *)&self->_floatingTabBar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_floatingTabBar);
}

@end
