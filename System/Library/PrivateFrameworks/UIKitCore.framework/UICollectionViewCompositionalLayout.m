@implementation UICollectionViewCompositionalLayout

void *__51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained != 0 && v2 != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transformCellLayoutAttributes:", a2);

}

- (void)_transformDecorationLayoutAttributes:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "indexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") >= 2)
  {
    -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(v7, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_enrichLayoutAttributes:interactionState:", a3, self->_interactionStateModule);

  }
  -[_UICollectionViewLayoutSwipeActionsModule transformDecorationLayoutAttributes:isDisappearing:](self->super._swipeActionsModule, "transformDecorationLayoutAttributes:isDisappearing:", a3, 0);

}

- (void)_transformCellLayoutAttributes:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(v5, "section"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "_callback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_enrichLayoutAttributes:interactionState:", a3, self->_interactionStateModule);

  }
  -[_UICollectionViewLayoutSwipeActionsModule transformCellLayoutAttributes:isDisappearing:](self->super._swipeActionsModule, "transformCellLayoutAttributes:isDisappearing:", a3, 0);

}

- (BOOL)_estimatesSizes
{
  _BYTE *v2;
  BOOL v3;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[12] != 0;
  else
    v3 = 0;

  return v3;
}

- (id)_layoutSectionForSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UICollectionCompositionalLayoutSolver orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:]((uint64_t)v9, (uint64_t)a3, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_UICollectionCompositionalLayoutSolver)solver
{
  return self->_solver;
}

- (double)_alignedContentMarginGivenMargin:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:]((uint64_t)v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "_alignedContentMarginGivenMargin:", a3);
    a3 = v6;
  }

  return a3;
}

- (BOOL)_overridesSafeAreaPropagationToDescendants
{
  return (*(_BYTE *)&self->_compositionalLayoutFlags >> 1) & 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:]((uint64_t)self->_solver, (CGFloat *)a3);
}

- (void)_performDeferredResolveIfNecessary
{
  unint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  const __CFString *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int isa_low;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  id v55;
  uint64_t v56;
  CGRect v57;

  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 296);
    if (v2)
    {
      if ((*(_BYTE *)(a1 + 288) & 8) != 0)
      {
        v15 = _MergedGlobals_174;
        if (!_MergedGlobals_174)
        {
          v15 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&_MergedGlobals_174);
        }
        if ((*(_BYTE *)v15 & 1) != 0)
        {
          v16 = *(id *)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)a1, "collectionView");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v2 > 7)
              v19 = CFSTR("unknown");
            else
              v19 = off_1E16B85B0[v2 - 1];
            *(_DWORD *)buf = 134218242;
            v51 = v17;
            v52 = 2112;
            v53 = v19;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "_performDeferredResolveIfNecessary: cv==%p; skipping deferred resolve (%@) until update or reload data",
              buf,
              0x16u);

          }
          goto LABEL_50;
        }
      }
      else
      {
        objc_msgSend((id)a1, "collectionView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_visibleBounds");
        v5 = v4;
        v7 = v6;
        v9 = v8;
        v11 = v10;

        if ((objc_msgSend((id)a1, "_viewBoundsPermitsLayout:", v5, v7, v9, v11) & 1) != 0)
        {
          kdebug_trace();
          *(_QWORD *)(a1 + 296) = 0;
          v12 = qword_1ECD77640;
          if (!qword_1ECD77640)
          {
            v12 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v12, (unint64_t *)&qword_1ECD77640);
          }
          if ((*(_BYTE *)v12 & 1) != 0)
          {
            v39 = *(id *)(v12 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)a1, "collectionView");
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = (void *)v40;
              if (v2 > 7)
                v42 = CFSTR("unknown");
              else
                v42 = off_1E16B85B0[v2 - 1];
              *(_DWORD *)buf = 134218242;
              v51 = v40;
              v52 = 2112;
              v53 = v42;
              _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "_performDeferredResolve: cv == %p; Performing deferred resolve %@",
                buf,
                0x16u);

            }
          }
          v13 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
          objc_msgSend(v13, "_setIntent:", 15);
          switch(v2)
          {
            case 1uLL:
              goto LABEL_45;
            case 2uLL:
              objc_msgSend((id)a1, "_marginsChangeResolve");
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_42;
            case 3uLL:
              objc_msgSend((id)a1, "solver");
              v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                v25 = v24[36];

                if (v25 < 1)
                  goto LABEL_45;
                objc_msgSend((id)a1, "collectionView");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "bounds");
                objc_msgSend((id)a1, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = 0u;
                v46 = 0u;
                v43 = 0u;
                v44 = 0u;
                v23 = v27;
                v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
                if (!v28)
                  goto LABEL_38;
                v29 = v28;
                v30 = *(_QWORD *)v44;
LABEL_28:
                v31 = 0;
                while (1)
                {
                  if (*(_QWORD *)v44 != v30)
                    objc_enumerationMutation(v23);
                  v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v31);
                  if (!objc_msgSend(v32, "representedElementCategory"))
                    break;
                  if (objc_msgSend(v32, "representedElementCategory") == 1)
                  {
                    objc_msgSend(v32, "representedElementKind");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "indexPath");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v34;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v33, v35);

LABEL_35:
                  }
                  if (v29 == ++v31)
                  {
                    v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
                    if (!v29)
                    {
LABEL_38:

                      goto LABEL_39;
                    }
                    goto LABEL_28;
                  }
                }
                objc_msgSend(v32, "indexPath");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v33;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "invalidateItemsAtIndexPaths:", v34);
                goto LABEL_35;
              }
              v23 = 0;
LABEL_39:

LABEL_45:
              objc_msgSend((id)a1, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", v13);
              v37 = 0;
              v16 = 0;
LABEL_48:
              objc_msgSend(*(id *)(a1 + 136), "processLayoutInvalidationWithContext:updateConfigurations:", v13, v37);
              objc_msgSend((id)a1, "collectionView");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "_invalidateLayoutWithContext:", v13);

              kdebug_trace();
              break;
            case 4uLL:
              objc_msgSend((id)a1, "_scrollViewAdjustmentsChangeResolve");
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_42;
            case 5uLL:
              objc_msgSend((id)a1, "_sectionDefinitionsUpdateResolve");
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_42;
            case 6uLL:
              objc_msgSend((id)a1, "_boundsChangeResolve");
              v14 = objc_claimAutoreleasedReturnValue();
LABEL_42:
              v16 = v14;
              if (!v14)
                goto LABEL_45;
              objc_msgSend(v13, "setContentOffsetAdjustment:", *(double *)(v14 + 48), *(double *)(v14 + 56));
              objc_msgSend(v13, "_setShouldInvalidateCollectionViewContentSize:", 1);
              isa_low = LOBYTE(v16[5].isa);
              objc_msgSend((id)a1, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", v13);
              if (isa_low)
              {
LABEL_47:
                objc_msgSend((id)a1, "_updateCollectionViewBackgroundColor");
                v37 = 1;
              }
              else
              {
                v37 = 0;
              }
              goto LABEL_48;
            case 7uLL:
              objc_msgSend((id)a1, "_fullResolve");
              objc_msgSend((id)a1, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", v13);
              v16 = 0;
              goto LABEL_47;
            default:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v23 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__performDeferredResolveIfNecessary, a1, CFSTR("UICollectionViewCompositionalLayout.m"), 815, CFSTR("Attempting to process an invalid or unknown resolve type. Type: %ld"), v2);
              goto LABEL_39;
          }
          goto LABEL_49;
        }
        v20 = qword_1ECD77638;
        if (!qword_1ECD77638)
        {
          v20 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&qword_1ECD77638);
        }
        if ((*(_BYTE *)v20 & 1) != 0)
        {
          v16 = *(id *)(v20 + 8);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
LABEL_50:

            return;
          }
          objc_msgSend((id)a1, "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2 > 7)
            v22 = CFSTR("unknown");
          else
            v22 = off_1E16B85B0[v2 - 1];
          v57.origin.x = v5;
          v57.origin.y = v7;
          v57.size.width = v9;
          v57.size.height = v11;
          NSStringFromCGRect(v57);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v51 = (uint64_t)v21;
          v52 = 2112;
          v53 = v22;
          v54 = 2112;
          v55 = v13;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "_performDeferredResolveIfNecessary: cv==%p; skipping deferred resolve (%@) because the view bounds (%@) do n"
            "ot allow for solving",
            buf,
            0x20u);

LABEL_49:
          goto LABEL_50;
        }
      }
    }
  }
}

- (void)_queueDeferredResolveForInvalidationWithContext:(id)a3
{
  uint64_t v6;
  unint64_t deferredResolveType;
  char compositionalLayoutFlags;
  _BOOL8 v9;
  unint64_t v10;
  char v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "_intent");
  deferredResolveType = self->_deferredResolveType;
  compositionalLayoutFlags = (char)self->_compositionalLayoutFlags;
  if ((compositionalLayoutFlags & 8) != 0)
  {
    if (v6 != 3 && v6 != 8 && (*(_BYTE *)&self->_compositionalLayoutFlags & 4) == 0)
      goto LABEL_8;
    *(_BYTE *)&self->_compositionalLayoutFlags = compositionalLayoutFlags & 0xF7;
    if (deferredResolveType != 7)
      self->_deferredResolveType = 0;
  }
  if ((compositionalLayoutFlags & 4) != 0)
  {
LABEL_15:
    v9 = 0;
    v11 = 0;
    v10 = 7;
    goto LABEL_27;
  }
LABEL_8:
  v9 = 0;
  v10 = 0;
  v11 = 1;
  switch(v6)
  {
    case 0:
      objc_msgSend(a3, "_setRequiresFullCacheInvalidation");
      goto LABEL_15;
    case 1:
      v9 = 0;
      v11 = 0;
      v10 = 3;
      break;
    case 2:
      v9 = 0;
      v11 = 0;
      v10 = 6;
      break;
    case 3:
      goto LABEL_15;
    case 4:
    case 5:
      v9 = 0;
      v11 = 0;
      v10 = 1;
      break;
    case 6:
    case 12:
      break;
    case 7:
      v9 = 0;
      v11 = 0;
      v10 = 2;
      break;
    case 8:
      if (deferredResolveType == 7)
        goto LABEL_25;
      -[UICollectionViewCompositionalLayout _updateResolve](self, "_updateResolve");
      v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v9 = v12[40] != 0;
      else
        v9 = 0;

      goto LABEL_26;
    case 9:
      -[UICollectionViewCompositionalLayout _handleSwipeActionsInvalidationWithContext:](self, "_handleSwipeActionsInvalidationWithContext:", a3);
      goto LABEL_25;
    case 10:
      -[UICollectionViewCompositionalLayout _handlePreferredSizingDataInvalidation:](self, "_handlePreferredSizingDataInvalidation:", a3);
      goto LABEL_25;
    case 11:
      -[UICollectionViewCompositionalLayout _handleEndInteractiveReorderingWithContext:](self, "_handleEndInteractiveReorderingWithContext:", a3);
      goto LABEL_25;
    case 13:
      v9 = 0;
      v11 = 0;
      v10 = 4;
      break;
    case 14:
      v9 = 0;
      v11 = 0;
      v10 = 5;
      break;
    case 15:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 707, CFSTR("Compositional Layout internal bug: Attempting to queue a invalidation for an already deferred invalidation context. Collection View: %@, Layout: %@"), v14, self);

LABEL_25:
      v9 = 0;
LABEL_26:
      v10 = 0;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 713, CFSTR("Compositional Layout internal bug: Attempting to process invalidation context with unknown intent. Intent: %lld; Context: %@; Layout: %@"),
        objc_msgSend(a3, "_intent"),
        a3,
        self);

      v9 = 0;
      v10 = 0;
      v11 = 1;
      break;
  }
LABEL_27:
  v15 = _queueDeferredResolveForInvalidationWithContext____s_category;
  if (!_queueDeferredResolveForInvalidationWithContext____s_category)
  {
    v15 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v15, (unint64_t *)&_queueDeferredResolveForInvalidationWithContext____s_category);
  }
  if ((*(_BYTE *)v15 & 1) != 0)
  {
    v19 = *(id *)(v15 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = off_1E16B85E8[v10];
      _UICollectionViewLayoutInvalidationContextIntentDescription(objc_msgSend(a3, "_intent"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = self->_deferredResolveType;
      if (v23 > 7)
        v24 = CFSTR("unknown");
      else
        v24 = off_1E16B85E8[v23];
      *(_DWORD *)buf = 134218754;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v24;
      v25 = (void *)v22;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "_queueDeferredResolve: cv == %p; Computed required resolve: %@ for invalidation: %@. Current deferred resolve type: %@",
        buf,
        0x2Au);

    }
  }
  v16 = self->_deferredResolveType;
  if (v10 > v16)
  {
    self->_deferredResolveType = v10;
    v16 = v10;
  }
  if (a3)
    v17 = v11;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    *((_BYTE *)a3 + 112) |= 8u;
    v16 = self->_deferredResolveType;
  }
  if (!v16)
  {
    -[UICollectionViewCompositionalLayout _solveForPinnedSupplementaryItemsIfNeededWithContext:](self, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", a3);
    if (v9)
      -[UICollectionViewCompositionalLayout _updateCollectionViewBackgroundColor](self, "_updateCollectionViewBackgroundColor");
  }
  -[_UICollectionViewLayoutSwipeActionsModule processLayoutInvalidationWithContext:updateConfigurations:](self->super._swipeActionsModule, "processLayoutInvalidationWithContext:updateConfigurations:", a3, v9);
}

- (void)_solveForPinnedSupplementaryItemsIfNeededWithContext:(id)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems]((_BOOL8)v5);

  if (v6)
  {
    -[UICollectionViewCompositionalLayout _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds](self, "_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 && (objc_msgSend(a3, "invalidateEverything") & 1) == 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v7, "invalidatedAuxillaryKinds", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(v7, "indexPathsForInvalidatedSupplementariesOfKind:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a3, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
  }
}

- (void)_collectionViewWillPerformPendingLayoutBeforeUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _collectionViewWillPerformPendingLayoutBeforeUpdate](&v3, sel__collectionViewWillPerformPendingLayoutBeforeUpdate);
  if ((*(_BYTE *)&self->_compositionalLayoutFlags & 1) == 0)
    *(_BYTE *)&self->_compositionalLayoutFlags |= 8u;
}

- (void)_updateCollectionViewBackgroundColor
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasCustomBackground");

  if ((v4 & 1) == 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__27;
    v11 = __Block_byref_object_dispose__27;
    v12 = 0;
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__UICollectionViewCompositionalLayout__updateCollectionViewBackgroundColor__block_invoke;
    v6[3] = &unk_1E16B8540;
    v6[4] = &v7;
    -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)v5, (uint64_t)v6);

    -[UICollectionViewLayout _setPreferredBackgroundColor:](self, "_setPreferredBackgroundColor:", v8[5]);
    _Block_object_dispose(&v7, 8);

  }
}

- (void)_handlePreferredSizingDataInvalidation:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a3, "invalidatedItemIndexPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[UICollectionViewCompositionalLayout solver](self, "solver");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        objc_msgSend(*(id *)(v7 + 208), "removeObjectsForKeys:", v6);

      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
              -[UICollectionViewLayout collectionView](self, "collectionView");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "_invalidatePreferredAttributes");
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v11);
        }

      }
    }
    objc_msgSend(a3, "invalidatedDecorationIndexPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__UICollectionViewCompositionalLayout__handlePreferredSizingDataInvalidation___block_invoke;
    v18[3] = &unk_1E16B8590;
    v18[4] = self;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
}

- (BOOL)_shouldAddElementToSectionContainer:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = -[_UICollectionCompositionalLayoutSolver shouldEmplaceElementOutsideSectionContainer:](v4, a3) ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)_hasOrthogonalScrollingSections
{
  _BYTE *v2;
  BOOL v3;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[13] != 0;
  else
    v3 = 0;

  return v3;
}

- (id)_orthogonalScrollingSections
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(void **)(v2 + 88);
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_prepareForPreferredAttributesQueryForView:(id)a3 withLayoutAttributes:(id)a4
{
  void *v7;
  void *v8;
  _UICollectionViewLayoutInteractionStateModule *interactionStateModule;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  UICollectionViewCompositionalLayout *v15;

  if (-[UICollectionViewCompositionalLayout _estimatesSizes](self, "_estimatesSizes"))
  {
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver prepareForPreferredAttributesQueryForView:withLayoutAttributes:]((uint64_t)v7, a3, a4);

    objc_msgSend(a4, "indexPath");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "item") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(v11, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      interactionStateModule = self->_interactionStateModule;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __103__UICollectionViewCompositionalLayout__prepareForPreferredAttributesQueryForView_withLayoutAttributes___block_invoke;
      v12[3] = &unk_1E16B47A8;
      v13 = v8;
      v14 = a4;
      v15 = self;
      v10 = v8;
      -[_UICollectionViewLayoutInteractionStateModule performPreferredAttributesProcessingBlock:withLayoutAttributes:forView:]((uint64_t)interactionStateModule, v12, a4, a3);

    }
  }
}

- (void)_postProcessPreferredAttributes:(id)a3 forView:(id)a4
{
  void *v7;
  void *v8;
  _UICollectionViewLayoutInteractionStateModule *interactionStateModule;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  UICollectionViewCompositionalLayout *v15;

  objc_msgSend(a3, "indexPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "item") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    interactionStateModule = self->_interactionStateModule;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__UICollectionViewCompositionalLayout__postProcessPreferredAttributes_forView___block_invoke;
    v12[3] = &unk_1E16B47A8;
    v13 = v8;
    v14 = a3;
    v15 = self;
    v10 = v8;
    -[_UICollectionViewLayoutInteractionStateModule performPreferredAttributesProcessingBlock:withLayoutAttributes:forView:]((uint64_t)interactionStateModule, v12, a3, a4);

  }
}

void __79__UICollectionViewCompositionalLayout__postProcessPreferredAttributes_forView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transformPreferredLayoutAttributes:interactionState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 280));

}

void __103__UICollectionViewCompositionalLayout__prepareForPreferredAttributesQueryForView_withLayoutAttributes___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transformFittingLayoutAttributes:interactionState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 280));

}

- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3
{
  void *v4;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver elementShouldAppearBelowOrthogonalScrollingContainer:]((uint64_t)v4, (uint64_t)a3);

  return (char)a3;
}

- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes
{
  return 1;
}

- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  void *v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:]((uint64_t)v6, a3, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  void *v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:]((uint64_t)v6, a3, (uint64_t)a4);

  return (char)a4;
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[UICollectionView _visibleBounds](self->super._collectionView, "_visibleBounds", a3, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v17[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout _preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:](self, "_preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:", v14, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  __int16 v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;

  if (a4)
  {
    if (a3)
      goto LABEL_3;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 1048, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredAttributes != nil"));

    if (a4)
      goto LABEL_4;
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 1047, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalAttributes != nil"));

  if (!a3)
    goto LABEL_18;
LABEL_3:
  if (a4)
  {
LABEL_4:
    v8 = *((_WORD *)a4 + 144);
    if ((v8 & 1) == 0 && (v8 & 3) != 0)
      return 0;
    objc_msgSend(a4, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UICollectionView _isReorderingItemAtIndexPath:](self->super._collectionView, "_isReorderingItemAtIndexPath:", v10))
    {
      goto LABEL_13;
    }
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = v11 ? *(void **)(v11 + 3240) : 0;
    v14 = v13;

    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_UICollectionCompositionalLayoutSolver updatePreferredSizeIfNeededForPreferredLayoutAttributes:withOriginalAttributes:debugger:]((uint64_t)v15, (uint64_t)a3, a4, (uint64_t)v14);

    if ((v16 & 1) == 0)
    {
LABEL_13:
      dyld_program_sdk_at_least();
    }
    else
    {
      -[_UIUpdateVisibleCellsContext addPreferredAttributes:]((uint64_t)self->_updateVisibleCellsContext, a3);
      if (dyld_program_sdk_at_least())
      {
        v9 = self->_updateVisibleCellsContext == 0;
LABEL_15:

        return v9;
      }
    }
    v9 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (double)_interactionStateModule:(id)a3 spacingAfterLayoutSection:(int64_t)a4
{
  double result;

  -[UICollectionViewCompositionalLayoutConfiguration interSectionSpacing](self->_configuration, "interSectionSpacing", a3, a4);
  return result;
}

- (id)_interactionStateModule:(id)a3 layoutSectionForIndex:(int64_t)a4
{
  return -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", a4);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  CGRect v36;
  UIEdgeInsets v37;

  v35 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_compositionalLayoutFlags & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout invalidateLayoutWithContext:](&v26, sel_invalidateLayoutWithContext_, a3);
  }
  else
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_visibleBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (-[UICollectionViewCompositionalLayout _viewBoundsPermitsLayout:](self, "_viewBoundsPermitsLayout:", v7, v9, v11, v13))
    {
      kdebug_trace();
      v14 = objc_msgSend(a3, "_intent");
      if (_UICollectionViewCompositionalLayoutShouldDeferResolvesUntilQueried())
      {
        if ((objc_msgSend(a3, "invalidateEverything") & 1) == 0)
        {
          if (v14 == 3)
            v15 = 1;
          else
            v15 = (*(_BYTE *)&self->_compositionalLayoutFlags >> 2) & 1;
          objc_msgSend(a3, "_setInvalidateEverything:", v15);
        }
        -[UICollectionViewCompositionalLayout _queueDeferredResolveForInvalidationWithContext:](self, "_queueDeferredResolveForInvalidationWithContext:", a3);
      }
      else
      {
        -[UICollectionViewCompositionalLayout _resolveImmediatelyForInvalidationWithContext:](self, "_resolveImmediatelyForInvalidationWithContext:", a3);
      }
      v24.receiver = self;
      v24.super_class = (Class)UICollectionViewCompositionalLayout;
      -[UICollectionViewLayout invalidateLayoutWithContext:](&v24, sel_invalidateLayoutWithContext_, a3);
      kdebug_trace();
    }
    else
    {
      v16 = invalidateLayoutWithContext____s_category;
      if (!invalidateLayoutWithContext____s_category)
      {
        v16 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&invalidateLayoutWithContext____s_category);
      }
      if ((*(_BYTE *)v16 & 1) != 0)
      {
        v17 = *(NSObject **)(v16 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = v17;
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _UICollectionViewLayoutInvalidationContextIntentDescription(objc_msgSend(a3, "_intent"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36.origin.x = v7;
          v36.origin.y = v9;
          v36.size.width = v11;
          v36.size.height = v13;
          NSStringFromCGRect(v36);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_effectiveContentInset");
          NSStringFromUIEdgeInsets(v37);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "invalidateLayoutWithContext: cv==%p; intent == %@; visibleBounds == %@; effectiveContentInsets == %@; We are"
            " IGNORING this invalidation since the area to layout in is 0.",
            buf,
            0x2Au);

        }
      }
      *(_BYTE *)&self->_compositionalLayoutFlags |= 4u;
      v25.receiver = self;
      v25.super_class = (Class)UICollectionViewCompositionalLayout;
      -[UICollectionViewLayout invalidateLayoutWithContext:](&v25, sel_invalidateLayoutWithContext_, a3);
    }
  }
}

- (unint64_t)_layoutAxis
{
  UICollectionViewScrollDirection v2;

  v2 = -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self->_configuration, "scrollDirection");
  if (v2)
    return v2 == UICollectionViewScrollDirectionHorizontal;
  else
    return 2;
}

- (id)_customContainerSectionIndexes
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[12];
  v4 = v2;

  return v4;
}

- (BOOL)_viewBoundsPermitsLayout:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return v7 * CGRectGetHeight(v9) > 0.0;
}

- (void)_resolveImmediatelyForInvalidationWithContext:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  UIEdgeInsets v26;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "invalidateEverything") & 1) == 0
    && (objc_msgSend(a3, "_intent") == 3
     || !objc_msgSend(a3, "_intent")
     || objc_msgSend(a3, "_intent") == 2
     || objc_msgSend(a3, "_intent") == 7
     || (*(_BYTE *)&self->_compositionalLayoutFlags & 4) != 0))
  {
    objc_msgSend(a3, "_setInvalidateEverything:", 1);
  }
  if ((*(_BYTE *)&self->_compositionalLayoutFlags & 4) != 0)
  {
    v6 = _resolveImmediatelyForInvalidationWithContext____s_category;
    if (!_resolveImmediatelyForInvalidationWithContext____s_category)
    {
      v6 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_resolveImmediatelyForInvalidationWithContext____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v13 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _UICollectionViewLayoutInvalidationContextIntentDescription(objc_msgSend(a3, "_intent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_effectiveContentInset");
        NSStringFromUIEdgeInsets(v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "_resolveImmediatelyIfNecessary: cv==%p; intent == %@; effectiveContentInsets == %@; Performing full resolve si"
          "nce forceFullResolveForNextSolve is set.",
          (uint8_t *)&v19,
          0x20u);

      }
    }
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "_intent") == 2)
  {
    -[UICollectionViewCompositionalLayout _boundsChangeResolve](self, "_boundsChangeResolve");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "_setInvalidateEverything:", 1);
    if (!v5)
      goto LABEL_33;
    goto LABEL_19;
  }
  if (objc_msgSend(a3, "_intent") == 7)
  {
    -[UICollectionViewCompositionalLayout _marginsChangeResolve](self, "_marginsChangeResolve");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "_intent") == 9)
  {
    -[UICollectionViewCompositionalLayout _handleSwipeActionsInvalidationWithContext:](self, "_handleSwipeActionsInvalidationWithContext:", a3);
    goto LABEL_33;
  }
  -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_msgSend(a3, "_intent");

    if (v12 == 8)
    {
      -[UICollectionViewCompositionalLayout _updateResolve](self, "_updateResolve");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  if (objc_msgSend(a3, "_intent") == 10)
  {
    -[UICollectionViewCompositionalLayout _handlePreferredSizingDataInvalidation:](self, "_handlePreferredSizingDataInvalidation:", a3);
    goto LABEL_33;
  }
  if (objc_msgSend(a3, "_intent") == 11)
  {
    -[UICollectionViewCompositionalLayout _handleEndInteractiveReorderingWithContext:](self, "_handleEndInteractiveReorderingWithContext:", a3);
    goto LABEL_33;
  }
  if (objc_msgSend(a3, "_intent") != 13)
  {
    if ((objc_msgSend(a3, "invalidateEverything") & 1) == 0)
      goto LABEL_33;
LABEL_15:
    -[UICollectionViewCompositionalLayout _fullResolve](self, "_fullResolve");
    -[UICollectionViewCompositionalLayout _solveForPinnedSupplementaryItemsIfNeededWithContext:](self, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", a3);
    goto LABEL_20;
  }
  -[UICollectionViewCompositionalLayout _scrollViewAdjustmentsChangeResolve](self, "_scrollViewAdjustmentsChangeResolve");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v5 = v7;
  if (!v7)
  {
LABEL_33:
    -[UICollectionViewCompositionalLayout _solveForPinnedSupplementaryItemsIfNeededWithContext:](self, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", a3);
    goto LABEL_34;
  }
LABEL_19:
  objc_msgSend(a3, "setContentOffsetAdjustment:", *(double *)(v5 + 48), *(double *)(v5 + 56));
  objc_msgSend(a3, "_setShouldInvalidateCollectionViewContentSize:", 1);
  v8 = *(unsigned __int8 *)(v5 + 40);

  -[UICollectionViewCompositionalLayout _solveForPinnedSupplementaryItemsIfNeededWithContext:](self, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", a3);
  if (!v8)
  {
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
LABEL_20:
  -[UICollectionViewCompositionalLayout _updateCollectionViewBackgroundColor](self, "_updateCollectionViewBackgroundColor");
  v9 = 1;
LABEL_35:
  -[_UICollectionViewLayoutSwipeActionsModule processLayoutInvalidationWithContext:updateConfigurations:](self->super._swipeActionsModule, "processLayoutInvalidationWithContext:updateConfigurations:", a3, v9);
}

- (id)_layoutAttributesForIndelibleElements
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewLayoutSwipeActionsModule indexPathsWithActiveSwipes](self->super._swipeActionsModule, "indexPathsWithActiveSwipes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[UICollectionViewCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_willPerformUpdateVisibleCellsPass
{
  _UIUpdateVisibleCellsContext *v3;
  _UIUpdateVisibleCellsContext *updateVisibleCellsContext;
  _UIUpdateVisibleCellsContext *v5;

  if (-[UICollectionViewCompositionalLayout _estimatesSizes](self, "_estimatesSizes")
    && !self->_updateVisibleCellsContext)
  {
    v3 = objc_alloc_init(_UIUpdateVisibleCellsContext);
    updateVisibleCellsContext = self->_updateVisibleCellsContext;
    self->_updateVisibleCellsContext = v3;

    v5 = self->_updateVisibleCellsContext;
    if (v5)
      ++v5->_visibleCellsRefCount;
  }
}

- (BOOL)_wantsUpdateVisibleCellsPassNotifications
{
  return 1;
}

- (UICollectionViewCompositionalLayoutConfiguration)configuration
{
  return (UICollectionViewCompositionalLayoutConfiguration *)(id)-[UICollectionViewCompositionalLayoutConfiguration copy](self->_configuration, "copy");
}

void __75__UICollectionViewCompositionalLayout__updateCollectionViewBackgroundColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a2, "_preferredContainerBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  v9 = v6;
  v15 = v9;
  if (v8)
  {
    v10 = v8;
    if (v15 == v10)
    {

    }
    else
    {
      if (v15)
      {
        v11 = objc_msgSend(v15, "isEqual:", v10);

        if ((v11 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      *a4 = 1;
    }
  }
  else
  {
    v12 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v9;

  }
LABEL_10:

}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout indexPathsToDeleteForSupplementaryViewOfKind:](&v15, sel_indexPathsToDeleteForSupplementaryViewOfKind_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForDeletedSupplememtariesForElementKind:](v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }

  }
  return v8;
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout indexPathsToDeleteForDecorationViewOfKind:](&v15, sel_indexPathsToDeleteForDecorationViewOfKind_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForDeletedDecorationsForElementKind:](v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }

  }
  return v8;
}

- (id)indexPathsToInsertForDecorationViewOfKind:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout indexPathsToInsertForDecorationViewOfKind:](&v15, sel_indexPathsToInsertForDecorationViewOfKind_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForInsertedDecorationsForElementKind:](v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }

  }
  return v8;
}

- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout indexPathsToInsertForSupplementaryViewOfKind:](&v15, sel_indexPathsToInsertForSupplementaryViewOfKind_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForInsertedSupplememtariesForElementKind:](v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }

  }
  return v8;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)currentResolveResult
{
  return self->_currentResolveResult;
}

- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3
{
  void *v4;
  int64_t v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UICollectionCompositionalLayoutSolver _anchorForAuxiliaryElementOfKind:]((uint64_t)v4, (uint64_t)a3);

  return v5;
}

- (BOOL)_wantsAnimationsForOffscreenAuxillaries
{
  return 1;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForDecorationViewOfKind:withIndexPath:]((uint64_t)self->_solver, a3, a4);
}

- (CGRect)_contentFrameForSection:(int64_t)a3
{
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UICollectionViewCompositionalLayout _sectionDescriptorForSectionIndex:](self, "_sectionDescriptorForSectionIndex:", a3);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  v4 = (double *)MEMORY[0x1E0C9D628];
  v5 = (double *)(MEMORY[0x1E0C9D628] + 24);
  v6 = (double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = (double *)(MEMORY[0x1E0C9D628] + 8);
  if (v3)
  {
    v4 = v3 + 18;
    v7 = v3 + 19;
    v6 = v3 + 20;
    v5 = v3 + 21;
  }
  v8 = *v5;
  v9 = *v6;
  v10 = *v7;
  v11 = *v4;

  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_layoutFrameForSection:(int64_t)a3
{
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UICollectionViewCompositionalLayout _sectionDescriptorForSectionIndex:](self, "_sectionDescriptorForSectionIndex:", a3);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  v4 = (double *)MEMORY[0x1E0C9D628];
  v5 = (double *)(MEMORY[0x1E0C9D628] + 24);
  v6 = (double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = (double *)(MEMORY[0x1E0C9D628] + 8);
  if (v3)
  {
    v4 = v3 + 14;
    v7 = v3 + 15;
    v6 = v3 + 16;
    v5 = v3 + 17;
  }
  v8 = *v5;
  v9 = *v6;
  v10 = *v7;
  v11 = *v4;

  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UICollectionViewCompositionalLayout _sectionDescriptorForSectionIndex:](self, "_sectionDescriptorForSectionIndex:", a3);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3[12];
    v4 = v3[13];
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }

  v6 = v5;
  v7 = v4;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)_sectionDescriptorForSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver sectionDescriptorForSectionIndex:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_preparedForBoundsChanges
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id *v9;
  BOOL v10;
  BOOL v11;
  id *v12;
  void *v13;
  char v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id *)v8;
  if (!v8
    || *(_QWORD *)(v8 + 104)
    && -[UICollectionViewCompositionalLayout _invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:](self, "_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:", 0, x, y, width, height)|| (*(_BYTE *)&self->_compositionalLayoutFlags & 4) != 0)
  {
    v11 = 1;
  }
  else
  {
    v15 = 0;
    v10 = -[_UICollectionCompositionalLayoutSolver shouldInvalidateForBoundsChange:requiresContainerUpdate:]((_BOOL8)v9, &v15, x, y, width, height);
    v11 = v10;
    if (v15 && !v10)
    {
      v12 = (id *)v9[6];
      -[_UICollectionLayoutContainer containerUpdatingContentSize:](v12, width, height);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong(v9 + 6, v13);
    }
  }

  return v11;
}

- (void)_fullResolve
{
  void *v3;
  uint64_t v4;
  UICollectionViewScrollDirection v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  _UICollectionCompositionalLayoutSolver *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unsigned __int8 *v53;
  int v54;
  void *v55;
  _BOOL4 v56;
  char v57;
  unint64_t v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD newValue[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD aBlock[4];
  id v80;
  id location[2];

  kdebug_trace();
  if (!-[UICollectionViewCompositionalLayout layoutRTL](self, "layoutRTL"))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

    if (v4 == 1)
      -[UICollectionViewCompositionalLayout setLayoutRTL:](self, "setLayoutRTL:", 1);
  }
  v5 = -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self->_configuration, "scrollDirection");
  v6 = 1;
  if (v5 == UICollectionViewScrollDirectionVertical)
    v6 = 2;
  v64 = (void *)v6;
  objc_initWeak(location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke;
  aBlock[3] = &unk_1E16B8450;
  objc_copyWeak(&v80, location);
  v8 = _Block_copy(aBlock);
  v77[0] = v7;
  v77[1] = 3221225472;
  v77[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_2;
  v77[3] = &unk_1E16B8478;
  objc_copyWeak(&v78, location);
  v9 = _Block_copy(v77);
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout _dataSourceSnapshotter](self, "_dataSourceSnapshotter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout setDataSourceSnapshotter:](self, "setDataSourceSnapshotter:", v10);
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver restorableState]((uint64_t)v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UICollectionCompositionalLayoutSolverOptions defaultOptions]();
  v12 = objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayoutConfiguration interSectionSpacing](self->_configuration, "interSectionSpacing");
  if (v12)
    *(_QWORD *)(v12 + 16) = v13;
  v14 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:](v12, v14);
  v15 = (void *)objc_msgSend((id)objc_opt_class(), "invalidationContextClass");
  -[UIContentUnavailableImageProperties _setTintColor:](v12, v15);
  v16 = -[UICollectionViewCompositionalLayout layoutRTL](self, "layoutRTL");
  if (v12)
    *(_BYTE *)(v12 + 8) = v16;
  v17 = -[UICollectionViewCompositionalLayout roundsToScreenScale](self, "roundsToScreenScale");
  if (v12)
  {
    *(_BYTE *)(v12 + 9) = v17;
    objc_setProperty_nonatomic_copy((id)v12, v18, v9, 40);
  }
  -[UICollectionViewCompositionalLayoutConfiguration boundarySupplementaryItems](self->_configuration, "boundarySupplementaryItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_setProperty_nonatomic_copy((id)v12, v19, v20, 48);

  newValue[0] = v7;
  newValue[1] = 3221225472;
  newValue[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_3;
  newValue[3] = &unk_1E16B84A0;
  objc_copyWeak(&v76, location);
  if (v12)
    objc_setProperty_nonatomic_copy((id)v12, v21, newValue, 56);
  v73[0] = v7;
  v73[1] = 3221225472;
  v73[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_4;
  v73[3] = &unk_1E16B84C8;
  objc_copyWeak(&v74, location);
  if (v12)
    objc_setProperty_nonatomic_copy((id)v12, v22, v73, 64);
  v71[0] = v7;
  v71[1] = 3221225472;
  v71[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_5;
  v71[3] = &unk_1E16B84F0;
  objc_copyWeak(&v72, location);
  if (v12)
    objc_setProperty_nonatomic_copy((id)v12, v23, v71, 72);
  -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [_UICollectionCompositionalLayoutSolver alloc];
  objc_msgSend(v63, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_UICollectionCompositionalLayoutSolver initWithContainer:traitCollection:layoutAxis:dataSourceSnapshot:options:sectionProvider:](v25, v24, v26, v64, v10, v12, v8);
  -[UICollectionViewCompositionalLayout setSolver:](self, "setSolver:", v27);

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "applyToSolver:", v28);

  -[UICollectionViewCompositionalLayout dynamicsConfigurationHandler](self, "dynamicsConfigurationHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver setDynamicsConfigurationHandler:]((uint64_t)v30, v29);

  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_6;
  v69[3] = &unk_1E16B8518;
  objc_copyWeak(&v70, location);
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31;
  if (v31)
    objc_setProperty_nonatomic_copy(v31, v32, v69, 24);

  v67[0] = v7;
  v67[1] = 3221225472;
  v67[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_7;
  v67[3] = &unk_1E16B8518;
  objc_copyWeak(&v68, location);
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  if (v34)
    objc_setProperty_nonatomic_copy(v34, v35, v67, 32);

  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_8;
  v65[3] = &unk_1E16B8518;
  objc_copyWeak(&v66, location);
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  if (v37)
    objc_setProperty_nonatomic_copy(v37, v38, v65, 40);

  -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "visibleBounds");
  v41 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v42 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = v42[13];

    if (v43)
    {
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "bounds");
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;

      -[UICollectionViewCompositionalLayout _invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:](self, "_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:", 1, v46, v48, v50, v52);
    }
  }
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v53 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = v53[15];

    if (!v54)
      goto LABEL_33;
    -[UICollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](self, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_setFlipsHorizontalAxis:", 1);
  }
  else
  {
    v55 = 0;
  }

LABEL_33:
  v56 = -[UICollectionViewCompositionalLayout _adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:container:](self, "_adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:container:", v64, v24);
  if (v56)
    v57 = 2;
  else
    v57 = 0;
  *(_BYTE *)&self->_compositionalLayoutFlags = *(_BYTE *)&self->_compositionalLayoutFlags & 0xFD | v57;
  v58 = 5;
  if (!v56)
    v58 = 0;
  self->_edgesForSafeAreaPropagation = v58;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bounds");
  -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v60, v61);

  *(_BYTE *)&self->_compositionalLayoutFlags &= ~4u;
  kdebug_trace();
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);

  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&v76);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(location);
}

- (id)_updateResolve
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 1582, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentUpdate != nil"));

    }
    kdebug_trace();
    -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 24);
    else
      v8 = 0;
    v9 = v8;
    -[UICollectionViewCompositionalLayout setDataSourceSnapshotter:](self, "setDataSourceSnapshotter:", v9);

    objc_msgSend(v4, "bounds");
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v10, v11);
    -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
      v13 = objc_msgSend(v4, "_isReordering");
    else
      v13 = 0;
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver resolveSolutionForUpdate:container:ignoreEmptyUpdate:]((uint64_t)v15, (uint64_t)v16, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout setCurrentResolveResult:](self, "setCurrentResolveResult:", v17);

    -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v4, "visibleBounds");
      v18 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    }
    kdebug_trace();
    -[UICollectionViewCompositionalLayout currentResolveResult](self, "currentResolveResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_UICollectionCompositionalLayoutSolverUpdate)currentUpdate
{
  return self->_currentUpdate;
}

- (void)_computeAndUpdateAdjustedContentFrame
{
  id *v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  id *v16;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    v4 = -[_UICollectionCompositionalLayoutSolver contentSize]((uint64_t)v3);
    v6 = v5;
    v7 = v16[6];
    objc_msgSend(v7, "contentSize");
    v9 = v8;
    v11 = v10;

    v12 = v16[8];
    if (v12 == (id)1)
      v13 = 2;
    else
      v13 = v12 == (id)2;
    v14 = _UISizeClampToMinimumSizeForAxis(v13, v4, v6, v9, v11);
    -[UICollectionViewCompositionalLayout setContentFrame:](self, "setContentFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v15);
    v3 = v16;
  }

}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (id)_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = v8[36], v8, v9 >= 1))
  {
    kdebug_trace();
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver mutatedVisibleItemsForElementsForVisibleBounds:]((uint64_t)v10, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    kdebug_trace();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)setMemoizedPreviousSolvedViewBoundsSize:(CGSize)a3
{
  self->_memoizedPreviousSolvedViewBoundsSize = a3;
}

- (id)_containerFromCollectionView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id *v9;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UICollectionViewCompositionalLayout _contentInsetsEnvironmentFromCollectionViewForInsetsReference:](self, "_contentInsetsEnvironmentFromCollectionViewForInsetsReference:", -[UICollectionViewCompositionalLayoutConfiguration contentInsetsReference](self->_configuration, "contentInsetsReference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], v8, v5, v7, 0.0, 0.0, 0.0, 0.0);

  return v9;
}

- (id)_contentInsetsEnvironmentFromCollectionViewForInsetsReference:(int64_t)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContentInsetsEnvironment insetEnvironmentForScrollView:insetReference:](_UIContentInsetsEnvironment, "insetEnvironmentForScrollView:insetReference:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDataSourceSnapshotter:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceSnapshotter, a3);
}

id __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  _UICollectionLayoutEnvironment *v9;
  void *v10;
  void *v11;
  void *v12;
  _UICollectionLayoutEnvironment *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "layoutSectionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = [_UICollectionLayoutEnvironment alloc];
      objc_msgSend(v8, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataSourceSnapshotter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshot");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:sectionIndex:wantsCollapsedTopSpacing:](v9, "initWithContainer:traitCollection:dataSourceSnapshot:sectionIndex:wantsCollapsedTopSpacing:", a2, v10, v12, a3, objc_msgSend(v8, "_shouldAdjustLayoutToCollapseTopSpacing"));

      objc_msgSend(v6, "layoutSectionProvider");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, _UICollectionLayoutEnvironment *))v14)[2](v14, a3, v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = v6[39];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)layoutSectionProvider
{
  return self->_layoutSectionProvider;
}

- (_UIDataSourceSnapshotter)dataSourceSnapshotter
{
  return self->_dataSourceSnapshotter;
}

- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UICollectionViewCompositionalLayout__prepareForCollectionViewUpdates_withDataSourceTranslator___block_invoke;
  aBlock[3] = &unk_1E16B8428;
  aBlock[4] = a4;
  v7 = _Block_copy(aBlock);
  -[UICollectionView _visibleBounds](self->super._collectionView, "_visibleBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UICollectionCompositionalLayoutSolverUpdate solverUpdateForVisibleBounds:updateItems:updateTranslator:finalDataSourceSnapshot:](v9, v11, v13, v15, (uint64_t)_UICollectionCompositionalLayoutSolverUpdate, a3, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCompositionalLayout setCurrentUpdate:](self, "setCurrentUpdate:", v17);

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver prepareForCollectionViewUpdates]((uint64_t)v18);

  -[_UICollectionViewLayoutSwipeActionsModule updateWithDataSourceTranslator:](self->super._swipeActionsModule, "updateWithDataSourceTranslator:", a4);
}

uint64_t __97__UICollectionViewCompositionalLayout__prepareForCollectionViewUpdates_withDataSourceTranslator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2 == -1)
    return objc_msgSend(v2, "finalSectionCount");
  objc_msgSend(v2, "finalSectionGlobalItemRangeForSection:", a2);
  return v3;
}

uint64_t __61__UICollectionViewCompositionalLayout__dataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2 == -1)
    return objc_msgSend(v2, "numberOfSections");
  else
    return objc_msgSend(v2, "numberOfItemsInSection:", a2);
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  void *v5;
  objc_super v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver finalizeCollectionViewUpdates]((uint64_t)v5);

  -[_UICollectionViewLayoutSwipeActionsModule finalizeCollectionViewUpdate:](self->super._swipeActionsModule, "finalizeCollectionViewUpdate:", a3);
  -[UICollectionViewCompositionalLayout setCurrentUpdate:](self, "setCurrentUpdate:", 0);
  -[UICollectionViewCompositionalLayout setCurrentResolveResult:](self, "setCurrentResolveResult:", 0);
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _finalizeCollectionViewUpdate:](&v6, sel__finalizeCollectionViewUpdate_, a3);
}

- (void)setCurrentUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdate, a3);
}

- (void)setCurrentResolveResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentResolveResult, a3);
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(a2, "_registrationViewClass"))
  {
    v3 = objc_msgSend(a2, "_registrationViewClass");
    objc_msgSend(a2, "elementKind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registerClass:forDecorationViewOfKind:", v3, v4);

  }
}

- (void)setSolver:(id)a3
{
  objc_storeStrong((id *)&self->_solver, a3);
}

- (BOOL)roundsToScreenScale
{
  return self->_roundsToScreenScale;
}

- (id)dynamicsConfigurationHandler
{
  return self->_dynamicsConfigurationHandler;
}

- (id)_dataSourceSnapshotter
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__UICollectionViewCompositionalLayout__dataSourceSnapshotter__block_invoke;
    v6[3] = &unk_1E16B8428;
    v7 = v2;
    objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(off_1E167C258, "snapshotterForNoDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)_adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:(unint64_t)a3 container:(id)a4
{
  int64_t v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;

  v7 = -[UIScrollView _compatibleContentInsetAdjustmentBehavior](self->super._collectionView, "_compatibleContentInsetAdjustmentBehavior");
  if (a3 != 1
    || (-[UICollectionViewCompositionalLayout collectionViewContentSize](self, "collectionViewContentSize"),
        v9 = v8,
        objc_msgSend(a4, "contentSize"),
        v9 >= v10 + 0.5))
  {
    v11 = 0;
    if (v7 != 102)
      return v11;
    v12 = 0;
LABEL_8:
    -[UIScrollView setContentInsetAdjustmentBehavior:](self->super._collectionView, "setContentInsetAdjustmentBehavior:", v12);
    return v11;
  }
  v11 = 1;
  v12 = 102;
  if (!v7 || v7 == 102)
    goto LABEL_8;
  return 0;
}

- (void)_setCollectionView:(id)a3
{
  void *v5;
  UITraitChangeRegistration *collectionViewTraitChangeRegistration;
  UITraitChangeRegistration *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    collectionViewTraitChangeRegistration = self->_collectionViewTraitChangeRegistration;
  else
    collectionViewTraitChangeRegistration = 0;
  v7 = collectionViewTraitChangeRegistration;
  -[UICollectionViewCompositionalLayout setCollectionViewTraitChangeRegistration:]((uint64_t)self, 0);
  if (v5 && v7)
    objc_msgSend(v5, "unregisterForTraitChanges:", v7);
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _setCollectionView:](&v10, sel__setCollectionView_, a3);
  +[_UICollectionCompositionalLayoutSolver traitsRequiringInvalidationForChanges]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(a3, "_registerForTraitTokenChanges:withTarget:action:", v8, self, sel__solverObservedTraitsDidChange);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout setCollectionViewTraitChangeRegistration:]((uint64_t)self, v9);

  }
  _UIUpdateCollectionViewForScrollDirection((uint64_t)a3, -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self->_configuration, "scrollDirection"));

}

+ (UICollectionViewCompositionalLayout)layoutWithListConfiguration:(UICollectionLayoutListConfiguration *)configuration
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = (void *)-[UICollectionLayoutListConfiguration copy](configuration, "copy");
  v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__UICollectionViewCompositionalLayout_UICollectionLayoutListSection__layoutWithListConfiguration___block_invoke;
  v9[3] = &unk_1E16C41F0;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithSectionProvider:", v9);

  return (UICollectionViewCompositionalLayout *)v7;
}

- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  UICollectionViewCompositionalLayout *v6;
  UICollectionViewCompositionalLayout *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewCompositionalLayout;
  v6 = -[UICollectionViewLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v6, 0, sectionProvider, configuration);
  return v7;
}

- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider
{
  UICollectionViewCompositionalLayout *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  v4 = -[UICollectionViewLayout init](&v7, sel_init);
  if (v4)
  {
    +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration](UICollectionViewCompositionalLayoutConfiguration, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v4, 0, sectionProvider, v5);

  }
  return v4;
}

- (void)_scrollViewLayoutAdjustmentsChanged
{
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__UICollectionViewCompositionalLayout__scrollViewLayoutAdjustmentsChanged__block_invoke;
  v5[3] = &unk_1E16B8540;
  v5[4] = &v6;
  -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)v3, (uint64_t)v5);

  if (*((_BYTE *)v7 + 24))
  {
    v4 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
    objc_msgSend(v4, "_setIntent:", 13);
    -[UICollectionViewCompositionalLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
  _Block_object_dispose(&v6, 8);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:]((void **)&self->_solver->super.isa, a3, a4);
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transformDecorationLayoutAttributes:", a2);

}

- (void)_transformSupplementaryLayoutAttributes:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "indexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") >= 2)
  {
    -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(v7, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_enrichLayoutAttributes:interactionState:", a3, self->_interactionStateModule);

  }
}

- (BOOL)_shouldInvalidateLayoutForDataSourceChange
{
  return 0;
}

- (BOOL)_supportsPrefetchingWithEstimatedSizes
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UICollectionViewCompositionalLayout contentFrame](self, "contentFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents
{
  return 1;
}

- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems
{
  return 1;
}

- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  _UICollectionViewLayoutSwipeActionsModule *swipeActionsModule;
  void *v6;
  objc_super v8;

  swipeActionsModule = self->super._swipeActionsModule;
  if (swipeActionsModule)
  {
    -[_UICollectionViewLayoutSwipeActionsModule propertyAnimatorForCollectionViewUpdates:withCustomAnimator:](swipeActionsModule, "propertyAnimatorForCollectionViewUpdates:withCustomAnimator:", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout _propertyAnimatorForCollectionViewUpdates:withCustomAnimator:](&v8, sel__propertyAnimatorForCollectionViewUpdates_withCustomAnimator_, a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_prepareLayout
{
  objc_super v3;

  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _prepareLayout](&v3, sel__prepareLayout);
}

- (void)prepareLayout
{
  void *v3;
  _BOOL4 v4;
  _UICollectionViewLayoutInteractionStateModule *v5;
  _UICollectionViewLayoutInteractionStateModule *interactionStateModule;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout prepareLayout](&v7, sel_prepareLayout);
  if ((*(_BYTE *)&self->_compositionalLayoutFlags & 1) != 0)
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_visibleBounds");
    v4 = -[UICollectionViewCompositionalLayout _viewBoundsPermitsLayout:](self, "_viewBoundsPermitsLayout:");

    if (v4)
    {
      -[UICollectionViewCompositionalLayout _fullResolve](self, "_fullResolve");
      -[UICollectionViewCompositionalLayout _solveForPinnedSupplementaryItemsIfNeededWithContext:](self, "_solveForPinnedSupplementaryItemsIfNeededWithContext:", 0);
      -[UICollectionViewCompositionalLayout _updateCollectionViewBackgroundColor](self, "_updateCollectionViewBackgroundColor");
      *(_BYTE *)&self->_compositionalLayoutFlags &= ~1u;
    }
  }
  if (!self->_interactionStateModule)
  {
    v5 = (_UICollectionViewLayoutInteractionStateModule *)-[_UICollectionViewLayoutInteractionStateModule initWithHost:]([_UICollectionViewLayoutInteractionStateModule alloc], self);
    interactionStateModule = self->_interactionStateModule;
    self->_interactionStateModule = v5;

  }
  -[UICollectionViewCompositionalLayout _createSwipeActionsModuleIfNeeded](self, "_createSwipeActionsModuleIfNeeded");
}

- (void)_createSwipeActionsModuleIfNeeded
{
  void *v3;
  int v4;
  _UICollectionViewLayoutSwipeActionsModule *v5;
  _UICollectionViewLayoutSwipeActionsModule *swipeActionsModule;

  if (!self->super._swipeActionsModule)
  {
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_UICollectionCompositionalLayoutSolver _wantsSwipeActions]((uint64_t)v3);

    if (v4)
    {
      v5 = -[_UICollectionViewLayoutSwipeActionsModule initWithHost:]([_UICollectionViewLayoutSwipeActionsModule alloc], "initWithHost:", self);
      swipeActionsModule = self->super._swipeActionsModule;
      self->super._swipeActionsModule = v5;

    }
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  kdebug_trace();
  -[_UICollectionCompositionalLayoutSolver layoutAttributesForElementsInRect:]((uint64_t)self->_solver, x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  return v8;
}

- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BYTE *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver extendedAttributesQueryIncludingOrthogonalScrollingRegions:](v7, x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  _UIUpdateVisibleCellsContext *updateVisibleCellsContext;
  _UIUpdateVisibleCellsContext *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _UIUpdateVisibleCellsContext *v18;
  _UIUpdateVisibleCellsContext *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  _WORD *v30;
  __int16 v31;
  void *v32;
  void *v33;
  void *v34;
  _UIUpdateVisibleCellsContext *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  void *v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  CGPoint v58;

  y = a3.y;
  x = a3.x;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = -[UICollectionViewCompositionalLayout _estimatesSizes](self, "_estimatesSizes");
  updateVisibleCellsContext = self->_updateVisibleCellsContext;
  if (v6)
  {
    if (updateVisibleCellsContext)
    {
      --updateVisibleCellsContext->_visibleCellsRefCount;
      v8 = self->_updateVisibleCellsContext;
      if (v8)
      {
        if (-[NSMutableArray count](v8->_attributes, "count") && !v8->_visibleCellsRefCount)
        {
          -[UICollectionView _visibleBounds](self->super._collectionView, "_visibleBounds");
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v16 = v15;
          -[UICollectionViewCompositionalLayout solver](self, "solver");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = self->_updateVisibleCellsContext;
          if (v18)
            v18 = (_UIUpdateVisibleCellsContext *)v18->_indexPaths;
          v19 = v18;
          -[_UICollectionCompositionalLayoutSolver itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths:]((uint64_t)v17, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UICollectionViewCompositionalLayout _preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:](self, "_preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:", v21, x, y, v10, v12, v14, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_setProperty_nonatomic_copy(v22, v23, v20, 128);
          v24 = _didPerformUpdateVisibleCellsPassWithLayoutOffset____s_category[0];
          if (!_didPerformUpdateVisibleCellsPassWithLayoutOffset____s_category[0])
          {
            v24 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, _didPerformUpdateVisibleCellsPassWithLayoutOffset____s_category);
          }
          if ((*(_BYTE *)v24 & 1) != 0)
          {
            v36 = *(NSObject **)(v24 + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = v36;
              -[UICollectionViewLayout collectionView](self, "collectionView");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v58.x = x;
              v58.y = y;
              NSStringFromCGPoint(v58);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "valueForKey:", CFSTR("_ui_shortDescription"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v50 = v38;
              v51 = 2112;
              v52 = v39;
              v53 = 2112;
              v54 = v40;
              v55 = 2112;
              v56 = v41;
              _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "_didPerformUpdateVisibleCellsPassWithLayoutOffset: cv == %p; layoutOffset == %@; preferredSizes == %@; d"
                "ependentItems == %@",
                buf,
                0x2Au);

            }
          }
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v43 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_WORD **)(*((_QWORD *)&v42 + 1) + 8 * i);
                if (v30)
                {
                  v31 = v30[144];
                  if ((v31 & 1) != 0)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "indexPath");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v32;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "invalidateItemsAtIndexPaths:", v33);
                  }
                  else
                  {
                    if ((v31 & 3) != 0)
                      continue;
                    -[UIBarButtonItemGroup _items](*(id **)(*((_QWORD *)&v42 + 1) + 8 * i));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "indexPath");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = v33;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v32, v34);

                  }
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
            }
            while (v27);
          }

          -[UICollectionViewCompositionalLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v22);
          -[UICollectionView _setNeedsVisibleCellsUpdate:withLayoutAttributes:](self->super._collectionView, "_setNeedsVisibleCellsUpdate:withLayoutAttributes:", 1, 1);

        }
        v35 = self->_updateVisibleCellsContext;
        if (v35)
        {
          if (v35->_visibleCellsRefCount <= 0)
          {
            self->_updateVisibleCellsContext = 0;

          }
        }
      }
    }
  }
  else
  {
    self->_updateVisibleCellsContext = 0;

  }
}

- (id)_preferredAttributesResolveWithInvalidatedPreferredAttributes:(id)a3 layoutOffset:(CGPoint)a4 visibleRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v9;
  double v10;
  void *v13;
  void *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  kdebug_trace();
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver resolveForInvalidatedPreferredAttributes:scrollOffset:visibleRect:]((uint64_t)v13, a3, v10, v9, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
  kdebug_trace();
  return v14;
}

- (void)_cellBackgroundOrBottomSeparatorChangedAtIndexPath:(id)a3 separatorOnly:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 2027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_currentUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v7, "_collectionViewData");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9 && (-[UICollectionViewData _isIndexPathValid:validateItemCounts:](v9, a3, 1) & 1) != 0)
    {
      -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(a3, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "_callback");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:interactionState:separatorOnly:", a3, self->_interactionStateModule, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (!v4)
          {
            objc_msgSend(v7, "_selectionController");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (void *)objc_msgSend(*(id *)(v15 + 8), "copy");
            else
              v17 = 0;
            objc_msgSend(v17, "allObjects");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "invalidateItemsAtIndexPaths:", v18);

          }
          -[UICollectionViewCompositionalLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v14);
        }

      }
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = CFSTR("background");
        if (v4)
          v25 = CFSTR("separator");
        *(_DWORD *)buf = 138412546;
        v27 = v25;
        v28 = 2112;
        v29 = a3;
        _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Ignoring cell %@ change notification received for invalid index path: %@", buf, 0x16u);
      }

    }
    else
    {
      v19 = _cellBackgroundOrBottomSeparatorChangedAtIndexPath_separatorOnly____s_category;
      if (!_cellBackgroundOrBottomSeparatorChangedAtIndexPath_separatorOnly____s_category)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&_cellBackgroundOrBottomSeparatorChangedAtIndexPath_separatorOnly____s_category);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = CFSTR("background");
        if (v4)
          v21 = CFSTR("separator");
        *(_DWORD *)buf = 138412546;
        v27 = v21;
        v28 = 2112;
        v29 = a3;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Ignoring cell %@ change notification received for invalid index path: %@", buf, 0x16u);
      }
    }

  }
}

- (BOOL)isEditing
{
  return (*(_BYTE *)&self->super._layoutFlags >> 4) & 1;
}

- (BOOL)canBeEdited
{
  return (dyld_program_sdk_at_least() & 1) != 0 || self->super._swipeActionsModule != 0;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  objc_super v30;
  objc_super v31;
  objc_super v32;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (!_UISupportsShouldInvalidateForInsets())
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    -[UICollectionViewCompositionalLayout memoizedPreviousSolvedViewBoundsSize](self, "memoizedPreviousSolvedViewBoundsSize");
    v16 = v13 == v15 && v11 == v14;

    -[UICollectionViewCompositionalLayout memoizedPreviousLayoutMargins](self, "memoizedPreviousLayoutMargins");
    if (left == v20 && top == v17 && right == v19)
    {
      if (v16)
      {
        if (bottom == v18)
        {
          v8 = 0;
LABEL_22:
          -[UICollectionViewCompositionalLayout setMemoizedPreviousLayoutMargins:](self, "setMemoizedPreviousLayoutMargins:", top, left, bottom, right);
          return v8;
        }
        goto LABEL_13;
      }
    }
    else if (v16)
    {
LABEL_13:
      v30.receiver = self;
      v30.super_class = (Class)UICollectionViewCompositionalLayout;
      -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v30, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[UICollectionViewCompositionalLayout _layoutAxis](self, "_layoutAxis");
      if (v21 == 1)
        v22 = 2;
      else
        v22 = v21 == 2;
      -[UICollectionViewCompositionalLayout memoizedPreviousLayoutMargins](self, "memoizedPreviousLayoutMargins");
      if (_UIEdgeInsetsEqualToInsetsAlongAxis(v22, v23, v24, v25, v26, top, left, bottom, right))
      {
        v27 = v8;
        v28 = 7;
LABEL_21:
        objc_msgSend(v27, "_setIntent:", v28);
        goto LABEL_22;
      }
      v27 = v8;
LABEL_20:
      v28 = 2;
      goto LABEL_21;
    }
    v31.receiver = self;
    v31.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v31, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    goto LABEL_20;
  }
  v32.receiver = self;
  v32.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v32, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setIntent:", 2);
  return v8;
}

- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  v12 = -[UICollectionViewCompositionalLayout _layoutAxis](self, "_layoutAxis");
  if (v12 == 1)
    v13 = 2;
  else
    v13 = v12 == 2;
  return !_UIEdgeInsetsEqualToInsetsAlongAxis(v13, v11, v10, v9, v8, top, left, bottom, right);
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  return !_UISupportsShouldInvalidateForInsets()
      || -[UICollectionViewCompositionalLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  return !_UISupportsShouldInvalidateForInsets()
      || -[UICollectionViewCompositionalLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  void *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout invalidationContextForBoundsChange:](&v28, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UICollectionViewCompositionalLayout _boundsSizeChangedFromLastSolvedBounds:](self, "_boundsSizeChangedFromLastSolvedBounds:", x, y, width, height);
  v10 = v9;
  if (v9)
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v8, "_setIntent:", v11);
  if (!v10 && (_UICollectionViewCompositionalLayoutShouldDeferResolvesUntilQueried() & 1) == 0)
  {
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12[36];

      if (v13 >= 1)
      {
        -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:", x, y, width, height);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (!v15)
          goto LABEL_20;
        v16 = v15;
        v17 = *(_QWORD *)v25;
        while (1)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v19, "representedElementCategory"))
            {
              if (objc_msgSend(v19, "representedElementCategory") != 1)
                continue;
              objc_msgSend(v19, "representedElementKind");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "indexPath");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v21;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v20, v22);

            }
            else
            {
              objc_msgSend(v19, "indexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v20;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "invalidateItemsAtIndexPaths:", v21);
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          if (!v16)
            goto LABEL_20;
        }
      }
    }
    else
    {
      v14 = 0;
LABEL_20:

    }
  }
  return v8;
}

- (BOOL)_boundsSizeChangedFromLastSolvedBounds:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  -[UICollectionViewCompositionalLayout memoizedPreviousSolvedViewBoundsSize](self, "memoizedPreviousSolvedViewBoundsSize", a3.origin.x, a3.origin.y);
  return v6 != height || v5 != width;
}

- (CGSize)memoizedPreviousSolvedViewBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_memoizedPreviousSolvedViewBoundsSize.width;
  height = self->_memoizedPreviousSolvedViewBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

void __74__UICollectionViewCompositionalLayout__scrollViewLayoutAdjustmentsChanged__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a2, "_callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9 = v6;
    v8 = objc_msgSend(v6, "_shouldInvalidateForScrollViewLayoutAdjustmentsChange");
    v7 = v9;
    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v6, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[_UICollectionViewLayoutSwipeActionsModule transformCellLayoutAttributes:isDisappearing:](self->super._swipeActionsModule, "transformCellLayoutAttributes:isDisappearing:", v4, 1);
  return v4;
}

- (void)setConfiguration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  unint64_t v6;
  UICollectionViewCompositionalLayoutConfiguration *v7;
  UICollectionViewCompositionalLayoutConfiguration *v8;
  void *v9;
  void *v11;
  void *v12;
  double *v13;
  id v14;
  void *v15;
  objc_super v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[configuration isKindOfClass:[UICollectionViewCompositionalLayoutConfiguration class]]"));

  }
  v6 = -[UICollectionViewCompositionalLayoutConfiguration differencesFromConfiguration:](self->_configuration, "differencesFromConfiguration:", configuration);
  v7 = (UICollectionViewCompositionalLayoutConfiguration *)-[UICollectionViewCompositionalLayoutConfiguration copy](configuration, "copy");
  v8 = self->_configuration;
  self->_configuration = v7;

  if (v6)
  {
    if ((v6 & 2) != 0)
      _UIUpdateCollectionViewForScrollDirection((uint64_t)self->super._collectionView, -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self->_configuration, "scrollDirection"));
    if ((*(_BYTE *)&self->_compositionalLayoutFlags & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      -[UICollectionViewCompositionalLayout solver](self, "solver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != 8 || v9 == 0)
      {
        -[UICollectionViewCompositionalLayout _fullResolve](self, "_fullResolve");
        -[UICollectionViewCompositionalLayout _updateCollectionViewBackgroundColor](self, "_updateCollectionViewBackgroundColor");
        v13 = 0;
      }
      else
      {
        -[UICollectionViewCompositionalLayout solver](self, "solver");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewCompositionalLayoutConfiguration boundarySupplementaryItems](configuration, "boundarySupplementaryItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver resolveForUpdatedGlobalSupplementaries:](v11, v12);
        v13 = (double *)objc_claimAutoreleasedReturnValue();

      }
      -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    }
    v14 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
    objc_msgSend(v14, "_setInvalidateEverything:", 1);
    if (v13)
    {
      objc_msgSend(v14, "setContentOffsetAdjustment:", v13[6], v13[7]);
      objc_msgSend(v14, "_setShouldInvalidateCollectionViewContentSize:", 1);
    }
    v16.receiver = self;
    v16.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout invalidateLayoutWithContext:](&v16, sel_invalidateLayoutWithContext_, v14);

  }
}

void __78__UICollectionViewCompositionalLayout__handlePreferredSizingDataInvalidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "solver");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:]((uint64_t)v6, a2, (uint64_t)a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dynamicsConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_collectionViewTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_currentResolveResult, 0);
  objc_storeStrong((id *)&self->_currentUpdate, 0);
  objc_storeStrong((id *)&self->_updateVisibleCellsContext, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshotter, 0);
  objc_storeStrong((id *)&self->_solver, 0);
  objc_storeStrong(&self->_layoutSectionProvider, 0);
  objc_storeStrong((id *)&self->_layoutSectionTemplate, 0);
  objc_storeStrong((id *)&self->_interactionStateModule, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)_boundsChangeResolve
{
  void *v3;
  double v4;
  double v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kdebug_trace();
    objc_msgSend(v3, "bounds");
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v4, v5);
    -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver resolveForContainerChange:]((uint64_t)v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    objc_msgSend(v3, "visibleBounds");
    v9 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    kdebug_trace();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:](&v7, sel_finalLayoutAttributesForDisappearingDecorationElementOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[_UICollectionViewLayoutSwipeActionsModule transformDecorationLayoutAttributes:isDisappearing:](self->super._swipeActionsModule, "transformDecorationLayoutAttributes:isDisappearing:", v5, 1);
  return v5;
}

- (id)_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  id *v25;
  void *v26;

  kdebug_trace();
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_contentInsetIncludingDecorations");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = objc_msgSend(v21, "effectiveUserInterfaceLayoutDirection");
    if (v23 == 1)
      v24 = v16;
    else
      v24 = v20;
    if (v23 == 1)
      v16 = v20;
    v20 = v24;
  }

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v25 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver updatePinnedSectionSupplementaryItemsForVisibleBounds:](v25, v5 + v16, v7 + v14, v9 - (v20 + v16), v11 - (v14 + v18));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  return v26;
}

- (UICollectionViewCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  UICollectionViewCompositionalLayout *v8;
  UICollectionViewCompositionalLayout *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewCompositionalLayout;
  v8 = -[UICollectionViewLayout init](&v11, sel_init);
  v9 = v8;
  if (v8)
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v8, a3, a4, a5);
  return v9;
}

- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section
{
  UICollectionViewCompositionalLayout *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  v4 = -[UICollectionViewLayout init](&v7, sel_init);
  if (v4)
  {
    +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration](UICollectionViewCompositionalLayoutConfiguration, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v4, section, 0, v5);

  }
  return v4;
}

- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  UICollectionViewCompositionalLayout *v6;
  UICollectionViewCompositionalLayout *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewCompositionalLayout;
  v6 = -[UICollectionViewLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v6, section, 0, configuration);
  return v7;
}

- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3
{
  void *v5;
  UICollectionViewCompositionalLayout *v6;

  +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration](UICollectionViewCompositionalLayoutConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UICollectionViewCompositionalLayout initWithSection:sectionProvider:configuration:](self, "initWithSection:sectionProvider:configuration:", a3, 0, v5);

  return v6;
}

- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3 scrollDirection:(int64_t)a4
{
  void *v7;
  UICollectionViewCompositionalLayout *v8;

  +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration](UICollectionViewCompositionalLayoutConfiguration, "defaultConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollDirection:", a4);
  v8 = -[UICollectionViewCompositionalLayout initWithSection:sectionProvider:configuration:](self, "initWithSection:sectionProvider:configuration:", a3, 0, v7);

  return v8;
}

- (int64_t)scrollDirection
{
  return -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self->_configuration, "scrollDirection");
}

- (id)boundarySupplementaryItems
{
  return -[UICollectionViewCompositionalLayoutConfiguration boundarySupplementaryItems](self->_configuration, "boundarySupplementaryItems");
}

- (void)setBoundarySupplementaryItems:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = setBoundarySupplementaryItems____s_category;
  if (!setBoundarySupplementaryItems____s_category)
  {
    v3 = __UILogCategoryGetNode("CompositionalLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&setBoundarySupplementaryItems____s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Warning: this method is no longer supported - ignoring update to boundarySupplementaryItems", v5, 2u);
  }
}

- (void)setCollectionViewTraitChangeRegistration:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  _UICollectionViewLayoutSwipeActionsModule *swipeActionsModule;
  objc_super v6;

  -[_UICollectionViewLayoutSwipeActionsModule teardown](self->super._swipeActionsModule, "teardown");
  swipeActionsModule = self->super._swipeActionsModule;
  self->super._swipeActionsModule = 0;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  -[UICollectionViewLayout _prepareForTransitionToLayout:](&v6, sel__prepareForTransitionToLayout_, a3);
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  -[_UICollectionCompositionalLayoutSolver layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:]((uint64_t)self->_solver, a3, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v10, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)_allowsItemInteractionsToBegin
{
  objc_super v4;

  if (-[_UICollectionViewLayoutSwipeActionsModule hasActiveSwipe](self->super._swipeActionsModule, "hasActiveSwipe"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewCompositionalLayout;
  return -[UICollectionViewLayout _allowsItemInteractionsToBegin](&v4, sel__allowsItemInteractionsToBegin);
}

- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _UICollectionCompositionalLayoutSolver *solver;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  _QWORD v23[6];
  uint64_t v24;
  float64x2_t *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  NSDirectionalEdgeInsets result;

  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (objc_msgSend(a3, "item") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = 0;
    v25 = (float64x2_t *)&v24;
    v26 = 0x4010000000;
    v27 = &unk_18685B0AF;
    v28 = 0u;
    v29 = 0u;
    solver = self->_solver;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__UICollectionViewCompositionalLayout__supplementaryViewInsetsForScrollingToItemAtIndexPath___block_invoke;
    v23[3] = &unk_1E16B83D8;
    v23[4] = a3;
    v23[5] = &v24;
    -[_UICollectionCompositionalLayoutSolver enumeratePinnedSupplementaryItems:]((uint64_t)solver, (uint64_t)v23);
    v6 = v25[2].f64[1];
    if (v6 != 0.0
      || (v5 = v25[2].f64[0], v5 != 0.0)
      || (v8 = v25[3].f64[1], v8 != 0.0)
      || (v7 = v25[3].f64[0], v7 != 0.0))
    {
      -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(a3, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "_pinnedSupplementariesShouldOverlap"))
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_currentScreenScale");
        v13 = v12;
        v14 = objc_msgSend(a3, "item");
        v16 = 1.0 / v13;
        if (!v14)
          v25[2] = vsubq_f64(v25[2], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0));
        v17 = objc_msgSend(a3, "item", *(_QWORD *)&v16, v15);
        if (v17 == objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(a3, "section")) - 1)
          v25[3] = vsubq_f64(v25[3], (float64x2_t)vdupq_lane_s64(v22, 0));

      }
      v5 = v25[2].f64[0];
      v6 = v25[2].f64[1];
      v7 = v25[3].f64[0];
      v8 = v25[3].f64[1];
    }
    _Block_object_dispose(&v24, 8);
  }
  v18 = v5;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  result.trailing = v21;
  result.bottom = v20;
  result.leading = v19;
  result.top = v18;
  return result;
}

void __93__UICollectionViewCompositionalLayout__supplementaryViewInsetsForScrollingToItemAtIndexPath___block_invoke(uint64_t a1, id *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double Width;
  double v17;
  double Height;
  double v19;
  double v20;
  void *v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v6 = objc_msgSend(*(id *)(a1 + 32), "section");
  objc_msgSend(a3, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "section");

  if (v6 == v8)
  {
    -[_UICollectionLayoutFramesQueryResult supplementaryItem](a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v21, "extendsBoundary");
    v10 = v21;
    if (!v9)
    {
LABEL_13:

      return;
    }
    objc_msgSend(v21, "containerAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "edges");

    if ((v12 & 1) != 0)
    {
      v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      objc_msgSend(a3, "frame");
      Height = CGRectGetHeight(v24);
      if (v17 >= Height)
        Height = v17;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = Height;
      if ((v12 & 4) == 0)
      {
LABEL_5:
        if ((v12 & 2) == 0)
        {
LABEL_9:
          v10 = v21;
          if ((v12 & 8) != 0)
          {
            v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56);
            objc_msgSend(a3, "frame");
            Width = CGRectGetWidth(v23);
            v10 = v21;
            if (v15 >= Width)
              Width = v15;
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = Width;
          }
          goto LABEL_13;
        }
LABEL_6:
        v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(a3, "frame");
        v14 = CGRectGetWidth(v22);
        if (v13 >= v14)
          v14 = v13;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v14;
        goto LABEL_9;
      }
    }
    else if ((v12 & 4) == 0)
    {
      goto LABEL_5;
    }
    v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    objc_msgSend(a3, "frame");
    v20 = CGRectGetHeight(v25);
    if (v19 >= v20)
      v20 = v19;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = v20;
    if ((v12 & 2) == 0)
      goto LABEL_9;
    goto LABEL_6;
  }
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _WORD *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void **v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  objc_super v61;
  CGRect v62;
  CGRect result;

  -[UICollectionViewCompositionalLayout dataSourceSnapshotter](self, "dataSourceSnapshotter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  if (v6 <= a3)
  {
    v61.receiver = self;
    v61.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout _frameForScrollingToFirstElementInSectionAtIndex:](&v61, sel__frameForScrollingToFirstElementInSectionAtIndex_, a3);
    v17 = v33;
    v19 = v34;
    v21 = v35;
    v23 = v36;
  }
  else
  {
    -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__27;
    v59 = __Block_byref_object_dispose__27;
    v60 = 0;
    v8 = -[UICollectionViewCompositionalLayout _layoutAxis](self, "_layoutAxis");
    objc_msgSend(v7, "boundarySupplementaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 3;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    if (v8 == 2)
      v11 = 1;
    v54[2] = __88__UICollectionViewCompositionalLayout__frameForScrollingToFirstElementInSectionAtIndex___block_invoke;
    v54[3] = &unk_1E16B8400;
    v54[4] = &v55;
    v54[5] = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v54);

    v12 = (void *)v56[5];
    if (v12)
    {
      objc_msgSend(v12, "elementKind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewCompositionalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v13, v14);
      v15 = (_WORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      if (objc_msgSend((id)v56[5], "pinToVisibleBounds")
        && objc_msgSend(v7, "_pinnedSupplementariesShouldOverlap"))
      {
        if (v15 && (v15[144] & 0x800) != 0)
        {
          -[UICollectionViewCompositionalLayout solver](self, "solver");
          v24 = (void **)objc_claimAutoreleasedReturnValue();
          v17 = -[_UICollectionCompositionalLayoutSolver unpinnedFrameOfBoundarySupplementaryElementOfKind:withIndexPath:](v24, v13, v14);
          v19 = v25;
          v21 = v26;
          v23 = v27;

        }
        v62.origin.x = v17;
        v62.origin.y = v19;
        v62.size.width = v21;
        v62.size.height = v23;
        if (!CGRectIsNull(v62))
        {
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            -[UICollectionViewLayout collectionView](self, "collectionView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "_currentScreenScale");
            v31 = v30;

            v17 = v17
                + _UISetPointValueForAxis(v8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0 / v31);
            v19 = v19 + v32;
          }
        }
      }

    }
    else
    {
      -[UICollectionViewCompositionalLayout dataSourceSnapshotter](self, "dataSourceSnapshotter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "numberOfItemsInSection:", a3);

      if (v38 < 1)
      {
        v53.receiver = self;
        v53.super_class = (Class)UICollectionViewCompositionalLayout;
        -[UICollectionViewLayout _frameForScrollingToFirstElementInSectionAtIndex:](&v53, sel__frameForScrollingToFirstElementInSectionAtIndex_, a3);
        v17 = v45;
        v19 = v46;
        v21 = v47;
        v23 = v48;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "frame");
        v17 = v41;
        v19 = v42;
        v21 = v43;
        v23 = v44;

      }
    }
    _Block_object_dispose(&v55, 8);

  }
  v49 = v17;
  v50 = v19;
  v51 = v21;
  v52 = v23;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

void __88__UICollectionViewCompositionalLayout__frameForScrollingToFirstElementInSectionAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  if ((*(_QWORD *)(a1 + 40) & ~objc_msgSend(a2, "alignment")) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (CGPoint)_targetPositionForInteractiveMovementOfItemAtIndexPath:(id)a3 withProposedTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", objc_msgSend(a3, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "shouldRestrictOrthogonalAxisDuringInteractiveMovement"))
  {
    -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:]((uint64_t)self->_solver, (CGFloat *)a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UICollectionViewCompositionalLayout _layoutAxis](self, "_layoutAxis");
    if (v11 == 1)
      v12 = 2;
    else
      v12 = v11 == 2;
    objc_msgSend(v10, "center");
    v15 = _UIPointValueForAxis(v12, v13, v14);
    x = _UISetPointValueForAxis(v12, x, y, v15);
    y = v16;

  }
  v17 = x;
  v18 = y;
  result.y = v18;
  result.x = v17;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  CGFloat *v9;
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
  objc_super v21;
  CGRect v22;

  -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;

  if (!v8 || !_CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
    goto LABEL_10;
  objc_msgSend(v8, "initialIndexPathForFinalIndexPath:", a3);
  v9 = (CGFloat *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_9;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForItemAtInitialIndexPath:]((uint64_t)v10, v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  if (CGRectIsNull(v22)
    || (-[UICollectionViewCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", a3), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19 = (void *)objc_msgSend(v18, "copy"), v18, !v19))
  {
LABEL_9:

LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v21, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

LABEL_11:
  return v19;
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v23;
  CGRect v24;

  -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 16);
  else
    v9 = 0;
  v10 = v9;

  if (!v10 || !_CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
    goto LABEL_10;
  objc_msgSend(v10, "initialIndexPathForSupplementaryElementOfKind:forFinalIndexPath:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForDecorationViewOfKind:withInitialIndexPath:](v12, a3, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  if (CGRectIsNull(v24)
    || (-[UICollectionViewCompositionalLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", a3, a4), v20 = (void *)objc_claimAutoreleasedReturnValue(), v21 = (void *)objc_msgSend(v20, "copy"), v20, !v21))
  {
LABEL_9:

LABEL_10:
    v23.receiver = self;
    v23.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:](&v23, sel_initialLayoutAttributesForAppearingDecorationElementOfKind_atIndexPath_, a3, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

LABEL_11:
  return v21;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v23;
  CGRect v24;

  -[UICollectionViewCompositionalLayout currentUpdate](self, "currentUpdate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 16);
  else
    v9 = 0;
  v10 = v9;

  if (!v10 || !_CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
    goto LABEL_10;
  objc_msgSend(v10, "initialIndexPathForSupplementaryElementOfKind:forFinalIndexPath:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForSupplementaryViewOfKind:withInitialIndexPath:]((uint64_t)v12, a3, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  if (CGRectIsNull(v24)
    || (-[UICollectionViewCompositionalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", a3, a4), v20 = (void *)objc_claimAutoreleasedReturnValue(), v21 = (void *)objc_msgSend(v20, "copy"), v20, !v21))
  {
LABEL_9:

LABEL_10:
    v23.receiver = self;
    v23.super_class = (Class)UICollectionViewCompositionalLayout;
    -[UICollectionViewLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](&v23, sel_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_, a3, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

LABEL_11:
  return v21;
}

- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  if (-[UICollectionViewCompositionalLayout _estimatesSizes](self, "_estimatesSizes"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  return -[UICollectionViewLayout _shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:](&v6, sel__shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems_, v3);
}

- (BOOL)_wantsCustomSectionContainers
{
  _BYTE *v2;
  BOOL v3;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[14] != 0;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)_edgesForSafeAreaPropagationToDescendants
{
  return self->_edgesForSafeAreaPropagation;
}

- (BOOL)_disallowsFadeCellsForBoundsChange
{
  return 1;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "_wantsBandSelectionVisuals");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UICollectionViewCompositionalLayout;
    v7 = -[UICollectionViewLayout _wantsBandSelectionVisualsInSection:](&v10, sel__wantsBandSelectionVisualsInSection_, a3);
  }
  v8 = v7;

  return v8;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3
{
  void *v3;
  char v4;

  -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldRestrictOrthogonalAxisDuringInteractiveMovement") ^ 1;

  return v4;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidateLayoutWithContext:", a2);
    WeakRetained = v4;
  }

}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id WeakRetained;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    UICollectionViewCompositionalLayoutAlertForInvalidLayout(WeakRetained, a2, a3, a4, a5, a6);
    WeakRetained = v12;
  }

}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transformSupplementaryLayoutAttributes:", a2);

}

- (void)_handleEndInteractiveReorderingWithContext:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v8;
  id v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 1570, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(a3, "targetIndexPathsForInteractivelyMovingItems");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "invalidateItemsAtIndexPaths:");
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(*(id *)(v5 + 208), "removeObjectsForKeys:", v9);

}

- (id)_sectionDefinitionsUpdateResolve
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kdebug_trace();
    objc_msgSend(v3, "bounds");
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v4, v5);
    -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver resolveForUpdatingSectionDefinitionsWithContainer:](v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    objc_msgSend(v3, "visibleBounds");
    v9 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    kdebug_trace();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_marginsChangeResolve
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kdebug_trace();
    objc_msgSend(v3, "bounds");
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v4, v5);
    -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver resolveForMarginsChange:]((uint64_t)v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    objc_msgSend(v3, "visibleBounds");
    v9 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    v10 = -[UICollectionViewCompositionalLayout _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds](self, "_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds");
    kdebug_trace();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_scrollViewAdjustmentsChangeResolve
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  id v10;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kdebug_trace();
    objc_msgSend(v3, "bounds");
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedViewBoundsSize:](self, "setMemoizedPreviousSolvedViewBoundsSize:", v4, v5);
    -[UICollectionViewCompositionalLayout _containerFromCollectionView](self, "_containerFromCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCompositionalLayout solver](self, "solver");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolver resolveForScrollViewLayoutAdjustmentsChange:](v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewCompositionalLayout _computeAndUpdateAdjustedContentFrame](self, "_computeAndUpdateAdjustedContentFrame");
    objc_msgSend(v3, "visibleBounds");
    v9 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    v10 = -[UICollectionViewCompositionalLayout _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds](self, "_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds");
    kdebug_trace();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_handleSwipeActionsInvalidationWithContext:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a3, "invalidatedItemIndexPaths");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      -[UICollectionViewCompositionalLayout solver](self, "solver");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        objc_msgSend(*(id *)(v6 + 208), "removeObjectsForKeys:", v9);

    }
    objc_msgSend(a3, "invalidatedDecorationIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__UICollectionViewCompositionalLayout__handleSwipeActionsInvalidationWithContext___block_invoke;
    v10[3] = &unk_1E16B8590;
    v10[4] = self;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __82__UICollectionViewCompositionalLayout__handleSwipeActionsInvalidationWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "solver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:]((uint64_t)v5, a2, a3);

}

- (BOOL)_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:(CGRect)a3 preparingLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  UIEdgeInsets *p_memoizedDynamicAnimatorWorldAdjustingInsets;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4
    || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_memoizedDynamicAnimatorWorldAdjustingInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_memoizedDynamicAnimatorWorldAdjustingInsets.bottom))))) & 1) == 0)
  {
    p_memoizedDynamicAnimatorWorldAdjustingInsets = &self->_memoizedDynamicAnimatorWorldAdjustingInsets;
    v10 = CGRectGetHeight(a3) * -2.0;
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v11 = CGRectGetWidth(v44) * -2.0;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v12 = CGRectGetHeight(v45) * -2.0;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v13 = CGRectGetWidth(v46);
    p_memoizedDynamicAnimatorWorldAdjustingInsets->top = v10;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->left = v11;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->bottom = v12;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->right = v13 * -2.0;
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_visibleRectEdgeInsets");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    if (v18 == 0.0 && v16 == 0.0 && v22 == 0.0 && v20 == 0.0)
    {
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setVisibleRectEdgeInsets:", p_memoizedDynamicAnimatorWorldAdjustingInsets->top, p_memoizedDynamicAnimatorWorldAdjustingInsets->left, p_memoizedDynamicAnimatorWorldAdjustingInsets->bottom, p_memoizedDynamicAnimatorWorldAdjustingInsets->right);

    }
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_visibleBounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_effectiveVisibleBoundsForBounds:", x, y, width, height);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = -[_UICollectionCompositionalLayoutSolver updateVisibleBoundsForDynamicAnimator:previousVisibleBounds:]((uint64_t)v42, v35, v37, v39, v41, v26, v28, v30, v32);

  return (char)v33;
}

- (void)_setOffset:(CGPoint)a3 forOrthogonalScrollingSection:(int64_t)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver setOrthogonalOffset:forSection:]((uint64_t)v7, a4, x, y);

}

- (unint64_t)_orthogonalScrollingAxis
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2[8];
    if (v3 == 1)
      v4 = 2;
    else
      v4 = v3 == 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3
{
  void *v4;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver elementShouldAppearAboveOrthogonalScrollingContainer:]((uint64_t)v4, (uint64_t)a3);

  return (char)a3;
}

- (int64_t)_interactionStateModule:(id)a3 swipeActionsStyleForSwipedItemAtIndexPath:(id)a4
{
  return -[_UICollectionViewLayoutSwipeActionsModule swipeActionsStyleForSwipedItemAtIndexPath:](self->super._swipeActionsModule, "swipeActionsStyleForSwipedItemAtIndexPath:", a4);
}

- (void)setEditing:(BOOL)a3
{
  char layoutFlags;
  char v4;

  layoutFlags = (char)self->super._layoutFlags;
  if (((((layoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *(_BYTE *)&self->super._layoutFlags = layoutFlags & 0xEF | v4;
    -[_UICollectionViewLayoutSwipeActionsModule editingStateDidChange](self->super._swipeActionsModule, "editingStateDidChange");
  }
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3
{
  void *v4;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver _supportsSwipeActionsForIndexPath:]((uint64_t)v4, a3);

  return (char)a3;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _leadingSwipeActionsConfigurationForIndexPath:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _trailingSwipeActionsConfigurationForIndexPath:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateStyleForSwipeActionsConfiguration:(id)a3 indexPath:(id)a4
{
  id v6;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _updateStyleForSwipeActionsConfiguration:indexPath:]((uint64_t)v6, (uint64_t)a3, a4);

}

- (void)_willBeginSwiping
{
  id v2;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _willBeginSwiping]((uint64_t)v2);

}

- (void)_didEndSwiping
{
  id v2;

  -[UICollectionViewCompositionalLayout solver](self, "solver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolver _didEndSwiping]((uint64_t)v2);

}

- (id)_sectionsDescription
{
  void *v3;
  _UICollectionCompositionalLayoutSolver *solver;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Sections for %@:"), self);
  solver = self->_solver;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__UICollectionViewCompositionalLayout__sectionsDescription__block_invoke;
  v7[3] = &unk_1E16B8568;
  v5 = v3;
  v8 = v5;
  -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)solver, (uint64_t)v7);

  return v5;
}

uint64_t __59__UICollectionViewCompositionalLayout__sectionsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\t[Section %ld: %@]"), a3, a2);
}

- (NSCollectionLayoutSection)layoutSectionTemplate
{
  return self->_layoutSectionTemplate;
}

- (void)setLayoutSectionTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSectionTemplate, a3);
}

- (void)setLayoutSectionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (UIEdgeInsets)memoizedDynamicAnimatorWorldAdjustingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_memoizedDynamicAnimatorWorldAdjustingInsets.top;
  left = self->_memoizedDynamicAnimatorWorldAdjustingInsets.left;
  bottom = self->_memoizedDynamicAnimatorWorldAdjustingInsets.bottom;
  right = self->_memoizedDynamicAnimatorWorldAdjustingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMemoizedDynamicAnimatorWorldAdjustingInsets:(UIEdgeInsets)a3
{
  self->_memoizedDynamicAnimatorWorldAdjustingInsets = a3;
}

- (UIEdgeInsets)memoizedPreviousLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_memoizedPreviousLayoutMargins.top;
  left = self->_memoizedPreviousLayoutMargins.left;
  bottom = self->_memoizedPreviousLayoutMargins.bottom;
  right = self->_memoizedPreviousLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMemoizedPreviousLayoutMargins:(UIEdgeInsets)a3
{
  self->_memoizedPreviousLayoutMargins = a3;
}

- (unint64_t)edgesForSafeAreaPropagation
{
  return self->_edgesForSafeAreaPropagation;
}

- (void)setEdgesForSafeAreaPropagation:(unint64_t)a3
{
  self->_edgesForSafeAreaPropagation = a3;
}

- (_UIUpdateVisibleCellsContext)updateVisibleCellsContext
{
  return self->_updateVisibleCellsContext;
}

- (void)setUpdateVisibleCellsContext:(id)a3
{
  objc_storeStrong((id *)&self->_updateVisibleCellsContext, a3);
}

- (void)setLayoutRTL:(BOOL)a3
{
  self->_layoutRTL = a3;
}

- (void)setRoundsToScreenScale:(BOOL)a3
{
  self->_roundsToScreenScale = a3;
}

- (void)setDynamicsConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

uint64_t __98__UICollectionViewCompositionalLayout_UICollectionLayoutListSection__layoutWithListConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(off_1E16799A0, "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
}

@end
