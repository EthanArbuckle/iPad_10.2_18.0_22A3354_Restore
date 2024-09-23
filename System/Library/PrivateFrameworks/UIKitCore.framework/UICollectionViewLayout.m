@implementation UICollectionViewLayout

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
  void *v5;
  void *v6;
  void *v7;

  -[UICollectionViewLayout _collectionViewAnimationContext](self, "_collectionViewAnimationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[UICollectionViewLayout _collectionViewAnimationContext](self, "_collectionViewAnimationContext"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_UICollectionViewAnimationContext initialLayoutAttributesForAppearingItemAtIndexPath:]((uint64_t)v6, itemIndexPath), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    -[UICollectionViewLayout _initialLayoutAttributesForAppearingItemAtIndexPath:](self, "_initialLayoutAttributesForAppearingItemAtIndexPath:", itemIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (_UICollectionViewAnimationContext)_collectionViewAnimationContext
{
  return self->_collectionViewAnimationContext;
}

- (id)_initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  UICollectionViewLayout *transitioningFromLayout;
  id *v12;
  void *v13;
  char v14;

  if (-[NSMutableDictionary count](self->_initialAnimationLayoutAttributesDict, "count"))
  {
    +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_initialAnimationLayoutAttributesDict, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = objc_msgSend(a3, "section");
    if (v8 >= objc_msgSend(v7, "numberOfSections")
      || (v9 = objc_msgSend(a3, "item"), v9 >= objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(a3, "section"))))
    {
      v6 = 0;
      goto LABEL_11;
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(_BYTE *)&self->_layoutFlags & 1) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self->_transitioningFromLayout, "layoutAttributesForItemAtIndexPath:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v7, "_currentUpdate");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v13, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0 || !v12)
    {
      if (transitioningFromLayout)
        goto LABEL_17;
    }
    else
    {
      v14 = objc_msgSend(v12[9], "containsIndex:", objc_msgSend(a3, "section"));
      if (transitioningFromLayout || (v14 & 1) == 0)
        goto LABEL_17;
    }
    objc_msgSend(v6, "setAlpha:", 0.0);
LABEL_17:

  }
LABEL_11:

  return v6;
}

- (UICollectionView)collectionView
{
  UICollectionView *collectionView;
  UICollectionView *v3;
  id WeakRetained;

  collectionView = self->_collectionView;
  if (collectionView)
  {
    v3 = collectionView;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_compositionLayout);
    objc_msgSend(WeakRetained, "collectionView");
    v3 = (UICollectionView *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing
{
  return self->_collectionViewAnimationContext == 0;
}

void __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc(*(Class *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = objc_msgSend(v2, "initWithFrame:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)_overridesSafeAreaPropagationToDescendants
{
  return 0;
}

- (void)_prepareForCollectionViewUpdates:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionViewLayout *v7;
  id *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  UICollectionView *collectionView;
  UICollectionViewLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  UICollectionViewLayout *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id *v30;
  id v31;
  uint64_t *v32;
  UICollectionView *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _WORD *v44;
  id *v45;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *finalAnimationLayoutAttributesDict;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSMutableDictionary *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  unint64_t v64;
  NSObject *v65;
  UICollectionView *v66;
  unint64_t v67;
  NSObject *v68;
  UICollectionView *v69;
  UICollectionView *v70;
  UICollectionView *v71;
  UICollectionView *v72;
  id *v73;
  id v74;
  _BOOL4 v75;
  id v76;
  UICollectionViewLayout *v77;
  _QWORD v78[4];
  uint64_t *v79;
  UICollectionViewLayout *v80;
  _QWORD v81[4];
  id *v82;
  UICollectionViewLayout *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[7];
  uint8_t buf[4];
  UICollectionView *v90;
  __int16 v91;
  id *v92;
  uint64_t v93;

  v4 = a4;
  v7 = self;
  v93 = *MEMORY[0x1E0C80C00];
  -[UICollectionView _currentUpdate](self->_collectionView, "_currentUpdate");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("UICollectionViewLayout.m"), 1254, CFSTR("UICollectionView %@ called prepare on layout without having a current update"), v7->_collectionView);

  }
  v9 = -[UICollectionViewLayout _shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:](v7, "_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:", v4);
  v10 = v9;
  if (v9)
  {
    v73 = v8;
    v75 = v9;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v11 = a3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
    if (!v12)
      goto LABEL_22;
    v13 = v12;
    v14 = *(_QWORD *)v85;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v85 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "updateAction");
        if (!v16 || v16[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((unint64_t)(v17 - 1) > 1)
          {
            if (v17)
              continue;
            objc_msgSend(v16, "indexPathAfterUpdate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](v7, "layoutAttributesForItemAtIndexPath:", v19);
            v25 = v7;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "copy");

            v7 = v25;
            if (v27)
            {
              objc_msgSend(v27, "setAlpha:", 0.0);
              -[NSMutableDictionary setObject:forKey:](v25->_initialAnimationLayoutAttributesDict, "setObject:forKey:", v27, v24);
            }

          }
          else
          {
            objc_msgSend(v16, "indexPathBeforeUpdate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            collectionView = v7->_collectionView;
            objc_msgSend(v16, "indexPathBeforeUpdate");
            v21 = v7;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(-[UICollectionView _visibleCellForIndexPath:](collectionView, "_visibleCellForIndexPath:", v22), "_layoutAttributes");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v23, "copy");

            if (v24)
            {
              objc_msgSend(v24, "setAlpha:", 0.0);
              -[NSMutableDictionary setObject:forKey:](v21->_finalAnimationLayoutAttributesDict, "setObject:forKey:", v24, v19);
            }
            v7 = v21;
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
      if (!v13)
      {
LABEL_22:

        v10 = v75;
        v8 = v73;
        break;
      }
    }
  }
  v28 = v8[8];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v28)
    {
      __UIFaultDebugAssertLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      {
        v70 = v7->_collectionView;
        *(_DWORD *)buf = 138412546;
        v90 = v70;
        v91 = 2112;
        v92 = v8;
        _os_log_fault_impl(&dword_185066000, v62, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing deleted sections", buf, 0x16u);
      }

    }
  }
  else if (!v28)
  {
    v64 = _MergedGlobals_990;
    if (!_MergedGlobals_990)
    {
      v64 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v64, (unint64_t *)&_MergedGlobals_990);
    }
    v65 = *(NSObject **)(v64 + 8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = v7->_collectionView;
      *(_DWORD *)buf = 138412546;
      v90 = v66;
      v91 = 2112;
      v92 = v8;
      _os_log_impl(&dword_185066000, v65, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing deleted sections", buf, 0x16u);
    }
  }
  v29 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke;
  v81[3] = &unk_1E16B2978;
  v30 = v8;
  v82 = v30;
  v83 = v7;
  objc_msgSend(v28, "enumerateIndexesUsingBlock:", v81);
  v31 = v30[9];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v31)
    {
      __UIFaultDebugAssertLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      {
        v71 = v7->_collectionView;
        *(_DWORD *)buf = 138412546;
        v90 = v71;
        v91 = 2112;
        v92 = v30;
        _os_log_fault_impl(&dword_185066000, v63, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing inserted sections", buf, 0x16u);
      }

    }
  }
  else if (!v31)
  {
    v67 = qword_1ECD7D2C0;
    if (!qword_1ECD7D2C0)
    {
      v67 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v67, (unint64_t *)&qword_1ECD7D2C0);
    }
    v68 = *(NSObject **)(v67 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = v7->_collectionView;
      *(_DWORD *)buf = 138412546;
      v90 = v69;
      v91 = 2112;
      v92 = v30;
      _os_log_impl(&dword_185066000, v68, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing inserted sections", buf, 0x16u);
    }
  }
  v78[0] = v29;
  v78[1] = 3221225472;
  v78[2] = __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke_364;
  v78[3] = &unk_1E16B2978;
  v32 = v30;
  v79 = v32;
  v80 = v7;
  objc_msgSend(v31, "enumerateIndexesUsingBlock:", v78);
  -[UICollectionViewLayout prepareForCollectionViewUpdates:](v7, "prepareForCollectionViewUpdates:", a3);
  -[UICollectionViewUpdate _computeAuxiliaryUpdates]((uint64_t)v32);
  if (!v10)
    goto LABEL_52;
  v74 = v31;
  v76 = v28;
  if (!v7)
    goto LABEL_51;
  v33 = v7->_collectionView;
  v88[0] = v29;
  v88[1] = 3221225472;
  v88[2] = __107__UICollectionViewLayout__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate___block_invoke;
  v88[3] = &unk_1E16BE000;
  v88[4] = v32;
  v88[5] = v7;
  v77 = v7;
  v88[6] = sel__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate_;
  -[UICollectionView _enumerateVisibleViews:](v33, "_enumerateVisibleViews:", v88);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[UICollectionView _collectionViewData](v33, "_collectionViewData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v33;
  -[UIScrollView visibleBounds](v33, "visibleBounds");
  -[UICollectionViewData layoutAttributesForElementsInRect:](v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
  if (!v40)
    goto LABEL_50;
  v41 = v40;
  v42 = *(_QWORD *)v85;
  do
  {
    v43 = 0;
    do
    {
      if (*(_QWORD *)v85 != v42)
        objc_enumerationMutation(v39);
      v44 = *(_WORD **)(*((_QWORD *)&v84 + 1) + 8 * v43);
      v45 = (id *)objc_msgSend(v44, "copy");
      v46 = v45;
      if (!v44 || (v44[144] & 1) == 0)
      {
        -[UIBarButtonItemGroup _items](v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "indexPath");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewUpdate validatedOldIndexPathForSupplementaryElementOfKind:newIndexPath:]((uint64_t)v32, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          objc_msgSend(v46, "setIndexPath:", v49);
          finalAnimationLayoutAttributesDict = v77->_finalAnimationLayoutAttributesDict;
          +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](finalAnimationLayoutAttributesDict, "setObject:forKey:", v46, v51);

        }
        goto LABEL_38;
      }
      v52 = v32[3];
      objc_msgSend(v45, "indexPath");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:](v52, v53);

      if (v54 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v55 = objc_msgSend(v32, "initialGlobalIndexForFinalGlobalIndex:", v54);
        if (v55 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v56 = v32[2];
          if (v56)
          {
            v57 = v55;
            if ((*(_BYTE *)(v56 + 96) & 2) == 0)
              -[UICollectionViewData _updateItemCounts](v32[2]);
            if ((v57 & 0x8000000000000000) == 0 && *(_QWORD *)(v56 + 168) > v57)
            {
              -[UICollectionViewData indexPathForItemAtGlobalIndex:]((_BYTE *)v32[2], v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setIndexPath:", v58);

              v59 = v77->_finalAnimationLayoutAttributesDict;
              +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v46);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v46, v49);
LABEL_38:

            }
          }
        }
      }

      ++v43;
    }
    while (v41 != v43);
    v60 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
    v41 = v60;
  }
  while (v60);
LABEL_50:

LABEL_51:
  v31 = v74;
  v28 = v76;
LABEL_52:

}

- (void)_setPreferredBackgroundColor:(id)a3
{
  UIColor **p_preferredBackgroundColor;
  UIColor *preferredBackgroundColor;
  id v6;

  preferredBackgroundColor = self->_preferredBackgroundColor;
  p_preferredBackgroundColor = &self->_preferredBackgroundColor;
  if (preferredBackgroundColor != a3)
  {
    objc_storeStrong((id *)p_preferredBackgroundColor, a3);
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateBackgroundColorIfNeeded");

  }
}

- (UIUserInterfaceLayoutDirection)developmentLayoutDirection
{
  if (qword_1ECD7D2D0 != -1)
    dispatch_once(&qword_1ECD7D2D0, &__block_literal_global_114);
  return qword_1ECD7D2C8;
}

- (BOOL)_hasOrthogonalScrollingSections
{
  return 0;
}

- (BOOL)_estimatesSizes
{
  return 0;
}

- (BOOL)_shouldAddElementToSectionContainer:(id)a3
{
  return 0;
}

- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes
{
  return 0;
}

- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3
{
  return 0;
}

- (BOOL)_cellsShouldConferWithAutolayoutEngineForSizingInfo
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
  return 0;
}

- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context
{
  UICollectionViewLayout *v4;
  id WeakRetained;
  void *v6;
  UICollectionViewLayout *v7;
  void *v8;
  UICollectionViewLayout *v9;
  UICollectionViewLayout *v10;

  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v4->_compositionLayout);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    do
    {
      v9 = v6;

      -[UICollectionViewLayout _compositionLayout](v9, "_compositionLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v9;
      v4 = v9;
    }
    while (v6);
  }
  else
  {
    v7 = v4;
  }
  v10 = v7;
  -[UICollectionViewLayout collectionView](v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_invalidateLayoutWithContext:", context);

}

- (id)_orthogonalScrollingSections
{
  return 0;
}

- (id)_customContainerSectionIndexes
{
  return 0;
}

- (unint64_t)_layoutAxis
{
  return 0;
}

- (id)_layoutAttributesForIndelibleElements
{
  return 0;
}

- (BOOL)_wantsUpdateVisibleCellsPassNotifications
{
  return dyld_program_sdk_at_least();
}

- (void)_prepareToAnimateFromCollectionViewItems:(id)a3 atContentOffset:(CGPoint)a4 toItems:(id)a5 atContentOffset:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  UICollectionViewLayout *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  UICollectionViewLayout *v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  y = a6.y;
  x = a6.x;
  v9 = a4.y;
  v10 = a4.x;
  v53 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    v35 = self;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v14 = a3;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v19, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v16);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a5, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = a5;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v27, v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v24);
    }

    v29 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v21, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v32);

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __107__UICollectionViewLayout__prepareToAnimateFromCollectionViewItems_atContentOffset_toItems_atContentOffset___block_invoke;
    v36[3] = &unk_1E16BE028;
    v37 = v13;
    v38 = v21;
    v41 = x - v10;
    v42 = y - v9;
    v39 = v22;
    v40 = v35;
    v33 = v21;
    v34 = v13;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v36);

  }
}

- (void)_finalizeCollectionViewItemAnimations
{
  -[NSMutableDictionary removeAllObjects](self->_initialAnimationLayoutAttributesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_finalAnimationLayoutAttributesDict, "removeAllObjects");
}

void __107__UICollectionViewLayout__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;

  objc_msgSend(a2, "_layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "copy");

  v5 = (void *)v25;
  if (v25)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v25 + 288) & 1) == 0)
    {
      v7 = *(id *)(v25 + 8);
      objc_msgSend((id)v25, "indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewUpdate validatedNewIndexPathForSupplementaryElementOfKind:oldIndexPath:](v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend((id)v25, "setIndexPath:", v9);
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v25, v11);

      }
      goto LABEL_5;
    }
    v12 = *(_QWORD *)(v6 + 16);
    objc_msgSend((id)v25, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:](v12, v13);

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(a2, "_isInUpdateAnimation");
      v5 = (void *)v25;
      if ((v15 & 1) != 0)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1 + 40;
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(v18 + 8);
      objc_msgSend((id)v25, "indexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v17, v16, CFSTR("UICollectionViewLayout.m"), 1381, CFSTR("While preparing update a visible view at %@ wasn't found in the current data model and was not in an update animation. This is an internal error."), v19);

      goto LABEL_5;
    }
    v20 = objc_msgSend(*(id *)(a1 + 32), "finalGlobalIndexForInitialGlobalIndex:", v14);
    v5 = (void *)v25;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      if (v21)
      {
        v22 = v20;
        if ((*(_BYTE *)(v21 + 96) & 2) == 0)
        {
          -[UICollectionViewData _updateItemCounts](v21);
          v5 = (void *)v25;
        }
        if ((v22 & 0x8000000000000000) == 0 && *(_QWORD *)(v21 + 168) > v22)
        {
          -[UICollectionViewData indexPathForItemAtGlobalIndex:](*(_BYTE **)(*(_QWORD *)(a1 + 32) + 24), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v25, "setIndexPath:", v23);

          v24 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
          +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v25, v9);
LABEL_5:

          v5 = (void *)v25;
        }
      }
    }
  }
LABEL_10:

}

- (BOOL)_isInLayoutTransition
{
  return self->_transitioningFromLayout || self->_transitioningToLayout != 0;
}

- (BOOL)_disablesDoubleSidedAnimations
{
  return 0;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4
{
  return 0;
}

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UICollectionViewLayout *transitioningFromLayout;
  id *v12;
  void *v13;
  char v14;

  if (-[NSMutableDictionary count](self->_initialAnimationLayoutAttributesDict, "count"))
  {
    +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, elementIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_initialAnimationLayoutAttributesDict, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (-[NSIndexPath length](elementIndexPath, "length") != 1)
    {
      v10 = -[NSIndexPath section](elementIndexPath, "section");
      if (v10 >= objc_msgSend(v9, "numberOfSections"))
      {
        v8 = 0;
        goto LABEL_20;
      }
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(_BYTE *)&self->_layoutFlags & 1) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self->_transitioningFromLayout, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", elementKind, elementIndexPath);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    objc_msgSend(v9, "_currentUpdate");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", elementKind, elementIndexPath);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v13, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v12
      || (objc_msgSend(v12[9], "containsIndex:", -[NSIndexPath section](elementIndexPath, "section")) & 1) != 0)
    {
      if (transitioningFromLayout)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v14 = -[UICollectionViewUpdate hasInsertedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v12, elementKind, elementIndexPath);
      if (transitioningFromLayout || (v14 & 1) == 0)
        goto LABEL_19;
    }
    objc_msgSend(v8, "setAlpha:", 0.0);
    goto LABEL_19;
  }
LABEL_20:

  return (UICollectionViewLayoutAttributes *)v8;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForBoundsChange:(CGRect)newBounds
{
  return (UICollectionViewLayoutInvalidationContext *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)_invalidateLayoutUsingContext:(id)a3
{
  UICollectionViewLayoutInvalidationContext *invalidationContext;

  objc_storeStrong((id *)&self->_invalidationContext, a3);
  -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  invalidationContext = self->_invalidationContext;
  self->_invalidationContext = 0;

}

- (void)invalidateLayout
{
  id v3;

  if (self->_invalidationContext)
  {
    -[UICollectionViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:");
  }
  else
  {
    v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
    -[UICollectionViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

  }
}

- (id)_indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_deletedSupplementaryIndexPathsDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)_indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_deletedDecorationIndexPathsDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)_indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_insertedSupplementaryIndexPathsDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)_indexPathsToInsertForDecorationViewOfKind:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_insertedDecorationIndexPathsDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3
{
  return 0;
}

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UICollectionViewLayout *transitioningFromLayout;
  id *v12;
  void *v13;
  char v14;

  if (-[NSMutableDictionary count](self->_initialAnimationLayoutAttributesDict, "count"))
  {
    +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, decorationIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_initialAnimationLayoutAttributesDict, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (-[NSIndexPath length](decorationIndexPath, "length") != 1)
    {
      v10 = -[NSIndexPath section](decorationIndexPath, "section");
      if (v10 >= objc_msgSend(v9, "numberOfSections"))
      {
        v8 = 0;
        goto LABEL_20;
      }
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(_BYTE *)&self->_layoutFlags & 1) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self->_transitioningFromLayout, "layoutAttributesForDecorationViewOfKind:atIndexPath:", elementKind, decorationIndexPath);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    objc_msgSend(v9, "_currentUpdate");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", elementKind, decorationIndexPath);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v13, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v12
      || (objc_msgSend(v12[9], "containsIndex:", -[NSIndexPath section](decorationIndexPath, "section")) & 1) != 0)
    {
      if (transitioningFromLayout)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v14 = -[UICollectionViewUpdate hasInsertedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v12, elementKind, decorationIndexPath);
      if (transitioningFromLayout || (v14 & 1) == 0)
        goto LABEL_19;
    }
    objc_msgSend(v8, "setAlpha:", 0.0);
    goto LABEL_19;
  }
LABEL_20:

  return (UICollectionViewLayoutAttributes *)v8;
}

- (BOOL)_wantsAnimationsForOffscreenAuxillaries
{
  return 0;
}

- (BOOL)_isPrepared
{
  return (*(_BYTE *)&self->_layoutFlags >> 2) & 1;
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  -[NSMutableDictionary removeAllObjects](self->_initialAnimationLayoutAttributesDict, "removeAllObjects", a3);
  -[NSMutableDictionary removeAllObjects](self->_finalAnimationLayoutAttributesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deletedSupplementaryIndexPathsDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_insertedSupplementaryIndexPathsDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deletedDecorationIndexPathsDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_insertedDecorationIndexPathsDict, "removeAllObjects");
  -[UICollectionViewLayout finalizeCollectionViewUpdates](self, "finalizeCollectionViewUpdates");
}

- (void)registerClass:(Class)viewClass forDecorationViewOfKind:(NSString *)elementKind
{
  NSMutableDictionary *v7;
  NSMutableDictionary *decorationViewClassDict;
  NSMutableDictionary *v9;

  if (!self->_decorationViewClassDict)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    decorationViewClassDict = self->_decorationViewClassDict;
    self->_decorationViewClassDict = v7;

  }
  -[NSMutableDictionary removeObjectForKey:](self->_decorationViewNibDict, "removeObjectForKey:", elementKind);
  v9 = self->_decorationViewClassDict;
  if (viewClass)
    -[NSMutableDictionary setValue:forKey:](v9, "setValue:forKey:", viewClass, elementKind);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", elementKind);
}

- (void)_setCollectionView:(id)a3
{
  self->_collectionView = (UICollectionView *)a3;
}

- (id)_decorationViewForLayoutAttributes:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[UIBarButtonItemGroup _items]((id *)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__43;
  v29 = __Block_byref_object_dispose__43;
  v30 = 0;
  -[NSMutableDictionary valueForKey:](self->_decorationViewNibDict, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[NSMutableDictionary valueForKey:](self->_decorationViewExternalObjectsTables, "valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, CFSTR("UINibExternalObjects"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "instantiateWithOwner:options:", 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v26[5];
      v26[5] = v12;

    }
    if (!v26[5] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 1923, CFSTR("invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance"), v5);

    }
    objc_msgSend((id)v26[5], "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length") && (objc_msgSend(v14, "isEqualToString:", v5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 1925, CFSTR("view reuse identifier in nib (%@) does not match the element kind used to register the nib (%@)"), v14, v5);

    }
  }
  else
  {
    v10 = (id)-[NSMutableDictionary valueForKey:](self->_decorationViewClassDict, "valueForKey:", v5);
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke;
    v24[3] = &unk_1E16BE050;
    v24[5] = &v25;
    v24[6] = v10;
    v24[4] = a3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
  }
  v15 = (void *)v26[5];
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemGroup _items]((id *)a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 1933, CFSTR("could not dequeue a decoration view of kind: %@ - must register as a class or nib or connect a prototype in a storyboard"), v20);

    v15 = (void *)v26[5];
  }
  objc_msgSend(v15, "_setReuseIdentifier:", v5);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke_2;
  v23[3] = &unk_1E16BACE0;
  v23[4] = a3;
  v23[5] = &v25;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
  objc_msgSend((id)v26[5], "setAutoresizingMask:", 0);
  objc_msgSend((id)v26[5], "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend((id)v26[5], "_setHostsLayoutEngine:", 1);
  objc_msgSend((id)v26[5], "_markAsDequeued");
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (UICollectionViewLayout)init
{
  UICollectionViewLayout *v2;
  UICollectionViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewLayout;
  v2 = -[UICollectionViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    UICollectionViewLayoutCommonInit((uint64_t)v2);
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 0;
}

- (UIColor)_preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (UIEdgeInsets)_preferredLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.79769313e308;
  v3 = 1.79769313e308;
  v4 = 1.79769313e308;
  v5 = 1.79769313e308;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_shouldInvalidateLayoutForDataSourceChange
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)_setCollectionViewAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewAnimationContext, a3);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
{
  double y;
  double x;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = proposedContentOffset.y;
  x = proposedContentOffset.x;
  if (-[UICollectionViewLayout _shouldAdjustTargetContentOffsetToValidateContentExtents](self, "_shouldAdjustTargetContentOffsetToValidateContentExtents"))
  {
    if (dyld_program_sdk_at_least())
    {
      v6 = -[UICollectionViewLayout _layoutAxis](self, "_layoutAxis");
      if (v6 - 1 <= 1)
      {
        v7 = v6;
        -[UICollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
        v9 = v8;
        v11 = v10;
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_minimumContentOffset");
        v14 = v13;
        v16 = v15;

        -[UICollectionViewLayout collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_maximumContentOffsetForContentSize:", v9, v11);
        v19 = v18;
        v21 = v20;

        if (v7 == 2)
        {
          y = fmax(v16, fmin(y, v21));
        }
        else if (v7 == 1)
        {
          x = fmax(v14, fmin(x, v19));
        }
      }
    }
  }
  v22 = x;
  v23 = y;
  result.y = v23;
  result.x = v22;
  return result;
}

- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate
{
  return 1;
}

- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  return a4;
}

- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents
{
  return 0;
}

- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems
{
  return 0;
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath
{
  void *v7;
  void *v8;
  UICollectionViewLayout *transitioningToLayout;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  char v14;

  if (!-[NSMutableDictionary count](self->_finalAnimationLayoutAttributesDict, "count")
    || (+[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, elementIndexPath), v7 = (void *)objc_claimAutoreleasedReturnValue(), -[NSMutableDictionary objectForKey:](self->_finalAnimationLayoutAttributesDict, "objectForKey:", v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(_BYTE *)&self->_layoutFlags & 2) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self->_transitioningToLayout, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", elementKind, elementIndexPath);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return (UICollectionViewLayoutAttributes *)v8;
    }
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_currentUpdate");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_visibleSupplementaryViewOfKind:atIndexPath:isDecorationView:", elementKind, elementIndexPath, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_layoutAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v13, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v11
      || (objc_msgSend(v11[8], "containsIndex:", -[NSIndexPath section](elementIndexPath, "section")) & 1) != 0)
    {
      if (transitioningToLayout)
      {
LABEL_14:

        return (UICollectionViewLayoutAttributes *)v8;
      }
    }
    else
    {
      v14 = -[UICollectionViewUpdate hasDeletedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v11, elementKind, elementIndexPath);
      if (transitioningToLayout || (v14 & 1) == 0)
        goto LABEL_14;
    }
    objc_msgSend(v8, "setAlpha:", 0.0);
    goto LABEL_14;
  }
  return (UICollectionViewLayoutAttributes *)v8;
}

- (BOOL)_estimatesSupplementaryItems
{
  return 0;
}

- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  return objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  return 1;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  return 1;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (NSIndexSet)_sections
{
  return objc_retainAutorelease(self->_sections);
}

- (id)_invalidationContextForBoundsChange:(CGRect)a3 fromOldBounds:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  uint64_t v10;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  -[UICollectionViewLayout invalidationContextForBoundsChange:](self, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least() && !objc_msgSend(v8, "_intent"))
  {
    if (v6 == height && v7 == width)
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v8, "_setIntent:", v10);
  }
  return v8;
}

- (CGRect)bounds
{
  id WeakRetained;
  double width;
  double height;
  double v6;
  double v7;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_compositionLayout);

  if (WeakRetained)
  {
    width = self->_frame.size.width;
    height = self->_frame.size.height;
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[UIView bounds](self->_collectionView, "bounds");
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
  void *v5;
  void *v6;
  void *v7;

  -[UICollectionViewLayout _collectionViewAnimationContext](self, "_collectionViewAnimationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[UICollectionViewLayout _collectionViewAnimationContext](self, "_collectionViewAnimationContext"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_UICollectionViewAnimationContext finalLayoutAttributesForDisappearingItemAtIndexPath:]((uint64_t)v6, itemIndexPath), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    -[UICollectionViewLayout _finalLayoutAttributesForDisappearingItemAtIndexPath:](self, "_finalLayoutAttributesForDisappearingItemAtIndexPath:", itemIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (id)_finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  void *v5;
  void *v6;
  UICollectionViewLayout *transitioningToLayout;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  char v12;

  if (!-[NSMutableDictionary count](self->_finalAnimationLayoutAttributesDict, "count")
    || (+[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, a3), v5 = (void *)objc_claimAutoreleasedReturnValue(), -[NSMutableDictionary objectForKey:](self->_finalAnimationLayoutAttributesDict, "objectForKey:", v5), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(_BYTE *)&self->_layoutFlags & 2) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self->_transitioningToLayout, "layoutAttributesForItemAtIndexPath:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_currentUpdate");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cellForItemAtIndexPath:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_layoutAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0 || !v9)
    {
      if (transitioningToLayout)
        goto LABEL_11;
    }
    else
    {
      v12 = objc_msgSend(v9[8], "containsIndex:", objc_msgSend(a3, "section"));
      if (transitioningToLayout || (v12 & 1) == 0)
        goto LABEL_11;
    }
    objc_msgSend(v6, "setAlpha:", 0.0);
LABEL_11:

  }
  return v6;
}

- (id)_invalidationContextForRefreshingVisibleElementAttributes
{
  id v2;

  v2 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v2, "_setIntent:", 12);
  return v2;
}

- (BOOL)_disallowsFadeCellsForBoundsChange
{
  return 0;
}

void __52__UICollectionViewLayout_developmentLayoutDirection__block_invoke()
{
  void *v0;
  void *v1;
  __CFString *v2;
  __CFString *v3;
  void *v4;
  char isKindOfClass;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CFBundleDevelopmentRegion"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (__CFString *)v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v6, "count")
      || (objc_msgSend(v6, "objectAtIndexedSubscript:", 0),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v4,
          (isKindOfClass & 1) == 0))
    {
      NSLog(&CFSTR("WARNING: This app's CFBundleDevelopmentRegion is not a string value. This can lead to unexpected results at"
                   " runtime. Please change CFBundleDevelopmentRegion in your Info.plist to a string value.").isa);
      v3 = CFSTR("en");
      goto LABEL_9;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
LABEL_9:
  qword_1ECD7D2C8 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", v3) == 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewAnimationContext, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_siblingLayout);
  objc_destroyWeak((id *)&self->_compositionLayout);
  objc_storeStrong((id *)&self->_elementKinds, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_swipeActionsModule, 0);
  objc_storeStrong((id *)&self->_invalidationContext, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitioningToLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromLayout, 0);
  objc_storeStrong((id *)&self->_decorationViewExternalObjectsTables, 0);
  objc_storeStrong((id *)&self->_decorationViewNibDict, 0);
  objc_storeStrong((id *)&self->_decorationViewClassDict, 0);
  objc_storeStrong((id *)&self->_insertedDecorationIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedDecorationIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_finalAnimationLayoutAttributesDict, 0);
  objc_storeStrong((id *)&self->_initialAnimationLayoutAttributesDict, 0);
}

void __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        if (v8 && (*(_WORD *)(v8 + 288) & 2) != 0)
        {
          v14 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
          v15 = *(id *)(v8 + 8);
          objc_msgSend(v14, "objectForKeyedSubscript:", v15, (_QWORD)v18);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_13;
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
          v13 = *(id *)(v8 + 8);
        }
        else
        {
          v9 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
          -[UIBarButtonItemGroup _items](*(id **)(*((_QWORD *)&v18 + 1) + 8 * v7));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_13;
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
          -[UIBarButtonItemGroup _items]((id *)v8);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13, (_QWORD)v18);

LABEL_13:
        objc_msgSend((id)v8, "indexPath", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(BOOL)a3
{
  char layoutFlags;
  char v4;

  layoutFlags = (char)self->_layoutFlags;
  if (((((layoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_BYTE *)&self->_layoutFlags = layoutFlags & 0xF7 | v4;
  }
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath
{
  void *v7;
  void *v8;
  UICollectionViewLayout *transitioningToLayout;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  char v14;

  if (!-[NSMutableDictionary count](self->_finalAnimationLayoutAttributesDict, "count")
    || (+[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, decorationIndexPath), v7 = (void *)objc_claimAutoreleasedReturnValue(), -[NSMutableDictionary objectForKey:](self->_finalAnimationLayoutAttributesDict, "objectForKey:", v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(_BYTE *)&self->_layoutFlags & 2) == 0)
    {
      -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self->_transitioningToLayout, "layoutAttributesForDecorationViewOfKind:atIndexPath:", elementKind, decorationIndexPath);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return (UICollectionViewLayoutAttributes *)v8;
    }
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_currentUpdate");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_visibleSupplementaryViewOfKind:atIndexPath:isDecorationView:", elementKind, decorationIndexPath, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_layoutAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v13, "copy");

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v11
      || (objc_msgSend(v11[8], "containsIndex:", -[NSIndexPath section](decorationIndexPath, "section")) & 1) != 0)
    {
      if (transitioningToLayout)
      {
LABEL_14:

        return (UICollectionViewLayoutAttributes *)v8;
      }
    }
    else
    {
      v14 = -[UICollectionViewUpdate hasDeletedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v11, elementKind, decorationIndexPath);
      if (transitioningToLayout || (v14 & 1) == 0)
        goto LABEL_14;
    }
    objc_msgSend(v8, "setAlpha:", 0.0);
    goto LABEL_14;
  }
  return (UICollectionViewLayoutAttributes *)v8;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UICollectionViewLayout)initWithCoder:(NSCoder *)coder
{
  UICollectionViewLayout *v4;
  uint64_t v5;
  NSMutableDictionary *decorationViewNibDict;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *decorationViewExternalObjectsTables;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewLayout;
  v4 = -[UICollectionViewLayout init](&v11, sel_init);
  if (v4)
  {
    -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("UICollectionViewDecorationViewNibDict"));
    v5 = objc_claimAutoreleasedReturnValue();
    decorationViewNibDict = v4->_decorationViewNibDict;
    v4->_decorationViewNibDict = (NSMutableDictionary *)v5;

    -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("UICollectionViewDecorationViewPrototypeNibExternalObjects"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    mutableDictionaryByTransformingLeafDictionariesToWeakValued(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    decorationViewExternalObjectsTables = v4->_decorationViewExternalObjectsTables;
    v4->_decorationViewExternalObjectsTables = (NSMutableDictionary *)v8;

    UICollectionViewLayoutCommonInit((uint64_t)v4);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (-[NSMutableDictionary count](self->_decorationViewNibDict, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_decorationViewNibDict, CFSTR("UICollectionViewDecorationViewNibDict"));
  if (-[NSMutableDictionary count](self->_decorationViewExternalObjectsTables, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_decorationViewExternalObjectsTables, CFSTR("UICollectionViewDecorationViewPrototypeNibExternalObjects"));
}

- (NSArray)layoutAttributesForElementsInRect:(CGRect)rect
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
  return 0;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
  return (UICollectionViewLayoutInvalidationContext *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
}

- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3
{
  if (a3)
    return 1;
  else
    return dyld_program_sdk_at_least() ^ 1;
}

void __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke_364(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        if (v8 && (*(_WORD *)(v8 + 288) & 2) != 0)
        {
          v14 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
          v15 = *(id *)(v8 + 8);
          objc_msgSend(v14, "objectForKeyedSubscript:", v15, (_QWORD)v18);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_13;
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
          v13 = *(id *)(v8 + 8);
        }
        else
        {
          v9 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
          -[UIBarButtonItemGroup _items](*(id **)(*((_QWORD *)&v18 + 1) + 8 * v7));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_13;
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
          -[UIBarButtonItemGroup _items]((id *)v8);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13, (_QWORD)v18);

LABEL_13:
        objc_msgSend((id)v8, "indexPath", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (id)snapshottedLayoutAttributeForItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)registerNib:(UINib *)nib forDecorationViewOfKind:(NSString *)elementKind
{
  NSMutableDictionary *v7;
  NSMutableDictionary *decorationViewNibDict;
  NSMutableDictionary *v9;

  if (!self->_decorationViewNibDict)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    decorationViewNibDict = self->_decorationViewNibDict;
    self->_decorationViewNibDict = v7;

  }
  -[NSMutableDictionary removeObjectForKey:](self->_decorationViewClassDict, "removeObjectForKey:", elementKind);
  v9 = self->_decorationViewNibDict;
  if (nib)
    -[NSMutableDictionary setValue:forKey:](v9, "setValue:forKey:", nib, elementKind);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", elementKind);
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  char v5;

  objc_storeStrong((id *)&self->_transitioningToLayout, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_layoutFlags = *(_BYTE *)&self->_layoutFlags & 0xFD | v5;
  -[UIDynamicAnimator _setRunning:](self->_animator, "_setRunning:", 0);
  -[UICollectionViewLayout prepareForTransitionToLayout:](self, "prepareForTransitionToLayout:", a3);
}

- (void)_prepareForTransitionFromLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningFromLayout, a3);
  objc_opt_class();
  *(_BYTE *)&self->_layoutFlags = *(_BYTE *)&self->_layoutFlags & 0xFE | objc_opt_isKindOfClass() & 1;
  -[UICollectionViewLayout prepareForTransitionFromLayout:](self, "prepareForTransitionFromLayout:", a3);
}

- (void)_finalizeLayoutTransition
{
  UICollectionViewLayout *transitioningFromLayout;
  UICollectionViewLayout *transitioningToLayout;
  void *v5;
  UICollectionViewLayout *v6;

  transitioningFromLayout = self->_transitioningFromLayout;
  self->_transitioningFromLayout = 0;

  *(_BYTE *)&self->_layoutFlags &= ~1u;
  transitioningToLayout = self->_transitioningToLayout;
  self->_transitioningToLayout = 0;

  *(_BYTE *)&self->_layoutFlags &= ~2u;
  -[UICollectionViewLayout finalizeLayoutTransition](self, "finalizeLayoutTransition");
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[UIDynamicAnimator _tickle](self->_animator, "_tickle");
}

- (void)_setCollectionViewBoundsSize:(CGSize)a3
{
  self->_collectionViewBoundsSize = a3;
}

- (void)_setDynamicAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (id)_dynamicAnimator
{
  return self->_animator;
}

void __107__UICollectionViewLayout__prepareToAnimateFromCollectionViewItems_atContentOffset_toItems_atContentOffset___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  int v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v6, "center");
  objc_msgSend(v6, "setCenter:", v7 + *(double *)(a1 + 64), v8 + *(double *)(a1 + 72));
  v9 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v9, "center");
  objc_msgSend(v9, "setCenter:", v10 - *(double *)(a1 + 64), v11 - *(double *)(a1 + 72));
  if (v4 && v5)
  {
    objc_msgSend(v6, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v5, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v67.origin.x = v13;
    v67.origin.y = v15;
    v67.size.width = v17;
    v67.size.height = v19;
    v70.origin.x = v21;
    v70.origin.y = v23;
    v70.size.width = v25;
    v70.size.height = v27;
    v68 = CGRectUnion(v67, v70);
    y = v68.origin.y;
    x = v68.origin.x;
    height = v68.size.height;
    width = v68.size.width;
    v68.origin.x = v13;
    v68.origin.y = v15;
    v68.size.width = v17;
    v68.size.height = v19;
    v71.origin.x = v21;
    v71.origin.y = v23;
    v71.size.width = v25;
    v71.size.height = v27;
    if (CGRectIntersectsRect(v68, v71))
      goto LABEL_27;
    v53 = v6;
    v54 = v5;
    v55 = v4;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v52 = a1;
    obj = *(id *)(a1 + 48);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (!v28)
      goto LABEL_26;
    v29 = v28;
    v30 = *(_QWORD *)v62;
    while (1)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v62 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v31);
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (_QWORD *)v33;
        if (v3)
        {
          v35 = v3[4];
          if (!v33)
            goto LABEL_22;
        }
        else
        {
          v35 = 0;
          if (!v33)
          {
LABEL_22:
            v36 = 0;
            goto LABEL_12;
          }
        }
        v36 = *(_QWORD *)(v33 + 32);
LABEL_12:
        if (v35 == v36)
        {
          v37 = v3 ? (void *)v3[2] : 0;
          v38 = v37;
          v39 = v34 ? (void *)v34[2] : 0;
          v40 = v39;
          v41 = objc_msgSend(v38, "isEqualToString:", v40);

          if (v41)
          {
            objc_msgSend(v32, "frame");
            v72.origin.x = v42;
            v72.origin.y = v43;
            v72.size.width = v44;
            v72.size.height = v45;
            v69.origin.x = x;
            v69.origin.y = y;
            v69.size.width = width;
            v69.size.height = height;
            if (CGRectIntersectsRect(v69, v72))
            {
              v6 = v53;
              v50 = (void *)objc_msgSend(v53, "copy");
              v51 = (void *)objc_msgSend(v9, "copy");
              objc_msgSend(v50, "setAlpha:", 0.0);
              objc_msgSend(v51, "setAlpha:", 0.0);
              objc_msgSend(*(id *)(*(_QWORD *)(v52 + 56) + 32), "setObject:forKey:", v51, v3);
              objc_msgSend(*(id *)(*(_QWORD *)(v52 + 56) + 40), "setObject:forKey:", v50, v3);

              v5 = v54;
              v4 = v55;
              goto LABEL_33;
            }
          }
        }

        ++v31;
      }
      while (v29 != v31);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      v29 = v46;
      if (!v46)
      {
LABEL_26:

        v5 = v54;
        v4 = v55;
        v6 = v53;
        a1 = v52;
LABEL_27:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setObject:forKey:", v4, v3, v52);
        v47 = *(void **)(*(_QWORD *)(a1 + 56) + 40);
        v48 = v5;
LABEL_30:
        objc_msgSend(v47, "setObject:forKey:", v48, v3);
        goto LABEL_33;
      }
    }
  }
  if (v4)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setObject:forKey:", v4, v3);
    v47 = *(void **)(*(_QWORD *)(a1 + 56) + 40);
    v48 = v6;
    goto LABEL_30;
  }
  v49 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v49, "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setObject:forKey:", v49, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "setObject:forKey:", v5, v3);

LABEL_33:
}

uint64_t __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setLayoutAttributes:", *(_QWORD *)(a1 + 32));
}

- (void)_setExternalObjectTable:(id)a3 forNibLoadingOfDecorationViewOfKind:(id)a4
{
  NSMutableDictionary *decorationViewExternalObjectsTables;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  decorationViewExternalObjectsTables = self->_decorationViewExternalObjectsTables;
  if (!decorationViewExternalObjectsTables)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_decorationViewExternalObjectsTables;
    self->_decorationViewExternalObjectsTables = v8;

    decorationViewExternalObjectsTables = self->_decorationViewExternalObjectsTables;
  }
  -[NSMutableDictionary setObject:forKey:](decorationViewExternalObjectsTables, "setObject:forKey:", a3, a4);
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 1;
}

- (BOOL)canBeEdited
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (void)_setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)_frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_dynamicReferenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UICollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_setSections:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *sections;

  if (self->_sections != a3)
  {
    v4 = (NSIndexSet *)objc_msgSend(a3, "copy");
    sections = self->_sections;
    self->_sections = v4;

  }
}

- (void)_setItems:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *items;

  if (self->_items != a3)
  {
    v4 = (NSIndexSet *)objc_msgSend(a3, "copy");
    items = self->_items;
    self->_items = v4;

  }
}

- (NSIndexSet)_items
{
  return objc_retainAutorelease(self->_items);
}

- (void)_setElementKinds:(id)a3
{
  NSArray *v4;
  NSArray *elementKinds;

  if (self->_elementKinds != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    elementKinds = self->_elementKinds;
    self->_elementKinds = v4;

  }
}

- (NSArray)_elementKinds
{
  return objc_retainAutorelease(self->_elementKinds);
}

- (void)_setCompositionLayout:(id)a3
{
  objc_storeWeak((id *)&self->_compositionLayout, a3);
}

- (_UICollectionViewCompositionLayout)_compositionLayout
{
  return (_UICollectionViewCompositionLayout *)objc_loadWeakRetained((id *)&self->_compositionLayout);
}

- (void)_setSiblingLayout:(id)a3
{
  objc_storeWeak((id *)&self->_siblingLayout, a3);
}

- (UICollectionViewLayout)_siblingLayout
{
  return (UICollectionViewLayout *)objc_loadWeakRetained((id *)&self->_siblingLayout);
}

- (void)_setLayoutOffset:(CGPoint)a3
{
  self->_layoutOffset = a3;
}

- (CGPoint)_layoutOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutOffset.x;
  y = self->_layoutOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setLayoutOffsetEdges:(unint64_t)a3
{
  self->_layoutOffsetEdges = a3;
}

- (unint64_t)_layoutOffsetEdges
{
  return self->_layoutOffsetEdges;
}

- (CGPoint)_offsetInTopParentLayout:(id *)a3
{
  double y;
  double x;
  UICollectionViewLayout *v7;
  UICollectionViewLayout *v8;
  double v9;
  double v10;
  uint64_t v11;
  UICollectionViewLayout *v12;
  double v13;
  double v14;
  UICollectionViewLayout *v15;
  double v16;
  double v17;
  CGPoint result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  -[UICollectionViewLayout _compositionLayout](self, "_compositionLayout");
  v7 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    -[UICollectionViewLayout _frame](v7, "_frame");
    x = x + v9;
    y = y + v10;
    -[UICollectionViewLayout _compositionLayout](v8, "_compositionLayout");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      do
      {
        v12 = (UICollectionViewLayout *)v11;

        -[UICollectionViewLayout _frame](v12, "_frame");
        x = x + v13;
        y = y + v14;
        -[UICollectionViewLayout _compositionLayout](v12, "_compositionLayout");
        v11 = objc_claimAutoreleasedReturnValue();
        v8 = v12;
      }
      while (v11);
    }
    else
    {
      v12 = v8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = self;
    else
      v12 = 0;
  }
  v15 = objc_retainAutorelease(v12);
  *a3 = v15;

  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  BOOL v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33 = 0;
  -[UICollectionViewLayout _offsetInTopParentLayout:](self, "_offsetInTopParentLayout:", &v33);
  v12 = v11;
  v14 = v13;
  v15 = v33;
  v32 = 0;
  objc_msgSend(a4, "_offsetInTopParentLayout:", &v32);
  v17 = v16;
  v19 = v18;
  v20 = v32;
  v21 = v20;
  if (v15)
    v22 = v15 == v20;
  else
    v22 = 0;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2122, CFSTR("to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree"));

  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectOffset(v34, v12 - v17, v14 - v19);
  v23 = v35.origin.x;
  v24 = v35.origin.y;
  v25 = v35.size.width;
  v26 = v35.size.height;

  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  BOOL v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33 = 0;
  -[UICollectionViewLayout _offsetInTopParentLayout:](self, "_offsetInTopParentLayout:", &v33);
  v12 = v11;
  v14 = v13;
  v15 = v33;
  v32 = 0;
  objc_msgSend(a4, "_offsetInTopParentLayout:", &v32);
  v17 = v16;
  v19 = v18;
  v20 = v32;
  v21 = v20;
  if (v15)
    v22 = v15 == v20;
  else
    v22 = 0;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2132, CFSTR("to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree"));

  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectOffset(v34, v17 - v12, v19 - v14);
  v23 = v35.origin.x;
  v24 = v35.origin.y;
  v25 = v35.size.width;
  v26 = v35.size.height;

  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)_setPrepared:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_layoutFlags = *(_BYTE *)&self->_layoutFlags & 0xFB | v3;
}

- (BOOL)_supportsPrefetchingWithEstimatedSizes
{
  return 0;
}

- (CGSize)_fallbackItemSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSIndexPath)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  _WORD *v11;
  uint64_t v12;
  _WORD *v13;
  NSIndexPath *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", position.x, position.y, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_WORD **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if (v11)
      {
        if ((v11[144] & 1) != 0)
        {
          if (!v8
            || (v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "zIndex"), v12 > objc_msgSend(v8, "zIndex")))
          {
            v13 = v11;

            v8 = v13;
          }
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
  if (v8)
  {
    objc_msgSend(v8, "indexPath");
    v14 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_15:
    v14 = previousIndexPath;
  }

  return v14;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = position.y;
  x = position.x;
  -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", indexPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "setCenter:", x, y);
  objc_msgSend(v7, "setZIndex:", 0x7FFFFFFFFFFFFFFFLL);
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForInteractivelyMovingItems:(NSArray *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray *)previousIndexPaths previousPosition:(CGPoint)previousPosition
{
  double y;
  double x;
  id v10;

  y = targetPosition.y;
  x = targetPosition.x;
  v10 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v10, "_setPreviousIndexPathsForInteractivelyMovingItems:", previousIndexPaths);
  objc_msgSend(v10, "_setTargetIndexPathsForInteractivelyMovingItems:", targetIndexPaths);
  objc_msgSend(v10, "_setInteractiveMovementTarget:", x, y);
  if (-[NSArray isEqual:](targetIndexPaths, "isEqual:", previousIndexPaths))
    objc_msgSend(v10, "invalidateItemsAtIndexPaths:", targetIndexPaths);
  return (UICollectionViewLayoutInvalidationContext *)v10;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray *)indexPaths previousIndexPaths:(NSArray *)previousIndexPaths movementCancelled:(BOOL)movementCancelled
{
  id v7;

  v7 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v7, "_setPreviousIndexPathsForInteractivelyMovingItems:", previousIndexPaths);
  objc_msgSend(v7, "_setTargetIndexPathsForInteractivelyMovingItems:", indexPaths);
  objc_msgSend(v7, "_setIntent:", 11);
  if (-[NSArray isEqual:](indexPaths, "isEqual:", previousIndexPaths))
    objc_msgSend(v7, "invalidateItemsAtIndexPaths:", indexPaths);
  return (UICollectionViewLayoutInvalidationContext *)v7;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded
{
  return (*(_BYTE *)&self->_layoutFlags >> 3) & 1;
}

- (UIEdgeInsets)_focusFastScrollingIndexBarInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_layoutAttributesForNextItemInDirection:(CGPoint)a3 fromIndexPath:(id)a4 constrainedToRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double MidY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  CGFloat MidX;
  double v44;
  double v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  v69 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_13;
  v44 = height;
  v45 = y;
  v15 = x;
  v16 = width;
  v17 = v11;
  objc_msgSend(v13, "frame");
  v18 = v70.origin.x;
  v19 = v70.origin.y;
  v20 = v70.size.width;
  v21 = v10;
  v22 = v70.size.height;
  MidX = CGRectGetMidX(v70);
  v71.origin.x = v18;
  v71.origin.y = v19;
  v71.size.width = v20;
  v71.size.height = v22;
  v23 = v21;
  MidY = CGRectGetMidY(v71);
  if (v21 < 0.0)
  {
    v25 = MidY - v45;
    v26 = v17;
    v27 = v16;
    v28 = v45;
    goto LABEL_12;
  }
  v26 = v17;
  if (v21 > 0.0)
  {
    v25 = v45 + v44 - MidY;
    v28 = MidY;
    v27 = v16;
    goto LABEL_12;
  }
  v25 = v44;
  if (v17 < 0.0)
  {
    v29 = MidX;
LABEL_10:
    v27 = v29 - v15;
    v28 = v45;
    goto LABEL_12;
  }
  if (v17 > 0.0)
  {
    v29 = v15 + v16;
    v15 = MidX;
    goto LABEL_10;
  }
  v15 = *MEMORY[0x1E0CB3438];
  v28 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v27 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v25 = *(double *)(MEMORY[0x1E0CB3438] + 24);
LABEL_12:
  v72.origin.x = v15;
  v72.origin.y = v28;
  v72.size.width = v27;
  v72.size.height = v25;
  if (CGRectIsEmpty(v72))
  {
LABEL_13:
    v30 = 0;
    goto LABEL_30;
  }
  -[UICollectionViewLayout _extendedAttributesQueryIncludingOrthogonalScrollingRegions:](self, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", v15, v28, v27, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "indexPath", *(_QWORD *)&MidX);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "section");
          v39 = objc_msgSend(a4, "section");
          if (v38 - v39 >= 0)
            v40 = v38 - v39;
          else
            v40 = v39 - v38;
          objc_msgSend(v32, "addIndex:", v40);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v34);
    }

    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__43;
    v62 = __Block_byref_object_dispose__43;
    v63 = 0;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __98__UICollectionViewLayout__layoutAttributesForNextItemInDirection_fromIndexPath_constrainedToRect___block_invoke;
    v46[3] = &unk_1E16BE078;
    v47 = v33;
    v48 = a4;
    v50 = v15;
    v51 = v28;
    v52 = v27;
    v53 = v25;
    v54 = MidX;
    v55 = MidY;
    v56 = v26;
    v57 = v23;
    v49 = &v58;
    objc_msgSend(v32, "enumerateIndexesUsingBlock:", v46);
    v30 = (void *)v59[5];
    if (v30)
      v41 = v30;

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v30 = 0;
  }

LABEL_30:
  return v30;
}

void __98__UICollectionViewLayout__layoutAttributesForNextItemInDirection_fromIndexPath_constrainedToRect___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  _WORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  _BOOL4 v27;
  double MidX;
  CGFloat MidY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  double v39;
  double v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _BYTE *v46;
  _WORD *v47;
  _WORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  NSRect v57;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v7)
  {
LABEL_49:

    return;
  }
  v8 = v7;
  v46 = a3;
  v47 = 0;
  v9 = *(_QWORD *)v50;
  v10 = 1.79769313e308;
  v48 = v6;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v50 != v9)
        objc_enumerationMutation(v6);
      v12 = *(_WORD **)(*((_QWORD *)&v49 + 1) + 8 * v11);
      objc_msgSend(v12, "indexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "section");

      v15 = objc_msgSend(*(id *)(a1 + 40), "section");
      v16 = v14 - v15;
      if (v14 - v15 < 0)
        v16 = v15 - v14;
      if (v16 == a2)
      {
        v17 = v15;
        objc_msgSend(v12, "frame");
        if (v12)
        {
          if ((v12[144] & 1) != 0)
          {
            v22 = v18;
            v23 = v19;
            v24 = v20;
            v25 = v21;
            objc_msgSend(v12, "indexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
              goto LABEL_12;
            v57.origin.x = v22;
            v57.origin.y = v23;
            v57.size.width = v24;
            v57.size.height = v25;
            v27 = NSIntersectsRect(*(NSRect *)(a1 + 56), v57);

            if (!v27)
              goto LABEL_23;
            v55.origin.x = v22;
            v55.origin.y = v23;
            v55.size.width = v24;
            v55.size.height = v25;
            MidX = CGRectGetMidX(v55);
            v56.origin.x = v22;
            v56.origin.y = v23;
            v56.size.width = v24;
            v56.size.height = v25;
            MidY = CGRectGetMidY(v56);
            v30 = MidX - *(double *)(a1 + 88);
            v31 = MidY - *(double *)(a1 + 96);
            v32 = v30 * v30 + v31 * v31;
            if (v32 < v10)
            {
              if (v14 == v17)
              {
                v33 = *(double *)(a1 + 112);
                v6 = v48;
                if (v33 >= 0.0)
                {
                  if (v33 <= 0.0)
                  {
                    v39 = *(double *)(a1 + 104);
                    if (v39 >= 0.0)
                    {
                      if (v39 <= 0.0 || v30 >= 0.0 && fabs(v31) <= v30)
                        goto LABEL_27;
                    }
                    else
                    {
                      v36 = v30 <= 0.0;
                      v40 = fabs(v31);
                      v41 = fabs(v30);
                      if (v36 && v40 <= v41)
                      {
LABEL_27:
                        v26 = v47;
                        v47 = v12;
                        v10 = v32;
LABEL_12:

                      }
                    }
                  }
                  else
                  {
                    v37 = fabs(v30);
                    if (v31 >= 0.0 && v37 <= v31)
                      goto LABEL_27;
                  }
                }
                else
                {
                  v36 = v31 <= 0.0;
                  v34 = fabs(v30);
                  v35 = fabs(v31);
                  v36 = v36 && v34 <= v35;
                  if (v36)
                    goto LABEL_27;
                }
              }
              else
              {
                v6 = v48;
                if (v30 * *(double *)(a1 + 104) + v31 * *(double *)(a1 + 112) > 0.0)
                  goto LABEL_27;
              }
            }
            else
            {
LABEL_23:
              v6 = v48;
            }
          }
        }
      }
      ++v11;
    }
    while (v8 != v11);
    v43 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    v8 = v43;
  }
  while (v43);

  if (v47)
  {
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v47;
    v6 = v47;

    *v46 = 1;
    goto LABEL_49;
  }
}

- (id)_layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:(id)a3 targetPositionEdges:(unint64_t)a4
{
  UICollectionView *collectionView;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  void *v19;
  void *v21;
  CGRect v22;

  collectionView = self->_collectionView;
  objc_msgSend(a3, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UICollectionView _globalIndexPathForItemAtIndexPath:](collectionView, "_globalIndexPathForItemAtIndexPath:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetGlobalIndex != NSNotFound"));

  }
  -[UICollectionViewLayout _previousLayoutAttributesForGlobalIndex:](self, "_previousLayoutAttributesForGlobalIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout _nextLayoutAttributesForGlobalIndex:](self, "_nextLayoutAttributesForGlobalIndex:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UICollectionViewLayout _layoutAxisForAttributes:previousAttributes:nextAttributes:](self, "_layoutAxisForAttributes:previousAttributes:nextAttributes:", a3, v11, v12);
  objc_msgSend(a3, "frame");
  -[UICollectionViewLayout _frameForInsertionIndicatorForTargetFrame:axis:edges:](self, "_frameForInsertionIndicatorForTargetFrame:axis:edges:", v13, a4);
  -[UICollectionViewLayout _centerInsertionIndicatorFrame:targetAttributes:axis:edges:](self, "_centerInsertionIndicatorFrame:targetAttributes:axis:edges:", a3, v13, a4);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  if (CGRectIsNull(v22))
  {
    v18 = 0;
  }
  else
  {
    -[UICollectionViewLayout _indexPathForInsertionIndicatorForTargetAttributes:axis:edges:previousAttributes:nextAttributes:](self, "_indexPathForInsertionIndicatorForTargetAttributes:axis:edges:previousAttributes:nextAttributes:", a3, v13, a4, v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", x, y, width, height);

  }
  return v18;
}

- (id)_layoutAttributesForInsertionIndicatorAtTargetPosition:(CGPoint)a3 sourceIndexPath:(id)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  y = a3.y;
  x = a3.x;
  -[UICollectionViewLayout _layoutAttributesForItemNearestPosition:maximumDistance:](self, "_layoutAttributesForItemNearestPosition:maximumDistance:", a3.x, a3.y, 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    -[UICollectionViewLayout _layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:targetPositionEdges:](self, "_layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:targetPositionEdges:", v9, _UIDirectionalRectEdgesForLocationRelativeToRectWithDefaultEdges(12, x, y, v10, v11, v12, v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPath");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (a4)
    {
      if (v15)
      {
        v17 = objc_msgSend(a4, "section");
        if (v17 == objc_msgSend(v16, "section") && objc_msgSend(a4, "compare:", v16) == -1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v16, "item") - 1, objc_msgSend(v16, "section"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setIndexPath:", v18);

        }
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_layoutAttributesForInsertionIndicatorAtTargetIndexPath:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    if (objc_msgSend(a3, "item") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(a3, "item") - 1, objc_msgSend(a3, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 12;
      goto LABEL_6;
    }
    v6 = 0;
  }
  v7 = 3;
LABEL_6:
  -[UICollectionViewLayout _layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:targetPositionEdges:](self, "_layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:targetPositionEdges:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)_frameForInsertionIndicatorForTargetFrame:(CGRect)a3 axis:(unint64_t)a4 edges:(unint64_t)a5
{
  char v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MaxY;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 == 2)
  {
    MinX = CGRectGetMinX(a3);
    v11 = x;
    v12 = y;
    v13 = width;
    v14 = height;
    if ((v5 & 1) != 0)
      MaxY = CGRectGetMinY(*(CGRect *)&v11) + -5.0;
    else
      MaxY = CGRectGetMaxY(*(CGRect *)&v11);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v16 = CGRectGetWidth(v20);
    v17 = 5.0;
  }
  else if (a4 == 1)
  {
    if ((a5 & 2) != 0)
      MinX = CGRectGetMinX(a3) + -5.0;
    else
      MinX = CGRectGetMaxX(a3);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    MaxY = CGRectGetMinY(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v17 = CGRectGetHeight(v22);
    v16 = 5.0;
  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    MinX = *MEMORY[0x1E0C9D628];
    MaxY = *(double *)(MEMORY[0x1E0C9D628] + 8);
  }
  v18 = MinX;
  v19 = MaxY;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_centerInsertionIndicatorFrame:(CGRect)a3 targetAttributes:(id)a4 axis:(unint64_t)a5 edges:(unint64_t)a6
{
  char v6;
  CGFloat height;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double Width;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double MaxX;
  double MinY;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat v53;
  double v54;
  double y;
  double x;
  double rect;
  _QWORD v58[4];
  id v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _QWORD v67[4];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect result;

  v6 = a6;
  height = a3.size.height;
  x = a3.origin.x;
  rect = a3.size.width;
  y = a3.origin.y;
  if (a4)
  {
    v11 = *((_WORD *)a4 + 144);
    v12 = 1;
    if ((v11 & 2) != 0)
      v12 = 2;
    if ((v11 & 1) != 0)
      v13 = 0;
    else
      v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a4, "indexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = _UIUnitVectorFromDirectionalRectEdgeAndPermittedAxis(v6, a5);
  -[UICollectionViewLayout _layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:](self, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", v16, v18, v20, v22, v23, v24, 200.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__43;
  v72 = __Block_byref_object_dispose__43;
  v73 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0x7FEFFFFFFFFFFFFFLL;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __85__UICollectionViewLayout__centerInsertionIndicatorFrame_targetAttributes_axis_edges___block_invoke;
  v58[3] = &unk_1E16BE0A0;
  v26 = v14;
  v63 = v16;
  v64 = v18;
  v65 = v20;
  v66 = v22;
  v59 = v26;
  v60 = v67;
  v61 = &v68;
  v62 = v13;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v58);
  v27 = (void *)v69[5];
  if (!v27)
    goto LABEL_25;
  objc_msgSend(v27, "frame");
  v53 = v31;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  v54 = height;
  if (a5 == 2)
  {
    v74.origin.y = y;
    v74.origin.x = x;
    v74.size.width = rect;
    v74.size.height = height;
    MinX = CGRectGetMinX(v74);
    if ((v6 & 1) != 0)
    {
      v83.origin.x = v32;
      v83.origin.y = v33;
      v83.size.width = v34;
      v83.size.height = v53;
      MaxY = CGRectGetMaxY(v83);
      v84.origin.y = y;
      v84.origin.x = x;
      v84.size.width = rect;
      v84.size.height = height;
      Width = CGRectGetWidth(v84);
      v85.origin.x = v16;
      v85.origin.y = v18;
      v85.size.width = v20;
      v85.size.height = v22;
      MinY = CGRectGetMinY(v85);
      v86.origin.x = v32;
      v86.origin.y = v33;
      v86.size.width = v34;
      v86.size.height = v53;
      v37 = MinY - CGRectGetMaxY(v86);
    }
    else
    {
      v75.origin.x = v16;
      v75.origin.y = v18;
      v75.size.width = v20;
      v75.size.height = v22;
      MaxY = CGRectGetMaxY(v75);
      v76.origin.y = y;
      v76.origin.x = x;
      v76.size.width = rect;
      v76.size.height = height;
      Width = CGRectGetWidth(v76);
      v77.origin.x = v32;
      v77.origin.y = v33;
      v77.size.width = v34;
      v77.size.height = v53;
      v36 = CGRectGetMinY(v77);
      v78.origin.x = v16;
      v78.origin.y = v18;
      v78.size.width = v20;
      v78.size.height = v22;
      v37 = v36 - CGRectGetMaxY(v78);
    }
LABEL_18:
    v46 = MaxY;
    v45 = MinX;
    goto LABEL_19;
  }
  if (a5 == 1)
  {
    if ((v6 & 2) != 0)
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v28);
      v87.origin.y = y;
      v87.origin.x = x;
      v87.size.width = rect;
      v87.size.height = height;
      MaxY = CGRectGetMinY(v87);
      v88.origin.x = v16;
      v88.origin.y = v18;
      v88.size.width = v20;
      v88.size.height = v22;
      v38 = CGRectGetMinX(v88);
      v39 = v32;
      v40 = v33;
      v41 = v34;
      v42 = v53;
    }
    else
    {
      v79.origin.x = v16;
      v79.origin.y = v18;
      v79.size.width = v20;
      v79.size.height = v22;
      MinX = CGRectGetMaxX(v79);
      v80.origin.y = y;
      v80.origin.x = x;
      v80.size.width = rect;
      v80.size.height = height;
      MaxY = CGRectGetMinY(v80);
      v81.origin.x = v32;
      v81.origin.y = v33;
      v81.size.width = v34;
      v81.size.height = v53;
      v38 = CGRectGetMinX(v81);
      v39 = v16;
      v40 = v18;
      v41 = v20;
      v42 = v22;
    }
    MaxX = CGRectGetMaxX(*(CGRect *)&v39);
    v82.origin.y = y;
    v82.origin.x = x;
    v82.size.width = rect;
    v82.size.height = v54;
    v37 = CGRectGetHeight(v82);
    Width = v38 - MaxX;
    goto LABEL_18;
  }
  Width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v37 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v45 = *MEMORY[0x1E0C9D628];
  v46 = *(double *)(MEMORY[0x1E0C9D628] + 8);
LABEL_19:
  v89.origin.x = v45;
  v89.origin.y = v46;
  v89.size.width = Width;
  v89.size.height = v37;
  if (CGRectIsNull(v89))
  {
LABEL_24:
    height = v54;
    goto LABEL_25;
  }
  if (a5 == 1)
  {
    x = round(v45 + (Width - rect) * 0.5);
    goto LABEL_24;
  }
  if (a5 != 2)
    goto LABEL_24;
  height = v54;
  y = round(v46 + (v37 - v54) * 0.5);
LABEL_25:

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(&v68, 8);

  v48 = y;
  v47 = x;
  v49 = rect;
  v50 = height;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

void __85__UICollectionViewLayout__centerInsertionIndicatorFrame_targetAttributes_axis_edges___block_invoke(uint64_t a1, _WORD *a2)
{
  __int16 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  uint64_t v13;

  if (!a2 || (v4 = a2[144], (v4 & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    if ((v4 & 2) != 0)
      return;
    v5 = 1;
  }
  objc_msgSend(a2, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(_QWORD *)(a1 + 56);

    if (v5 == v7)
      return;
  }
  else
  {

  }
  objc_msgSend(a2, "frame");
  v12 = UIDistanceBetweenRects(v8, v9, v10, v11, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v12 < *(double *)(v13 + 24))
  {
    *(double *)(v13 + 24) = v12;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
}

- (id)_indexPathForInsertionIndicatorForTargetAttributes:(id)a3 axis:(unint64_t)a4 edges:(unint64_t)a5 previousAttributes:(id)a6 nextAttributes:(id)a7
{
  char v8;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;

  v8 = a5;
  objc_msgSend(a3, "indexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a4 == 1)
  {
    if ((v8 & 8) != 0)
      goto LABEL_10;
    if ((v8 & 2) != 0)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

    goto LABEL_9;
  }
  if (a4 != 2)
    goto LABEL_8;
  if ((v8 & 4) == 0)
  {
    if ((v8 & 1) != 0)
    {
LABEL_5:
      v14 = v12;
LABEL_20:
      v16 = v14;
      goto LABEL_21;
    }
    goto LABEL_8;
  }
LABEL_10:
  if (a7)
  {
    if ((unint64_t)objc_msgSend(v12, "length") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v13, "item") + 1, objc_msgSend(v13, "section"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UICollectionView _indexPathIsSectionAppendingIndexPath:](self->_collectionView, "_indexPathIsSectionAppendingIndexPath:", v16))
      {
        if (v16)
          goto LABEL_21;
      }
      else
      {

      }
    }
    objc_msgSend(a7, "indexPath");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v17 = -[UICollectionView _globalIndexPathForItemAtIndexPath:](self->_collectionView, "_globalIndexPathForItemAtIndexPath:", v12);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL
    && v17 + 1 == -[UICollectionView _totalItemCount](self->_collectionView, "_totalItemCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v13, "item") + 1, objc_msgSend(v13, "section"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_9:
  v16 = 0;
LABEL_21:

  return v16;
}

- (BOOL)_allowsItemInteractionsToBegin
{
  return 1;
}

- (unint64_t)_layoutAxisForAttributes:(id)a3 previousAttributes:(id)a4 nextAttributes:(id)a5
{
  BOOL v6;
  int v7;
  id v10;
  id v11;
  unint64_t result;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v7 == 1 && a5 != 0)
    return _UILayoutAxisForAttributeTriple(a4, a3, a5);
  if (!a5 && ((v7 ^ 1) & 1) == 0)
  {
    v10 = a4;
    v11 = a3;
    return _UILayoutAxisForAttributePair(v10, v11);
  }
  if (a3 && !a4 && a5)
  {
    v10 = a3;
    v11 = a5;
    return _UILayoutAxisForAttributePair(v10, v11);
  }
  result = 0;
  if (a3 && !a4 && !a5)
  {
    v13 = -[UICollectionViewLayout _layoutAxis](self, "_layoutAxis");
    if (v13 - 1 > 1)
      return 0;
    v14 = v13;
    objc_msgSend(a3, "frame");
    v16 = v15;
    v18 = v17;
    v19 = v14 == 1 ? 2 : v14 == 2;
    -[UICollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
    v22 = _UISizeValueForAxis(v19, v20, v21);
    v23 = _UISizeValueForAxis(v19, v16, v18);
    if (fabs(v22) >= 2.22044605e-16)
    {
      if (v23 / v22 <= 0.5)
        return v19;
      else
        return v14;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_previousLayoutAttributesForGlobalIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v6 = 0;
  }
  else
  {
    -[UICollectionView _indexPathForGlobalIndex:](self->_collectionView, "_indexPathForGlobalIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2720, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousIndexPath"));

    }
    -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2722, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousAttributes"));

    }
  }
  return v6;
}

- (id)_nextLayoutAttributesForGlobalIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || a3 + 1 >= -[UICollectionView _totalItemCount](self->_collectionView, "_totalItemCount"))
  {
    v6 = 0;
  }
  else
  {
    -[UICollectionView _indexPathForGlobalIndex:](self->_collectionView, "_indexPathForGlobalIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 2737, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextIndexPath"));

    }
    -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_layoutAttributesForElementsInProjectedRect:(CGRect)a3 withProjectionVector:(CGVector)a4 projectionDistance:(double)a5
{
  double y;
  double x;
  double dy;
  double dx;
  double width;
  double v10;
  BOOL v11;
  double height;
  long double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  y = a3.origin.y;
  x = a3.origin.x;
  if (fabs(a5) < 2.22044605e-16
    || ((dy = a4.dy, dx = a4.dx, width = a3.size.width, v10 = fabs(a4.dy), fabs(a4.dx) < 2.22044605e-16)
      ? (v11 = v10 < 2.22044605e-16)
      : (v11 = 0),
        v11))
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    height = a3.size.height;
    v15 = hypot(a4.dx, a4.dy);
    v16 = x + width * 0.5 + dx / v15 * a5;
    v17 = y + height * 0.5 + dy / v15 * a5;
    v37.origin.y = round(v17 - height * 0.5);
    v37.origin.x = round(v16 - width * 0.5);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v37.size.width = width;
    v37.size.height = height;
    v36 = CGRectUnion(v35, v37);
    -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v18);
      v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __110__UICollectionViewLayout__layoutAttributesForElementsInProjectedRect_withProjectionVector_projectionDistance___block_invoke;
      v23[3] = &unk_1E16BE0C8;
      v25 = x + width * 0.5;
      v26 = y + height * 0.5;
      v27 = v16;
      v28 = v17;
      v29 = v25;
      v30 = v26;
      v31 = x;
      v32 = y;
      v33 = width;
      v34 = height;
      v24 = v20;
      v21 = v20;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);
      objc_msgSend(v19, "removeObjectsAtIndexes:", v21);

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v19;
}

uint64_t __110__UICollectionViewLayout__layoutAttributesForElementsInProjectedRect_withProjectionVector_projectionDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t result;
  CGRect v31;
  CGRect v32;

  objc_msgSend(a2, "center");
  v8 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v12 = v11 - v9;
  v13 = v10 - v8;
  v14 = vabdd_f64(v9 * v10 + v6 * (v11 - v9) - v7 * (v10 - v8), v8 * v11);
  v15 = sqrt(v13 * v13 + v12 * v12);
  v16 = v14 / v15;
  if (fabs(v15) < 2.22044605e-16)
    v16 = 1.79769313e308;
  v17 = sqrt((*(double *)(a1 + 72) - v6) * (*(double *)(a1 + 72) - v6)+ (*(double *)(a1 + 80) - v7) * (*(double *)(a1 + 80) - v7));
  v18 = sqrt(v17 * v17 - v16 * v16);
  v19 = hypot(v13, v12);
  v20 = v8 + v13 / v19 * v18;
  v21 = v9 + v12 / v19 * v18;
  v22 = *(double *)(a1 + 104);
  v23 = *(double *)(a1 + 112);
  v24 = round(v21 - v23 * 0.5);
  v25 = round(v20 - v22 * 0.5);
  objc_msgSend(a2, "frame");
  v32.origin.x = v26;
  v32.origin.y = v27;
  v32.size.width = v28;
  v32.size.height = v29;
  v31.origin.x = v25;
  v31.origin.y = v24;
  v31.size.width = v22;
  v31.size.height = v23;
  result = CGRectIntersectsRect(v31, v32);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

- (id)_layoutAttributesForItemNearestPosition:(CGPoint)a3 maximumDistance:(double)a4
{
  CGFloat y;
  double x;
  double v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  y = a3.y;
  x = a3.x;
  v6 = fabs(a4);
  v7 = a4 * 0.5;
  if (v6 < 2.22044605e-16)
    v7 = 1.0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", round(x - v7 * 0.5), round(a3.y - v7 * 0.5), v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FEFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__UICollectionViewLayout__layoutAttributesForItemNearestPosition_maximumDistance___block_invoke;
  v11[3] = &unk_1E16BE0F0;
  *(double *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  v11[4] = v12;
  v11[5] = &v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v14[5];
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __82__UICollectionViewLayout__layoutAttributesForItemNearestPosition_maximumDistance___block_invoke(uint64_t a1, _WORD *a2)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  uint64_t v9;

  if (a2 && (a2[144] & 1) != 0)
  {
    objc_msgSend(a2, "frame");
    UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), v4, v5, v6, v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

- (unint64_t)_edgesForSafeAreaPropagationToDescendants
{
  return 0;
}

- (CGRect)_contentFrameForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_layoutFrameForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)_orthogonalScrollingLayoutRectForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_orthogonalScrollingContentRectForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)_orthogonalScrollingAxis
{
  return 0;
}

- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  return 1;
}

- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  return 1;
}

- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3
{
  return 0;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  return 1;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3
{
  return 1;
}

- (BOOL)_wantsCustomSectionContainers
{
  return 0;
}

- (id)_sectionDescriptorForSectionIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)_sublayoutType
{
  return self->_sublayoutType;
}

- (void)_setSublayoutType:(int64_t)a3
{
  self->_sublayoutType = a3;
}

@end
