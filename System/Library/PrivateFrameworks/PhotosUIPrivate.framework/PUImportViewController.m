@implementation PUImportViewController

- (void)reloadData
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[PUImportViewController isViewLoaded](self, "isViewLoaded"))
  {
    _importGridLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PUImportViewController importDataSource](self, "importDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[PUImportViewController reloadData]";
      v8 = 2048;
      v9 = objc_msgSend(v4, "identifier");
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "%s: Reloading datasource %lu. Expensive (cancels all requests).", (uint8_t *)&v6, 0x16u);

    }
    -[PUImportViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (BOOL)_isItemVisibleAtIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUImportViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)_updateToolbarAnimated:(BOOL)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *deleteButtonItem;
  UIBarButtonItem *v14;
  UIBarButtonItem *deleteButtonItemIcon;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *importButtonItem;
  uint64_t v19;
  UIBarButtonItem *v20;
  UIBarButtonItem *stopBarItem;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  UIBarButtonItem *v26;
  UIBarButtonItem *progressButtonItem;
  void *v28;
  void *v29;
  PUImportAddToAlbumsToolbarView *v30;
  void *v31;
  PUImportAddToAlbumsToolbarView *v32;
  PUImportAddToAlbumsToolbarView *addToAlbumsToolbarView;
  UIBarButtonItem *v34;
  UIBarButtonItem *albumPickerBarItem;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  PXNavigationTitleView *v67;
  PXNavigationTitleView *navigationTitleView;
  PXNavigationTitleView *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  UILabel *v74;
  UILabel *navigationLargeTitleAccessoryLabel;
  void *v76;
  void *v77;
  int v78;
  UILabel *v79;
  void *v80;
  unsigned int v81;
  _QWORD v82[9];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;
  uint64_t v90;

  v3 = a3;
  v90 = *MEMORY[0x1E0C80C00];
  if (!-[PUImportViewController isViewLoaded](self, "isViewLoaded"))
    return;
  _importGridLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v89 = "-[PUImportViewController _updateToolbarAnimated:]";
    _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController importController](self, "importController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isAnyItemSelected");

  if (!self->_deleteButtonItem)
  {
    v81 = v3;
    PLLocalizedFrameworkString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v11, 2, self, sel_delete_);
    deleteButtonItem = self->_deleteButtonItem;
    self->_deleteButtonItem = v12;

    v14 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 16, self, sel_delete_);
    deleteButtonItemIcon = self->_deleteButtonItemIcon;
    self->_deleteButtonItemIcon = v14;

    PLLocalizedFrameworkString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v16, 2, 0, 0);
    importButtonItem = self->_importButtonItem;
    self->_importButtonItem = v17;

    PLLocalizedFrameworkString();
    v19 = objc_claimAutoreleasedReturnValue();

    v80 = (void *)v19;
    v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v19, 7, self, sel_stopImport_);
    stopBarItem = self->_stopBarItem;
    self->_stopBarItem = v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", 3, 0.0, 0.0, 28.0, 28.0);
    -[PUImportViewController setRoundProgressView:](self, "setRoundProgressView:", v22);

    -[PUImportViewController roundProgressView](self, "roundProgressView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUserInteractionEnabled:", 0);

    v24 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PUImportViewController roundProgressView](self, "roundProgressView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (UIBarButtonItem *)objc_msgSend(v24, "initWithCustomView:", v25);
    progressButtonItem = self->_progressButtonItem;
    self->_progressButtonItem = v26;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_importControllerProgressDidChange_, *MEMORY[0x1E0D7C420], 0);

    -[UIBarButtonItem setIsAccessibilityElement:](self->_progressButtonItem, "setIsAccessibilityElement:", 1);
    -[UIBarButtonItem setAccessibilityTraits:](self->_progressButtonItem, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0] | *MEMORY[0x1E0DC46E0]);
    PLLocalizedFrameworkString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_progressButtonItem, "setAccessibilityLabel:", v29);

    v30 = [PUImportAddToAlbumsToolbarView alloc];
    -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PUImportAddToAlbumsToolbarView initWithFrame:photoLibrary:](v30, "initWithFrame:photoLibrary:", v31, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    addToAlbumsToolbarView = self->_addToAlbumsToolbarView;
    self->_addToAlbumsToolbarView = v32;

    -[PUImportAddToAlbumsToolbarView setDelegate:](self->_addToAlbumsToolbarView, "setDelegate:", self);
    -[PUImportAddToAlbumsToolbarView setTranslatesAutoresizingMaskIntoConstraints:](self->_addToAlbumsToolbarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_addToAlbumsToolbarView);
    albumPickerBarItem = self->_albumPickerBarItem;
    self->_albumPickerBarItem = v34;

    -[PUImportAddToAlbumsToolbarView accessibilityLabel](self->_addToAlbumsToolbarView, "accessibilityLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_albumPickerBarItem, "setAccessibilityLabel:", v36);

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("IMPORT"), CFSTR("IMPORT_ALL"), CFSTR("DELETE_ALL"), CFSTR("DELETE_SELECTED"), CFSTR("STOP_IMPORT"), CFSTR("IMPORT_PROGRESS"), CFSTR("IMPORT_TOALBUM_BARTITLE"), 0);
    v38 = (void *)objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v84 != v42)
            objc_enumerationMutation(v39);
          PLLocalizedFrameworkString();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
      }
      while (v41);
    }

    -[UIBarButtonItem setPossibleTitles:](self->_deleteButtonItem, "setPossibleTitles:", v38);
    -[UIBarButtonItem setPossibleTitles:](self->_importButtonItem, "setPossibleTitles:", v38);
    -[UIBarButtonItem setPossibleTitles:](self->_stopBarItem, "setPossibleTitles:", v38);
    -[UIBarButtonItem setPossibleTitles:](self->_progressButtonItem, "setPossibleTitles:", v38);
    -[UIBarButtonItem setPossibleTitles:](self->_albumPickerBarItem, "setPossibleTitles:", v38);

    v3 = v81;
  }
  -[PUImportViewController importController](self, "importController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isImportingAssets");

  if (v46)
  {
    objc_msgSend(v6, "addObject:", self->_stopBarItem);
  }
  else
  {
    -[PUImportViewController importDataSource](self, "importDataSource");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "numberOfItems");

    if (v48)
    {
      -[PUImportViewController actionCoordinator](self, "actionCoordinator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "configureImportActionsForBarButtonItem:", self->_importButtonItem);

      objc_msgSend(v6, "addObject:", self->_importButtonItem);
      PLLocalizedFrameworkString();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityLabel:](self->_deleteButtonItem, "setAccessibilityLabel:", v50);
      -[UIBarButtonItem setTitle:](self->_deleteButtonItem, "setTitle:", v50);
      -[PUImportViewController deleteButtonItem](self, "deleteButtonItem");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        if (-[PUImportViewController compactLayoutMode](self, "compactLayoutMode"))
          v52 = v7;
        else
          v52 = v6;
        objc_msgSend(v52, "addObject:", v51);
      }
      if (self->_albumPickerBarItem)
      {
        -[PUImportViewController _spec](self, "_spec");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "canDisplayEditActionsInNavigationBar");

        if (v54)
          objc_msgSend(v7, "addObject:", self->_albumPickerBarItem);
      }

    }
  }
  -[PUImportViewController importController](self, "importController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "isImportingAssets"))
  {

LABEL_28:
    if (-[PUImportViewController compactLayoutMode](self, "compactLayoutMode"))
      v58 = v7;
    else
      v58 = v6;
    objc_msgSend(v58, "addObject:", self->_progressButtonItem);
    goto LABEL_32;
  }
  -[PUImportViewController importController](self, "importController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isDeletingAssets");

  if (v57)
    goto LABEL_28;
LABEL_32:
  -[PUImportViewController importController](self, "importController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "isImportingAssets") & 1) != 0)
  {
    v60 = 0;
  }
  else
  {
    -[PUImportViewController importController](self, "importController");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v61, "isDeletingAssets") ^ 1;

  }
  -[PUImportViewController importController](self, "importController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "hasLoadedInitialBatchOfAssets") & v60;

  -[UIBarButtonItem setEnabled:](self->_importButtonItem, "setEnabled:", v63);
  -[UIBarButtonItem setEnabled:](self->_deleteButtonItem, "setEnabled:", v63);
  -[UIBarButtonItem setEnabled:](self->_deleteButtonItemIcon, "setEnabled:", v63);
  -[PUImportViewController navigationItem](self, "navigationItem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setLargeTitleDisplayMode:", 0);
  if (-[PUImportViewController hasBackOrCloseButton](self, "hasBackOrCloseButton"))
  {
    objc_msgSend(v7, "reverseObjectEnumerator");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "allObjects");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v66);

  }
  else
  {
    objc_msgSend(v64, "setLeftBarButtonItems:animated:", v7, v3);
  }
  objc_msgSend(v64, "setRightBarButtonItems:animated:", v6, v3);
  if (!self->_navigationTitleView)
  {
    v67 = (PXNavigationTitleView *)objc_alloc_init(MEMORY[0x1E0D7B630]);
    navigationTitleView = self->_navigationTitleView;
    self->_navigationTitleView = v67;

    -[PXNavigationTitleView margins](self->_navigationTitleView, "margins");
    v69 = self->_navigationTitleView;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __49__PUImportViewController__updateToolbarAnimated___block_invoke;
    v82[3] = &unk_1E58AACA0;
    v82[4] = self;
    v82[5] = v70;
    v82[6] = v71;
    v82[7] = 0;
    v82[8] = v72;
    -[PXNavigationTitleView performChanges:](v69, "performChanges:", v82);
    -[PUImportViewController navigationTitleView](self, "navigationTitleView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setTitleView:", v73);

    -[PUImportViewController updateNavigationTitleViewVisibilityAnimated:](self, "updateNavigationTitleViewVisibilityAnimated:", 0);
  }
  if (!self->_navigationLargeTitleAccessoryLabel)
  {
    v74 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    navigationLargeTitleAccessoryLabel = self->_navigationLargeTitleAccessoryLabel;
    self->_navigationLargeTitleAccessoryLabel = v74;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_navigationLargeTitleAccessoryLabel, "setFont:", v76);

  }
  -[PUImportViewController _spec](self, "_spec");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "canDisplayEditActionsInNavigationBar");

  if (v78)
    v79 = self->_navigationLargeTitleAccessoryLabel;
  else
    v79 = 0;
  objc_msgSend(v64, "_setLargeTitleAccessoryView:", v79);
  -[PUImportViewController updateContentInfoLabels](self, "updateContentInfoLabels");
  -[PUImportViewController _updateCompactToolbar](self, "_updateCompactToolbar");

}

- (void)_dismissPopupsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;

  v3 = a3;
  -[PUImportViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[PUImportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
}

- (void)updateContentInfoLabels
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUImportViewController importController](self, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isAnyItemSelected");
  if ((_DWORD)v6)
  {
    -[PUImportViewController importController](self, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedItems");
  }
  else
  {
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unfilteredDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allItemsUnsorted");
  }
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "totalSizeStringForItems:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController updateNavigationTitleWithItems:sizeString:itemsAreSelected:](self, "updateNavigationTitleWithItems:sizeString:itemsAreSelected:", v10, v9, v6);
  -[PUImportViewController updateContentInfoBarButtonTitlesWithItems:sizeString:itemsAreSelected:](self, "updateContentInfoBarButtonTitlesWithItems:sizeString:itemsAreSelected:", v10, v9, v6);

}

- (void)updateNavigationTitleWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  int64_t v26;
  __CFString *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __CFString *v40;
  int64_t v41;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PUImportViewController importController](self, "importController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isImportingAssets");

  -[PUImportViewController importController](self, "importController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDeletingAssets");

  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "showProgressTitles");

  v16 = -[PUImportViewController numTotalItemsToComplete](self, "numTotalItemsToComplete");
  v17 = -[PUImportViewController numItemsCompleted](self, "numItemsCompleted");
  v18 = (v16 - v17) & ~((v16 - v17) >> 63);
  if (v11 && v15 || (v13 & v15) == 1)
  {
    PLLocalizedFrameworkString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("IMPORT_ASSET_PROGRESS_REMAINING"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v18;
    PULocalizedStringWithValidatedFormat(v20, CFSTR("%d"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    PXLocalizedSelectionMessageForAssets();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (__CFString *)v9;
  }
  else
  {
    v21 = &stru_1E58AD278;
    PLLocalizedFrameworkString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      PULocalizedString(CFSTR("IMPORT_ITEMS_COUNT"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "count");
      PULocalizedStringWithValidatedFormat(v33, CFSTR("%d"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      PLLocalizedFrameworkString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v20;
      v36 = v9;
      PUStringWithValidatedFormat();
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
LABEL_6:
  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar", v35, v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isHidden");

  if ((v23 & 1) == 0)
  {

    v21 = &stru_1E58AD278;
  }
  -[PUImportViewController navigationTitleView](self, "navigationTitleView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PUImportViewController _titleViewVerticalSizeClassForExtendedTraitCollection:](self, "_titleViewVerticalSizeClassForExtendedTraitCollection:", v25);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __85__PUImportViewController_updateNavigationTitleWithItems_sizeString_itemsAreSelected___block_invoke;
  v37[3] = &unk_1E58AAA58;
  v38 = v24;
  v39 = v19;
  v40 = v21;
  v41 = v26;
  v27 = v21;
  v28 = v19;
  v29 = v24;
  objc_msgSend(v29, "performChanges:", v37);
  -[PUImportViewController navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitle:", v28);
  -[PUImportViewController navigationLargeTitleAccessoryLabel](self, "navigationLargeTitleAccessoryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v27);

  -[PUImportViewController navigationLargeTitleAccessoryLabel](self, "navigationLargeTitleAccessoryLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeToFit");

}

- (void)updateContentInfoBarButtonTitlesWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  _QWORD v28[5];
  __CFString *v29;
  __CFString *v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PUImportViewController importController](self, "importController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isImportingAssets");

  -[PUImportViewController importController](self, "importController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDeletingAssets");

  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "showProgressTitles");

  v16 = -[PUImportViewController numTotalItemsToComplete](self, "numTotalItemsToComplete");
  v17 = -[PUImportViewController numItemsCompleted](self, "numItemsCompleted");
  if ((v11 | v13) == 1 && v15)
  {
    v18 = (v16 - v17) & ~((v16 - v17) >> 63);
    PULocalizedString(CFSTR("IMPORT_ASSET_PROGRESS_REMAINING_MULTILINE_TOP"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedStringWithValidatedFormat(v19, CFSTR("%d"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("IMPORT_ASSET_PROGRESS_REMAINING_MULTILINE_BOTTOM"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v18;
    PULocalizedStringWithValidatedFormat(v21, CFSTR("%d"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (v5)
  {
    v20 = (__CFString *)v9;
    v22 = &stru_1E58AD278;
  }
  else if (objc_msgSend(v8, "count"))
  {
    PULocalizedString(CFSTR("IMPORT_ITEMS_COUNT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v8, "count");
    PULocalizedStringWithValidatedFormat(v23, CFSTR("%d"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v22 = (__CFString *)v9;
  }
  else
  {
    v20 = &stru_1E58AD278;
    v22 = &stru_1E58AD278;
  }
  -[PUImportViewController contentInfoBarButtonView](self, "contentInfoBarButtonView", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __96__PUImportViewController_updateContentInfoBarButtonTitlesWithItems_sizeString_itemsAreSelected___block_invoke;
  v28[3] = &unk_1E58AB790;
  v28[4] = self;
  v29 = v20;
  v30 = v22;
  v25 = v22;
  v26 = v20;
  objc_msgSend(v24, "performChanges:", v28);

}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "layoutSizeClass") == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (BOOL)compactLayoutMode
{
  return self->_compactLayoutMode;
}

- (BOOL)hasBackOrCloseButton
{
  void *v3;
  void *v4;
  PUImportViewController *v5;
  BOOL v6;
  void *v7;

  -[PUImportViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (PUImportViewController *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[PUImportViewController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)deleteButtonItem
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  int *v7;
  id v8;

  -[PUImportViewController importController](self, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canDeleteContent");

  if (v5)
  {
    v6 = -[PUImportViewController hasBackOrCloseButton](self, "hasBackOrCloseButton");
    if (!-[PUImportViewController compactLayoutMode](self, "compactLayoutMode") || v6)
      v7 = &OBJC_IVAR___PUImportViewController__deleteButtonItemIcon;
    else
      v7 = &OBJC_IVAR___PUImportViewController__deleteButtonItem;
    v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)updateNavigationTitleViewVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[6];

  v3 = a3;
  -[PUImportViewController navigationTitleView](self, "navigationTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  -[PUImportViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass");

  v10 = 1.0;
  if (v9 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarHeight");
    v13 = v12;

    -[PUImportViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultHeightForMetrics:", 0);
    v17 = v16;

    -[PUImportViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentInset");
    v20 = v19;

    v21 = v13 + v17 + v20 + 14.0;
    -[PUImportViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentOffset");
    v24 = v23;

    if (v24 < -v21)
      v10 = 0.0;
    else
      v10 = 1.0;
  }
  if (v7 != v10)
  {
    if (!updateNavigationTitleViewVisibilityAnimated__animatingToAlpha
      || (objc_msgSend((id)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha, "doubleValue"), v25 != v10))
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha;
        updateNavigationTitleViewVisibilityAnimated__animatingToAlpha = v26;

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke;
        v29[3] = &unk_1E58AACF0;
        v29[4] = self;
        *(double *)&v29[5] = v10;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v29, &__block_literal_global_41072, 0.2);
      }
      else
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_3;
        v28[3] = &unk_1E58AACF0;
        v28[4] = self;
        *(double *)&v28[5] = v10;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v28);
      }
    }
  }
}

- (void)_updateCompactToolbar
{
  void *v3;
  void *v4;
  uint64_t v5;
  UIBarButtonItem *compactSpacer1;
  UIBarButtonItem *compactSpacer2;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUImportViewController importDataSource](self, "importDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfItems");

    if (v5)
    {
      compactSpacer1 = self->_compactSpacer1;
      v10[0] = self->_compactContentInfoButton;
      v10[1] = compactSpacer1;
      compactSpacer2 = self->_compactSpacer2;
      v10[2] = self->_compactImportDestinationButton;
      v10[3] = compactSpacer2;
      v10[4] = self->_compactEmptyTrailingButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setItems:", v8);

    }
    -[PUImportViewController updateCompactWidthToolbarVisibility](self, "updateCompactWidthToolbarVisibility");
  }
}

- (void)setUpCompactWidthToolbar
{
  void *v3;
  PUImportFloatingToolbarView *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  PUImportCustomViewBarButton *v36;
  void *v37;
  PUImportCustomViewBarButton *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  UIBarButtonItem *v44;
  UIBarButtonItem *compactContentInfoButton;
  UIBarButtonItem *v46;
  UIBarButtonItem *compactSpacer1;
  id v48;
  void *v49;
  UIBarButtonItem *v50;
  UIBarButtonItem *compactImportDestinationButton;
  UIBarButtonItem *v52;
  UIBarButtonItem *compactSpacer2;
  id v54;
  id v55;
  UIBarButtonItem *v56;
  UIBarButtonItem *compactEmptyTrailingButton;
  void *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];

  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PUImportFloatingToolbarView);
    -[PUImportViewController setCompactWidthToolbar:](self, "setCompactWidthToolbar:", v4);

    -[PUImportViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:aboveSubview:", v6, v7);

    -[PUImportViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController setCompactWidthToolbarTopConstraint:](self, "setCompactWidthToolbarTopConstraint:", v23);

    -[PUImportViewController compactWidthToolbarTopConstraint](self, "compactWidthToolbarTopConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShouldBlurBackground:", 1);

    v26 = objc_alloc_init(MEMORY[0x1E0D7B630]);
    -[PUImportViewController setContentInfoBarButtonView:](self, "setContentInfoBarButtonView:", v26);

    -[PUImportViewController contentInfoBarButtonView](self, "contentInfoBarButtonView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUserInteractionEnabled:", 0);

    -[PUImportViewController contentInfoBarButtonView](self, "contentInfoBarButtonView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke;
    v61[3] = &unk_1E58ABD10;
    v61[4] = self;
    objc_msgSend(v28, "performChanges:", v61);

    -[PUImportViewController importController](self, "importController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "importDestinationAlbum");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc_init(MEMORY[0x1E0D7B630]);
    -[PUImportViewController setCompactWidthAlbumPickerBarButtonView:](self, "setCompactWidthAlbumPickerBarButtonView:", v32);

    -[PUImportViewController compactWidthAlbumPickerBarButtonView](self, "compactWidthAlbumPickerBarButtonView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

    -[PUImportViewController compactWidthAlbumPickerBarButtonView](self, "compactWidthAlbumPickerBarButtonView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v29;
    v59[1] = 3221225472;
    v59[2] = __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke_2;
    v59[3] = &unk_1E58ABCA8;
    v59[4] = self;
    v60 = v31;
    v35 = v31;
    objc_msgSend(v34, "performChanges:", v59);

    v36 = [PUImportCustomViewBarButton alloc];
    -[PUImportViewController compactWidthAlbumPickerBarButtonView](self, "compactWidthAlbumPickerBarButtonView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PUImportCustomViewBarButton initWithCustomView:](v36, "initWithCustomView:", v37);
    -[PUImportViewController setCompactWidthAlbumPickerButton:](self, "setCompactWidthAlbumPickerButton:", v38);

    -[PUImportViewController compactWidthAlbumPickerButton](self, "compactWidthAlbumPickerButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addTarget:action:forControlEvents:", self, sel_showAlbumPicker_, 64);

    -[PUImportViewController accessibilityLabelForAlbumPickerControlWithDestination:](self, "accessibilityLabelForAlbumPickerControlWithDestination:", v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController compactWidthAlbumPickerButton](self, "compactWidthAlbumPickerButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCustomAccessibilityLabel:", v40);

    v42 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PUImportViewController contentInfoBarButtonView](self, "contentInfoBarButtonView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (UIBarButtonItem *)objc_msgSend(v42, "initWithCustomView:", v43);
    compactContentInfoButton = self->_compactContentInfoButton;
    self->_compactContentInfoButton = v44;

    v46 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    compactSpacer1 = self->_compactSpacer1;
    self->_compactSpacer1 = v46;

    v48 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PUImportViewController compactWidthAlbumPickerButton](self, "compactWidthAlbumPickerButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (UIBarButtonItem *)objc_msgSend(v48, "initWithCustomView:", v49);
    compactImportDestinationButton = self->_compactImportDestinationButton;
    self->_compactImportDestinationButton = v50;

    v52 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    compactSpacer2 = self->_compactSpacer2;
    self->_compactSpacer2 = v52;

    v54 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v55 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v56 = (UIBarButtonItem *)objc_msgSend(v54, "initWithCustomView:", v55);
    compactEmptyTrailingButton = self->_compactEmptyTrailingButton;
    self->_compactEmptyTrailingButton = v56;

    -[UIBarButtonItem setEnabled:](self->_compactEmptyTrailingButton, "setEnabled:", 0);
    -[UIBarButtonItem setIsAccessibilityElement:](self->_compactEmptyTrailingButton, "setIsAccessibilityElement:", 0);
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHidden:", 1);

    -[PUImportViewController updateCompactWidthToolbarBackgroundGroupName](self, "updateCompactWidthToolbarBackgroundGroupName");
    -[PUImportViewController updateCompactWidthToolbarTopConstraint](self, "updateCompactWidthToolbarTopConstraint");

  }
}

- (void)updateCompactWidthToolbarBackgroundGroupName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUImportViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backdropViewLayerGroupName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackdropViewGroupName:", v6);

  }
}

- (void)updateCompactWidthToolbarVisibility
{
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = -[PUImportViewController compactLayoutMode](self, "compactLayoutMode");
  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if (v3 == v5)
  {
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "setHidden:", v3 ^ 1u);

    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "isHidden");

    if ((v6 & 1) == 0)
      -[PUImportViewController updateCompactWidthToolbarBackgroundGroupName](self, "updateCompactWidthToolbarBackgroundGroupName");
    -[PUImportViewController updateContentInsetForCompactWidthToolbar](self, "updateContentInsetForCompactWidthToolbar");
  }
}

- (void)updateContentInsetForCompactWidthToolbar
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", v8, v10);
    v5 = v12;

  }
  -[PUImportViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[PUImportViewController collectionView](self, "collectionView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentInset:", v5, v15, v17, v19);

}

- (void)updateCompactWidthToolbarTopConstraint
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;

    -[PUImportViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustedContentInset");
    v10 = v9;

    -[PUImportViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentInset");
    v13 = v12;

    v14 = -v7;
    if (v10 >= -v7)
      v14 = v10;
    v15 = v14 - v13;
    -[PUImportViewController compactWidthToolbarTopConstraint](self, "compactWidthToolbarTopConstraint");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v15);

  }
}

- (BOOL)compactWidthToolbarCoversLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGPoint v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  -[PUImportViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  v8 = v7;
  v10 = v9;

  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isHidden");

    if ((v15 & 1) == 0)
    {
      -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      objc_msgSend(v16, "convertRect:toView:", 0);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v28.origin.x = v19;
      v28.origin.y = v21;
      v28.size.width = v23;
      v28.size.height = v25;
      v27.x = v8;
      v27.y = v10;
      return CGRectContainsPoint(v28, v27);
    }
  }
  else
  {

  }
  return 0;
}

- (PUImportViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  id v7;
  PUImportViewController *v8;
  PUImportViewController *v9;
  void *v10;
  NSNumber *cachedHeaderHeight;
  id v12;
  uint64_t v13;
  PXActionableSectionHeaderView *referenceHeaderView;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUImportViewController;
  v8 = -[PUPhotosGridViewController initWithSpec:photoLibrary:](&v16, sel_initWithSpec_photoLibrary_, v7, a4);
  v9 = v8;
  if (v8)
  {
    v8->_busyCount = 0;
    objc_storeStrong((id *)&v8->__spec, a3);
    v9->_allowsSelection = 1;
    objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addKeyObserver:", v9);

    cachedHeaderHeight = v9->_cachedHeaderHeight;
    v9->_cachedHeaderHeight = 0;

    v12 = objc_alloc(MEMORY[0x1E0D7B148]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    referenceHeaderView = v9->_referenceHeaderView;
    v9->_referenceHeaderView = (PXActionableSectionHeaderView *)v13;

  }
  return v9;
}

- (void)dealloc
{
  PUImportActionCoordinator *actionCoordinator;
  void *v4;
  objc_super v5;

  -[PUImportViewController _cancelAlerts](self, "_cancelAlerts");
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = 0;

  -[PUImportViewController setImportController:](self, "setImportController:", 0);
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeKeyObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PUImportViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoCollectionViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  -[PUImportViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsMultipleSelection:", 1);

  -[PUImportViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysBounceVertical:", 1);

  -[PUImportViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUImportCellReuseIdentifier"));

  -[PUImportViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUImportSectionHeaderReuseIdentifier"), CFSTR("PUImportSectionHeaderReuseIdentifier"));

  -[PUImportViewController setUpCompactWidthToolbar](self, "setUpCompactWidthToolbar");
  -[PUImportViewController updateSpec](self, "updateSpec");
}

- (void)viewWillLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v3 = -[PUImportViewController updateSpec](self, "updateSpec");
  -[PUImportViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[PUImportViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[PUImportViewController _setCollectionViewLayoutReferenceWidth:](self, "_setCollectionViewLayoutReferenceWidth:", v6);
  -[PUImportViewController _setCollectionViewSafeAreaInsets:](self, "_setCollectionViewSafeAreaInsets:", v9, v11, v13, v15);
  v16 = v6 - v11 - v15;
  -[PUImportViewController referenceWidth](self, "referenceWidth");
  if (v16 != v17)
  {
    -[PUImportViewController setReferenceWidth:](self, "setReferenceWidth:", v16);
    -[PUImportViewController setCachedHeaderHeight:](self, "setCachedHeaderHeight:", 0);
    -[PUPhotosGridViewController updateVisibleSupplementaryViewsOfKind:](self, "updateVisibleSupplementaryViewsOfKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  }
  if (v3)
  {
    -[PUImportViewController _gridLayout](self, "_gridLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidateLayout");

    if (-[PUImportViewController performingDataSourceChange](self, "performingDataSourceChange"))
      -[PUImportViewController setNeedsDataReloadAfterAnimatingDataSourceChange:](self, "setNeedsDataReloadAfterAnimatingDataSourceChange:", 1);
    else
      -[PUImportViewController reloadData](self, "reloadData");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  -[PUImportViewController setViewAppearing:](self, "setViewAppearing:", 1);
  -[PUImportViewController _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  v13.receiver = self;
  v13.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
  -[PUImportViewController _spec](self, "_spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();

  -[PUImportViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[PUImportViewController _setCollectionViewLayoutReferenceWidth:](self, "_setCollectionViewLayoutReferenceWidth:", v11);
  if (v6 != v8)
  {
    -[PUImportViewController _gridLayout](self, "_gridLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateLayout");

    -[PUImportViewController reloadData](self, "reloadData");
  }
  -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", v3);
  -[PUImportViewController updateNavigationTitleViewVisibilityAnimated:](self, "updateNavigationTitleViewVisibilityAnimated:", v3);
  -[PUImportViewController enableSwipeSelection](self, "enableSwipeSelection");
  self->_acceptsLongPress = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUImportViewController setViewAppearing:](self, "setViewAppearing:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[PUImportViewController _dismissPopupsAnimated:](self, "_dismissPopupsAnimated:", v3);
  -[PUImportViewController disableSwipeSelection](self, "disableSwipeSelection");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  char v28;
  _QWORD v29[5];
  objc_super v30;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUImportViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "prepareForViewTransitionToSize:", width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAnimated")
    && (-[PUImportViewController px_isVisible](self, "px_isVisible") & 1) != 0)
  {
    -[PUImportViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", 0);
    v11 = 0;
    goto LABEL_14;
  }
  -[PUImportViewController _cachedViewSizeTransitionContextSize](self, "_cachedViewSizeTransitionContextSize");
  if (width == v13 && height == v12)
  {
    -[PUImportViewController _cachedViewSizeTransitionContext](self, "_cachedViewSizeTransitionContext");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = 1;
    v10 = (void *)v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSuspended");

    if (v17)
    {
      -[PUImportViewController _cachedViewSizeTransitionContext](self, "_cachedViewSizeTransitionContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[PUImportViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v21 = v20;
        v23 = v22;

        -[PUImportViewController _setCachedViewSizeTransitionContext:](self, "_setCachedViewSizeTransitionContext:", v10);
        -[PUImportViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v21, v23);
      }
      v15 = 0;
    }
    else
    {
      v15 = 1;
    }
  }
  -[PUImportViewController _pendingViewSizeTransitionContext](self, "_pendingViewSizeTransitionContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[PUImportViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", v10);
    v11 = 1;
    if ((v15 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = 1;
  if (v15)
LABEL_14:
    -[PUImportViewController _invalidateCachedViewSizeTransitionContext](self, "_invalidateCachedViewSizeTransitionContext");
LABEL_15:
  -[PUImportViewController setTransitioningToNewSize:](self, "setTransitioningToNewSize:", 1);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v29[3] = &unk_1E58A7A08;
  v29[4] = self;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v26[3] = &unk_1E58A0DF0;
  v28 = v11;
  v26[4] = self;
  v27 = v9;
  v25 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v29, v26);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PUImportViewController updateDataSourceManagerFilters](self, "updateDataSourceManagerFilters");
  -[PUImportViewController updateAlreadyImportedHeaderIfVisible](self, "updateAlreadyImportedHeaderIfVisible");
  -[PUImportViewController compactWidthToolbar](self, "compactWidthToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[PUImportViewController updateCompactWidthToolbarVisibility](self, "updateCompactWidthToolbarVisibility");
    -[PUImportViewController updateCompactWidthToolbarTopConstraint](self, "updateCompactWidthToolbarTopConstraint");
  }
}

- (void)viewSafeAreaInsetsDidChange
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUImportViewController;
  -[PUImportViewController viewSafeAreaInsetsDidChange](&v12, sel_viewSafeAreaInsetsDidChange);
  -[PUImportViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUImportViewController _setCollectionViewSafeAreaInsets:](self, "_setCollectionViewSafeAreaInsets:", v5, v7, v9, v11);
}

- (void)_invalidateCachedViewSizeTransitionContext
{
  -[PUImportViewController _setCachedViewSizeTransitionContext:](self, "_setCachedViewSizeTransitionContext:", 0);
  -[PUImportViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)_setCollectionViewLayoutReferenceWidth:(double)a3
{
  if (self->__collectionViewLayoutReferenceWidth != a3)
  {
    self->__collectionViewLayoutReferenceWidth = a3;
    -[PUImportViewController _updateLayoutMetrics](self, "_updateLayoutMetrics");
  }
}

- (void)_setCollectionViewSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->_collectionViewSafeAreaInsets.left != a3.left
    || self->_collectionViewSafeAreaInsets.top != a3.top
    || self->_collectionViewSafeAreaInsets.right != a3.right
    || self->_collectionViewSafeAreaInsets.bottom != a3.bottom)
  {
    self->_collectionViewSafeAreaInsets = a3;
    -[PUImportViewController _updateLayoutMetrics](self, "_updateLayoutMetrics");
  }
}

- (BOOL)updateSpec
{
  BOOL v3;
  void *v4;
  BOOL v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUImportViewController;
  v3 = -[PUPhotosGridViewController updateSpec](&v11, sel_updateSpec);
  -[PUImportViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "horizontalSizeClass") && objc_msgSend(v4, "verticalSizeClass"))
  {
    v5 = +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v4);
    v6 = (objc_class *)objc_opt_class();
    -[PUImportViewController _spec](self, "_spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();

    self->_compactLayoutMode = v5;
    if (v6 != (objc_class *)v8)
    {
      v9 = objc_alloc_init(v6);
      -[PUImportViewController _setSpec:](self, "_setSpec:", v9);

      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateContentOffsetForPendingViewSizeTransition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  CGRect v16;

  -[PUImportViewController _pendingViewSizeTransitionContext](self, "_pendingViewSizeTransitionContext");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (-[PUImportViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUImportViewController collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      CGRectGetWidth(v16);

      -[PUImportViewController _collectionViewLayoutReferenceWidth](self, "_collectionViewLayoutReferenceWidth");
      if (PXFloatApproximatelyEqualToFloat())
      {
        -[PUImportViewController _gridLayout](self, "_gridLayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController collectionView](self, "collectionView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contentOffset");
        v7 = v6;
        v9 = v8;

        objc_msgSend(v4, "targetContentOffsetForViewSizeTransitionContext:", v15);
        v12 = v11;
        v13 = v10;
        if (v7 != v11 || v9 != v10)
        {
          -[PUImportViewController collectionView](self, "collectionView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setContentOffset:", v12, v13);

          objc_msgSend(v4, "invalidateLayout");
        }
        -[PUImportViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", 0);

      }
    }
  }

}

- (void)_updateLayoutMetrics
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PUImportViewController _spec](self, "_spec");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController _gridLayout](self, "_gridLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController _collectionViewLayoutReferenceWidth](self, "_collectionViewLayoutReferenceWidth");
  v5 = v4;
  -[PUImportViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v11, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:", v3, v5, v7, v8, v9, v10);

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  -[PUPhotosGridViewController updateLayoutMetrics](self, "updateLayoutMetrics", a3);
  -[PUImportViewController setCachedHeaderHeight:](self, "setCachedHeaderHeight:", 0);
  -[PUImportViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (id)_gridLayout
{
  void *v2;
  void *v3;

  -[PUImportViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newGridLayoutFromSpec:(id)a3
{
  id v4;
  PUSectionedGridLayout *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = objc_alloc_init(PUSectionedGridLayout);
  -[PUSectionedGridLayout setSectionHeadersEnabled:](v5, "setSectionHeadersEnabled:", 1);
  -[PUSectionedGridLayout setSectionHeaderElementKind:](v5, "setSectionHeaderElementKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  -[PUSectionedGridLayout setFloatingSectionHeadersEnabled:](v5, "setFloatingSectionHeadersEnabled:", 1);
  -[PUSectionedGridLayout setSectionTopPadding:](v5, "setSectionTopPadding:", 0.0);
  objc_msgSend(v4, "baseInterItemSpacing");
  v7 = v6;

  -[PUSectionedGridLayout setGlobalTopPadding:](v5, "setGlobalTopPadding:", v7);
  -[PUSectionedGridLayout setGlobalBottomPadding:](v5, "setGlobalBottomPadding:", 0.0);
  -[PUSectionedGridLayout setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PUImportSectionHeaderReuseIdentifier"), a4))
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "globalHeaderAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_bestReferenceItemIndexPath
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[PUImportViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_19;
  v5 = (void *)v4;
  objc_msgSend(v2, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  objc_msgSend(v2, "contentOffset");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "bounds");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v2, "numberOfSections");
  v16 = v15 - 1;
  if (v15 < 1 || objc_msgSend(v2, "numberOfItemsInSection:", 0) < 1)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18
    && (objc_msgSend(v18, "frame"),
        v28.origin.x = v8,
        v28.origin.y = v10,
        v28.size.width = v12,
        v28.size.height = v14,
        CGRectIntersectsRect(v26, v28)))
  {
    v20 = v17;
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(v2, "numberOfItemsInSection:", v16);
  if (!v20 && v21 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21 - 1, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23
      && (objc_msgSend(v23, "frame"),
          v29.origin.x = v8,
          v29.origin.y = v10,
          v29.size.width = v12,
          v29.size.height = v14,
          CGRectIntersectsRect(v27, v29)))
    {
      v20 = v22;
    }
    else
    {
      v20 = 0;
    }

  }
  if (!v20)
  {
LABEL_23:
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC9F260))
    {
      objc_msgSend(v3, "itemIndexPathAtCenterOfRect:", v8, v10, v12, v14);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    v20 = 0;
  }
LABEL_20:

  return v20;
}

- (BOOL)importSectionedGridLayout:(id)a3 shouldEmphasizeSection:(unint64_t)a4
{
  void *v5;
  char v6;

  if (a4)
    return 0;
  -[PUImportViewController importDataSource](self, "importDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAlreadyImportedSection");

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUImportViewController importDataSource](self, "importDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PUImportViewController importDataSource](self, "importDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PUImportViewController collectionView](self, "collectionView", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;

  v8 = 30.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  if (v10 != CFSTR("PUImportSectionHeaderReuseIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportViewController.m"), 1222, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v12 = v11;
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("PUImportSectionHeaderReuseIdentifier"), CFSTR("PUImportSectionHeaderReuseIdentifier"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);
  -[PUImportViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v13, CFSTR("PUImportSectionHeaderReuseIdentifier"), v12);

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PUImportViewController importDataSource](self, "importDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  PXSimpleIndexPathFromIndexPath();

  -[PUImportViewController importDataSource](self, "importDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, 32);
  objc_msgSend(v10, "assetAtItemIndexPath:", buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _PFAssertContinueHandler();
    _importGridLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PUImportViewController importDataSource](self, "importDataSource", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[PUImportViewController collectionView:cellForItemAtIndexPath:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v20;
      _os_log_error_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "%s: Unreachable Error: Import view model at index path %{public}@ is nil, import data source: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportViewController.m"), 1252, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  _importGridLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[PUImportViewController collectionView:cellForItemAtIndexPath:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v8;
    _os_log_debug_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEBUG, "%s: %@(%@)", buf, 0x20u);
  }

  -[PUImportViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUImportCellReuseIdentifier"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setRepresentedImportItem:", v11);
  -[PUImportViewController itemsBeingTransitioned](self, "itemsBeingTransitioned");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "member:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0.0;
  if (!v16)
    v17 = 1.0;
  objc_msgSend(v14, "setAlpha:", v17);

  return v14;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  BOOL v7;
  _BOOL4 allowsSelection;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    allowsSelection = self->_allowsSelection;
    v10 = 136315650;
    v11 = "-[PUImportViewController collectionView:shouldSelectItemAtIndexPath:]";
    v12 = 2112;
    v13 = v5;
    v14 = 1024;
    v15 = allowsSelection;
    _os_log_debug_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%s: %@ -> %d", (uint8_t *)&v10, 0x1Cu);
  }

  v7 = self->_allowsSelection;
  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _importGridLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[PUImportViewController collectionView:willDisplayCell:forItemAtIndexPath:]";
    _os_log_debug_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  -[PUImportViewController _updateCell:atIndex:](self, "_updateCell:atIndex:", v8, v7);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v10, sel_collectionView_didEndDisplayingCell_forItemAtIndexPath_, a3, v8, a5);
  _importGridLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[PUImportViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:]";
    _os_log_debug_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "cancelThumbnailLoadIfActive");

}

- (void)_selectCell:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "representedImportItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[PUImportViewController _selectCell:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%s: model: %@ cell: %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5)
  {
    -[PUImportViewController importController](self, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectItem:", v5);

    objc_msgSend(v4, "setSelected:", 1);
  }

}

- (void)_deselectCell:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "representedImportItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[PUImportViewController _deselectCell:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%s: model: %@ cell: %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5)
  {
    -[PUImportViewController importController](self, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deselectItem:", v5);

    objc_msgSend(v4, "setSelected:", 0);
  }

}

- (void)_updateCell:(id)a3 atIndex:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[2];
  uint8_t buf[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _importGridLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[PUImportViewController _updateCell:atIndex:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "refreshThumbnail");
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showImportItemFilenames");

  if (v10)
  {
    memset(buf, 0, 32);
    -[PUImportViewController importDataSource](self, "importDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    PXSimpleIndexPathFromIndexPath();

    -[PUImportViewController importDataSource](self, "importDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *(_OWORD *)buf;
    v17[1] = *(_OWORD *)&buf[16];
    objc_msgSend(v12, "assetAtItemIndexPath:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "debugDisplayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ [%lu]"), v15, objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDebugLabel:", v16);

  }
  else
  {
    objc_msgSend(v6, "updateDebugLabel:", 0);
  }

}

- (void)_updateItemViewAtIndex:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importGridLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "-[PUImportViewController _updateItemViewAtIndex:]";
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PUImportViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUImportViewController _updateCell:atIndex:](self, "_updateCell:atIndex:", v7, v4);
  }
  else
  {
    _importGridLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[PUImportViewController _updateItemViewAtIndex:]";
      v11 = 2112;
      v12 = v4;
      _os_log_debug_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "%s: Warning missing cell for index %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_beginUninterruptibleOperation
{
  NSObject *v3;
  unint64_t busyCount;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUImportViewController _beginUninterruptibleOperation]";
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  busyCount = self->_busyCount;
  if (!busyCount)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdleTimerDisabled:", 1);

    busyCount = self->_busyCount;
  }
  self->_busyCount = busyCount + 1;
}

- (void)_endUninterruptibleOperation
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUImportViewController _endUninterruptibleOperation]";
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = self->_busyCount - 1;
  self->_busyCount = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdleTimerDisabled:", 0);

  }
}

- (void)_beginImport
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PUImportViewController _beginImport]";
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PUImportViewController _beginUninterruptibleOperation](self, "_beginUninterruptibleOperation");
  -[PUImportViewController _importControllerWillBeginAction](self, "_importControllerWillBeginAction");
}

- (void)_endImport
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PUImportViewController _endImport]";
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PUImportViewController _endUninterruptibleOperation](self, "_endUninterruptibleOperation");
  -[PUImportViewController _importControllerDidEndAction](self, "_importControllerDidEndAction");
}

- (void)_deleteItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importGridLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[PUImportViewController _deleteItems:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  if (!objc_msgSend(v4, "count"))
    _PFAssertContinueHandler();
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PUImportViewController _deleteItems:]";
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%s: Delete operation starting", (uint8_t *)&v7, 0xCu);
  }

  -[PUImportActionCoordinator deleteItemsWithoutConfirmation:](self->_actionCoordinator, "deleteItemsWithoutConfirmation:", v4);
}

- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  NSObject *v6;
  _BOOL4 v7;
  PXImportSessionInfo *completedImportSessionInfo;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_importCompleteNotification == a3)
  {
    if (!self->_completedImportSessionInfo)
      _PFAssertContinueHandler();
    _importGridLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a4 == 1)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Import Complete Dialog: Deleting imported items.", buf, 2u);
      }

      -[PXImportSessionInfo importedItems](self->_completedImportSessionInfo, "importedItems");
      v6 = objc_claimAutoreleasedReturnValue();
      -[PUImportViewController _deleteItems:](self, "_deleteItems:", v6);
    }
    else if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Import Complete Dialog: Keeping imported items.", v9, 2u);
    }

    completedImportSessionInfo = self->_completedImportSessionInfo;
    self->_completedImportSessionInfo = 0;

    CFRelease(self->_importCompleteNotification);
    self->_importCompleteNotification = 0;
  }
}

- (BOOL)isBusy
{
  return self->_busyCount != 0;
}

- (BOOL)isImporting
{
  void *v2;
  char v3;

  -[PUImportViewController importController](self, "importController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImportingAssets");

  return v3;
}

- (void)_cancelAlerts
{
  NSObject *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint8_t v7[16];

  if (self->_importCompleteNotification)
  {
    PLCameraConnectionKitGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "Cancelling notification", v7, 2u);
    }

    CFUserNotificationCancel(self->_importCompleteNotification);
    CFRelease(self->_importCompleteNotification);
    self->_importCompleteNotification = 0;
  }
  -[PUImportViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUImportViewController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[PUImportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", isKindOfClass & 1, 0);
  }
}

- (PHImportSource)importSource
{
  void *v2;
  void *v3;

  -[PUImportViewController importController](self, "importController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHImportSource *)v3;
}

- (void)setImportSource:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PUImportFakePhotosDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PUImportFakePhotosDataSource *v16;
  void *v17;
  void *v18;
  PUImportActionCoordinator *v19;
  void *v20;
  PUImportActionCoordinator *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showNewestItemsInGridUntilScrolled");

    if ((_DWORD)v5)
      v6 = 1;
    else
      v6 = -1;
    v7 = objc_alloc(MEMORY[0x1E0D7B518]);
    -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithImportSource:photoLibrary:imageFormat:dateOrder:", v27, v8, objc_msgSend((id)objc_opt_class(), "defaultThumbnailImageFormat"), v6);
    -[PUImportViewController setImportController:](self, "setImportController:", v9);

    -[PUImportViewController importController](self, "importController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImportCompletionDelegate:", self);

    v11 = [PUImportFakePhotosDataSource alloc];
    -[PUImportViewController importController](self, "importController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUImportFakePhotosDataSource initWithImportDataSource:photoLibrary:](v11, "initWithImportDataSource:photoLibrary:", v14, v15);
    -[PUImportViewController setFakePhotosDataSource:](self, "setFakePhotosDataSource:", v16);

    -[PUImportViewController fakePhotosDataSource](self, "fakePhotosDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController setPhotosDataSource:](self, "setPhotosDataSource:", v17);

    -[PUImportViewController setShouldStayScrolledToBottom:](self, "setShouldStayScrolledToBottom:", v5);
    -[PUImportViewController importController](self, "importController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadAssets");

    v19 = [PUImportActionCoordinator alloc];
    -[PUImportViewController importController](self, "importController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PUImportActionCoordinator initWithViewController:importController:loggingSource:](v19, "initWithViewController:importController:loggingSource:", self, v20, 0);
    -[PUImportViewController setActionCoordinator:](self, "setActionCoordinator:", v21);

    -[PUImportViewController actionCoordinator](self, "actionCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPresentsAdditionalDeleteAllConfirmation:", 1);

    -[PUImportViewController actionCoordinator](self, "actionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    -[PUImportViewController enableSwipeSelection](self, "enableSwipeSelection");
  }
  else
  {
    -[PUImportViewController setActionCoordinator:](self, "setActionCoordinator:", 0);
    -[PUImportViewController importController](self, "importController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shutdown");

    -[PUImportViewController setImportController:](self, "setImportController:", 0);
    -[PUImportViewController _cancelAlerts](self, "_cancelAlerts");
    if (self->_completedAnImport)
    {
      -[PUImportViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "superview");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        self->_completedAnImport = 0;
    }
    -[PUImportViewController disableSwipeSelection](self, "disableSwipeSelection");
  }

}

- (void)setImportController:(id)a3
{
  PXImportController *v5;
  id *p_importController;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXImportController *v14;

  v5 = (PXImportController *)a3;
  p_importController = (id *)&self->_importController;
  if (self->_importController != v5)
  {
    v14 = v5;
    -[PUImportViewController unfilteredImportDataSourceManager](self, "unfilteredImportDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *p_importController;
      -[PUImportViewController unfilteredImportDataSourceManager](self, "unfilteredImportDataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeDataSourceManager:", v9);

      -[PUImportViewController setUnfilteredImportDataSourceManager:](self, "setUnfilteredImportDataSourceManager:", 0);
    }
    objc_msgSend(*p_importController, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterChangeObserver:context:", self, PUImportSelectionManagerObserverContext_41013);

    objc_msgSend(*p_importController, "unregisterChangeObserver:context:", self, PXImportControllerObserverContext_41011);
    objc_storeStrong((id *)&self->_importController, a3);
    objc_msgSend(*p_importController, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController setImportDataSourceManager:](self, "setImportDataSourceManager:", v11);

    -[PUImportViewController setUserWantsAlreadyImportedSectionCollapsedIfPossible:](self, "setUserWantsAlreadyImportedSectionCollapsedIfPossible:", 1);
    -[PUImportViewController setShouldCollapseAlreadyImportedSection:](self, "setShouldCollapseAlreadyImportedSection:", -[PUImportViewController userWantsAlreadyImportedSectionCollapsedIfPossible](self, "userWantsAlreadyImportedSectionCollapsedIfPossible"));
    -[PUImportViewController updateDataSourceManagerFilters](self, "updateDataSourceManagerFilters");
    objc_msgSend(*p_importController, "registerChangeObserver:context:", self, PXImportControllerObserverContext_41011);
    objc_msgSend(*p_importController, "selectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerChangeObserver:context:", self, PUImportSelectionManagerObserverContext_41013);

    objc_msgSend(*p_importController, "createDataSourceManagerWithLogIdentifier:", CFSTR("unfiltered"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController setUnfilteredImportDataSourceManager:](self, "setUnfilteredImportDataSourceManager:", v13);

    v5 = v14;
  }

}

- (void)setImportDataSourceManager:(id)a3
{
  PXImportAssetsDataSourceManager *v5;
  PXImportAssetsDataSourceManager **p_importDataSourceManager;
  PXImportAssetsDataSourceManager *importDataSourceManager;
  void *v8;
  PXImportAssetsDataSourceManager *v9;

  v5 = (PXImportAssetsDataSourceManager *)a3;
  p_importDataSourceManager = &self->_importDataSourceManager;
  importDataSourceManager = self->_importDataSourceManager;
  if (importDataSourceManager != v5)
  {
    v9 = v5;
    -[PXImportAssetsDataSourceManager unregisterChangeObserver:context:](importDataSourceManager, "unregisterChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext_41012);
    objc_storeStrong((id *)&self->_importDataSourceManager, a3);
    -[PXImportAssetsDataSourceManager dataSource](*p_importDataSourceManager, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController setImportDataSource:](self, "setImportDataSource:", v8);

    -[PXImportAssetsDataSourceManager registerChangeObserver:context:](*p_importDataSourceManager, "registerChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext_41012);
    v5 = v9;
  }

}

- (void)setUnfilteredImportDataSourceManager:(id)a3
{
  PXImportAssetsDataSourceManager *v5;
  PXImportAssetsDataSourceManager *unfilteredImportDataSourceManager;
  PXImportAssetsDataSourceManager *v7;

  v5 = (PXImportAssetsDataSourceManager *)a3;
  unfilteredImportDataSourceManager = self->_unfilteredImportDataSourceManager;
  if (unfilteredImportDataSourceManager != v5)
  {
    v7 = v5;
    -[PXImportAssetsDataSourceManager unregisterChangeObserver:context:](unfilteredImportDataSourceManager, "unregisterChangeObserver:context:", self, PUImportUnfilteredAssetsDataSourceManagerObserverContext);
    objc_storeStrong((id *)&self->_unfilteredImportDataSourceManager, a3);
    -[PXImportAssetsDataSourceManager registerChangeObserver:context:](self->_unfilteredImportDataSourceManager, "registerChangeObserver:context:", self, PUImportUnfilteredAssetsDataSourceManagerObserverContext);
    v5 = v7;
  }

}

- (void)setImportDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PXImportAssetsDataSource *importDataSource;
  id v10;
  PXImportAssetsDataSource *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importGridLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[PXImportAssetsDataSource identifier](self->_importDataSource, "identifier");
    v7 = -[PXImportAssetsDataSource numberOfSections](self->_importDataSource, "numberOfSections");
    v8 = -[PXImportAssetsDataSource numberOfItems](self->_importDataSource, "numberOfItems");
    v13 = 136316674;
    v14 = "-[PUImportViewController setImportDataSource:]";
    v15 = 2048;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = objc_msgSend(v4, "identifier");
    v23 = 2048;
    v24 = objc_msgSend(v4, "numberOfSections");
    v25 = 2048;
    v26 = objc_msgSend(v4, "numberOfItems");
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%s: Going from data source %lu (%lu sections, %lu assets) to %lu (%lu sections, %lu assets)", (uint8_t *)&v13, 0x48u);
  }

  importDataSource = self->_importDataSource;
  self->_importDataSource = (PXImportAssetsDataSource *)v4;
  v10 = v4;

  v11 = self->_importDataSource;
  -[PUImportViewController fakePhotosDataSource](self, "fakePhotosDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImportDataSource:", v11);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD block[5];
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];

  v6 = a4;
  v8 = a3;
  if ((void *)PXImportControllerObserverContext_41011 == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PUPhotosGridViewController invalidateEmptyPlaceholderView](self, "invalidateEmptyPlaceholderView");
    }
    else
    {
      if ((v6 & 2) != 0 || (v6 & 4) != 0)
        goto LABEL_19;
      if ((v6 & 8) != 0)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __55__PUImportViewController_observable_didChange_context___block_invoke;
        v27[3] = &unk_1E58ABD10;
        v27[4] = self;
        v21 = MEMORY[0x1E0C80D38];
        v22 = v27;
        goto LABEL_21;
      }
      if ((v6 & 0x10) == 0)
        goto LABEL_24;
    }
    -[PUPhotosGridViewController updateEmptyPlaceholderView](self, "updateEmptyPlaceholderView");
LABEL_19:
    -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", 0);
    goto LABEL_24;
  }
  if ((void *)PXImportAssetsDataSourceManagerObserverContext_41012 != a5)
  {
    if ((void *)PUImportUnfilteredAssetsDataSourceManagerObserverContext != a5)
    {
      if ((v6 & 1) != 0 && (void *)PUImportSelectionManagerObserverContext_41013 == a5)
      {
        -[PUImportViewController currentSelectionSnapshot](self, "currentSelectionSnapshot");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController importController](self, "importController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "selectionManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectionSnapshot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController setCurrentSelectionSnapshot:](self, "setCurrentSelectionSnapshot:", v12);

        objc_msgSend(v9, "selectedIndexPaths");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController currentSelectionSnapshot](self, "currentSelectionSnapshot");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "selectedIndexPaths");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v15)
        {

        }
        else
        {
          v16 = v15;
          v17 = objc_msgSend(v13, "isEqual:", v15);

          if ((v17 & 1) == 0)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_4;
            block[3] = &unk_1E58ABD10;
            block[4] = self;
            dispatch_async(MEMORY[0x1E0C80D38], block);
          }
        }

      }
      goto LABEL_24;
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_3;
    v24[3] = &unk_1E58ABD10;
    v24[4] = self;
    v21 = MEMORY[0x1E0C80D38];
    v22 = v24;
LABEL_21:
    dispatch_async(v21, v22);
    goto LABEL_24;
  }
  if ((v6 & 1) != 0)
  {
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_2;
    v25[3] = &unk_1E58ABCA8;
    v25[4] = self;
    v26 = v19;
    v20 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v25);

  }
LABEL_24:

}

- (void)handleNewDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUImportViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  if (v6 != objc_msgSend(v4, "identifier"))
  {
    if (-[PUImportViewController performingDataSourceChange](self, "performingDataSourceChange"))
    {
      _importGridLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = objc_msgSend(v4, "identifier");
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Collection view is performing changes, making pending data source: %ti", buf, 0xCu);
      }

      -[PUImportViewController setPendingDataSource:](self, "setPendingDataSource:", v4);
    }
    else
    {
      if (-[PUImportViewController px_isVisible](self, "px_isVisible"))
      {
        -[PUImportViewController importController](self, "importController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isLoadingInitialBatchOfAssets") & 1) != 0)
          v9 = 0;
        else
          v9 = -[PUImportViewController isViewAppearing](self, "isViewAppearing") ^ 1;

      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v5, "alreadyImportedCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfItems");

      objc_msgSend(v4, "alreadyImportedCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "numberOfItems");

      if (-[PUImportViewController shouldCollapseAlreadyImportedSection](self, "shouldCollapseAlreadyImportedSection"))
        v9 = ((v11 <= v13) | ~-[PUImportViewController isTransitioningToNewSize](self, "isTransitioningToNewSize")) & v9;
      -[PUImportViewController setPerformingDataSourceChange:](self, "setPerformingDataSourceChange:", 1);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__PUImportViewController_handleNewDataSource___block_invoke;
      v14[3] = &unk_1E58ABD10;
      v14[4] = self;
      -[PUImportViewController transitionFromDataSource:toDataSource:animated:completionHandler:](self, "transitionFromDataSource:toDataSource:animated:completionHandler:", v5, v4, v9, v14);
    }
  }

}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PUImportChangeDetailsCollectionViewHelper *v17;
  void *v18;
  PUImportChangeDetailsCollectionViewHelper *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "changeHistory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController changeDetailsHelper](self, "changeDetailsHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  if (!v15)
  {
    objc_initWeak(&location, self);
    v17 = [PUImportChangeDetailsCollectionViewHelper alloc];
    -[PUImportViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke;
    v24[3] = &unk_1E58A0E18;
    objc_copyWeak(&v25, &location);
    v19 = -[PUImportChangeDetailsCollectionViewHelper initWithCollectionView:dataSourceSettingHandler:](v17, "initWithCollectionView:dataSourceSettingHandler:", v18, v24);
    -[PUImportViewController setChangeDetailsHelper:](self, "setChangeDetailsHelper:", v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  -[PUImportViewController changeDetailsHelper](self, "changeDetailsHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2;
  v22[3] = &unk_1E58A0E40;
  v22[4] = self;
  v23 = v12;
  v21 = v12;
  objc_msgSend(v20, "transitionFromDataSource:toDataSource:changeHistory:animated:completionHandler:", v10, v11, v14, v7, v22);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && sel_delete_ == a3)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUImportViewController;
    v7 = -[PUPhotosGridViewController canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)delete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUImportViewController actionCoordinator](self, "actionCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteItemsFromBarButtonItem:", v4);

}

- (void)stopImport:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PUImportViewController stopImport:]";
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[PUImportViewController actionCoordinator](self, "actionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopImport");

}

- (void)importControllerProgressDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C418]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C410]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C428]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _PFAssertContinueHandler();
  objc_msgSend(v6, "doubleValue");
  v12 = v11;
  _importGridLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[PUImportViewController importControllerProgressDidChange:]";
    v26 = 2048;
    v27 = v12;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "%s: setting progress to %f ", buf, 0x16u);
  }

  if (v12 == 0.0)
  {
    -[PUImportViewController roundProgressView](self, "roundProgressView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetProgress");

  }
  -[PUImportViewController importController](self, "importController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "isDeletingAssets");

  PLLocalizedFrameworkString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController roundProgressView](self, "roundProgressView", v17, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProgress:", v12);

  -[PUImportViewController setNumItemsCompleted:](self, "setNumItemsCompleted:", objc_msgSend(v8, "integerValue"));
  -[PUImportViewController setNumTotalItemsToComplete:](self, "setNumTotalItemsToComplete:", objc_msgSend(v10, "integerValue"));
  -[UIBarButtonItem setAccessibilityLabel:](self->_progressButtonItem, "setAccessibilityLabel:", v18);
  if (v12 >= 1.0)
  {
    PLLocalizedFrameworkString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_progressButtonItem, "setAccessibilityLabel:", v20);

  }
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "showProgressTitles");

  if (v22)
    -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", 0);

}

- (void)didTapAddToAlbumsView:(id)a3
{
  id v4;

  objc_msgSend(a3, "destinationButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController presentAlbumPickerFromView:orBarItem:](self, "presentAlbumPickerFromView:orBarItem:", v4, 0);

}

- (void)showAlbumPicker:(id)a3
{
  PUImportViewController *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self;
    v5 = v7;
    v6 = 0;
LABEL_5:
    -[PUImportViewController presentAlbumPickerFromView:orBarItem:](v4, "presentAlbumPickerFromView:orBarItem:", v5, v6);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self;
    v5 = 0;
    v6 = v7;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)presentAlbumPickerFromView:(id)a3 orBarItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PUImportAddToLibraryAndAlbumsPickerViewController *v9;
  void *v10;
  PUImportAddToLibraryAndAlbumsPickerViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  if (!-[PUImportViewController performingAlbumPickerPresentation](self, "performingAlbumPickerPresentation"))
  {
    -[PUImportViewController destinationPickerViewController](self, "destinationPickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [PUImportAddToLibraryAndAlbumsPickerViewController alloc];
      -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PUImportAddToLibraryAndAlbumsPickerViewController initWithPhotoLibrary:](v9, "initWithPhotoLibrary:", v10);
      -[PUImportViewController setDestinationPickerViewController:](self, "setDestinationPickerViewController:", v11);

      -[PUImportViewController destinationPickerViewController](self, "destinationPickerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      -[PUImportViewController destinationPickerViewController](self, "destinationPickerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModalPresentationStyle:", 7);

    }
    -[PUImportViewController destinationPickerViewController](self, "destinationPickerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (v7)
      {
        objc_msgSend(v15, "setBarButtonItem:", v7);
      }
      else
      {
        objc_msgSend(v15, "setSourceView:", v6);
        objc_msgSend(v6, "bounds");
        objc_msgSend(v15, "setSourceRect:");
      }
      objc_msgSend(v15, "setDelegate:", self);
    }
    -[PUImportViewController setPerformingAlbumPickerPresentation:](self, "setPerformingAlbumPickerPresentation:", 1);
    -[PUImportViewController destinationPickerViewController](self, "destinationPickerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PUImportViewController_presentAlbumPickerFromView_orBarItem___block_invoke;
    v17[3] = &unk_1E58ABD10;
    v17[4] = self;
    -[PUImportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, v17);

  }
}

- (void)cancelAlbumPickerPopover:(id)a3
{
  -[PUImportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)destinationDescriptionForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXTargetLibraryTitleForDefaultType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "localizedTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v12[0] = v6;
      v12[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v6;
    }

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)accessibilityLabelForAlbumPickerControlWithDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  PLLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUImportViewController destinationDescriptionForCollection:](self, "destinationDescriptionForCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedStringWithValidatedFormat(v7, CFSTR("%@"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)collectionSelected:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PUImportViewController *v19;
  id v20;

  v4 = a3;
  -[PUImportViewController importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importDestinationAlbum");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    -[PUImportViewController importController](self, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImportDestinationAlbum:", v4);

    -[PUImportViewController destinationDescriptionForCollection:](self, "destinationDescriptionForCollection:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController compactWidthAlbumPickerBarButtonView](self, "compactWidthAlbumPickerBarButtonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __45__PUImportViewController_collectionSelected___block_invoke;
    v18 = &unk_1E58ABCA8;
    v19 = self;
    v20 = v8;
    v10 = v8;
    objc_msgSend(v9, "performChanges:", &v15);

    -[PUImportAddToAlbumsToolbarView setDestinationDescriptionTitle:](self->_addToAlbumsToolbarView, "setDestinationDescriptionTitle:", v10, v15, v16, v17, v18, v19);
    -[PUImportViewController importController](self, "importController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importDestinationAlbum");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController accessibilityLabelForAlbumPickerControlWithDestination:](self, "accessibilityLabelForAlbumPickerControlWithDestination:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIBarButtonItem setAccessibilityLabel:](self->_albumPickerBarItem, "setAccessibilityLabel:", v13);
    -[PUImportViewController compactWidthAlbumPickerButton](self, "compactWidthAlbumPickerButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomAccessibilityLabel:", v13);

  }
}

- (void)targetLibrarySelected:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PUImportViewController *v13;
  id v14;

  -[PUImportViewController importController](self, "importController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importDestinationAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController destinationDescriptionForCollection:](self, "destinationDescriptionForCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController compactWidthAlbumPickerBarButtonView](self, "compactWidthAlbumPickerBarButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__PUImportViewController_targetLibrarySelected___block_invoke;
  v12 = &unk_1E58ABCA8;
  v13 = self;
  v14 = v6;
  v8 = v6;
  objc_msgSend(v7, "performChanges:", &v9);

  -[PUImportAddToAlbumsToolbarView setDestinationDescriptionTitle:](self->_addToAlbumsToolbarView, "setDestinationDescriptionTitle:", v8, v9, v10, v11, v12, v13);
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5;
  void *v6;

  objc_msgSend(a3, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      v6 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PUImportViewController _navigationViewControllerForViewController:](self, "_navigationViewControllerForViewController:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_navigationViewControllerForViewController:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0DC3A40];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);
  PLLocalizedFrameworkString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAlbumPickerPopover_);
  objc_msgSend(v5, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLeftBarButtonItem:", v9);
  return v6;
}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
  -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", 0);
}

- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5
{
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PUImportViewController actionCoordinator:didCompleteWithImportSession:results:]";
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[PUImportViewController _endImport](self, "_endImport");
}

- (void)actionCoordinatorWillBeginDelete:(id)a3
{
  -[PUImportViewController _beginUninterruptibleOperation](self, "_beginUninterruptibleOperation", a3);
  -[PUImportViewController _importControllerWillBeginAction](self, "_importControllerWillBeginAction");
}

- (void)actionCoordinatorDidBeginDelete:(id)a3
{
  -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", 0);
}

- (void)actionCoordinatorDidEndDelete:(id)a3
{
  -[PUImportViewController _endUninterruptibleOperation](self, "_endUninterruptibleOperation", a3);
  -[PUImportViewController _importControllerDidEndAction](self, "_importControllerDidEndAction");
  -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 1);
}

- (id)importDestinationForActionCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[PUImportViewController importController](self, "importController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importDestinationAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_importControllerDidEndAction
{
  self->_allowsSelection = 1;
  -[PUImportViewController setNumItemsCompleted:](self, "setNumItemsCompleted:", 0);
  -[PUImportViewController setNumTotalItemsToComplete:](self, "setNumTotalItemsToComplete:", 0);
  -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", 0);
}

- (void)_importControllerWillBeginAction
{
  self->_allowsSelection = 0;
  -[PUImportViewController setNumItemsCompleted:](self, "setNumItemsCompleted:", 0);
  -[PUImportViewController setNumTotalItemsToComplete:](self, "setNumTotalItemsToComplete:", 0);
}

- (void)importController:(id)a3 didCompleteImportWithImportSession:(id)a4 results:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  _importGridLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PUImportViewController importController:didCompleteImportWithImportSession:results:completion:]";
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v13 = dispatch_time(0, 500000000);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__PUImportViewController_importController_didCompleteImportWithImportSession_results_completion___block_invoke;
  v17[3] = &unk_1E58A5C48;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v17);

}

- (void)importController:(id)a3 didLoadAssets:(id)a4 exceptions:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (!objc_msgSend(a4, "count") && objc_msgSend(v6, "count"))
  {
    _importGridLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Error(s) loading assets: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)notifyUserOfImportCompletionIfNeededWithImportSession:(id)a3 results:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PXImportSessionInfo **p_completedImportSessionInfo;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  int v31;
  uint64_t i;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __CFUserNotification *v40;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v42;
  __CFRunLoop *Current;
  __CFUserNotification *importCompleteNotification;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t v52[16];
  uint8_t buf[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PUImportViewController importController](self, "importController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "importSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  p_completedImportSessionInfo = &self->_completedImportSessionInfo;
  objc_storeStrong((id *)&self->_completedImportSessionInfo, a3);
  if (!self->_completedImportSessionInfo)
    _PFAssertContinueHandler();
  objc_msgSend(v8, "importRecords");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    self->_completedAnImport = 0;
    objc_msgSend(0, "canDeleteContent");
    goto LABEL_52;
  }
  -[PXImportSessionInfo importedItems](*p_completedImportSessionInfo, "importedItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_completedAnImport = objc_msgSend(v13, "count") != 0;

  v14 = objc_msgSend(v10, "canDeleteContent");
  -[PXImportSessionInfo importedItems](*p_completedImportSessionInfo, "importedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
    v17 = v14 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v18 = -[PXImportSessionInfo importStopped](*p_completedImportSessionInfo, "importStopped");
    _importGridLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "Showing Import Complete Dialog: Import Stopped", buf, 2u);
      }
    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "Showing Import Complete Dialog: Import Complete", buf, 2u);
    }

    PLLocalizedFrameworkString();
    v21 = objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("KEEPORDELETE_"));
    v46 = v12;
    v47 = v7;
    v48 = (void *)v21;
    v49 = v22;
    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "importAsset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "isImage") && !objc_msgSend(v24, "isLivePhoto"))
      {
        v25 = CFSTR("PHOTO_");
      }
      else if (objc_msgSend(v24, "isMovie"))
      {
        v25 = CFSTR("VIDEO_");
      }
      else
      {
        v25 = CFSTR("MEDIA_");
      }
      objc_msgSend(v22, "appendString:", v25);

      goto LABEL_42;
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v26 = v12;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v55;
      v30 = 1;
      v31 = 1;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "importAsset");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "isImage") & 1) != 0)
          {
            v31 = 0;
          }
          else
          {
            v30 = 0;
            v31 &= objc_msgSend(v33, "isMovie");
          }

          if ((v30 & 1) == 0 && !v31)
          {

            v22 = v49;
            objc_msgSend(v49, "appendString:", CFSTR("MEDIA_"));
            v21 = (uint64_t)v48;
            goto LABEL_42;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v28)
          continue;
        break;
      }

      v21 = (uint64_t)v48;
      if ((v30 & 1) == 0)
      {
        v22 = v49;
        if (!v31)
          goto LABEL_42;
        v34 = CFSTR("VIDEOS_");
        goto LABEL_39;
      }
    }
    else
    {

    }
    v34 = CFSTR("PHOTOS_");
    v22 = v49;
LABEL_39:
    objc_msgSend(v22, "appendString:", v34);
LABEL_42:
    objc_msgSend(v10, "productKind");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("Camera")) & 1) != 0 || !objc_msgSend(v36, "length"))
    {
      objc_msgSend(v22, "appendString:", v35);
      PLLocalizedFrameworkString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v22, "appendString:", CFSTR("FORMAT"));
      PLLocalizedFrameworkString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PUStringWithValidatedFormat();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = v47;
    *(_DWORD *)buf = 0;
    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v39, "setObject:forKey:", v21, *MEMORY[0x1E0C9B800]);
    objc_msgSend(v39, "setObject:forKey:", v38, *MEMORY[0x1E0C9B810]);
    objc_msgSend(v39, "setObject:forKey:", v51, *MEMORY[0x1E0C9B838]);
    objc_msgSend(v39, "setObject:forKey:", v50, *MEMORY[0x1E0C9B830]);
    v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v39);
    self->_importCompleteNotification = v40;
    RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v40, (CFUserNotificationCallBack)_ImportCompleteAlertNotificationResponseHandler, 0);
    if (RunLoopSource)
    {
      v42 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v42, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      importCompleteNotification = v42;
    }
    else
    {
      PLCameraConnectionKitGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_1AAB61000, v45, OS_LOG_TYPE_ERROR, "Couldn't create runloop source for notification", v52, 2u);
      }

      importCompleteNotification = self->_importCompleteNotification;
    }
    CFRelease(importCompleteNotification);

    v12 = v46;
  }
LABEL_52:

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUImportViewController collectionView](self, "collectionView", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[PUImportViewController _updateItemViewAtIndex:](self, "_updateItemViewAtIndex:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (CGSize)gridItemSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  CGSize result;

  -[PUImportViewController _gridLayout](self, "_gridLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemSize");
  v4 = v3;
  v6 = v5;

  if (v4 == *MEMORY[0x1E0C9D820] && v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    _PFAssertContinueHandler();
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)importCell:(id)a3 requestImageForImportItem:(id)a4 ofSize:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  if (v9)
  {
    v10 = a4;
    -[PUImportViewController importController](self, "importController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importMediaProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__PUImportViewController_importCell_requestImageForImportItem_ofSize_completion___block_invoke;
    v15[3] = &unk_1E58A0E68;
    v16 = v9;
    v13 = objc_msgSend(v12, "requestImageForImportItem:ofSize:completion:", v10, a5, v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)importCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  void *v5;
  id v6;

  -[PUImportViewController importController](self, "importController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importMediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelImageRequest:", a4);

}

- (int64_t)contentFillModeForImportCell:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUImportViewController _spec](self, "_spec", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cellFillMode");

  return v4;
}

- (BOOL)canDragOut
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[PUImportViewController canDragOut]";
    _os_log_debug_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEBUG, "%s: [PUPhotosGridViewController] super squash", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  char v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[PUImportViewController updateNavigationBarAnimated:]";
    _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s: [PUPhotosGridViewController] super squash", (uint8_t *)&v8, 0xCu);
  }

  -[PUImportViewController importController](self, "importController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLoadingContent");

  if ((v7 & 1) == 0)
    -[PUImportViewController _updateToolbarAnimated:](self, "_updateToolbarAnimated:", v3);
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[PUImportViewController importDataSource](self, "importDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems") == 0;

  return v3;
}

- (BOOL)wantsPlaceholderView
{
  BOOL v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  char v8;

  v3 = -[PUImportViewController isEmpty](self, "isEmpty");
  -[PUImportViewController importController](self, "importController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoadingInitialBatchOfAssets");

  v6 = -[PUImportViewController importSourceIsAppleDevice](self, "importSourceIsAppleDevice");
  -[PUImportViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUserRequiredToTrustHostOnSourceDevice");

  if ((v8 & 1) != 0)
    return 1;
  else
    return v3 & (v5 & v6 | v5 ^ 1);
}

- (BOOL)importSourceIsAppleDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[PUImportViewController importController](self, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController importController](self, "importController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_msgSend(v5, "isEqualToString:", CFSTR("Camera")) & 1) == 0 && objc_msgSend(v8, "length") != 0;
  return v9;
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;

  if (!-[PUImportViewController importSourceIsAppleDevice](self, "importSourceIsAppleDevice"))
    goto LABEL_7;
  -[PUImportViewController importController](self, "importController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUserRequiredToTrustHostOnSourceDevice");

  -[PUImportViewController importController](self, "importController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    v19 = objc_msgSend(v13, "isLoadingInitialBatchOfAssets");

    if (v19)
    {
      -[PUImportViewController importController](self, "importController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "importSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      PLLocalizedFrameworkString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedStringWithValidatedFormat(v17, CFSTR("%@"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = 0;
      *a5 = 0;
      *a6 = 0;
      goto LABEL_6;
    }
LABEL_7:
    PLLocalizedFrameworkString();
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v16;
    goto LABEL_8;
  }
  objc_msgSend(v13, "importSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "productKind");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNLOCK_DEVICE_%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedFrameworkString();
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a3 = v18;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;

LABEL_6:
LABEL_8:

  PLLocalizedFrameworkString();
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a4 = v22;
  *a5 = 0;
  *a6 = 0;

}

- (id)newGridLayout
{
  PUImportSectionedGridLayout *v3;

  v3 = objc_alloc_init(PUImportSectionedGridLayout);
  -[PUImportSectionedGridLayout setDelegate:](v3, "setDelegate:", self);
  -[PUSectionedGridLayout setSectionHeaderElementKind:](v3, "setSectionHeaderElementKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  -[PUImportViewController configureCollectionViewGridLayout:](self, "configureCollectionViewGridLayout:", v3);
  return v3;
}

- (void)updateAlreadyImportedHeaderIfVisible
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUImportViewController importDataSource](self, "importDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alreadyImportedCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController importDataSource](self, "importDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionForAssetCollection:", v11);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "containsObject:", v6))
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUImportSectionHeaderReuseIdentifier"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v10, CFSTR("PUImportSectionHeaderReuseIdentifier"), v6);
  }

}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  __int128 v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PUImportSectionHeaderReuseIdentifier")) & 1) != 0)
  {
    v11 = v8;
    -[PUImportViewController importDataSource](self, "importDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetCollectionForSection:", objc_msgSend(v10, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "localizedTitle");
    v14 = objc_claimAutoreleasedReturnValue();
    -[PUImportViewController importDataSource](self, "importDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "identifier");
    v17 = objc_msgSend(v10, "section");

    v29[0] = v16;
    v29[1] = v17;
    v30 = xmmword_1AB0EF310;
    objc_msgSend(v11, "setSectionIndexPath:", v29);
    v28 = (void *)v14;
    objc_msgSend(v11, "setPrimaryText:", v14);
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unfilteredDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetCollectionForIdentifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "numberOfItems");
    if (v22 < 1)
    {
      v25 = 0;
    }
    else
    {
      v23 = v22;
      PULocalizedString(CFSTR("IMPORT_ITEMS_COUNT"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v23;
      PULocalizedStringWithValidatedFormat(v24, CFSTR("%d"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "setSecondaryText:", v25, v27);
    if (objc_msgSend(v13, "alreadyImportedGroup"))
      -[PUImportViewController updateHeaderView:forAlreadyImportedAssetCollection:](self, "updateHeaderView:forAlreadyImportedAssetCollection:", v11, v21);
    else
      -[PUImportViewController updateHeaderView:forAssetCollection:](self, "updateHeaderView:forAssetCollection:", v11, v21);
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sectionHeaderInsets");
    objc_msgSend(v11, "setContentInsets:");

    -[PUImportViewController _updateBackdropGroupNameForHeaderView:](self, "_updateBackdropGroupNameForHeaderView:", v11);
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PUImportViewController;
    -[PUPhotosGridViewController configureSupplementaryView:ofKind:forIndexPath:](&v31, sel_configureSupplementaryView_ofKind_forIndexPath_, v8, v9, v10);
  }

}

- (void)_updateBackdropGroupNameForHeaderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PUImportViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_backdropViewLayerGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackdropViewGroupName:", v6);

}

- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 title:(id *)a5 startDate:(id *)a6 endDate:(id *)a7
{
  void *v10;
  id v11;

  -[PUImportViewController importDataSource](self, "importDataSource", a3, a4, a5, a6, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollectionForSection:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(v11, "localizedTitle");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = 0;

}

- (void)configureCollectionViewGridLayout:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSectionTopPadding:", 1.0);
  objc_msgSend(v3, "setFloatingSectionHeadersEnabled:", 1);

}

- (BOOL)isContentViewInSyncWithModel
{
  return 1;
}

- (BOOL)isPreheatingEnabled
{
  return 0;
}

- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PUImportViewController *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v13 = 0;
  if (v7)
    objc_msgSend(v7, "sectionIndexPath", 0);
  -[PUImportViewController importDataSource](self, "importDataSource", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetCollectionForSection:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "alreadyImportedGroup"))
  {
    -[PUImportViewController toggleAlreadyImportedExpansion](self, "toggleAlreadyImportedExpansion");
  }
  else
  {
    if (-[PUImportViewController areAllItemsSelectedInAssetCollection:](self, "areAllItemsSelectedInAssetCollection:", v10))
    {
      v11 = self;
      v12 = 0;
    }
    else
    {
      v11 = self;
      v12 = 1;
    }
    -[PUImportViewController setAllItemsSelected:inAssetCollection:](v11, "setAllItemsSelected:inAssetCollection:", v12, v10);
  }

}

- (void)updateHeaderView:(id)a3 forAlreadyImportedAssetCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PUPhotosGridViewController gridLayout](self, "gridLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "columnsPerRow");

  v9 = objc_msgSend(v6, "numberOfItems");
  if (v9 <= v8)
  {
    objc_msgSend(v13, "setShowsActionButton:", 0);
    objc_msgSend(v13, "setActionText:", 0);
  }
  else
  {
    objc_msgSend(v13, "setShowsActionButton:", 1);
    -[PUImportViewController shouldCollapseAlreadyImportedSection](self, "shouldCollapseAlreadyImportedSection");
    PLLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActionText:", v10);

    v11 = -[PUImportViewController anyAlreadyImportedItemsAreSelected](self, "anyAlreadyImportedItemsAreSelected");
    if (-[PUImportViewController animateHeaderActionButtonChanges](self, "animateHeaderActionButtonChanges"))
      v12 = -[PUImportViewController px_isVisible](self, "px_isVisible");
    else
      v12 = 0;
    objc_msgSend(v13, "setActionButtonEnabled:animated:", !v11, v12);
  }
  objc_msgSend(v13, "layoutIfNeeded");

}

- (void)updateHeaderView:(id)a3 forAssetCollection:(id)a4
{
  __CFString *v6;
  void *v7;
  id v8;

  v8 = a3;
  LODWORD(a4) = -[PUImportViewController areAllItemsSelectedInAssetCollection:](self, "areAllItemsSelectedInAssetCollection:", a4);
  objc_msgSend(v8, "setShowsActionButton:", 1);
  if ((_DWORD)a4)
    v6 = CFSTR("DESELECT_BUTTON_TITLE");
  else
    v6 = CFSTR("SELECT_BUTTON_TITLE");
  PULocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionText:", v7);

  objc_msgSend(v8, "layoutIfNeeded");
}

- (BOOL)sectionHeadersCoverLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  -[PUImportViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  v8 = v7;
  v10 = v9;

  -[PUImportViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[PUImportViewController collectionView](self, "collectionView", (_QWORD)v23);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v19, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUImportSectionHeaderReuseIdentifier"), v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "bounds");
        objc_msgSend(v20, "convertRect:toView:", 0);
        v29.x = v8;
        v29.y = v10;
        LOBYTE(v19) = CGRectContainsPoint(v30, v29);

        if ((v19 & 1) != 0)
        {
          v21 = 1;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_11:

  return v21;
}

- (void)setAllItemsSelected:(BOOL)a3 inAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__40917;
  v13 = __Block_byref_object_dispose__40918;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PUImportViewController_setAllItemsSelected_inAssetCollection___block_invoke;
  v8[3] = &unk_1E58A0E90;
  v8[4] = &v9;
  objc_msgSend(v6, "arrangedObjects:", v8);
  -[PUImportViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:forItems:", v4, v10[5]);

  _Block_object_dispose(&v9, 8);
}

- (BOOL)areAllItemsSelectedInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[PUImportViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionForAssetCollection:", v4);
  -[PUImportViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PUImportViewController_areAllItemsSelectedInAssetCollection___block_invoke;
  v13[3] = &unk_1E58A0EB8;
  v13[4] = &v14;
  v13[5] = v6;
  objc_msgSend(v10, "enumerateItemIndexPathsUsingBlock:", v13);
  v11 = objc_msgSend(v4, "numberOfItems");
  LOBYTE(v6) = v15[3] == v11;
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)selectAllSelectableItems
{
  void *v3;
  void *v4;
  id v5;

  -[PUImportViewController importDataSource](self, "importDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSelectableItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController importController](self, "importController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:forItems:", 1, v5);

}

- (void)toggleAlreadyImportedExpansion
{
  -[PUImportViewController setUserWantsAlreadyImportedSectionCollapsedIfPossible:](self, "setUserWantsAlreadyImportedSectionCollapsedIfPossible:", -[PUImportViewController userWantsAlreadyImportedSectionCollapsedIfPossible](self, "userWantsAlreadyImportedSectionCollapsedIfPossible") ^ 1);
  -[PUImportViewController updateAlreadyImportedCollapseStatus](self, "updateAlreadyImportedCollapseStatus");
}

- (void)updateAlreadyImportedCollapseStatus
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = -[PUImportViewController anyAlreadyImportedItemsAreSelected](self, "anyAlreadyImportedItemsAreSelected");
  -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unfilteredAlreadyImportedAssetCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v9, "numberOfItems");
  -[PUPhotosGridViewController gridLayout](self, "gridLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "columnsPerRow");

  if (-[PUImportViewController userWantsAlreadyImportedSectionCollapsedIfPossible](self, "userWantsAlreadyImportedSectionCollapsedIfPossible"))
  {
    v8 = (v5 > v7) & ~v3;
  }
  else
  {
    v8 = 0;
  }
  -[PUImportViewController setShouldCollapseAlreadyImportedSection:](self, "setShouldCollapseAlreadyImportedSection:", v8);
  -[PUImportViewController updateAlreadyImportedHeaderIfVisible](self, "updateAlreadyImportedHeaderIfVisible");
  -[PUImportViewController updateDataSourceManagerFilters](self, "updateDataSourceManagerFilters");

}

- (BOOL)anyAlreadyImportedItemsAreSelected
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[PUImportViewController importController](self, "importController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alreadyImportedCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "sectionForAssetCollection:", v6);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    objc_msgSend(v4, "selectedIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PUImportViewController_anyAlreadyImportedItemsAreSelected__block_invoke;
    v11[3] = &unk_1E58A0EB8;
    v11[4] = &v12;
    v11[5] = v7;
    objc_msgSend(v8, "enumerateItemIndexPathsUsingBlock:", v11);

    v9 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double Width;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  CGRect v25;

  -[PUImportViewController referenceHeaderView](self, "referenceHeaderView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController cachedHeaderHeight](self, "cachedHeaderHeight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v6, CFSTR("PUImportSectionHeaderReuseIdentifier"), v8);
    -[PUImportViewController traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "horizontalSizeClass");
    -[PUImportViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    Width = CGRectGetWidth(v25);
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionHeaderInsets");
    objc_msgSend(v6, "heightForSizeClass:width:safeAreaInsets:", v10, Width, v14, v15, v16, v17);
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController setCachedHeaderHeight:](self, "setCachedHeaderHeight:", v20);

  }
  -[PUImportViewController cachedHeaderHeight](self, "cachedHeaderHeight");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  return v23;
}

- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGRect v19;

  v6 = a3;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
  {
    -[PUImportViewController _spec](self, "_spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sectionHeaderStyle");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B800], "sharedMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    objc_msgSend(v13, "accessibilitySectionHeaderHeightForStyle:width:actionButton:disclosure:title:startDate:endDate:locations:actionButtonSpec:", v10, 0, 0, &stru_1E58AD278, v11, v12, CGRectGetWidth(v19) + -8.0 + -8.5, MEMORY[0x1E0C9AA60], 0);
    v16 = v15;

  }
  else
  {
    -[PUImportViewController sectionedGridLayout:sectionHeaderHeightForVisualSection:](self, "sectionedGridLayout:sectionHeaderHeightForVisualSection:", v6, a4);
    v16 = v17;
  }

  return v16;
}

- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  _OWORD v13[2];
  uint8_t buf[16];
  __int128 v15;

  v5 = a4;
  if (v5)
  {
    *(_OWORD *)buf = 0u;
    v15 = 0u;
    -[PUImportViewController importDataSource](self, "importDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    PXSimpleIndexPathFromIndexPath();

    -[PUImportViewController importDataSource](self, "importDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v13, 0, sizeof(v13));
    objc_msgSend(v7, "assetAtItemIndexPath:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "aspectRatio");
      v10 = v9;
    }
    else
    {
      v10 = 1.0;
    }

  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "IndexPath missing for aspectRatioForItemAtIndexPath", buf, 2u);
    }

    v10 = -1.0;
  }

  return v10;
}

- (void)updateDataSourceManagerFilters
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];

  if (-[PUImportViewController shouldCollapseAlreadyImportedSection](self, "shouldCollapseAlreadyImportedSection"))
  {
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unfilteredAlreadyImportedAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "numberOfItems");
    -[PUPhotosGridViewController gridLayout](self, "gridLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "columnsPerRow");

    -[PUImportViewController importController](self, "importController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlreadyImportedItemsSelectable:", v5 <= v7);

  }
  else
  {
    -[PUImportViewController importController](self, "importController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlreadyImportedItemsSelectable:", 1);
  }

  if (-[PUImportViewController shouldCollapseAlreadyImportedSection](self, "shouldCollapseAlreadyImportedSection"))
  {
    -[PUPhotosGridViewController gridLayout](self, "gridLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "columnsPerRow");

    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
  }
  else
  {
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v11, "setMaxAlreadyImportedItems:", v13);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUImportViewController_updateDataSourceManagerFilters__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (id)oneUpViewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  PUImportOneUpViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  PUImportOneUpViewController *v16;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;

  v4 = a3;
  -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19 = 0uLL;
    v20 = 0uLL;
    objc_msgSend(v6, "identifier");
    PXSimpleIndexPathFromIndexPath();
  }
  else
  {
    v19 = 0uLL;
    v20 = 0uLL;
    if (v6)
      objc_msgSend(v6, "firstItemIndexPath");
  }
  v18[0] = v19;
  v18[1] = v20;
  objc_msgSend(v6, "assetReferenceAtItemIndexPath:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDuplicate"))
      v11 = 1;
    else
      v11 = 2;

  }
  else
  {
    v11 = 0;
  }
  v12 = [PUImportOneUpViewController alloc];
  -[PUImportViewController importController](self, "importController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController importController](self, "importController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "importMediaProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PUImportOneUpViewController initWithImportController:mediaProvider:startingAssetReference:presentationFilter:](v12, "initWithImportController:mediaProvider:startingAssetReference:presentationFilter:", v13, v15, v7, v11);

  return v16;
}

- (void)presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  PUNavigationController *v10;
  PUImportOneUpTransitionController *v11;
  void *v12;
  PUImportOneUpTransitionController *v13;
  uint8_t v14[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  _importGridLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Presenting Import One Up", v14, 2u);
  }

  v10 = -[PUNavigationController initWithNavigationBarClass:toolbarClass:]([PUNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", 0, objc_opt_class());
  -[PUNavigationController pushViewController:animated:](v10, "pushViewController:animated:", v8, 0);

  if (_os_feature_enabled_impl())
  {
    -[PUImportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v6, 0);
  }
  else
  {
    -[PUNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
    v11 = [PUImportOneUpTransitionController alloc];
    -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUImportOneUpTransitionController initWithPresentingViewController:pinchGestureRecognizer:](v11, "initWithPresentingViewController:pinchGestureRecognizer:", self, v12);

    -[UIViewController pu_presentViewController:transition:animated:interactive:completion:](self, "pu_presentViewController:transition:animated:interactive:completion:", v10, v13, v6, v5, 0);
  }

}

- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  PUPXAssetsDataSourceManager *v14;
  void *v15;
  PUPXAssetsDataSourceManager *v16;
  PUPXMediaProvider *v17;
  void *v18;
  void *v19;
  PUPXMediaProvider *v20;
  PUBrowsingSession *v21;
  void *v22;
  PUPXAssetsDataSourceManager *v23;
  id v24;
  id v25;
  PUOneUpViewController *v26;
  PUNavigationController *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  PUPXAssetsDataSourceManager *v32;
  _OWORD v33[4];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "usePhotosOneUp");

  if (v10)
  {
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "identifier");
    PXSimpleIndexPathFromIndexPath();
    memset(v33, 0, sizeof(v33));
    objc_msgSend(v12, "assetReferenceAtItemIndexPath:", v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [PUPXAssetsDataSourceManager alloc];
    -[PUImportViewController importDataSourceManager](self, "importDataSourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUPXAssetsDataSourceManager initWithUnderlyingDataSourceManager:](v14, "initWithUnderlyingDataSourceManager:", v15);

    v17 = [PUPXMediaProvider alloc];
    -[PUImportViewController importController](self, "importController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "importMediaProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PUPXMediaProvider initWithUnderlyingMediaProvider:](v17, "initWithUnderlyingMediaProvider:", v19);

    v21 = -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:]([PUBrowsingSession alloc], "initWithDataSourceManager:actionManager:mediaProvider:", v16, 0, v20);
    -[PUBrowsingSession viewModel](v21, "viewModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __75__PUImportViewController__navigateToPhotoAtIndexPath_animated_interactive___block_invoke;
    v29[3] = &unk_1E58AB790;
    v30 = v22;
    v31 = v13;
    v32 = v16;
    v23 = v16;
    v24 = v13;
    v25 = v22;
    objc_msgSend(v25, "performChanges:", v29);
    v26 = -[PUOneUpViewController initWithBrowsingSession:]([PUOneUpViewController alloc], "initWithBrowsingSession:", v21);
    v27 = -[PUNavigationController initWithNavigationBarClass:toolbarClass:]([PUNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", 0, objc_opt_class());
    -[PUNavigationController setModalPresentationStyle:](v27, "setModalPresentationStyle:", 0);
    -[PUNavigationController pushViewController:animated:](v27, "pushViewController:animated:", v26, 0);
    -[PUImportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

  }
  else
  {
    -[PUImportViewController oneUpViewControllerForItemAtIndexPath:](self, "oneUpViewControllerForItemAtIndexPath:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController presentOneUpViewController:animated:interactive:](self, "presentOneUpViewController:animated:interactive:", v28, v6, v5);

  }
}

- (void)handleTapGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PUPhotosGridViewController contentScrollView](self, "contentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationInView:", v4);
  v6 = v5;
  v8 = v7;
  if (!-[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:")
    && !-[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v6, v8))
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItemAtPoint:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "handleTapGesture:", v13);
  }

}

- (BOOL)canBeginDoubleTapGesture:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  void *v19;

  v4 = a3;
  -[PUImportViewController importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isImportingAssets") & 1) != 0)
  {
    v6 = 0;
LABEL_15:

    goto LABEL_16;
  }
  -[PUImportViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDeletingAssets");

  if ((v8 & 1) == 0)
  {
    -[PUPhotosGridViewController contentScrollView](self, "contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v5, "hitTest:withEvent:", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v15, "superview");
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
        if (!v16)
          goto LABEL_9;
      }
      v6 = 0;
    }
    else
    {
LABEL_9:
      v17 = -[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v10, v12);
      v18 = -[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:", v10, v12);
      v6 = 1;
      if (v17 || v18)
        goto LABEL_14;
      -[PUImportViewController collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathForItemAtPoint:", v10, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v15 == 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (void)handleDoubleTapGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[PUImportViewController importController](self, "importController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isAnyItemSelected"))
    goto LABEL_4;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSelectableItems");

  objc_msgSend(v5, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
    objc_msgSend(v10, "performChanges:", &__block_literal_global_507);
  else
LABEL_4:
    -[PUImportViewController selectAllSelectableItems](self, "selectAllSelectableItems");

}

- (BOOL)shouldLongPressForOneUp
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longPressForOneUpInCompactMode")
    && -[PUImportViewController compactLayoutMode](self, "compactLayoutMode")
    || objc_msgSend(v3, "longPressForOneUpInPadSpec")
    && !-[PUImportViewController compactLayoutMode](self, "compactLayoutMode");

  return v4;
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PUImportViewController shouldLongPressForOneUp](self, "shouldLongPressForOneUp"))
  {
    if (self->_acceptsLongPress && objc_msgSend(v4, "state") == 1)
    {
      self->_acceptsLongPress = 0;
      _importGridLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[PUImportViewController handleLongPressGesture:]";
        _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
      }

      -[PUPhotosGridViewController contentScrollView](self, "contentScrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v6);
      v8 = v7;
      v10 = v9;
      if (!-[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:")
        && !-[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v8, v10))
      {
        -[PUImportViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[PUImportViewController _navigateToPhotoAtIndexPath:animated:interactive:](self, "_navigateToPhotoAtIndexPath:animated:interactive:", v12, 1, 0);

      }
    }
    else if (objc_msgSend(v4, "state") >= 3)
    {
      self->_acceptsLongPress = 1;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUImportViewController;
    -[PUPhotosGridViewController handleLongPressGesture:](&v13, sel_handleLongPressGesture_, v4);
  }

}

- (void)handleTouchEvent:(int64_t)a3 forCell:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[40];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _importGridLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[PUImportViewController handleTouchEvent:forCell:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_debug_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "%s: %lu", buf, 0x16u);
  }

  objc_msgSend(v6, "representedImportItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7C430]);

  if (v10)
  {
    -[PUImportViewController toggleAlreadyImportedExpansion](self, "toggleAlreadyImportedExpansion");
    goto LABEL_19;
  }
  -[PUImportViewController importController](self, "importController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isImportingAssets"))
  {

    goto LABEL_19;
  }
  -[PUImportViewController importController](self, "importController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDeletingAssets");

  if ((v13 & 1) != 0)
    goto LABEL_19;
  if (-[PUImportViewController shouldLongPressForOneUp](self, "shouldLongPressForOneUp")
    && !UIAccessibilityIsVoiceOverRunning())
  {
    goto LABEL_12;
  }
  if (a3 != 1)
  {
    if (a3)
      goto LABEL_19;
LABEL_12:
    if (objc_msgSend(v8, "isSelected"))
      -[PUImportViewController _deselectCell:](self, "_deselectCell:", v6);
    else
      -[PUImportViewController _selectCell:](self, "_selectCell:", v6);
    goto LABEL_19;
  }
  memset(buf, 0, 32);
  -[PUImportViewController importDataSource](self, "importDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "itemIndexPathForItem:", v8);
  else
    memset(buf, 0, 32);

  v17 = *(_OWORD *)buf;
  v18 = *(_OWORD *)&buf[16];
  PXIndexPathFromSimpleIndexPath();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController _navigateToPhotoAtIndexPath:animated:interactive:](self, "_navigateToPhotoAtIndexPath:animated:interactive:", v16, 1, 0, v17, v18);

LABEL_19:
}

- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[PUImportViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_modalTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isInteractive") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUImportViewController;
    -[PUPhotosGridViewController handlePhotoOrStackPinchGestureRecognizer:](&v7, sel_handlePhotoOrStackPinchGestureRecognizer_, v4);
  }

}

- (id)transitionItemsForContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  PUImportOneUpTransitionItem *v25;
  PUImportOneUpTransitionItem *v26;
  void *v27;
  PUImportOneUpTransitionView *v28;
  void *v29;
  void *v30;
  PUImportOneUpTransitionView *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModalPresentationStyle:", 0);
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;

  }
  v35 = v4;
  objc_msgSend(v5, "startingAssetReference", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v38 = 0u;
  v39 = 0u;
  if (v7)
    objc_msgSend(v7, "indexPath");
  -[PUImportViewController importDataSource](self, "importDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v38;
  v37 = v39;
  objc_msgSend(v9, "assetAtItemIndexPath:", &v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v38;
  v37 = v39;
  PXIndexPathFromSimpleIndexPath();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForItemAtIndexPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "photoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController imageRectFromPhotoView:](self, "imageRectFromPhotoView:", v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "contentHelper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "photoImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [PUImportOneUpTransitionItem alloc];
  v36 = v38;
  v37 = v39;
  v26 = -[PUImportOneUpTransitionItem initWithInitialFrame:snapshotImage:importItem:indexPath:](v25, "initWithInitialFrame:snapshotImage:importItem:indexPath:", v24, v10, &v36, v16, v18, v20, v22);
  objc_msgSend(v14, "contentHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentAlpha");
  -[PUImportOneUpTransitionItem setInitialContentAlpha:](v26, "setInitialContentAlpha:");

  v28 = [PUImportOneUpTransitionView alloc];
  -[PUImportViewController importController](self, "importController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "importMediaProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PUImportOneUpTransitionView initWithImportItem:startingImage:mediaProvider:](v28, "initWithImportItem:startingImage:mediaProvider:", v10, v24, v30);
  -[PUImportOneUpTransitionItem setTransitionView:](v26, "setTransitionView:", v31);

  v40[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (CGRect)targetFrameForTransitionItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  CGRect result;

  objc_msgSend(a3, "importItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  -[PUImportViewController importDataSource](self, "importDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "itemIndexPathForItem:", v4);
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }

  PXIndexPathFromSimpleIndexPath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView", v35, v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    -[PUImportViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 2, 0);

    -[PUImportViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

  }
  -[PUImportViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForItemAtIndexPath:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "photoView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController imageRectFromPhotoView:](self, "imageRectFromPhotoView:", v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (objc_msgSend(v14, "needsThumbnailRefresh"))
  {
    -[PUImportViewController importController](self, "importController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "importMediaProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cachedImageForModel:atSize:", v4, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v14, "setCachedImage:isPlaceholder:", v26, 0);
      -[PUImportViewController imageRectFromPhotoView:](self, "imageRectFromPhotoView:", v15);
      v17 = v27;
      v19 = v28;
      v21 = v29;
      v23 = v30;
    }

  }
  v31 = v17;
  v32 = v19;
  v33 = v21;
  v34 = v23;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)prepareTransitionItemViewForDestination:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;

  v4 = a3;
  objc_msgSend(v4, "transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "initialFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "targetFrame");
    objc_msgSend(v5, "setInitialFrame:targetFrame:", v7, v9, v11, v13, v14, v15, v16, v17);
    objc_msgSend(v4, "importItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    -[PUImportViewController importDataSource](self, "importDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "itemIndexPathForItem:", v18);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
    }

    PXIndexPathFromSimpleIndexPath();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController collectionView](self, "collectionView", v31, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForItemAtIndexPath:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "photoView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentAlpha");
    v27 = v26;

    objc_msgSend(v4, "setTargetContentAlpha:", v27);
    objc_msgSend(v4, "initialContentAlpha");
    v29 = v28;
    objc_msgSend(v4, "targetContentAlpha");
    objc_msgSend(v5, "setPhotoViewInitialAlpha:targetAlpha:", v29, v30);

  }
}

- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController setItemsBeingTransitioned:](self, "setItemsBeingTransitioned:", v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "importItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        -[PUImportViewController importDataSource](self, "importDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "itemIndexPathForItem:", v13);
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }

        PXIndexPathFromSimpleIndexPath();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController collectionView](self, "collectionView", v20, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cellForItemAtIndexPath:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setAlpha:", 0.0);
        -[PUImportViewController itemsBeingTransitioned](self, "itemsBeingTransitioned");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v23 = v7;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "importItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isDuplicate");
        *(_OWORD *)buf = 0u;
        v25 = 0u;
        -[PUImportViewController importDataSource](self, "importDataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "itemIndexPathForItem:", v14);
        }
        else
        {
          *(_OWORD *)buf = 0u;
          v25 = 0u;
        }
        v11 |= v15;

        PXIndexPathFromSimpleIndexPath();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportViewController collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cellForItemAtIndexPath:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setAlpha:", 1.0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
    -[PUImportViewController setItemsBeingTransitioned:](self, "setItemsBeingTransitioned:", 0);
    v7 = v23;
    if ((v11 & 1) != 0
      && -[PUImportViewController shouldCollapseAlreadyImportedSection](self, "shouldCollapseAlreadyImportedSection"))
    {
      -[PUImportViewController toggleAlreadyImportedExpansion](self, "toggleAlreadyImportedExpansion");
    }
  }
  else
  {
    -[PUImportViewController setItemsBeingTransitioned:](self, "setItemsBeingTransitioned:", 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "topViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _importGridLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "Dismissed Import One Up", buf, 2u);
      }

    }
  }

}

- (CGRect)imageRectFromPhotoView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "contentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "imageContentFrameForBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "convertRect:toView:", 0, v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController scrollViewWillBeginDragging:](&v4, sel_scrollViewWillBeginDragging_, a3);
  -[PUImportViewController setUserHasScrolled:](self, "setUserHasScrolled:", 1);
  -[PUImportViewController setShouldStayScrolledToBottom:](self, "setShouldStayScrolledToBottom:", 0);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  -[PUImportViewController setShouldStayScrolledToBottom:](self, "setShouldStayScrolledToBottom:", 0);
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController scrollViewDidScroll:](&v5, sel_scrollViewDidScroll_, v4);
  -[PUImportViewController updateNavigationTitleViewVisibilityAnimated:](self, "updateNavigationTitleViewVisibilityAnimated:", 1);
  -[PUImportViewController updateCompactWidthToolbarTopConstraint](self, "updateCompactWidthToolbarTopConstraint");
  if ((objc_msgSend(v4, "isDragging") & 1) == 0)
    -[PUImportViewController stayScrolledToBottomIfAtBottomAfterDrag:](self, "stayScrolledToBottomIfAtBottomAfterDrag:", v4);

}

- (void)navigateToBottomAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PUImportViewController setUserHasScrolled:](self, "setUserHasScrolled:", 1);
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController navigateToBottomAnimated:](&v5, sel_navigateToBottomAnimated_, v3);
}

- (void)stayScrolledToBottomIfAtBottomAfterDrag:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PUImportViewController userHasScrolled](self, "userHasScrolled"))
  {
    -[PUImportViewController importController](self, "importController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PUImportViewController setShouldStayScrolledToBottom:](self, "setShouldStayScrolledToBottom:", objc_msgSend(v5, "px_isScrolledAtEdge:", 3));
  }

}

- (BOOL)canBeginSwipeSelectionAtScrollViewLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  -[PUImportViewController importController](self, "importController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isImportingAssets"))
    goto LABEL_4;
  -[PUImportViewController importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDeletingAssets"))
  {

LABEL_4:
LABEL_5:
    LOBYTE(v8) = 0;
    return v8;
  }
  -[PUImportViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_5;
  -[PUPhotosGridViewController contentScrollView](self, "contentScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPathForItemAtPoint:", x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cellForItemAtIndexPath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertPoint:toView:", v15, x, y);
  v8 = objc_msgSend(v15, "shouldBeginGestureForPoint:");
  _importGridLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315394;
    v18 = "-[PUImportViewController canBeginSwipeSelectionAtScrollViewLocation:]";
    v19 = 2048;
    v20 = v8;
    _os_log_debug_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEBUG, "%s: return %ld", (uint8_t *)&v17, 0x16u);
  }

  return v8;
}

- (void)enableSwipeSelection
{
  void *v3;
  void *v4;
  PXSwipeSelectionManager *v5;
  PXSwipeSelectionManager *swipeSelectionManager;
  id v7;

  if (!self->_swipeSelectionManager)
  {
    -[PUPhotosGridViewController contentScrollView](self, "contentScrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUImportViewController importController](self, "importController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (v7)
      {
        v5 = (PXSwipeSelectionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BAB8]), "initWithSelectionManager:scrollView:", v4, v7);
        swipeSelectionManager = self->_swipeSelectionManager;
        self->_swipeSelectionManager = v5;

        -[PXSwipeSelectionManager setDelegate:](self->_swipeSelectionManager, "setDelegate:", self);
      }
    }

  }
}

- (void)disableSwipeSelection
{
  PXSwipeSelectionManager *swipeSelectionManager;
  PXSwipeSelectionManager *v4;

  swipeSelectionManager = self->_swipeSelectionManager;
  if (swipeSelectionManager)
  {
    -[PXSwipeSelectionManager setDelegate:](swipeSelectionManager, "setDelegate:", 0);
    v4 = self->_swipeSelectionManager;
    self->_swipeSelectionManager = 0;

  }
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUImportViewController swipeSelectionManager](self, "swipeSelectionManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _OWORD *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  PXSimpleIndexPath *result;
  __int128 v20;
  __int128 v21;
  uint8_t buf[32];
  __int16 v23;
  int v24;
  uint64_t v25;

  y = a5.y;
  x = a5.x;
  v25 = *MEMORY[0x1E0C80C00];
  -[PUImportViewController collectionView](self, "collectionView", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForItemAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PUImportViewController importDataSource](self, "importDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    *(_QWORD *)&v21 = 0;
    objc_msgSend(v11, "identifier");
    PXSimpleIndexPathFromIndexPath();
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v11, "assetAtItemIndexPath:", buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSelectable");
    v14 = (_OWORD *)MEMORY[0x1E0D7D0D0];
    if ((v13 & 1) == 0)
    {
      v20 = *MEMORY[0x1E0D7D0D0];
      v21 = *(_OWORD *)(MEMORY[0x1E0D7D0D0] + 16);
    }
    _importGridLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathAtLocation:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = *((_QWORD *)&v20 + 1);
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v21;
      v23 = 1024;
      v24 = v13;
      _os_log_debug_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld] (selectable: %d)", buf, 0x26u);
    }

    v16 = v14[1];
    *(_OWORD *)&retstr->dataSourceIdentifier = *v14;
    *(_OWORD *)&retstr->item = v16;
    if ((_QWORD)v20 != *MEMORY[0x1E0D7CE28])
    {
      -[PUImportViewController selectionIndexPathForItem:](self, "selectionIndexPathForItem:", v12);
      v17 = *(_OWORD *)&buf[16];
      *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
      *(_OWORD *)&retstr->item = v17;
    }

  }
  else
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0D7D0D0] + 16);
    *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E0D7D0D0];
    *(_OWORD *)&retstr->item = v18;
  }

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  PXSimpleIndexPath *result;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint8_t buf[40];
  uint64_t v31;

  y = a5.y;
  x = a5.x;
  v31 = *MEMORY[0x1E0C80C00];
  -[PUPhotosGridViewController contentScrollView](self, "contentScrollView", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  v12 = v11;
  v14 = v13;

  -[PUImportViewController importDataSource](self, "importDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = 0;
  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v29, &v28, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v18 = v28;
  v26 = 0u;
  *(_QWORD *)&v27 = 0;
  objc_msgSend(v15, "identifier");
  PXSimpleIndexPathFromIndexPath();
  v19 = 0;
  v20 = *MEMORY[0x1E0D7CE28];
  v21 = (__int128 *)MEMORY[0x1E0D7D0D0];
  if (*MEMORY[0x1E0D7CE28])
  {
    memset(buf, 0, 32);
    objc_msgSend(v15, "assetAtItemIndexPath:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isSelectable") & 1) == 0)
    {
      v26 = *v21;
      v27 = v21[1];
    }
  }
  _importGridLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathClosestLeadingLocation:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = *((_QWORD *)&v26 + 1);
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v27;
    _os_log_debug_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld]", buf, 0x20u);
  }

  v23 = v21[1];
  *(_OWORD *)&retstr->dataSourceIdentifier = *v21;
  *(_OWORD *)&retstr->item = v23;
  if ((_QWORD)v26 != v20)
  {
    -[PUImportViewController selectionIndexPathForItem:](self, "selectionIndexPathForItem:", v19);
    v24 = *(_OWORD *)&buf[16];
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
    *(_OWORD *)&retstr->item = v24;
  }

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  PXSimpleIndexPath *result;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint8_t buf[40];
  uint64_t v31;

  y = a5.y;
  x = a5.x;
  v31 = *MEMORY[0x1E0C80C00];
  -[PUPhotosGridViewController contentScrollView](self, "contentScrollView", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  v12 = v11;
  v14 = v13;

  -[PUImportViewController importDataSource](self, "importDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = 0;
  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v29, &v28, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v18 = v28;
  v26 = 0u;
  *(_QWORD *)&v27 = 0;
  objc_msgSend(v15, "identifier");
  PXSimpleIndexPathFromIndexPath();
  v19 = 0;
  v20 = *MEMORY[0x1E0D7CE28];
  v21 = (__int128 *)MEMORY[0x1E0D7D0D0];
  if (*MEMORY[0x1E0D7CE28])
  {
    memset(buf, 0, 32);
    objc_msgSend(v15, "assetAtItemIndexPath:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isSelectable") & 1) == 0)
    {
      v26 = *v21;
      v27 = v21[1];
    }
  }
  _importGridLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathClosestAboveLocation:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = *((_QWORD *)&v26 + 1);
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v27;
    _os_log_debug_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld]", buf, 0x20u);
  }

  v23 = v21[1];
  *(_OWORD *)&retstr->dataSourceIdentifier = *v21;
  *(_OWORD *)&retstr->item = v23;
  if ((_QWORD)v26 != v20)
  {
    -[PUImportViewController selectionIndexPathForItem:](self, "selectionIndexPathForItem:", v19);
    v24 = *(_OWORD *)&buf[16];
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
    *(_OWORD *)&retstr->item = v24;
  }

  return result;
}

- (PXSimpleIndexPath)selectionIndexPathForItem:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  PXSimpleIndexPath *result;
  id v13;

  v6 = a4;
  if (v6)
  {
    v13 = v6;
    -[PUImportViewController importController](self, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
    *(_OWORD *)&retstr->item = 0u;
    if (v10)
      objc_msgSend(v10, "itemIndexPathForItem:", v13);

    v6 = v13;
  }
  else
  {
    v11 = *(_OWORD *)(MEMORY[0x1E0D7D0D0] + 16);
    *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E0D7D0D0];
    *(_OWORD *)&retstr->item = v11;
  }

  return result;
}

- (void)installGestureRecognizers
{
  void *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController installGestureRecognizers](&v8, sel_installGestureRecognizers);
  -[PUImportViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_tapGestureRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTapGesture_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v3, "addGestureRecognizer:", self->_tapGestureRecognizer);
  }
  if (!self->_doubleTapGestureRecognizer)
  {
    v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleDoubleTapGesture_);
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v6;

    -[UITapGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    objc_msgSend(v3, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
  }

}

- (void)uninstallGestureRecognizers
{
  void *v3;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v5;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController uninstallGestureRecognizers](&v7, sel_uninstallGestureRecognizers);
  -[UITapGestureRecognizer view](self->_tapGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_tapGestureRecognizer);

  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = 0;

  -[UITapGestureRecognizer view](self->_doubleTapGestureRecognizer, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_doubleTapGestureRecognizer);

  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = 0;

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  unsigned __int8 v8;
  void *v9;
  objc_super v11;

  v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v5 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      LODWORD(self) = !-[PUImportViewController isPeeking](self, "isPeeking");
    }
    else
    {
      -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
      v6 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        v8 = -[PUPhotosGridViewController canNavigateToPhotoInteractively:](self, "canNavigateToPhotoInteractively:", 1);
      }
      else
      {
        -[PUImportViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
        v7 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
        {
          -[PUImportViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = -[PUImportViewController canBeginDoubleTapGesture:](self, "canBeginDoubleTapGesture:", v9);

          goto LABEL_11;
        }
        v11.receiver = self;
        v11.super_class = (Class)PUImportViewController;
        v8 = -[PUPhotosGridViewController gestureRecognizerShouldBegin:](&v11, sel_gestureRecognizerShouldBegin_, v4);
      }
      LOBYTE(self) = v8;
    }
  }
LABEL_11:

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  _BOOL8 v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXSwipeSelectionManager gesturesForFailureRequirements](self->_swipeSelectionManager, "gesturesForFailureRequirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
  {
    -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v7)
    {
      v10 = -[PXSwipeSelectionManager state](self->_swipeSelectionManager, "state");
      v11 = v10 != 0;
      _importGridLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v16 = -[PXSwipeSelectionManager state](self->_swipeSelectionManager, "state");
        v17 = 136315650;
        v18 = "-[PUImportViewController gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:]";
        v19 = 2048;
        v20 = v10 != 0;
        v21 = 2048;
        v22 = v16;
        _os_log_debug_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEBUG, "%s: shouldRecognize returning %ld(swipe state %ld)", (uint8_t *)&v17, 0x20u);
      }

      goto LABEL_11;
    }
  }
  else
  {

  }
  -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v6)
  {
    -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v7)
    {
      v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 21)
  {
    -[PUImportViewController importSource](self, "importSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importSourceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[PUImportViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", a3))
    v7 = 1;
  else
    v7 = 2;
  v8[2](v8, v7, 0);

}

- (id)px_navigationDestination
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[PUImportViewController importSource](self, "importSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7B868]);
    -[PUImportViewController importSource](self, "importSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithImportSource:revealMode:", v6, 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PUPhotosGridViewControllerSpec)_spec
{
  return self->__spec;
}

- (void)_setSpec:(id)a3
{
  objc_storeStrong((id *)&self->__spec, a3);
}

- (double)_collectionViewLayoutReferenceWidth
{
  return self->__collectionViewLayoutReferenceWidth;
}

- (UIEdgeInsets)collectionViewSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_collectionViewSafeAreaInsets.top;
  left = self->_collectionViewSafeAreaInsets.left;
  bottom = self->_collectionViewSafeAreaInsets.bottom;
  right = self->_collectionViewSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)_pendingViewSizeTransitionContext
{
  return self->__pendingViewSizeTransitionContext;
}

- (void)_setPendingViewSizeTransitionContext:(id)a3
{
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, a3);
}

- (id)_cachedViewSizeTransitionContext
{
  return self->__cachedViewSizeTransitionContext;
}

- (void)_setCachedViewSizeTransitionContext:(id)a3
{
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, a3);
}

- (CGSize)_cachedViewSizeTransitionContextSize
{
  double width;
  double height;
  CGSize result;

  width = self->__cachedViewSizeTransitionContextSize.width;
  height = self->__cachedViewSizeTransitionContextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setCachedViewSizeTransitionContextSize:(CGSize)a3
{
  self->__cachedViewSizeTransitionContextSize = a3;
}

- (NSProgress)importProgress
{
  return self->_importProgress;
}

- (void)setImportProgress:(id)a3
{
  objc_storeStrong((id *)&self->_importProgress, a3);
}

- (PXImportController)importController
{
  return self->_importController;
}

- (PXImportAssetsDataSourceManager)importDataSourceManager
{
  return self->_importDataSourceManager;
}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (PXImportAssetsDataSourceManager)unfilteredImportDataSourceManager
{
  return self->_unfilteredImportDataSourceManager;
}

- (BOOL)performingDataSourceChange
{
  return self->_performingDataSourceChange;
}

- (void)setPerformingDataSourceChange:(BOOL)a3
{
  self->_performingDataSourceChange = a3;
}

- (BOOL)needsDataReloadAfterAnimatingDataSourceChange
{
  return self->_needsDataReloadAfterAnimatingDataSourceChange;
}

- (void)setNeedsDataReloadAfterAnimatingDataSourceChange:(BOOL)a3
{
  self->_needsDataReloadAfterAnimatingDataSourceChange = a3;
}

- (PXImportAssetsDataSource)pendingDataSource
{
  return self->_pendingDataSource;
}

- (void)setPendingDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDataSource, a3);
}

- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper
{
  return self->_changeDetailsHelper;
}

- (void)setChangeDetailsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetailsHelper, a3);
}

- (BOOL)isTransitioningToNewSize
{
  return self->_transitioningToNewSize;
}

- (void)setTransitioningToNewSize:(BOOL)a3
{
  self->_transitioningToNewSize = a3;
}

- (BOOL)isViewAppearing
{
  return self->_viewAppearing;
}

- (void)setViewAppearing:(BOOL)a3
{
  self->_viewAppearing = a3;
}

- (PUImportFakePhotosDataSource)fakePhotosDataSource
{
  return self->_fakePhotosDataSource;
}

- (void)setFakePhotosDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_fakePhotosDataSource, a3);
}

- (PUImportActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_actionCoordinator, a3);
}

- (PXNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (UILabel)navigationLargeTitleAccessoryLabel
{
  return self->_navigationLargeTitleAccessoryLabel;
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (void)setSwipeSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_swipeSelectionManager, a3);
}

- (PXSelectionSnapshot)currentSelectionSnapshot
{
  return self->_currentSelectionSnapshot;
}

- (void)setCurrentSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectionSnapshot, a3);
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)destinationPickerViewController
{
  return self->_destinationPickerViewController;
}

- (void)setDestinationPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPickerViewController, a3);
}

- (BOOL)performingAlbumPickerPresentation
{
  return self->_performingAlbumPickerPresentation;
}

- (void)setPerformingAlbumPickerPresentation:(BOOL)a3
{
  self->_performingAlbumPickerPresentation = a3;
}

- (BOOL)userWantsAlreadyImportedSectionCollapsedIfPossible
{
  return self->_userWantsAlreadyImportedSectionCollapsedIfPossible;
}

- (void)setUserWantsAlreadyImportedSectionCollapsedIfPossible:(BOOL)a3
{
  self->_userWantsAlreadyImportedSectionCollapsedIfPossible = a3;
}

- (BOOL)shouldCollapseAlreadyImportedSection
{
  return self->_shouldCollapseAlreadyImportedSection;
}

- (void)setShouldCollapseAlreadyImportedSection:(BOOL)a3
{
  self->_shouldCollapseAlreadyImportedSection = a3;
}

- (BOOL)userHasScrolled
{
  return self->_userHasScrolled;
}

- (void)setUserHasScrolled:(BOOL)a3
{
  self->_userHasScrolled = a3;
}

- (BOOL)shouldStayScrolledToBottom
{
  return self->_shouldStayScrolledToBottom;
}

- (void)setShouldStayScrolledToBottom:(BOOL)a3
{
  self->_shouldStayScrolledToBottom = a3;
}

- (PLRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (void)setRoundProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_roundProgressView, a3);
}

- (int64_t)numItemsCompleted
{
  return self->_numItemsCompleted;
}

- (void)setNumItemsCompleted:(int64_t)a3
{
  self->_numItemsCompleted = a3;
}

- (int64_t)numTotalItemsToComplete
{
  return self->_numTotalItemsToComplete;
}

- (void)setNumTotalItemsToComplete:(int64_t)a3
{
  self->_numTotalItemsToComplete = a3;
}

- (NSMutableSet)itemsBeingTransitioned
{
  return self->_itemsBeingTransitioned;
}

- (void)setItemsBeingTransitioned:(id)a3
{
  objc_storeStrong((id *)&self->_itemsBeingTransitioned, a3);
}

- (BOOL)animateHeaderActionButtonChanges
{
  return self->_animateHeaderActionButtonChanges;
}

- (void)setAnimateHeaderActionButtonChanges:(BOOL)a3
{
  self->_animateHeaderActionButtonChanges = a3;
}

- (PUImportFloatingToolbarView)compactWidthToolbar
{
  return self->_compactWidthToolbar;
}

- (void)setCompactWidthToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_compactWidthToolbar, a3);
}

- (NSLayoutConstraint)compactWidthToolbarTopConstraint
{
  return self->_compactWidthToolbarTopConstraint;
}

- (void)setCompactWidthToolbarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactWidthToolbarTopConstraint, a3);
}

- (PXNavigationTitleView)contentInfoBarButtonView
{
  return self->_contentInfoBarButtonView;
}

- (void)setContentInfoBarButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_contentInfoBarButtonView, a3);
}

- (PXNavigationTitleView)compactWidthAlbumPickerBarButtonView
{
  return self->_compactWidthAlbumPickerBarButtonView;
}

- (void)setCompactWidthAlbumPickerBarButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerBarButtonView, a3);
}

- (PUImportCustomViewBarButton)compactWidthAlbumPickerButton
{
  return self->_compactWidthAlbumPickerButton;
}

- (void)setCompactWidthAlbumPickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerButton, a3);
}

- (NSNumber)cachedHeaderHeight
{
  return self->_cachedHeaderHeight;
}

- (void)setCachedHeaderHeight:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHeaderHeight, a3);
}

- (PXActionableSectionHeaderView)referenceHeaderView
{
  return self->_referenceHeaderView;
}

- (void)setReferenceHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceHeaderView, a3);
}

- (BOOL)isPeeking
{
  return self->_isPeeking;
}

- (void)setIsPeeking:(BOOL)a3
{
  self->_isPeeking = a3;
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_referenceHeaderView, 0);
  objc_storeStrong((id *)&self->_cachedHeaderHeight, 0);
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerButton, 0);
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerBarButtonView, 0);
  objc_storeStrong((id *)&self->_contentInfoBarButtonView, 0);
  objc_storeStrong((id *)&self->_compactWidthToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_compactWidthToolbar, 0);
  objc_storeStrong((id *)&self->_itemsBeingTransitioned, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_destinationPickerViewController, 0);
  objc_storeStrong((id *)&self->_currentSelectionSnapshot, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_navigationLargeTitleAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_fakePhotosDataSource, 0);
  objc_storeStrong((id *)&self->_changeDetailsHelper, 0);
  objc_storeStrong((id *)&self->_pendingDataSource, 0);
  objc_storeStrong((id *)&self->_unfilteredImportDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_importProgress, 0);
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, 0);
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_mstreamd_pause_context, 0);
  objc_storeStrong((id *)&self->_compactEmptyTrailingButton, 0);
  objc_storeStrong((id *)&self->_compactSpacer2, 0);
  objc_storeStrong((id *)&self->_compactImportDestinationButton, 0);
  objc_storeStrong((id *)&self->_compactSpacer1, 0);
  objc_storeStrong((id *)&self->_compactContentInfoButton, 0);
  objc_storeStrong((id *)&self->_albumPickerCompactWidthBarButton, 0);
  objc_storeStrong((id *)&self->_contentInfoBarButton, 0);
  objc_storeStrong((id *)&self->_addToAlbumsToolbarView, 0);
  objc_storeStrong((id *)&self->_albumPickerBarItem, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressButtonItem, 0);
  objc_storeStrong((id *)&self->_stopBarItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItemIcon, 0);
  objc_storeStrong((id *)&self->_importButtonItem, 0);
  objc_storeStrong((id *)&self->_completedImportSessionInfo, 0);
}

uint64_t __49__PUImportViewController_handleDoubleTapGesture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

void __75__PUImportViewController__navigateToPhotoAtIndexPath_animated_interactive___block_invoke(uint64_t a1)
{
  PUPXAssetReference *v2;
  uint64_t v3;
  void *v4;
  PUPXAssetReference *v5;
  id v6;

  v2 = [PUPXAssetReference alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "assetsDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPXAssetReference initWithPXAssetReference:dataSourceIdentifier:](v2, "initWithPXAssetReference:dataSourceIdentifier:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", v5);

}

void __56__PUImportViewController_updateDataSourceManagerFilters__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "importDataSourceManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateFilteredAssetsIfNeeded");

}

uint64_t __60__PUImportViewController_anyAlreadyImportedItemsAreSelected__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)(result + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __63__PUImportViewController_areAllItemsSelectedInAssetCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)(result + 40))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __64__PUImportViewController_setAllItemsSelected_inAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __81__PUImportViewController_importCell_requestImageForImportItem_ofSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__PUImportViewController_importController_didCompleteImportWithImportSession_results_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "notifyUserOfImportCompletionIfNeededWithImportSession:results:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __48__PUImportViewController_targetLibrarySelected___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v1);

}

void __45__PUImportViewController_collectionSelected___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v1);

}

uint64_t __63__PUImportViewController_presentAlbumPickerFromView_orBarItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingAlbumPickerPresentation:", 0);
}

void __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setImportDataSource:", v3);

}

uint64_t __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldStayScrolledToBottom"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_scrollToEdge:animated:", 3, a2);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateVisibleSupplementaryViewsOfKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "updatePeripheralInterfaceAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "updateAlreadyImportedCollapseStatus");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__PUImportViewController_handleNewDataSource___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUImportViewController_handleNewDataSource___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __46__PUImportViewController_handleNewDataSource___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "importDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134217984;
    v11 = objc_msgSend(v3, "identifier");
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Finished transitioning to: %lu", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setPerformingDataSourceChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "pendingDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "pendingDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingDataSource:", 0);
    _importGridLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "identifier");
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Applying pending data source: %lu", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleNewDataSource:", v6);
  }
  else if (objc_msgSend(v5, "needsDataReloadAfterAnimatingDataSourceChange"))
  {
    _importGridLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Performing reload after animating source change, due to layoutSubview while animating", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setNeedsDataReloadAfterAnimatingDataSourceChange:", 0);
    objc_msgSend(*(id *)(a1 + 32), "reloadData");
  }
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateEmptyPlaceholderView");
  return objc_msgSend(*(id *)(a1 + 32), "updateEmptyPlaceholderView");
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewDataSource:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAnimated:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateAlreadyImportedHeaderIfVisible");
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAnimateHeaderActionButtonChanges:", 1);
  objc_msgSend(*(id *)(a1 + 32), "updateVisibleSupplementaryViewsOfKind:", CFSTR("PUImportSectionHeaderReuseIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "setAnimateHeaderActionButtonChanges:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateAlreadyImportedCollapseStatus");
}

uint64_t __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateAlreadyImportedCollapseStatus");
  v2 = objc_msgSend(*(id *)(a1 + 32), "anyAlreadyImportedItemsAreSelected");
  if (objc_msgSend(*(id *)(a1 + 32), "userWantsAlreadyImportedSectionCollapsedIfPossible")
    && (objc_msgSend(*(id *)(a1 + 32), "shouldCollapseAlreadyImportedSection") & 1) == 0
    && ((v2 ^ 1) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserWantsAlreadyImportedSectionCollapsedIfPossible:", 0);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "px_isVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAnimated:", 1);
  return result;
}

void __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_updateContentOffsetForPendingViewSizeTransition");
  objc_msgSend(*(id *)(a1 + 40), "finalizeViewTransitionToSize");
  if (objc_msgSend(*(id *)(a1 + 32), "px_isVisible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAnimated:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setTransitioningToNewSize:", 0);

}

void __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleFont:", v3);

  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 4);

  v6 = *MEMORY[0x1E0DC49E8];
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMargins:", v6, 0.0, v7, 0.0);

}

void __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleFont:", v3);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitleTextColor:", v6);

  PLLocalizedFrameworkString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  objc_msgSend(*(id *)(a1 + 32), "destinationDescriptionForCollection:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSubtitle:", v10);

  v12 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(*(id *)(a1 + 32), "compactWidthAlbumPickerBarButtonView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMargins:", v12, v13, v14, v15);

}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationTitleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationTitleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_2()
{
  void *v0;

  v0 = (void *)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha;
  updateNavigationTitleViewVisibilityAnimated__animatingToAlpha = 0;

}

void __96__PUImportViewController_updateContentInfoBarButtonTitlesWithItems_sizeString_itemsAreSelected___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v2);

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "contentInfoBarButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v4);

}

void __85__PUImportViewController_updateNavigationTitleWithItems_sizeString_itemsAreSelected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setVerticalSizeClass:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitleFont:", v2);

}

uint64_t __49__PUImportViewController__updateToolbarAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "setMargins:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (id)totalSizeStringForItems:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PUImportViewController_totalSizeStringForItems___block_invoke;
  v6[3] = &unk_1E58A0DA8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v8[3], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (unsigned)defaultThumbnailImageFormat
{
  if (defaultThumbnailImageFormat_onceToken != -1)
    dispatch_once(&defaultThumbnailImageFormat_onceToken, &__block_literal_global_532);
  return defaultThumbnailImageFormat_imageFormat;
}

void __53__PUImportViewController_defaultThumbnailImageFormat__block_invoke()
{
  int IsIPad;
  __objc2_class **v1;
  id v2;

  if (!defaultThumbnailImageFormat_imageFormat)
  {
    IsIPad = PLPhysicalDeviceIsIPad();
    v1 = off_1E5885D70;
    if (!IsIPad)
      v1 = off_1E5885D90;
    v2 = objc_alloc_init(*v1);
    defaultThumbnailImageFormat_imageFormat = objc_msgSend(v2, "thumbnailImageFormat");

  }
}

void __50__PUImportViewController_totalSizeStringForItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "importAsset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "assetSizeIncludingRelatedAssets");

}

@end
