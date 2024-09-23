@implementation TKTonePickerViewController

- (TKTonePickerViewController)initWithStyle:(int64_t)a3
{
  return -[TKTonePickerViewController initWithAlertType:](self, "initWithAlertType:", 1);
}

- (TKTonePickerViewController)initWithAlertType:(int64_t)a3
{
  return (TKTonePickerViewController *)-[TKTonePickerViewController _initWithAlertType:tableViewStyle:](self, "_initWithAlertType:tableViewStyle:", a3, 1);
}

- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4
{
  TKTonePickerViewController *v6;
  TKTonePickerController *v7;
  TKTonePickerController *tonePickerController;
  id v9;
  uint64_t v10;
  uint64_t v11;
  UIImage *checkmarkImage;
  TKTonePickerTableViewCellLayoutManager *v13;
  TKTonePickerTableViewCellLayoutManager *tableViewCellLayoutManagerForIndentedRows;
  TKTonePickerTableViewCellLayoutManager *v15;
  TKTonePickerTableViewCellLayoutManager *tableViewCellLayoutManagerForUnindentedRows;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TKTonePickerViewController;
  v6 = -[TKTonePickerViewController initWithStyle:](&v19, sel_initWithStyle_, a4);
  if (v6)
  {
    v7 = -[TKTonePickerController initWithAlertType:]([TKTonePickerController alloc], "initWithAlertType:", a3);
    tonePickerController = v6->_tonePickerController;
    v6->_tonePickerController = v7;

    -[TKTonePickerController setDelegate:](v6->_tonePickerController, "setDelegate:", v6);
    v9 = objc_alloc_init(MEMORY[0x24BEB8CD0]);
    -[TKTonePickerController setToneStoreDownloadController:](v6->_tonePickerController, "setToneStoreDownloadController:", v9);
    v10 = -[TKTonePickerController canShowStore](v6->_tonePickerController, "canShowStore");
    v6->_showsToneStore = v10;
    -[TKTonePickerController setShowsToneStore:](v6->_tonePickerController, "setShowsToneStore:", v10);
    v6->_allowsAutoScrollingToSelectedTone = 1;
    objc_msgSend((id)objc_opt_class(), "_checkmarkImage");
    v11 = objc_claimAutoreleasedReturnValue();
    checkmarkImage = v6->_checkmarkImage;
    v6->_checkmarkImage = (UIImage *)v11;

    v13 = objc_alloc_init(TKTonePickerTableViewCellLayoutManager);
    tableViewCellLayoutManagerForIndentedRows = v6->_tableViewCellLayoutManagerForIndentedRows;
    v6->_tableViewCellLayoutManagerForIndentedRows = v13;

    v15 = objc_alloc_init(TKTonePickerTableViewCellLayoutManager);
    tableViewCellLayoutManagerForUnindentedRows = v6->_tableViewCellLayoutManagerForUnindentedRows;
    v6->_tableViewCellLayoutManagerForUnindentedRows = v15;

    v6->_tonePickerTableViewStyle = a4;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__handlePreferredContentSizeCategoryDidChangeNotification_, *MEMORY[0x24BDF7670], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  TKToneClassicsTableViewController *toneClassicsTableViewController;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  TKToneClassicsTableViewController *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  TKTonePickerViewController *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);
  if (self->_showsMedia
    && -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker"))
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endGeneratingLibraryChangeNotifications");

  }
  -[TKTonePickerViewController tonePickerTableViewControllerWillBeDeallocated:](self, "tonePickerTableViewControllerWillBeDeallocated:", self);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_switchControlsBeingObserved;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "removeTarget:action:forControlEvents:", self, sel__handleSwitchControlValueChanged_, 4096);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v7);
  }

  -[TKVibrationPickerViewController _setDismissalDelegate:](self->_vibrationPickerViewController, "_setDismissalDelegate:", 0);
  -[TKVibrationPickerViewController _setAdditionalDelegate:](self->_vibrationPickerViewController, "_setAdditionalDelegate:", 0);
  if (self->_toneClassicsTableViewController)
  {
    TLLogToneManagement();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      toneClassicsTableViewController = self->_toneClassicsTableViewController;
      *(_DWORD *)buf = 138543874;
      v18 = toneClassicsTableViewController;
      v19 = 2082;
      v20 = "-[TKTonePickerViewController dealloc]";
      v21 = 2114;
      v22 = self;
      _os_log_impl(&dword_2157C4000, v10, OS_LOG_TYPE_DEFAULT, "Nilling out tonePickerTableViewControllerHelper of %{public}@ in %{public}s for %{public}@.", buf, 0x20u);
    }

    -[TKToneClassicsTableViewController setTonePickerTableViewControllerHelper:](self->_toneClassicsTableViewController, "setTonePickerTableViewControllerHelper:", 0);
  }
  -[MPMediaPickerController setDelegate:](self->_mediaPickerController, "setDelegate:", 0);
  -[TKTonePickerController setDelegate:](self->_tonePickerController, "setDelegate:", 0);

  v12.receiver = self;
  v12.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController dealloc](&v12, sel_dealloc);
}

- (int64_t)alertType
{
  return -[TKTonePickerController alertType](self->_tonePickerController, "alertType");
}

- (NSString)topic
{
  return -[TKTonePickerController topic](self->_tonePickerController, "topic");
}

- (void)setTopic:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  v7 = a3;
  -[TKTonePickerController topic](self->_tonePickerController, "topic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != v7 && (objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
  {
    -[TKTonePickerController setTopic:](self->_tonePickerController, "setTopic:", v7);
    if (-[TKTonePickerViewController alertType](self, "alertType") == 13
      && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB8CF0]))
    {
      if (!self->_showsToneStoreWasSetExplicitly)
        -[TKTonePickerController setShowsToneStore:](self->_tonePickerController, "setShowsToneStore:", 0);
      v6 = 0;
      self->_needsScrollPositionReset = 0;
    }
    else
    {
      v6 = 1;
    }
    if (!self->_allowsAutoScrollingToSelectedToneWasSetExplicitly)
      self->_allowsAutoScrollingToSelectedTone = v6;
  }

}

- (BOOL)showsDefault
{
  return -[TKTonePickerController showsDefault](self->_tonePickerController, "showsDefault");
}

- (void)setShowsDefault:(BOOL)a3
{
  -[TKTonePickerController setShowsDefault:](self->_tonePickerController, "setShowsDefault:", a3);
}

- (NSString)defaultToneIdentifier
{
  return -[TKTonePickerController defaultToneIdentifier](self->_tonePickerController, "defaultToneIdentifier");
}

- (void)setDefaultToneIdentifier:(id)a3
{
  -[TKTonePickerController setDefaultToneIdentifier:](self->_tonePickerController, "setDefaultToneIdentifier:", a3);
}

- (BOOL)showsNone
{
  return -[TKTonePickerController showsNone](self->_tonePickerController, "showsNone");
}

- (void)setShowsNone:(BOOL)a3
{
  -[TKTonePickerController setShowsNone:](self->_tonePickerController, "setShowsNone:", a3);
}

- (BOOL)isNoneAtTop
{
  return -[TKTonePickerController isNoneAtTop](self->_tonePickerController, "isNoneAtTop");
}

- (void)setNoneAtTop:(BOOL)a3
{
  -[TKTonePickerController setNoneAtTop:](self->_tonePickerController, "setNoneAtTop:", a3);
}

- (NSString)noneString
{
  return -[TKTonePickerController noneString](self->_tonePickerController, "noneString");
}

- (void)setNoneString:(id)a3
{
  -[TKTonePickerController setNoneString:](self->_tonePickerController, "setNoneString:", a3);
}

- (BOOL)showsNothingSelected
{
  return -[TKTonePickerController showsNothingSelected](self->_tonePickerController, "showsNothingSelected");
}

- (void)setShowsNothingSelected:(BOOL)a3
{
  -[TKTonePickerController setShowsNothingSelected:](self->_tonePickerController, "setShowsNothingSelected:", a3);
}

- (NSString)selectedToneIdentifier
{
  return -[TKTonePickerController selectedToneIdentifier](self->_tonePickerController, "selectedToneIdentifier");
}

- (void)setSelectedToneIdentifier:(id)a3
{
  -[TKTonePickerController setSelectedToneIdentifier:](self->_tonePickerController, "setSelectedToneIdentifier:", a3);
}

- (BOOL)_allowsAutoScrollingToSelectedTone
{
  return self->_allowsAutoScrollingToSelectedTone;
}

- (void)_setAllowsAutoScrollingToSelectedTone:(BOOL)a3
{
  self->_allowsAutoScrollingToSelectedTone = a3;
  self->_allowsAutoScrollingToSelectedToneWasSetExplicitly = 1;
}

- (NSString)_overrideFirstToneSectionTitle
{
  return -[TKTonePickerController overrideFirstToneSectionTitle](self->_tonePickerController, "overrideFirstToneSectionTitle");
}

- (void)_setOverrideFirstToneSectionTitle:(id)a3
{
  -[TKTonePickerController setOverrideFirstToneSectionTitle:](self->_tonePickerController, "setOverrideFirstToneSectionTitle:", a3);
}

- (void)setShowsToneStore:(BOOL)a3
{
  if (a3)
    *(_DWORD *)&a3 = -[TKTonePickerController canShowStore](self->_tonePickerController, "canShowStore");
  if (self->_showsToneStore != a3)
  {
    self->_showsToneStore = a3;
    self->_showsToneStoreWasSetExplicitly = 1;
    -[TKTonePickerController setShowsToneStore:](self->_tonePickerController, "setShowsToneStore:");
  }
}

- (void)setShowsIgnoreMute:(BOOL)a3
{
  if (self->_showsIgnoreMute != a3)
  {
    self->_showsIgnoreMute = a3;
    -[TKTonePickerController setShowsIgnoreMute:](self->_tonePickerController, "setShowsIgnoreMute:");
  }
}

- (BOOL)ignoreMute
{
  return -[TKTonePickerController ignoreMute](self->_tonePickerController, "ignoreMute");
}

- (void)setIgnoreMute:(BOOL)a3
{
  -[TKTonePickerController setIgnoreMute:](self->_tonePickerController, "setIgnoreMute:", a3);
}

- (void)_handleSwitchControlValueChanged:(id)a3
{
  BOOL isHandlingSwitchControlValueChanged;

  isHandlingSwitchControlValueChanged = self->_isHandlingSwitchControlValueChanged;
  self->_isHandlingSwitchControlValueChanged = 1;
  -[TKTonePickerController setIgnoreMute:](self->_tonePickerController, "setIgnoreMute:", objc_msgSend(a3, "isOn"));
  self->_isHandlingSwitchControlValueChanged = isHandlingSwitchControlValueChanged;
}

- (int64_t)targetDevice
{
  return -[TKTonePickerController targetDevice](self->_tonePickerController, "targetDevice");
}

- (void)setTargetDevice:(int64_t)a3
{
  -[TKTonePickerController setTargetDevice:](self->_tonePickerController, "setTargetDevice:", a3);
}

- (BOOL)showsVibrations
{
  return -[TKTonePickerController showsVibrations](self->_tonePickerController, "showsVibrations");
}

- (void)setShowsVibrations:(BOOL)a3
{
  -[TKTonePickerController setShowsVibrations:](self->_tonePickerController, "setShowsVibrations:", a3);
}

- (NSString)selectedVibrationIdentifier
{
  return -[TKTonePickerController selectedVibrationIdentifier](self->_tonePickerController, "selectedVibrationIdentifier");
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
  -[TKTonePickerController setSelectedVibrationIdentifier:](self->_tonePickerController, "setSelectedVibrationIdentifier:", a3);
}

- (void)setStyleProvider:(id)a3
{
  void *v5;
  void *v6;
  TKTonePickerStyleProvider *v7;

  v7 = (TKTonePickerStyleProvider *)a3;
  if (self->_styleProvider != v7)
  {
    objc_storeStrong((id *)&self->_styleProvider, a3);
    if (-[TKTonePickerViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[TKTonePickerViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerViewController _updateStyleOfTableView:forStyleProvider:](self, "_updateStyleOfTableView:forStyleProvider:", v5, v7);
      objc_msgSend(v5, "reloadData");
      if (-[TKToneClassicsTableViewController isViewLoaded](self->_toneClassicsTableViewController, "isViewLoaded"))
      {
        -[TKToneClassicsTableViewController tableView](self->_toneClassicsTableViewController, "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTonePickerViewController _updateStyleOfTableView:forStyleProvider:](self, "_updateStyleOfTableView:forStyleProvider:", v6, v7);
        objc_msgSend(v6, "reloadData");

      }
    }
  }

}

- (void)_updateStyleOfTableView:(id)a3 forStyleProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "tonePickerUsesOpaqueBackground") & 1) == 0)
    {
      objc_msgSend(v10, "setBackgroundView:", 0);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v7);

    }
    objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v6, "tonePickerTableViewSeparatorStyle"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = UIBackdropViewOverlayBlendModeFromTKBackdropViewOverlayBlendMode(objc_msgSend(v6, "tonePickerCustomTableSeparatorBackdropOverlayBlendMode"));
      if (v8)
        objc_msgSend(v10, "_setSeparatorBackdropOverlayBlendMode:", v8);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "tonePickerCustomTableSeparatorColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v10, "setSeparatorColor:", v9);

    }
  }

}

- (void)loadView
{
  -[TKTonePickerViewController loadViewForTonePickerTableViewController:](self, "loadViewForTonePickerTableViewController:", self);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TKTonePickerViewController _updateMinimumTextIndentation](self, "_updateMinimumTextIndentation");
  -[TKTonePickerViewController _reloadData](self, "_reloadData");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[TKTonePickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lineHeight");
    objc_msgSend(v4, "setEstimatedRowHeight:", ceil(v6 + v6));

    objc_msgSend(v4, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  TKToneClassicsTableViewController *toneClassicsTableViewController;
  TKToneClassicsTableViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  TKToneClassicsTableViewController *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  TKTonePickerViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  if (self->_toneClassicsTableViewController)
  {
    TLLogToneManagement();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      toneClassicsTableViewController = self->_toneClassicsTableViewController;
      *(_DWORD *)buf = 138543874;
      v13 = toneClassicsTableViewController;
      v14 = 2082;
      v15 = "-[TKTonePickerViewController viewDidAppear:]";
      v16 = 2114;
      v17 = self;
      _os_log_impl(&dword_2157C4000, v4, OS_LOG_TYPE_DEFAULT, "Nilling out tonePickerTableViewControllerHelper of %{public}@ in %{public}s for %{public}@.", buf, 0x20u);
    }

    -[TKToneClassicsTableViewController setTonePickerTableViewControllerHelper:](self->_toneClassicsTableViewController, "setTonePickerTableViewControllerHelper:", 0);
    v6 = self->_toneClassicsTableViewController;
    self->_toneClassicsTableViewController = 0;

  }
  -[TKTonePickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TKTonePickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForSelectedRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v10, 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TKTonePickerController finishedWithPicker](self->_tonePickerController, "finishedWithPicker");
  v5.receiver = self;
  v5.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  if (self->_needsScrollPositionReset)
  {
    -[TKTonePickerController indexPathForSelectedTone](self->_tonePickerController, "indexPathForSelectedTone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[TKTonePickerViewController tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indexPathsForVisibleRows");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v3);

      if ((v6 & 1) == 0)
        objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v3, 2, 0);
    }
    else
    {
      -[TKTonePickerController _indexPathForFirstToneGroup](self->_tonePickerController, "_indexPathForFirstToneGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[TKTonePickerViewController tableView](self, "tableView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 1, 0);

      }
    }

    self->_needsScrollPositionReset = 0;
  }
}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerViewController;
  -[TKTonePickerViewController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[TKTonePickerController finishedWithPicker](self->_tonePickerController, "finishedWithPicker");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_customHeaderViewForHeaderInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;
  TKLabelContainerView *v8;
  TKLabelContainerView *v9;
  void *v10;
  TKLabelContainerView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *toneSectionHeaderViews;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  uint64_t v25;

  -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("TKTonePickerSectionHeaderDefault");
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  switch(objc_msgSend(v4, "sectionHeader"))
  {
    case 1:
      goto LABEL_5;
    case 2:
      v7 = objc_msgSend(v4, "regularToneSectionIndex");
      v6 = CFSTR("TKTonePickerSectionHeaderRegularToneGroup");
      if (!v5)
        goto LABEL_25;
      goto LABEL_6;
    case 3:
      v6 = CFSTR("TKTonePickerSectionHeaderMedia");
LABEL_5:
      if (v5)
        goto LABEL_6;
      goto LABEL_25;
    case 4:
      v6 = CFSTR("TKTonePickerSectionHeaderStore");
      if (!v5)
        goto LABEL_25;
LABEL_6:
      -[NSMutableDictionary objectForKey:](self->_toneSectionHeaderViews, "objectForKey:", v6);
      v8 = (TKLabelContainerView *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v7 >= -[TKLabelContainerView count](v8, "count"))
        {
          v11 = 0;
        }
        else
        {
          -[TKLabelContainerView objectAtIndex:](v9, "objectAtIndex:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;

        }
        v9 = v11;
      }
      if (v9)
        goto LABEL_26;
      if (-[TKTonePickerStyleProvider wantsCustomTonePickerHeaderView](self->_styleProvider, "wantsCustomTonePickerHeaderView"))
      {
        v9 = objc_alloc_init(TKLabelContainerView);
        v12 = v5;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && -[TKTonePickerStyleProvider tonePickerHeaderTextShouldBeUppercase](self->_styleProvider, "tonePickerHeaderTextShouldBeUppercase"))
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uppercaseStringWithLocale:", v13);
          v25 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v25;
        }
        -[TKLabelContainerView setLabelText:](v9, "setLabelText:", v12);
        -[TKTonePickerStyleProvider tonePickerHeaderTextFont](self->_styleProvider, "tonePickerHeaderTextFont");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKLabelContainerView setLabelFont:](v9, "setLabelFont:", v14);

        -[TKTonePickerStyleProvider tonePickerHeaderTextColor](self->_styleProvider, "tonePickerHeaderTextColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKLabelContainerView setLabelTextColor:](v9, "setLabelTextColor:", v15);

        -[TKTonePickerStyleProvider tonePickerHeaderTextShadowColor](self->_styleProvider, "tonePickerHeaderTextShadowColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKLabelContainerView setLabelShadowColor:](v9, "setLabelShadowColor:", v16);

        -[TKTonePickerStyleProvider tonePickerHeaderTextShadowOffset](self->_styleProvider, "tonePickerHeaderTextShadowOffset");
        -[TKLabelContainerView setLabelShadowOffset:](v9, "setLabelShadowOffset:");
        -[TKTonePickerStyleProvider tonePickerHeaderTextPaddingInsets](self->_styleProvider, "tonePickerHeaderTextPaddingInsets");
        -[TKLabelContainerView setLabelPaddingInsets:](v9, "setLabelPaddingInsets:");
        toneSectionHeaderViews = self->_toneSectionHeaderViews;
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!toneSectionHeaderViews)
          {
            v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            v19 = self->_toneSectionHeaderViews;
            self->_toneSectionHeaderViews = v18;

            toneSectionHeaderViews = self->_toneSectionHeaderViews;
          }
          -[NSMutableDictionary setObject:forKey:](toneSectionHeaderViews, "setObject:forKey:", v9, v6);
        }
        else
        {
          -[NSMutableDictionary objectForKey:](toneSectionHeaderViews, "objectForKey:", v6);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v22 = self->_toneSectionHeaderViews;
            if (!v22)
            {
              v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
              v24 = self->_toneSectionHeaderViews;
              self->_toneSectionHeaderViews = v23;

              v22 = self->_toneSectionHeaderViews;
            }
            -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v21, v6);
          }
          objc_msgSend(v21, "tk_ensureHasItemsOrNullUpToIndex:", v7);
          objc_msgSend(v21, "replaceObjectAtIndex:withObject:", v7, v9);

        }
      }
      else
      {
LABEL_25:
        v9 = 0;
      }
LABEL_26:

      return v9;
    default:
      goto LABEL_25;
  }
}

- (double)_minimumTextIndentationForTableView:(id)a3 withCheckmarkImage:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  v5 = a4;
  objc_msgSend(a3, "layoutMargins");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;

  result = v7 + v9 + 15.0;
  if (result < 57.0)
    return 57.0;
  return result;
}

- (void)_updateMinimumTextIndentation
{
  void *v3;
  double v4;
  double v5;

  if (-[TKTonePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[TKTonePickerViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController _minimumTextIndentationForTableView:withCheckmarkImage:](self, "_minimumTextIndentationForTableView:withCheckmarkImage:", v3, self->_checkmarkImage);
    v5 = v4;

    -[TKTonePickerTableViewCellLayoutManager setMinimumTextIndentation:](self->_tableViewCellLayoutManagerForIndentedRows, "setMinimumTextIndentation:", v5);
  }
}

+ (id)_checkmarkImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6A78], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_didSelectToneWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TKTonePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tonePickerViewController:selectedToneWithIdentifier:", self, v5);

}

- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5
{
  TKTonePickerStyleProvider *styleProvider;
  id v6;
  id v7;

  if (a4)
  {
    v7 = a3;
    objc_msgSend(v7, "setShouldTintTextLabel:", 1);
    objc_msgSend(v7, "setTextLabelColor:", 0);
  }
  else
  {
    styleProvider = self->_styleProvider;
    v6 = a3;
    -[TKTonePickerStyleProvider tonePickerCellTextColor](styleProvider, "tonePickerCellTextColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[TKUIKitConstants defaultTableViewCellTextColor](TKUIKitConstants, "defaultTableViewCellTextColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setShouldTintTextLabel:", 0);
    objc_msgSend(v6, "setTextLabelColor:", v7);

  }
}

- (id)_pickerRowItemForIndexPath:(id)a3
{
  TKTonePickerController *tonePickerController;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  tonePickerController = self->_tonePickerController;
  v4 = a3;
  -[TKTonePickerController pickerItemForSection:](tonePickerController, "pickerItemForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "childItemAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_reloadData
{
  void *v3;

  if (-[TKTonePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[TKTonePickerViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
  -[TKTonePickerViewController _resetScrollingPosition](self, "_resetScrollingPosition");
}

- (void)_resetScrollingPosition
{
  id v3;

  if (self->_allowsAutoScrollingToSelectedTone && !self->_needsScrollPositionReset)
  {
    self->_needsScrollPositionReset = 1;
    if (-[TKTonePickerViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[TKTonePickerViewController view](self, "view");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsLayout");

    }
  }
}

- (BOOL)_shouldShowCheckmarkOnTrailingEdge
{
  void *v3;
  char v4;

  if (-[TKTonePickerViewController alertType](self, "alertType") != 13)
    return 0;
  -[TKTonePickerViewController topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB8CF0]);

  return v4;
}

- (void)_updateCell:(id)a3 withDownloadProgress:(float)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  double v9;
  TKDownloadIndicatorView *v10;
  double v11;
  _QWORD v12[4];
  id v13;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "accessoryView");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (TKDownloadIndicatorView *)v8;
  if (llroundf(a4 * 8388600.0) != llroundf(8388600.0))
  {
    if (!v8)
    {
      v10 = objc_alloc_init(TKDownloadIndicatorView);
      objc_msgSend(v7, "setAccessoryView:", v10);
    }
    *(float *)&v9 = a4;
    -[TKDownloadIndicatorView setProgress:animated:completion:](v10, "setProgress:animated:completion:", v5, 0, v9);
    goto LABEL_7;
  }
  if (v8)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__TKTonePickerViewController__updateCell_withDownloadProgress_animated___block_invoke;
    v12[3] = &unk_24D37FE38;
    v13 = v7;
    LODWORD(v11) = 1.0;
    -[TKDownloadIndicatorView setProgress:animated:completion:](v10, "setProgress:animated:completion:", v5, v12, v11);

LABEL_7:
  }

}

uint64_t __72__TKTonePickerViewController__updateCell_withDownloadProgress_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", 0);
}

- (void)_handlePreferredContentSizeCategoryDidChangeNotification:(id)a3
{
  TKTonePickerStyleProvider *styleProvider;
  void *v5;
  NSMutableDictionary *toneSectionHeaderViews;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (-[TKTonePickerViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    styleProvider = self->_styleProvider;
    if (styleProvider)
    {
      -[TKTonePickerStyleProvider tonePickerHeaderTextFont](styleProvider, "tonePickerHeaderTextFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerStyleProvider tonePickerHeaderTextPaddingInsets](self->_styleProvider, "tonePickerHeaderTextPaddingInsets");
      toneSectionHeaderViews = self->_toneSectionHeaderViews;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __87__TKTonePickerViewController__handlePreferredContentSizeCategoryDidChangeNotification___block_invoke;
      v12[3] = &unk_24D380188;
      v13 = v5;
      v14 = v7;
      v15 = v8;
      v16 = v9;
      v17 = v10;
      v11 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](toneSectionHeaderViews, "enumerateKeysAndObjectsUsingBlock:", v12);

    }
  }
}

void __87__TKTonePickerViewController__handlePreferredContentSizeCategoryDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v6, "setLabelFont:", v5);
    objc_msgSend(v6, "setLabelPaddingInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = *(_QWORD *)(a1 + 32);
              v14 = v12;
              objc_msgSend(v14, "setLabelFont:", v13);
              objc_msgSend(v14, "setLabelPaddingInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

    }
  }

}

- (void)_handleMediaLibraryDidChangeNotification
{
  -[TKTonePickerController _reloadTones](self->_tonePickerController, "_reloadTones");
}

- (BOOL)_isAllowedToPresentMediaPicker
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  objc_class *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!self->_isAllowedToPresentMediaPickerFlagLoaded)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v3 = (void *)getLSApplicationRecordClass_softClass;
    v29 = getLSApplicationRecordClass_softClass;
    if (!getLSApplicationRecordClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLSApplicationRecordClass_block_invoke;
      v31 = &unk_24D3801D8;
      v32 = &v26;
      __getLSApplicationRecordClass_block_invoke((uint64_t)buf);
      v3 = (void *)v27[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v26, 8);
    v25 = 0;
    v5 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Music"), 1, &v25);
    v6 = v25;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(v5, "applicationState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isValid");

      if ((v11 & 1) != 0)
      {
        v26 = 0;
        v27 = &v26;
        v28 = 0x2050000000;
        v12 = (void *)getPDCPreflightManagerClass_softClass;
        v29 = getPDCPreflightManagerClass_softClass;
        if (!getPDCPreflightManagerClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getPDCPreflightManagerClass_block_invoke;
          v31 = &unk_24D3801D8;
          v32 = &v26;
          __getPDCPreflightManagerClass_block_invoke((uint64_t)buf);
          v12 = (void *)v27[3];
        }
        v13 = objc_retainAutorelease(v12);
        _Block_object_dispose(&v26, 8);
        v9 = objc_msgSend([v13 alloc], "initWithTargetQueue:", 0);
        v14 = -[NSObject requiresPreflightForApplicationRecord:](v9, "requiresPreflightForApplicationRecord:", v5);
        self->_isAllowedToPresentMediaPicker = v14 ^ 1;
        TLLogToneManagement();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if ((v14 & 1) != 0)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v5;
            *(_WORD *)&buf[22] = 2114;
            v31 = v9;
            _os_log_error_impl(&dword_2157C4000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Music application %{public}@ requires preflight for privacy disclosure according to %{public}@.", buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          v31 = v9;
          _os_log_impl(&dword_2157C4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Music application %{public}@ does not require preflight for privacy disclosure according to %{public}@.", buf, 0x20u);
        }

      }
      else
      {
        TLLogToneManagement();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[TKTonePickerViewController _isAllowedToPresentMediaPicker].cold.2();
      }
    }
    else
    {
      TLLogToneManagement();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        v31 = v7;
        _os_log_error_impl(&dword_2157C4000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve record %{public}@ for Music application with error: %{public}@.", buf, 0x20u);
      }
    }

    if (!self->_isAllowedToPresentMediaPicker)
    {
      TLLogToneManagement();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController _isAllowedToPresentMediaPicker].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);

    }
    self->_isAllowedToPresentMediaPickerFlagLoaded = 1;

  }
  return self->_isAllowedToPresentMediaPicker;
}

- (void)setShowsMedia:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  int v7;
  int v8;
  NSMutableArray *v9;
  NSMutableArray *mediaItems;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  -[TKTonePickerController _selectedIdentifier:](self->_tonePickerController, "_selectedIdentifier:", &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_showsMedia)
  {
    self->_showsMedia = v3;
    if (!v3)
      goto LABEL_21;
    v7 = 0;
LABEL_7:
    v8 = -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker");
    if (v7 == v8)
      goto LABEL_21;
    if (v8)
    {
      v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
      mediaItems = self->_mediaItems;
      self->_mediaItems = v9;

      v11 = (void *)CFPreferencesCopyAppValue(CFSTR("tonePickerMediaItemList"), (CFStringRef)*MEMORY[0x24BDBD580]);
      if (v11)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = self->_mediaItems;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedLongLongValue", (_QWORD)v23));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v17, "addObject:", v18);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v14);
        }

        CFRelease(v12);
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", (_QWORD)v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__handleMediaLibraryDidChangeNotification, *MEMORY[0x24BDDBCF0], 0);

      objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "beginGeneratingLibraryChangeNotifications");
      goto LABEL_20;
    }
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);

    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endGeneratingLibraryChangeNotifications");

    v20 = self->_mediaItems;
    self->_mediaItems = 0;
LABEL_20:

    goto LABEL_21;
  }
  v6 = -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker");
  v7 = v6;
  self->_showsMedia = v3;
  if (v3)
    goto LABEL_7;
  if (v6)
    goto LABEL_19;
LABEL_21:
  -[TKTonePickerViewController _handleMediaLibraryDidChangeNotification](self, "_handleMediaLibraryDidChangeNotification");
  if (v5)
  {
    if (v27)
      -[TKTonePickerViewController setSelectedMediaIdentifier:](self, "setSelectedMediaIdentifier:", v5);
    else
      -[TKTonePickerViewController setSelectedToneIdentifier:](self, "setSelectedToneIdentifier:", v5);
  }

}

- (BOOL)isMediaAtTop
{
  return -[TKTonePickerController isMediaAtTop](self->_tonePickerController, "isMediaAtTop");
}

- (void)setMediaAtTop:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;

  v3 = a3;
  v6 = 0;
  -[TKTonePickerViewController selectedIdentifier:](self, "selectedIdentifier:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController setMediaAtTop:](self->_tonePickerController, "setMediaAtTop:", v3);
  if (v5)
  {
    if (v6)
      -[TKTonePickerViewController setSelectedMediaIdentifier:](self, "setSelectedMediaIdentifier:", v5);
    else
      -[TKTonePickerViewController setSelectedToneIdentifier:](self, "setSelectedToneIdentifier:", v5);
  }

}

- (id)selectedIdentifier:(BOOL *)a3
{
  return -[TKTonePickerController _selectedIdentifier:](self->_tonePickerController, "_selectedIdentifier:", a3);
}

- (NSNumber)selectedMediaIdentifier
{
  void *v2;
  void *v3;
  id v4;
  char v6;

  v6 = 0;
  -[TKTonePickerViewController selectedIdentifier:](self, "selectedIdentifier:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v6)
    v4 = v2;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (void)setSelectedMediaIdentifier:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  TKTonePickerController *tonePickerController;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  unint64_t v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;

  v4 = (unint64_t)a3;
  if (self->_showsMedia
    && -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker"))
  {
    if (v4)
    {
      -[TKTonePickerController _indexPathForToneWithIdentifier:](self->_tonePickerController, "_indexPathForToneWithIdentifier:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = 0;
        goto LABEL_25;
      }
    }
    -[TKTonePickerViewController _mediaItemForIdentifier:](self, "_mediaItemForIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      v10 = v8 == 0;
    else
      v10 = 1;
    v7 = !v10;
    if (v10)
    {

    }
    else
    {
      v11 = -[TKTonePickerViewController _addMediaIdentifierToList:](self, "_addMediaIdentifierToList:", v4);
      v12 = (void *)MEMORY[0x24BDD15D8];
      -[TKTonePickerController _indexPathForMediaGroup](self->_tonePickerController, "_indexPathForMediaGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForRow:inSection:", v11, objc_msgSend(v13, "section"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = 1;
        goto LABEL_25;
      }
    }
    v14 = -[TKTonePickerController showsDefault](self->_tonePickerController, "showsDefault");
    tonePickerController = self->_tonePickerController;
    if (v14)
    {
      -[TKTonePickerController _indexPathForDefaultGroup](tonePickerController, "_indexPathForDefaultGroup");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[TKTonePickerController showsNone](tonePickerController, "showsNone")
        || -[TKTonePickerController isNoneAtTop](self->_tonePickerController, "isNoneAtTop"))
      {
        v6 = 0;
        goto LABEL_25;
      }
      -[TKTonePickerController _indexPathForNone](self->_tonePickerController, "_indexPathForNone");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v16;
    if (v16)
    {
      -[TKTonePickerController _identifierOfToneAtIndexPath:](self->_tonePickerController, "_identifierOfToneAtIndexPath:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (((v17 == 0) & ~v14) == 0)
      {
        v18 = (void *)v17;
        -[TKTonePickerViewController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", v17);

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_25:
    -[TKTonePickerController _selectedToneIndexPath](self->_tonePickerController, "_selectedToneIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v6);

    if ((v20 & 1) != 0)
      goto LABEL_39;
    -[TKTonePickerController _setSelectedToneIndexPath:](self->_tonePickerController, "_setSelectedToneIndexPath:", v6);
    v32 = 0;
    if (v6)
    {
      -[TKTonePickerController _identifierAtIndexPath:isMediaItem:](self->_tonePickerController, "_identifierAtIndexPath:isMediaItem:", v6, &v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v22 = (id)v4;
        v23 = v21;
        v21 = (void *)v23;
        if (v4 | v23)
        {
          if (!v4 || !v23)
          {

LABEL_37:
            -[TKTonePickerViewController _didSelectMediaItemWithIdentifier:](self, "_didSelectMediaItemWithIdentifier:", v21);
            goto LABEL_38;
          }
          if ((id)v23 != v22)
          {
            v24 = objc_msgSend(v22, "isEqualToNumber:", v23);

            if ((v24 & 1) != 0)
              goto LABEL_38;
            goto LABEL_37;
          }
        }

      }
    }
    else
    {
      v21 = 0;
    }
LABEL_38:

LABEL_39:
    if (v7)
    {
      -[TKTonePickerController _invalidatePickerItemCaches](self->_tonePickerController, "_invalidatePickerItemCaches");
      -[TKTonePickerViewController tableView](self, "tableView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "reloadData");

    }
    goto LABEL_41;
  }
LABEL_42:
  -[TKTonePickerViewController selectedIdentifier:](self, "selectedIdentifier:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[TKTonePickerController indexPathForSelectedTone](self->_tonePickerController, "indexPathForSelectedTone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[TKTonePickerViewController tableView](self, "tableView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "indexPathsForVisibleRows");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "containsObject:", v27);

      if ((v30 & 1) == 0)
      {
        -[TKTonePickerController indexPathForSelectedTone](self->_tonePickerController, "indexPathForSelectedTone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "scrollToRowAtIndexPath:atScrollPosition:animated:", v31, 2, 0);

      }
    }

  }
}

- (void)addMediaItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[NSMutableArray indexOfObject:](self->_mediaItems, "indexOfObject:", v9) == 0x7FFFFFFFFFFFFFFFLL)
          -[TKTonePickerViewController _addMediaIdentifierToList:](self, "_addMediaIdentifierToList:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesSetAppValue(CFSTR("tonePickerMediaItemList"), self->_mediaItems, (CFStringRef)*MEMORY[0x24BDBD580]);
  CFPreferencesAppSynchronize(v10);
  -[TKTonePickerController _invalidatePickerItemCaches](self->_tonePickerController, "_invalidatePickerItemCaches");
  -[TKTonePickerViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)removeMediaItems:(id)a3
{
  const __CFString *v4;
  id v5;

  -[NSMutableArray removeObjectsInArray:](self->_mediaItems, "removeObjectsInArray:", a3);
  v4 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesSetAppValue(CFSTR("tonePickerMediaItemList"), self->_mediaItems, (CFStringRef)*MEMORY[0x24BDBD580]);
  CFPreferencesAppSynchronize(v4);
  -[TKTonePickerController _invalidatePickerItemCaches](self->_tonePickerController, "_invalidatePickerItemCaches");
  -[TKTonePickerViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (unint64_t)_addMediaIdentifierToList:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (-[NSMutableArray count](self->_mediaItems, "count") == 5)
    -[NSMutableArray removeObjectAtIndex:](self->_mediaItems, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_mediaItems, "addObject:", v4);
  v5 = -[NSMutableArray count](self->_mediaItems, "count") - 1;

  return v5;
}

- (id)_mediaItemForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", a3, *MEMORY[0x24BDDBC40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithFilterPredicates:", v4);
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_didSelectMediaItemWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TKTonePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tonePickerViewController:selectedMediaItemWithIdentifier:", self, v5);

}

- (id)_musicPlayer
{
  MPMusicPlayerController *musicPlayer;
  MPMusicPlayerController *v4;
  MPMusicPlayerController *v5;

  musicPlayer = self->_musicPlayer;
  if (!musicPlayer)
  {
    objc_msgSend(MEMORY[0x24BDDCA60], "applicationMusicPlayer");
    v4 = (MPMusicPlayerController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_musicPlayer;
    self->_musicPlayer = v4;

    musicPlayer = self->_musicPlayer;
  }
  return musicPlayer;
}

- (void)_togglePlayMediaItemWithIdentifier:(id)a3
{
  if (self->_playingMediaItemIdentifier)
    -[TKTonePickerController stopPlayingWithFadeOut:](self->_tonePickerController, "stopPlayingWithFadeOut:", 0);
  else
    -[TKTonePickerViewController _playMediaItemWithIdentifier:](self, "_playMediaItemWithIdentifier:", a3);
}

- (void)_playMediaItemWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v5 = a3;
  -[TKTonePickerController stopPlayingWithFadeOut:](self->_tonePickerController, "stopPlayingWithFadeOut:", 0);
  -[TKTonePickerViewController _mediaItemForIdentifier:](self, "_mediaItemForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)&self->_playingMediaItemIdentifier, a3);
    v7 = (void *)MEMORY[0x24BDDC7C8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionWithItems:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TKTonePickerViewController _musicPlayer](self, "_musicPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setQueueWithItemCollection:", v9);
    objc_msgSend(v10, "setRepeatMode:", 1);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__TKTonePickerViewController__playMediaItemWithIdentifier___block_invoke;
    v11[3] = &unk_24D3801B0;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    objc_msgSend(v10, "prepareToPlayWithCompletionHandler:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __59__TKTonePickerViewController__playMediaItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didFinishPreparingToPlayMediaItemWithIdentifier:error:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_didFinishPreparingToPlayMediaItemWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSNumber *playingMediaItemIdentifier;
  NSNumber *v15;
  int v16;
  TKTonePickerViewController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSNumber *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    TLLogPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "tl_nonRedundantDescription");
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = self;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = v15;
      _os_log_error_impl(&dword_2157C4000, v8, OS_LOG_TYPE_ERROR, "%{public}@: -_didFinishPreparingToPlayMediaItemWithIdentifier:(%{public}@): Failed to prepare to play media item with error: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    goto LABEL_17;
  }
  v9 = self->_playingMediaItemIdentifier;
  v10 = (unint64_t)v6;
  v11 = (void *)v10;
  if (!(v10 | v9))
    goto LABEL_11;
  if (v10 && v9)
  {
    if (v9 != v10)
    {
      v12 = objc_msgSend((id)v9, "isEqualToNumber:", v10);

      if (!v12)
        goto LABEL_14;
LABEL_12:
      -[MPMusicPlayerController play](self->_musicPlayer, "play");
      goto LABEL_17;
    }
LABEL_11:

    goto LABEL_12;
  }

LABEL_14:
  TLLogPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    playingMediaItemIdentifier = self->_playingMediaItemIdentifier;
    v16 = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = playingMediaItemIdentifier;
    _os_log_impl(&dword_2157C4000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didFinishPreparingToPlayMediaItemWithIdentifier:(%{public}@): Skipped calling -play on music player because mediaIdentifier doesn't match with _playingMediaItemIdentifier: %{public}@.", (uint8_t *)&v16, 0x20u);
  }

LABEL_17:
}

- (BOOL)_stopMediaItemPlaybackWithFadeOutDuration:(double)a3
{
  NSNumber *playingMediaItemIdentifier;

  playingMediaItemIdentifier = self->_playingMediaItemIdentifier;
  if (!playingMediaItemIdentifier)
    return 0;
  self->_playingMediaItemIdentifier = 0;

  if (-[MPMusicPlayerController playbackState](self->_musicPlayer, "playbackState") != MPMusicPlaybackStatePlaying)
    return 0;
  -[MPMusicPlayerController pauseWithFadeoutDuration:](self->_musicPlayer, "pauseWithFadeoutDuration:", a3);
  -[MPMusicPlayerController stop](self->_musicPlayer, "stop");
  return 1;
}

- (void)mediaPickerDidCancel:(id)a3
{
  id v3;

  -[TKTonePickerViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(a4, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "valueForProperty:", *MEMORY[0x24BDDBC40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[TKTonePickerController _selectedToneIndexPath](self->_tonePickerController, "_selectedToneIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "setAccessoryType:", 0);
    v10 = -[NSMutableArray indexOfObject:](self->_mediaItems, "indexOfObject:", v6);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL
      || (v10 = -[TKTonePickerViewController _addMediaIdentifierToList:](self, "_addMediaIdentifierToList:", v6),
          v11 = (const __CFString *)*MEMORY[0x24BDBD580],
          CFPreferencesSetAppValue(CFSTR("tonePickerMediaItemList"), self->_mediaItems, (CFStringRef)*MEMORY[0x24BDBD580]), CFPreferencesAppSynchronize(v11), v10 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v12 = (void *)MEMORY[0x24BDD15D8];
      -[TKTonePickerController _indexPathForMediaGroup](self->_tonePickerController, "_indexPathForMediaGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForRow:inSection:", v10, objc_msgSend(v13, "section"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[TKTonePickerController _setSelectedToneIndexPath:](self->_tonePickerController, "_setSelectedToneIndexPath:", v14);
    }
    -[TKTonePickerController _invalidatePickerItemCaches](self->_tonePickerController, "_invalidatePickerItemCaches");
    objc_msgSend(v7, "reloadData");
    -[TKTonePickerViewController _didSelectMediaItemWithIdentifier:](self, "_didSelectMediaItemWithIdentifier:", v6);
    -[TKTonePickerViewController _playMediaItemWithIdentifier:](self, "_playMediaItemWithIdentifier:", v6);

  }
  -[TKTonePickerViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)loadViewForTonePickerTableViewController:(id)a3
{
  id v4;
  TKTonePickerTableView *v5;
  void *v6;
  TKTonePickerTableView *v7;

  v4 = a3;
  v5 = [TKTonePickerTableView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[TKTonePickerTableView initWithFrame:style:](v5, "initWithFrame:style:", self->_tonePickerTableViewStyle);

  -[TKTonePickerTableView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setTableView:", v7);
  -[TKTonePickerTableView setEditing:](v7, "setEditing:", objc_msgSend(v4, "isEditing"));
  -[TKTonePickerTableView setLayoutMarginsObserver:](v7, "setLayoutMarginsObserver:", v4);
  -[TKTonePickerTableView setSeparatorObserver:](v7, "setSeparatorObserver:", v4);

  -[TKTonePickerViewController _updateStyleOfTableView:forStyleProvider:](self, "_updateStyleOfTableView:forStyleProvider:", v7, self->_styleProvider);
}

- (id)tableView:(id)a3 cellForPickerRowItem:(id)a4
{
  id v6;
  id v7;
  double Width;
  double v9;
  TKPickerDividerTableViewCell *v10;
  void *v11;
  TKTonePickerStyleProvider *styleProvider;
  void *v13;
  id v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  TKPickerTableViewCell *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSMutableArray *switchControlsBeingObserved;
  NSMutableArray *v31;
  NSMutableArray *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;
  CGRect v66;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v66);
  v9 = *MEMORY[0x24BDF7DD8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("_TKTonePickerDividerCellReuseIdentifier"));
    v10 = (TKPickerDividerTableViewCell *)objc_claimAutoreleasedReturnValue();
    -[TKPickerDividerTableViewCell setFrame:](v10, "setFrame:", 0.0, 0.0, Width, v9);
    if (!v10)
    {
      v10 = -[TKPickerDividerTableViewCell initWithFrame:]([TKPickerDividerTableViewCell alloc], "initWithFrame:", 0.0, 0.0, Width, v9);
      -[TKPickerDividerTableViewCell setContentBackdropOverlayBlendMode:](v10, "setContentBackdropOverlayBlendMode:", objc_msgSend(v6, "_separatorBackdropOverlayBlendMode"));
      objc_msgSend(v6, "separatorColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKPickerDividerTableViewCell setContentBackgroundColor:](v10, "setContentBackgroundColor:", v11);

      -[TKPickerDividerTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
      -[TKPickerDividerTableViewCell setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
      styleProvider = self->_styleProvider;
      if (styleProvider)
      {
        -[TKTonePickerStyleProvider tonePickerCellBackgroundColor](styleProvider, "tonePickerCellBackgroundColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKPickerDividerTableViewCell setBackgroundColor:](v10, "setBackgroundColor:", v13);

      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v7;
      v15 = objc_msgSend(v14, "showsDisclosureIndicator");
      if (v15)
        v16 = CFSTR("_TKTonePickerCellWithDisclosureIndicatorReuseIdentifier");
      else
        v16 = CFSTR("_TKTonePickerCellReuseIdentifier");
      v17 = objc_msgSend(v14, "itemKind");
      if (v17 == 3)
        v16 = CFSTR("_TKTonePickerCellWithSwitchReuseIdentifier");
      v56 = objc_msgSend(v14, "needsActivityIndicator");
      if (v56)
        v16 = CFSTR("_TKTonePickerCellWithActivityIndicatorReuseIdentifier");
      v18 = objc_msgSend(v14, "needsDownloadProgress");
      if (v18)
        v19 = CFSTR("_TKTonePickerCellWithDownloadProgressReuseIdentifier");
      else
        v19 = v16;
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v19);
      v10 = (TKPickerDividerTableViewCell *)objc_claimAutoreleasedReturnValue();
      -[TKPickerDividerTableViewCell setFrame:](v10, "setFrame:", 0.0, 0.0, Width, v9);
      if (!v10)
      {
        v20 = -[TKPickerTableViewCell initWithStyle:reuseIdentifier:]([TKPickerTableViewCell alloc], "initWithStyle:reuseIdentifier:", +[TKUIKitConstants defaultStyleForTableViewCellsWithDetailText](TKUIKitConstants, "defaultStyleForTableViewCellsWithDetailText"), v19);
        v10 = (TKPickerDividerTableViewCell *)v20;
        if (v15)
        {
          -[TKPickerTableViewCell setAccessoryType:](v20, "setAccessoryType:", 1);
          -[TKPickerDividerTableViewCell setEditingAccessoryType:](v10, "setEditingAccessoryType:", 1);
        }
        if (self->_styleProvider)
        {
          -[TKPickerDividerTableViewCell textLabel](v10, "textLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKTonePickerStyleProvider tonePickerCellHighlightedTextColor](self->_styleProvider, "tonePickerCellHighlightedTextColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setHighlightedTextColor:", v22);

          -[TKTonePickerStyleProvider tonePickerCellBackgroundColor](self->_styleProvider, "tonePickerCellBackgroundColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKPickerDividerTableViewCell setBackgroundColor:](v10, "setBackgroundColor:", v23);

          -[TKTonePickerStyleProvider tonePickerCellTextFont](self->_styleProvider, "tonePickerCellTextFont");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
            v24 = objc_claimAutoreleasedReturnValue();
          }
          v54 = (void *)v24;
          v55 = v21;
          objc_msgSend(v21, "setFont:", v24);
          v25 = (void *)-[TKTonePickerStyleProvider newBackgroundViewForSelectedTonePickerCell:](self->_styleProvider, "newBackgroundViewForSelectedTonePickerCell:", 0);
          if (v25)
            -[TKPickerDividerTableViewCell setBackgroundView:](v10, "setBackgroundView:", v25);
          v26 = (void *)-[TKTonePickerStyleProvider newBackgroundViewForSelectedTonePickerCell:](self->_styleProvider, "newBackgroundViewForSelectedTonePickerCell:", 1);
          if (v26)
            -[TKPickerDividerTableViewCell setSelectedBackgroundView:](v10, "setSelectedBackgroundView:", v26);
          if (v15)
          {
            -[TKPickerDividerTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);
            -[TKPickerDividerTableViewCell setEditingAccessoryType:](v10, "setEditingAccessoryType:", 1);
            v27 = -[TKTonePickerStyleProvider newAccessoryDisclosureIndicatorViewForTonePickerCell](self->_styleProvider, "newAccessoryDisclosureIndicatorViewForTonePickerCell");
            if (v27)
              -[TKPickerDividerTableViewCell setAccessoryView:](v10, "setAccessoryView:", v27);
            v28 = (void *)-[TKTonePickerStyleProvider newAccessoryDisclosureIndicatorViewForTonePickerCell](self->_styleProvider, "newAccessoryDisclosureIndicatorViewForTonePickerCell", v27);
            if (v28)
              -[TKPickerDividerTableViewCell setEditingAccessoryView:](v10, "setEditingAccessoryView:", v28);
            -[TKTonePickerViewController _configureTextColorOfLabelInCell:shouldTintText:checked:](self, "_configureTextColorOfLabelInCell:shouldTintText:checked:", v10, 0, 0);

          }
        }
        if (v17 == 3)
        {
          v29 = objc_alloc_init(MEMORY[0x24BDF6E28]);
          objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel__handleSwitchControlValueChanged_, 4096);
          -[TKPickerDividerTableViewCell setAccessoryView:](v10, "setAccessoryView:", v29);
          switchControlsBeingObserved = self->_switchControlsBeingObserved;
          if (!switchControlsBeingObserved)
          {
            v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v32 = self->_switchControlsBeingObserved;
            self->_switchControlsBeingObserved = v31;

            switchControlsBeingObserved = self->_switchControlsBeingObserved;
          }
          -[NSMutableArray addObject:](switchControlsBeingObserved, "addObject:", v29);

        }
        if (v56)
        {
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
          -[TKPickerDividerTableViewCell setAccessoryView:](v10, "setAccessoryView:", v33);

        }
      }
      -[TKPickerDividerTableViewCell textLabel](v10, "textLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v35);

      -[TKPickerDividerTableViewCell detailTextLabel](v10, "detailTextLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailText");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v37);

      -[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:](self, "updateCell:withCheckedStatus:forTonePickerItem:", v10, objc_msgSend(v14, "showsCheckmark"), v14);
      if (v17 == 3)
      {
        -[TKPickerDividerTableViewCell accessoryView](v10, "accessoryView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setOn:", -[TKTonePickerController ignoreMute](self->_tonePickerController, "ignoreMute"));

      }
      v39 = &OBJC_IVAR___TKTonePickerViewController__tableViewCellLayoutManagerForUnindentedRows;
      if (!-[TKTonePickerViewController _shouldShowCheckmarkOnTrailingEdge](self, "_shouldShowCheckmarkOnTrailingEdge")
        && objc_msgSend(v14, "needsRoomForCheckmark"))
      {
        v39 = &OBJC_IVAR___TKTonePickerViewController__tableViewCellLayoutManagerForIndentedRows;
      }
      -[TKPickerDividerTableViewCell setLayoutManager:](v10, "setLayoutManager:", *(Class *)((char *)&self->super.super.super.super.isa + *v39));
      if (v56)
      {
        -[TKTonePickerStyleProvider tonePickerCellTextColor](self->_styleProvider, "tonePickerCellTextColor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqual:", v41);

        if (v42)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = 0;
        }
        -[TKPickerDividerTableViewCell accessoryView](v10, "accessoryView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setColor:", v43);
        objc_msgSend(v51, "startAnimating");

      }
      if (v18)
      {
        objc_msgSend(v14, "downloadProgress");
        -[TKTonePickerViewController _updateCell:withDownloadProgress:animated:](self, "_updateCell:withDownloadProgress:animated:", v10, 0);
      }

    }
    else
    {
      TLLogGeneral();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

      if (v45)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
        v46 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v46, "lastPathComponent");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381443;
          v58 = "-[TKTonePickerViewController tableView:cellForPickerRowItem:]";
          v59 = 2113;
          v60 = v48;
          v61 = 2049;
          v62 = 1246;
          v63 = 2113;
          v64 = v49;
          _os_log_impl(&dword_2157C4000, v47, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
      }

      TLLogGeneral();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.1();

      v10 = 0;
    }
  }

  return v10;
}

- (id)selectedTonePickerItem
{
  return -[TKTonePickerController selectedTonePickerItem](self->_tonePickerController, "selectedTonePickerItem");
}

- (void)tableView:(id)a3 updateCell:(id)a4 withSeparatorForPickerRowItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  char v16;
  double v17;
  char isKindOfClass;
  int v19;
  BOOL v20;
  double v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(v10, "classicToneIndex");
    objc_msgSend(v10, "parentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = objc_msgSend(v9, "row");
    -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", objc_msgSend(v9, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = *MEMORY[0x24BDF7DE0];
  v14 = v11 + 1;
  if (v14 < objc_msgSend(v12, "numberOfChildren")
    && (objc_msgSend(v12, "childItemAtIndex:", v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v16 = objc_opt_isKindOfClass(),
        v15,
        (v16 & 1) != 0))
  {
    objc_msgSend(v8, "_setShouldHaveFullLengthBottomSeparator:", 1);
    v17 = v13;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v17 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      v19 = objc_msgSend(v9, "needsRoomForCheckmark");
      v17 = v13;
      if (v19)
      {
        v20 = -[TKTonePickerViewController _shouldShowCheckmarkOnTrailingEdge](self, "_shouldShowCheckmarkOnTrailingEdge");
        v17 = v13;
        if (!v20)
        {
          -[TKTonePickerViewController _minimumTextIndentationForTableView:withCheckmarkImage:](self, "_minimumTextIndentationForTableView:withCheckmarkImage:", v22, self->_checkmarkImage);
          v17 = v21;
        }
      }
    }
  }
  objc_msgSend(v8, "setSeparatorInset:", v13, v17, v13, v13);

}

- (void)updateCell:(id)a3 withCheckedStatus:(BOOL)a4 forTonePickerItem:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImage *checkmarkImage;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  LODWORD(v10) = objc_msgSend(v9, "showsDisclosureIndicator");
  if (-[TKTonePickerViewController _shouldShowCheckmarkOnTrailingEdge](self, "_shouldShowCheckmarkOnTrailingEdge"))
  {
    if (v10 & v6)
    {
      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
        v13 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v13, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 136381443;
          v29 = "-[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:]";
          v30 = 2113;
          v31 = v15;
          v32 = 2049;
          v33 = 1296;
          v34 = 2113;
          v35 = v16;
          _os_log_impl(&dword_2157C4000, v14, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v28, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
      }

      TLLogGeneral();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:].cold.1((uint64_t)v9, v20, v21, v22, v23, v24, v25, v26);

    }
    if (v6)
      v10 = 3;
    else
      v10 = v10;
    objc_msgSend(v8, "setAccessoryType:", v10);
    objc_msgSend(v8, "setEditingAccessoryType:", v10);
    objc_msgSend(v8, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImage:", 0);

  }
  else
  {
    objc_msgSend(v8, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v6)
      checkmarkImage = self->_checkmarkImage;
    else
      checkmarkImage = 0;
    objc_msgSend(v17, "setImage:", checkmarkImage);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v8, "setAccessoryType:", 0);
      objc_msgSend(v8, "setEditingAccessoryType:", 0);
    }
  }
  -[TKTonePickerViewController _configureTextColorOfLabelInCell:shouldTintText:checked:](self, "_configureTextColorOfLabelInCell:shouldTintText:checked:", v8, objc_msgSend(v9, "shouldTintText"), v6);

}

- (void)updateCell:(id)a3 withDetailText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "detailTextLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)updateDividerContentColorToMatchSeparatorColorInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "separatorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[TKTonePickerController _isDividerAtIndexPath:](self->_tonePickerController, "_isDividerAtIndexPath:", v11))
        {
          objc_msgSend(v4, "cellForRowAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "setContentBackgroundColor:", v5);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 forPickerRowItem:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || -[TKTonePickerController didSelectTonePickerItem:](self->_tonePickerController, "didSelectTonePickerItem:", v7))
  {
    objc_msgSend(v9, "indexPathForSelectedRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, 1);

  }
}

- (void)tonePickerTableViewWillDisappear:(BOOL)a3
{
  -[TKTonePickerController stopPlayingWithFadeOut:](self->_tonePickerController, "stopPlayingWithFadeOut:", 1);
}

- (void)tonePickerTableViewControllerWillBeDeallocated:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isViewLoaded"))
  {
    objc_msgSend(v4, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLayoutMarginsObserver:", 0);
    objc_msgSend(v3, "setSeparatorObserver:", 0);

  }
}

- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TKTonePickerViewController *v8;

  v4 = a3;
  -[TKTonePickerViewController _updateMinimumTextIndentation](self, "_updateMinimumTextIndentation");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__TKTonePickerViewController_layoutMarginsDidChangeInTonePickerTableView___block_invoke;
  v6[3] = &unk_24D37FF00;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "performBlockEnsuringContentOffsetRemainsUnchanged:", v6);

}

void __74__TKTonePickerViewController_layoutMarginsDidChangeInTonePickerTableView___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "indexPathsForVisibleRows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v9, "_pickerRowItemForIndexPath:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tableView:updateCell:withSeparatorForPickerRowItem:", v10, v8, v11);

        objc_msgSend(v8, "setNeedsLayout");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v25;
  TKTonePickerViewController *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    TLLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
      v11 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v11, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 136381443;
        v26 = (TKTonePickerViewController *)"-[TKTonePickerViewController tableView:cellForRowAtIndexPath:]";
        v27 = 2113;
        v28 = v13;
        v29 = 2049;
        v30 = 1398;
        v31 = 2113;
        v32 = v14;
        _os_log_impl(&dword_2157C4000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v25, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
    }

    TLLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TKTonePickerViewController tableView:cellForRowAtIndexPath:].cold.2();

  }
  -[TKTonePickerViewController tableView:cellForPickerRowItem:](self, "tableView:cellForPickerRowItem:", v6, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    TLLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
      v19 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v19, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 136381443;
        v26 = (TKTonePickerViewController *)"-[TKTonePickerViewController tableView:cellForRowAtIndexPath:]";
        v27 = 2113;
        v28 = v21;
        v29 = 2049;
        v30 = 1400;
        v31 = 2113;
        v32 = v22;
        _os_log_impl(&dword_2157C4000, v20, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v25, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
    }

    TLLogGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v7;
      v29 = 2114;
      v30 = (uint64_t)v8;
      _os_log_error_impl(&dword_2157C4000, v23, OS_LOG_TYPE_ERROR, "%{public}@ is about to return a nil cell for row at index path %{public}@ with pickerRowItem = %{public}@.", (uint8_t *)&v25, 0x20u);
    }

  }
  return v16;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[TKTonePickerController numberOfSections](self->_tonePickerController, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfChildren");

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v5;
  int64_t v6;

  -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[TKTonePickerController canDeleteTonePickerItem:](self->_tonePickerController, "canDeleteTonePickerItem:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  if (a4 == 1)
  {
    -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TKTonePickerController deleteTonePickerItem:](self->_tonePickerController, "deleteTonePickerItem:", v6);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerViewController tableView:didSelectRowAtIndexPath:forPickerRowItem:](self, "tableView:didSelectRowAtIndexPath:forPickerRowItem:", v7, v6, v8);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  v7 = 2.0;
  if (!-[TKTonePickerController _isDividerAtIndexPath:](self->_tonePickerController, "_isDividerAtIndexPath:", a4))
  {
    objc_msgSend(v6, "rowHeight");
    v7 = v8;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;

  if (-[TKTonePickerStyleProvider wantsCustomTonePickerHeaderView](self->_styleProvider, "wantsCustomTonePickerHeaderView", a3))
  {
    -[TKTonePickerViewController _customHeaderViewForHeaderInSection:](self, "_customHeaderViewForHeaderInSection:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;

  if ((-[TKTonePickerStyleProvider wantsCustomTonePickerHeaderView](self->_styleProvider, "wantsCustomTonePickerHeaderView", a3) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double Height;
  CGRect v11;

  v6 = a3;
  if (-[TKTonePickerStyleProvider wantsCustomTonePickerHeaderView](self->_styleProvider, "wantsCustomTonePickerHeaderView"))
  {
    -[TKTonePickerViewController tableView:viewForHeaderInSection:](self, "tableView:viewForHeaderInSection:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "sizeToFit");
      objc_msgSend(v8, "frame");
      Height = CGRectGetHeight(v11);
    }
    else if (a4)
    {
      Height = 0.0;
    }
    else
    {
      Height = *MEMORY[0x24BDF7DE0];
    }

  }
  else
  {
    Height = *MEMORY[0x24BDF7DE0];
  }

  return Height;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerViewController tableView:willDisplayCell:forPickerRowItem:](self, "tableView:willDisplayCell:forPickerRowItem:", v9, v8, v10);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  int v5;

  -[TKTonePickerViewController _pickerRowItemForIndexPath:](self, "_pickerRowItemForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "shouldPreventSelection") ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (void)tonePickerControllerDidReloadTones:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_toneSectionHeaderViews, "removeObjectForKey:", CFSTR("TKTonePickerSectionHeaderRegularToneGroup"));
  -[TKTonePickerViewController _reloadData](self, "_reloadData");
  -[TKToneClassicsTableViewController didReloadTones](self->_toneClassicsTableViewController, "didReloadTones");
}

- (void)tonePickerController:(id)a3 requestsPerformingBatchUpdates:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[TKTonePickerViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBatchUpdates:completion:", v8, v7);

}

- (void)tonePickerController:(id)a3 didDeletePickerRowItems:(id)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v21;
  _BYTE v22[15];
  char v23;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          TLLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
            v14 = objc_claimAutoreleasedReturnValue();
            TLLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject lastPathComponent](v14, "lastPathComponent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136381443;
              v30 = "-[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:]";
              v31 = 2113;
              v32 = v16;
              v33 = 2049;
              v34 = 1532;
              v35 = 2113;
              v36 = v17;
              _os_log_impl(&dword_2157C4000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            }
          }
          else
          {
            TLLogGeneral();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:].cold.2(&v23, v24);
          }

          TLLogGeneral();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:].cold.1(&v21, v22);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v11, "row"), objc_msgSend(v11, "section"));
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v8);
  }

  -[TKTonePickerViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteRowsAtIndexPaths:withRowAnimation:", v5, 100);

}

- (void)tonePickerController:(id)a3 didDeleteTonePickerSectionItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "section", (_QWORD)v13));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[TKTonePickerViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteSections:withRowAnimation:", v6, 100);

}

- (void)tonePickerController:(id)a3 didInsertPickerRowItems:(id)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v21;
  _BYTE v22[15];
  char v23;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          TLLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
            v14 = objc_claimAutoreleasedReturnValue();
            TLLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject lastPathComponent](v14, "lastPathComponent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136381443;
              v30 = "-[TKTonePickerViewController tonePickerController:didInsertPickerRowItems:]";
              v31 = 2113;
              v32 = v16;
              v33 = 2049;
              v34 = 1553;
              v35 = 2113;
              v36 = v17;
              _os_log_impl(&dword_2157C4000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            }
          }
          else
          {
            TLLogGeneral();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:].cold.2(&v23, v24);
          }

          TLLogGeneral();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:].cold.1(&v21, v22);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v11, "row"), objc_msgSend(v11, "section"));
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v8);
  }

  -[TKTonePickerViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertRowsAtIndexPaths:withRowAnimation:", v5, 100);

}

- (void)tonePickerController:(id)a3 didInsertTonePickerSectionItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "section", (_QWORD)v13));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[TKTonePickerViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSections:withRowAnimation:", v6, 100);

}

- (void)tonePickerController:(id)a3 didUpdateHeaderTextOfTonePickerSectionItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "section", (_QWORD)v13));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[TKTonePickerViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_reloadSectionHeaderFooters:withRowAnimation:", v6, 100);

}

- (void)tonePickerController:(id)a3 didUpdateCheckedStatus:(BOOL)a4 ofTonePickerItem:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TKToneClassicsTableViewController didUpdateCheckedStatus:ofToneClassicsPickerItem:](self->_toneClassicsTableViewController, "didUpdateCheckedStatus:ofToneClassicsPickerItem:", v5, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "row"), objc_msgSend(v10, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:](self, "updateCell:withCheckedStatus:forTonePickerItem:", v9, v5, v10);
  }

}

- (void)tonePickerController:(id)a3 didUpdateDownloadProgressOfTonePickerItem:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    TLLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
      v8 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v8, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136381443;
        v17 = "-[TKTonePickerViewController tonePickerController:didUpdateDownloadProgressOfTonePickerItem:]";
        v18 = 2113;
        v19 = v10;
        v20 = 2049;
        v21 = 1595;
        v22 = 2113;
        v23 = v11;
        _os_log_impl(&dword_2157C4000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v16, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
    }

    TLLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TKTonePickerViewController tonePickerController:didUpdateDownloadProgressOfTonePickerItem:].cold.1();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "downloadProgress");
    -[TKTonePickerViewController _updateCell:withDownloadProgress:animated:](self, "_updateCell:withDownloadProgress:animated:", v14, 1);

  }
}

- (void)tonePickerController:(id)a3 didUpdateTonePickerItem:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    TLLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m");
      v8 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v8, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v17 = "-[TKTonePickerViewController tonePickerController:didUpdateTonePickerItem:]";
        v18 = 2113;
        v19 = v10;
        v20 = 2049;
        v21 = 1605;
        v22 = 2113;
        v23 = v11;
        _os_log_impl(&dword_2157C4000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[TKTonePickerViewController tableView:cellForPickerRowItem:].cold.2();
    }

    TLLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TKTonePickerViewController tonePickerController:didUpdateDownloadProgressOfTonePickerItem:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
    v12 = objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 100);

  }
}

- (void)tonePickerController:(id)a3 didUpdateDetailText:(id)a4 ofTonePickerItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TKToneClassicsTableViewController didUpdateDetailText:ofToneClassicsPickerItem:](self->_toneClassicsTableViewController, "didUpdateDetailText:ofToneClassicsPickerItem:", v11, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TKTonePickerViewController updateCell:withDetailText:](self, "updateCell:withDetailText:", v10, v11);
  }

}

- (void)tonePickerController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  -[TKTonePickerViewController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", a4);
}

- (void)tonePickerController:(id)a3 selectedMediaItemWithIdentifier:(id)a4
{
  -[TKTonePickerViewController _didSelectMediaItemWithIdentifier:](self, "_didSelectMediaItemWithIdentifier:", a4);
}

- (BOOL)tonePickerControllerShouldShowMedia:(id)a3
{
  return self->_showsMedia
      && -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker", a3);
}

- (void)tonePickerControllerRequestsMediaItemsRefresh:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSMutableArray *mediaItems;
  const __CFString *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_showsMedia
    && -[TKTonePickerViewController _isAllowedToPresentMediaPicker](self, "_isAllowedToPresentMediaPicker"))
  {
    v22 = 0;
    objc_msgSend(v4, "_selectedToneIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "_selectedToneIndexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_identifierAtIndexPath:isMediaItem:", v6, &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_mediaItems;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[TKTonePickerViewController _mediaItemForIdentifier:](self, "_mediaItemForIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    -[NSMutableArray removeObjectsInArray:](self->_mediaItems, "removeObjectsInArray:", v7);
    if (v22 && v17)
      -[TKTonePickerViewController setSelectedMediaIdentifier:](self, "setSelectedMediaIdentifier:", v17);
    mediaItems = self->_mediaItems;
    v16 = (const __CFString *)*MEMORY[0x24BDBD580];
    CFPreferencesSetAppValue(CFSTR("tonePickerMediaItemList"), mediaItems, (CFStringRef)*MEMORY[0x24BDBD580]);
    CFPreferencesAppSynchronize(v16);

  }
}

- (unint64_t)numberOfMediaItemsInTonePickerController:(id)a3
{
  return -[NSMutableArray count](self->_mediaItems, "count", a3);
}

- (id)tonePickerController:(id)a3 identifierOfMediaItemAtIndex:(unint64_t)a4
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mediaItems, "objectAtIndex:", a4);
}

- (id)tonePickerController:(id)a3 titleOfMediaItemAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableArray objectAtIndex:](self->_mediaItems, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerViewController _mediaItemForIdentifier:](self, "_mediaItemForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBCD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)tonePickerController:(id)a3 indexOfMediaItemWithIdentifier:(id)a4
{
  return -[NSMutableArray indexOfObject:](self->_mediaItems, "indexOfObject:", a4);
}

- (void)tonePickerController:(id)a3 didSelectMediaItemAtIndex:(unint64_t)a4 selectionDidChange:(BOOL)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a5;
  -[NSMutableArray objectAtIndex:](self->_mediaItems, "objectAtIndex:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[TKTonePickerViewController _playMediaItemWithIdentifier:](self, "_playMediaItemWithIdentifier:", v7);
  else
    -[TKTonePickerViewController _togglePlayMediaItemWithIdentifier:](self, "_togglePlayMediaItemWithIdentifier:", v7);

}

- (void)tonePickerControllerRequestsPresentingMediaItemPicker:(id)a3
{
  MPMediaPickerController *mediaPickerController;
  MPMediaPickerController *v5;
  MPMediaPickerController *v6;
  void *v7;
  id v8;

  v8 = a3;
  mediaPickerController = self->_mediaPickerController;
  if (!mediaPickerController)
  {
    v5 = (MPMediaPickerController *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7F8]), "initWithMediaTypes:", 2049);
    v6 = self->_mediaPickerController;
    self->_mediaPickerController = v5;

    -[MPMediaPickerController setDelegate:](self->_mediaPickerController, "setDelegate:", self);
    -[MPMediaPickerController setAllowsPickingMultipleItems:](self->_mediaPickerController, "setAllowsPickingMultipleItems:", 0);
    -[MPMediaPickerController setModalPresentationStyle:](self->_mediaPickerController, "setModalPresentationStyle:", 3);
    mediaPickerController = self->_mediaPickerController;
  }
  if ((-[MPMediaPickerController isBeingPresented](mediaPickerController, "isBeingPresented") & 1) == 0)
  {
    -[TKTonePickerViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", self->_mediaPickerController, 1, 0);

  }
}

- (void)tonePickerController:(id)a3 willBeginPlaybackOfToneWithIdentifier:(id)a4
{
  -[TKTonePickerViewController _stopMediaItemPlaybackWithFadeOutDuration:](self, "_stopMediaItemPlaybackWithFadeOutDuration:", a3, a4, 0.0);
}

- (void)tonePickerController:(id)a3 didUpdateIgnoreMute:(BOOL)a4 forTonePickerItem:(id)a5 atIndexPath:(id)a6
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a6;
  if (self->_isHandlingSwitchControlValueChanged)
  {
    -[TKTonePickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "tonePickerViewController:didChangeIgnoreMute:", self, v6);
  }
  else
  {
    -[TKTonePickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "accessoryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setOn:", v6);

    }
  }

}

- (void)tonePickerController:(id)a3 requestsPresentingToneClassicsPickerForItem:(id)a4
{
  id v5;
  TKToneClassicsTableViewController *v6;
  TKToneClassicsTableViewController *toneClassicsTableViewController;
  NSObject *v8;
  TKToneClassicsTableViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  TKTonePickerViewController *v15;
  __int16 v16;
  TKToneClassicsTableViewController *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((unint64_t)(objc_msgSend(v5, "itemKind") - 1) <= 1)
  {
    v6 = -[TKToneClassicsTableViewController initWithClassicTonesHeaderItem:]([TKToneClassicsTableViewController alloc], "initWithClassicTonesHeaderItem:", v5);
    toneClassicsTableViewController = self->_toneClassicsTableViewController;
    self->_toneClassicsTableViewController = v6;

    -[TKToneClassicsTableViewController setTonePickerTableViewControllerHelper:](self->_toneClassicsTableViewController, "setTonePickerTableViewControllerHelper:", self);
    TLLogToneManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_toneClassicsTableViewController;
      v14 = 138543874;
      v15 = self;
      v16 = 2114;
      v17 = v9;
      v18 = 2082;
      v19 = "-[TKTonePickerViewController tonePickerController:requestsPresentingToneClassicsPickerForItem:]";
      _os_log_impl(&dword_2157C4000, v8, OS_LOG_TYPE_DEFAULT, "Assigning %{public}@ as tonePickerTableViewControllerHelper of %{public}@ in %{public}s.", (uint8_t *)&v14, 0x20u);
    }

    -[TKToneClassicsTableViewController tableView](self->_toneClassicsTableViewController, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v12);

    objc_msgSend(v11, "_sectionContentInset");
    objc_msgSend(v10, "_setSectionContentInset:");
    -[TKTonePickerViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setClipUnderlapWhileTransitioning:", 1);
    objc_msgSend(v13, "pushViewController:animated:", self->_toneClassicsTableViewController, 1);

  }
}

- (void)tonePickerControllerRequestsPresentingVibrationPicker:(id)a3
{
  id v4;
  TKVibrationPickerViewController *v5;
  TKVibrationPickerViewController *vibrationPickerViewController;
  TKVibrationPickerViewController *v7;
  void *v8;
  TKVibrationPickerViewController *v9;
  void *v10;
  TKVibrationPickerViewController *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;

  v4 = a3;
  v5 = -[TKVibrationPickerViewController _initWithAlertType:tableViewStyle:]([TKVibrationPickerViewController alloc], "_initWithAlertType:tableViewStyle:", objc_msgSend(v4, "alertType"), self->_tonePickerTableViewStyle);
  vibrationPickerViewController = self->_vibrationPickerViewController;
  self->_vibrationPickerViewController = v5;

  v7 = self->_vibrationPickerViewController;
  objc_msgSend(v4, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationPickerViewController setTopic:](v7, "setTopic:", v8);

  v9 = self->_vibrationPickerViewController;
  objc_msgSend(v4, "selectedVibrationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationPickerViewController setSelectedVibrationIdentifier:](v9, "setSelectedVibrationIdentifier:", v10);

  v11 = self->_vibrationPickerViewController;
  objc_msgSend(v4, "selectedToneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKVibrationPickerViewController setCorrespondingToneIdentifier:](v11, "setCorrespondingToneIdentifier:", v12);
  -[TKVibrationPickerViewController _setAdditionalDelegate:](self->_vibrationPickerViewController, "_setAdditionalDelegate:", self);
  -[TKVibrationPickerViewController _setDismissalDelegate:](self->_vibrationPickerViewController, "_setDismissalDelegate:", self);
  -[TKTonePickerViewController delegate](self, "delegate");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v31, "tonePickerViewController:willPresentVibrationPickerViewController:", self, self->_vibrationPickerViewController);
  -[TKTonePickerViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_sectionContentInset");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[TKVibrationPickerViewController tableView](self->_vibrationPickerViewController, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_sectionContentInset");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if (!TKFloatEqualToFloat(v29, v17)
    || !TKFloatEqualToFloat(v24, v15)
    || !TKFloatEqualToFloat(v28, v21)
    || !TKFloatEqualToFloat(v26, v19))
  {
    objc_msgSend(v22, "_setSectionContentInset:", v15, v17, v19, v21);
  }
  -[TKTonePickerViewController navigationController](self, "navigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pushViewController:animated:", self->_vibrationPickerViewController, 1);

}

- (void)tonePickerController:(id)a3 requestsPresentingAlertWithTitle:(id)a4 message:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a4, a5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF67E8];
  TLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[TKTonePickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  -[TKTonePickerController _setSelectedVibrationIdentifier:explicitlySet:](self->_tonePickerController, "_setSelectedVibrationIdentifier:explicitlySet:", a4, 0);
}

- (void)vibrationPickerViewControllerWasDismissed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TKTonePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tonePickerViewController:didDismissVibrationPickerViewController:", self, v5);
  objc_msgSend(v5, "_setDismissalDelegate:", 0);
  objc_msgSend(v5, "_setAdditionalDelegate:", 0);

}

- (BOOL)showsToneStore
{
  return self->_showsToneStore;
}

- (TKTonePickerViewControllerDelegate)delegate
{
  return (TKTonePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsIgnoreMute
{
  return self->_showsIgnoreMute;
}

- (BOOL)showsMedia
{
  return self->_showsMedia;
}

- (TKTonePickerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switchControlsBeingObserved, 0);
  objc_storeStrong((id *)&self->_vibrationPickerViewController, 0);
  objc_storeStrong((id *)&self->_toneClassicsTableViewController, 0);
  objc_storeStrong((id *)&self->_playingMediaItemIdentifier, 0);
  objc_storeStrong((id *)&self->_musicPlayer, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaPickerController, 0);
  objc_storeStrong((id *)&self->_toneSectionHeaderViews, 0);
  objc_storeStrong((id *)&self->_storeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewCellLayoutManagerForUnindentedRows, 0);
  objc_storeStrong((id *)&self->_tableViewCellLayoutManagerForIndentedRows, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_tonePickerController, 0);
}

- (BOOL)showsStoreButtonInNavigationBar
{
  return 0;
}

- (void)_isAllowedToPresentMediaPicker
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2157C4000, v0, v1, "%{public}@: State for Music application %{public}@ is invalid.");
  OUTLINED_FUNCTION_6();
}

- (void)tableView:cellForPickerRowItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2157C4000, v0, v1, "%{public}@ doesn't support this kind of picker row item: %{public}@.");
  OUTLINED_FUNCTION_6();
}

- (void)tableView:cellForPickerRowItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2157C4000, v0, v1, "*** Assertion failure.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)updateCell:(uint64_t)a3 withCheckedStatus:(uint64_t)a4 forTonePickerItem:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_2157C4000, a2, a3, "Unexpected. Can't have both a disclosure indicator and a checkmark on the trailing edge. Problematic item: %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2157C4000, v0, v1, "%{public}@ unexpectedly found a nil pickerRowItem while generating cell for row at index path %{public}@.");
  OUTLINED_FUNCTION_6();
}

- (void)tonePickerController:(_BYTE *)a1 didDeletePickerRowItems:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2157C4000, v2, (uint64_t)v2, "Unexpected.", v3);
}

- (void)tonePickerController:(_BYTE *)a1 didDeletePickerRowItems:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2157C4000, v2, (uint64_t)v2, "*** Assertion failure.", v3);
}

- (void)tonePickerController:didUpdateDownloadProgressOfTonePickerItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2157C4000, v0, v1, "Unexpected.", v2);
  OUTLINED_FUNCTION_2();
}

@end
