@implementation PXAlbumSectionHeaderLayoutProvider

- (PXAlbumSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7;
  id v8;
  PXAlbumSectionHeaderLayoutProvider *v9;
  PXAlbumSectionHeaderLayoutProvider *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  UIImage *gradientImage;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXAlbumSectionHeaderLayoutProvider;
  v9 = -[PXAlbumSectionHeaderLayoutProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "enableTitleLegibilityDimmingFilter"))
      v12 = CFSTR("PXHeaderGradient2");
    else
      v12 = CFSTR("PXHeaderGradient");
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    gradientImage = v10->_gradientImage;
    v10->_gradientImage = (UIImage *)v13;

    v10->_allowsFloatingBackground = 1;
  }

  return v10;
}

- (PXAlbumSectionHeaderLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 146, CFSTR("%s is not available as initializer"), "-[PXAlbumSectionHeaderLayoutProvider init]");

  abort();
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11;
  id v12;
  _PXAlbumSectionHeaderLayout *v13;
  __int128 v14;
  void *v15;
  double v16;
  _OWORD v18[2];

  v11 = a6;
  v12 = a4;
  v13 = -[_PXAlbumSectionHeaderLayout initWithSpec:]([_PXAlbumSectionHeaderLayout alloc], "initWithSpec:", v11);

  -[_PXAlbumSectionHeaderLayout setDataSource:](v13, "setDataSource:", v12);
  v14 = *(_OWORD *)&a5->item;
  v18[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v18[1] = v14;
  -[_PXAlbumSectionHeaderLayout setSectionIndexPath:](v13, "setSectionIndexPath:", v18);
  -[PXGSingleViewLayout setStyle:](v13, "setStyle:", 2);
  -[PXGSingleViewLayout setContentViewClass:](v13, "setContentViewClass:", objc_opt_class());
  -[PXGSingleViewLayout setDelegate:](v13, "setDelegate:", self);
  -[_PXAlbumSectionHeaderLayout setInteractionDelegate:](v13, "setInteractionDelegate:", self);
  -[PXAlbumSectionHeaderLayoutProvider viewProvider](self, "viewProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXAlbumSectionHeaderLayout setViewProvider:](v13, "setViewProvider:", v15);

  LODWORD(v16) = -1080452710;
  -[PXGSingleViewLayout setZPosition:](v13, "setZPosition:", v16);
  -[_PXAlbumSectionHeaderLayout setAllowsFloatingBackground:](v13, "setAllowsFloatingBackground:", -[PXAlbumSectionHeaderLayoutProvider allowsFloatingBackground](self, "allowsFloatingBackground"));
  if (-[PXAlbumSectionHeaderLayoutProvider editorialStyle](self, "editorialStyle"))
  {
    *a7 = 3;
    -[_PXAlbumSectionHeaderLayout setAlwaysWantsBackground:](v13, "setAlwaysWantsBackground:", 1);
  }
  else
  {
    *a7 = 1;
  }
  return v13;
}

- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  __int128 v11;
  _OWORD v12[2];

  v7 = a7;
  v10 = a4;
  objc_msgSend(v10, "setDataSource:", a5);
  v11 = *(_OWORD *)&a6->item;
  v12[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v12[1] = v11;
  objc_msgSend(v10, "setSectionIndexPath:", v12);
  if (v7)
    objc_msgSend(v10, "viewContentDidChange");

}

- (id)configurationForSingleViewLayout:(id)a3
{
  id v4;
  _PXPhotosSectionHeaderViewConfiguration *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v4 = a3;
  v5 = objc_alloc_init(_PXPhotosSectionHeaderViewConfiguration);
  v39 = 0;
  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  if (v4)
    objc_msgSend(v4, "sectionIndexPath");
  v35 = 0;
  v36 = 0;
  v33 = 0;
  v34 = 0;
  v31 = v37;
  v32 = v38;
  _PXGetSectionHeaderData(v6, &v31, &v36, &v35, &v34, &v33, &v39);
  v7 = v36;
  v8 = v35;
  v9 = v34;
  v10 = v33;
  -[_PXPhotosSectionHeaderViewConfiguration setTitle:](v5, "setTitle:", v7);
  -[_PXPhotosSectionHeaderViewConfiguration setStartDate:](v5, "setStartDate:", v8);
  -[_PXPhotosSectionHeaderViewConfiguration setEndDate:](v5, "setEndDate:", v9);
  -[_PXPhotosSectionHeaderViewConfiguration setLocationNames:](v5, "setLocationNames:", v10);

  if (-[PXAlbumSectionHeaderLayoutProvider editorialStyle](self, "editorialStyle"))
    v11 = 2;
  else
    v11 = 0;
  -[_PXPhotosSectionHeaderViewConfiguration setHeaderStyle:](v5, "setHeaderStyle:", v11);
  objc_msgSend(v4, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionHeaderSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "padding");
  -[_PXPhotosSectionHeaderViewConfiguration setEdgeInsets:](v5, "setEdgeInsets:");

  objc_msgSend(v4, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visualEffectViewGroupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosSectionHeaderViewConfiguration setBackdropViewGroupName:](v5, "setBackdropViewGroupName:", v15);

  if (-[PXAlbumSectionHeaderLayoutProvider editorialStyle](self, "editorialStyle"))
  {
    -[_PXPhotosSectionHeaderViewConfiguration setGradientImage:](v5, "setGradientImage:", 0);
  }
  else
  {
    -[PXAlbumSectionHeaderLayoutProvider gradientImage](self, "gradientImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXPhotosSectionHeaderViewConfiguration setGradientImage:](v5, "setGradientImage:", v16);

  }
  objc_msgSend(v4, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionHeaderSpec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gradientAlpha");
  -[_PXPhotosSectionHeaderViewConfiguration setGradientAlpha:](v5, "setGradientAlpha:");

  objc_msgSend(v4, "spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionHeaderSpec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gradientOverhang");
  -[_PXPhotosSectionHeaderViewConfiguration setGradientOverhang:](v5, "setGradientOverhang:");

  objc_msgSend(v4, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionHeaderSpec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "curatedLibraryHeaderSpec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosSectionHeaderViewConfiguration setButtonSpec:](v5, "setButtonSpec:", v23);

  if (objc_msgSend(v4, "allowsFloatingBackground"))
    v24 = 1;
  else
    v24 = 2;
  -[_PXPhotosSectionHeaderViewConfiguration setBackgroundStyle:](v5, "setBackgroundStyle:", v24);
  if (objc_msgSend(v4, "isInSelectMode"))
  {
    v25 = 0;
    if (objc_msgSend(v4, "areAllItemsSelected"))
      v26 = 2;
    else
      v26 = 1;
  }
  else
  {
    -[PXAlbumSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v37;
    v32 = v38;
    objc_msgSend(v6, "assetCollectionReferenceAtSectionIndexPath:", &v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "allowsShowDetails"))
    {
      objc_msgSend(v27, "assetCollectionActionManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v29, "canPerformActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeShowDetails"), v28);

    }
    else
    {
      v25 = 0;
    }

    v26 = v39;
  }
  -[_PXPhotosSectionHeaderViewConfiguration setActionType:](v5, "setActionType:", v26);
  -[_PXPhotosSectionHeaderViewConfiguration setAllowsPhotosDetailsInteraction:](v5, "setAllowsPhotosDetailsInteraction:", v25);

  return v5;
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double width;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40[2];
  uint64_t v41;
  CGSize result;

  width = a4.width;
  v5 = a3;
  v41 = 0;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "sectionIndexPath");
  else
    memset(v40, 0, sizeof(v40));
  v38 = 0;
  v39 = 0;
  v36 = 0;
  v37 = 0;
  _PXGetSectionHeaderData(v6, v40, &v39, &v38, &v37, &v36, &v41);
  v7 = v39;
  v8 = v38;
  v9 = v37;
  v10 = v36;

  objc_msgSend(v5, "userData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v7, "length");
  if (v8)
    v12 = v9 == 0;
  else
    v12 = 1;
  v13 = !v12;
  v32 = objc_msgSend(v10, "count");
  if (v41)
    v34 = 1;
  else
    v34 = objc_msgSend(v5, "isInSelectMode");
  v31 = objc_msgSend(v11, "allowsPhotosDetailsInteraction");
  v35 = objc_msgSend(v11, "headerStyle");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  +[PXPhotosSectionHeaderMetrics sharedMetrics](PXPhotosSectionHeaderMetrics, "sharedMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v5, "spec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sectionHeaderSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "curatedLibraryHeaderSpec");
    v21 = v10;
    v22 = v9;
    v23 = v8;
    v24 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessibilitySectionHeaderHeightForStyle:width:actionButton:disclosure:title:startDate:endDate:locations:actionButtonSpec:", v35, v34, v31, v24, v23, v22, width, v21, v25);
    v27 = v26;

    v7 = v24;
    v8 = v23;
    v9 = v22;
    v10 = v21;

  }
  else
  {
    objc_msgSend(v17, "sectionHeaderHeightForStyle:hasTitle:hasDates:hasLocation:", v35, v33 != 0, v13, v32 != 0);
    v27 = v28;
  }

  v29 = width;
  v30 = v27;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)didTapSectionHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  _OWORD v13[2];

  v4 = a3;
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "sectionIndexPath");
  else
    memset(v13, 0, sizeof(v13));
  objc_msgSend(v5, "assetCollectionReferenceAtSectionIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAlbumSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionPerformerForActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeShowDetails"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLGridZeroGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Will present details view from photos grid header tap", v12, 2u);
    }

    objc_msgSend(v9, "performActionWithCompletionHandler:", &__block_literal_global_278476);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "No action performer found for presenting details", v12, 2u);
    }

  }
}

- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _OWORD v18[2];
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;

  v6 = a3;
  -[PXAlbumSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  if (v6)
    objc_msgSend(v6, "sectionIndexPath");
  else
    memset(v19, 0, sizeof(v19));
  objc_msgSend(v6, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "convertIndexPath:fromSectionedDataSource:", v19, v11);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }

  v18[0] = v20;
  v18[1] = v21;
  objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIndexPathsForSections:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleSelectedState___block_invoke;
  v15[3] = &unk_1E5144348;
  v17 = a4;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v8, "performChanges:", v15);

}

- (void)sectionHeader:(id)a3 didToggleFiltersDisabled:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _OWORD v15[2];

  v6 = a3;
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "sectionIndexPath");
  else
    memset(v15, 0, sizeof(v15));
  objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAlbumSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleFiltersDisabled___block_invoke;
  v12[3] = &unk_1E5144370;
  v14 = a4;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "performChanges:", v12);

}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  return (PXPhotosSectionHeaderLayoutViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (BOOL)editorialStyle
{
  return self->_editorialStyle;
}

- (void)setEditorialStyle:(BOOL)a3
{
  self->_editorialStyle = a3;
}

- (BOOL)allowsFloatingBackground
{
  return self->_allowsFloatingBackground;
}

- (void)setAllowsFloatingBackground:(BOOL)a3
{
  self->_allowsFloatingBackground = a3;
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __77__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleFiltersDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFilteringDisabled:forAssetCollection:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleSelectedState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedState:forIndexPathSet:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__PXAlbumSectionHeaderLayoutProvider_didTapSectionHeader___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLGridZeroGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to present details view from photos grid header tap, error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

@end
