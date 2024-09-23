@implementation _PXAlbumSectionHeaderLayout

- (_PXAlbumSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5;
  _PXAlbumSectionHeaderLayout *v6;
  _PXAlbumSectionHeaderLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAlbumSectionHeaderLayout;
  v6 = -[PXGSingleViewLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_allowsFloatingBackground = 1;
  }

  return v7;
}

- (_PXAlbumSectionHeaderLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 303, CFSTR("%s is not available as initializer"), "-[_PXAlbumSectionHeaderLayout init]");

  abort();
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
    -[PXGSingleViewLayout viewContentDidChange](self, "viewContentDidChange");
    v5 = v6;
  }

}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
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
      -[_PXAlbumSectionHeaderLayout sectionIndexPath](self, "sectionIndexPath");
      objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemIndexPathsForSections:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXSelectionSnapshot selectedIndexPaths](v5, "selectedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSupersetOfSet:", v11);

      -[_PXAlbumSectionHeaderLayout _setAreAllItemsSelected:](self, "_setAreAllItemsSelected:", v13);
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

- (void)setAlwaysWantsBackground:(BOOL)a3
{
  if (self->_alwaysWantsBackground != a3)
  {
    self->_alwaysWantsBackground = a3;
    -[_PXAlbumSectionHeaderLayout _updateWantsBackground](self, "_updateWantsBackground");
  }
}

- (void)setAllowsFloatingBackground:(BOOL)a3
{
  if (self->_allowsFloatingBackground != a3)
  {
    self->_allowsFloatingBackground = a3;
    -[_PXAlbumSectionHeaderLayout _updateWantsBackground](self, "_updateWantsBackground");
  }
}

- (void)floatingOffsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXAlbumSectionHeaderLayout;
  -[PXGLayout floatingOffsetDidChange](&v3, sel_floatingOffsetDidChange);
  -[_PXAlbumSectionHeaderLayout _updateWantsBackground](self, "_updateWantsBackground");
}

- (void)_updateWantsBackground
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[5];
  BOOL v12;

  -[_PXAlbumSectionHeaderLayout viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewLayout viewSpriteReference](self, "viewSpriteReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderLayout:viewForSpriteReference:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v5;
  else
    v10 = 0;

  if (-[_PXAlbumSectionHeaderLayout alwaysWantsBackground](self, "alwaysWantsBackground"))
  {
    v6 = 1;
  }
  else
  {
    -[PXGLayout floatingOffset](self, "floatingOffset");
    v8 = v7;
    objc_msgSend(v10, "baselineToBottomSpacing");
    v6 = v8 > v9;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___PXAlbumSectionHeaderLayout__updateWantsBackground__block_invoke;
  v11[3] = &unk_1E5144398;
  v11[4] = self;
  v12 = v6;
  -[PXGLayout performChangesWithLocalUpdate:](self, "performChangesWithLocalUpdate:", v11);

}

- (void)didTapHeaderView:(id)a3
{
  id v4;

  -[_PXAlbumSectionHeaderLayout interactionDelegate](self, "interactionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapSectionHeader:", self);

}

- (void)headerView:(id)a3 actionButtonPressed:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _PXAlbumSectionHeaderLayout *v11;
  uint64_t v12;
  void *v13;
  _PXAlbumSectionHeaderLayout *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  objc_msgSend(v22, "userData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[(id<PXGReusableView>)headerView userData]"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[(id<PXGReusableView>)headerView userData]"), v18);
  }

LABEL_3:
  switch(objc_msgSend(v8, "actionType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 400, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[_PXAlbumSectionHeaderLayout interactionDelegate](self, "interactionDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = self;
      v12 = 1;
      goto LABEL_6;
    case 2:
      -[_PXAlbumSectionHeaderLayout interactionDelegate](self, "interactionDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = self;
      v12 = 0;
LABEL_6:
      objc_msgSend(v9, "sectionHeader:didToggleSelectedState:", v11, v12);
      goto LABEL_10;
    case 3:
      -[_PXAlbumSectionHeaderLayout interactionDelegate](self, "interactionDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v14 = self;
      v15 = 1;
      goto LABEL_9;
    case 4:
      -[_PXAlbumSectionHeaderLayout interactionDelegate](self, "interactionDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v14 = self;
      v15 = 0;
LABEL_9:
      objc_msgSend(v13, "sectionHeader:didToggleFiltersDisabled:", v14, v15);
LABEL_10:

      break;
    default:
      break;
  }

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

- (BOOL)areAllItemsSelected
{
  return self->_areAllItemsSelected;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
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

- (_PXAlbumSectionHeaderLayoutInteractionDelegate)interactionDelegate
{
  return (_PXAlbumSectionHeaderLayoutInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
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

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (BOOL)alwaysWantsBackground
{
  return self->_alwaysWantsBackground;
}

- (BOOL)allowsFloatingBackground
{
  return self->_allowsFloatingBackground;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
