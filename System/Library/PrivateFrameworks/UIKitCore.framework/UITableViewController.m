@implementation UITableViewController

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  -[UITableViewController _refreshFilteredDataSourceFilterTypeForScreen:](self, "_refreshFilteredDataSourceFilterTypeForScreen:", a4);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewController;
  -[UIViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  -[UITableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditing:animated:", v5, v4);

}

- (void)loadView
{
  void *v3;
  UITableView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  -[UIViewController nibName](self, "nibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITableViewController;
    -[UIViewController loadView](&v22, sel_loadView);
    -[UITableViewController _existingTableView](self, "_existingTableView");
    v4 = (UITableView *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[UIViewController storyboardIdentifier](self, "storyboardIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[UIViewController storyboard](self, "storyboard");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;
        }
        else
        {
          objc_msgSend(v6, "description");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v9;

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s instantiated view controller with identifier \"%@\" from storyboard \"%@\", but didn't get a UITableView."), "-[UITableViewController loadView]", v5, v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s loaded the \"%@\" nib but didn't get a UITableView."), "-[UITableViewController loadView]", v3);
      }

    }
    -[UITableView delegate](v4, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      -[UITableView setDelegate:](v4, "setDelegate:", self);
    -[UITableView dataSource](v4, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      -[UITableViewController _applyDefaultDataSourceToTable:](self, "_applyDefaultDataSourceToTable:", v4);
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[UIViewController _screen](self, "_screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_applicationFrame");
      v10 = v15;
      v11 = v16;
      v12 = v17;
      v13 = v18;

    }
    v4 = -[UITableView initWithFrame:style:]([UITableView alloc], "initWithFrame:style:", self->_tableViewStyle, v10, v11, v12, v13);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UITableViewController _applyDefaultDataSourceToTable:](self, "_applyDefaultDataSourceToTable:", v4);
    -[UITableView setDelegate:](v4, "setDelegate:", self);
    -[UIViewController setView:](self, "setView:", v4);
  }
  -[UITableView setEditing:](v4, "setEditing:", -[UIViewController isEditing](self, "isEditing"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (self->_keyboardSupport)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_keyboardSupport);

    -[UIAutoRespondingScrollViewControllerKeyboardSupport setViewIsDisappearing:](self->_keyboardSupport, "setViewIsDisappearing:", 1);
    -[UIAutoRespondingScrollViewControllerKeyboardSupport setRegisteredForNotifications:](self->_keyboardSupport, "setRegisteredForNotifications:", 0);
  }
  if ((*(_BYTE *)&self->_tableViewControllerFlags & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIScreenCarScreenLimitedUIDidChangeNotification"), 0);

    *(_BYTE *)&self->_tableViewControllerFlags &= ~8u;
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewController;
  -[UIViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (UITableViewController)init
{
  return -[UITableViewController initWithStyle:](self, "initWithStyle:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  UIAutoRespondingScrollViewControllerKeyboardSupport *keyboardSupport;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v22;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)UITableViewController;
  -[UIViewController viewWillAppear:](&v38, sel_viewWillAppear_);
  -[UITableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &OBJC_IVAR___UICollectionViewFlowLayout__footerReferenceSize;
  if (objc_msgSend(v5, "numberOfSections"))
  {
    if ((*(_BYTE *)&self->_tableViewControllerFlags & 1) != 0)
    {
      v32 = v5;
      v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[UITableViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathsForSelectedRows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v9, "count"));

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[UITableViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathsForSelectedRows");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            -[UITableViewController tableView](self, "tableView", v32);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "_isRowMultiSelect:followingMacBehavior:", v17, 0);

            if ((v19 & 1) == 0)
              objc_msgSend(v10, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v14);
      }

      -[UIViewController transitionCoordinator](self, "transitionCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v32;
      objc_msgSend(v32, "_deselectRowsAtIndexPaths:animated:transitionCoordinator:", v10, v3, v20);

      v6 = &OBJC_IVAR___UICollectionViewFlowLayout__footerReferenceSize;
    }
  }
  else
  {
    objc_msgSend(v5, "reloadData");
  }
  keyboardSupport = self->_keyboardSupport;
  if (!keyboardSupport)
  {
    v22 = -[UIAutoRespondingScrollViewControllerKeyboardSupport initWithViewController:]([UIAutoRespondingScrollViewControllerKeyboardSupport alloc], "initWithViewController:", self);
    v23 = self->_keyboardSupport;
    self->_keyboardSupport = v22;

    keyboardSupport = self->_keyboardSupport;
  }
  if (!-[UIAutoRespondingScrollViewControllerKeyboardSupport registeredForNotifications](keyboardSupport, "registeredForNotifications", v32))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _screen](self, "_screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v25);
    objc_msgSend(v24, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v25);
    objc_msgSend(v24, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidShow_, CFSTR("UIKeyboardPrivateDidShowNotification"), v25);
    objc_msgSend(v24, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidHide_, CFSTR("UIKeyboardPrivateDidHideNotification"), v25);
    objc_msgSend(v24, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidChangeFrame_, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v25);
    -[UIAutoRespondingScrollViewControllerKeyboardSupport setRegisteredForNotifications:](self->_keyboardSupport, "setRegisteredForNotifications:", 1);

  }
  -[UIAutoRespondingScrollViewControllerKeyboardSupport setViewIsDisappearing:](self->_keyboardSupport, "setViewIsDisappearing:", 0);
  v26 = v6[419];
  if ((*((_BYTE *)&self->super.super.super.isa + v26) & 8) == 0)
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    if (v28 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__limitedUIDidChange, CFSTR("UIScreenCarScreenLimitedUIDidChangeNotification"), 0);

      *((_BYTE *)&self->super.super.super.isa + v26) |= 8u;
    }
  }
  if (!-[UIViewController _isInViewControllerThatHandlesKeyboardAvoidance](self, "_isInViewControllerThatHandlesKeyboardAvoidance"))
  {
    -[UIAutoRespondingScrollViewControllerKeyboardSupport adjustmentForKeyboard](self->_keyboardSupport, "adjustmentForKeyboard");
    v33 = v30;
    -[UITableViewController tableView](self, "tableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &v33);

    -[UIAutoRespondingScrollViewControllerKeyboardSupport setAdjustmentForKeyboard:](self->_keyboardSupport, "setAdjustmentForKeyboard:", v33);
  }

}

- (UITableView)tableView
{
  void *v3;
  void *v4;
  id v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[UIViewController _embeddedView](self, "_embeddedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v3 = v4;
  }
  v5 = v3;
  v4 = v5;
LABEL_6:

  return (UITableView *)v5;
}

- (void)_applyDefaultDataSourceToTable:(id)a3
{
  _UIFilteredDataSource *filteredDataSource;
  void *v5;
  void *v6;
  id v7;

  filteredDataSource = self->_filteredDataSource;
  v7 = a3;
  if (filteredDataSource)
  {
    -[_UIFilteredDataSource setTableDataSource:](filteredDataSource, "setTableDataSource:", self);
    v5 = self->_filteredDataSource;
    v6 = v7;
  }
  else
  {
    v6 = v7;
    v5 = self;
  }
  objc_msgSend(v6, "setDataSource:", v5);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  objc_class *v11;
  void (*MethodImplementation)(void);
  objc_class *v13;
  objc_super v15;

  if (!self->_staticDataSource
    && (sel_tableView_titleForHeaderInSection_ != a3 ? (v4 = sel_tableView_titleForFooterInSection_ == a3) : (v4 = 1),
        !v4 ? (v5 = sel_tableView_heightForHeaderInSection_ == a3) : (v5 = 1),
        !v5 ? (v6 = sel_tableView_heightForFooterInSection_ == a3) : (v6 = 1),
        !v6 ? (v7 = sel_tableView_viewForHeaderInSection_ == a3) : (v7 = 1),
        !v7 ? (v8 = sel_tableView_viewForFooterInSection_ == a3) : (v8 = 1),
        !v8 ? (v9 = sel_tableView_heightForRowAtIndexPath_ == a3) : (v9 = 1),
        !v9 ? (v10 = sel_tableView_indentationLevelForRowAtIndexPath_ == a3) : (v10 = 1),
        v10))
  {
    v11 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v11, a3);
    v13 = (objc_class *)objc_opt_class();
    return class_getMethodImplementation(v13, a3) != MethodImplementation;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewController;
    return -[UITableViewController respondsToSelector:](&v15, sel_respondsToSelector_, a3);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  UITableViewDataSource *staticDataSource;

  staticDataSource = self->_staticDataSource;
  if (staticDataSource)
    return -[UITableViewDataSource numberOfSectionsInTableView:](staticDataSource, "numberOfSectionsInTableView:", a3);
  else
    return 1;
}

- (BOOL)_viewControllerWasSelected
{
  void *v2;
  char v3;

  -[UITableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_highlightFirstVisibleRowIfAppropriate");

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITableViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[UITableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)_refreshFilteredDataSourceFilterTypeForScreen:(id)a3
{
  -[_UIFilteredDataSource setFilterType:](self->_filteredDataSource, "setFilterType:", -[UITableViewController _resolvedDataSourceFilterTypeForScreen:](self, "_resolvedDataSourceFilterTypeForScreen:", a3));
}

- (int64_t)_resolvedDataSourceFilterTypeForScreen:(id)a3
{
  id v4;
  void *v5;
  int64_t filteredDataType;
  int v7;
  unsigned int v8;
  int64_t v9;

  v4 = a3;
  v5 = v4;
  filteredDataType = self->_filteredDataType;
  if (filteredDataType)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "_areListsLimited");
    filteredDataType = self->_filteredDataType;
  }
  if (filteredDataType == 1)
    v8 = objc_msgSend(v5, "_areMusicListsLimited");
  else
    v8 = 0;
  v9 = v7 | v8;

  return v9;
}

- (UITableViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  UITableViewController *v4;
  UITableViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, nibNameOrNil, nibBundleOrNil);
  v5 = v4;
  if (v4)
    _UITableViewControllerCommonInit(v4);
  return v5;
}

- (UITableViewController)initWithStyle:(UITableViewStyle)style
{
  UITableViewController *v5;
  UITableViewController *v6;
  objc_super v8;
  objc_super v9;

  if (dyld_program_sdk_at_least())
  {
    v9.receiver = self;
    v9.super_class = (Class)UITableViewController;
    v5 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewController;
    v5 = -[UIViewController init](&v8, sel_init);
  }
  v6 = v5;
  if (v5)
  {
    v5->_tableViewStyle = style;
    _UITableViewControllerCommonInit(v5);
  }
  return v6;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear
{
  *(_BYTE *)&self->_tableViewControllerFlags = *(_BYTE *)&self->_tableViewControllerFlags & 0xFE | clearsSelectionOnViewWillAppear;
}

- (UITableViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITableViewController *v5;
  UITableViewController *v6;
  uint64_t v7;
  UITableViewDataSource *staticDataSource;
  objc_super v10;

  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewController;
  v5 = -[UIViewController initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    _UITableViewControllerCommonInit(v5);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIClearsSelectionOnViewWillAppear")))
      *(_BYTE *)&v6->_tableViewControllerFlags = *(_BYTE *)&v6->_tableViewControllerFlags & 0xFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIClearsSelectionOnViewWillAppear"));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITableViewControllerStaticDataSource"));
    v7 = objc_claimAutoreleasedReturnValue();
    staticDataSource = v6->_staticDataSource;
    v6->_staticDataSource = (UITableViewDataSource *)v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UITableViewDataSource *staticDataSource;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewController;
  -[UIViewController encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if ((*(_BYTE *)&self->_tableViewControllerFlags & 1) == 0)
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIClearsSelectionOnViewWillAppear"));
  staticDataSource = self->_staticDataSource;
  if (staticDataSource)
    objc_msgSend(v4, "encodeObject:forKey:", staticDataSource, CFSTR("UITableViewControllerStaticDataSource"));

}

- (void)dealloc
{
  void *v3;
  _UIFilteredDataSource *v4;
  _UIFilteredDataSource *filteredDataSource;
  void *v6;
  void *v7;
  objc_super v8;

  -[UITableViewController _existingTableView](self, "_existingTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (_UIFilteredDataSource *)objc_claimAutoreleasedReturnValue();
  filteredDataSource = self->_filteredDataSource;

  if (v4 == filteredDataSource)
    objc_msgSend(v3, "setDataSource:", 0);
  if (self->_keyboardSupport)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self->_keyboardSupport);

  }
  if ((*(_BYTE *)&self->_tableViewControllerFlags & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("UIScreenCarScreenLimitedUIDidChangeNotification"), 0);

    *(_BYTE *)&self->_tableViewControllerFlags &= ~8u;
  }

  v8.receiver = self;
  v8.super_class = (Class)UITableViewController;
  -[UIViewController dealloc](&v8, sel_dealloc);
}

- (id)_existingTableView
{
  void *v2;
  id v3;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setTableView:(UITableView *)tableView
{
  UITableView *v4;
  UITableViewController *v5;
  UITableViewController *v6;
  UITableViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UITableView *v11;

  v11 = tableView;
  -[UITableViewController _existingTableView](self, "_existingTableView");
  v4 = (UITableView *)objc_claimAutoreleasedReturnValue();
  if (v4 != v11)
  {
    -[UITableView dataSource](v4, "dataSource");
    v5 = (UITableViewController *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == self || v5 == (UITableViewController *)self->_filteredDataSource)
      -[UITableView setDataSource:](v4, "setDataSource:", 0);
    -[UITableView delegate](v4, "delegate");
    v7 = (UITableViewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UITableView setDelegate:](v4, "setDelegate:", 0);
    -[UIScrollView _refreshControl](v4, "_refreshControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setView:](self, "setView:", v11);
    -[UIScrollView _setRefreshControl:](v11, "_setRefreshControl:", v8);
    -[UITableView dataSource](v11, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[UITableViewController _applyDefaultDataSourceToTable:](self, "_applyDefaultDataSourceToTable:", v11);
    -[UITableView delegate](v11, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[UITableView setDelegate:](v11, "setDelegate:", self);

  }
}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return *(_BYTE *)&self->_tableViewControllerFlags & 1;
}

- (void)_limitedUIDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UITableViewController__limitedUIDidChange__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__UITableViewController__limitedUIDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_screen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_refreshFilteredDataSourceFilterTypeForScreen:", v2);

}

- (void)setRefreshControl:(UIRefreshControl *)refreshControl
{
  UIRefreshControl *v4;
  id v5;

  v4 = refreshControl;
  -[UITableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRefreshControl:", v4);

}

- (UIRefreshControl)refreshControl
{
  void *v2;
  void *v3;

  -[UITableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIRefreshControl *)v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = (int64_t)self->_staticDataSource;
  if (result)
    return objc_msgSend((id)result, "tableView:numberOfRowsInSection:", a3, a4);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[UITableViewDataSource tableView:cellForRowAtIndexPath:](self->_staticDataSource, "tableView:cellForRowAtIndexPath:", a3, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[UITableViewDataSource tableView:titleForHeaderInSection:](self->_staticDataSource, "tableView:titleForHeaderInSection:", a3, a4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return -[UITableViewDataSource tableView:titleForFooterInSection:](self->_staticDataSource, "tableView:titleForFooterInSection:", a3, a4);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return -[UITableViewDataSource tableView:viewForHeaderInSection:](self->_staticDataSource, "tableView:viewForHeaderInSection:", a3, a4);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return -[UITableViewDataSource tableView:viewForFooterInSection:](self->_staticDataSource, "tableView:viewForFooterInSection:", a3, a4);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  UITableViewDataSource *staticDataSource;
  double result;

  staticDataSource = self->_staticDataSource;
  if (!staticDataSource)
    return 0.0;
  -[UITableViewDataSource tableView:heightForHeaderInSection:](staticDataSource, "tableView:heightForHeaderInSection:", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  UITableViewDataSource *staticDataSource;
  double result;

  staticDataSource = self->_staticDataSource;
  if (!staticDataSource)
    return 0.0;
  -[UITableViewDataSource tableView:heightForFooterInSection:](staticDataSource, "tableView:heightForFooterInSection:", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  UITableViewDataSource *staticDataSource;
  double result;

  staticDataSource = self->_staticDataSource;
  if (staticDataSource)
    -[UITableViewDataSource tableView:heightForRowAtIndexPath:](staticDataSource, "tableView:heightForRowAtIndexPath:", a3, a4);
  else
    objc_msgSend(a3, "rowHeight");
  return result;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  int64_t result;

  result = (int64_t)self->_staticDataSource;
  if (result)
    return objc_msgSend((id)result, "tableView:indentationLevelForRowAtIndexPath:", a3, a4);
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  -[UITableViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if ((objc_msgSend(a3, "isEditing") & 1) == 0)
    -[UITableViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5;

  v5 = a3;
  if (dyld_program_sdk_at_least() && objc_msgSend(v5, "isEditing"))
    -[UITableViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (int64_t)_filteredDataType
{
  return self->_filteredDataType;
}

- (void)_setFilteredDataType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_filteredDataType = a3;
  -[UIViewController _screen](self, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController _refreshFilteredDataSourceFilterTypeForScreen:](self, "_refreshFilteredDataSourceFilterTypeForScreen:", v4);

  -[UITableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  if (-[UITableViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    objc_msgSend(v8, "sourceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController previewViewControllerForLocation:inSourceView:](self, "previewViewControllerForLocation:inSourceView:", v9, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    v10 = 0;
  }

  return v10;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  if (-[UITableViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    v6 = v8;
    v7 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UITableViewController committedViewControllerForPreviewViewController:](self, "committedViewControllerForPreviewViewController:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
        v7 = v6;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UITableViewController commitPreviewViewController:committedViewController:](self, "commitPreviewViewController:committedViewController:", v6, v7);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UITableViewController commitPreviewViewController:](self, "commitPreviewViewController:", v6);
    }

  }
  else
  {
    -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }

}

- (id)previewViewControllerForRowAtIndexPath:(id)a3
{
  return 0;
}

- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[UIViewController isEditing](self, "isEditing")
    || !-[UITableViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    v10 = 0;
  }
  else
  {
    -[UITableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
    objc_msgSend(v8, "indexPathForRowAtPoint:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController previewViewControllerForRowAtIndexPath:](self, "previewViewControllerForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  v9 = a5;
  if (-[UITableViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    -[UITableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
    objc_msgSend(v10, "indexPathForRowAtPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForRowAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v12);
    objc_msgSend(v12, "bounds");
    objc_msgSend(v13, "setSourceRect:");
    -[UITableViewController willPresentPreviewViewController:forRowAtIndexPath:](self, "willPresentPreviewViewController:forRowAtIndexPath:", v14, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredDataSource, 0);
  objc_storeStrong((id *)&self->_staticDataSource, 0);
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
}

- (UITableViewDataSource)_staticDataSource
{
  return self->_staticDataSource;
}

- (void)_setStaticDataSource:(id)a3
{
  UITableViewDataSource *v5;
  _BOOL4 v6;
  void *v7;
  UITableViewController *v8;
  _UIFilteredDataSource *v9;
  _UIFilteredDataSource *filteredDataSource;
  UITableViewDataSource *v11;

  v5 = (UITableViewDataSource *)a3;
  if (self->_staticDataSource != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_staticDataSource, a3);
    v6 = -[UIViewController isViewLoaded](self, "isViewLoaded");
    v5 = v11;
    if (v6)
    {
      -[UITableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (UITableViewController *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
      {
        objc_msgSend(v7, "setDelegate:", 0);
        objc_msgSend(v7, "setDelegate:", self);
      }
      objc_msgSend(v7, "dataSource");
      v9 = (_UIFilteredDataSource *)objc_claimAutoreleasedReturnValue();
      filteredDataSource = self->_filteredDataSource;

      if (v9 == filteredDataSource)
        -[UITableViewController _applyDefaultDataSourceToTable:](self, "_applyDefaultDataSourceToTable:", v7);
      objc_msgSend(v7, "reloadData");

      v5 = v11;
    }
  }

}

@end
