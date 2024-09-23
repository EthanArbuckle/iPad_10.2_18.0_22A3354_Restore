@implementation PXActionableSectionHeaderLayout

- (PXActionableSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5;
  PXActionableSectionHeaderLayout *v6;
  PXActionableSectionHeaderLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXActionableSectionHeaderLayout;
  v6 = -[PXGSingleViewLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spec, a3);

  return v7;
}

- (PXActionableSectionHeaderLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 464, CFSTR("%s is not available as initializer"), "-[PXActionableSectionHeaderLayout init]");

  abort();
}

- (BOOL)isTopHeader
{
  uint64_t v3;

  -[PXActionableSectionHeaderLayout sectionIndexPath](self, "sectionIndexPath");
  return v3 == *(_QWORD *)off_1E50B7E98;
}

- (void)setSpec:(id)a3
{
  PXPhotosLayoutSpec *v5;
  PXPhotosLayoutSpec *v6;

  v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXGSingleViewLayout viewSizeDidChange](self, "viewSizeDidChange");
    -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
    v5 = v6;
  }

}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    -[PXGSingleViewLayout viewSizeDidChange](self, "viewSizeDidChange");
    -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  PXSelectionSnapshot *v6;
  PXSelectionSnapshot *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = (PXSelectionSnapshot *)a3;
  v6 = self->_selectionSnapshot;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXSelectionSnapshot isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      -[PXSelectionSnapshot dataSource](v5, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionableSectionHeaderLayout sectionIndexPath](self, "sectionIndexPath");
      objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemIndexPathsForSections:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXSelectionSnapshot selectedIndexPaths](v5, "selectedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSupersetOfSet:", v11);

      -[PXActionableSectionHeaderLayout _setAreAllItemsSelected:](self, "_setAreAllItemsSelected:", v13);
    }
  }

}

- (void)_setAreAllItemsSelected:(BOOL)a3
{
  if (self->_areAllItemsSelected != a3)
  {
    self->_areAllItemsSelected = a3;
    -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
  }
}

- (void)_setWantsBackground:(BOOL)a3
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
  }
}

- (void)scrollSpeedRegimeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXActionableSectionHeaderLayout;
  -[PXGLayout scrollSpeedRegimeDidChange](&v3, sel_scrollSpeedRegimeDidChange);
  -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
}

- (void)floatingOffsetDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXActionableSectionHeaderLayout;
  -[PXGLayout floatingOffsetDidChange](&v13, sel_floatingOffsetDidChange);
  -[PXActionableSectionHeaderLayout viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewLayout viewSpriteReference](self, "viewSpriteReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderLayout:viewForSpriteReference:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "backgroundStyle");
  -[PXGLayout floatingOffset](self, "floatingOffset");
  v8 = v7;
  v9 = 0.0;
  if (v6 != 3)
    objc_msgSend(v5, "baselineToBottomSpacing", 0.0);
  v10 = v8 > v9 || -[PXActionableSectionHeaderLayout alwaysWantsBackground](self, "alwaysWantsBackground");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PXActionableSectionHeaderLayout_floatingOffsetDidChange__block_invoke;
  v11[3] = &unk_1E5144398;
  v11[4] = self;
  v12 = v10;
  -[PXGLayout performChangesWithLocalUpdate:](self, "performChangesWithLocalUpdate:", v11);

}

- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v7 = a3;
  objc_msgSend(a4, "userData");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 538, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[(id<PXGReusableView>)headerView userData]"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 538, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[(id<PXGReusableView>)headerView userData]"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  -[PXActionableSectionHeaderLayout interactionDelegate](self, "interactionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionHeader:didPressButtonForActionType:sender:", self, objc_msgSend(v14, "actionType"), v7);

}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXAssetsDataSource)dataSource
{
  return (PXAssetsDataSource *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (BOOL)areAllItemsSelected
{
  return self->_areAllItemsSelected;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (BOOL)alwaysWantsBackground
{
  return self->_alwaysWantsBackground;
}

- (void)setAlwaysWantsBackground:(BOOL)a3
{
  self->_alwaysWantsBackground = a3;
}

- (PXActionableSectionHeaderLayoutInteractionDelegate)interactionDelegate
{
  return (PXActionableSectionHeaderLayoutInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  return (PXPhotosSectionHeaderLayoutViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (void)setViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __58__PXActionableSectionHeaderLayout_floatingOffsetDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWantsBackground:", *(unsigned __int8 *)(a1 + 40));
}

@end
