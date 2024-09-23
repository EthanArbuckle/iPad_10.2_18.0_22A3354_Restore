@implementation VUILibraryShelfCollectionViewController

id __86__VUILibraryShelfCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVLibraryLockupViewReuseIdentifier"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "fetchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_itemWidthForGridStyle:gridType:", 3, 0);
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", v8, v11, 0);

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryShelfCollectionViewController;
  -[VUILibraryShelfCollectionViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[VUILibraryShelfCollectionViewController lastSelectedMediaEntity](self, "lastSelectedMediaEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUILibraryShelfCollectionViewController lastSelectedMediaEntity](self, "lastSelectedMediaEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryShelfCollectionViewController _reloadMediaEntity:](self, "_reloadMediaEntity:", v5);

    -[VUILibraryShelfCollectionViewController setLastSelectedMediaEntity:](self, "setLastSelectedMediaEntity:", 0);
  }
}

- (void)setShelfType:(int64_t)a3
{
  self->_shelfType = a3;
}

- (void)setHeaderTitle:(id)a3 andSubtitle:(id)a4
{
  id v6;
  NSString *v7;
  NSString *headerTitle;
  NSString *v9;
  NSString *headerSubtitle;

  v6 = a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  headerTitle = self->_headerTitle;
  self->_headerTitle = v7;

  v9 = (NSString *)objc_msgSend(v6, "copy");
  headerSubtitle = self->_headerSubtitle;
  self->_headerSubtitle = v9;

  -[VUILibraryShelfCollectionViewController _updateHeaderView](self, "_updateHeaderView");
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIMediaEntity)lastSelectedMediaEntity
{
  return self->_lastSelectedMediaEntity;
}

- (VUILibraryShelfCollectionViewController)initWithDataSource:(id)a3
{
  id v5;
  VUILibraryShelfCollectionViewController *v6;
  VUILibraryShelfCollectionViewController *v7;
  void *v8;
  uint64_t v9;
  NSArray *fetchResults;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUILibraryShelfCollectionViewController;
  v6 = -[VUIShelfViewController initWithGridStyle:](&v12, sel_initWithGridStyle_, 3);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(v5, "mediaEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    fetchResults = v7->_fetchResults;
    v7->_fetchResults = (NSArray *)v9;

    v7->_disableSeeAllButton = 0;
  }

  return v7;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (BOOL)disableSeeAllButton
{
  return self->_disableSeeAllButton;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)configureWithCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVLibraryLockupViewReuseIdentifier"));
  -[VUILibraryShelfCollectionViewController _createDiffableDataSourceForCollectionView:](self, "_createDiffableDataSourceForCollectionView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUILibraryShelfCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5);
  -[VUILibraryShelfCollectionViewController diffableDataSource](self, "diffableDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applySnapshot:animatingDifferences:", v6, 1);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[NSArray objectAtIndex:](self->_fetchResults, "objectAtIndex:", objc_msgSend(a5, "row", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController _configureSizingCellWithEntity:](self, "_configureSizingCellWithEntity:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[VUILibraryShelfCollectionViewController _computeBottomMargin](self, "_computeBottomMargin", a3, a4, a5);
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.right = v9;
  result.bottom = v6;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)_updateHeaderView
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[VUILibraryShelfCollectionViewController _shouldHideDisclosureButton](self, "_shouldHideDisclosureButton");
  -[VUILibraryShelfCollectionViewController _attributedHeaderTitle](self, "_attributedHeaderTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController headerSubtitle](self, "headerSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUICollectionHeaderView configureCollectionHeaderViewWithTitle:subtitle:buttonString:existingView:](VUICollectionHeaderView, "configureCollectionHeaderViewWithTitle:subtitle:buttonString:existingView:", v7, v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__headerTapped_);
    objc_msgSend(v5, "addGestureRecognizer:", v6);

  }
  -[VUIShelfViewController setHeaderView:](self, "setHeaderView:", v5);

}

- (BOOL)_shouldHideDisclosureButton
{
  unint64_t v4;

  if (-[VUILibraryShelfCollectionViewController disableSeeAllButton](self, "disableSeeAllButton"))
    return 1;
  v4 = -[NSArray count](self->_fetchResults, "count");
  return v4 < +[VUIUtilities minimumNumberOfItemsToEnableSeeAllButton](VUIUtilities, "minimumNumberOfItemsToEnableSeeAllButton");
}

- (id)_getEntityIdentifiersFromEntities
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUILibraryShelfCollectionViewController fetchResults](self, "fetchResults", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = CFSTR("ShelfMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUILibraryShelfCollectionViewController _getEntityIdentifiersFromEntities](self, "_getEntityIdentifiersFromEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("ShelfMainSection"));

  return v3;
}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__VUILibraryShelfCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v8[3] = &unk_1E9F98F50;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (CGSize)_configureSizingCellWithEntity:(id)a3
{
  id v4;
  VUILibraryLockupViewCell *v5;
  VUILibraryLockupViewCell *sizingCell;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  if (!self->_sizingCell)
  {
    v5 = objc_alloc_init(VUILibraryLockupViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v5;

  }
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_itemWidthForGridStyle:gridType:", 3, 0);
  v8 = v7;
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", self->_sizingCell, v4, 1);
  -[VUILibraryLockupViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v8, 1.79769313e308);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)_computeBottomMargin
{
  uint64_t v3;
  void **p_vtable;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  VUILibraryLockupViewCell *sizingCell;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  double v23;

  v3 = -[NSArray count](self->_fetchResults, "count");
  p_vtable = (void **)(VUIMediaLibraryFetchMediaEntitiesOperation + 24);
  if (v3 < 1)
  {
    v7 = 0;
    v8 = 0;
LABEL_17:
    objc_msgSend(p_vtable + 282, "spacerC");
    v21 = v20;
    -[VUILibraryShelfCollectionViewController traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v22, v21);
    v18 = v23;

  }
  else
  {
    v5 = v3;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = v8;
      -[NSArray objectAtIndex:](self->_fetchResults, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "rentalExpirationDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v8, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (v13)
            break;
        }
      }
      if (!v7)
      {
        objc_msgSend(v8, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
          v7 = v8;
        else
          v7 = 0;
      }
      if (v5 == ++v6)
      {
        if (v7)
          goto LABEL_12;
LABEL_16:
        p_vtable = VUIMediaLibraryFetchMediaEntitiesOperation.vtable;
        goto LABEL_17;
      }
    }
    v19 = v8;

    v7 = v19;
    if (!v19)
      goto LABEL_16;
LABEL_12:
    -[VUILibraryShelfCollectionViewController _configureSizingCellWithEntity:](self, "_configureSizingCellWithEntity:", v7);
    sizingCell = self->_sizingCell;
    p_vtable = VUIMediaLibraryFetchMediaEntitiesOperation.vtable;
    +[VUIViewSpacer spacerC](VUIViewSpacer, "spacerC");
    -[VUILibraryLockupViewCell bottomMarginWithBaselineMargin:](sizingCell, "bottomMarginWithBaselineMargin:");
    if (v17 == 0.0)
      goto LABEL_17;
    v18 = v17;
  }

  return v18;
}

- (id)_attributedHeaderTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  if (-[VUILibraryShelfCollectionViewController _shouldHideDisclosureButton](self, "_shouldHideDisclosureButton"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[VUILibraryShelfCollectionViewController headerTitle](self, "headerTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B58], 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationByApplyingConfiguration:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = objc_msgSend(v12, "length");
    v14 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttribute:value:range:", v14, v15, 0, v13);

    LODWORD(v13) = -[VUILibraryShelfCollectionViewController vuiIsRTL](self, "vuiIsRTL");
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[VUILibraryShelfCollectionViewController headerTitle](self, "headerTitle");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if ((_DWORD)v13)
      v19 = CFSTR(" %@");
    else
      v19 = CFSTR("%@ ");
    objc_msgSend(v16, "stringWithFormat:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v20);
    if (-[VUILibraryShelfCollectionViewController vuiIsRTL](self, "vuiIsRTL"))
      objc_msgSend(v5, "insertAttributedString:atIndex:", v12, 0);
    else
      objc_msgSend(v5, "appendAttributedString:", v12);

  }
  return v5;
}

- (void)updateWithDataSource:(id)a3
{
  NSArray *v4;
  NSArray *fetchResults;
  void *v6;
  id v7;

  objc_msgSend(a3, "mediaEntities");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  fetchResults = self->_fetchResults;
  self->_fetchResults = v4;

  -[VUILibraryShelfCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v7, 1);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  NSArray *fetchResults;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  fetchResults = self->_fetchResults;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndex:](fetchResults, "objectAtIndex:", objc_msgSend(v7, "item"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController setLastSelectedMediaEntity:](self, "setLastSelectedMediaEntity:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shelfCollectionViewController:collectionView:didSelectMediaEntity:atIndexPath:", self, v8, v10, v7);

}

- (void)_didPressSeeAllButton:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "seeAllButtonPressed:", self);

}

- (void)_headerTapped:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
    -[VUILibraryShelfCollectionViewController _didPressSeeAllButton:](self, "_didPressSeeAllButton:", v4);

}

- (void)_reloadMediaEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelfCollectionViewController _getEntityIdentifiersFromEntities](self, "_getEntityIdentifiersFromEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    -[VUILibraryShelfCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItemsWithIdentifiers:", v7);

    -[VUILibraryShelfCollectionViewController diffableDataSource](self, "diffableDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applySnapshot:animatingDifferences:", v6, 1);

  }
  else
  {
    objc_msgSend(v9, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("VUILibraryShelfCollectionViewController::reloadMediaEntity - Tried to reload entity that does not exist %@"), v6);
  }

}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (void)setHeaderSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerSubtitle, a3);
}

- (void)setDisableSeeAllButton:(BOOL)a3
{
  self->_disableSeeAllButton = a3;
}

- (VUILibraryShelfCollectionViewControllerDelegate)delegate
{
  return (VUILibraryShelfCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setFetchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (VUIMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)shelfType
{
  return self->_shelfType;
}

- (void)setLastSelectedMediaEntity:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedMediaEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedMediaEntity, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end
