@implementation PXFeedContentLayout

- (PXFeedContentLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedContentLayout.m"), 46, CFSTR("%s is not available as initializer"), "-[PXFeedContentLayout init]");

  abort();
}

- (PXFeedContentLayout)initWithViewModel:(id)a3
{
  id v5;
  PXFeedContentLayout *v6;
  PXFeedContentLayout *v7;
  PXFeedItemDecorationSource *v8;
  PXFeedItemDecorationSource *decorationSource;
  PXGStackedSublayoutComposition *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedContentLayout;
  v6 = -[PXGCompositeLayout init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXFeedViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_253318);
    v8 = objc_alloc_init(PXFeedItemDecorationSource);
    decorationSource = v7->_decorationSource;
    v7->_decorationSource = v8;

    v10 = objc_alloc_init(PXGStackedSublayoutComposition);
    -[PXGCompositeLayout setComposition:](v7, "setComposition:", v10);

    -[PXFeedContentLayout _invalidateFeedSectionSublayouts](v7, "_invalidateFeedSectionSublayouts");
    -[PXFeedContentLayout _invalidateFeedSelectionSnapshot](v7, "_invalidateFeedSelectionSnapshot");
    -[PXFeedContentLayout _invalidateCompositionParameters](v7, "_invalidateCompositionParameters");
  }

  return v7;
}

- (int64_t)scrollableAxis
{
  void *v2;
  int64_t v3;

  -[PXGCompositeLayout composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axis");

  return v3;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  id v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXFeedContentLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectReferenceForObjectReference:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
    if (v9)
      objc_msgSend(v9, "indexPathForObjectReference:", v10);
    if (*(_QWORD *)off_1E50B7E98)
    {
      v11 = 0;
      v12 = v10;

      v7 = v12;
    }
    else
    {
LABEL_7:
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = objc_retainAutorelease(v7);
  *a5 = v13;

  return v11;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  PXFeedContentLayout *v16;
  id v17;
  id v18;
  SEL v19;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__PXFeedContentLayout_itemPlacementControllerForItemReference___block_invoke;
  v15 = &unk_1E513F2F8;
  v16 = self;
  v17 = v5;
  v18 = v6;
  v19 = a2;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateSublayoutsUsingBlock:", &v12);

  +[PXGMultiplexedItemPlacementController itemPlacementControllerForItemPlacementControllers:](PXGMultiplexedItemPlacementController, "itemPlacementControllerForItemPlacementControllers:", v8, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedContentLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXFeedContentLayout _invalidateCompositionParameters](self, "_invalidateCompositionParameters");
}

- (PXSimpleIndexPath)indexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  PXSimpleIndexPath *result;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _OWORD v24[2];

  -[PXFeedContentLayout viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a4->item;
  v24[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v24[1] = v12;
  objc_msgSend(v11, "objectReferenceAtIndexPath:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXFeedContentLayout.m"), 106, CFSTR("Cannot be nil"));

  }
  v23 = 0;
  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", -[PXFeedContentLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", v13, 0, &v23), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXFeedContentLayout.m"), 110, CFSTR("Cannot be nil"));

  }
  objc_msgSend(v14, "decoratedLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXFeedContentLayout.m"), 112, CFSTR("Cannot be nil"));

  }
  v16 = objc_msgSend(v15, "axSpriteIndexClosestToSpriteIndex:inDirection:", LODWORD(a4->item), a5);
  if (v16 == -1)
  {
    v17 = *(_OWORD *)off_1E50B8778;
    v18 = *((_OWORD *)off_1E50B8778 + 1);
  }
  else
  {
    a4->item = v16;
    v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    v18 = *(_OWORD *)&a4->item;
  }
  *(_OWORD *)&retstr->dataSourceIdentifier = v17;
  *(_OWORD *)&retstr->item = v18;

  return result;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXFeedContentLayout.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXFeedContentLayout _updateFeedSectionSublayouts](self, "_updateFeedSectionSublayouts");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXFeedContentLayout.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXFeedContentLayout _updateFeedSelectionSnapshot](self, "_updateFeedSelectionSnapshot");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXFeedContentLayout.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXFeedContentLayout _updateCompositionParameters](self, "_updateCompositionParameters");
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXFeedContentLayout.m"), 134, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXFeedContentLayout;
  -[PXGCompositeLayout update](&v15, sel_update);
}

- (void)_invalidateFeedSectionSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout _invalidateFeedSectionSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedContentLayout.m"), 139, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFeedSectionSublayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  -[PXFeedContentLayout presentedDataSource](self, "presentedDataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceChangeHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coalescedChangeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v11, "identifier"), objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", v7, objc_msgSend(v4, "numberOfSections"), self);
  objc_msgSend(v6, "sectionsWithItemChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PXFeedContentLayout__updateFeedSectionSublayouts__block_invoke;
  v12[3] = &unk_1E51489A0;
  v12[4] = self;
  v13 = v4;
  v14 = v6;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);

  -[PXFeedItemDecorationSource setDataSource:section:](self->_decorationSource, "setDataSource:section:", v10, 0);
  -[PXFeedContentLayout setPresentedDataSource:](self, "setPresentedDataSource:", v10);

}

- (void)_invalidateFeedSelectionSnapshot
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout _invalidateFeedSelectionSnapshot]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedContentLayout.m"), 160, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFeedSelectionSnapshot
{
  void *v3;
  id v4;

  -[PXFeedContentLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedItemDecorationSource setSelectionSnapshot:](self->_decorationSource, "setSelectionSnapshot:", v3);

}

- (void)_invalidateCompositionParameters
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedContentLayout _invalidateCompositionParameters]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedContentLayout.m"), 169, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateCompositionParameters
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PXGCompositeLayout composition](self, "composition");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsEmbeddedScrollView");

  if (v4)
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  }
  else
  {
    v5 = *(double *)off_1E50B8020;
    v6 = *((double *)off_1E50B8020 + 1);
    v7 = *((double *)off_1E50B8020 + 2);
    v8 = *((double *)off_1E50B8020 + 3);
  }
  objc_msgSend(v12, "setPadding:", v5, v6, v7, v8);
  -[PXFeedContentLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAxis:", objc_msgSend(v11, "axis"));

}

- (int64_t)anchoredSublayoutIndex
{
  objc_super v4;

  if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") == 1)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PXFeedContentLayout;
  return -[PXGLayout anchoredSublayoutIndex](&v4, sel_anchoredSublayoutIndex);
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  PXFeedSectionContentLayout *v8;
  PXGDecoratingLayout *v9;
  _QWORD v11[2];
  int64x2_t v12;

  -[PXFeedContentLayout viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = objc_msgSend(v7, "identifier");
  v11[1] = a4;
  v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v8 = -[PXFeedSectionContentLayout initWithViewModel:dataSource:sectionIndexPath:]([PXFeedSectionContentLayout alloc], "initWithViewModel:dataSource:sectionIndexPath:", v6, v7, v11);
  v9 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v8);
  -[PXGDecoratingLayout setActiveDecorations:](v9, "setActiveDecorations:", &unk_1E53EAA88);
  -[PXGDecoratingLayout setContentSource:](v9, "setContentSource:", self->_decorationSource);
  -[PXGDecoratingLayout setDecorationSource:](v9, "setDecorationSource:", self->_decorationSource);
  -[PXFeedItemDecorationSource setDecoratedLayout:](self->_decorationSource, "setDecoratedLayout:", v8);

  return v9;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)ViewModelObservationContext_253318 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedContentLayout.m"), 232, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_4;
LABEL_8:
    -[PXFeedContentLayout _invalidateFeedSelectionSnapshot](self, "_invalidateFeedSelectionSnapshot");
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[PXFeedContentLayout _invalidateFeedSectionSublayouts](self, "_invalidateFeedSectionSublayouts");
  if ((v6 & 4) != 0)
    goto LABEL_8;
LABEL_4:
  if ((v6 & 8) != 0)
LABEL_5:
    -[PXFeedContentLayout _invalidateCompositionParameters](self, "_invalidateCompositionParameters");
LABEL_6:

}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXFeedItemDecorationSource)decorationSource
{
  return self->_decorationSource;
}

- (PXSectionedDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (void)setPresentedDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentedDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_decorationSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __51__PXFeedContentLayout__updateFeedSectionSublayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", a2, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decoratedLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:changeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __63__PXFeedContentLayout_itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "decoratedLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemPlacementControllerForItemReference:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    v5 = v6;
  }

}

@end
