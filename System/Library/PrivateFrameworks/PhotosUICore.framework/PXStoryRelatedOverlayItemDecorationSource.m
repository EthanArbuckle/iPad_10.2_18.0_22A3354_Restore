@implementation PXStoryRelatedOverlayItemDecorationSource

- (PXStoryRelatedOverlayItemDecorationSource)initWithViewModel:(id)a3
{
  id v5;
  PXStoryRelatedOverlayItemDecorationSource *v6;
  PXStoryRelatedOverlayItemDecorationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
  v6 = -[PXStoryController initWithObservableModel:](&v9, sel_initWithObservableModel_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[PXStoryViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_285078);
  }

  return v7;
}

- (PXStoryRelatedOverlayItemDecorationSource)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayItemDecorationSource.m"), 39, CFSTR("%s is not available as initializer"), "-[PXStoryRelatedOverlayItemDecorationSource initWithObservableModel:]");

  abort();
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateSelectedRelatedIndex, v4.receiver, v4.super_class);

}

- (void)setDecoratedLayout:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    -[PXStoryRelatedOverlayItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    v5 = obj;
  }

}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  id v3;
  void *v5;
  unsigned int v6;

  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  else
  {
    -[PXStoryRelatedOverlayItemDecorationSource decoratedLayout](self, "decoratedLayout", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "relatedSelectionSpriteIndexRange");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", self->_selectedIndex + v6);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = *(float *)off_1E50B8290;
  v5 = *((float *)off_1E50B8290 + 1);
  v6 = *((float *)off_1E50B8290 + 2);
  v7 = *((float *)off_1E50B8290 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_invalidateSelectedRelatedIndex
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSelectedRelatedIndex);

}

- (void)_updateSelectedRelatedIndex
{
  void *v3;
  uint64_t v4;
  int64_t selectedIndex;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL8 v11;
  id v12;

  -[PXStoryRelatedOverlayItemDecorationSource viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "highlightedRelatedIndex");
  selectedIndex = self->_selectedIndex;

  if (v4 != selectedIndex)
  {
    -[PXStoryRelatedOverlayItemDecorationSource viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedIndex = objc_msgSend(v6, "highlightedRelatedIndex");

    -[PXStoryRelatedOverlayItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = self->_selectedIndex;
    v11 = v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0;
    objc_msgSend(v7, "showOrHideFullRelated:", v11);

    -[PXStoryRelatedOverlayItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateDecoration");

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[5];

  v8 = a3;
  if ((void *)ViewModelObservationContext_285078 == a5)
  {
    if ((a4 & 0x100000000000000) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__PXStoryRelatedOverlayItemDecorationSource_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5146DD8;
      v10[4] = self;
      -[PXStoryController performChanges:](self, "performChanges:", v10);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryRelatedOverlayItemDecorationSource;
    -[PXStoryController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXStoryRelatedOverlayLayout)decoratedLayout
{
  return (PXStoryRelatedOverlayLayout *)objc_loadWeakRetained((id *)&self->_decoratedLayout);
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
}

uint64_t __74__PXStoryRelatedOverlayItemDecorationSource_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectedRelatedIndex");
}

@end
