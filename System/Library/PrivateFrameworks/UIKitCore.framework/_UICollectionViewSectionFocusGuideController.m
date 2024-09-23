@implementation _UICollectionViewSectionFocusGuideController

- (void)performLayout
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "_layoutAxis") == 2)
    {
      -[_UICollectionViewSectionFocusGuideController _updatePivotSection](self, "_updatePivotSection");
      -[_UICollectionViewSectionFocusGuideController _sectionsToLoad](self, "_sectionsToLoad");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C99E60];
      -[NSMapTable objectEnumerator](self->_focusGuideToSectionMap, "objectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v12, "minusSet:", v7);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v13);
            -[_UICollectionViewSectionFocusGuideController _removeSectionFocusGuidesForSection:](self, "_removeSectionFocusGuidesForSection:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17++), "integerValue"));
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v15);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v18 = v7;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v18);
            v23 = -[_UICollectionViewSectionFocusGuideController _createOrUpdateSectionFocusGuidePackageForSection:](self, "_createOrUpdateSectionFocusGuidePackageForSection:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22++), "integerValue", (_QWORD)v24));
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v20);
      }

    }
  }

}

- (id)_createOrUpdateSectionFocusGuidePackageForSection:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  _UISectionFocusContainerGuidePackage *v8;
  void *v9;
  _QWORD *v10;
  int64_t v11;
  _UISectionFocusContainerGuidePackage *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  _UIFocusCollectionViewSectionContainerGuide *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t buf[4];
  int64_t v28;
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      objc_msgSend(v6, "collectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (a3 < 0
          || ((objc_msgSend(v6, "_collectionViewData"), (v10 = (_QWORD *)objc_claimAutoreleasedReturnValue()) == 0)
            ? (v11 = 0)
            : (v11 = (uint64_t)(v10[14] - v10[13]) >> 3),
              v10,
              v11 <= a3))
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134217984;
              v28 = a3;
              _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Attempting to create or update focus guide for invalid section: %li", buf, 0xCu);
            }

          }
          else
          {
            v14 = _createOrUpdateSectionFocusGuidePackageForSection____s_category;
            if (!_createOrUpdateSectionFocusGuidePackageForSection____s_category)
            {
              v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v14, (unint64_t *)&_createOrUpdateSectionFocusGuidePackageForSection____s_category);
            }
            v15 = *(NSObject **)(v14 + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              v28 = a3;
              _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Attempting to create or update focus guide for invalid section: %li", buf, 0xCu);
            }
          }
        }
        else
        {
          -[_UICollectionViewSectionFocusGuideController _sectionFocusGuidePackageForSection:](self, "_sectionFocusGuidePackageForSection:", a3);
          v12 = (_UISectionFocusContainerGuidePackage *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v8 = v12;
            -[_UISectionFocusContainerGuidePackage sectionFocusGuide](v12, "sectionFocusGuide");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UICollectionViewSectionFocusGuideController _layoutSectionFocusGuide:forSection:inLayout:](self, "_layoutSectionFocusGuide:forSection:inLayout:", v13, a3, v9);

LABEL_11:
            -[_UICollectionViewSectionFocusGuideController _updateSectionEndFocusGuideForSection:inPackage:layout:](self, "_updateSectionEndFocusGuideForSection:inPackage:layout:", a3, v8, v9);
LABEL_19:

            goto LABEL_20;
          }
          -[_UICollectionViewSectionFocusGuideController _sectionFrameForSection:layout:](self, "_sectionFrameForSection:layout:", a3, v9);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          if (!CGRectIsNull(v30))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[_UIFocusCollectionViewSectionContainerGuide initWithCollectionView:]([_UIFocusCollectionViewSectionContainerGuide alloc], "initWithCollectionView:", v6);
            objc_msgSend(v6, "addLayoutGuide:", v22);
            -[UILayoutGuide _setLockedToOwningView:](v22, "_setLockedToOwningView:", 1);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UICollectionViewSectionFocusContainerGuide_%@"), v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide setIdentifier:](v22, "setIdentifier:", v23);

            -[_UIFocusCollectionViewSectionContainerGuide setSection:](v22, "setSection:", a3);
            v8 = objc_alloc_init(_UISectionFocusContainerGuidePackage);
            -[_UISectionFocusContainerGuidePackage setSectionFocusGuide:](v8, "setSectionFocusGuide:", v22);
            -[_UICollectionViewSectionFocusGuideController focusGuideFromSectionMap](self, "focusGuideFromSectionMap");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v8, v21);

            -[_UICollectionViewSectionFocusGuideController focusGuideToSectionMap](self, "focusGuideToSectionMap");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v21, v8);

            -[_UICollectionViewSectionFocusGuideController _layoutSectionFocusGuide:forSection:withFrame:](self, "_layoutSectionFocusGuide:forSection:withFrame:", v22, a3, x, y, width, height);
            if (!v8)
              goto LABEL_19;
            goto LABEL_11;
          }
        }
      }
      v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_20:

  return v8;
}

- (id)_sectionsToLoad
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v4, "_collectionViewData"), (v6 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0)
      && (v8 = v6[13], v7 = v6[14], v6, (v9 = v7 - v8) != 0)
      && -[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v9 >> 3;
      v13 = -[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection");
      if (v13 <= 6)
        v14 = 6;
      else
        v14 = v13;
      v15 = v12 - 1;
      v16 = -[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection");
      if (v15 >= v16 + 6)
        v17 = v16 + 6;
      else
        v17 = v15;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 - 6 <= v17)
      {
        v18 = v14 - 7;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ++v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v19);

        }
        while (v17 != v18);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)_updatePivotSection
{
  void *v3;
  char v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", 0x7FFFFFFFFFFFFFFFLL);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_needsReload");
    v3 = WeakRetained;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "collectionViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(WeakRetained, "_collectionViewData");
        v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v8 = v6[13];
          v7 = v6[14];

          v9 = v7 - v8;
          if (v7 != v8)
          {
            -[_UICollectionViewSectionFocusGuideController focusedIndexPath](self, "focusedIndexPath");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              -[_UICollectionViewSectionFocusGuideController focusedIndexPath](self, "focusedIndexPath");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", objc_msgSend(v11, "section"));

            }
            if (-[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection") == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(WeakRetained, "_existingVisibleCells");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "firstObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(WeakRetained, "indexPathForCell:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v14;
                if (v14)
                  -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", objc_msgSend(v14, "section"));

              }
            }
            if (-[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection") == 0x7FFFFFFFFFFFFFFFLL)
              -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", 0);
            if (-[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection") != 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = -[_UICollectionViewSectionFocusGuideController pivotSection](self, "pivotSection");
              if ((v16 & ~(v16 >> 63)) >= (v9 >> 3) - 1)
                v17 = (v9 >> 3) - 1;
              else
                v17 = v16 & ~(v16 >> 63);
              -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", v17);
            }
          }
        }
      }

      v3 = WeakRetained;
    }
  }

}

- (int64_t)pivotSection
{
  return self->_pivotSection;
}

- (void)setPivotSection:(int64_t)a3
{
  self->_pivotSection = a3;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (_UICollectionViewSectionFocusGuideController)initWithCollectionView:(id)a3
{
  id v4;
  _UICollectionViewSectionFocusGuideController *v5;
  _UICollectionViewSectionFocusGuideController *v6;
  uint64_t v7;
  NSMapTable *focusGuideFromSectionMap;
  uint64_t v9;
  NSMapTable *focusGuideToSectionMap;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewSectionFocusGuideController;
  v5 = -[_UICollectionViewSectionFocusGuideController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    focusGuideFromSectionMap = v6->_focusGuideFromSectionMap;
    v6->_focusGuideFromSectionMap = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    focusGuideToSectionMap = v6->_focusGuideToSectionMap;
    v6->_focusGuideToSectionMap = (NSMapTable *)v9;

    v6->_pivotSection = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)cleanupSectionFocusGuides
{
  id WeakRetained;
  void *v4;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (WeakRetained)
  {
    -[_UICollectionViewSectionFocusGuideController _focusGuides](self, "_focusGuides");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v9, "_setLockedToOwningView:", 0);
          objc_msgSend(WeakRetained, "removeLayoutGuide:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  -[_UICollectionViewSectionFocusGuideController focusGuideFromSectionMap](self, "focusGuideFromSectionMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[_UICollectionViewSectionFocusGuideController focusGuideToSectionMap](self, "focusGuideToSectionMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (NSMapTable)focusGuideToSectionMap
{
  return self->_focusGuideToSectionMap;
}

- (NSMapTable)focusGuideFromSectionMap
{
  return self->_focusGuideFromSectionMap;
}

- (id)_focusGuides
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMapTable objectEnumerator](self->_focusGuideFromSectionMap, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.focusGuides"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateFocusedIndexPath:(id)a3 immediatelyReevaluatePivotIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[_UICollectionViewSectionFocusGuideController focusedIndexPath](self, "focusedIndexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v10 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if (v8 && v7)
    {
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UICollectionViewSectionFocusGuideController setFocusedIndexPath:](self, "setFocusedIndexPath:", v10);
    if (v4)
      -[_UICollectionViewSectionFocusGuideController _updatePivotSection](self, "_updatePivotSection");
  }
LABEL_10:

}

- (void)updateFocusedIndexPath:(id)a3
{
  -[_UICollectionViewSectionFocusGuideController updateFocusedIndexPath:immediatelyReevaluatePivotIndex:](self, "updateFocusedIndexPath:immediatelyReevaluatePivotIndex:", a3, 1);
}

- (void)reloadSectionFocusGuides
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewSectionFocusGuideController cleanupSectionFocusGuides](self, "cleanupSectionFocusGuides");
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_focusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "collectionViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "_layoutAxis") == 2)
      {
        -[_UICollectionViewSectionFocusGuideController _sectionsToLoad](self, "_sectionsToLoad");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v13 = -[_UICollectionViewSectionFocusGuideController _createOrUpdateSectionFocusGuidePackageForSection:](self, "_createOrUpdateSectionFocusGuidePackageForSection:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "integerValue"));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v10);
        }

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_lastUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_focusGuideToSectionMap, 0);
  objc_storeStrong((id *)&self->_focusGuideFromSectionMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (id)_sectionFocusGuidePackageForSection:(int64_t)a3
{
  void *v3;
  void *v5;
  void *v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[_UICollectionViewSectionFocusGuideController focusGuideFromSectionMap](self, "focusGuideFromSectionMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_updateSectionEndFocusGuideForSection:(int64_t)a3 inPackage:(id)a4 layout:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _UIFocusCollectionViewSectionContainerGuide *v17;
  id WeakRetained;
  void *v19;
  id v20;
  CGRect v21;

  v20 = a4;
  -[_UICollectionViewSectionFocusGuideController _sectionEndFrameForSection:layout:](self, "_sectionEndFrameForSection:layout:", a3, a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionEndFocusGuide");
  v17 = (_UIFocusCollectionViewSectionContainerGuide *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectIsNull(v21))
  {
    if (!v17)
    {
      v17 = -[_UIFocusCollectionViewSectionContainerGuide initWithCollectionView:]([_UIFocusCollectionViewSectionContainerGuide alloc], "initWithCollectionView:", WeakRetained);
      objc_msgSend(WeakRetained, "addLayoutGuide:", v17);
      -[UILayoutGuide _setLockedToOwningView:](v17, "_setLockedToOwningView:", 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UICollectionViewSectionEndFocusContainerGuide_%@"), v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide setIdentifier:](v17, "setIdentifier:", v19);

      -[_UIFocusCollectionViewSectionContainerGuide setSection:](v17, "setSection:", a3);
      objc_msgSend(v20, "setSectionEndFocusGuide:", v17);
    }
    -[UILayoutGuide _setManualLayoutFrame:](v17, "_setManualLayoutFrame:", v9, v11, v13, v15);
    goto LABEL_7;
  }
  if (v17)
  {
    -[UILayoutGuide _setLockedToOwningView:](v17, "_setLockedToOwningView:", 0);
    objc_msgSend(WeakRetained, "removeLayoutGuide:", v17);
    objc_msgSend(v20, "setSectionEndFocusGuide:", 0);
LABEL_7:

  }
}

- (void)_removeSectionFocusGuidesForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewSectionFocusGuideController _sectionFocusGuidePackageForSection:](self, "_sectionFocusGuidePackageForSection:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "focusGuides", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "_setLockedToOwningView:", 0);
          objc_msgSend(WeakRetained, "removeLayoutGuide:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[_UICollectionViewSectionFocusGuideController focusGuideToSectionMap](self, "focusGuideToSectionMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v5);

  }
  -[_UICollectionViewSectionFocusGuideController focusGuideFromSectionMap](self, "focusGuideFromSectionMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v6);

}

- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 inLayout:(id)a5
{
  id v8;

  v8 = a3;
  -[_UICollectionViewSectionFocusGuideController _sectionFrameForSection:layout:](self, "_sectionFrameForSection:layout:", a4, a5);
  -[_UICollectionViewSectionFocusGuideController _layoutSectionFocusGuide:forSection:withFrame:](self, "_layoutSectionFocusGuide:forSection:withFrame:", v8, a4);

}

- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 withFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  int has_internal_diagnostics;
  uint64_t v12;
  _BOOL4 IsNull;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  CGRect v27;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v12 = objc_msgSend(v10, "section");
  if (has_internal_diagnostics)
  {
    if (v12 == a4)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    v15 = objc_msgSend(v10, "section");
    objc_msgSend(v10, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218498;
    v21 = v15;
    v22 = 2048;
    v23 = a4;
    v24 = 2112;
    v25 = v16;
    _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Attempting to layout focus guide for section: %li with mismatched sectionIndex: %li.\n%@", (uint8_t *)&v20, 0x20u);
LABEL_13:

LABEL_14:
    goto LABEL_3;
  }
  if (v12 != a4)
  {
    v17 = _layoutSectionFocusGuide_forSection_withFrame____s_category;
    if (!_layoutSectionFocusGuide_forSection_withFrame____s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&_layoutSectionFocusGuide_forSection_withFrame____s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v14 = v18;
      v19 = objc_msgSend(v10, "section");
      objc_msgSend(v10, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218498;
      v21 = v19;
      v22 = 2048;
      v23 = a4;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Attempting to layout focus guide for section: %li with mismatched sectionIndex: %li.\n%@", (uint8_t *)&v20, 0x20u);
      goto LABEL_13;
    }
  }
LABEL_3:
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  IsNull = CGRectIsNull(v27);
  if (!IsNull)
    objc_msgSend(v10, "_setManualLayoutFrame:", x, y, width, height);
  objc_msgSend(v10, "setEnabled:", !IsNull);

}

- (CGRect)_sectionFrameForSection:(int64_t)a3 layout:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  if (a4)
  {
    v6 = a4;
    objc_msgSend(v6, "_layoutFrameForSection:", a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(v6, "_layoutAxis");

    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(WeakRetained, "bounds");
    v18 = v17;
    v20 = v19;

    v21 = 0.0;
    if (v15 == 1)
      v22 = v20;
    else
      v22 = v14;
    if (v15 == 1)
      v23 = 0.0;
    else
      v23 = v10;
    if (v15 == 2)
      v24 = v14;
    else
      v24 = v22;
    if (v15 == 2)
      v25 = v18;
    else
      v25 = v12;
    if (v15 == 2)
      v26 = v10;
    else
      v26 = v23;
    if (v15 != 2)
      v21 = v8;
  }
  else
  {
    v21 = *MEMORY[0x1E0C9D628];
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v24;
  result.size.width = v25;
  result.origin.y = v26;
  result.origin.x = v21;
  return result;
}

- (CGRect)_sectionEndFrameForSection:(int64_t)a3 layout:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat MinY;
  CGFloat Height;
  CGFloat Width;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MinX;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat rect;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  v8 = objc_msgSend(v6, "_layoutAxis");
  if (!v8)
    goto LABEL_9;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "_collectionViewData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UICollectionViewData _existingNumberOfItemsInSection:]((uint64_t)v11, a3);

  if (v12 > 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12 - 1, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[_UICollectionViewSectionFocusGuideController _sectionFrameForSection:layout:](self, "_sectionFrameForSection:layout:", a3, v7);
      v16 = v15;
      v18 = v17;
      rect = v19;
      v21 = v20;
      objc_msgSend(v14, "frame");
      v40 = v23;
      v41 = v24;
      v42 = v25;
      v26 = *MEMORY[0x1E0C9D628];
      MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
      Width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      Height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      if (v9 == 1)
      {
        v32 = v22;
        v49.origin.x = v16;
        v49.origin.y = v18;
        v49.size.width = rect;
        v49.size.height = v21;
        v39 = v21;
        MinX = CGRectGetMinX(v49);
        v50.origin.x = v32;
        v50.origin.y = v40;
        v50.size.width = v42;
        v50.size.height = v41;
        if (CGRectGetMinX(v50) - MinX >= v42)
        {
          v51.origin.x = v32;
          v51.origin.y = v40;
          v51.size.width = v42;
          v51.size.height = v41;
          v26 = CGRectGetMinX(v51);
          v52.origin.x = v16;
          v52.origin.y = v18;
          v52.size.width = rect;
          v52.size.height = v39;
          MinY = CGRectGetMinY(v52);
          v53.origin.x = v16;
          v53.origin.y = v18;
          v53.size.width = rect;
          v53.size.height = v39;
          Height = CGRectGetHeight(v53);
          Width = v42;
        }
      }
      else if (v9 == 2)
      {
        v30 = v22;
        v44.origin.x = v16;
        v44.origin.y = v18;
        v44.size.width = rect;
        v44.size.height = v21;
        v38 = v21;
        v31 = CGRectGetMinY(v44);
        v45.origin.x = v30;
        v45.origin.y = v40;
        v45.size.width = v42;
        v45.size.height = v41;
        if (CGRectGetMinY(v45) - v31 >= v41)
        {
          v46.origin.x = v16;
          v46.origin.y = v18;
          v46.size.width = rect;
          v46.size.height = v38;
          v26 = CGRectGetMinX(v46);
          v47.origin.x = v30;
          v47.origin.y = v40;
          v47.size.width = v42;
          v47.size.height = v41;
          MinY = CGRectGetMinY(v47);
          v48.origin.x = v16;
          v48.origin.y = v18;
          v48.size.width = rect;
          v48.size.height = v38;
          Width = CGRectGetWidth(v48);
          Height = v41;
        }
      }
    }
    else
    {
      v26 = *MEMORY[0x1E0C9D628];
      MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
      Width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      Height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

  }
  else
  {
LABEL_9:
    v26 = *MEMORY[0x1E0C9D628];
    MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
    Width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    Height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v34 = v26;
  v35 = MinY;
  v36 = Width;
  v37 = Height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)setFocusGuideFromSectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuideFromSectionMap, a3);
}

- (void)setFocusGuideToSectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuideToSectionMap, a3);
}

- (NSUUID)lastUpdateIdentifier
{
  return self->_lastUpdateIdentifier;
}

- (void)setLastUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateIdentifier, a3);
}

- (void)setFocusedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_focusedIndexPath, a3);
}

@end
