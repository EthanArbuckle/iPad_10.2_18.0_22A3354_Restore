@implementation _UICollectionViewLayoutSwipeActionsModule

- (void)transformDecorationLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4
{
  _BOOL8 v4;
  _WORD *v7;
  UISwipeActionController *swipeActionController;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  _UICollectionViewLayoutSwipeActionsModule *v24;
  _WORD *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  int v33;
  void *v34;
  void *v35;
  _WORD *v36;

  v4 = a4;
  v7 = a3;
  v36 = v7;
  if (!v7 || (v7[144] & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 769, CFSTR("-%@ should only be called with layout attributes for decoration views"), v35);

    v7 = v36;
  }
  swipeActionController = self->_swipeActionController;
  objc_msgSend(v7, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](swipeActionController, "_existingSwipeOccurrenceForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "_globalIndexPathForItemAtIndexPath:", v13);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v12, "_indexPathForGlobalIndex:", v14 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](self->_swipeActionController, "_existingSwipeOccurrenceForIndexPath:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  -[UIBarButtonItemGroup _items]((id *)v36);
  v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 == CFSTR("UICollectionViewListLayoutElementKindSwipeActions")
    || v17
    && (v19 = -[__CFString isEqual:](v17, "isEqual:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions")),
        v18,
        v19))
  {
    if (v4)
    {
      if (v10)
      {
        if (objc_msgSend(v10, "_hasAmbiguousIndexPath"))
        {
          objc_msgSend(v36, "frame");
          objc_msgSend(v36, "setFrame:");
          objc_msgSend(v36, "setAlpha:", 1.0);
          if (v36)
            v36[144] |= 0x10u;
        }
      }
    }
    else if (v10)
    {
      v27 = objc_msgSend(v10, "_hasAmbiguousIndexPath");
      objc_msgSend(v36, "setHidden:", v27);
      if ((v27 & 1) == 0)
      {
        objc_msgSend(v36, "indexPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionViewLayoutSwipeActionsModule _cellWithCustomGroupingAtIndexPath:](self, "_cellWithCustomGroupingAtIndexPath:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)v36, objc_msgSend(v29, "_effectiveMaskedCornersForSystemBackgroundView"));

      }
    }
    else
    {
      objc_msgSend(v36, "setHidden:", 1);
    }
    goto LABEL_43;
  }
  v20 = v18;
  v21 = CFSTR("UICollectionViewListLayoutElementKindBottomSeparator");
  if (v20 == v21)
  {

    if (v10)
      goto LABEL_22;
    goto LABEL_29;
  }
  v22 = v21;
  if (v20 && v21)
  {
    v23 = -[__CFString isEqual:](v20, "isEqual:", v21);

    if (v23)
    {
      if (v10)
      {
LABEL_22:
        v24 = self;
        v25 = v36;
        v26 = 1;
LABEL_41:
        v30 = v10;
        goto LABEL_42;
      }
LABEL_29:
      if (!v15)
        goto LABEL_43;
      v24 = self;
      v25 = v36;
      v26 = 1;
      v30 = v15;
LABEL_42:
      -[_UICollectionViewLayoutSwipeActionsModule _transformLayoutAttributes:ofSeparatorAtBottom:forSwipeOccurrence:isDisappearing:](v24, "_transformLayoutAttributes:ofSeparatorAtBottom:forSwipeOccurrence:isDisappearing:", v25, v26, v30, v4);
      goto LABEL_43;
    }
  }
  else
  {

  }
  v31 = v20;
  v32 = v31;
  if (v31 == CFSTR("UICollectionViewListLayoutElementKindTopSeparator"))
  {
    v33 = 1;
  }
  else
  {
    if (!v20 || !CFSTR("UICollectionViewListLayoutElementKindTopSeparator"))
    {

      goto LABEL_43;
    }
    v33 = -[__CFString isEqual:](v31, "isEqual:", CFSTR("UICollectionViewListLayoutElementKindTopSeparator"));
  }

  if (v33 && v10)
  {
    v24 = self;
    v25 = v36;
    v26 = 0;
    goto LABEL_41;
  }
LABEL_43:

}

- (void)transformCellLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4
{
  _BOOL4 v4;
  _WORD *v7;
  _WORD *v8;
  UISwipeActionController *swipeActionController;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  _WORD *v16;
  _WORD *v17;
  int v18;
  char v19;
  char v20;
  _BOOL4 v21;
  UICollectionViewLayout **p_host;
  id v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  double Width;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  NSObject *v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;
  CGRect v53;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7 || (v7[144] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 714, CFSTR("-%@ should only be called with layout attributes for cells"), v45);

  }
  swipeActionController = self->_swipeActionController;
  objc_msgSend(v8, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](swipeActionController, "_existingSwipeOccurrenceForIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(WeakRetained, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellForItemAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "_layoutAttributes");
      v16 = (_WORD *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "alpha");
        objc_msgSend(v8, "setAlpha:");
        if (v8)
          v8[144] = v8[144] & 0xFFEF | v17[144] & 0x10;
        objc_msgSend(v17, "center");
        objc_msgSend(v8, "setCenter:");

        goto LABEL_33;
      }

    }
    v18 = objc_msgSend(v11, "_hasAmbiguousIndexPath");
    if (v4 && v18)
    {
      objc_msgSend(v8, "setAlpha:", 1.0);
      v19 = objc_msgSend(v11, "swipedViewMaskWasRemoved");
      if (v8 && (v19 & 1) == 0)
        v8[144] &= ~0x10u;
      goto LABEL_33;
    }
    if (((v4 | v18) & 1) != 0)
      goto LABEL_33;
    v20 = objc_msgSend(v11, "swipedViewMaskWasRemoved");
    if (v8 && (v20 & 1) == 0)
      v8[144] &= ~0x10u;
    v21 = objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 4;
    p_host = &self->_host;
    v23 = objc_loadWeakRetained((id *)p_host);
    objc_msgSend(v23, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "flipsHorizontalAxis"))
      v26 = -1.0;
    else
      v26 = 1.0;

    if (!v21
      || (objc_msgSend(v11, "currentAction"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "style"),
          v27,
          v28 != 1))
    {
      objc_msgSend(v8, "center");
      v40 = v39;
      v42 = v41;
      objc_msgSend(v11, "offset");
      objc_msgSend(v8, "setCenter:", v40 + v26 * v43, v42);
      goto LABEL_33;
    }
    v29 = objc_loadWeakRetained((id *)p_host);
    objc_msgSend(v8, "indexPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_diagnostics())
    {
      if (v31)
      {
LABEL_29:
        objc_msgSend(v31, "bounds");
        Width = CGRectGetWidth(v53);
        v33 = objc_msgSend(v11, "direction");
        v34 = -Width;
        if (v33)
          v34 = Width;
        v35 = v26 * v34;
        objc_msgSend(v8, "center");
        v37 = v36;
        objc_msgSend(v31, "center");
        objc_msgSend(v8, "setCenter:", v38 + v35, v37);

        goto LABEL_33;
      }
      __UIFaultDebugAssertLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
LABEL_43:

        goto LABEL_29;
      }
      objc_msgSend(v8, "indexPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v47;
      _os_log_fault_impl(&dword_185066000, v46, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
    }
    else
    {
      if (v31)
        goto LABEL_29;
      v48 = transformCellLayoutAttributes_isDisappearing____s_category;
      if (!transformCellLayoutAttributes_isDisappearing____s_category)
      {
        v48 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v48, (unint64_t *)&transformCellLayoutAttributes_isDisappearing____s_category);
      }
      v49 = *(NSObject **)(v48 + 8);
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v46 = v49;
      objc_msgSend(v8, "indexPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v47;
      _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
    }

    goto LABEL_43;
  }
LABEL_33:

}

- (void)processLayoutInvalidationWithContext:(id)a3 updateConfigurations:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v6;
  void *v7;
  _BYTE *v8;

  v4 = a4;
  v8 = a3;
  v6 = -[_UICollectionViewLayoutSwipeActionsModule _canIgnoreInvalidationContext:](self, "_canIgnoreInvalidationContext:", v8);
  v7 = v8;
  if (!v6)
  {
    if (objc_msgSend(v8, "_intent") == 3)
    {
      -[UISwipeActionController reloadData](self->_swipeActionController, "reloadData");
      *(_BYTE *)&self->_flags &= 0xFCu;
    }
    else
    {
      v7 = v8;
      if (v8 && (v8[112] & 8) != 0)
      {
        *(_BYTE *)&self->_flags |= 2u;
        goto LABEL_9;
      }
      -[_UICollectionViewLayoutSwipeActionsModule _invalidateSwipeActionsLayoutRefreshingActiveConfigurations:](self, "_invalidateSwipeActionsLayoutRefreshingActiveConfigurations:", v4);
    }
    v7 = v8;
  }
LABEL_9:

}

- (void)_invalidateSwipeActionsLayoutRefreshingActiveConfigurations:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if (-[_UICollectionViewLayoutSwipeActionsModule hasActiveSwipe](self, "hasActiveSwipe"))
    {
      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke;
      v5[3] = &unk_1E16B1B78;
      v5[4] = self;
      v6 = a3;
      dispatch_async(MEMORY[0x1E0C80D38], v5);
    }
  }
}

- (BOOL)hasActiveSwipe
{
  void *v2;
  BOOL v3;

  -[UISwipeActionController swipedIndexPaths](self->_swipeActionController, "swipedIndexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_canIgnoreInvalidationContext:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "_intent");
  if (v5 > 0xF)
    goto LABEL_8;
  if (((1 << v5) & 0xE42) != 0)
  {
    v6 = 1;
    goto LABEL_13;
  }
  if (v5 != 5)
  {
    if (v5 == 15)
    {
      v6 = (*(_BYTE *)&self->_flags & 2) == 0;
      goto LABEL_13;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "invalidateEverything") & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "invalidatedItemIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "invalidatedSupplementaryIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "count") == 0;

  }
LABEL_13:

  return v6;
}

- (id)indexPathsWithActiveSwipes
{
  return -[UISwipeActionController swipedIndexPaths](self->_swipeActionController, "swipedIndexPaths");
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)finalizeCollectionViewUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int has_internal_diagnostics;
  char v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((*((_BYTE *)v5 + 208) & 2) != 0)
      goto LABEL_24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 686, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update != nil"));

  }
  -[UISwipeActionController swipeOccurrences](self->_swipeActionController, "swipeOccurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        objc_msgSend(v14, "indexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "finalIndexPathForInitialIndexPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          has_internal_diagnostics = os_variant_has_internal_diagnostics();
          v18 = objc_msgSend(v14, "_hasAmbiguousIndexPath");
          if (has_internal_diagnostics)
          {
            if ((v18 & 1) == 0)
            {
              __UIFaultDebugAssertLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v14;
                _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
              }

            }
          }
          else if ((v18 & 1) == 0)
          {
            v20 = finalizeCollectionViewUpdate____s_category;
            if (!finalizeCollectionViewUpdate____s_category)
            {
              v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v20, (unint64_t *)&finalizeCollectionViewUpdate____s_category);
            }
            v21 = *(NSObject **)(v20 + 8);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v14;
              _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
            }
          }
          objc_msgSend(v14, "resetAnimated:completion:", 0, 0);
        }

        ++v13;
      }
      while (v11 != v13);
      v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v11 = v22;
    }
    while (v22);
  }

LABEL_24:
}

- (void)updateWithDataSourceTranslator:(id)a3
{
  id v5;
  UISwipeActionController *swipeActionController;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceTranslator != nil"));

  }
  swipeActionController = self->_swipeActionController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76___UICollectionViewLayoutSwipeActionsModule_updateWithDataSourceTranslator___block_invoke;
  v9[3] = &unk_1E16BDC20;
  v10 = v5;
  v8 = v5;
  -[UISwipeActionController rebaseUnambiguousSwipeOccurrencesWithBlock:](swipeActionController, "rebaseUnambiguousSwipeOccurrencesWithBlock:", v9);

}

- (id)propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *i;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int has_internal_diagnostics;
  char v42;
  unint64_t v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  id WeakRetained;
  void *v55;
  void *v56;
  _UICollectionViewLayoutSwipeActionsModule *v57;
  id v58;
  id v59;
  BOOL v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UISwipeActionController currentSwipeOccurrence](self->_swipeActionController, "currentSwipeOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "currentAction"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "style"),
        v10,
        v11 == 1))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v12 = v6;
    v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (!v13)
    {
      v27 = v7;
LABEL_32:

      v26 = v13;
      goto LABEL_33;
    }
    v57 = self;
    v58 = v6;
    v59 = v7;
    v14 = 0;
    v60 = 0;
    v15 = *(_QWORD *)v74;
    v16 = v9;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "updateAction", v57) == 1)
        {
          if (v18 && v18[6] == 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = v18[1];
            objc_msgSend(v9, "indexPath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "section");

            v22 = v19 == v21;
            v9 = v16;
            if (v22)
              v14 = 1;
          }
          else
          {
            objc_msgSend(v18, "indexPathBeforeUpdate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "indexPath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqual:", v24);

            v9 = v16;
            if (v25)
            {
              v60 = objc_msgSend(v12, "count") == 1;
              v14 = 1;
            }
          }
        }
      }
      v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v13);

    if (!v60)
    {
      v13 = 0;
      v26 = 0;
      v6 = v58;
      v7 = v59;
      v27 = v59;
      if ((v14 & 1) == 0)
        goto LABEL_33;
      goto LABEL_27;
    }
    objc_msgSend(v9, "swipedView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _safeMaskView](v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v59;
    if (v29)
    {
      v27 = v59;
      v6 = v58;
      if (!v59)
      {
        v77 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UISwipeAnimationFactory animatorForCollapseWithAdditivelyAnimatedViews:](_UISwipeAnimationFactory, "animatorForCollapseWithAdditivelyAnimatedViews:", v30);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v29, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v29, "bounds");
      v38 = v37;
      v40 = v39;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke;
      v63[3] = &unk_1E16B5328;
      v13 = v29;
      v64 = v13;
      v65 = v32;
      v66 = v34;
      v67 = v36;
      v68 = 0;
      v69 = v38;
      v70 = v40;
      v71 = v36;
      v72 = 0;
      objc_msgSend(v27, "addAnimations:", v63);

      v26 = v13;
      if ((v14 & 1) != 0)
      {
LABEL_27:
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v42 = objc_msgSend(v9, "_hasAmbiguousIndexPath");
        if (has_internal_diagnostics)
        {
          if ((v42 & 1) == 0)
          {
            __UIFaultDebugAssertLog();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v79 = v16;
              _os_log_fault_impl(&dword_185066000, v50, OS_LOG_TYPE_FAULT, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
            }

            v6 = v58;
            v7 = v59;
            v9 = v16;
          }
        }
        else if ((v42 & 1) == 0)
        {
          v51 = qword_1ECD7F078;
          if (!qword_1ECD7F078)
          {
            v51 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v51, (unint64_t *)&qword_1ECD7F078);
          }
          v52 = *(NSObject **)(v51 + 8);
          v6 = v58;
          v7 = v59;
          v9 = v16;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v16;
            _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
          }
        }
        if (!v27)
        {
          +[_UISwipeAnimationFactory animatorForGenericUpdates](_UISwipeAnimationFactory, "animatorForGenericUpdates");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke_40;
        v61[3] = &unk_1E16B42D0;
        v62 = v9;
        objc_msgSend(v27, "addCompletion:", v61);
        v12 = v62;
        goto LABEL_32;
      }
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)&v57->_host);
          objc_msgSend(WeakRetained, "collectionView");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "swipedView");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v79 = v55;
          v80 = 2112;
          v81 = v16;
          v82 = 2112;
          v83 = v56;
          _os_log_fault_impl(&dword_185066000, v53, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: missing maskView for swipe occurrence. Collection view: %@; Swipe o"
            "ccurrence: %@; Swiped view: %@",
            buf,
            0x20u);

        }
      }
      else
      {
        v44 = qword_1ECD7F070;
        if (!qword_1ECD7F070)
        {
          v44 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v44, (unint64_t *)&qword_1ECD7F070);
        }
        v45 = *(NSObject **)(v44 + 8);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = v45;
          v47 = objc_loadWeakRetained((id *)&v57->_host);
          objc_msgSend(v47, "collectionView");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "swipedView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v79 = v48;
          v80 = 2112;
          v81 = v16;
          v82 = 2112;
          v83 = v49;
          _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: missing maskView for swipe occurrence. Collection view: %@; Swipe o"
            "ccurrence: %@; Swiped view: %@",
            buf,
            0x20u);

        }
      }
      v13 = 0;
      v26 = 0;
      v6 = v58;
      v7 = v59;
      v27 = v59;
      v9 = v16;
      if ((v14 & 1) != 0)
        goto LABEL_27;
    }
  }
  else
  {
    v26 = 0;
    v27 = v7;
  }
LABEL_33:

  return v27;
}

- (_UICollectionViewLayoutSwipeActionsModule)initWithHost:(id)a3
{
  id v4;
  _UICollectionViewLayoutSwipeActionsModule *v5;
  _UICollectionViewLayoutSwipeActionsModule *v6;
  void *v7;
  void *v8;
  void *v9;
  UISwipeActionController *v10;
  UISwipeActionController *swipeActionController;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICollectionViewLayoutSwipeActionsModule;
  v5 = -[_UICollectionViewLayoutSwipeActionsModule init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_host, v4);
    objc_msgSend(v4, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[UISwipeActionController initWithSwipeActionHost:style:]([UISwipeActionController alloc], "initWithSwipeActionHost:style:", v6, objc_msgSend(v9, "defaultCollectionViewCompositionalLayoutSwipeStyle"));
    swipeActionController = v6->_swipeActionController;
    v6->_swipeActionController = v10;

  }
  return v6;
}

- (void)teardown
{
  -[UISwipeActionController resetSwipedItemAnimated:completion:](self->_swipeActionController, "resetSwipedItemAnimated:completion:", 0, 0);
}

- (void)_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes
{
  char flags;
  id WeakRetained;
  void *v5;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | flags & 4;
}

- (BOOL)_canSwipeItemAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_reorderedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    LOBYTE(v9) = 0;
  else
    v9 = objc_msgSend(v6, "_isCellInvolvedInDragOrDropAnimationAtIndexPath:", v4) ^ 1;

  return v9;
}

- (void)swipeItemAtIndexPath:(id)a3 direction:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, _QWORD);
  id v11;

  v7 = a5;
  v11 = a3;
  v10 = (void (**)(id, _QWORD))a6;
  if (-[_UICollectionViewLayoutSwipeActionsModule _canSwipeItemAtIndexPath:](self, "_canSwipeItemAtIndexPath:", v11))
  {
    -[UISwipeActionController swipeItemAtIndexPath:configuration:direction:animated:completion:](self->_swipeActionController, "swipeItemAtIndexPath:configuration:direction:animated:completion:", v11, 0, a4, v7, v10);
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }

}

- (void)revealTrailingSwipeActionsForIndexPath:(id)a3
{
  UISwipeActionController *swipeActionController;
  id v5;

  swipeActionController = self->_swipeActionController;
  v5 = a3;
  -[_UICollectionViewLayoutSwipeActionsModule swipeItemAtIndexPath:direction:animated:completion:](self, "swipeItemAtIndexPath:direction:animated:completion:", v5, -[UISwipeActionController _swipeDirectionForLeadingEdge:](swipeActionController, "_swipeDirectionForLeadingEdge:", 0), 1, 0);

}

- (int64_t)swipeActionsStyleForSwipedItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](self->_swipeActionController, "_existingSwipeOccurrenceForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_styleFromConfiguration");
  else
    v5 = 0;

  return v5;
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (!objc_msgSend(WeakRetained, "_supportsSwipeActionsForIndexPath:", v5))
    goto LABEL_9;
  objc_msgSend(WeakRetained, "_leadingSwipeActionsConfigurationForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(WeakRetained, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v9, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_leadingSwipeActionsConfiguration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          goto LABEL_10;
        goto LABEL_3;
      }
    }

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
LABEL_3:
  -[_UICollectionViewLayoutSwipeActionsModule _updateSwipeActionsConfiguration:forIndexPath:](self, "_updateSwipeActionsConfiguration:forIndexPath:", v7, v5);
LABEL_10:

  return v7;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (!objc_msgSend(WeakRetained, "_supportsSwipeActionsForIndexPath:", v5))
    goto LABEL_9;
  objc_msgSend(WeakRetained, "_trailingSwipeActionsConfigurationForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(WeakRetained, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v9, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_trailingSwipeActionsConfiguration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          goto LABEL_10;
        goto LABEL_3;
      }
    }

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
LABEL_3:
  -[_UICollectionViewLayoutSwipeActionsModule _updateSwipeActionsConfiguration:forIndexPath:](self, "_updateSwipeActionsConfiguration:forIndexPath:", v7, v5);
LABEL_10:

  return v7;
}

- (void)_updateSwipeActionsConfiguration:(id)a3 forIndexPath:(id)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "_updateStyleForSwipeActionsConfiguration:indexPath:", v11, v7);

  if (objc_msgSend(v11, "_swipeActionsStyle") != 1)
  {
    -[_UICollectionViewLayoutSwipeActionsModule _cellWithCustomGroupingAtIndexPath:](self, "_cellWithCustomGroupingAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v11, "_setSwipeActionsStyle:", 1);
  }

}

- (id)_cellWithCustomGroupingAtIndexPath:(id)a3
{
  UICollectionViewLayout **p_host;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id *v8;
  uint64_t v9;
  id v10;

  p_host = &self->_host;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_host);
  objc_msgSend(WeakRetained, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "_layoutAttributes");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayoutAttributes _existingListAttributes](v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9 && (*(_BYTE *)(v9 + 8) & 2) != 0 && *(_QWORD *)(v9 + 24) != 15)
    {
      v10 = v7;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v7;
      if ((unint64_t)objc_msgSend(v10, "_backgroundViewConfigurationGrouping") > 1)
      {
LABEL_11:

        goto LABEL_12;
      }

    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id WeakRetained;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

  return v5;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a4.y;
  x = a4.x;
  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[UISwipeActionController swipeOccurrences](self->_swipeActionController, "swipeOccurrences", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v17, "_hasAmbiguousIndexPath") & 1) == 0)
          {
            objc_msgSend(v17, "indexPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "_visibleDecorationViewOfKind:atIndexPath:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions"), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if ((objc_msgSend(v19, "isHidden") & 1) == 0)
              {
                objc_msgSend(v19, "convertPoint:fromView:", v8, x, y);
                if ((objc_msgSend(v19, "pointInside:withEvent:", 0) & 1) != 0)
                {
                  objc_msgSend(v17, "indexPath");
                  v11 = (id)objc_claimAutoreleasedReturnValue();

                  goto LABEL_17;
                }
              }
            }

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  UICollectionViewLayout **p_host;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  p_host = &self->_host;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_host);
  objc_msgSend(WeakRetained, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double MaxX;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  unint64_t v39;
  NSObject *v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double MinX;
  uint8_t buf[4];
  id v59;
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  UIEdgeInsets result;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v52 = v10;
  v53 = v8;
  v54 = v12;
  v51 = v14;
  objc_msgSend(v7, "safeAreaInsets");
  v50 = v16;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "accessoryViewAtEdge:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "frame");
    MaxX = CGRectGetMaxX(v61);
    v62.origin.x = v9;
    v62.origin.y = v11;
    v62.size.width = v13;
    v62.size.height = v15;
    v26 = MaxX - CGRectGetMinX(v62);
    if (v18 < v26)
      v18 = v26;
  }
  objc_msgSend(v7, "accessoryViewAtEdge:", 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v63.origin.x = v9;
    v63.origin.y = v11;
    v63.size.width = v13;
    v63.size.height = v15;
    v28 = CGRectGetMaxX(v63);
    objc_msgSend(v27, "frame");
    v29 = v28 - CGRectGetMinX(v64);
    if (v22 < v29)
      v22 = v29;
  }
  objc_msgSend(WeakRetained, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions"), v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v56 = v22;
  if (v30)
  {
    v35 = v31;
    v36 = v32;
    v37 = v33;
    v38 = v34;
  }
  else
  {
    v38 = v15;
    if (os_variant_has_internal_diagnostics())
    {
      v36 = v11;
      v35 = v9;
      __UIFaultDebugAssertLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v5;
        _os_log_fault_impl(&dword_185066000, v49, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
      }

    }
    else
    {
      v39 = swipeActionController_extraInsetsForItemAtIndexPath____s_category;
      if (!swipeActionController_extraInsetsForItemAtIndexPath____s_category)
      {
        v39 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v39, (unint64_t *)&swipeActionController_extraInsetsForItemAtIndexPath____s_category);
      }
      v36 = v11;
      v40 = *(NSObject **)(v39 + 8);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v5;
        _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
      }
      v35 = v9;
    }
    v37 = v13;
  }
  v41 = v53 + v18;
  v42 = v54 - (v18 + v56);
  v65.origin.x = v41;
  v65.origin.y = v52 + v50;
  v65.size.width = v42;
  v65.size.height = v51 - (v50 + v20);
  MinX = CGRectGetMinX(v65);
  v66.origin.x = v35;
  v66.origin.y = v36;
  v66.size.width = v37;
  v66.size.height = v38;
  v55 = CGRectGetMinX(v66);
  v67.origin.x = v35;
  v67.origin.y = v36;
  v67.size.width = v37;
  v67.size.height = v38;
  v43 = CGRectGetMaxX(v67);
  v68.origin.x = v41;
  v68.origin.y = v52 + v50;
  v68.size.width = v42;
  v68.size.height = v51 - (v50 + v20);
  v44 = CGRectGetMaxX(v68);

  v45 = 0.0;
  v46 = fmax(MinX - v55, 0.0);
  v47 = fmax(v43 - v44, 0.0);
  v48 = 0.0;
  result.right = v47;
  result.bottom = v45;
  result.left = v46;
  result.top = v48;
  return result;
}

- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  BOOL v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  v7 = (objc_msgSend(WeakRetained, "isEditing") & 1) == 0
    && -[_UICollectionViewLayoutSwipeActionsModule _canSwipeItemAtIndexPath:](self, "_canSwipeItemAtIndexPath:", v5);

  return v7;
}

- (BOOL)swipeActionController:(id)a3 insertActionsView:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  UICollectionViewLayout **p_host;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  p_host = &self->_host;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)p_host);
  _UIInvalidateSwipeActionsLayoutForDecorationViewAtIndexPath(v12, v8);

  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(v11);
  objc_msgSend(v11, "_visibleDecorationViewOfKind:atIndexPath:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setClipsToBounds:", 1);
    objc_msgSend(v14, "addSubview:", v7);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Swipe actions view was not created for index path: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  else
  {
    v15 = swipeActionController_insertActionsView_forItemAtIndexPath____s_category;
    if (!swipeActionController_insertActionsView_forItemAtIndexPath____s_category)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&swipeActionController_insertActionsView_forItemAtIndexPath____s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Swipe actions view was not created for index path: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  return v14 != 0;
}

- (void)swipeActionController:(id)a3 cleanupActionsView:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "removeFromSuperview", a3);
}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  id WeakRetained;

  if (objc_msgSend(a3, "_isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:", a4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(WeakRetained, "_willBeginSwiping");

  }
}

- (void)swipeActionController:(id)a3 didBeginSwipeForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _UICollectionViewLayoutSwipeMaskView *v8;
  _UICollectionViewLayoutSwipeMaskView *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "_existingSwipeOccurrenceForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unable to get swipe occurrence for swipe at index path: %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else if (!v6)
  {
    v12 = swipeActionController_didBeginSwipeForItemAtIndexPath____s_category;
    if (!swipeActionController_didBeginSwipeForItemAtIndexPath____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&swipeActionController_didBeginSwipeForItemAtIndexPath____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Unable to get swipe occurrence for swipe at index path: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend(v6, "swipedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [_UICollectionViewLayoutSwipeMaskView alloc];
  objc_msgSend(v7, "bounds");
  v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
  +[UIColor blackColor](UIColor, "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[UIView _setSafeMaskView:](v7, v9);
  _UIUpdateMaskViewClippingFromView(v9, v7);

}

- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id WeakRetained;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_existingSwipeOccurrenceForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8)
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v20 = 138412290;
        v21 = v7;
        _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unable to get swipe occurrence for ended swipe at index path: %@", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  else if (!v8)
  {
    v17 = _MergedGlobals_1140;
    if (!_MergedGlobals_1140)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&_MergedGlobals_1140);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = v7;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Unable to get swipe occurrence for ended swipe at index path: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  objc_msgSend(v8, "setSwipedViewMaskWasRemoved:", 1);
  v9 = objc_msgSend(v8, "_hasAmbiguousIndexPath");
  objc_msgSend(v8, "swipedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = v10;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          v20 = 138412290;
          v21 = WeakRetained;
          _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Swiped view was of unexpected class or nil: %@", (uint8_t *)&v20, 0xCu);
        }

      }
      else
      {
        v12 = qword_1ECD7F068;
        if (!qword_1ECD7F068)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&qword_1ECD7F068);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v20 = 138412290;
          v21 = WeakRetained;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Swiped view was of unexpected class or nil: %@", (uint8_t *)&v20, 0xCu);
        }
      }
      -[UIView _setSafeMaskView:](WeakRetained, 0);
    }
  }
  else
  {
    -[UIView _setSafeMaskView:](v10, 0);

    if ((objc_msgSend(v8, "_didReloadData") & 1) != 0)
      goto LABEL_14;
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(v8, "indexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(WeakRetained, v14);

  }
LABEL_14:
  if (objc_msgSend(v6, "_isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:", v7))
  {
    v15 = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(v15, "_didEndSwiping");

  }
}

- (void)swipeActionController:(id)a3 swipeOccurrence:(id)a4 didChangeStateFrom:(int64_t)a5 to:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  UICollectionViewLayout **p_host;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CGFloat Width;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id WeakRetained;
  void *v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  CGFloat v58;
  uint64_t v59;
  _QWORD v60[4];
  CGRect v61;

  v60[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  switch(a6)
  {
    case 5:
      goto LABEL_12;
    case 4:
      objc_msgSend(v11, "currentAction");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "style");

      if (v43 == 1)
        break;
LABEL_12:
      -[_UICollectionViewLayoutSwipeActionsModule _performForcedCollectionViewLayoutPreservingExistingLayoutAttributes](self, "_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes");
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_3;
      v47[3] = &unk_1E16B2218;
      v47[4] = self;
      v48 = v12;
      objc_msgSend(v48, "resetAnimated:completion:", 1, v47);

      break;
    case 3:
      objc_msgSend(v11, "currentAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "style");

      if (v14 == 1)
      {
        objc_msgSend(v12, "swipedView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _safeMaskView](v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "presentationLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "animationKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            objc_msgSend(v18, "position");
            objc_msgSend(v17, "setPosition:");
            objc_msgSend(v17, "removeAllAnimations");
          }
        }

        if (!v15 || !v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_host);
          objc_msgSend(WeakRetained, "collectionView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 506, CFSTR("UICollectionView internal inconsistency: did not receive a swiped view or mask as expected for swipe occurrence %@.\nCollection View: %@, swiped view: %@, mask: %@"), v12, v46, v15, v16);

        }
        v60[0] = v16;
        v60[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UISwipeAnimationFactory animatorForTentativeWithOccurrence:additivelyAnimatedViews:](_UISwipeAnimationFactory, "animatorForTentativeWithOccurrence:additivelyAnimatedViews:", v12, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        p_host = &self->_host;
        v24 = objc_loadWeakRetained((id *)&self->_host);
        objc_msgSend(v24, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UICollectionViewLayoutSwipeActionsModule _performForcedCollectionViewLayoutPreservingExistingLayoutAttributes](self, "_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes");
        objc_msgSend(v12, "lockActionViewForAnimation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bounds");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        objc_msgSend(v26, "superview");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bounds");
        Width = CGRectGetWidth(v61);

        v35 = objc_loadWeakRetained((id *)p_host);
        objc_msgSend(v12, "indexPath");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(v35, v36);

        v37 = MEMORY[0x1E0C809B0];
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke;
        v52[3] = &unk_1E16BDF18;
        v38 = v26;
        v56 = v28;
        v57 = v30;
        v58 = Width;
        v59 = v32;
        v53 = v38;
        v54 = v25;
        v39 = v12;
        v55 = v39;
        v40 = v25;
        objc_msgSend(v22, "addAnimations:", v52);
        v49[0] = v37;
        v49[1] = 3221225472;
        v49[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_2;
        v49[3] = &unk_1E16BE3C0;
        v50 = v39;
        v51 = v38;
        v41 = v38;
        objc_msgSend(v22, "addCompletion:", v49);
        objc_msgSend(v22, "startAnimation");

      }
      break;
  }

}

- (void)editingStateDidChange
{
  -[UISwipeActionController resetSwipedItemAnimated:completion:](self->_swipeActionController, "resetSwipedItemAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
}

- (void)_transformLayoutAttributes:(id)a3 ofSeparatorAtBottom:(BOOL)a4 forSwipeOccurrence:(id)a5 isDisappearing:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v11;
  int v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v6 = a6;
  v8 = a4;
  v24 = a3;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewLayoutSwipeActionsModule.m"), 839, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("swipeOccurrence != nil"));

  }
  v12 = objc_msgSend(v11, "_hasAmbiguousIndexPath");
  v13 = objc_msgSend(v11, "_style");
  if (v12 && v6)
  {
    if (v8)
    {
      if (v13 != 2)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_host);
        objc_msgSend(v24, "indexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "finalLayoutAttributesForDisappearingItemAtIndexPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "frame");
        v18 = v17;
        objc_msgSend(v16, "frame");
        objc_msgSend(v24, "setFrame:", v18);
        objc_msgSend(v24, "setAlpha:", 1.0);

        goto LABEL_17;
      }
      v21 = 0.0;
LABEL_16:
      objc_msgSend(v24, "setAlpha:", v21);
    }
  }
  else if (((v12 | v6) & 1) == 0 && v13 == 2)
  {
    objc_msgSend(v11, "offset");
    v20 = v19;
    objc_msgSend(v24, "alpha");
    v22 = -v20;
    if (v20 >= 0.0)
      v22 = v20;
    if (v22 > 0.0)
      v21 = 0.0;
    goto LABEL_16;
  }
LABEL_17:

}

- (id)swipeViewManipulatorForSwipeActionController:(id)a3
{
  _UICollectionViewLayoutSwipeViewManipulator *v4;
  id WeakRetained;
  void *v6;
  _UICollectionViewLayoutSwipeViewManipulator *v7;

  v4 = [_UICollectionViewLayoutSwipeViewManipulator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UICollectionViewLayoutSwipeViewManipulator initWithCollectionView:swipeActionsModule:](v4, "initWithCollectionView:swipeActionsModule:", v6, self);

  return v7;
}

- (UISwipeOccurrence)currentSwipeOccurrence
{
  return -[UISwipeActionController currentSwipeOccurrence](self->_swipeActionController, "currentSwipeOccurrence");
}

- (UICollectionViewLayout)host
{
  return (UICollectionViewLayout *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (UISwipeActionController)swipeActionController
{
  return self->_swipeActionController;
}

- (void)setSwipeActionController:(id)a3
{
  objc_storeStrong((id *)&self->_swipeActionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeActionController, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end
