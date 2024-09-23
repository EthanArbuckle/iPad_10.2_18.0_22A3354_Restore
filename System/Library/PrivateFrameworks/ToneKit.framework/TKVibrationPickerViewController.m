@implementation TKVibrationPickerViewController

- (TKVibrationPickerViewController)initWithStyle:(int64_t)a3
{
  return -[TKVibrationPickerViewController initWithAlertType:](self, "initWithAlertType:", 1);
}

- (TKVibrationPickerViewController)initWithAlertType:(int64_t)a3
{
  return (TKVibrationPickerViewController *)-[TKVibrationPickerViewController _initWithAlertType:tableViewStyle:](self, "_initWithAlertType:tableViewStyle:", a3, 1);
}

- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4
{
  TKVibrationPickerViewController *v5;
  TLVibrationManager *v6;
  TLVibrationManager *vibrationManager;
  TKVibratorController *v8;
  TKVibratorController *vibratorController;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *defaultVibrationIdentifier;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TKVibrationPickerViewController;
  v5 = -[TKVibrationPickerViewController initWithStyle:](&v17, sel_initWithStyle_, a4);
  if (v5)
  {
    v6 = (TLVibrationManager *)objc_alloc_init(MEMORY[0x24BEB8CD8]);
    vibrationManager = v5->_vibrationManager;
    v5->_vibrationManager = v6;

    v8 = objc_alloc_init(TKVibratorController);
    vibratorController = v5->_vibratorController;
    v5->_vibratorController = v8;

    v5->_alertType = a3;
    v5->_showsDefault = 0;
    objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showsUserGenerated = objc_msgSend(v10, "hasUserGeneratedVibrationsCapability");

    v5->_showsNone = 1;
    -[TLVibrationManager currentVibrationIdentifierForAlertType:](v5->_vibrationManager, "currentVibrationIdentifierForAlertType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    defaultVibrationIdentifier = v5->_defaultVibrationIdentifier;
    v5->_defaultVibrationIdentifier = (NSString *)v12;

    TLLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerViewController setTitle:](v5, "setTitle:", v14);

    if (v5->_showsUserGenerated)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_TKVibrationPickerViewControllerHandleUserGeneratedVibrationsDidChangeNotification, (CFStringRef)*MEMORY[0x24BEB8DE0], 0, (CFNotificationSuspensionBehavior)1026);
    }
  }
  return v5;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  if (self->_showsUserGenerated)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB8DE0], 0);
  }
  -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController dealloc](&v4, sel_dealloc);
}

- (void)setTopic:(id)a3
{
  NSString *v4;
  NSString *topic;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  topic = self->_topic;
  if (topic != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](topic, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_topic;
      self->_topic = v7;

      if (!self->_defaultVibrationIdentifierWasExplicitlySet)
        -[TKVibrationPickerViewController setDefaultVibrationIdentifier:](self, "setDefaultVibrationIdentifier:", 0);
      -[TKVibrationPickerViewController _updateVisibilityOfSynchronizedGroup](self, "_updateVisibilityOfSynchronizedGroup");
      v4 = v9;
    }
  }

}

- (void)setShowsDefault:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  TKVibrationPickerViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  TKVibrationPickerViewController *v17;
  BOOL v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (self->_showsDefault != a3)
  {
    v12 = self;
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __51__TKVibrationPickerViewController_setShowsDefault___block_invoke;
    v16 = &unk_24D37FE60;
    v17 = self;
    v18 = a3;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __51__TKVibrationPickerViewController_setShowsDefault___block_invoke_2;
    v11 = &unk_24D380248;
    -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
    if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[TKVibrationPickerViewController tableView](self, "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

      }
    }
  }
}

uint64_t __51__TKVibrationPickerViewController_setShowsDefault___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1024) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __51__TKVibrationPickerViewController_setShowsDefault___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionForDefaultGroup");
}

- (void)setDefaultVibrationIdentifier:(id)a3
{
  uint64_t v4;
  NSString *v5;
  TLVibrationManager *vibrationManager;
  int64_t v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *defaultVibrationIdentifier;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = objc_msgSend(v20, "length");
  v5 = (NSString *)v20;
  if (!v4)
  {
    vibrationManager = self->_vibrationManager;
    v7 = -[TKVibrationPickerViewController alertType](self, "alertType");
    -[TKVibrationPickerViewController topic](self, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager currentVibrationIdentifierForAlertType:topic:](vibrationManager, "currentVibrationIdentifierForAlertType:topic:", v7, v8);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v9 = self->_defaultVibrationIdentifier;
  v10 = v9;
  if (v9 != v5 && !-[NSString isEqualToString:](v9, "isEqualToString:", v5))
  {
    v11 = (NSString *)-[NSString copy](v5, "copy");
    defaultVibrationIdentifier = self->_defaultVibrationIdentifier;
    self->_defaultVibrationIdentifier = v11;

    self->_defaultVibrationIdentifierWasExplicitlySet = v4 != 0;
    if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
    {
      v13 = -[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup");
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)MEMORY[0x24BDBCE30];
      -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayWithObjects:", v16, v17, v14, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[TKVibrationPickerViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadRowsAtIndexPaths:withRowAnimation:", v18, 5);

    }
  }

}

- (void)setCorrespondingToneIdentifier:(id)a3
{
  NSString *v5;
  NSString *correspondingToneIdentifier;
  NSString *v7;

  v5 = (NSString *)a3;
  correspondingToneIdentifier = self->_correspondingToneIdentifier;
  v7 = v5;
  if (correspondingToneIdentifier != v5
    && !-[NSString isEqualToString:](correspondingToneIdentifier, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_correspondingToneIdentifier, a3);
  }
  -[TKVibrationPickerViewController _updateVisibilityOfSynchronizedGroup](self, "_updateVisibilityOfSynchronizedGroup");

}

- (void)setShowsUserGenerated:(BOOL)a3
{
  void *v4;
  int v5;
  NSArray *sortedUserGeneratedVibrationIdentifiers;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasUserGeneratedVibrationsCapability");

    if (self->_showsUserGenerated == v5)
      return;
    if ((v5 & 1) != 0)
      goto LABEL_8;
  }
  else if (!self->_showsUserGenerated)
  {
    return;
  }
  if (-[TKVibrationPickerViewController isEditing](self, "isEditing"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Hiding the user generated section of the vibration picker while in editing mode is invalid."));
LABEL_8:
  -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  self->_sortedUserGeneratedVibrationIdentifiers = 0;

  -[TKVibrationPickerViewController canEnterEditingMode](self, "canEnterEditingMode");
}

uint64_t __57__TKVibrationPickerViewController_setShowsUserGenerated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1025) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __57__TKVibrationPickerViewController_setShowsUserGenerated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionForUserGeneratedGroup");
}

- (void)setShowsNone:(BOOL)a3
{
  if (self->_showsNone != a3)
    -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
}

uint64_t __48__TKVibrationPickerViewController_setShowsNone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1026) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __48__TKVibrationPickerViewController_setShowsNone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionForNoneGroup");
}

- (void)setNoneString:(id)a3
{
  NSString *v4;
  NSString *noneString;
  NSString *v6;
  NSString *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;

  v4 = (NSString *)a3;
  noneString = self->_noneString;
  v13 = v4;
  if (noneString != v4 && !-[NSString isEqualToString:](noneString, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v13, "copy");
    v7 = self->_noneString;
    self->_noneString = v6;

  }
  if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = -[TKVibrationPickerViewController _sectionForNoneGroup](self, "_sectionForNoneGroup");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cellForRowAtIndexPath:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (v13)
        {
          objc_msgSend(v11, "setLabelText:");
        }
        else
        {
          -[TLVibrationManager noneVibrationName](self->_vibrationManager, "noneVibrationName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLabelText:", v12);

        }
      }

    }
  }

}

- (void)setShowsNothingSelected:(BOOL)a3
{
  if (self->_showsNothingSelected != a3)
  {
    self->_showsNothingSelected = a3;
    -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
  }
}

- (void)setShowsEditButtonInNavigationBar:(BOOL)a3
{
  if (self->_showsEditButtonInNavigationBar != a3)
  {
    self->_showsEditButtonInNavigationBar = a3;
    -[TKVibrationPickerViewController _updateEditButtonItem](self, "_updateEditButtonItem");
  }
}

- (BOOL)canEnterEditingMode
{
  id v3;

  v3 = -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
  return self->_canEnterEditingMode;
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
  NSString *v4;
  NSString *selectedVibrationIdentifier;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
  if (selectedVibrationIdentifier != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](selectedVibrationIdentifier, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_selectedVibrationIdentifier;
      self->_selectedVibrationIdentifier = v7;

      -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
      v4 = v9;
    }
  }

}

- (void)setStyleProvider:(id)a3
{
  TKVibrationPickerStyleProvider *v5;
  int v6;
  void *v7;
  TKVibrationPickerStyleProvider *v8;

  v5 = (TKVibrationPickerStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    v6 = -[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v6)
    {
      -[TKVibrationPickerViewController tableView](self, "tableView", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController _updateStyleOfTableView:forStyleProvider:](self, "_updateStyleOfTableView:forStyleProvider:", v7, v8);
      objc_msgSend(v7, "reloadData");

      v5 = v8;
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
  if (!v5)
    goto LABEL_14;
  if ((objc_msgSend(v5, "vibrationPickerUsesOpaqueBackground") & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v6, "vibrationPickerCustomBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundView:", 0);
  }
  else
  {
    objc_msgSend(v10, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setBackgroundColor:", v7);

LABEL_7:
  objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v6, "vibrationPickerTableViewSeparatorStyle"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = UIBackdropViewOverlayBlendModeFromTKBackdropViewOverlayBlendMode(objc_msgSend(v6, "vibrationPickerCustomTableSeparatorBackdropOverlayBlendMode"));
    if (v8)
      objc_msgSend(v10, "_setSeparatorBackdropOverlayBlendMode:", v8);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "vibrationPickerCustomTableSeparatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v10, "setSeparatorColor:", v9);

  }
LABEL_14:

}

- (BOOL)_showsOnlyEditableSections
{
  if (self->_swipeToDeleteMode)
    return 0;
  else
    return -[TKVibrationPickerViewController isEditing](self, "isEditing");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[TKVibrationPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationPickerViewController _updateStyleOfTableView:forStyleProvider:](self, "_updateStyleOfTableView:forStyleProvider:", v3, self->_styleProvider);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[TKVibrationPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lineHeight");
    objc_msgSend(v4, "setEstimatedRowHeight:", ceil(v6 + v6));

    objc_msgSend(v4, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  }
  if (-[TKVibrationPickerViewController showsEditButtonInNavigationBar](self, "showsEditButtonInNavigationBar"))
  {
    -[TKVibrationPickerViewController _updateEditButtonItemWithAnimation:](self, "_updateEditButtonItemWithAnimation:", 0);
    if (self->_viewHasAppearedAtLeastOnce)
      goto LABEL_10;
    -[TKVibrationPickerViewController canEnterEditingMode](self, "canEnterEditingMode");
  }
  else if (self->_viewHasAppearedAtLeastOnce)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "setAllowsSelectionDuringEditing:", 1);
  -[TKVibrationPickerViewController _selectedVibrationIndexPath](self, "_selectedVibrationIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 2, 0);

LABEL_10:
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!self->_viewHasAppearedAtLeastOnce)
    self->_viewHasAppearedAtLeastOnce = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *sortedVibrationIdentifiers;
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  NSMutableDictionary *sectionHeaderViews;
  objc_super v8;

  v3 = a3;
  -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
  sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  self->_sortedVibrationIdentifiers = 0;

  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  self->_sortedUserGeneratedVibrationIdentifiers = 0;

  sectionHeaderViews = self->_sectionHeaderViews;
  self->_sectionHeaderViews = 0;

  v8.receiver = self;
  v8.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  TKVibrationPickerViewController *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v4 = self;
  v7.receiver = v4;
  v7.super_class = (Class)TKVibrationPickerViewController;
  -[TKVibrationPickerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  -[TKVibrationPickerViewController presentedViewController](v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TKVibrationPickerViewController _dismissalDelegate](v4, "_dismissalDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "vibrationPickerViewControllerWasDismissed:", v4);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)_cellAccessoriesDescriptorForRowAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");
  if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == v5
    && v6 == -[TKVibrationPickerViewController _numberOfRowsInVibrationPickerSection:](self, "_numberOfRowsInVibrationPickerSection:", v5)- 1)
  {
    v7 = 0;
    v8 = 256;
  }
  else
  {
    if (self->_showsNothingSelected)
    {
      v7 = 0;
    }
    else
    {
      -[TKVibrationPickerViewController _selectedVibrationIndexPath](self, "_selectedVibrationIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isEqual:", v4);

    }
    v8 = 0;
  }

  return ($96EE1C12479E9B303E9C2794B92A11A2)(v8 | v7);
}

- (id)_sanitizedCorrespondingToneIdentifier
{
  NSString *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v3 = self->_correspondingToneIdentifier;
  if (!-[NSString length](v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TKVibrationPickerViewController alertType](self, "alertType");
    -[TKVibrationPickerViewController topic](self, "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentToneIdentifierForAlertType:topic:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v7;
  }
  return v3;
}

- (id)_sanitizedDefaultVibrationIdentifier
{
  TLVibrationManager *vibrationManager;
  NSString *defaultVibrationIdentifier;
  int64_t v5;
  void *v6;
  void *v7;

  vibrationManager = self->_vibrationManager;
  defaultVibrationIdentifier = self->_defaultVibrationIdentifier;
  v5 = -[TKVibrationPickerViewController alertType](self, "alertType");
  -[TKVibrationPickerViewController topic](self, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager _sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:](vibrationManager, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", defaultVibrationIdentifier, v5, v6, 0, self->_correspondingToneIdentifier, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sanitizeVibrationIdentifierForPlayback:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_selectedVibrationIndexPath
{
  return -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", self->_selectedVibrationIdentifier);
}

- (id)_sortedArrayWithVibrationIdentifiers:(id)a3 allowsDuplicateVibrationNames:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[TLVibrationManager nameOfVibrationWithIdentifier:](self->_vibrationManager, "nameOfVibrationWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (v4)
          {
            objc_msgSend(v7, "objectForKey:", v13);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v7, "setObject:forKey:", v14, v13);
            }
            objc_msgSend(v14, "addObject:", v12);

          }
          else
          {
            objc_msgSend(v7, "setObject:forKey:", v12, v13);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v16;
  v18 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v30);
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v4)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v33;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v33 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            }
            while (v25);
          }
        }
        else
        {
          objc_msgSend(v17, "addObject:", v22);
        }

      }
      v19 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v19);
  }

  v28 = (void *)objc_msgSend(v17, "copy");
  return v28;
}

- (id)_sortedVibrationIdentifiers
{
  NSArray *sortedVibrationIdentifiers;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  if (!sortedVibrationIdentifiers)
  {
    -[TLVibrationManager allUserSelectableSystemVibrationIdentifiers](self->_vibrationManager, "allUserSelectableSystemVibrationIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerViewController _sortedArrayWithVibrationIdentifiers:allowsDuplicateVibrationNames:](self, "_sortedArrayWithVibrationIdentifiers:allowsDuplicateVibrationNames:", v4, 0);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sortedVibrationIdentifiers;
    self->_sortedVibrationIdentifiers = v5;

    sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  }
  return sortedVibrationIdentifiers;
}

- (id)_sortedUserGeneratedVibrationIdentifiers
{
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _BOOL4 v7;
  void *v8;

  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  if (!sortedUserGeneratedVibrationIdentifiers)
  {
    -[TLVibrationManager allUserGeneratedVibrationIdentifiers](self->_vibrationManager, "allUserGeneratedVibrationIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerViewController _sortedArrayWithVibrationIdentifiers:allowsDuplicateVibrationNames:](self, "_sortedArrayWithVibrationIdentifiers:allowsDuplicateVibrationNames:", v4, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sortedUserGeneratedVibrationIdentifiers;
    self->_sortedUserGeneratedVibrationIdentifiers = v5;

    if (-[NSArray count](self->_sortedUserGeneratedVibrationIdentifiers, "count"))
      v7 = -[TKVibrationPickerViewController showsUserGenerated](self, "showsUserGenerated");
    else
      v7 = 0;
    if (self->_canEnterEditingMode != v7)
    {
      NSStringFromSelector(sel_canEnterEditingMode);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", v8);
      self->_canEnterEditingMode = v7;
      -[TKVibrationPickerViewController didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      if (-[TKVibrationPickerViewController showsEditButtonInNavigationBar](self, "showsEditButtonInNavigationBar"))
        -[TKVibrationPickerViewController _updateEditButtonItem](self, "_updateEditButtonItem");
      if (!v7 && -[TKVibrationPickerViewController isEditing](self, "isEditing"))
        -[TKVibrationPickerViewController setEditing:animated:](self, "setEditing:animated:", 0, self->_viewHasAppearedAtLeastOnce);

    }
    sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  }
  return sortedUserGeneratedVibrationIdentifiers;
}

- (id)_identifierOfVibrationAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  char v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = objc_msgSend(v4, "section"),
        v7 = objc_msgSend(v5, "row"),
        -[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") == v6)
    && !v7)
  {
    v8 = 0;
    goto LABEL_25;
  }
  if (-[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup") == v6
    && !v7)
  {
    v8 = self->_synchronizedVibrationIdentifier;
    if (self->_showsDefault
      || (-[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "isEqualToString:", v8), v9, (v10 & 1) == 0))
    {
      v11 = v8;
      v8 = v11;
LABEL_10:
      v12 = v11;
LABEL_24:

      v8 = v12;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (-[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup") == v6)
  {
    -[TKVibrationPickerViewController _sortedVibrationIdentifiers](self, "_sortedVibrationIdentifiers");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v7 < -[NSString count](v8, "count"))
    {
      -[NSString objectAtIndex:](v8, "objectAtIndex:", v7);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (self->_showsDefault)
        goto LABEL_24;
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v12);

      if (!v14)
        goto LABEL_24;

    }
    goto LABEL_23;
  }
  if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == v6)
  {
    -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v7 < -[NSString count](v8, "count"))
    {
      -[NSString objectAtIndex:](v8, "objectAtIndex:", v7);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v8 = 0;
  if (-[TKVibrationPickerViewController _sectionForNoneGroup](self, "_sectionForNoneGroup") == v6 && !v7)
  {
    v8 = (NSString *)(id)*MEMORY[0x24BEB8DD8];
    if (!self->_showsDefault)
    {
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v8);

      if (v16)
        goto LABEL_23;
    }
  }
LABEL_25:

  return v8;
}

- (id)_indexPathForVibrationWithIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  TLVibrationManager *vibrationManager;
  int64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  if (!objc_msgSend(v4, "length")
    || (-[TLVibrationManager vibrationWithIdentifierIsValid:](self->_vibrationManager, "vibrationWithIdentifierIsValid:", v4) & 1) == 0)
  {
    v5 = -[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_10:
      v15 = v5;
      v13 = (void *)MEMORY[0x24BDD15D8];
      v14 = 0;
LABEL_19:
      objc_msgSend(v13, "indexPathForRow:inSection:", v14, v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  v7 = v4;
  vibrationManager = self->_vibrationManager;
  v9 = -[TKVibrationPickerViewController alertType](self, "alertType");
  -[TKVibrationPickerViewController topic](self, "topic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager _sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:](vibrationManager, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v7, v9, v10, 0, self->_correspondingToneIdentifier, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v11 = -[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup");
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    if (objc_msgSend(v4, "isEqualToString:", self->_synchronizedVibrationIdentifier))
    {
      v13 = (void *)MEMORY[0x24BDD15D8];
      v14 = 0;
LABEL_18:
      v15 = v12;
      goto LABEL_19;
    }
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB8DD8]))
  {
    v5 = -[TKVibrationPickerViewController _sectionForNoneGroup](self, "_sectionForNoneGroup");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
  }
  else
  {
    v16 = -[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup");
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v16;
      -[TKVibrationPickerViewController _sortedVibrationIdentifiers](self, "_sortedVibrationIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "indexOfObject:", v4);

      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (void *)MEMORY[0x24BDD15D8];
        v14 = v18;
        goto LABEL_18;
      }
    }
    v19 = -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup");
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v19;
      -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "indexOfObject:", v4);

      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (void *)MEMORY[0x24BDD15D8];
        v14 = v21;
        goto LABEL_18;
      }
    }
  }
  v22 = 0;
LABEL_20:

  return v22;
}

- (void)_processCurrentVibrationSelection
{
  void *v3;
  void *v4;
  NSString *v5;

  v5 = self->_selectedVibrationIdentifier;
  -[TKVibrationPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "vibrationPickerViewController:selectedVibrationWithIdentifier:", self, v5);
  -[TKVibrationPickerViewController _additionalDelegate](self, "_additionalDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "vibrationPickerViewController:selectedVibrationWithIdentifier:", self, v5);

}

- (id)_navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
    goto LABEL_6;
  -[TKVibrationPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  -[TKVibrationPickerViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {

LABEL_6:
    -[TKVibrationPickerViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  objc_msgSend(v5, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  return v7;
}

- (void)_updateEditButtonItem
{
  _BOOL8 viewHasAppearedAtLeastOnce;

  if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
    viewHasAppearedAtLeastOnce = self->_viewHasAppearedAtLeastOnce;
  else
    viewHasAppearedAtLeastOnce = 0;
  -[TKVibrationPickerViewController _updateEditButtonItemWithAnimation:](self, "_updateEditButtonItemWithAnimation:", viewHasAppearedAtLeastOnce);
}

- (void)_updateEditButtonItemWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[TKVibrationPickerViewController _navigationItem](self, "_navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    if (-[TKVibrationPickerViewController canEnterEditingMode](self, "canEnterEditingMode")
      && -[TKVibrationPickerViewController showsEditButtonInNavigationBar](self, "showsEditButtonInNavigationBar")
      && -[TKVibrationPickerViewController showsUserGenerated](self, "showsUserGenerated"))
    {
      -[TKVibrationPickerViewController editButtonItem](self, "editButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v7, "setRightBarButtonItem:animated:", v6, v3);

    v5 = v7;
  }

}

- (void)_updateSelectionStyleForCell:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    if (-[TKVibrationPickerViewController isEditing](self, "isEditing"))
    {
      if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[TKVibrationPickerViewController tableView](self, "tableView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v11 = (v6 || (objc_msgSend(v7, "indexPathForCell:", v12), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
           && (v9 = objc_msgSend(v6, "section"),
               v10 = objc_msgSend(v6, "row"),
               -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == v9)
           && v10 == -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v8, v9)- 1;

      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 1;
    }
    objc_msgSend(v12, "setSelectionStyle:", v11);
  }

}

- (id)_adjustedNameForVibrationWithDesiredName:(id)a3 vibrationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  TKVibrationPickerViewController *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v35;
  id v36;
  _QWORD *__base;
  size_t __nel;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    TLLocalizedString();
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    __base = malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
    if (__base)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invertedSet");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ "), v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v42, "length");
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v15)
      {
        v16 = v15;
        v35 = v11;
        v36 = v6;
        v17 = 0;
        __nel = 0;
        v39 = v14;
        v18 = *(_QWORD *)v44;
        v19 = 0x254DE1000uLL;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v14);
            v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            if (!objc_msgSend(v7, "length") || (objc_msgSend(v21, "isEqualToString:", v7) & 1) == 0)
            {
              objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v19 + 3204)), "nameOfVibrationWithIdentifier:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22;
              if (v22)
              {
                if ((objc_msgSend(v22, "isEqualToString:", v9) & 1) != 0)
                {
                  v17 = 1;
                }
                else if (objc_msgSend(v23, "hasPrefix:", v42))
                {
                  v24 = self;
                  v25 = v19;
                  v26 = v9;
                  v27 = v17;
                  objc_msgSend(v23, "stringByReplacingCharactersInRange:withString:", 0, v40, &stru_24D3804C8);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v28, "rangeOfCharacterFromSet:", v41) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v29 = objc_msgSend(v28, "integerValue");
                    if (v29 >= 2)
                      __base[__nel++] = v29;
                  }

                  v17 = v27;
                  v9 = v26;
                  v19 = v25;
                  self = v24;
                  v14 = v39;
                }
              }

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v16);

        v6 = v36;
        if ((v17 & 1) == 0)
        {
          v11 = v35;
LABEL_34:
          free(__base);

          goto LABEL_35;
        }
        if (__nel)
        {
          qsort_b(__base, __nel, 8uLL, &__block_literal_global_1);
          v30 = 0;
          v31 = __nel + 2;
          v11 = v35;
          v32 = 0x24BDD1000uLL;
          while (v30 + 2 == __base[v30])
          {
            if (__nel == ++v30)
              goto LABEL_32;
          }
          v31 = v30 + 2;
        }
        else
        {
          v31 = 2;
          v11 = v35;
          v32 = 0x24BDD1000;
        }
LABEL_32:
        objc_msgSend(*(id *)(v32 + 1992), "localizedStringWithFormat:", CFSTR(" %ld"), v31);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", v14);
        v33 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v33;
      }

      goto LABEL_34;
    }
  }
LABEL_35:

  return v9;
}

uint64_t __96__TKVibrationPickerViewController__adjustedNameForVibrationWithDesiredName_vibrationIdentifier___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;

  if (*a2 < *a3)
    v3 = -1;
  else
    v3 = 1;
  if (*a2 == *a3)
    return 0;
  else
    return v3;
}

- (void)_handleUserGeneratedVibrationsDidChangeNotification
{
  int64_t v3;
  int64_t v4;
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  void *v6;
  void *v7;

  if (self->_skipNextUserGeneratedVibrationsDidChangeNotification)
  {
    self->_skipNextUserGeneratedVibrationsDidChangeNotification = 0;
  }
  else
  {
    v3 = -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup");
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = v3;
      sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
      self->_sortedUserGeneratedVibrationIdentifiers = 0;

      if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[TKVibrationPickerViewController tableView](self, "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, 100);

        -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
      }
    }
  }
}

- (void)_updateSectionVisibilityFlagToValue:(BOOL)a3 usingBlock:(id)a4 sectionIndexGetter:(id)a5
{
  uint64_t (**v8)(_QWORD);
  uint64_t (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  void (**v12)(void);
  _QWORD v13[7];
  BOOL v14;

  v12 = (void (**)(void))a4;
  v8 = (uint64_t (**)(_QWORD))a5;
  v9 = v8;
  if (a3)
  {
    v12[2]();
    v10 = v9[2](v9);
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = v8[2](v8);
    v12[2]();
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __101__TKVibrationPickerViewController__updateSectionVisibilityFlagToValue_usingBlock_sectionIndexGetter___block_invoke;
    v13[3] = &unk_24D3802B0;
    v14 = a3;
    v13[4] = self;
    v13[5] = v10;
    v13[6] = v11;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v13);
    -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
  }

}

void __101__TKVibrationPickerViewController__updateSectionVisibilityFlagToValue_usingBlock_sectionIndexGetter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", *(_QWORD *)(a1 + 40));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertSections:withRowAnimation:", v2, 5);
LABEL_7:

    }
  }
  else if (*(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteSections:withRowAnimation:", v2, 5);
    goto LABEL_7;
  }
}

- (void)_updateCheckedStateOfAllVisibleCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  $96EE1C12479E9B303E9C2794B92A11A2 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[TKVibrationPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[TKVibrationPickerViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleRows");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v3, "cellForRowAtIndexPath:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = ($96EE1C12479E9B303E9C2794B92A11A2)-[TKVibrationPickerViewController _cellAccessoriesDescriptorForRowAtIndexPath:](self, "_cellAccessoriesDescriptorForRowAtIndexPath:", v9);
          if ((*(_WORD *)&v11 & 0x100) == 0)
            objc_msgSend(v10, "setChecked:", v11.var0);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateVisibilityOfSynchronizedGroup
{
  TLVibrationManager *vibrationManager;
  int64_t v4;
  void *v5;
  TLVibrationManager *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  BOOL v14;

  vibrationManager = self->_vibrationManager;
  v4 = -[TKVibrationPickerViewController alertType](self, "alertType");
  -[TKVibrationPickerViewController topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(vibrationManager) = -[TLVibrationManager _areSynchronizedVibrationsAllowedForAlertType:topic:](vibrationManager, "_areSynchronizedVibrationsAllowedForAlertType:topic:", v4, v5);

  if ((_DWORD)vibrationManager)
  {
    v6 = self->_vibrationManager;
    -[TKVibrationPickerViewController _sanitizedCorrespondingToneIdentifier](self, "_sanitizedCorrespondingToneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager _synchronizedVibrationIdentifierForToneIdentifier:targetDevice:](v6, "_synchronizedVibrationIdentifierForToneIdentifier:targetDevice:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  if (self->_showsSynchronized != v9)
  {
    v10 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke;
    v12[3] = &unk_24D3802D8;
    v12[4] = self;
    v14 = v9;
    v13 = v8;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke_2;
    v11[3] = &unk_24D380248;
    v11[4] = self;
    -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:", v9, v12, v11);

  }
}

void __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1046) = *(_BYTE *)(a1 + 48);
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1048);
  *(_QWORD *)(v3 + 1048) = v2;

}

uint64_t __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionForSynchronizedGroup");
}

- (id)_localizationIdentifierForHeaderInSection:(int64_t)a3
{
  if (-[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") == a3)
    return CFSTR("VIBRATION_PICKER_GROUP_TITLE_DEFAULT");
  if (-[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup") == a3)
    return 0;
  if (-[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup") == a3)
    return CFSTR("VIBRATION_PICKER_GROUP_TITLE_STANDARD");
  if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == a3)
    return CFSTR("VIBRATION_PICKER_GROUP_TITLE_USER_GENERATED");
  return 0;
}

- (id)_customHeaderViewForHeaderInSection:(int64_t)a3
{
  void *v4;
  TKLabelContainerView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *sectionHeaderViews;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;

  -[TKVibrationPickerViewController _localizationIdentifierForHeaderInSection:](self, "_localizationIdentifierForHeaderInSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_10;
  -[NSMutableDictionary objectForKey:](self->_sectionHeaderViews, "objectForKey:", v4);
  v5 = (TKLabelContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_11;
  if (!-[TKVibrationPickerStyleProvider wantsCustomVibrationPickerHeaderView](self->_styleProvider, "wantsCustomVibrationPickerHeaderView"))
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  TLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(TKLabelContainerView);
  v7 = v6;
  v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v7;
    if (-[TKVibrationPickerStyleProvider vibrationPickerHeaderTextShouldBeUppercase](self->_styleProvider, "vibrationPickerHeaderTextShouldBeUppercase"))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uppercaseStringWithLocale:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[TKLabelContainerView setLabelText:](v5, "setLabelText:", v8);
  -[TKVibrationPickerStyleProvider vibrationPickerHeaderTextFont](self->_styleProvider, "vibrationPickerHeaderTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKLabelContainerView setLabelFont:](v5, "setLabelFont:", v10);

  -[TKVibrationPickerStyleProvider vibrationPickerHeaderTextColor](self->_styleProvider, "vibrationPickerHeaderTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKLabelContainerView setLabelTextColor:](v5, "setLabelTextColor:", v11);

  -[TKVibrationPickerStyleProvider vibrationPickerHeaderTextShadowColor](self->_styleProvider, "vibrationPickerHeaderTextShadowColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKLabelContainerView setLabelShadowColor:](v5, "setLabelShadowColor:", v12);

  -[TKVibrationPickerStyleProvider vibrationPickerHeaderTextShadowOffset](self->_styleProvider, "vibrationPickerHeaderTextShadowOffset");
  -[TKLabelContainerView setLabelShadowOffset:](v5, "setLabelShadowOffset:");
  -[TKVibrationPickerStyleProvider vibrationPickerHeaderTextPaddingInsets](self->_styleProvider, "vibrationPickerHeaderTextPaddingInsets");
  -[TKLabelContainerView setLabelPaddingInsets:](v5, "setLabelPaddingInsets:");
  sectionHeaderViews = self->_sectionHeaderViews;
  if (!sectionHeaderViews)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = self->_sectionHeaderViews;
    self->_sectionHeaderViews = v14;

    sectionHeaderViews = self->_sectionHeaderViews;
  }
  -[NSMutableDictionary setObject:forKey:](sectionHeaderViews, "setObject:forKey:", v5, v4);

LABEL_11:
  return v5;
}

- (int64_t)_sectionForDefaultGroup
{
  int64_t v2;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_showsDefault
    && !-[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections"))
  {
    return 0;
  }
  return v2;
}

- (int64_t)_sectionForSynchronizedGroup
{
  if (!self->_showsSynchronized
    || -[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections"))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_showsDefault)
    return -[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") + 1;
  return 0;
}

- (int64_t)_sectionForSystemGroup
{
  int64_t result;

  if (-[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!self->_showsSynchronized
    || (result = -[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup")
               + 1,
        result == 0x7FFFFFFFFFFFFFFFLL))
  {
    if (self->_showsDefault)
      return -[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") + 1;
    else
      return 0;
  }
  return result;
}

- (int64_t)_sectionForUserGeneratedGroup
{
  if (!self->_showsUserGenerated)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (-[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections"))
    return 0;
  return -[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup") + 1;
}

- (int64_t)_sectionForNoneGroup
{
  int64_t v4;

  if (!self->_showsNone
    || -[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections"))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_showsUserGenerated)
    v4 = -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup");
  else
    v4 = -[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup");
  return v4 + 1;
}

- (int64_t)_numberOfRowsInVibrationPickerSection:(int64_t)a3
{
  int64_t v5;
  void *v7;
  int64_t v8;
  void *v9;

  if (-[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") == a3
    || -[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup") == a3)
  {
    return 1;
  }
  if (-[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup") != a3)
  {
    if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") != a3)
      return -[TKVibrationPickerViewController _sectionForNoneGroup](self, "_sectionForNoneGroup") == a3;
    -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "count") + 1;

    return v5;
  }
  -[TKVibrationPickerViewController _sortedVibrationIdentifiers](self, "_sortedVibrationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  $96EE1C12479E9B303E9C2794B92A11A2 v8;
  __CFString *v9;
  __CFString *v10;
  TKVibrationPickerTableViewCell *v11;
  TKVibrationPickerStyleProvider *styleProvider;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  TLVibrationManager *vibrationManager;
  NSString *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  int v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;

  v6 = a3;
  v7 = a4;
  v8 = ($96EE1C12479E9B303E9C2794B92A11A2)-[TKVibrationPickerViewController _cellAccessoriesDescriptorForRowAtIndexPath:](self, "_cellAccessoriesDescriptorForRowAtIndexPath:", v7);
  v9 = CFSTR("_TLVibrationPickerViewTableCellWithDisclosureIndicatorIdentifier");
  if ((*(_WORD *)&v8 & 0x100) == 0)
    v9 = CFSTR("_TLVibrationPickerViewTableCellDefaultIdentifier");
  v10 = v9;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10);
  v11 = (TKVibrationPickerTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[TKVibrationPickerTableViewCell initWithReuseIdentifier:]([TKVibrationPickerTableViewCell alloc], "initWithReuseIdentifier:", v10);
    -[TKVibrationPickerTableViewCell setDelegate:](v11, "setDelegate:", self);
    if ((*(_WORD *)&v8 & 0x100) != 0)
    {
      -[TKVibrationPickerTableViewCell setAccessoryType:](v11, "setAccessoryType:", 1);
      -[TKVibrationPickerTableViewCell setEditingAccessoryType:](v11, "setEditingAccessoryType:", 1);
    }
    styleProvider = self->_styleProvider;
    if (styleProvider)
    {
      -[TKVibrationPickerStyleProvider vibrationPickerCellTextFont](styleProvider, "vibrationPickerCellTextFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerTableViewCell setRegularTextFont:](v11, "setRegularTextFont:", v13);

      -[TKVibrationPickerStyleProvider vibrationPickerCellTextColor](self->_styleProvider, "vibrationPickerCellTextColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerTableViewCell setRegularTextColor:](v11, "setRegularTextColor:", v14);

      -[TKVibrationPickerStyleProvider vibrationPickerCellHighlightedTextColor](self->_styleProvider, "vibrationPickerCellHighlightedTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerTableViewCell setHighlightedTextColor:](v11, "setHighlightedTextColor:", v15);

      -[TKVibrationPickerStyleProvider vibrationPickerCellBackgroundColor](self->_styleProvider, "vibrationPickerCellBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerTableViewCell setBackgroundColor:](v11, "setBackgroundColor:", v16);

      v17 = (void *)-[TKVibrationPickerStyleProvider newBackgroundViewForSelectedVibrationPickerCell:](self->_styleProvider, "newBackgroundViewForSelectedVibrationPickerCell:", 0);
      if (v17)
        -[TKVibrationPickerTableViewCell setBackgroundView:](v11, "setBackgroundView:", v17);
      v18 = (void *)-[TKVibrationPickerStyleProvider newBackgroundViewForSelectedVibrationPickerCell:](self->_styleProvider, "newBackgroundViewForSelectedVibrationPickerCell:", 1);
      if (v18)
        -[TKVibrationPickerTableViewCell setSelectedBackgroundView:](v11, "setSelectedBackgroundView:", v18);
      if ((*(_WORD *)&v8 & 0x100) != 0)
      {
        -[TKVibrationPickerTableViewCell setAccessoryType:](v11, "setAccessoryType:", 1);
        -[TKVibrationPickerTableViewCell setEditingAccessoryType:](v11, "setEditingAccessoryType:", 1);
        v19 = (void *)-[TKVibrationPickerStyleProvider newAccessoryDisclosureIndicatorViewForVibrationPickerCell](self->_styleProvider, "newAccessoryDisclosureIndicatorViewForVibrationPickerCell");
        if (v19)
          -[TKVibrationPickerTableViewCell setAccessoryView:](v11, "setAccessoryView:", v19);
        v20 = (void *)-[TKVibrationPickerStyleProvider newAccessoryDisclosureIndicatorViewForVibrationPickerCell](self->_styleProvider, "newAccessoryDisclosureIndicatorViewForVibrationPickerCell");
        if (v20)
          -[TKVibrationPickerTableViewCell setEditingAccessoryView:](v11, "setEditingAccessoryView:", v20);

      }
    }
  }
  v21 = objc_msgSend(v7, "section");
  v22 = objc_msgSend(v7, "row");
  if (-[TKVibrationPickerViewController _sectionForDefaultGroup](self, "_sectionForDefaultGroup") == v21)
  {
    if (!v22)
    {
      vibrationManager = self->_vibrationManager;
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[TLVibrationManager nameOfVibrationWithIdentifier:](vibrationManager, "nameOfVibrationWithIdentifier:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

LABEL_36:
      v26 = 0;
      goto LABEL_39;
    }
LABEL_23:
    v26 = 0;
    v27 = 0;
    v25 = 0;
    goto LABEL_40;
  }
  if (-[TKVibrationPickerViewController _sectionForSynchronizedGroup](self, "_sectionForSynchronizedGroup") == v21)
  {
    if (v22)
      goto LABEL_23;
    v24 = self->_synchronizedVibrationIdentifier;
    -[TLVibrationManager nameOfVibrationWithIdentifier:](self->_vibrationManager, "nameOfVibrationWithIdentifier:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_showsDefault)
      goto LABEL_35;
    -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", v24);

    v26 = 0;
    if ((v39 & 1) == 0)
      goto LABEL_39;
    goto LABEL_51;
  }
  if (-[TKVibrationPickerViewController _sectionForSystemGroup](self, "_sectionForSystemGroup") == v21)
  {
    -[TKVibrationPickerViewController _sortedVibrationIdentifiers](self, "_sortedVibrationIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 >= objc_msgSend(v28, "count"))
    {
      v25 = 0;
      v26 = 0;
    }
    else
    {
      objc_msgSend(v28, "objectAtIndex:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLVibrationManager nameOfVibrationWithIdentifier:](self->_vibrationManager, "nameOfVibrationWithIdentifier:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_showsDefault)
      {
        -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v29, "isEqualToString:", v26);

        if ((v44 & 1) == 0)
        {
LABEL_39:
          v27 = 0;
          goto LABEL_40;
        }
LABEL_51:
        v40 = (void *)MEMORY[0x24BDD17C8];
        TLLocalizedString();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ (%@)"), v25, v41);
        v42 = objc_claimAutoreleasedReturnValue();

        v27 = 0;
        v25 = (void *)v42;
        goto LABEL_40;
      }
    }

    goto LABEL_39;
  }
  if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == v21)
  {
    v30 = -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, v21)- 1;
    if (v22 < v30)
    {
      -[TKVibrationPickerViewController _sortedUserGeneratedVibrationIdentifiers](self, "_sortedUserGeneratedVibrationIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      v27 = v22 < v32;
      if (v22 < v32)
      {
        objc_msgSend(v31, "objectAtIndex:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLVibrationManager nameOfVibrationWithIdentifier:](self->_vibrationManager, "nameOfVibrationWithIdentifier:", v26);
        v33 = objc_claimAutoreleasedReturnValue();
        v43 = v31;
        v25 = (void *)v33;
      }
      else
      {
        v43 = v31;
        v25 = 0;
        v26 = 0;
      }

      goto LABEL_40;
    }
    if (v22 == v30)
    {
      TLLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    goto LABEL_23;
  }
  v27 = 0;
  v26 = 0;
  if (-[TKVibrationPickerViewController _sectionForNoneGroup](self, "_sectionForNoneGroup") == v21)
  {
    v25 = 0;
    if (v22)
      goto LABEL_40;
    -[TKVibrationPickerViewController noneString](self, "noneString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      -[TLVibrationManager noneVibrationName](self->_vibrationManager, "noneVibrationName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (self->_showsDefault)
      goto LABEL_36;
    -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BEB8DD8]);

    v26 = 0;
    if (!v37)
      goto LABEL_39;
    goto LABEL_51;
  }
  v25 = 0;
LABEL_40:
  -[TKVibrationPickerTableViewCell setEditable:](v11, "setEditable:", v27);
  -[TKVibrationPickerTableViewCell setLabelText:](v11, "setLabelText:", v25);
  TLLocalizedString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationPickerTableViewCell setPlaceholderText:](v11, "setPlaceholderText:", v34);

  if ((*(_WORD *)&v8 & 0x100) == 0)
    -[TKVibrationPickerTableViewCell setChecked:](v11, "setChecked:", v8.var0);
  -[TKVibrationPickerViewController _updateSelectionStyleForCell:indexPath:](self, "_updateSelectionStyleForCell:indexPath:", v11, v7);

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = -[TKVibrationPickerViewController _showsOnlyEditableSections](self, "_showsOnlyEditableSections", a3);
  LODWORD(v5) = !v4;
  v6 = 2;
  if (v4)
    v6 = 0;
  if (self->_showsDefault)
    v7 = v6;
  else
    v7 = !v4;
  if (v4)
    v8 = 0;
  else
    v8 = v7 + 1;
  if (self->_showsSynchronized)
    v7 = v8;
  v9 = v7 + self->_showsUserGenerated;
  if (self->_showsNone)
    v5 = v5;
  else
    v5 = 0;
  return v9 + v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[TKVibrationPickerViewController _numberOfRowsInVibrationPickerSection:](self, "_numberOfRowsInVibrationPickerSection:", a4);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  TLVibrationManager *vibrationManager;
  char v13;
  id v14;
  void *v15;
  int v16;
  NSString *selectedVibrationIdentifier;
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  void *v19;
  NSIndexPath *indexPathOfCellBeingDeleted;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    -[TKVibrationPickerViewController _identifierOfVibrationAtIndexPath:](self, "_identifierOfVibrationAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      -[TKVibrationPickerViewController _selectedVibrationIndexPath](self, "_selectedVibrationIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
      vibrationManager = self->_vibrationManager;
      v21 = 0;
      v13 = -[TLVibrationManager deleteUserGeneratedVibrationPatternWithIdentifier:error:](vibrationManager, "deleteUserGeneratedVibrationPatternWithIdentifier:error:", v10, &v21);
      v14 = v21;
      v15 = v14;
      if ((v13 & 1) == 0 && v14)
        -[TKVibrationPickerViewController _handleError:](self, "_handleError:", v14);
      v16 = objc_msgSend(v11, "isEqual:", v9);
      if (v16)
      {
        selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
        self->_selectedVibrationIdentifier = 0;

      }
      sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
      self->_sortedUserGeneratedVibrationIdentifiers = 0;

      objc_storeStrong((id *)&self->_indexPathOfCellBeingDeleted, a5);
      objc_msgSend(v8, "beginUpdates");
      -[TKVibrationPickerViewController canEnterEditingMode](self, "canEnterEditingMode");
      v22[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 100);

      objc_msgSend(v8, "endUpdates");
      -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
      indexPathOfCellBeingDeleted = self->_indexPathOfCellBeingDeleted;
      self->_indexPathOfCellBeingDeleted = 0;

      if (v16)
        -[TKVibrationPickerViewController _processCurrentVibrationSelection](self, "_processCurrentVibrationSelection");

    }
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;

  if (-[TKVibrationPickerStyleProvider wantsCustomVibrationPickerHeaderView](self->_styleProvider, "wantsCustomVibrationPickerHeaderView", a3))
  {
    -[TKVibrationPickerViewController _customHeaderViewForHeaderInSection:](self, "_customHeaderViewForHeaderInSection:", a4);
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

  if ((-[TKVibrationPickerStyleProvider wantsCustomVibrationPickerHeaderView](self->_styleProvider, "wantsCustomVibrationPickerHeaderView", a3) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[TKVibrationPickerViewController _localizationIdentifierForHeaderInSection:](self, "_localizationIdentifierForHeaderInSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TLLocalizedString();
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
  if (-[TKVibrationPickerStyleProvider wantsCustomVibrationPickerHeaderView](self->_styleProvider, "wantsCustomVibrationPickerHeaderView"))
  {
    -[TKVibrationPickerViewController tableView:viewForHeaderInSection:](self, "tableView:viewForHeaderInSection:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "sizeToFit");
      objc_msgSend(v8, "frame");
      Height = CGRectGetHeight(v11);
    }
    else
    {
      Height = 0.0;
    }

  }
  else
  {
    Height = *MEMORY[0x24BDF7DE0];
  }

  return Height;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (-[TKVibrationPickerViewController isEditing](self, "isEditing"))
  {
    v9 = objc_msgSend(v7, "section");
    v10 = objc_msgSend(v7, "row");
    if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") != v9
      || (v11 = -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, v9), v8 = v7, v10 != v11 - 1))
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  TKVibrationRecorderViewController *v16;
  TKVibrationRecorderViewController *v17;
  TKVibrationRecorderViewController *v18;
  TKVibrationRecorderViewController *v19;
  TKVibrationRecorderViewController *v20;
  TKVibrationPickerViewController *v21;
  TKVibrationRecorderViewController *v22;
  NSString *v23;
  NSString *selectedVibrationIdentifier;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  v9 = objc_msgSend(v7, "row");
  v10 = -[TKVibrationPickerViewController isEditing](self, "isEditing");
  if (-[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup") == v8
    && v9 == -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, v8)- 1)
  {
    if (v10)
    {
      objc_msgSend(v6, "visibleCells");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15++), "makeTextFieldResignFirstResponderIfNeeded");
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

    }
    -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
    v16 = -[TKVibrationRecorderViewController initWithVibratorController:]([TKVibrationRecorderViewController alloc], "initWithVibratorController:", self->_vibratorController);
    -[TKVibrationRecorderViewController setVibrationRecorderViewControllerDelegate:](v16, "setVibrationRecorderViewControllerDelegate:", self);
    -[TKVibrationRecorderViewController setDelegate:](v16, "setDelegate:", self);
    -[TKVibrationRecorderViewController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 0);
    -[TKVibrationPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    goto LABEL_29;
  }
  if ((v10 & 1) == 0)
  {
    self->_showsNothingSelected = 0;
    v16 = self->_selectedVibrationIdentifier;
    -[TKVibrationPickerViewController _identifierOfVibrationAtIndexPath:](self, "_identifierOfVibrationAtIndexPath:", v7);
    v17 = (TKVibrationRecorderViewController *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerViewController _sanitizeVibrationIdentifierForPlayback:](self, "_sanitizeVibrationIdentifierForPlayback:", v17);
    v18 = (TKVibrationRecorderViewController *)objc_claimAutoreleasedReturnValue();
    if (-[TKVibrationRecorderViewController isEqualToString:](v18, "isEqualToString:", *MEMORY[0x24BEB8DD8]))
    {
      -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
      goto LABEL_24;
    }
    -[TKVibrationPickerViewController _sanitizeVibrationIdentifierForPlayback:](self, "_sanitizeVibrationIdentifierForPlayback:", v16);
    v19 = (TKVibrationRecorderViewController *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 == v18 || (-[TKVibrationRecorderViewController isEqualToString:](v19, "isEqualToString:", v18) & 1) != 0)
    {
      if (-[TKVibratorController vibratorState](self->_vibratorController, "vibratorState") == 1)
      {
        -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
LABEL_23:

LABEL_24:
        if (v16 == v17
          || (-[TKVibrationRecorderViewController isEqualToString:](v16, "isEqualToString:", v17) & 1) != 0)
        {
          -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        }
        else
        {
          v23 = (NSString *)-[TKVibrationRecorderViewController copy](v17, "copy");
          selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
          self->_selectedVibrationIdentifier = v23;

          -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
          -[TKVibrationPickerViewController _processCurrentVibrationSelection](self, "_processCurrentVibrationSelection");
        }

LABEL_29:
        goto LABEL_30;
      }
      v21 = self;
      v22 = v17;
    }
    else
    {
      v21 = self;
      v22 = v18;
    }
    -[TKVibrationPickerViewController _startVibratingWithVibrationIdentifier:](v21, "_startVibratingWithVibrationIdentifier:", v22);
    goto LABEL_23;
  }
LABEL_30:

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup")
    && (v9 = objc_msgSend(v7, "row"),
        v9 < -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, v8)- 1))
  {
    if (self->_allowsDeletingDefaultVibration)
    {
      v10 = 1;
    }
    else
    {
      -[TKVibrationPickerViewController _identifierOfVibrationAtIndexPath:](self, "_identifierOfVibrationAtIndexPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqualToString:", v13) ^ 1;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_swipeToDeleteMode = 1;
  -[TKVibrationPickerViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[TKVibrationPickerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  self->_swipeToDeleteMode = 0;
}

- (void)vibrationRecorderViewController:(id)a3 didFinishRecordingVibrationPattern:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  TLVibrationManager *vibrationManager;
  void *v14;
  id v15;
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  NSString *v17;
  NSString *selectedVibrationIdentifier;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[TKVibrationPickerViewController _adjustedNameForVibrationWithDesiredName:vibrationIdentifier:](self, "_adjustedNameForVibrationWithDesiredName:vibrationIdentifier:", v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9 && v11)
    {
      self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
      vibrationManager = self->_vibrationManager;
      v22 = 0;
      -[TLVibrationManager addUserGeneratedVibrationPattern:name:error:](vibrationManager, "addUserGeneratedVibrationPattern:name:error:", v9, v12, &v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      if (objc_msgSend(v14, "length"))
      {
        sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
        self->_sortedUserGeneratedVibrationIdentifiers = 0;

        v17 = (NSString *)objc_msgSend(v14, "copy");
        selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
        self->_selectedVibrationIdentifier = v17;

        -[TKVibrationPickerViewController _processCurrentVibrationSelection](self, "_processCurrentVibrationSelection");
        -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKVibrationPickerViewController tableView](self, "tableView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "beginUpdates");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "insertRowsAtIndexPaths:withRowAnimation:", v21, 4);

        objc_msgSend(v20, "endUpdates");
        -[TKVibrationPickerViewController _updateCheckedStateOfAllVisibleCells](self, "_updateCheckedStateOfAllVisibleCells");

      }
      else if (v15)
      {
        -[TKVibrationPickerViewController _handleError:](self, "_handleError:", v15);
      }

    }
  }
  else
  {
    v12 = 0;
  }

}

- (void)vibrationRecorderViewControllerWasDismissedWithoutSavingRecordedVibrationPattern:(id)a3
{
  void *v3;
  id v4;

  -[TKVibrationPickerViewController tableView](self, "tableView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 1);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v7;

  -[TKVibrationPickerViewController parentViewController](self, "parentViewController", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 30;
  v4 = (void *)v3;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_msgSend(v4, "parentViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
    if (!v5)
      return 30;
  }
  v7 = objc_msgSend(v4, "supportedInterfaceOrientations");

  return v7;
}

- (void)_startVibratingWithVibrationIdentifier:(id)a3
{
  id v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (-[TKVibratorController vibratorState](self->_vibratorController, "vibratorState") == 1)
  {
    -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
    v5 = dispatch_time(0, 200000000);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__TKVibrationPickerViewController__startVibratingWithVibrationIdentifier___block_invoke;
    v8[3] = &unk_24D37FF00;
    v8[4] = self;
    v4 = v4;
    v9 = v4;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], v8);

  }
  else
  {
    if (!objc_msgSend(v4, "length"))
    {
      -[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    -[TKVibrationPickerViewController _stopVibrating](self, "_stopVibrating");
    -[TLVibrationManager patternForVibrationWithIdentifier:](self->_vibrationManager, "patternForVibrationWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibratorController turnOnWithVibrationPattern:](self->_vibratorController, "turnOnWithVibrationPattern:", v7);

  }
}

uint64_t __74__TKVibrationPickerViewController__startVibratingWithVibrationIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startVibratingWithVibrationIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_stopVibrating
{
  -[TKVibratorController turnOff](self->_vibratorController, "turnOff");
}

- (void)vibrationPickerTableViewCell:(id)a3 endedEditingWithText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  TLVibrationManager *vibrationManager;
  char v19;
  id v20;
  void *v21;
  NSArray *sortedUserGeneratedVibrationIdentifiers;
  void *v23;
  void *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  -[TKVibrationPickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[TKVibrationPickerViewController _identifierOfVibrationAtIndexPath:](self, "_identifierOfVibrationAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[TKVibrationPickerViewController _adjustedNameForVibrationWithDesiredName:vibrationIdentifier:](self, "_adjustedNameForVibrationWithDesiredName:vibrationIdentifier:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (-[NSIndexPath isEqual:](self->_indexPathOfCellBeingDeleted, "isEqual:", v9) & 1) == 0)
  {
    objc_msgSend(v6, "setLabelText:", v11);
    if (objc_msgSend(v10, "length"))
    {
      -[TLVibrationManager nameOfVibrationWithIdentifier:](self->_vibrationManager, "nameOfVibrationWithIdentifier:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if (v14)
      {
        v15 = v14;
        if (v13 == v14)
        {

LABEL_20:
          goto LABEL_21;
        }
        v16 = objc_msgSend(v13, "isEqualToString:", v14);

        v13 = v15;
        if ((v16 & 1) != 0)
          goto LABEL_20;
LABEL_13:
        self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
        vibrationManager = self->_vibrationManager;
        v25 = 0;
        v19 = -[TLVibrationManager setName:forUserGeneratedVibrationWithIdentifier:error:](vibrationManager, "setName:forUserGeneratedVibrationWithIdentifier:error:", v11, v10, &v25);
        v20 = v25;
        v21 = v20;
        if ((v19 & 1) == 0 && v20)
          -[TKVibrationPickerViewController _handleError:](self, "_handleError:", v20);
        sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
        self->_sortedUserGeneratedVibrationIdentifiers = 0;

        -[TKVibrationPickerViewController _indexPathForVibrationWithIdentifier:](self, "_indexPathForVibrationWithIdentifier:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23 && (objc_msgSend(v23, "isEqual:", v9) & 1) == 0)
        {
          objc_msgSend(v8, "beginUpdates");
          objc_msgSend(v8, "moveRowAtIndexPath:toIndexPath:", v9, v24);
          objc_msgSend(v8, "endUpdates");
        }

        goto LABEL_20;
      }
    }
    else
    {
      v17 = v11;
    }

    v13 = 0;
    goto LABEL_13;
  }
LABEL_21:

}

- (void)_presentVibrationRecorderViewController
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  id v7;

  v3 = -[TKVibrationPickerViewController _sectionForUserGeneratedGroup](self, "_sectionForUserGeneratedGroup");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    -[TKVibrationPickerViewController tableView](self, "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[TKVibrationPickerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, v4);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v5 - 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v7, v6);

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;

  v4 = a4;
  v5 = a3;
  if (-[TKVibrationPickerViewController isEditing](self, "isEditing") != a3)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__TKVibrationPickerViewController_setEditing_animated___block_invoke;
    v11[3] = &unk_24D380300;
    v11[4] = self;
    v12 = v5;
    v13 = v4;
    v7 = (void (**)(_QWORD))MEMORY[0x2199E5D50](v11);
    if (self->_isCallingParentViewController)
      goto LABEL_3;
    -[TKVibrationPickerViewController parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = v8,
          self->_isCallingParentViewController = 1,
          objc_msgSend(v8, "setEditing:animated:", v5, v4),
          self->_isCallingParentViewController = 0,
          v10 = -[TKVibrationPickerViewController isEditing](self, "isEditing"),
          v9,
          v10 != v5))
    {
LABEL_3:
      v7[2](v7);
    }

  }
}

void __55__TKVibrationPickerViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _BYTE *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);

    if (v4 == v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (*(_BYTE *)(a1 + 40))
        v8 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1043) == 0;
      else
        v8 = 0;
      objc_msgSend(v6, "setHidesBackButton:animated:", v8, *(unsigned __int8 *)(a1 + 41));

    }
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isViewLoaded") || (v9 = *(_BYTE **)(a1 + 32), v9[1043]))
  {
    v10 = 0;
LABEL_10:
    v11 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v9, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleCells");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");

  if (!*(_BYTE *)(a1 + 40))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v51 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "makeTextFieldResignFirstResponderIfNeeded");
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v41);
    }

  }
  if (!v10)
    goto LABEL_10;
  objc_msgSend(v10, "beginUpdates");
  v11 = 0;
LABEL_11:
  if (*(_BYTE *)(a1 + 40))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "_sectionForDefaultGroup");
    v13 = objc_msgSend(*(id *)(a1 + 32), "_sectionForSynchronizedGroup");
    v14 = objc_msgSend(*(id *)(a1 + 32), "_sectionForSystemGroup");
    v15 = objc_msgSend(*(id *)(a1 + 32), "_sectionForNoneGroup");
    v16 = *(unsigned __int8 *)(a1 + 40);
    v17 = *(unsigned __int8 *)(a1 + 41);
    v49.receiver = *(id *)(a1 + 32);
    v49.super_class = (Class)TKVibrationPickerViewController;
    objc_msgSendSuper2(&v49, sel_setEditing_animated_, v16, v17);
    if ((v11 & 1) == 0)
    {
      v18 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v19 = v18;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v18, "addIndex:", v12);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v19, "addIndex:", v13);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v19, "addIndex:", v14);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v19, "addIndex:", v15);
      if (objc_msgSend(v19, "count"))
        objc_msgSend(v10, "deleteSections:withRowAnimation:", v19, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "_stopVibrating");
    if ((v11 & 1) != 0)
      goto LABEL_47;
LABEL_39:
    objc_msgSend(v10, "endUpdates");
    objc_msgSend(v10, "visibleCells");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v45 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
          v35 = *(void **)(a1 + 32);
          objc_msgSend(v10, "indexPathForCell:", v34, (_QWORD)v44);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_updateSelectionStyleForCell:indexPath:", v34, v36);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v31);
    }

    goto LABEL_47;
  }
  v20 = *(unsigned __int8 *)(a1 + 41);
  v48.receiver = *(id *)(a1 + 32);
  v48.super_class = (Class)TKVibrationPickerViewController;
  objc_msgSendSuper2(&v48, sel_setEditing_animated_, 0, v20);
  if ((v11 & 1) == 0)
  {
    v21 = objc_msgSend(*(id *)(a1 + 32), "_sectionForDefaultGroup");
    v22 = objc_msgSend(*(id *)(a1 + 32), "_sectionForSynchronizedGroup");
    v23 = objc_msgSend(*(id *)(a1 + 32), "_sectionForSystemGroup");
    v24 = objc_msgSend(*(id *)(a1 + 32), "_sectionForNoneGroup");
    v25 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v26 = v25;
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v25, "addIndex:", v21);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v26, "addIndex:", v22);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v26, "addIndex:", v23);
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v26, "addIndex:", v24);
    if (objc_msgSend(v26, "count"))
      objc_msgSend(v10, "insertSections:withRowAnimation:", v26, 0);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1043) = 0;
  if ((v11 & 1) == 0)
    goto LABEL_39;
LABEL_47:

}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)topic
{
  return self->_topic;
}

- (TKVibrationPickerViewControllerDelegate)delegate
{
  return (TKVibrationPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsDefault
{
  return self->_showsDefault;
}

- (NSString)defaultVibrationIdentifier
{
  return self->_defaultVibrationIdentifier;
}

- (NSString)correspondingToneIdentifier
{
  return self->_correspondingToneIdentifier;
}

- (BOOL)showsUserGenerated
{
  return self->_showsUserGenerated;
}

- (BOOL)showsNone
{
  return self->_showsNone;
}

- (NSString)noneString
{
  return self->_noneString;
}

- (BOOL)showsNothingSelected
{
  return self->_showsNothingSelected;
}

- (NSString)selectedVibrationIdentifier
{
  return self->_selectedVibrationIdentifier;
}

- (BOOL)allowsDeletingDefaultVibration
{
  return self->_allowsDeletingDefaultVibration;
}

- (void)setAllowsDeletingDefaultVibration:(BOOL)a3
{
  self->_allowsDeletingDefaultVibration = a3;
}

- (BOOL)showsEditButtonInNavigationBar
{
  return self->_showsEditButtonInNavigationBar;
}

- (TKVibrationPickerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (TKVibrationPickerViewControllerDelegate)_additionalDelegate
{
  return (TKVibrationPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->__additionalDelegate);
}

- (void)_setAdditionalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__additionalDelegate, a3);
}

- (TKVibrationPickerViewControllerDismissalDelegate)_dismissalDelegate
{
  return (TKVibrationPickerViewControllerDismissalDelegate *)objc_loadWeakRetained((id *)&self->__dismissalDelegate);
}

- (void)_setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__dismissalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__dismissalDelegate);
  objc_destroyWeak((id *)&self->__additionalDelegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_selectedVibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_correspondingToneIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultVibrationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViews, 0);
  objc_storeStrong((id *)&self->_indexPathOfCellBeingDeleted, 0);
  objc_storeStrong((id *)&self->_sortedUserGeneratedVibrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedVibrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_vibrationShouldStopTimer, 0);
  objc_storeStrong((id *)&self->_vibratorController, 0);
  objc_storeStrong((id *)&self->_vibrationManager, 0);
  objc_storeStrong((id *)&self->_synchronizedVibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_noneString, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end
