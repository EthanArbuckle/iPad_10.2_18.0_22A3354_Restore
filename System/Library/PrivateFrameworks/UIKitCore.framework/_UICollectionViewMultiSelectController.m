@implementation _UICollectionViewMultiSelectController

- (_UICollectionViewMultiSelectController)initWithCollectionView:(id)a3
{
  id v4;
  _UICollectionViewMultiSelectController *v5;
  _UICollectionViewMultiSelectController *v6;
  UIMultiSelectInteraction *v7;
  UIMultiSelectInteraction *multiSelectInteraction;
  id WeakRetained;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewMultiSelectController;
  v5 = -[_UICollectionViewMultiSelectController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    v7 = objc_alloc_init(UIMultiSelectInteraction);
    multiSelectInteraction = v6->_multiSelectInteraction;
    v6->_multiSelectInteraction = v7;

    -[UIMultiSelectInteraction setDelegate:](v6->_multiSelectInteraction, "setDelegate:", v6);
    -[UIMultiSelectInteraction setEnabled:](v6->_multiSelectInteraction, "setEnabled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_collectionView);
    objc_msgSend(WeakRetained, "addInteraction:", v6->_multiSelectInteraction);

    v6->_computedAxisConstraint = 4;
  }

  return v6;
}

- (void)collectionViewDidUpdateVisibleCells
{
  void *v3;
  _QWORD v4[5];

  -[_UICollectionViewMultiSelectController contentMaskCache](self, "contentMaskCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      *(_BYTE *)&self->_flags |= 1u;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __77___UICollectionViewMultiSelectController_collectionViewDidUpdateVisibleCells__block_invoke;
      v4[3] = &unk_1E16B1B28;
      v4[4] = self;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v4);
    }
  }
}

- (NSMapTable)contentMaskCache
{
  return self->_contentMaskCache;
}

- (BOOL)isInMultiselectInteraction
{
  void *v2;
  char v3;

  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInMultiselectInteraction");

  return v3;
}

- (UIMultiSelectInteractionState)selectionState
{
  return self->_selectionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMaskCache, 0);
  objc_storeStrong((id *)&self->_selectionState, 0);
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (void)dealloc
{
  objc_super v3;

  -[_UICollectionViewMultiSelectController uninstallFromCollectionView](self, "uninstallFromCollectionView");
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewMultiSelectController;
  -[_UICollectionViewMultiSelectController dealloc](&v3, sel_dealloc);
}

- (void)uninstallFromCollectionView
{
  id WeakRetained;

  if (self->_multiSelectInteraction)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(WeakRetained, "removeInteraction:", self->_multiSelectInteraction);

  }
}

- (BOOL)isEnabled
{
  return -[UIMultiSelectInteraction isEnabled](self->_multiSelectInteraction, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[UIMultiSelectInteraction setEnabled:](self->_multiSelectInteraction, "setEnabled:", a3);
}

- (int64_t)axisConstraintForSingleFingerPanGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  int v10;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UICollectionViewMultiSelectController axisConstraintAtIndexPath:](self, "axisConstraintAtIndexPath:", v7);
  if (v8 == 1)
  {
    if (v7)
    {
      objc_msgSend(v6, "collectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_supportsSwipeActionsForIndexPath:", v7);

      v8 = v10 ^ 1u;
    }
    else
    {
      v8 = 1;
    }
  }

  return v8;
}

- (int64_t)axisConstraintAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int64_t computedAxisConstraint;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasOrthogonalScrollingSections");

  if ((v7 & 1) != 0 || (computedAxisConstraint = self->_computedAxisConstraint, computedAxisConstraint == 4))
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_hasOrthogonalScrollingSections");

    if ((v11 & 1) != 0
      || (-[_UICollectionViewMultiSelectController collectionView](self, "collectionView"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "collectionViewLayout"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "_layoutAxis"),
          v13,
          v12,
          v14 >= 4))
    {
      -[_UICollectionViewMultiSelectController _boundingScrollViewForIndexPath:](self, "_boundingScrollViewForIndexPath:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v15, "contentSize");
      if (v20 <= v17 || v21 > v19)
      {
        if (v21 <= v19 || v20 > v17)
        {
          if (v20 > v17 || v21 > v19)
            computedAxisConstraint = 0;
          else
            computedAxisConstraint = 3;
        }
        else
        {
          computedAxisConstraint = 1;
        }
      }
      else
      {
        computedAxisConstraint = 2;
      }

    }
    else
    {
      computedAxisConstraint = 3 - v14;
    }
    self->_computedAxisConstraint = computedAxisConstraint;
  }

  return computedAxisConstraint;
}

- (int64_t)axisConstraintAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int64_t v8;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UICollectionViewMultiSelectController axisConstraintAtIndexPath:](self, "axisConstraintAtIndexPath:", v7);
  return v8;
}

- (id)selectionStartIndexPath
{
  return -[UIMultiSelectInteractionState startIndexPath](self->_selectionState, "startIndexPath");
}

- (id)selectionEndIndexPath
{
  return -[UIMultiSelectInteractionState endIndexPath](self->_selectionState, "endIndexPath");
}

- (id)_autoScrollAssistantForIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  UICollectionView **p_collectionView;
  id WeakRetained;
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "section", (_QWORD)v19);
        if (v11 != objc_msgSend(v5, "section"))
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  p_collectionView = &self->_collectionView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "_autoScrollAssistant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = objc_loadWeakRetained((id *)p_collectionView);
    objc_msgSend(v16, "_autoScrollAssistantForIndexPath:", v5);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }

  return v15;
}

- (id)_boundingScrollViewForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController _autoScrollAssistantForIndexPaths:](self, "_autoScrollAssistantForIndexPaths:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)childScrollViewAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewMultiSelectController _boundingScrollViewForIndexPath:](self, "_boundingScrollViewForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_autoScrollAtIndexPaths:(id)a3 fromPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  y = a4.y;
  x = a4.x;
  -[_UICollectionViewMultiSelectController _autoScrollAssistantForIndexPaths:](self, "_autoScrollAssistantForIndexPaths:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = v7;
    objc_msgSend(v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v9, x, y);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v14, "autoScrollFromPoint:", v11, v13);
    v7 = v14;
  }

}

- (id)_antecedentIndexPathsForLayoutAttributes:(id)a3 inDirection:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UICollectionViewMultiSelectController axisConstraintAtIndexPath:](self, "axisConstraintAtIndexPath:", v7);
  -[_UICollectionViewMultiSelectController _boundingScrollViewForIndexPath:](self, "_boundingScrollViewForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  if (v8 == 2)
  {
    objc_msgSend(v9, "bounds");
    v10 = 10;
  }
  else if (v8 == 1)
  {
    objc_msgSend(v9, "bounds");
    v10 = 5;
  }
  else
  {
    v10 = 0;
  }
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentScaleFactor");
  v15 = v14;

  objc_msgSend(v5, "frame");
  v33 = v5;
  objc_msgSend(v12, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v5);
  v31 = v12;
  objc_msgSend(v12, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", UIRectInsetEdges(v10, v16, v17, v18, v19, v15));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v25, "indexPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "section");
        v28 = objc_msgSend(v7, "section");

        if (v27 == v28 && !objc_msgSend(v25, "representedElementCategory"))
        {
          objc_msgSend(v25, "indexPath");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v29);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }

  return v6;
}

- (BOOL)_point:(CGPoint)a3 liesBeyondFrame:(CGRect)a4 inDirection:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  int64_t v12;
  BOOL v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = -[_UICollectionViewMultiSelectController axisConstraintAtPoint:](self, "axisConstraintAtPoint:");
  if (a5 < 0.0)
  {
    if (v12 == 2)
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      return v11 < CGRectGetMinX(v18);
    }
    if (v12 == 1)
    {
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      return v10 < CGRectGetMinY(v16);
    }
    return 0;
  }
  if (v12 == 2)
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v14 = v11 <= CGRectGetMaxX(v19);
  }
  else
  {
    if (v12 != 1)
      return 0;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v14 = v10 <= CGRectGetMaxY(v17);
  }
  return !v14;
}

- (id)indexPathsBetweenIndexPath:(id)a3 andIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  _BOOL4 v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layoutAttributesForItemAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v54 = v10;
  objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v10);
  v59 = v12;
  v60 = v11;
  v13 = v11 + v12 * 0.5;
  v58 = v14;
  v16 = v15;
  v17 = v15 + v14 * 0.5;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v7;
  objc_msgSend(v18, "layoutAttributesForItemAtIndexPath:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "frame");
  objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v19);
  v22 = v21 + v20 * 0.5;
  v25 = v24 + v23 * 0.5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 >= v13)
    v27 = v22;
  else
    v27 = v13;
  if (v22 >= v13)
    v28 = v13;
  else
    v28 = v22;
  if (v25 >= v17)
    v29 = v25;
  else
    v29 = v17;
  if (v25 >= v17)
    v30 = v17;
  else
    v30 = v25;
  objc_msgSend(v9, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", v28, v30, fmax(v27 - v28, 1.0), fmax(v29 - v30, 1.0));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v6;
  if (-[_UICollectionViewMultiSelectController axisConstraintAtIndexPath:](self, "axisConstraintAtIndexPath:", v6) == 1)
    v32 = v25 < v17;
  else
    v32 = v22 < v13;
  v61 = 0u;
  v62 = 0u;
  if (v32)
    v33 = -1.0;
  else
    v33 = 1.0;
  v63 = 0uLL;
  v64 = 0uLL;
  v34 = v31;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  v57 = -v33;
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (!objc_msgSend(v39, "representedElementCategory"))
        {
          objc_msgSend(v39, "frame");
          objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v39);
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          objc_msgSend(v39, "indexPath");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v48);

          if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v41, v43, v60, v16, v59, v58, v33))
          {
            -[_UICollectionViewMultiSelectController _antecedentIndexPathsForLayoutAttributes:inDirection:](self, "_antecedentIndexPathsForLayoutAttributes:inDirection:", v39, v57);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "unionSet:", v49);

          }
          if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v22, v25, v41, v43, v45, v47, v33))
          {
            -[_UICollectionViewMultiSelectController _antecedentIndexPathsForLayoutAttributes:inDirection:](self, "_antecedentIndexPathsForLayoutAttributes:inDirection:", v39, v33);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "unionSet:", v50);

          }
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v36);
  }

  if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v22, v25, v60, v16, v59, v58, v33))
  {
    -[_UICollectionViewMultiSelectController _antecedentIndexPathsForLayoutAttributes:inDirection:](self, "_antecedentIndexPathsForLayoutAttributes:inDirection:", v54, v57);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minusSet:", v51);

    -[_UICollectionViewMultiSelectController _antecedentIndexPathsForLayoutAttributes:inDirection:](self, "_antecedentIndexPathsForLayoutAttributes:inDirection:", v19, v33);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minusSet:", v52);

  }
  objc_msgSend(v26, "addObject:", v56);
  objc_msgSend(v26, "addObject:", v55);

  return v26;
}

- (void)_extendSelectionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((*(_BYTE *)&self->_flags & 4) == 0)
      {
        -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v10 = v14;
        if (v14)
        {
          -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "startIndexPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UICollectionViewMultiSelectController indexPathsBetweenIndexPath:andIndexPath:](self, "indexPathsBetweenIndexPath:andIndexPath:", v12, v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            *(_BYTE *)&self->_flags |= 4u;
            -[_UICollectionViewMultiSelectController updateSelectedIndexPaths:](self, "updateSelectedIndexPaths:", v13);
            *(_BYTE *)&self->_flags &= ~4u;
            -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v13, x, y);
          }

          v10 = v14;
        }

      }
    }
  }
}

- (void)_updateContentMasksForVisibleCells
{
  char flags;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  flags = (char)self->_flags;
  -[_UICollectionViewMultiSelectController contentMaskCache](self, "contentMaskCache");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    if ((flags & 1) == 0)
      goto LABEL_29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController setContentMaskCache:](self, "setContentMaskCache:", v6);
  }
  *(_BYTE *)&self->_flags &= ~1u;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_identityTracker:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewMultiSelectController.m"), 520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityTracker != nil"));

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v8, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v11)
    {
      v12 = v11;
      v25 = v8;
      v26 = 0;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v15, "_layoutAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "indexPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UIIndexPathIdentityTracker identifierForIndexPath:]((uint64_t)v9, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            _UIImageForView(v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v6, "setObject:forKey:", v20, v18);
            else
              ++v26;

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v12);

      v8 = v25;
      if (v26)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v25;
            _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "UIKit was unable to determine the content area of some of the visible cells in %@. This should never happen.", buf, 0xCu);
          }

          v8 = v25;
        }
        else
        {
          v21 = _updateContentMasksForVisibleCells___s_category;
          if (!_updateContentMasksForVisibleCells___s_category)
          {
            v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v21, (unint64_t *)&_updateContentMasksForVisibleCells___s_category);
          }
          v22 = *(NSObject **)(v21 + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v25;
            _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "UIKit was unable to determine the content area of some of the visible cells in %@. This should never happen.", buf, 0xCu);
          }
        }
      }
    }
    else
    {

    }
  }

LABEL_29:
}

- (id)_indexPathsWithinRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UICollectionViewMultiSelectController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _WORD *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  char v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v43;
  _BOOL4 v44;
  _UICollectionViewMultiSelectController *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v53 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  v46 = v8;
  if (v8 && v9)
  {
    -[_UICollectionViewMultiSelectController contentMaskCache](v7, "contentMaskCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = !v12
       && (-[_UICollectionViewMultiSelectController _updateContentMasksForVisibleCells](v7, "_updateContentMasksForVisibleCells"), -[UIMultiSelectInteraction activeGestureType](v7->_multiSelectInteraction, "activeGestureType") == 8)&& (*(_BYTE *)&v7->_flags & 2) == 0;
    objc_msgSend(v46, "_identityTracker:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "_hasOrthogonalScrollingSections") & 1) != 0)
      objc_msgSend(v10, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", x, y, width, height);
    else
      objc_msgSend(v10, "layoutAttributesForElementsInRect:", x, y, width, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v44 = v13;
      v45 = v7;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v43 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (!v17)
        goto LABEL_30;
      v18 = v17;
      v19 = *(_QWORD *)v49;
      while (1)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_WORD **)(*((_QWORD *)&v48 + 1) + 8 * v20);
          objc_msgSend(v21, "indexPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            if ((v21[144] & 1) != 0 && (objc_msgSend(v21, "isHidden") & 1) == 0)
            {
              objc_msgSend(v21, "alpha");
              if (v23 > 0.0)
              {
                -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v21, "frame");
                objc_msgSend(v10, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v21);
                if (v24)
                  goto LABEL_24;
                v29 = v25;
                v30 = v26;
                v31 = v27;
                v32 = v28;
                v54.origin.x = x;
                v54.origin.y = y;
                v54.size.width = width;
                v54.size.height = height;
                v58.origin.x = v29;
                v58.origin.y = v30;
                v58.size.width = v31;
                v58.size.height = v32;
                if (CGRectContainsRect(v54, v58))
                  goto LABEL_24;
                -[_UIIndexPathIdentityTracker identifierForIndexPath:]((uint64_t)v47, v22);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UICollectionViewMultiSelectController contentMaskCache](v45, "contentMaskCache");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKey:", v33);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  v55.origin.x = x;
                  v55.origin.y = y;
                  v55.size.width = width;
                  v55.size.height = height;
                  v36 = CGRectGetWidth(v55);
                  v56.origin.x = x;
                  v56.origin.y = y;
                  v56.size.width = width;
                  v56.size.height = height;
                  v37 = CGRectGetHeight(v56);
                  objc_msgSend(v46, "_currentScreenScale");
                  v39 = objc_msgSend(v35, "_hasVisibleContentInRect:atScale:", x - v29, y - v30, v36, v37, v38);

                  if ((v39 & 1) == 0)
                    goto LABEL_25;
LABEL_24:
                  objc_msgSend(v15, "addObject:", v22);
                  goto LABEL_25;
                }
                v57.origin.x = x;
                v57.origin.y = y;
                v57.size.width = width;
                v57.size.height = height;
                v59.origin.x = v29;
                v59.origin.y = v30;
                v59.size.width = v31;
                v59.size.height = v32;
                v40 = CGRectIntersectsRect(v57, v59);

                if (v40)
                  goto LABEL_24;
              }
            }
          }
LABEL_25:

          ++v20;
        }
        while (v18 != v20);
        v41 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        v18 = v41;
        if (!v41)
        {
LABEL_30:

          v7 = v45;
          v14 = v43;
          if (v44)
            goto LABEL_31;
          goto LABEL_32;
        }
      }
    }
    v15 = 0;
    if (v13)
LABEL_31:
      -[_UICollectionViewMultiSelectController setContentMaskCache:](v7, "setContentMaskCache:", 0);
LABEL_32:
    v11 = v15;

  }
  return v11;
}

- (void)multiSelectInteraction:(id)a3 selectItemsWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;

  y = a5.y;
  x = a5.x;
  -[_UICollectionViewMultiSelectController _indexPathsWithinRect:](self, "_indexPathsWithinRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewMultiSelectController updateSelectedIndexPaths:](self, "updateSelectedIndexPaths:", v8);
  -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v8, x, y);

}

- (void)multiSelectInteraction:(id)a3 toggleSelectionWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  y = a5.y;
  x = a5.x;
  -[_UICollectionViewMultiSelectController _indexPathsWithinRect:](self, "_indexPathsWithinRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originallySelectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v12, "intersectSet:", v11);
  v13 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v13, "unionSet:", v18);
  objc_msgSend(v13, "minusSet:", v12);
  v14 = (void *)MEMORY[0x1E0C99E20];
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexPathsForSelectedItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "minusSet:", v13);
  -[_UICollectionViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v13);
  -[_UICollectionViewMultiSelectController _deselectIndexPaths:](self, "_deselectIndexPaths:", v17);
  -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v18, x, y);

}

- (void)_selectIndexPaths:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _UICollectionViewMultiSelectController *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v11, "minusSet:", v10);
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___UICollectionViewMultiSelectController__selectIndexPaths___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v15 = v11;
  v16 = self;
  v13 = v11;
  objc_msgSend(v12, "ignoreSelectionChangedNotificationsWithBlock:", v14);

}

- (void)_deselectIndexPaths:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UICollectionViewMultiSelectController *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v9, "intersectSet:", v8);
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62___UICollectionViewMultiSelectController__deselectIndexPaths___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v13 = v9;
  v14 = self;
  v11 = v9;
  objc_msgSend(v10, "ignoreSelectionChangedNotificationsWithBlock:", v12);

}

- (void)updateSelectedIndexPaths:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathsToSelectForInterpolatedIndexPaths:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathsToDeselectForInterpolatedIndexPaths:currentlySelectedIndexPaths:", v5, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v9);
  -[_UICollectionViewMultiSelectController _deselectIndexPaths:](self, "_deselectIndexPaths:", v11);

}

- (void)selectedIndexPathsChanged:(id)a3
{
  id v4;
  void *v5;
  UIMultiSelectInteractionState *v6;

  v4 = a3;
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v6 = (UIMultiSelectInteractionState *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState updateStateWithDifferenceFromCurrentSelection:](v6, "updateStateWithDifferenceFromCurrentSelection:", v4);

  }
  else
  {
    v6 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v4);

    -[_UICollectionViewMultiSelectController setSelectionState:](self, "setSelectionState:", v6);
  }

}

- (void)clearSelectionState
{
  -[_UICollectionViewMultiSelectController setSelectionState:](self, "setSelectionState:", 0);
}

- (id)_collectionViewDelegate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_isUsingTableLayoutSPI
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)_hitTestForSystemEditControlAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double MaxX;
  CGPoint v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "_viewForMultiSelectAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        v9 = 1;
        goto LABEL_15;
      }
      objc_msgSend(v7, "tableViewCell");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editingData:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "editControl:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v7, "tableViewCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "convertPoint:fromView:", v5, x, y);
        v22 = v21;
        v24 = v23;
        objc_msgSend(v8, "frame");
        v27.x = v22;
        v27.y = v24;
        if (CGRectContainsPoint(v28, v27)
          && ((objc_msgSend(v8, "frame"),
               v25 = vabdd_f64(CGRectGetMinX(v29), x),
               objc_msgSend(v8, "frame"),
               MaxX = CGRectGetMaxX(v30),
               v25 < 70.0)
           || vabdd_f64(MaxX, x) < 70.0))
        {
          v9 = 3;
        }
        else
        {
          v9 = 1;
        }
        goto LABEL_13;
      }
    }
    objc_msgSend(v8, "convertPoint:fromView:", v5, x, y);
    v13 = v12;
    v15 = v14;
    objc_msgSend(v8, "bounds");
    if (sqrt((v17 + v16 * 0.5 - v13) * (v17 + v16 * 0.5 - v13) + (v19 + v18 * 0.5 - v15) * (v19 + v18 * 0.5 - v15)) >= 35.0)
      v9 = 2;
    else
      v9 = 3;
LABEL_13:

    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)keyCommandsForSelectionExtension
{
  return -[UIMultiSelectInteraction keyCommandsForSelectionExtension](self->_multiSelectInteraction, "keyCommandsForSelectionExtension");
}

- (id)targetForKeyCommands
{
  return self->_multiSelectInteraction;
}

- (BOOL)supportsKeyboardSelectionExtension
{
  return 1;
}

- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double *v13;
  id WeakRetained;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v48;
  double MaxY;
  double MinX;
  double MaxX;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  CGFloat v57;
  CGFloat v58;
  double MinY;
  void *v60;
  CGFloat v61;
  id v62;
  id v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  -[_UICollectionViewMultiSelectController selectionEndIndexPath](self, "selectionEndIndexPath", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      objc_msgSend(v9, "lastObject");
    else
      objc_msgSend(v9, "firstObject");
    v62 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (uint64_t)v62;
    if (!v62)
      return;
  }
  v63 = (id)v6;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v63);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double *)MEMORY[0x1E0C9D538];
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "visibleBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[_UICollectionViewMultiSelectController _boundingScrollViewForIndexPath:](self, "_boundingScrollViewForIndexPath:", v63);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {
    v25 = v23;
    goto LABEL_18;
  }
  v25 = (void *)v24;
  v26 = -[_UICollectionViewMultiSelectController axisConstraintAtIndexPath:](self, "axisConstraintAtIndexPath:", v63);
  if (v26 != 2)
  {
    if (v26 == 1)
    {

      if (!a4 || a4 == 3)
        goto LABEL_19;
      goto LABEL_17;
    }
    if (!v26)
    {

LABEL_17:
      -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "visibleBounds");
      objc_msgSend(v25, "convertRect:fromView:", v23);
      v16 = v27;
      v18 = v28;
      v20 = v29;
      v22 = v30;
    }
LABEL_18:

    goto LABEL_19;
  }

  if (a4 - 1 >= 2)
    goto LABEL_17;
LABEL_19:
  v31 = *v13;
  v32 = v13[1];
  switch(a4)
  {
    case 0uLL:
      v16 = v16 - v20;
      v20 = v20 + v20;
      v31 = -1.0;
      break;
    case 1uLL:
      v22 = v22 + v22;
      v32 = 1.0;
      break;
    case 2uLL:
      v18 = v18 - v22;
      v22 = v22 + v22;
      v32 = -1.0;
      break;
    case 3uLL:
      v20 = v20 + v20;
      v31 = 1.0;
      break;
    default:
      break;
  }
  objc_msgSend(v11, "_layoutAttributesForNextItemInDirection:fromIndexPath:constrainedToRect:", v63, v31, v32, v16, v18, v20, v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "indexPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[_UICollectionViewMultiSelectController _boundingScrollViewForIndexPath:](self, "_boundingScrollViewForIndexPath:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    objc_msgSend(v33, "frame");
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    MinY = CGRectGetMinY(v64);
    v61 = v39;
    v65.origin.x = v37;
    v65.origin.y = v39;
    v65.size.width = v41;
    v65.size.height = v43;
    v60 = v12;
    if (MinY >= CGRectGetMinY(v65))
    {
      v66.origin.x = x;
      v57 = width;
      v58 = y;
      v66.origin.y = y;
      v66.size.width = width;
      v66.size.height = height;
      MaxY = CGRectGetMaxY(v66);
      v67.origin.x = v37;
      v67.origin.y = v61;
      v67.size.width = v41;
      v67.size.height = v43;
      if (MaxY <= CGRectGetMaxY(v67))
        v48 = 0;
      else
        v48 = 4;
    }
    else
    {
      v48 = 1;
    }
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    MinX = CGRectGetMinX(v68);
    v69.origin.x = v37;
    v69.origin.y = v61;
    v69.size.width = v41;
    v69.size.height = v43;
    if (MinX >= CGRectGetMinX(v69))
    {
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = height;
      MaxX = CGRectGetMaxX(v70);
      v71.origin.x = v37;
      v71.origin.y = v61;
      v71.size.width = v41;
      v71.size.height = v43;
      if (MaxX > CGRectGetMaxX(v71))
        v48 |= 0x20uLL;
    }
    else
    {
      v48 |= 8uLL;
    }
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState", *(_QWORD *)&v57, *(_QWORD *)&v58);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "startIndexPath");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v54 = objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v54, "_scrollToItemAtPresentationIndexPath:atScrollPosition:additionalInsets:animated:", v34, v48, 0, 0.0, 0.0, 0.0, 0.0);

    }
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setEndIndexPath:", v34);

    -[_UICollectionViewMultiSelectController indexPathsBetweenIndexPath:andIndexPath:](self, "indexPathsBetweenIndexPath:andIndexPath:", v53, v34);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController updateSelectedIndexPaths:](self, "updateSelectedIndexPaths:", v56);

    v12 = v60;
  }

}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  void *v4;
  BOOL v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  -[_UICollectionViewMultiSelectController _collectionViewDelegate](self, "_collectionViewDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  v6 = dyld_program_sdk_at_least();
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "allowsMultipleSelectionDuringEditing");
  else
    v9 = objc_msgSend(v7, "_allowsMultipleSelectionDuringEditing");
  v5 = v9;

  return v5;
}

- (BOOL)isInMultiSelectMode
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UICollectionViewMultiSelectController _isUsingTableLayoutSPI](self, "_isUsingTableLayoutSPI"))
  {
    if (dyld_program_sdk_at_least())
      v4 = objc_msgSend(v3, "_allowsEffectiveMultipleSelection");
    else
      v4 = objc_msgSend(v3, "allowsMultipleSelection");
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEditing"))
  {
    v4 = objc_msgSend(v3, "allowsSelectionDuringEditing");
LABEL_8:
    v6 = v4;
    goto LABEL_9;
  }
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

LABEL_9:
  return v6;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  UIMultiSelectInteractionState *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  -[_UICollectionViewMultiSelectController multiSelectInteraction](self, "multiSelectInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeGestureType");

  if (-[_UICollectionViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode"))
  {
    if (dyld_program_sdk_at_least() && (unint64_t)(v6 - 1) <= 1)
    {
      -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "_isEditing") & 1) == 0)
      {
        -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_allowsMultipleSelectionDuringEditing");

        if (!v8)
          return;
        -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEditing:", 1);
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (v3)
    {
      -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathsForSelectedItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v10);
      -[_UICollectionViewMultiSelectController setSelectionState:](self, "setSelectionState:", v11);

    }
    v12 = dyld_program_sdk_at_least();
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "setEditing:", 1);
    else
      objc_msgSend(v13, "setAllowsMultipleSelection:", 1);

    if (v3)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "originallySelectedIndexPaths");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v17);

LABEL_14:
    }
  }
}

- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _UICollectionViewMultiSelectController *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtIndexPath:](v5, "_shouldBeginInteractionAtIndexPath:", v7);
  return (char)v5;
}

- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[_UICollectionViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode"))
  {
    v5 = 1;
  }
  else if (v4)
  {
    -[_UICollectionViewMultiSelectController _collectionViewDelegate](self, "_collectionViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "collectionView:shouldBeginMultipleSelectionInteractionAtIndexPath:", v7, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  BOOL v10;
  double v11;
  double v12;
  BOOL v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  if (-[_UICollectionViewMultiSelectController _isUsingTableLayoutSPI](self, "_isUsingTableLayoutSPI", a3)
    && (*MEMORY[0x1E0C9D538] == x ? (v10 = *(double *)(MEMORY[0x1E0C9D538] + 8) == y) : (v10 = 0),
        (v11 = fabs(y), v12 = fabs(x), !v10) ? (v13 = v11 <= v12) : (v13 = 0),
        v13))
  {
    return 0;
  }
  else
  {
    return -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", v8, v7);
  }
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  UIMultiSelectInteractionState *v15;
  UIMultiSelectInteractionState *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v48 = a3;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForSelectedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (x == *MEMORY[0x1E0C9D628] && y == *(double *)(MEMORY[0x1E0C9D628] + 8))
  {
    v13 = 0;
  }
  else
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItemAtPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (v5)
      v15 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v10);
    else
      v15 = objc_alloc_init(UIMultiSelectInteractionState);
    v16 = v15;
    -[_UICollectionViewMultiSelectController setSelectionState:](self, "setSelectionState:", v15);

  }
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginMultiselectInteraction");

  if (objc_msgSend(v48, "activeGestureType") == 5
    || objc_msgSend(v48, "activeGestureType") == 6
    || objc_msgSend(v48, "activeGestureType") == 7)
  {
    v18 = objc_msgSend(v48, "activeGestureType") != 5;
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "beginSelectingWithStartingIndexPath:otherSelectedIndexPaths:keepCurrentSelection:", v13, v10, v18);
  }
  else
  {
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateStateWithStartingIndexPath:otherSelectedIndexPaths:", v13, v10);
  }

  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startIndexPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startIndexPath");
    v23 = objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "collectionViewLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "layoutAttributesForItemAtIndexPath:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v29 = v28 + v27 * 0.5;
    v32 = v31 + v30 * 0.5;
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setStartPoint:", v29, v32);

    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "originallySelectedIndexPaths");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setOriginallySelectedIndexPaths:", v10);

    }
    v13 = (void *)v23;
  }
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "delegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "collectionView:didBeginMultipleSelectionInteractionAtIndexPath:", v39, v13);

    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "indexPathsForSelectedItems");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v40, "stillValidForSelectedIndexPaths:", v42);

    if ((v43 & 1) == 0)
    {
      v44 = (void *)MEMORY[0x1E0C99E60];
      -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "allSelectedIndexPaths");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setWithArray:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v47);

    }
  }

}

- (void)_performWithPrewarmingCache:(id)a3
{
  char flags;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | flags & 2;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  id v12;
  _BOOL4 v13;
  BOOL v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v12 = a3;
  if (!-[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", v9, v8))goto LABEL_11;
  v13 = -[_UICollectionViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode");
  if (a4 != 5)
  {
    if (a4)
    {
      v14 = 1;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!-[_UICollectionViewMultiSelectController _allowsBandSelectionStartingAtPoint:multiSelectInteraction:](self, "_allowsBandSelectionStartingAtPoint:multiSelectInteraction:", v12, v9, v8))
  {
LABEL_9:
    if (v13)
    {
      v14 = -[_UICollectionViewMultiSelectController _testTouchPolicyAtPoint:withVelocity:](self, "_testTouchPolicyAtPoint:withVelocity:", v9, v8, x, y);
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104___UICollectionViewMultiSelectController_shouldBeginMultiSelectInteraction_ofType_atPoint_withVelocity___block_invoke;
  v16[3] = &unk_1E16C6D18;
  v16[4] = self;
  v16[5] = &v17;
  *(double *)&v16[6] = v9;
  *(double *)&v16[7] = v8;
  -[_UICollectionViewMultiSelectController _performWithPrewarmingCache:](self, "_performWithPrewarmingCache:", v16);
  if (v13 && *((_BYTE *)v18 + 24))
  {
    v14 = 1;
  }
  else
  {
    -[_UICollectionViewMultiSelectController setContentMaskCache:](self, "setContentMaskCache:", 0);
    v14 = 0;
  }
  _Block_object_dispose(&v17, 8);
LABEL_12:

  return v14;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:", objc_msgSend(v7, "section"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_testTouchPolicyAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  int64_t v9;
  void *v10;
  _BOOL4 v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = -[_UICollectionViewMultiSelectController _hitTestForSystemEditControlAtPoint:](self, "_hitTestForSystemEditControlAtPoint:");
  if (v9 == 3)
    return 1;
  if (v9 != 1)
    return 0;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "_isEditing"))
  {

    return 0;
  }
  v11 = -[_UICollectionViewMultiSelectController _allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:](self, "_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:", v7, v6);

  if (!v11)
    return 0;
  v12 = -[_UICollectionViewMultiSelectController axisConstraintForSingleFingerPanGestureAtPoint:](self, "axisConstraintForSingleFingerPanGestureAtPoint:", v7, v6);
  if (v12 == 1)
  {
LABEL_14:
    v16 = fabs(x);
    v17 = fabs(y);
    return v16 > v17;
  }
  if (v12 != 2)
  {
    if (v12 != 3)
      return 0;
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionViewLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_layoutAxis");

    if (v15 != 2)
    {
      if (v15 == 1)
        goto LABEL_10;
      return 0;
    }
    goto LABEL_14;
  }
LABEL_10:
  v16 = fabs(y);
  v17 = fabs(x);
  return v16 > v17;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  self->_computedAxisConstraint = 4;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[UIMultiSelectInteractionState allSelectedIndexPaths](self->_selectionState, "allSelectedIndexPaths", a3, a4.x, a4.y);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewMultiSelectController _autoScrollAssistantForIndexPaths:](self, "_autoScrollAssistantForIndexPaths:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

  -[_UICollectionViewMultiSelectController _collectionViewDelegate](self, "_collectionViewDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UICollectionViewMultiSelectController _collectionViewDelegate](self, "_collectionViewDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionViewDidEndMultipleSelectionInteraction:", v11);

  }
  -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endMultiselectInteraction");

  -[_UICollectionViewMultiSelectController setContentMaskCache:](self, "setContentMaskCache:", 0);
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _UICollectionViewMultiSelectController *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = -[_UICollectionViewMultiSelectController shouldAllowSelectionExtensionAtIndexPath:](v5, "shouldAllowSelectionExtensionAtIndexPath:", v7);
  return (char)v5;
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (!v4)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v9 = -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtIndexPath:](self, "_shouldBeginInteractionAtIndexPath:", v4);
  else
    v9 = 0;

  return v9;
}

- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (dyld_program_sdk_at_least())
    return -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", x, y);
  else
    return -[_UICollectionViewMultiSelectController shouldAllowSelectionExtensionAtPoint:](self, "shouldAllowSelectionExtensionAtPoint:", x, y);
}

- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v13)
  {
    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSelecting");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[_UICollectionViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v11);
    else
      -[_UICollectionViewMultiSelectController _deselectIndexPaths:](self, "_deselectIndexPaths:", v11);

    -[_UICollectionViewMultiSelectController selectionState](self, "selectionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartIndexPath:", v13);

    v8 = v13;
  }

}

- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  if (-[_UICollectionViewMultiSelectController _isUsingTableLayoutSPI](self, "_isUsingTableLayoutSPI"))
  {
    v5 = 1;
  }
  else
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    v5 = -[_UICollectionViewMultiSelectController _hitTestForSystemEditControlAtPoint:](self, "_hitTestForSystemEditControlAtPoint:", v8, v10) == 3;
  }

  return v5;
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewMultiSelectController updateSelectedIndexPaths:](self, "updateSelectedIndexPaths:", v8);

  -[_UICollectionViewMultiSelectController didEndMultiSelectInteraction:atPoint:](self, "didEndMultiSelectInteraction:atPoint:", v9, x, y);
}

- (BOOL)multiSelectInteraction:(id)a3 shouldShowBandForSelectionStartingAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  y = a4.y;
  x = a4.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_wantsBandSelectionVisualsInSection:", objc_msgSend(v8, "section"));

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_allowsBandSelectionStartingAtPoint:(CGPoint)a3 multiSelectInteraction:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[_UICollectionViewMultiSelectController collectionView](self, "collectionView", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTest:withEvent:", 0, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[_UICollectionViewMultiSelectController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v11 != 0;
  }

  return v9;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (void)setMultiSelectInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelectInteraction, a3);
}

- (void)setSelectionState:(id)a3
{
  objc_storeStrong((id *)&self->_selectionState, a3);
}

- (void)setContentMaskCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentMaskCache, a3);
}

@end
