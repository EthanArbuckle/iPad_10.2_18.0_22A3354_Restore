@implementation PXNavigationListController

- (PXNavigationListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 141, CFSTR("%s is not available as initializer"), "-[PXNavigationListController initWithNibName:bundle:]");

  abort();
}

- (PXNavigationListController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 145, CFSTR("%s is not available as initializer"), "-[PXNavigationListController initWithCoder:]");

  abort();
}

- (PXNavigationListController)initWithDataSectionManager:(id)a3
{
  id v5;
  PXNavigationListController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *rowHeightCache;
  uint64_t v9;
  PXNavigationListDataSection *dataSection;
  NSMutableSet *v11;
  NSMutableSet *queuedCacheKeys;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXNavigationListController;
  v6 = -[PXNavigationListController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rowHeightCache = v6->_rowHeightCache;
    v6->_rowHeightCache = v7;

    objc_storeStrong((id *)&v6->_dataSectionManager, a3);
    -[PXDataSectionManager dataSection](v6->_dataSectionManager, "dataSection");
    v9 = objc_claimAutoreleasedReturnValue();
    dataSection = v6->_dataSection;
    v6->_dataSection = (PXNavigationListDataSection *)v9;

    -[PXNavigationListDataSectionManager registerChangeObserver:context:](v6->_dataSectionManager, "registerChangeObserver:context:", v6, PXNavigationListDataSectionManagerObservationContext);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queuedCacheKeys = v6->_queuedCacheKeys;
    v6->_queuedCacheKeys = v11;

  }
  return v6;
}

- (void)_preloadRowHeightCache
{
  NSDate *v3;
  NSDate *firstPreloadCacheStartTime;

  if (!-[PXNavigationListController _skipPreloadTaskIfNecessary](self, "_skipPreloadTaskIfNecessary")
    && self->_layoutWidth > 0.0
    && -[PXNavigationListDataSection count](self->_dataSection, "count") >= 1)
  {
    if (!self->_firstPreloadCacheStartTime)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstPreloadCacheStartTime = self->_firstPreloadCacheStartTime;
      self->_firstPreloadCacheStartTime = v3;

    }
    -[PXNavigationListController _preloadRowHeightsForAllValidItems](self, "_preloadRowHeightsForAllValidItems");
  }
}

- (BOOL)_skipPreloadTaskIfNecessary
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  NSObject *v7;
  NSDate *firstPreloadCacheStartTime;
  int v10;
  PXNavigationListController *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_firstPreloadCacheStartTime)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_firstPreloadCacheStartTime);
  v5 = v4;
  v6 = v4 > 1.5;
  if (v4 > 1.5)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "[NavigationListController] <%p>  Preload task timed out at %f seconds and initial cache was not complete", (uint8_t *)&v10, 0x16u);
    }

    firstPreloadCacheStartTime = self->_firstPreloadCacheStartTime;
    self->_firstPreloadCacheStartTime = 0;

    -[PXNavigationListController view](self, "view");
  }

  return v6;
}

- (void)_reportContentHeightDidChangeIfNecessary
{
  double layoutWidth;
  void *v4;
  void *v5;

  layoutWidth = self->_layoutWidth;
  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListController _contentHeightForWidth:dataSection:](self, "_contentHeightForWidth:dataSection:", v5, layoutWidth);

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    -[PXNavigationListController contentHeightDidChange](self, "contentHeightDidChange");
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  UITableView *v6;
  void *v7;
  PXNavigationListControllerView *v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UITableView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXNavigationListSimpleCellReuseIdentifier"));
  -[PXNavigationListController contentInsets](self, "contentInsets");
  -[UITableView setLayoutMargins:](v4, "setLayoutMargins:");
  -[UITableView _setAutomaticContentOffsetAdjustmentEnabled:](v4, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  -[UITableView setScrollEnabled:](v4, "setScrollEnabled:", 0);
  -[UITableView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
  -[UITableView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
  -[UITableView setDataSource:](v4, "setDataSource:", self);
  -[UITableView setDelegate:](v4, "setDelegate:", self);
  -[UITableView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[UITableView setCellLayoutMarginsFollowReadableWidth:](v4, "setCellLayoutMarginsFollowReadableWidth:", 0);
  -[UITableView setFocusGroupIdentifier:](v4, "setFocusGroupIdentifier:", 0);
  -[UITableView setAllowsFocus:](v4, "setAllowsFocus:", 1);
  -[UITableView setDragInteractionEnabled:](v4, "setDragInteractionEnabled:", 1);
  -[UITableView setDropDelegate:](v4, "setDropDelegate:", self);
  tableView = self->_tableView;
  self->_tableView = v4;
  v6 = v4;

  v8 = objc_alloc_init(PXNavigationListControllerView);
  -[PXNavigationListControllerView setContentView:](v8, "setContentView:", v6);
  -[PXNavigationListController setView:](self, "setView:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__preferredContentSizeChanged_, *MEMORY[0x1E0DC48E8], 0);

  -[PXNavigationListController _reportContentHeightDidChangeIfNecessary](self, "_reportContentHeightDidChangeIfNecessary");
}

- (double)_contentHeightForWidth:(double)a3 dataSection:(id)a4
{
  id v6;
  double left;
  double right;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v6 = a4;
  left = self->_contentInsets.left;
  right = self->_contentInsets.right;
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    v10 = a3 - left - right;
    v11 = 0.0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXNavigationListController _contentHeightForCellWithWidth:listItem:](self, "_contentHeightForCellWithWidth:listItem:", v12, v10);
      v11 = v11 + v13;

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (double)_contentHeightForCellWithWidth:(double)a3 listItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  UITableViewCell *measuringCell;
  PXNavigationListCell *v13;
  UITableViewCell *v14;
  void *v15;
  double v16;
  void *v17;

  v6 = a4;
  PXNavigationListControllerCacheKeyForListItem(v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_rowHeightCache, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v11 = v10;
  }
  else
  {
    measuringCell = self->_measuringCell;
    if (!measuringCell)
    {
      v13 = objc_alloc_init(PXNavigationListCell);
      v14 = self->_measuringCell;
      self->_measuringCell = &v13->super;

      measuringCell = self->_measuringCell;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListController _configureCell:forListItem:textColor:](self, "_configureCell:forListItem:textColor:", measuringCell, v6, v15);

    -[UITableViewCell sizeThatFits:](self->_measuringCell, "sizeThatFits:", a3, 1.79769313e308);
    v11 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rowHeightCache, "setObject:forKeyedSubscript:", v17, v7);

  }
  return v11;
}

- (double)contentHeightForWidth:(double)a3
{
  double layoutWidth;
  double v6;

  layoutWidth = self->_layoutWidth;
  self->_layoutWidth = a3;
  if (-[PXNavigationListController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXNavigationListController _contentHeightForWidth:dataSection:](self, "_contentHeightForWidth:dataSection:", self->_dataSection, a3);
    self->_currentContentHeight = v6;
  }
  else if (layoutWidth != a3)
  {
    -[PXNavigationListController _preloadRowHeightCache](self, "_preloadRowHeightCache");
  }
  return self->_currentContentHeight;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets *p_contentInsets;
  double top;
  double left;
  double bottom;
  double right;
  void *v12;

  p_contentInsets = &self->_contentInsets;
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    p_contentInsets->top = a3.top;
    self->_contentInsets.left = a3.left;
    self->_contentInsets.bottom = a3.bottom;
    self->_contentInsets.right = a3.right;
    if (-[PXNavigationListController isViewLoaded](self, "isViewLoaded"))
    {
      top = p_contentInsets->top;
      left = p_contentInsets->left;
      bottom = p_contentInsets->bottom;
      right = p_contentInsets->right;
      -[PXNavigationListController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLayoutMargins:", top, left, bottom, right);

      -[PXNavigationListController _reportContentHeightDidChangeIfNecessary](self, "_reportContentHeightDidChangeIfNecessary");
    }
  }
}

- (void)_updateDataSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double currentContentHeight;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  PXNavigationListController *v26;
  _QWORD v27[6];
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;

  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PXNavigationListController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    v5 = objc_msgSend(v3, "previousDataSectionIdentifier");
    if (v5 == -[PXDataSection identifier](self->_dataSection, "identifier"))
    {
      objc_msgSend(v3, "changeDetailsFromPreviousDataSection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasIncrementalChanges") && (objc_msgSend(v6, "hasMoves") & 1) == 0)
    {
      objc_msgSend(v6, "removedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __48__PXNavigationListController__updateDataSection__block_invoke;
      v44[3] = &unk_1E5148928;
      v45 = v7;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v44);

      objc_msgSend(v6, "changedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v12;
      v42[1] = 3221225472;
      v42[2] = __48__PXNavigationListController__updateDataSection__block_invoke_2;
      v42[3] = &unk_1E5148928;
      v43 = v8;
      objc_msgSend(v13, "enumerateIndexesUsingBlock:", v42);

      objc_msgSend(v6, "insertedIndexes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v12;
      v40[1] = 3221225472;
      v40[2] = __48__PXNavigationListController__updateDataSection__block_invoke_3;
      v40[3] = &unk_1E5148928;
      v41 = v9;
      objc_msgSend(v14, "enumerateIndexesUsingBlock:", v40);

      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
    currentContentHeight = self->_currentContentHeight;
    -[PXNavigationListController _contentHeightForWidth:dataSection:](self, "_contentHeightForWidth:dataSection:", v4, self->_layoutWidth);
    v17 = v16;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v39 = PXFloatApproximatelyEqualToFloat() ^ 1;
    if (v10)
    {
      objc_storeStrong((id *)&self->_dataSection, v4);
      -[PXNavigationListController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reloadData");

      if (*((_BYTE *)v37 + 24))
        -[PXNavigationListController contentHeightDidChange](self, "contentHeightDidChange");
    }
    else
    {
      -[PXNavigationListController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __48__PXNavigationListController__updateDataSection__block_invoke_4;
      v28[3] = &unk_1E5130FD8;
      v28[4] = self;
      v34 = currentContentHeight;
      v35 = v17;
      v29 = v4;
      v33 = &v36;
      v21 = v19;
      v30 = v21;
      v31 = v7;
      v32 = v9;
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __48__PXNavigationListController__updateDataSection__block_invoke_5;
      v27[3] = &unk_1E5149088;
      v27[4] = self;
      v27[5] = &v36;
      objc_msgSend(v21, "performBatchUpdates:completion:", v28, v27);
      objc_msgSend(v21, "indexPathsForVisibleRows");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      v24[1] = 3221225472;
      v24[2] = __48__PXNavigationListController__updateDataSection__block_invoke_6;
      v24[3] = &unk_1E513AB20;
      v23 = v21;
      v25 = v23;
      v26 = self;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v24);

    }
    _Block_object_dispose(&v36, 8);

  }
  else
  {
    objc_storeStrong((id *)&self->_dataSection, v4);
    -[PXNavigationListController _preloadRowHeightCache](self, "_preloadRowHeightCache");
  }

}

- (void)_preferredContentSizeChanged:(id)a3
{
  -[PXNavigationListController _resetFonts](self, "_resetFonts", a3);
  -[PXNavigationListController _resetCachedHeight](self, "_resetCachedHeight");
  -[PXNavigationListController _resetCachedMeasuringCell](self, "_resetCachedMeasuringCell");
  -[PXNavigationListController _reportContentHeightDidChangeIfNecessary](self, "_reportContentHeightDidChangeIfNecessary");
}

- (id)_textLabelFont
{
  UIFont *textLabelFont;
  UIFont *v4;
  UIFont *v5;

  textLabelFont = self->_textLabelFont;
  if (!textLabelFont)
  {
    MEMORY[0x1A85CC970](3, 0x8000, 12);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textLabelFont;
    self->_textLabelFont = v4;

    textLabelFont = self->_textLabelFont;
  }
  return textLabelFont;
}

- (id)_detailTextLabelFont
{
  UIFont *detailTextLabelFont;
  UIFont *v4;
  UIFont *v5;

  detailTextLabelFont = self->_detailTextLabelFont;
  if (!detailTextLabelFont)
  {
    MEMORY[0x1A85CC970](8, 0x8000, 12);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_detailTextLabelFont;
    self->_detailTextLabelFont = v4;

    detailTextLabelFont = self->_detailTextLabelFont;
  }
  return detailTextLabelFont;
}

- (void)_resetFonts
{
  UIFont *textLabelFont;
  UIFont *detailTextLabelFont;

  textLabelFont = self->_textLabelFont;
  self->_textLabelFont = 0;

  detailTextLabelFont = self->_detailTextLabelFont;
  self->_detailTextLabelFont = 0;

}

- (void)_resetCachedHeight
{
  -[NSMutableDictionary removeAllObjects](self->_rowHeightCache, "removeAllObjects");
}

- (void)_resetCachedMeasuringCell
{
  UITableViewCell *measuringCell;
  UIImage *measuringImage;

  measuringCell = self->_measuringCell;
  self->_measuringCell = 0;

  measuringImage = self->_measuringImage;
  self->_measuringImage = 0;

}

- (void)_configureCell:(id)a3 forListItem:(id)a4 textColor:(id)a5
{
  UITableViewCell *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIImage *v18;
  UIImage *measuringImage;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t);
  void *v28;
  id v29;
  id v30;

  v8 = (UITableViewCell *)a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  -[PXNavigationListController _textLabelFont](self, "_textLabelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  objc_msgSend(v11, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v10);

  if (self->_measuringCell == v8)
  {
    measuringImage = self->_measuringImage;
    if (measuringImage)
    {
      v18 = measuringImage;
      goto LABEL_15;
    }
  }
  objc_msgSend(v9, "glyphImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEmbeddedGlyph"))
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v18 = (UIImage *)v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v16);
      v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:
  if (!self->_measuringImage)
    objc_storeStrong((id *)&self->_measuringImage, v18);

LABEL_15:
  objc_msgSend(v11, "setImage:", v18);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __67__PXNavigationListController__configureCell_forListItem_textColor___block_invoke;
  v28 = &unk_1E5131000;
  v20 = v11;
  v29 = v20;
  v30 = v10;
  v21 = v10;
  -[UITableViewCell setConfigurationUpdateHandler:](v8, "setConfigurationUpdateHandler:", &v25);
  objc_msgSend(v9, "accessoryGlyphImageName", v25, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[UITableViewCell _setBadgeText:](v8, "_setBadgeText:", 0);
    -[PXNavigationListController secondaryAttributedTextForGlyphName:](self, "secondaryAttributedTextForGlyphName:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSecondaryAttributedText:", v23);
  }
  else
  {
    objc_msgSend(v20, "setSecondaryAttributedText:", 0);
    objc_msgSend(v9, "accessoryTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _setBadgeText:](v8, "_setBadgeText:", v24);

    -[PXNavigationListController _detailTextLabelFont](self, "_detailTextLabelFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _setBadgeFont:](v8, "_setBadgeFont:", v23);
  }

}

- (id)secondaryAttributedTextForGlyphName:(id)a3
{
  id v4;
  NSMutableDictionary *cachedSymbolAttributedStrings;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  cachedSymbolAttributedStrings = self->_cachedSymbolAttributedStrings;
  if (!cachedSymbolAttributedStrings)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_cachedSymbolAttributedStrings;
    self->_cachedSymbolAttributedStrings = v6;

    cachedSymbolAttributedStrings = self->_cachedSymbolAttributedStrings;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](cachedSymbolAttributedStrings, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
    objc_msgSend(v13, "setImage:", v12);
    objc_msgSend(v12, "baselineOffsetFromBottom");
    v15 = v14;
    objc_msgSend(v13, "bounds");
    objc_msgSend(v12, "size");
    objc_msgSend(v13, "setBounds:", 0.0, v15, v16, v17);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSymbolAttributedStrings, "setObject:forKeyedSubscript:", v8, v4);

  }
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PXNavigationListDataSection count](self->_dataSection, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXNavigationListSimpleCellReuseIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListDataSection objectAtIndex:](self->_dataSection, "objectAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListController _configureCell:forListItem:textColor:](self, "_configureCell:forListItem:textColor:", v8, v9, v10);
  -[PXNavigationListController _tableView:updateCellSeparatorStyle:forRowAtIndexPath:](self, "_tableView:updateCellSeparatorStyle:forRowAtIndexPath:", v7, v8, v6);

  return v8;
}

- (void)_tableView:(id)a3 updateCellSeparatorStyle:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = -[PXNavigationListController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v11, objc_msgSend(v10, "section"));

  v13 = objc_msgSend(v10, "item");
  v19 = v9;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 558, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 558, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v19, "setSeparatorStyleWorkaround57597636:", v13 != v12 - 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  PXNavigationListDataSection *dataSection;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  PXNavigationListController *v20;

  dataSection = self->_dataSection;
  v7 = a4;
  v8 = a3;
  -[PXNavigationListDataSection objectAtIndex:](dataSection, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXNavigationListController _navigateTolistItem:animated:](self, "_navigateTolistItem:animated:", v9, 1);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

  objc_msgSend(v9, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
  {
    if ((objc_msgSend(v11, "px_isFolder") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        v13 = objc_msgSend(v12, "assetCollectionSubtype");
        if (v13 != 205 && v13 != 1000000201)
        {
          objc_msgSend(v12, "localizedTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
          {
            v16 = (void *)MEMORY[0x1E0CA5920];
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __64__PXNavigationListController_tableView_didSelectRowAtIndexPath___block_invoke_2;
            v17[3] = &unk_1E5131048;
            v18 = v12;
            v19 = v18;
            v20 = self;
            objc_msgSend(v16, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.album"), &__block_literal_global_167794, v17);

          }
        }

      }
    }
  }

}

- (id)_assetCollectionAtIndexPath:(id)a3
{
  void *v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  -[PXNavigationListDataSection objectAtIndex:](self->_dataSection, "objectAtIndex:", objc_msgSend(a3, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 598, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("listItem.collection"), v10, v11);

    }
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  +[PXImportManager supportedTypeIdentifiers](PXImportManager, "supportedTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5);

  return v6;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v10, "item"), v12 < -[PXNavigationListDataSection count](self->_dataSection, "count")))
  {
    -[PXNavigationListController _assetCollectionAtIndexPath:](self, "_assetCollectionAtIndexPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "px_assetsDropMode");
    if (v14)
      v16 = 2;
    else
      v16 = 1;
    v15 = v14 != 0;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D70]), "initWithDropOperation:intent:", v16, 2 * v15);

  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D70]), "initWithDropOperation:intent:", 1, 0);
  }

  return v17;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "destinationIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListController _assetCollectionAtIndexPath:](self, "_assetCollectionAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v9, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitAssetCollectionDropAssetsActionPerformer dropAssetsActionPerformerForAssetCollection:dropSession:](PXPhotoKitAssetCollectionDropAssetsActionPerformer, "dropAssetsActionPerformerForAssetCollection:dropSession:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "performActionWithCompletionHandler:", 0);

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  -[PXNavigationListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  -[PXNavigationListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a5);
  return 1;
}

- (id)_navigateTolistItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PXNavigationListDataSection *dataSection;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  dataSection = self->_dataSection;
  v7 = a3;
  -[PXNavigationListDataSection existingFetchResultForListItem:](dataSection, "existingFetchResultForListItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "navigateToListItem:sourceViewController:existingAssetsFetchResult:animated:completion:", v7, self, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXNavigationListDataSectionManagerObservationContext == a5)
    -[PXNavigationListController _updateDataSection](self, "_updateDataSection", a3);
}

- (void)_preloadRowHeightsForAllValidItems
{
  PXNavigationListDataSection *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  PXNavigationListDataSection *v15;
  void *v16;
  id obj;
  NSMutableSet *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  _QWORD block[5];
  NSObject *v23;
  void *v24;
  id v25[2];
  id buf[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = self->_dataSection;
  -[PXNavigationListController _insetWidth](self, "_insetWidth");
  v5 = v4;
  v15 = v3;
  v18 = self->_queuedCacheKeys;
  PXNavigationListControllerUncachedItems(v3, v18, self->_rowHeightCache, 1, *(double *)&v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "viewControllerLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerCacheAllValidRowHeights", ", (uint8_t *)buf, 2u);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v16;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          PXNavigationListControllerCacheKeyForListItem(v10, *(double *)&v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v18, "addObject:", v11);
          objc_initWeak(buf, self);
          +[PXNavigationListController _rowHeightCachingQueue](PXNavigationListController, "_rowHeightCachingQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke;
          block[3] = &unk_1E5131070;
          block[4] = self;
          v23 = v6;
          objc_copyWeak(v25, buf);
          v25[1] = v5;
          v24 = v10;
          dispatch_async(v12, block);

          objc_destroyWeak(v25);
          objc_destroyWeak(buf);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v7);
    }

    objc_initWeak(buf, self);
    +[PXNavigationListController _rowHeightCachingQueue](PXNavigationListController, "_rowHeightCachingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_186;
    v19[3] = &unk_1E5147280;
    v20 = v6;
    v14 = v6;
    objc_copyWeak(&v21, buf);
    dispatch_async(v13, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }

}

- (void)_finishedAllPreloadTasks
{
  PXNavigationListDataSection *dataSection;
  double v4;
  void *v5;
  NSMutableSet *queuedCacheKeys;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  dataSection = self->_dataSection;
  -[PXNavigationListController _insetWidth](self, "_insetWidth");
  PXNavigationListControllerUncachedItems(dataSection, self->_queuedCacheKeys, self->_rowHeightCache, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PXNavigationListController _skipPreloadTaskIfNecessary](self, "_skipPreloadTaskIfNecessary");
  }
  else
  {
    queuedCacheKeys = self->_queuedCacheKeys;
    self->_queuedCacheKeys = 0;

    objc_msgSend((id)objc_opt_class(), "viewControllerLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerLoadView", ", buf, 2u);
    }
    -[PXNavigationListController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerLoadView", ", v9, 2u);
    }

  }
}

- (double)_insetWidth
{
  return self->_layoutWidth - self->_contentInsets.left - self->_contentInsets.right;
}

- (PXNavigationListDataSectionManager)dataSectionManager
{
  return self->_dataSectionManager;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_dataSectionManager, 0);
  objc_storeStrong((id *)&self->_cachedSymbolAttributedStrings, 0);
  objc_storeStrong((id *)&self->_queuedCacheKeys, 0);
  objc_storeStrong((id *)&self->_firstPreloadCacheStartTime, 0);
  objc_storeStrong((id *)&self->_measuringImage, 0);
  objc_storeStrong((id *)&self->_measuringCell, 0);
  objc_storeStrong((id *)&self->_rowHeightCache, 0);
  objc_storeStrong((id *)&self->_detailTextLabelFont, 0);
  objc_storeStrong((id *)&self->_textLabelFont, 0);
  objc_storeStrong((id *)&self->_dataSection, 0);
}

void __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;
  id v6[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_2;
  block[3] = &unk_1E5131070;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  objc_copyWeak(v6, (id *)(a1 + 56));
  v6[1] = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v6);

}

void __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_186(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_2_187;
  v2[3] = &unk_1E5147280;
  v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v4);

}

void __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_2_187(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerCacheAllValidRowHeights", ", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishedAllPreloadTasks");

}

void __64__PXNavigationListController__preloadRowHeightsForAllValidItems__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isViewLoaded") & 1) == 0)
  {
    v2 = *(NSObject **)(a1 + 40);
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerCacheRowHeight", ", buf, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_contentHeightForCellWithWidth:listItem:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

    v4 = *(NSObject **)(a1 + 40);
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PXNavigationListControllerCacheRowHeight", ", v5, 2u);
    }
  }
}

void __64__PXNavigationListController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  v6 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUserInfoEntriesFromDictionary:", v5);

  objc_msgSend(v3, "px_setPersistentIdentifierFromAssetCollection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

id __64__PXNavigationListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return px_deferredLocalizedStringWithFormat(CFSTR("PXSiriActionsViewPeopleAlbumTitle"), a2, a3, a4, a5, a6, a7, a8, a9);
}

void __67__PXNavigationListController__configureCell_forListItem_textColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updatedConfigurationForState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "isFocused");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(void **)(a1 + 40);
  }
  objc_msgSend(v5, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  if (v6)
  objc_msgSend(v10, "setContentConfiguration:", v5);
  if ((objc_msgSend(v10, "isFocused") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setBadgeColor:", v9);

  }
  else
  {
    objc_msgSend(v10, "_setBadgeColor:", 0);
  }

}

void __48__PXNavigationListController__updateDataSection__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __48__PXNavigationListController__updateDataSection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __48__PXNavigationListController__updateDataSection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __48__PXNavigationListController__updateDataSection__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 968), *(id *)(a1 + 40));
  if (*(double *)(a1 + 80) < *(double *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "contentHeightDidChange");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 100);

  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 64), "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertRowsAtIndexPaths:withRowAnimation:", v5, 0);

}

uint64_t __48__PXNavigationListController__updateDataSection__block_invoke_5(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "contentHeightDidChange");
  return result;
}

void __48__PXNavigationListController__updateDataSection__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "_tableView:updateCellSeparatorStyle:forRowAtIndexPath:", *(_QWORD *)(a1 + 32), v3, v4);

}

+ (id)navigateToListItem:(id)a3 sourceViewController:(id)a4 existingAssetsFetchResult:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(v14, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXNavigationListController.m"), 90, CFSTR("expected %@ to have a navigation controller"), v14);

  }
  v18 = v14;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    while (1)
    {
      objc_msgSend(v20, "parentViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 == v17)
        break;
      objc_msgSend(v20, "parentViewController");
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
      if (!v22)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXNavigationListController.m"), 97, CFSTR("couldn't find child controller of navigationController %@ containing sourceViewController %@"), v17, v19);

    v20 = 0;
  }
  objc_msgSend(v20, "px_gridPresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllerForCollectionWithGridPresentation:existingAssetsFetchResult:", v24, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v25;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v27 = (void *)MEMORY[0x1E0CD28B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __116__PXNavigationListController_navigateToListItem_sourceViewController_existingAssetsFetchResult_animated_completion___block_invoke;
    v40[3] = &unk_1E5148CE0;
    v42 = v16;
    v41 = v26;
    objc_msgSend(v27, "setCompletionBlock:", v40);

  }
  objc_msgSend(v17, "viewControllers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "indexOfObject:", v20);
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = v29;
    v38 = v16;
    v39 = v15;
    v31 = v8;
    v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v28, "subarrayWithRange:", 0, v30 + 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithArray:", v33);

    if (v26)
      objc_msgSend(v34, "addObject:", v26);
    objc_msgSend(v17, "setViewControllers:animated:", v34, v31);
    objc_msgSend(v13, "cpAnalyticsEventName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v35, MEMORY[0x1E0C9AA70]);

    v16 = v38;
    v15 = v39;
  }
  if (v16)
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  return v26;
}

+ (id)_rowHeightCachingQueue
{
  if (_rowHeightCachingQueue_onceToken != -1)
    dispatch_once(&_rowHeightCachingQueue_onceToken, &__block_literal_global_191_167861);
  return (id)_rowHeightCachingQueue_rowHeightCachingQueue;
}

+ (id)viewControllerLog
{
  if (viewControllerLog_onceToken != -1)
    dispatch_once(&viewControllerLog_onceToken, &__block_literal_global_193_167858);
  return (id)viewControllerLog_log;
}

void __47__PXNavigationListController_viewControllerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PXNavigationListController");
  v1 = (void *)viewControllerLog_log;
  viewControllerLog_log = (uint64_t)v0;

}

void __52__PXNavigationListController__rowHeightCachingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_rowHeightCachingQueue_rowHeightCachingQueue;
  _rowHeightCachingQueue_rowHeightCachingQueue = v0;

}

uint64_t __116__PXNavigationListController_navigateToListItem_sourceViewController_existingAssetsFetchResult_animated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
