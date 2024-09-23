@implementation PKPaymentPreferencesViewController

- (id)pk_childrenForAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesViewController;
  -[UIViewController pk_childrenForAppearance](&v8, sel_pk_childrenForAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PKPaymentPreferencesViewController)initWithStyle:(int64_t)a3 preferences:(id)a4 title:(id)a5 handler:(id)a6 contactFormatValidator:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentPreferencesViewController *v17;
  PKPaymentPreferencesViewController *v18;
  uint64_t v19;
  id handler;
  id v21;
  uint64_t v22;
  UITableView *tableView;
  objc_super v25;
  objc_super v26;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPreferencesViewController;
  v17 = -[PKPaymentPreferencesViewController init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    v25.receiver = v17;
    v25.super_class = (Class)PKPaymentPreferencesViewController;
    -[PKPaymentPreferencesViewController setTitle:](&v25, sel_setTitle_, v14);
    objc_storeStrong((id *)&v18->_preferences, a4);
    objc_storeStrong((id *)&v18->_latestPreferences, v18->_preferences);
    v18->_style = a3;
    v19 = objc_msgSend(v15, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v19;

    v21 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v22 = objc_msgSend(v21, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    tableView = v18->_tableView;
    v18->_tableView = (UITableView *)v22;

    -[UITableView setDelegate:](v18->_tableView, "setDelegate:", v18);
    -[UITableView setDataSource:](v18->_tableView, "setDataSource:", v18);
    -[UITableView setAllowsSelectionDuringEditing:](v18->_tableView, "setAllowsSelectionDuringEditing:", 1);
    objc_storeStrong((id *)&v18->_contactFormatValidator, a7);
    v18->_isEditingFieldThatWasOriginallyInvalid = 0;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController dealloc](&v2, sel_dealloc);
}

- (BOOL)_isViewTranslucent
{
  return (self->_style < 5uLL) & (0x19u >> self->_style);
}

- (void)viewDidLoad
{
  void *v3;
  UITableView *tableView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentPreferencesViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_msgSend(v3, "addSubview:", self->_tableView);
  if (-[PKPaymentPreferencesViewController _isPaymentStyle](self, "_isPaymentStyle"))
  {
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[UITableView setCellLayoutMarginsFollowReadableWidth:](self->_tableView, "setCellLayoutMarginsFollowReadableWidth:", 1);
    }
  }
  else
  {
    -[UITableView pkui_setupForReadableContentGuide](self->_tableView, "pkui_setupForReadableContentGuide");
  }
  -[UITableView setInsetsLayoutMarginsFromSafeArea:](self->_tableView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  if (-[PKPaymentPreferencesViewController _isViewTranslucent](self, "_isViewTranslucent"))
  {
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v5);

  }
  if (-[PKPaymentPreferencesViewController _isPaymentStyle](self, "_isPaymentStyle"))
    -[PKPaymentPreferencesViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeCardCachingEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  -[PKPaymentPreferencesViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  if (-[PKPaymentPreferencesViewController _isPaymentStyle](self, "_isPaymentStyle"))
    -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  if (-[PKPaymentPreferencesViewController _isPaymentStyle](self, "_isPaymentStyle"))
    -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698F8];
  v6 = *MEMORY[0x1E0D68F50];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D69100];
  v11[0] = *MEMORY[0x1E0D68C50];
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeCardCachingEnabled:", 0);

  v6 = (void *)MEMORY[0x1E0D66A58];
  v7 = *MEMORY[0x1E0D698F8];
  v8 = *MEMORY[0x1E0D68F50];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v8;
  v9 = *MEMORY[0x1E0D69100];
  v13[0] = *MEMORY[0x1E0D68C58];
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject:sendEvent:", v7, v10);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (self->_currentEditingField)
    -[PKPaymentPreferencesViewController hideTextField:](self, "hideTextField:");
}

- (void)viewWillLayoutSubviews
{
  UITableView *tableView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  ++self->_layoutRecursionCounter;
  tableView = self->_tableView;
  -[PKPaymentPreferencesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

}

- (void)viewDidLayoutSubviews
{
  unsigned __int16 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3 && self->_preferredContentSizeUpdateDeferred)
    -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (BOOL)_shouldUpdatePreferredContentSize
{
  return !-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts")|| (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_updatePreferredContentSize
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (-[PKPaymentPreferencesViewController _shouldUpdatePreferredContentSize](self, "_shouldUpdatePreferredContentSize"))
  {
    if (self->_layoutRecursionCounter)
    {
      self->_preferredContentSizeUpdateDeferred = 1;
    }
    else
    {
      self->_preferredContentSizeUpdateDeferred = 0;
      if (self->_keyboardVisible)
      {
        -[PKPaymentPreferencesViewController navigationController](self, "navigationController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pkui_compactNavigationContainer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4)
        {
          objc_msgSend(v4, "modalPresentationSize");
          v7 = v6;
          v9 = v8;
        }
        else
        {
          objc_msgSend(v3, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bounds");
          v7 = v13;
          v9 = v14;

        }
      }
      else
      {
        -[UITableView contentSize](self->_tableView, "contentSize");
        v7 = v10;
        v9 = v11;
      }
      -[PKPaymentPreferencesViewController preferredContentSize](self, "preferredContentSize");
      if (v7 != v16 || v9 != v15)
        -[PKPaymentPreferencesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v9);
    }
  }
}

- (void)_updateNavigationBarButtons
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreferencesViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", 0);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_preferences;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsDeletion", (_QWORD)v14))
        {
          if ((objc_msgSend(v9, "isReadOnly") & 1) == 0)
          {
            objc_msgSend(v9, "preferences");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "count");

            if (v11)
            {
              -[PKPaymentPreferencesViewController navigationItem](self, "navigationItem");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentPreferencesViewController editButtonItem](self, "editButtonItem");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setRightBarButtonItem:", v13);

              goto LABEL_13;
            }
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);

  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, v6, 0.0);

  self->_keyboardVisible = 1;
  -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  -[PKPaymentPreferencesViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E0DC49E8], v6, v7, v8);

  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollIndicatorInsets:", v5, v6, v7, v8);

  self->_keyboardVisible = 0;
  -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController setEditing:animated:](&v7, sel_setEditing_animated_);
  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", v5, v4);
  if (!v5)
  {
    -[PKPaymentPreferencesViewController _updateContactAndForceSelection:](self, "_updateContactAndForceSelection:", 1);
    -[PKPaymentPreferencesViewController _cleanupInlineEdits](self, "_cleanupInlineEdits");
  }
}

- (void)_startInlineEditingForPreference:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITableView *tableView;
  void *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  objc_msgSend(v6, "contactKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C97200]);
    -[NSObject setContactSource:](v8, "setContactSource:", 3);
    -[UITableView beginUpdates](self->_tableView, "beginUpdates");
    objc_msgSend(v6, "preferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferences:", v10);

    v11 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v6, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForRow:inSection:", objc_msgSend(v12, "count") - 1, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    tableView = self->_tableView;
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v15, 100);

    -[UITableView endUpdates](self->_tableView, "endUpdates");
    -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showTextField:", 1);
    -[PKPaymentPreferencesViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Attempted to start inline editing on preference that doesn't support it", v17, 2u);
    }
  }

}

- (void)_cleanupInlineEdits
{
  PKPaymentPreferencesViewController *v2;
  UITextField *currentEditingField;
  UITextField *v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  PKPaymentPreferencesViewController *v23;
  void *v24;
  void *v25;
  char v26;

  v2 = self;
  currentEditingField = self->_currentEditingField;
  if (currentEditingField)
  {
    -[UITextField resignFirstResponder](currentEditingField, "resignFirstResponder");
    v4 = v2->_currentEditingField;
    v2->_currentEditingField = 0;

  }
  if (-[NSArray count](v2->_preferences, "count"))
  {
    v5 = 0;
    v26 = 0;
    v23 = v2;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v2->_preferences, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v24 = v6;
        v9 = v6;
        objc_msgSend(v9, "preferences");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "selectedIndex");
        if (v12 >= objc_msgSend(v10, "count"))
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "selectedIndex"));
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v25 = (void *)v13;
        if (objc_msgSend(v10, "count"))
        {
          v14 = 0;
          do
          {
            objc_msgSend(v9, "preferences");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "isKeyAvailable:", v11))
            {
              objc_msgSend(v16, "valueForKey:", v11);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "count");

              if (!v18)
              {
                objc_msgSend(v7, "addObject:", v16);
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v14, v5);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v19);

                v26 = 1;
              }
            }

            ++v14;
          }
          while (objc_msgSend(v10, "count") > v14);
        }
        v2 = v23;
        if (objc_msgSend(v7, "count"))
        {
          -[UITableView beginUpdates](v23->_tableView, "beginUpdates");
          objc_msgSend(v10, "pk_arrayByRemovingObjectsInArray:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPreferences:", v20);

          -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v23->_tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 100);
          if (v25)
          {
            objc_msgSend(v9, "preferences");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setSelectedIndex:", objc_msgSend(v21, "indexOfObject:", v25));

          }
          -[UITableView endUpdates](v23->_tableView, "endUpdates");
        }

        v6 = v24;
      }

      ++v5;
    }
    while (-[NSArray count](v2->_preferences, "count") > v5);
    handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))v2->_handler;
    if (((handler != 0) & v26) != 0)
      handler[2](handler, v2, v2->_preferences);
  }
}

- (id)_peerPaymentAccountPaymentSwitch
{
  UISwitch *peerPaymentAccountPaymentSwitch;
  UISwitch *v4;
  UISwitch *v5;

  peerPaymentAccountPaymentSwitch = self->_peerPaymentAccountPaymentSwitch;
  if (!peerPaymentAccountPaymentSwitch)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v5 = self->_peerPaymentAccountPaymentSwitch;
    self->_peerPaymentAccountPaymentSwitch = v4;

    -[UISwitch addTarget:action:forControlEvents:](self->_peerPaymentAccountPaymentSwitch, "addTarget:action:forControlEvents:", self, sel_applePayCashSwitchValueChanged_, 4096);
    peerPaymentAccountPaymentSwitch = self->_peerPaymentAccountPaymentSwitch;
  }
  return peerPaymentAccountPaymentSwitch;
}

- (void)clearErrorsForPreference:(Class)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_latestPreferences;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", a3, (_QWORD)v10))
          objc_msgSend(v9, "clearAllErrors");
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setErrors:(id)a3 selectedPass:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  objc_storeStrong((id *)&self->_paymentPassForBillingErrors, a4);
  v8 = a3;
  -[PKPaymentPreferencesViewController setErrors:animated:](self, "setErrors:animated:", v8, v5);

}

- (void)setErrors:(id)a3 otherPass:(id)a4 animated:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *obj;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v29 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_latestPreferences;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v24 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      v25 = v8;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v11;
          v28 = v10;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v11, "preferences");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v31 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v29, "uniqueID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = v17;
                  objc_msgSend(v19, "pass");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "uniqueID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = PKEqualObjects();

                  if (v22)
                  {
                    objc_msgSend(v27, "setErrors:forPreference:", v23, v19);

                    goto LABEL_19;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_19:

          v9 = v24;
          v8 = v25;
          v10 = v28;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);
  }

}

- (void)setErrors:(id)a3 animated:(BOOL)a4
{
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  PKPaymentPreferencesViewController *v30;
  NSObject *oslog;
  uint64_t v32;
  NSArray *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD block[5];
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v34;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Set errors on preference controller: %@", buf, 0xCu);
  }
  oslog = v5;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v30 = self;
  v6 = self->_latestPreferences;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    v10 = *MEMORY[0x1E0C967F0];
    v43 = *MEMORY[0x1E0D69BF0];
    v42 = *MEMORY[0x1E0D69BD8];
    v41 = *MEMORY[0x1E0D69BE8];
    v11 = *MEMORY[0x1E0C967C0];
    v40 = *MEMORY[0x1E0D69BE0];
    v12 = *MEMORY[0x1E0C966A8];
    v13 = *MEMORY[0x1E0D69BD0];
    v32 = *(_QWORD *)v51;
    v33 = v6;
    do
    {
      v14 = 0;
      v36 = v8;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
        objc_msgSend(v15, "clearAllErrors");
        if (objc_msgSend(v15, "selectedIndex") != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = v14;
          objc_msgSend(v15, "preferences");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v15, "selectedIndex"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          v37 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v17;
            v18 = v15;
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v38 = v18;
            objc_msgSend(v18, "contactKeys");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v47 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                  if (objc_msgSend(v25, "isEqualToString:", v10))
                  {
                    objc_msgSend(v19, "addObject:", v43);
                    objc_msgSend(v19, "addObject:", v42);
                    objc_msgSend(v19, "addObject:", v41);
                  }
                  if (objc_msgSend(v25, "isEqualToString:", v11))
                    objc_msgSend(v19, "addObject:", v40);
                  if (objc_msgSend(v25, "isEqualToString:", v12))
                    objc_msgSend(v19, "addObject:", v13);
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
              }
              while (v22);
            }

            v26 = objc_msgSend(v38, "type");
            if (v26)
            {
              if (v26 == 1)
              {
                objc_msgSend(MEMORY[0x1E0C99D20], "pk_FilteredShippingErrorsForContactFields:errors:", v19, v34);
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_30;
              }
              v28 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D20], "pk_FilteredBillingErrorsForContactFields:errors:", v19, v34);
              v27 = objc_claimAutoreleasedReturnValue();
LABEL_30:
              v28 = (void *)v27;
            }
            v9 = v32;
            v17 = v35;
            v8 = v36;

            v6 = v33;
            if (v28)
            {
LABEL_33:
              objc_msgSend(v37, "setErrors:forPreference:", v28, v17);
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v55 = v28;
                v56 = 2112;
                v57 = v37;
                _os_log_impl(&dword_19D178000, oslog, OS_LOG_TYPE_DEFAULT, "Set errors: %@ on preference: %@", buf, 0x16u);
              }

              v8 = v36;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99D20], "pk_FilteredCardErrors:", v34);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
                goto LABEL_33;
            }
          }

          v14 = v39;
        }
        ++v14;
      }
      while (v14 != v8);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentPreferencesViewController_setErrors_animated___block_invoke;
  block[3] = &unk_1E3E64C10;
  v45 = a4;
  block[4] = v30;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__PKPaymentPreferencesViewController_setErrors_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v2)
  {
    v4 = objc_msgSend(v3, "numberOfSections");

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 100);

  }
  else
  {
    objc_msgSend(v3, "reloadData");
  }

}

- (void)applePayCashSwitchValueChanged:(id)a3
{
  id v4;
  void *v5;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__66;
  v12 = __Block_byref_object_dispose__66;
  v13 = 0;
  -[PKPaymentPreferencesViewController preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentPreferencesViewController_applePayCashSwitchValueChanged___block_invoke;
  v7[3] = &unk_1E3E7AC80;
  v7[4] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  objc_msgSend((id)v9[5], "setOn:", objc_msgSend(v4, "isOn"));
  handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler)
    handler[2](handler, self, self->_preferences);
  _Block_object_dispose(&v8, 8);

}

void __69__PKPaymentPreferencesViewController_applePayCashSwitchValueChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
  }

}

- (id)_cellForPreference:(id)a3 row:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  PKPassSnapshotter *v31;
  PKPassSnapshotter *passSnapshotter;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  char v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  char isKindOfClass;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  PKPassSnapshotter *v86;
  PKPassSnapshotter *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  uint64_t v104;
  void *v105;
  int v106;
  _BOOL8 v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  unint64_t v120;
  id obj;
  id obja;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;

  v5 = a3;
  objc_msgSend(v5, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "selectedIndex");
  v9 = objc_msgSend(v5, "pendingIndex");
  v129 = v6;
  objc_msgSend(v6, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorsForPreference:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v8;
  if (objc_msgSend(v11, "count"))
    v12 = v8 == a4;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "type"))
    goto LABEL_9;
  -[PKPaymentPass serialNumber](self->_paymentPassForBillingErrors, "serialNumber");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass serialNumber](self->_currentlySelectedPaymentPass, "serialNumber");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v39;
  v42 = v40;
  if (v41 == v42)
  {

    goto LABEL_9;
  }
  v43 = v42;
  if (v41 && v42)
  {
    v44 = objc_msgSend(v41, "isEqualToString:", v42);

    if ((v44 & 1) == 0)
    {
      v128 = 0;
      v13 = 0;
      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(v5, "errorsForPreference:", v7);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  v128 = 0;
  v13 = 0;
LABEL_10:
  objc_opt_class();
  v127 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "amount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    if ((objc_msgSend(v16, "isEqualToNumber:", v17) & 1) != 0)
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_AMOUNT_FREE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v15, "amount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currency");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKFormattedCurrencyStringFromNumber();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ - %@"), v19, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v27);

    objc_msgSend(v14, "detailTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v29);

    v20 = v129;
    v9 = v18;
    v21 = v15;
    goto LABEL_81;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = v9;
      -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!self->_passSnapshotter)
      {
        +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
        v31 = (PKPassSnapshotter *)objc_claimAutoreleasedReturnValue();
        passSnapshotter = self->_passSnapshotter;
        self->_passSnapshotter = v31;

      }
      objc_msgSend(v30, "passSnapshotter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v129;
      if (!v33)
        objc_msgSend(v30, "setPassSnapshotter:", self->_passSnapshotter);
      v34 = v5;
      objc_msgSend(v34, "peerPaymentPass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPass:", v35);

      -[PKPaymentPreferencesViewController _peerPaymentAccountPaymentSwitch](self, "_peerPaymentAccountPaymentSwitch");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setOn:", objc_msgSend(v34, "isOn"));
      v37 = objc_msgSend(v34, "isEnabled");

      v38 = v37;
      v21 = v30;
      objc_msgSend(v36, "setEnabled:", v38);
      objc_msgSend(v30, "setAccessoryView:", v36);
      objc_msgSend(v30, "setAccessoryType:", 0);

      v14 = v30;
      goto LABEL_80;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = v9;
      v21 = v7;
      v45 = v5;
      -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInlineEditingEnabled:", objc_msgSend(v45, "supportsInlineEditing"));
      objc_msgSend(v45, "contactKey");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0C967F0]);

      v123 = v45;
      if (v47)
      {
        objc_msgSend(v21, "pk_displayName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "detailTextLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pkSingleLineFormattedContactAddress");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setText:", v50);

        objc_msgSend(v14, "textLabel");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setText:", v48);
      }
      else
      {
        objc_msgSend(v45, "contactKey");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "isEqualToString:", *MEMORY[0x1E0C967C0]);

        if (v60)
        {
          objc_msgSend(v21, "phoneNumbers");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "firstObject");
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "pk_displayName");
          v117 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "value");
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textField");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setKeyboardType:", 5);

          objc_msgSend(v14, "textField");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setDelegate:", self);

          objc_msgSend(v14, "textField");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PHONE"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setPlaceholder:", v65);

          objc_msgSend(v14, "detailTextLabel");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setText:", v117);

          objc_msgSend(obja, "pkFormattedStringValue");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textLabel");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setText:", v67);

          objc_msgSend(v14, "textField");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setText:", v67);
          v13 = v13;
          objc_msgSend(v69, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);

          v51 = (void *)v117;
          v48 = v115;
        }
        else
        {
          objc_msgSend(v45, "contactKey");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "isEqualToString:", *MEMORY[0x1E0C966A8]);

          if (!v71)
          {
LABEL_45:
            if (objc_msgSend(v128, "count"))
              v81 = v13;
            else
              v81 = 0;
            if (v81 == 1)
            {
              objc_msgSend(v128, "firstObject");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "localizedDescription");
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "detailTextLabel");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setText:", v83);

            }
            objc_msgSend(v14, "setHasError:", v13);

            goto LABEL_79;
          }
          objc_msgSend(v21, "emailAddresses");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "firstObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "pk_displayName");
          v118 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "value");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textField");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setKeyboardType:", 7);

          objc_msgSend(v14, "textField");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setDelegate:", self);

          objc_msgSend(v14, "textField");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setAutocapitalizationType:", 0);

          objc_msgSend(v14, "textField");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_EMAIL"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setPlaceholder:", v77);

          v51 = (void *)v118;
          objc_msgSend(v14, "detailTextLabel");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setText:", v118);

          objc_msgSend(v14, "textLabel");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setText:", v116);

          objc_msgSend(v14, "textField");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setText:", v116);
          v13 = v13;
          objc_msgSend(v80, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);

        }
      }

      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      v20 = v6;
      goto LABEL_82;
    }
    v52 = a4 + 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v54 = v7;
    v55 = v54;
    v125 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v54, "pass");
      v56 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "availabilityString");
      v57 = objc_claimAutoreleasedReturnValue();
      obj = (id)v56;
      if (v55)
      {
        if (!objc_msgSend(v55, "shouldShowCardUI"))
        {
          -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setMinimumCellHeight:", 44.0);
          +[PKPaymentPreferenceCardCell textOffset](PKPaymentPreferenceCardCell, "textOffset");
          objc_msgSend(v14, "setLeadingOffset:");
          objc_msgSend(v14, "textLabel");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "displayName");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setText:", v94);

          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48C8], 16.0));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v93;
          v96 = v93;
          v58 = v55;
          objc_msgSend(v96, "setFont:", v95);

          v124 = (void *)v57;
          v120 = a4 + 1;
          if ((objc_msgSend(v55, "isSelectable") & 1) != 0
            || (objc_msgSend(v55, "actionBlock"),
                v97 = (void *)objc_claimAutoreleasedReturnValue(),
                v97,
                v97))
          {
            objc_msgSend(v55, "actionBlock");
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            if (v98)
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v119;
              objc_msgSend(v119, "setTextColor:", v99);

            }
            else
            {
              v85 = v119;
              if (v126 == a4)
                objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, obj);
            }
            v90 = 0;
          }
          else
          {
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PAYMENT_APPLICATION_NOT_SUPPORTED"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v119;
          }
          objc_msgSend(v14, "detailTextLabel");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setText:", v90);
          goto LABEL_69;
        }
        v58 = v55;
      }
      else
      {
        v58 = 0;
      }
    }
    else
    {
      v57 = 0;
      v58 = 0;
      obj = v54;
    }
    -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
    v85 = (id)objc_claimAutoreleasedReturnValue();
    if (!self->_passSnapshotter)
    {
      +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
      v86 = (PKPassSnapshotter *)objc_claimAutoreleasedReturnValue();
      v87 = self->_passSnapshotter;
      self->_passSnapshotter = v86;

    }
    objc_msgSend(v85, "passSnapshotter");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v88)
      objc_msgSend(v85, "setPassSnapshotter:", self->_passSnapshotter);
    objc_msgSend(v85, "setAvailabilityString:", v57);
    v21 = obj;
    objc_msgSend(v85, "setPass:", obj);
    if (v126 == a4)
      objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, obj);
    v124 = (void *)v57;
    if (!objc_msgSend(v128, "count"))
    {
      v14 = v85;
      v92 = v129;
      goto LABEL_70;
    }
    v120 = a4 + 1;
    objc_msgSend(v128, "firstObject");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "localizedDescription");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "subtitleLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setText:", v90);
    v14 = v85;
LABEL_69:

    v92 = v129;
    v52 = v120;
    v21 = obj;
LABEL_70:

    if (objc_msgSend(v92, "count") <= v52)
    {
      v100 = 0;
    }
    else
    {
      objc_msgSend(v92, "objectAtIndex:", v52);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v100, "shouldShowCardUI") & 1) == 0
          && objc_msgSend(v100, "insetsSeparatorByTextOffset"))
        {
          +[PKPaymentPreferenceCardCell textOffset](PKPaymentPreferenceCardCell, "textOffset");
          v102 = v101;
LABEL_78:
          objc_msgSend(v14, "setSeparatorInset:", 0.0, v102, 0.0, 0.0);

LABEL_79:
          v20 = v129;
LABEL_80:
          v9 = v125;
          goto LABEL_81;
        }
      }
    }
    v102 = 0.0;
    goto LABEL_78;
  }
  -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v6, "objectAtIndex:", a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBankAccount:", v21);
LABEL_81:

LABEL_82:
  if (v9 == a4)
  {
    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v103, "startAnimating");
    objc_msgSend(v14, "setAccessoryType:", 0);
    objc_msgSend(v14, "setAccessoryView:", v103);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v14, "setAccessoryView:", 0);
      if (v126 == a4)
        v104 = 3;
      else
        v104 = 0;
      objc_msgSend(v14, "setAccessoryType:", v104);
    }
  }
  if ((objc_msgSend(v5, "isReadOnly") & 1) == 0 && objc_msgSend(v5, "supportsDeletion"))
  {
    objc_opt_class();
    v107 = 1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "contactKey");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v105, "isEqualToString:", *MEMORY[0x1E0C967F0]);

      if (!v106)
        v107 = 0;
    }
    objc_msgSend(v14, "setEditingAccessoryType:", v107);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v5, "contactKey"),
          v108 = (void *)objc_claimAutoreleasedReturnValue(),
          v109 = objc_msgSend(v108, "isEqualToString:", *MEMORY[0x1E0C966A8]),
          v108,
          v109))
    {
      objc_msgSend(v14, "textField");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v110;
      v112 = 1;
    }
    else
    {
      objc_msgSend(v14, "textField");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v110;
      v112 = 2;
    }
    objc_msgSend(v110, "setAutocorrectionType:", v112);

  }
  if (-[PKPaymentPreferencesViewController _isViewTranslucent](self, "_isViewTranslucent"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v113);

  }
  return v14;
}

- (id)_cellForNamePreference:(id)a3 row:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C97218];
  v11 = objc_alloc_init(MEMORY[0x1E0C97200]);
  v12 = objc_msgSend(v10, "nameOrderForContact:", v11);

  v13 = objc_msgSend(v6, "showPhoneticName");
  v14 = 1;
  if (v13)
    v14 = 2;
  if (v12 == 2)
    v15 = v14;
  else
    v15 = 0;
  if (v12 == 2)
    v16 = 0;
  else
    v16 = v14;
  if (v15 == a4)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_GIVENNAME_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "givenName");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16 != a4)
    {
      v17 = 0;
      v19 = 0;
      if (!v13)
        goto LABEL_21;
      goto LABEL_16;
    }
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_FAMILYNAME_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "familyName");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  if (!v13)
    goto LABEL_21;
LABEL_16:
  if (v15 + 1 == a4)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONETICGIVENNAME_TITLE"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "phoneticRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "givenName");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v23 = (void *)v22;
    v17 = (void *)v20;

    v19 = v23;
    goto LABEL_21;
  }
  if (v16 + 1 == a4)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONETICFAMILYNAME_TITLE"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "phoneticRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "familyName");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(v7, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v19);

  objc_msgSend(v7, "textField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPlaceholder:", v17);

  objc_msgSend(v7, "textField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  objc_msgSend(v7, "setAccessoryType:", 0);
  objc_msgSend(v7, "setEditingAccessoryType:", 0);

  return v7;
}

- (id)_cellOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;

  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)objc_msgSend([a3 alloc], "initWithReuseIdentifier:", v5);

  return v7;
}

- (void)setPreferences:(id)a3
{
  id v5;
  _QWORD block[5];

  objc_storeStrong((id *)&self->_latestPreferences, a3);
  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKPaymentPreferencesViewController_setPreferences___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__PKPaymentPreferencesViewController_setPreferences___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1056), *(id *)(*(_QWORD *)(a1 + 32) + 1024));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_preferences, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isReadOnly") & 1) == 0)
  {
    objc_msgSend(v4, "contactKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]);

    objc_msgSend(v4, "preferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9)
      v7 = v11 + 1;
    else
      v7 = v11 + 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "preferences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      v7 = v6 + objc_msgSend(v4, "supportsNullSelection");
LABEL_13:

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v4, "preferences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "count");
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "showPhoneticName"))
      v7 = 4;
    else
      v7 = 2;
  }
LABEL_14:

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  PKPaymentPreferenceButtonCell *sizingButtonCell;
  PKPaymentPreferenceButtonCell *v17;
  PKPaymentPreferenceButtonCell *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double Width;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGRect v32;
  CGRect v33;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (objc_msgSend(v7, "row") >= v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = objc_msgSend(v7, "row");
    objc_msgSend(v8, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 == v13)
      objc_msgSend(v8, "addNewTitle");
    else
      objc_msgSend(v8, "addExistingTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sizingButtonCell = self->_sizingButtonCell;
    if (!sizingButtonCell)
    {
      -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
      v17 = (PKPaymentPreferenceButtonCell *)objc_claimAutoreleasedReturnValue();
      v18 = self->_sizingButtonCell;
      self->_sizingButtonCell = v17;

      -[PKPaymentPreferenceButtonCell setShouldIndentWhileEditing:](self->_sizingButtonCell, "setShouldIndentWhileEditing:", 1);
      sizingButtonCell = self->_sizingButtonCell;
    }
    -[PKPaymentPreferenceButtonCell frame](sizingButtonCell, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v32);
    objc_msgSend(v6, "_sectionContentInset");
    v27 = Width - v26;
    objc_msgSend(v6, "_sectionContentInset");
    v29 = v27 - v28;
    -[PKPaymentPreferenceButtonCell setFrame:](self->_sizingButtonCell, "setFrame:", v20, v22, v29, v24);
    -[PKPaymentPreferenceButtonCell setButtonTitle:](self->_sizingButtonCell, "setButtonTitle:", v15);
    -[PKPaymentPreferenceButtonCell setEditing:animated:](self->_sizingButtonCell, "setEditing:animated:", objc_msgSend(v6, "isEditing"), 0);
    v33.origin.x = v20;
    v33.origin.y = v22;
    v33.size.width = v29;
    v33.size.height = v24;
    -[PKPaymentPreferenceButtonCell sizeThatFits:](self->_sizingButtonCell, "sizeThatFits:", CGRectGetWidth(v33), 1.79769313e308);
    v14 = fmax(v30, 56.0);

  }
  else
  {
    v14 = *MEMORY[0x1E0DC53D8];
  }

  return v14;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 56.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD aBlock[4];
  id v31;
  PKPaymentPreferencesViewController *v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferences");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)v10, "count");

  objc_opt_class();
  LOBYTE(v10) = objc_opt_isKindOfClass();
  v12 = objc_msgSend(v7, "row");
  if ((v10 & 1) != 0)
  {
    -[PKPaymentPreferencesViewController _cellForNamePreference:row:](self, "_cellForNamePreference:row:", v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_6;
  }
  if (v12 < v11)
  {
LABEL_4:
    -[PKPaymentPreferencesViewController _cellForPreference:row:](self, "_cellForPreference:row:", v9, objc_msgSend(v7, "row"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("ButtonCell"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "row");
      objc_msgSend(v9, "preferences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v17 == v19)
      {
        objc_msgSend(v9, "addNewTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setButtonTitle:", v20);

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke;
        aBlock[3] = &unk_1E3E63480;
        v31 = v9;
        v32 = self;
        v33 = v8;
        v21 = _Block_copy(aBlock);
        v22 = v31;
      }
      else
      {
        objc_msgSend(v9, "addExistingTitle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setButtonTitle:", v27);

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v28[3] = &unk_1E3E61388;
        v28[4] = self;
        v29 = v9;
        v21 = _Block_copy(v28);
        v22 = v29;
      }

      objc_msgSend(v14, "setHandler:", v21);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "supportsNullSelection"))
    {
      -[PKPaymentPreferencesViewController _cellOfClass:](self, "_cellOfClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v9, "selectedIndex");
      objc_msgSend(v14, "textLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("NONE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v25);

      if (v23 >= v11)
        v26 = 3;
      else
        v26 = 0;
      objc_msgSend(v14, "setAccessoryType:", v26);
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    v14 = 0;
  }
LABEL_6:
  if (-[PKPaymentPreferencesViewController _isViewTranslucent](self, "_isViewTranslucent"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(v14, "setOpaque:", 0);
  }
  objc_msgSend(v14, "setUserInteractionEnabled:", objc_msgSend(v9, "isReadOnly") ^ 1);

  return v14;
}

uint64_t __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "contactKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v4, "_showAddressPickerForPreference:", v5);
  else
    return objc_msgSend(v4, "_startInlineEditingForPreference:inSection:", v5, *(_QWORD *)(a1 + 48));
}

uint64_t __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showContactsPickerForPreference:", *(_QWORD *)(a1 + 40));
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v6, v8);

    if (objc_msgSend(v8, "accessoryType") == 3)
    {
      objc_msgSend(v8, "setAccessoryType:", 0);
      objc_msgSend(v8, "setAccessoryType:", 3);
    }
  }
  PKAuthorizationSeparatorColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSeparatorColor:", v7);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "footerLinkRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "footer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferencesViewController _hyperlinkFooterViewForPreference:](self, "_hyperlinkFooterViewForPreference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_hyperlinkFooterViewForPreference:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  PKFooterHyperlinkView *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "footer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "footerLinkRange");
  v7 = 0;
  if (v4)
  {
    v8 = v6;
    if (v6)
    {
      v9 = v5;
      v7 = objc_alloc_init(PKFooterHyperlinkView);
      PKAttributedStringByAddingLinkToRange(v4, v9, v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setAttributedText:](v7, "setAttributedText:", v10);

      objc_msgSend(v3, "footerLinkActionBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setAction:](v7, "setAction:", v11);

    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a4;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");
  objc_msgSend(v6, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= objc_msgSend(v8, "count") || (objc_msgSend(v6, "isReadOnly") & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "supportsDeletion");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v5, "row");
    objc_msgSend(v6, "preferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 >= objc_msgSend(v11, "count"))
    {

    }
    else
    {
      objc_msgSend(v6, "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "contactSource");

      if (v14 == 1)
        v9 = 0;
    }
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "supportsDeletion")
    || (objc_msgSend(v8, "isReadOnly") & 1) != 0
    || (v9 = objc_msgSend(v7, "row"),
        objc_msgSend(v8, "preferences"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9 >= v11))
  {
    v17 = 0;
    goto LABEL_9;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "preferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "contactSource");
    v16 = objc_msgSend(v8, "supportsInlineEditing");

    objc_initWeak(&location, self);
    if (v15 == 1)
    {
      if ((v16 & 1) != 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v16 = 0;
  }
  v19 = (void *)MEMORY[0x1E0DC36C8];
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_DELETE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v31[3] = &unk_1E3E7ACA8;
  objc_copyWeak(&v34, &location);
  v32 = v6;
  v33 = v7;
  objc_msgSend(v19, "contextualActionWithStyle:title:handler:", 1, v20, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v21);
  objc_destroyWeak(&v34);
  if ((v16 & 1) == 0)
  {
LABEL_12:
    v22 = (void *)MEMORY[0x1E0DC36C8];
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
    v28 = &unk_1E3E70500;
    objc_copyWeak(&v30, &location);
    v29 = v7;
    objc_msgSend(v22, "contextualActionWithStyle:title:handler:", 0, v23, &v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObject:", v24, v25, v26, v27, v28);
    objc_destroyWeak(&v30);
  }
LABEL_13:
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&location);
  }
  else
  {
    objc_destroyWeak(&location);
    v17 = 0;
  }

LABEL_9:
  return v17;
}

void __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView:commitEditingStyle:forRowAtIndexPath:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_editPreferenceAtIndexPath:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_editPreferenceAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v5 = a3;
  -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "supportsDeletion") && (objc_msgSend(v7, "isReadOnly") & 1) == 0)
  {
    v8 = objc_msgSend(v5, "row");
    objc_msgSend(v7, "preferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 >= v10)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v7, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v7, "contactKey"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = *MEMORY[0x1E0C967F0],
            v15 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C967F0]),
            v13,
            v15))
      {
        objc_msgSend(v7, "errorsForPreference:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        -[PKPaymentPreferencesViewController _requiredKeysForPreference:contact:](self, "_requiredKeysForPreference:contact:", v7, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "contactSource") == 1)
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __65__PKPaymentPreferencesViewController__editPreferenceAtIndexPath___block_invoke;
          v21[3] = &unk_1E3E69670;
          v21[4] = self;
          v22 = v5;
          v23 = v12;
          v24 = v7;
          v25 = v18;
          v26 = v17 != 0;
          -[PKPaymentPreferencesViewController _presentMeCardAlertControllerWithContact:contactKey:handler:](self, "_presentMeCardAlertControllerWithContact:contactKey:handler:", v23, v14, v21);

        }
        else
        {
          objc_storeStrong((id *)&self->_currentEditingIndexPath, a3);
          objc_msgSend(v7, "editExistingTitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v7, "errorsForPreference:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentPreferencesViewController _showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:](self, "_showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:", v12, v19, v18, 0, v20);

          }
          else
          {
            -[PKPaymentPreferencesViewController _showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:](self, "_showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:", v12, v19, v18, 0, 0);
          }

        }
      }
      else if (objc_msgSend(v7, "supportsInlineEditing"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((-[PKPaymentPreferencesViewController isEditing](self, "isEditing") & 1) == 0)
            -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
          objc_msgSend(v6, "showTextField:", 1);
        }
      }
    }

  }
}

void __65__PKPaymentPreferencesViewController__editPreferenceAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 984), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "editExistingTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 56), "errorsForPreference:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:", v3, v6, v4, 0, v5);

  }
  else
  {
    objc_msgSend(v2, "_showAddressEditorForContact:title:requiredKeys:highlightedKeys:errors:", v3, v6, *(_QWORD *)(a1 + 64), 0, 0);
  }

}

- (void)_showAddressEditorForContact:(id)a3 title:(id)a4 requiredKeys:(id)a5 highlightedKeys:(id)a6 errors:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKBlurredContainerNavigationController *v17;
  void *v18;
  uint64_t v19;
  PKAddressEditorViewController *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v20 = -[PKAddressEditorViewController initWithContact:requiredKeys:highlightedKeys:errors:style:]([PKAddressEditorViewController alloc], "initWithContact:requiredKeys:highlightedKeys:errors:style:", v16, v14, v13, v12, self->_style);

  -[PKAddressEditorViewController setDelegate:](v20, "setDelegate:", self);
  -[PKAddressEditorViewController setTitle:](v20, "setTitle:", v15);

  -[PKAddressEditorViewController setContactFormatValidator:](v20, "setContactFormatValidator:", self->_contactFormatValidator);
  v17 = -[PKBlurredContainerNavigationController initWithRootViewController:]([PKBlurredContainerNavigationController alloc], "initWithRootViewController:", v20);
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v18, v17);

  }
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    if ((self->_style & 0xFFFFFFFFFFFFFFFBLL) != 0)
      v19 = 2;
    else
      v19 = 6;
    -[PKBlurredContainerNavigationController setModalPresentationStyle:](v17, "setModalPresentationStyle:", v19);
  }
  -[PKPaymentPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  -[UITableView setEditing:](self->_tableView, "setEditing:", 0);

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v9, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4 != 1)
    goto LABEL_19;
  objc_msgSend(v10, "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v9, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_19;
  objc_msgSend(v11, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v16 = objc_msgSend(v11, "selectedIndex");
  if (v16 >= objc_msgSend(v15, "count"))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v11, "selectedIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v17;
    v18 = v11;
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v9, "row"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recentContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deleteRecent:", v21);

    objc_msgSend(v18, "contactKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C967F0]) && !objc_msgSend(v18, "type"))
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deleteDefaultBillingAddress:", v19);
    }
    else
    {
      if (objc_msgSend(v19, "contactSource") != 2)
      {
LABEL_13:

        v17 = v27;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deleteDefaultForContactKey:", v22);
    }

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(v8, "beginUpdates");
  objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v9, "row"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v24);

  objc_msgSend(v11, "setPreferences:", v15);
  if (v17)
    objc_msgSend(v11, "setSelectedIndex:", objc_msgSend(v15, "indexOfObject:", v17));
  v28[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v25, 100);

  objc_msgSend(v8, "endUpdates");
  -[PKPaymentPreferencesViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
  handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler)
    handler[2](handler, self, self->_preferences);

LABEL_19:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isReadOnly") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v9 = objc_msgSend(v5, "row"),
          objc_msgSend(v6, "preferences"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v9 < v11))
    {
      objc_msgSend(v6, "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = objc_msgSend(v13, "isSelectable");
      else
        v7 = 1;

    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
  if (!objc_msgSend(v16, "isEditing"))
  {
    objc_msgSend(v7, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "row");
    if (v9 >= objc_msgSend(v8, "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v10, "actionBlock"), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      (*(void (**)(void))(v11 + 16))();

    }
    else if (self->_handler)
    {
      v13 = objc_msgSend(v6, "row");
      if (v13 != objc_msgSend(v7, "selectedIndex"))
      {
        objc_msgSend(v7, "setSelectedIndex:", objc_msgSend(v6, "row"));
        objc_msgSend(v16, "reloadData");
        (*((void (**)(void))self->_handler + 2))();
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend(v7, "errorsForPreference:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isReadOnly") & 1) == 0 && v15)
      -[PKPaymentPreferencesViewController _editPreferenceAtIndexPath:](self, "_editPreferenceAtIndexPath:", v6);
    goto LABEL_16;
  }
  -[PKPaymentPreferencesViewController _editPreferenceAtIndexPath:](self, "_editPreferenceAtIndexPath:", v6);
LABEL_17:

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a5;
  v8 = -[NSArray count](self->_preferences, "count");
  if (v8 > objc_msgSend(v7, "section"))
  {
    -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", objc_msgSend(v7, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_currentEditingField && objc_msgSend(v9, "supportsInlineEditing"))
    {
      -[UITextField center](self->_currentEditingField, "center");
      v12 = v11;
      v14 = v13;
      -[UITextField superview](self->_currentEditingField, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertPoint:fromView:", v15, v12, v14);
      objc_msgSend(v17, "indexPathForRowAtPoint:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isEqual:", v16))
        -[UITextField resignFirstResponder](self->_currentEditingField, "resignFirstResponder");

    }
  }

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_storeStrong((id *)&self->_currentEditingField, a3);
  -[PKPaymentPreferencesViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_compactNavigationContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPreferencesViewController _shouldUpdatePreferredContentSize](self, "_shouldUpdatePreferredContentSize"))
  {
    if (v6)
    {
      objc_msgSend(v6, "modalPresentationSize");
      v8 = v7;
      v10 = v9;
    }
    else
    {
      objc_msgSend(v5, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v8 = v12;
      v10 = v13;

    }
    -[PKPaymentPreferencesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);
  }
  -[UITextField text](self->_currentEditingField, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
    -[PKPaymentPreferencesViewController _checkFormatOfTextField:forBeginEditing:](self, "_checkFormatOfTextField:forBeginEditing:", v16, 1);

}

- (void)textDidChange:(id)a3
{
  -[PKPaymentPreferencesViewController _checkFormatOfTextField:forBeginEditing:](self, "_checkFormatOfTextField:forBeginEditing:", a3, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPaymentPreferencesViewController _updateContactAndForceSelection:](self, "_updateContactAndForceSelection:", 1);
  -[PKPaymentPreferencesViewController hideTextField:](self, "hideTextField:", v4);

  -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPaymentPreferencesViewController _updateContactAndForceSelection:](self, "_updateContactAndForceSelection:", 1);
  -[PKPaymentPreferencesViewController hideTextField:](self, "hideTextField:", v4);

  self->_isEditingFieldThatWasOriginallyInvalid = 0;
}

- (void)hideTextField:(id)a3
{
  UITableView *tableView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  tableView = self->_tableView;
  v5 = a3;
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v10, v7, v9);
  -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "showTextField:", 0);

}

- (void)_checkFormatOfTextField:(id)a3 forBeginEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char isKindOfClass;
  id v8;
  UITableView *tableView;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a4;
  v6 = a3;
  if (v4 || self->_isEditingFieldThatWasOriginallyInvalid)
  {
    v30 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v30;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = v30;
      tableView = self->_tableView;
      objc_msgSend(v8, "center");
      v11 = v10;
      v13 = v12;
      objc_msgSend(v8, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v14, v11, v13);
      -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_currentEditingField)
        v16 = v15 == 0;
      else
        v16 = 1;
      if (!v16)
      {
        v17 = objc_msgSend(v15, "section");
        v18 = objc_msgSend(v15, "row");
        -[NSArray objectAtIndexedSubscript:](self->_preferences, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "preferences");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v18 < v21)
          {
            objc_msgSend(v19, "contactKey");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "text");
            v23 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C967C0]))
            {
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v23, v23);
              v25 = objc_alloc(MEMORY[0x1E0C97398]);
              objc_msgSend(v24, "digits");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v25, "initWithStringValue:", v26);

              v28 = -[PKContactFormatValidator phoneNumberIsValid:forCountryCode:](self->_contactFormatValidator, "phoneNumberIsValid:forCountryCode:", v27, 0) ^ 1;
              objc_msgSend(v8, "setIsInvalid:", v28);

            }
            else if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C966A8], v23))
            {
              v28 = -[PKContactFormatValidator emailAddressIsValid:](self->_contactFormatValidator, "emailAddressIsValid:", v23) ^ 1;
              objc_msgSend(v8, "setIsInvalid:", v28);
            }
            else
            {
              LOBYTE(v28) = 0;
            }
            if (v4)
              self->_isEditingFieldThatWasOriginallyInvalid = v28;

          }
        }

      }
      v6 = v30;
    }
  }

}

- (void)_updateContactAndForceSelection:(BOOL)a3
{
  UITableView *tableView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UITextField *currentEditingField;
  id v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void (**v73)(_QWORD);
  void *v74;
  UITableView *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _QWORD aBlock[5];
  id v90;
  id v91;
  id v92;
  id v93;
  unint64_t v94;
  unint64_t v95;
  BOOL v96;
  void *v97;
  void *v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  tableView = self->_tableView;
  -[UITextField center](self->_currentEditingField, "center");
  v7 = v6;
  v9 = v8;
  -[UITextField superview](self->_currentEditingField, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v10, v7, v9);
  -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_currentEditingField)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = objc_msgSend(v11, "section");
    v14 = objc_msgSend(v11, "row");
    if (v13 < -[NSArray count](self->_preferences, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_preferences, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField text](self->_currentEditingField, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      currentEditingField = self->_currentEditingField;
      self->_currentEditingField = 0;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_63;
        objc_msgSend(v15, "preferences");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v14;
        v33 = objc_msgSend(v32, "count");

        if (v87 >= v33)
          goto LABEL_63;
        v34 = v15;
        objc_msgSend(v34, "contactKey");
        v81 = v34;
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "preferences");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v87);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)objc_msgSend(v36, "mutableCopy");
        v84 = v15;
        if (objc_msgSend(v16, "length"))
        {
          v80 = v37;
          if (objc_msgSend(v83, "isEqualToString:", *MEMORY[0x1E0C966A8]))
          {
            objc_msgSend(v36, "emailAddresses");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "firstObject");
            v78 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v16);
            v40 = v39;
            if (v39)
            {
              objc_msgSend(v39, "stringValue");
              v41 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v41;
            }
            v42 = v16;

            v85 = v42;
            v43 = (uint64_t)v42;
            v44 = (void *)v78;
          }
          else
          {
            v85 = v16;
            if (objc_msgSend(v83, "isEqualToString:", *MEMORY[0x1E0C967C0]))
            {
              objc_msgSend(v36, "phoneNumbers");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "firstObject");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v16);
              v43 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v43 = 0;
              v44 = 0;
            }
          }
          v66 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v44, "label", v78);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)v43;
          objc_msgSend(v66, "labeledValueWithLabel:value:", v67, v43);
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = v44;
          v70 = (void *)v68;

          v98 = v70;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v80;
          v54 = v83;
          objc_msgSend(v80, "setValue:forKey:", v71, v83);

        }
        else
        {
          v85 = v16;
          v54 = v83;
          objc_msgSend(v37, "setValue:forKey:", MEMORY[0x1E0C9AA60], v83);
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__PKPaymentPreferencesViewController__updateContactAndForceSelection___block_invoke;
        aBlock[3] = &unk_1E3E7ACD0;
        aBlock[4] = self;
        v57 = v37;
        v90 = v57;
        v72 = v54;
        v91 = v72;
        v96 = a3;
        v92 = v81;
        v93 = v92;
        v94 = v87;
        v95 = v13;
        v73 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (objc_msgSend(v36, "contactSource") == 1)
        {
          if (objc_msgSend(v36, "contactSource") == 1 && objc_msgSend(v85, "length"))
          {
            v74 = (void *)objc_msgSend(v73, "copy");
            -[PKPaymentPreferencesViewController _presentMeCardAlertControllerWithContact:contactKey:handler:](self, "_presentMeCardAlertControllerWithContact:contactKey:handler:", v36, v72, v74);

          }
          else
          {
            v75 = self->_tableView;
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v87, v13);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v76;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v75, "reloadRowsAtIndexPaths:withRowAnimation:", v77, 100);

          }
        }
        else
        {
          v73[2](v73);
        }

        v26 = v72;
LABEL_62:

        v15 = v84;
        v16 = v85;
LABEL_63:

        goto LABEL_64;
      }
      v85 = v16;
      v86 = v14;
      v84 = v15;
      v18 = v15;
      v19 = objc_msgSend(v18, "showPhoneticName");
      v20 = (void *)MEMORY[0x1E0C97218];
      v21 = objc_alloc_init(MEMORY[0x1E0C97200]);
      v22 = objc_msgSend(v20, "nameOrderForContact:", v21);

      v82 = v19;
      v23 = 1;
      if (v19)
        v23 = 2;
      if (v22 == 2)
        v24 = 0;
      else
        v24 = v23;
      if (v22 == 2)
        v25 = v23;
      else
        v25 = 0;
      v26 = v18;
      objc_msgSend(v18, "preferences");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      v45 = v31;

      v46 = v45;
      objc_msgSend(v45, "phoneticRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "copy");
      v49 = v48;
      if (v48)
        v50 = v48;
      else
        v50 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      v51 = v50;

      v52 = v46;
      if (v86 == v25)
      {
        objc_msgSend(v46, "setGivenName:", v85);
      }
      else if (v86 == v24)
      {
        objc_msgSend(v46, "setFamilyName:", v85);
      }
      else if (v82)
      {
        if (v86 == v25 + 1)
        {
          v53 = v51;
          objc_msgSend(v51, "setGivenName:", v85);
        }
        else
        {
          v12 = v86 == v24 + 1;
          v53 = v51;
          if (v12)
            objc_msgSend(v51, "setFamilyName:", v85);
        }
        v52 = v46;
        objc_msgSend(v46, "setPhoneticRepresentation:", v53);
      }
      objc_msgSend(v52, "givenName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v52;
      v57 = v51;
      if (!objc_msgSend(v56, "length"))
      {
        v58 = v26;
        objc_msgSend(v52, "familyName");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v59, "length"))
        {
          objc_msgSend(v57, "givenName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v60, "length"))
          {
            objc_msgSend(v57, "familyName");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v65, "length");

            v26 = v58;
            if (!v88)
            {
              objc_msgSend(v58, "setPreferences:", 0);
              v62 = v58;
              v63 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_49:
              objc_msgSend(v62, "setSelectedIndex:", v63);
              handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
              if (handler)
                handler[2](handler, self, self->_preferences);
              goto LABEL_62;
            }
LABEL_48:
            v99[0] = v36;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setPreferences:", v61);

            v62 = v26;
            v63 = 0;
            goto LABEL_49;
          }

        }
        v26 = v58;
      }

      goto LABEL_48;
    }
  }
LABEL_64:

}

void __70__PKPaymentPreferencesViewController__updateContactAndForceSelection___block_invoke(uint64_t a1)
{
  int v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_saveUpdatedContact:contactKey:preference:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  if (*(_BYTE *)(a1 + 88))
  {
    v3 = objc_msgSend(*(id *)(a1 + 56), "selectedIndex");
    objc_msgSend(*(id *)(a1 + 56), "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 >= v5)
    {
      if (*(_QWORD *)(a1 + 72) < v5)
        objc_msgSend(*(id *)(a1 + 64), "setSelectedIndex:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "preferences");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "errorsForPreference:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 && *(_QWORD *)(a1 + 72) < v5)
        objc_msgSend(*(id *)(a1 + 64), "setSelectedIndex:");

    }
  }
  v11 = *(_QWORD **)(a1 + 32);
  v12 = v11[135];
  if (v12)
  {
    (*(void (**)(uint64_t, _QWORD *, _QWORD))(v12 + 16))(v12, v11, v11[132]);
    v11 = *(_QWORD **)(a1 + 32);
  }
  v13 = (void *)v11[134];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 100);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 80));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadSections:withRowAnimation:");

  }
}

- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
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
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setContactSource:", objc_msgSend(v14, "contactSource"));
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967F0]) && !objc_msgSend(v13, "type"))
  {
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultBillingAddressForPaymentPass:", self->_currentlySelectedPaymentPass);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v13, "preferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (!v14)
    goto LABEL_20;
  if (objc_msgSend(v14, "contactSource") != 1)
  {
    if (objc_msgSend(v14, "contactSource") == 2
      || (!objc_msgSend(v14, "contactSource") || objc_msgSend(v14, "contactSource") == 4)
      && v16
      && objc_msgSend(v16, "isEqualIgnoringIdentifiers:", v14))
    {
      objc_msgSend(v14, "recentContact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0D67000uLL;
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "recentContact");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deleteRecent:", v22);

        v20 = 0x1E0D67000;
      }
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C966A8]))
      {
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDefaultContactEmail:", v10);
      }
      else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967C0]))
      {
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDefaultContactPhone:", v10);
      }
      else
      {
        v33 = objc_msgSend(v13, "type");
        objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v34;
        if (v33 == 1)
          objc_msgSend(v34, "setDefaultShippingAddress:", v10);
        else
          objc_msgSend(v34, "setDefaultBillingAddress:forPaymentPass:", v10, self->_currentlySelectedPaymentPass);
        v20 = 0x1E0D67000uLL;
      }

      objc_msgSend(*(id *)(v20 + 448), "defaultInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "saveContactToCoreRecents:preference:", v10, v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setRecentContact:", v36);
      objc_msgSend(v18, "replaceObjectAtIndex:withObject:", a6, v10);

      goto LABEL_37;
    }
LABEL_20:
    objc_msgSend(v14, "recentContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recentContact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deleteRecent:", v26);

    }
    objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "saveContactToCoreRecents:preference:", v10, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setContactSource:", 3);
    objc_msgSend(v10, "setRecentContact:", v28);
    if (v14)
      objc_msgSend(v18, "replaceObjectAtIndex:withObject:", a6, v10);
    else
      objc_msgSend(v18, "insertObject:atIndex:", v10, 0);

    goto LABEL_37;
  }
  if ((PKUpdateMeContact() & 1) != 0)
  {
    objc_msgSend(v18, "replaceObjectAtIndex:withObject:", a6, v10);
LABEL_37:
    v32 = 1;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "saveContactToCoreRecents:preference:", v10, v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setRecentContact:", v31);
  objc_msgSend(v10, "setContactSource:", 3);
  objc_msgSend(v18, "addObject:", v10);
  if (objc_msgSend(v13, "selectedIndex") == a6)
    objc_msgSend(v13, "setSelectedIndex:", objc_msgSend(v18, "indexOfObject:", v10));

  v32 = 0;
LABEL_38:
  v37 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v13, "setPreferences:", v37);

  return v32;
}

- (void)_savePickedContact:(id)a3 inPreference:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  v7 = objc_msgSend(v11, "indexOfContact:", v6);
  objc_msgSend(v11, "contactKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferencesViewController _saveUpdatedContact:contactKey:preference:atIndex:](self, "_saveUpdatedContact:contactKey:preference:atIndex:", v6, v8, v11, v7);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "setSelectedIndex:", 0);
  handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler)
    handler[2](handler, self, self->_preferences);
  -[PKPaymentPreferencesViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
  -[PKPaymentPreferencesViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (void)_presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v9 = CFSTR("EMAIL");
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v9 = CFSTR("PHONE");
  }
  else
  {
    v9 = CFSTR("ADDRESS");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_%@_NO_LABEL"), v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_CHANGE_%@"), v9);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __98__PKPaymentPreferencesViewController__presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke;
  v23[3] = &unk_1E3E61CA8;
  v24 = v8;
  v18 = v8;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 2, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v22);

  -[PKPaymentPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __98__PKPaymentPreferencesViewController__presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showAddressPickerForPreference:(id)a3
{
  NSString *v4;
  PKAddressSearcherViewController *v5;
  void *v6;
  void *v7;
  PKBlurredContainerNavigationController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_msgSend(v11, "addNewTitle");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKAddressSearcherViewController initWithStyle:]([PKAddressSearcherViewController alloc], "initWithStyle:", self->_style);
    -[PKPaymentPreferencesViewController _requiredKeysForPreference:contact:](self, "_requiredKeysForPreference:contact:", v11, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressSearcherViewController setRequiredKeys:](v5, "setRequiredKeys:", v6);

    PKLocalizedPaymentString(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressSearcherViewController setTitle:](v5, "setTitle:", v7);

    -[PKAddressSearcherViewController setDelegate:](v5, "setDelegate:", self);
    -[PKAddressSearcherViewController setContactFormatValidator:](v5, "setContactFormatValidator:", self->_contactFormatValidator);
    v8 = -[PKBlurredContainerNavigationController initWithRootViewController:]([PKBlurredContainerNavigationController alloc], "initWithRootViewController:", v5);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      if ((self->_style | 4) == 4)
      {
        -[PKBlurredContainerNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 6);
      }
      else
      {
        -[PKBlurredContainerNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
        objc_msgSend(MEMORY[0x1E0DC3F20], "defaultFormSheetSize");
        -[PKBlurredContainerNavigationController setPreferredContentSize:](v8, "setPreferredContentSize:");
      }
    }
    if (self->_style == 2)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKAppearanceApplyToContainer(v9, v8);

    }
    PKLocalizedPaymentString(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBlurredContainerNavigationController setTitle:](v8, "setTitle:", v10);

    -[PKPaymentPreferencesViewController _setContactHandlersForPreference:](self, "_setContactHandlersForPreference:", v11);
    -[PKPaymentPreferencesViewController setEditing:](self, "setEditing:", 0);
    -[PKPaymentPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_showContactsPickerForPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_msgSend(v4, "contactKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(getCNContactPickerViewControllerClass_1());
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      if ((self->_style & 0xFFFFFFFFFFFFFFFBLL) != 0)
        v7 = 2;
      else
        v7 = 6;
      objc_msgSend(v6, "setModalPresentationStyle:", v7);
    }
    objc_msgSend(v6, "setDelegate:", self);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayedPropertyKeys:", v8);

    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
    {
      v9 = CFSTR("emailAddresses.@count = 1");
      v10 = CFSTR("emailAddresses.@count > 0");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) != 0)
    {
      v9 = CFSTR("postalAddresses.@count = 1");
      v10 = CFSTR("postalAddresses.@count > 0");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967C0]))
      {
LABEL_14:
        -[PKPaymentPreferencesViewController _setContactHandlersForPreference:](self, "_setContactHandlersForPreference:", v4);
        -[PKPaymentPreferencesViewController setEditing:](self, "setEditing:", 0);
        -[PKPaymentPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

        goto LABEL_15;
      }
      v9 = CFSTR("phoneNumbers.@count = 1");
      v10 = CFSTR("phoneNumbers.@count > 0");
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicateForEnablingContact:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicateForSelectionOfContact:", v12);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)_setContactHandlersForPreference:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke;
  v9[3] = &unk_1E3E7AD20;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  -[PKPaymentPreferencesViewController setPickedContactHandler:](self, "setPickedContactHandler:", v9);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_3;
  v6[3] = &unk_1E3E7AD48;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  -[PKPaymentPreferencesViewController setPickedContactPropertyHandler:](self, "setPickedContactPropertyHandler:", v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_2;
  block[3] = &unk_1E3E7ACF8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v6 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v6, "_savePickedContact:inPreference:", v3, v5);

    WeakRetained = v6;
  }

}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_4;
  block[3] = &unk_1E3E7ACF8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_4(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(a1[4], "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledValueWithLabel:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, v9);

  if (v7 && WeakRetained)
  {
    v10 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "_savePickedContact:inPreference:", v7, v10);

  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void (**pickedContactHandler)(id, id, id);
  id v6;

  pickedContactHandler = (void (**)(id, id, id))self->_pickedContactHandler;
  if (pickedContactHandler)
  {
    pickedContactHandler[2](pickedContactHandler, a4, a3);
    v6 = self->_pickedContactHandler;
    self->_pickedContactHandler = 0;

    JUMPOUT(0x1A1AE3A74);
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void (**pickedContactPropertyHandler)(id, id, id);
  id v6;
  id pickedContactHandler;

  pickedContactPropertyHandler = (void (**)(id, id, id))self->_pickedContactPropertyHandler;
  if (pickedContactPropertyHandler)
  {
    pickedContactPropertyHandler[2](pickedContactPropertyHandler, a4, a3);
    v6 = self->_pickedContactPropertyHandler;
    self->_pickedContactPropertyHandler = 0;

    pickedContactHandler = self->_pickedContactHandler;
    self->_pickedContactHandler = 0;

  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id pickedContactPropertyHandler;
  id pickedContactHandler;

  pickedContactPropertyHandler = self->_pickedContactPropertyHandler;
  self->_pickedContactPropertyHandler = 0;

  pickedContactHandler = self->_pickedContactHandler;
  self->_pickedContactHandler = 0;

}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  void (**pickedContactHandler)(id, id, id);
  id v6;

  pickedContactHandler = (void (**)(id, id, id))self->_pickedContactHandler;
  if (pickedContactHandler)
  {
    pickedContactHandler[2](pickedContactHandler, a4, a3);
    v6 = self->_pickedContactHandler;
    self->_pickedContactHandler = 0;

    -[PKPaymentPreferencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    JUMPOUT(0x1A1AE3A74);
  }
}

- (void)addressSearcherViewControllerDidCancel:(id)a3
{
  -[PKPaymentPreferencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  id v5;
  NSIndexPath *currentEditingIndexPath;
  uint64_t v7;
  NSInteger v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void (**handler)(id, PKPaymentPreferencesViewController *, NSArray *);
  UITableView *tableView;
  void *v15;
  void *v16;
  NSIndexPath *v17;
  _QWORD v18[5];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  currentEditingIndexPath = self->_currentEditingIndexPath;
  if (currentEditingIndexPath)
  {
    v7 = -[NSIndexPath row](currentEditingIndexPath, "row");
    v8 = -[NSIndexPath section](self->_currentEditingIndexPath, "section");
    -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "supportsDeletion"))
    {
      if ((objc_msgSend(v9, "isReadOnly") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[PKPaymentPreferencesViewController _saveUpdatedContact:contactKey:preference:atIndex:](self, "_saveUpdatedContact:contactKey:preference:atIndex:", v5, *MEMORY[0x1E0C967F0], v9, v7);
            handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
            if (handler)
              handler[2](handler, self, self->_preferences);
            tableView = self->_tableView;
            if (v12)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, v8);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v19[0] = v15;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v16, 100);

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v8);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v15, 5);
            }

          }
        }
      }
    }
    v17 = self->_currentEditingIndexPath;
    self->_currentEditingIndexPath = 0;

  }
  -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__PKPaymentPreferencesViewController_addressEditorViewController_selectedContact___block_invoke;
  v18[3] = &unk_1E3E612E8;
  v18[4] = self;
  -[PKPaymentPreferencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v18);

}

uint64_t __82__PKPaymentPreferencesViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  -[PKPaymentPreferencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PKPaymentPreferencesViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[PKPaymentPreferencesViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (BOOL)_isPaymentStyle
{
  return (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (id)_requiredKeysForPreference:(id)a3 contact:(id)a4
{
  id v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "contactKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967F0]);

    if (v7)
    {
      v8 = *MEMORY[0x1E0C970C8];
      v13[0] = *MEMORY[0x1E0D69BD8];
      v13[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      if (objc_msgSend(v5, "showPhoneticName"))
        objc_msgSend(v10, "addObject:", *MEMORY[0x1E0D69BE8]);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (int64_t)style
{
  return self->_style;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (id)pickedContactPropertyHandler
{
  return self->_pickedContactPropertyHandler;
}

- (void)setPickedContactPropertyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (id)pickedContactHandler
{
  return self->_pickedContactHandler;
}

- (void)setPickedContactHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pickedContactHandler, 0);
  objc_storeStrong(&self->_pickedContactPropertyHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_latestPreferences, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountPaymentSwitch, 0);
  objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, 0);
  objc_storeStrong((id *)&self->_paymentPassForBillingErrors, 0);
  objc_storeStrong((id *)&self->_sizingButtonCell, 0);
  objc_storeStrong((id *)&self->_currentEditingIndexPath, 0);
  objc_storeStrong((id *)&self->_currentEditingField, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
}

@end
