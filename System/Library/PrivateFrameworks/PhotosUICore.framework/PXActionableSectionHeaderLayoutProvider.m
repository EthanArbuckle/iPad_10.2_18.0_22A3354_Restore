@implementation PXActionableSectionHeaderLayoutProvider

- (PXActionableSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7;
  id v8;
  PXActionableSectionHeaderLayoutProvider *v9;
  PXActionableSectionHeaderLayoutProvider *v10;
  PXActionableSectionHeaderView *v11;
  uint64_t v12;
  PXActionableSectionHeaderView *referenceHeaderView;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  UIImage *gradientImage;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXActionableSectionHeaderLayoutProvider;
  v9 = -[PXActionableSectionHeaderLayoutProvider init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
    v11 = [PXActionableSectionHeaderView alloc];
    v12 = -[PXActionableSectionHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    referenceHeaderView = v10->_referenceHeaderView;
    v10->_referenceHeaderView = (PXActionableSectionHeaderView *)v12;

    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "enableTitleLegibilityDimmingFilter"))
      v15 = CFSTR("PXHeaderGradient2");
    else
      v15 = CFSTR("PXHeaderGradient");
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    gradientImage = v10->_gradientImage;
    v10->_gradientImage = (UIImage *)v16;

  }
  return v10;
}

- (PXActionableSectionHeaderLayoutProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 94, CFSTR("%s is not available as initializer"), "-[PXActionableSectionHeaderLayoutProvider init]");

  abort();
}

- (BOOL)wantsTopHeaderForDataSource:(id)a3
{
  return 0;
}

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 1;
}

- (id)primaryTopHeaderTextForDataSource:(id)a3
{
  return 0;
}

- (id)secondaryTopHeaderTextForDataSource:(id)a3
{
  return 0;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 0;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 0;
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;
  void *v11;

  v6 = a4;
  switch(a3)
  {
    case 1:
      v7 = CFSTR("PXPhotosGridsSectionSelectButton");
      goto LABEL_7;
    case 2:
      v7 = CFSTR("PXPhotosGridsSectionDeselectButton");
      goto LABEL_7;
    case 3:
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 146, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 6:
      v8 = CFSTR("checkmark.circle");
      break;
    case 7:
    case 9:
      v7 = CFSTR("PXPhotosGridsSectionEnterSelectModeButton");
      goto LABEL_7;
    case 8:
    case 10:
      v7 = CFSTR("PXPhotosGridsSectionLeaveSelectModeButton");
LABEL_7:
      PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "isInSelectMode") && (objc_msgSend(v3, "isTopHeader") & 1) == 0)
  {
    if (objc_msgSend(v3, "areAllItemsSelected"))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)actionVisibilityForHeaderLayout:(id)a3
{
  return 0;
}

- (id)_createSectionHeaderLayoutForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 spec:(id)a5 outAlignment:(unint64_t *)a6
{
  id v10;
  id v11;
  PXActionableSectionHeaderLayout *v12;
  __int128 v13;
  void *v14;
  double v15;
  _OWORD v17[2];

  v10 = a5;
  v11 = a3;
  v12 = -[PXActionableSectionHeaderLayout initWithSpec:]([PXActionableSectionHeaderLayout alloc], "initWithSpec:", v10);

  -[PXActionableSectionHeaderLayout setDataSource:](v12, "setDataSource:", v11);
  v13 = *(_OWORD *)&a4->item;
  v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v17[1] = v13;
  -[PXActionableSectionHeaderLayout setSectionIndexPath:](v12, "setSectionIndexPath:", v17);
  -[PXGSingleViewLayout setStyle:](v12, "setStyle:", 2);
  -[PXGSingleViewLayout setContentViewClass:](v12, "setContentViewClass:", objc_opt_class());
  -[PXGSingleViewLayout setDelegate:](v12, "setDelegate:", self);
  -[PXActionableSectionHeaderLayout setInteractionDelegate:](v12, "setInteractionDelegate:", self);
  -[PXActionableSectionHeaderLayoutProvider viewProvider](self, "viewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionableSectionHeaderLayout setViewProvider:](v12, "setViewProvider:", v14);

  LODWORD(v15) = -1080452710;
  -[PXGSingleViewLayout setZPosition:](v12, "setZPosition:", v15);
  -[PXActionableSectionHeaderLayout setAlwaysWantsBackground:](v12, "setAlwaysWantsBackground:", a4->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98);
  *a6 = 1;
  return v12;
}

- (void)_getPrimaryText:(id *)a3 secondaryText:(id *)a4 forLayout:(id)a5
{
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v8 = a5;
  v9 = objc_msgSend(v8, "isTopHeader");
  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXActionableSectionHeaderLayoutProvider primaryTopHeaderTextForDataSource:](self, "primaryTopHeaderTextForDataSource:", v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderLayoutProvider secondaryTopHeaderTextForDataSource:](self, "secondaryTopHeaderTextForDataSource:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      objc_msgSend(v8, "sectionIndexPath");
    else
      memset(v14, 0, sizeof(v14));
    -[PXActionableSectionHeaderLayoutProvider primaryTextForDataSource:sectionIndexPath:](self, "primaryTextForDataSource:sectionIndexPath:", v10, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "sectionIndexPath");
    else
      memset(v13, 0, sizeof(v13));
    -[PXActionableSectionHeaderLayoutProvider secondaryTextForDataSource:sectionIndexPath:](self, "secondaryTextForDataSource:sectionIndexPath:", v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *a4 = v12;

}

- (id)createTopHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 spec:(id)a5 outShouldFloat:(BOOL *)a6
{
  id v9;
  id v10;
  __int128 v11;
  void *v12;
  _OWORD v14[2];
  uint64_t v15;

  v9 = a4;
  v10 = a5;
  if (-[PXActionableSectionHeaderLayoutProvider wantsTopHeaderForDataSource:](self, "wantsTopHeaderForDataSource:", v9))
  {
    v15 = 0;
    v11 = *((_OWORD *)off_1E50B8778 + 1);
    v14[0] = *(_OWORD *)off_1E50B8778;
    v14[1] = v11;
    -[PXActionableSectionHeaderLayoutProvider _createSectionHeaderLayoutForDataSource:sectionIndexPath:spec:outAlignment:](self, "_createSectionHeaderLayoutForDataSource:sectionIndexPath:spec:outAlignment:", v9, v14, v10, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = v15 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)configureTopHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5
{
  objc_msgSend(a3, "viewContentDidChange");
}

- (void)topHeaderLayout:(id)a3 didChangeDataSource:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDataSource:", a4);
  objc_msgSend(v5, "viewContentDidChange");

}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v17;
  __int128 v18;

  v11 = a4;
  v12 = a6;
  v13 = *(_OWORD *)&a5->item;
  v17 = *(_OWORD *)&a5->dataSourceIdentifier;
  v18 = v13;
  if (-[PXActionableSectionHeaderLayoutProvider wantsHeaderForDataSource:sectionIndexPath:](self, "wantsHeaderForDataSource:sectionIndexPath:", v11, &v17))
  {
    v14 = *(_OWORD *)&a5->item;
    v17 = *(_OWORD *)&a5->dataSourceIdentifier;
    v18 = v14;
    -[PXActionableSectionHeaderLayoutProvider _createSectionHeaderLayoutForDataSource:sectionIndexPath:spec:outAlignment:](self, "_createSectionHeaderLayoutForDataSource:sectionIndexPath:spec:outAlignment:", v11, &v17, v12, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)configureSectionHeaderLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  objc_msgSend(a3, "viewContentDidChange");
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

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double width;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  _QWORD aBlock[4];
  id v56;
  id v57;
  id location;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  CGSize result;

  width = a4.width;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sectionIndexPath");
    v8 = v61;
  }
  else
  {
    v8 = 0;
    v61 = 0u;
    v62 = 0u;
  }
  if (v8 == *(_QWORD *)off_1E50B7E98)
  {
    v9 = 0.0;
    if ((objc_msgSend(v7, "isInSelectMode") & 1) != 0)
      goto LABEL_27;
  }
  v59 = 0;
  v60 = 0;
  -[PXActionableSectionHeaderLayoutProvider _getPrimaryText:secondaryText:forLayout:](self, "_getPrimaryText:secondaryText:forLayout:", &v60, &v59, v7);
  v10 = v60;
  v11 = v59;
  v12 = -[PXActionableSectionHeaderLayoutProvider actionTypeForHeaderLayout:](self, "actionTypeForHeaderLayout:", v7);
  objc_msgSend(v7, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionHeaderSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curatedLibraryHeaderSpec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackdropButtonSpec:", v15);

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPrimaryText:", v10);

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSecondaryText:", v11);

  objc_msgSend(v7, "spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionHeaderSpec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "padding");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentInsets:", v22, v24, v26, v28);

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSupportsMultipleLinesInCompactLayout:", 1);

  if (v12 < 6)
  {
    -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = 1;
LABEL_8:
    objc_msgSend(v31, "setButtonStyle:", v33);

LABEL_12:
    v35 = 0;
    goto LABEL_13;
  }
  if (v12 - 7 >= 4)
  {
    v35 = 0;
    if (v12 != 6)
      goto LABEL_13;
    -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = 3;
    goto LABEL_8;
  }
  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setButtonStyle:", 1);

  if (v12 - 9 > 1)
    goto LABEL_12;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXActionableSectionHeaderLayoutProvider_singleViewLayout_desiredSizeForReferenceSize___block_invoke;
  aBlock[3] = &unk_1E5131A80;
  objc_copyWeak(&v57, &location);
  v56 = v7;
  v35 = _Block_copy(aBlock);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
LABEL_13:
  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFilterButtonControllerFactory:", v35);

  objc_msgSend(v7, "dataSource");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "sectionIndexPath");
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
  }
  -[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:](self, "actionTextForActionType:dataSource:sectionIndexPath:", v12, v37, &v53);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(v38, "length");
  v40 = v39 != 0;
  v41 = v35 != 0;
  if (-[PXActionableSectionHeaderLayoutProvider actionVisibilityForHeaderLayout:](self, "actionVisibilityForHeaderLayout:", v7, v53, v54) == 1)
  {
    v42 = objc_msgSend(v7, "wantsBackground");
    if (v39)
      v40 = v42;
    else
      v40 = 0;
    if (v35)
      v41 = v42;
    else
      v41 = 0;
  }
  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setShowsActionButton:", v40);

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setShowsSecondaryButton:", v41);

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActionText:", v38);

  objc_msgSend(v7, "spec");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = PXHorizontalSizeClassFromFeatureSpec(v46);
  if (v47 == 2)
    v48 = 2;
  else
    v48 = v47 == 1;

  -[PXActionableSectionHeaderLayoutProvider referenceHeaderView](self, "referenceHeaderView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "heightForSizeClass:width:safeAreaInsets:", v48, width, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v9 = v50;

LABEL_27:
  v51 = width;
  v52 = v9;
  result.height = v52;
  result.width = v51;
  return result;
}

- (id)configurationForSingleViewLayout:(id)a3
{
  id v5;
  _PXActionableSectionHeaderViewConfiguration *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  SEL v45;
  void *v46;
  void *v47;
  id location[2];
  __int128 v49;
  _OWORD v50[2];
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[4];
  id v54;
  id v55;
  _OWORD v56[2];
  id v57;
  id v58[2];

  v5 = a3;
  v6 = objc_alloc_init(_PXActionableSectionHeaderViewConfiguration);
  v57 = 0;
  v58[0] = 0;
  -[PXActionableSectionHeaderLayoutProvider _getPrimaryText:secondaryText:forLayout:](self, "_getPrimaryText:secondaryText:forLayout:", v58, &v57, v5);
  v7 = v58[0];
  v8 = v57;
  -[_PXActionableSectionHeaderViewConfiguration setPrimaryText:](v6, "setPrimaryText:", v7);
  -[_PXActionableSectionHeaderViewConfiguration setSecondaryText:](v6, "setSecondaryText:", v8);
  objc_msgSend(v5, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionHeaderSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "padding");
  -[_PXActionableSectionHeaderViewConfiguration setEdgeInsets:](v6, "setEdgeInsets:");

  v11 = -[PXActionableSectionHeaderLayoutProvider actionTypeForHeaderLayout:](self, "actionTypeForHeaderLayout:", v5);
  objc_msgSend(v5, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "sectionIndexPath");
  else
    memset(v56, 0, sizeof(v56));
  -[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:](self, "actionTextForActionType:dataSource:sectionIndexPath:", v11, v12, v56);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PXActionableSectionHeaderViewConfiguration setActionText:](v6, "setActionText:", v13);
  -[_PXActionableSectionHeaderViewConfiguration setActionType:](v6, "setActionType:", v11);
  v45 = a2;
  if ((objc_msgSend(v5, "isTopHeader") & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "useGradientSectionHeaders");

  }
  v46 = v8;
  v47 = v7;
  if (v11 >= 6)
  {
    if (v11 - 7 >= 4)
    {
      if (v11 == 6)
        v17 = 3;
      else
        v17 = 0;
      v16 = 0;
    }
    else
    {
      if (v11 - 9 > 1)
      {
        v16 = 0;
      }
      else
      {
        objc_initWeak(location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __76__PXActionableSectionHeaderLayoutProvider_configurationForSingleViewLayout___block_invoke;
        aBlock[3] = &unk_1E5131A80;
        objc_copyWeak(&v55, location);
        v54 = v5;
        v16 = _Block_copy(aBlock);

        objc_destroyWeak(&v55);
        objc_destroyWeak(location);
      }
      v17 = 1;
    }
  }
  else
  {
    v16 = 0;
    if (objc_msgSend(v5, "isTopHeader"))
      v17 = 2;
    else
      v17 = 1;
  }
  -[_PXActionableSectionHeaderViewConfiguration setFilterButtonControllerFactory:](v6, "setFilterButtonControllerFactory:", v16);
  v18 = objc_msgSend(v13, "length");
  v19 = v18 != 0;
  v20 = v16 != 0;
  if (-[PXActionableSectionHeaderLayoutProvider actionVisibilityForHeaderLayout:](self, "actionVisibilityForHeaderLayout:", v5) == 1)
  {
    v21 = objc_msgSend(v5, "wantsBackground");
    if (v18)
      v19 = v21;
    else
      v19 = 0;
    if (v16)
      v20 = v21;
    else
      v20 = 0;
  }
  -[_PXActionableSectionHeaderViewConfiguration setShowsActionButton:](v6, "setShowsActionButton:", v19);
  -[_PXActionableSectionHeaderViewConfiguration setShowsSecondaryButton:](v6, "setShowsSecondaryButton:", v20);
  -[PXActionableSectionHeaderLayoutProvider customBackgroundStyle](self, "customBackgroundStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PXActionableSectionHeaderLayoutProvider customBackgroundStyle](self, "customBackgroundStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v23, "unsignedIntegerValue");

  }
  -[_PXActionableSectionHeaderViewConfiguration setButtonStyle:](v6, "setButtonStyle:", v17);
  -[_PXActionableSectionHeaderViewConfiguration setBackgroundStyle:](v6, "setBackgroundStyle:", v14);
  objc_msgSend(v5, "spec");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "visualEffectViewGroupName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXActionableSectionHeaderViewConfiguration setBackdropViewGroupName:](v6, "setBackdropViewGroupName:", v25);

  -[PXActionableSectionHeaderLayoutProvider gradientImage](self, "gradientImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXActionableSectionHeaderViewConfiguration setGradientImage:](v6, "setGradientImage:", v26);

  objc_msgSend(v5, "spec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sectionHeaderSpec");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "gradientAlpha");
  -[_PXActionableSectionHeaderViewConfiguration setGradientAlpha:](v6, "setGradientAlpha:");

  objc_msgSend(v5, "spec");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sectionHeaderSpec");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "gradientOverhang");
  -[_PXActionableSectionHeaderViewConfiguration setGradientOverhang:](v6, "setGradientOverhang:");

  objc_msgSend(v5, "spec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionHeaderSpec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "curatedLibraryHeaderSpec");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXActionableSectionHeaderViewConfiguration setButtonSpec:](v6, "setButtonSpec:", v33);

  -[_PXActionableSectionHeaderViewConfiguration setShowsTopSeparator:](v6, "setShowsTopSeparator:", 1);
  objc_msgSend(v5, "spec");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXActionableSectionHeaderViewConfiguration setPreferredUserInterfaceStyle:](v6, "setPreferredUserInterfaceStyle:", objc_msgSend(v34, "preferredUserInterfaceStyle"));

  if (v5)
  {
    objc_msgSend(v5, "sectionIndexPath");
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
  }
  v50[0] = v51;
  v50[1] = v52;
  -[_PXActionableSectionHeaderViewConfiguration setSectionIndexPath:](v6, "setSectionIndexPath:", v50);
  if ((objc_msgSend(v5, "isTopHeader") & 1) != 0)
  {
    v35 = 0;
  }
  else
  {
    *(_OWORD *)location = 0u;
    v49 = 0u;
    if (v5)
      objc_msgSend(v5, "sectionIndexPath");
    objc_msgSend(v5, "dataSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = location[0];
    if (location[0] == *(id *)off_1E50B7E98
      || location[1] == (id)0x7FFFFFFFFFFFFFFFLL
      || (_QWORD)v49 != 0x7FFFFFFFFFFFFFFFLL
      || v38 != (id)objc_msgSend(v36, "identifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", v45, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 384, CFSTR("Header layouts that are not global must be associated with a current section"));

    }
    v39 = objc_msgSend(v37, "numberOfItemsInSection:", location[1]);
    objc_msgSend(v5, "spec");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "assetsSpec");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "zoomableSpec");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v39 >= objc_msgSend(v42, "staticNumberOfColumns");

  }
  -[_PXActionableSectionHeaderViewConfiguration setAvoidsTintedButtonsAtHighSpeeds:](v6, "setAvoidsTintedButtonsAtHighSpeeds:", v35);
  -[_PXActionableSectionHeaderViewConfiguration setSupportsMultipleLinesInCompactLayout:](v6, "setSupportsMultipleLinesInCompactLayout:", 1);

  return v6;
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  if ((unint64_t)a4 <= 0xA)
  {
    if (((1 << a4) & 0x282) != 0)
    {
      v11 = 1;
      v10 = v13;
      goto LABEL_6;
    }
    if (((1 << a4) & 0x504) != 0)
    {
      v10 = v13;
      v11 = 0;
LABEL_6:
      -[PXActionableSectionHeaderLayoutProvider sectionHeader:didToggleSelectedState:](self, "sectionHeader:didToggleSelectedState:", v10, v11);
      goto LABEL_7;
    }
    if (((1 << a4) & 0x39) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 402, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
LABEL_7:

}

- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4
{
  -[PXActionableSectionHeaderLayoutProvider setSelectedState:forItemsInSectionHeaderLayout:](self, "setSelectedState:forItemsInSectionHeaderLayout:", a4, a3);
}

- (void)setSelectedState:(BOOL)a3 forItemsInSectionHeaderLayout:(id)a4
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

  v6 = a4;
  -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
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
  v15[2] = __90__PXActionableSectionHeaderLayoutProvider_setSelectedState_forItemsInSectionHeaderLayout___block_invoke;
  v15[3] = &unk_1E5144348;
  v17 = a3;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v8, "performChanges:", v15);

}

- (id)createFilterButtonControllerForLayout:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPhotosFilterToggleButtonController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPhotosFilterToggleButtonController *v15;

  v4 = a3;
  -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  objc_msgSend(v4, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionHeaderSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [PXPhotosFilterToggleButtonController alloc];
    -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionHeaderSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PXPhotosFilterToggleButtonController initWithViewModel:buttonConfiguration:](v10, "initWithViewModel:buttonConfiguration:", v11, v14);

  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
}

- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->_invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_invalidationDelegate, a3);
}

- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)topHeaderInvalidationDelegate
{
  return (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->_topHeaderInvalidationDelegate);
}

- (void)setTopHeaderInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_topHeaderInvalidationDelegate, a3);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  return (PXPhotosSectionHeaderLayoutViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (PXActionableSectionHeaderView)referenceHeaderView
{
  return self->_referenceHeaderView;
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (NSNumber)customBackgroundStyle
{
  return self->_customBackgroundStyle;
}

- (void)setCustomBackgroundStyle:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundStyle, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_referenceHeaderView, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_topHeaderInvalidationDelegate);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
}

uint64_t __90__PXActionableSectionHeaderLayoutProvider_setSelectedState_forItemsInSectionHeaderLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedState:forIndexPathSet:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __76__PXActionableSectionHeaderLayoutProvider_configurationForSingleViewLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "createFilterButtonControllerForLayout:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __88__PXActionableSectionHeaderLayoutProvider_singleViewLayout_desiredSizeForReferenceSize___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "createFilterButtonControllerForLayout:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
