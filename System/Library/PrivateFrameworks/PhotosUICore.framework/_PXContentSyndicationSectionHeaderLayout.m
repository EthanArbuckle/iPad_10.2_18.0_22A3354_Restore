@implementation _PXContentSyndicationSectionHeaderLayout

- (_PXContentSyndicationSectionHeaderLayout)initWithSpec:(id)a3 socialLayerHighlightProvider:(id)a4
{
  id v7;
  id v8;
  _PXContentSyndicationSectionHeaderLayout *v9;
  _PXContentSyndicationSectionHeaderLayout *v10;
  PXContentSyndicationSectionHeaderView *v11;
  uint64_t v12;
  PXContentSyndicationSectionHeaderView *sectionHeaderContentView;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXContentSyndicationSectionHeaderLayout;
  v9 = -[PXGSingleViewLayout init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    objc_storeStrong((id *)&v10->_socialLayerHighlightProvider, a4);
    v11 = [PXContentSyndicationSectionHeaderView alloc];
    v12 = -[PXContentSyndicationSectionHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sectionHeaderContentView = v10->_sectionHeaderContentView;
    v10->_sectionHeaderContentView = (PXContentSyndicationSectionHeaderView *)v12;

    -[PXContentSyndicationSectionHeaderView setDelegate:](v10->_sectionHeaderContentView, "setDelegate:", v10);
    -[PXGSingleViewLayout setContentView:](v10, "setContentView:", v10->_sectionHeaderContentView);
    -[PXPhotosLayoutSpec sectionHeaderSpec](v10->_spec, "sectionHeaderSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationSectionHeaderView setSpec:](v10->_sectionHeaderContentView, "setSpec:", v14);

  }
  return v10;
}

- (_PXContentSyndicationSectionHeaderLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationSectionHeaderLayoutProvider.m"), 120, CFSTR("%s is not available as initializer"), "-[_PXContentSyndicationSectionHeaderLayout init]");

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

- (void)setDataSource:(id)a3
{
  PXAssetsDataSource *v5;
  PXAssetsDataSource *v6;
  char v7;
  PXAssetsDataSource *v8;

  v8 = (PXAssetsDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetsDataSource isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      -[_PXContentSyndicationSectionHeaderLayout _updateReferenceAssetForHighlightIfNeeded](self, "_updateReferenceAssetForHighlightIfNeeded");
    }
  }

}

- (void)setReferenceAssetForHighlight:(id)a3
{
  PXDisplayAsset **p_referenceAssetForHighlight;
  PXDisplayAsset *v6;
  void *v7;
  PXDisplayAsset *v8;
  char v9;
  void *v10;
  PXDisplayAsset *v11;

  v11 = (PXDisplayAsset *)a3;
  p_referenceAssetForHighlight = &self->_referenceAssetForHighlight;
  v6 = self->_referenceAssetForHighlight;
  v7 = v11;
  if (v6 == v11)
    goto LABEL_7;
  v8 = v6;
  v9 = -[PXDisplayAsset isEqual:](v6, "isEqual:");

  if ((v9 & 1) == 0)
  {
    if (*p_referenceAssetForHighlight)
    {
      -[_PXContentSyndicationSectionHeaderLayout socialLayerHighlightProvider](self, "socialLayerHighlightProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unregisterChangeObserver:forAsset:", self, *p_referenceAssetForHighlight);

    }
    objc_storeStrong((id *)&self->_referenceAssetForHighlight, a3);
    if (*p_referenceAssetForHighlight)
    {
      -[_PXContentSyndicationSectionHeaderLayout socialLayerHighlightProvider](self, "socialLayerHighlightProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerChangeObserver:forAsset:", self, *p_referenceAssetForHighlight);
LABEL_7:

    }
  }

}

- (void)_updateReferenceAssetForHighlightIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  -[_PXContentSyndicationSectionHeaderLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  if (v4)
  {
    v10 = 0u;
    v11 = 0u;
    -[_PXContentSyndicationSectionHeaderLayout dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "firstItemIndexPath");
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
    }

    -[_PXContentSyndicationSectionHeaderLayout dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v10;
    v9[1] = v11;
    objc_msgSend(v7, "assetAtItemIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PXContentSyndicationSectionHeaderLayout setReferenceAssetForHighlight:](self, "setReferenceAssetForHighlight:", v8);
  }
  else
  {
    -[_PXContentSyndicationSectionHeaderLayout setReferenceAssetForHighlight:](self, "setReferenceAssetForHighlight:", 0);
  }
}

- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5
{
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v7 = a4;
  -[PXGSingleViewLayout contentView](self, "contentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationSectionHeaderLayoutProvider.m"), 171, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.contentView"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationSectionHeaderLayoutProvider.m"), 171, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.contentView"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "setSocialLayerHighlight:", v7);

  -[PXGSingleViewLayout viewSizeDidChange](self, "viewSizeDidChange");
}

- (id)additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  __CFString *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXContentSyndicationSectionHeaderLayout assetCollectionManager](self, "assetCollectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canPerformActionType:", CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion")))
  {
    objc_msgSend(v7, "localizedTitleForActionType:useCase:", CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3428];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __121___PXContentSyndicationSectionHeaderLayout_additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView___block_invoke;
    v16 = &unk_1E513F280;
    v17 = v7;
    v10 = CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion");
    v18 = CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion");
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, v6, 0, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11, v13, v14, v15, v16);

  }
  return v4;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->_isInSelectMode = a3;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSnapshot, a3);
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[33].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].subitem;
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

- (PXContentSyndicationSocialLayerHighlightProvider)socialLayerHighlightProvider
{
  return self->_socialLayerHighlightProvider;
}

- (PXDisplayAsset)referenceAssetForHighlight
{
  return self->_referenceAssetForHighlight;
}

- (PXContentSyndicationSectionHeaderView)sectionHeaderContentView
{
  return self->_sectionHeaderContentView;
}

- (void)setSectionHeaderContentView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderContentView, a3);
}

- (SLHighlight)socialLayerHighlight
{
  return self->_socialLayerHighlight;
}

- (void)setSocialLayerHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_socialLayerHighlight, a3);
}

- (PXAssetCollectionActionManager)assetCollectionManager
{
  return self->_assetCollectionManager;
}

- (void)setAssetCollectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionManager, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_sectionHeaderContentView, 0);
  objc_storeStrong((id *)&self->_referenceAssetForHighlight, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlightProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
