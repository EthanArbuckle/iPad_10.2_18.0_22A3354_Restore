@implementation TKToneClassicsTableViewController

- (TKToneClassicsTableViewController)initWithClassicTonesHeaderItem:(id)a3
{
  id v5;
  TKToneClassicsTableViewController *v6;
  TKToneClassicsTableViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TKToneClassicsTableViewController;
  v6 = -[TKToneClassicsTableViewController initWithStyle:](&v10, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classicTonesHeaderItem, a3);
    TLLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKToneClassicsTableViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tonePickerTableViewControllerWillBeDeallocated:", self);

  v4.receiver = self;
  v4.super_class = (Class)TKToneClassicsTableViewController;
  -[TKToneClassicsTableViewController dealloc](&v4, sel_dealloc);
}

- (void)setTonePickerTableViewControllerHelper:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  int v8;
  TKToneClassicsTableViewController *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tonePickerTableViewControllerHelper);
  objc_storeWeak((id *)&self->_tonePickerTableViewControllerHelper, v4);
  if (-[TKToneClassicsTableViewController isViewLoaded](self, "isViewLoaded")
    && (v4 != 0) == (WeakRetained == 0))
  {
    TLLogToneManagement();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543874;
      v9 = self;
      v10 = 2114;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_2157C4000, v6, OS_LOG_TYPE_DEFAULT, "The tonePickerTableViewControllerHelper property of %{public}@ is being updated from %{public}@ to %{public}@. Reloading table view.", (uint8_t *)&v8, 0x20u);
    }

    -[TKToneClassicsTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)didReloadTones
{
  id v3;

  if (-[TKToneClassicsTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[TKToneClassicsTableViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD15D8];
  v7 = a4;
  objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(v7, "classicToneIndex"), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TKToneClassicsTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateCell:withCheckedStatus:forTonePickerItem:", v9, v4, v7);

}

- (void)didUpdateDetailText:(id)a3 ofToneClassicsPickerItem:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDD15D8];
  v7 = a3;
  objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(a4, "classicToneIndex"), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TKToneClassicsTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateCell:withDetailText:", v9, v7);

}

- (void)loadView
{
  id v3;

  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadViewForTonePickerTableViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKToneClassicsTableViewController;
  -[TKToneClassicsTableViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  -[TKToneClassicsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lineHeight");
    objc_msgSend(v5, "setEstimatedRowHeight:", ceil(v7 + v7));

    objc_msgSend(v5, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  }
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedTonePickerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v10, "parentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "section");
    if (v12 == -[TKPickerItem section](self->_classicTonesHeaderItem, "section"))
    {
      v13 = objc_msgSend(v11, "row");
      if (v13 == -[TKPickerRowItem row](self->_classicTonesHeaderItem, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "classicToneIndex"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKToneClassicsTableViewController tableView](self, "tableView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scrollToRowAtIndexPath:atScrollPosition:animated:", v14, 2, v3);

      }
    }

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TKToneClassicsTableViewController;
  -[TKToneClassicsTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tonePickerTableViewWillDisappear:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "cellForRowAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", objc_msgSend(v10, "row"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tableView:updateCell:withSeparatorForPickerRowItem:", v4, v11, v12);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)separatorColorDidChangeInTonePickerTableView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDividerContentColorToMatchSeparatorColorInTableView:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[TKTonePickerItem numberOfChildren](self->_classicTonesHeaderItem, "numberOfChildren");
  else
    v6 = 0;

  return v6;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  int v54;
  TKToneClassicsTableViewController *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    TLLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m");
      v11 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v11, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        v56 = 2113;
        v57 = v13;
        v58 = 2049;
        v59 = 183;
        v60 = 2113;
        v61 = v14;
        _os_log_impl(&dword_2157C4000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.1(v11, v15, v16, v17, v18, v19, v20, v21);
    }

    TLLogGeneral();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.4();

  }
  -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", objc_msgSend(v7, "row"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    TLLogGeneral();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

    if (v25)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m");
      v26 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v26, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        v56 = 2113;
        v57 = v28;
        v58 = 2049;
        v59 = 185;
        v60 = 2113;
        v61 = v29;
        _os_log_impl(&dword_2157C4000, v27, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.1(v26, v30, v31, v32, v33, v34, v35, v36);
    }

    TLLogGeneral();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.2();

  }
  objc_msgSend(v8, "tableView:cellForPickerRowItem:", v6, v23);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    TLLogGeneral();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

    if (v40)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m");
      v41 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v41, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        v56 = 2113;
        v57 = v43;
        v58 = 2049;
        v59 = 187;
        v60 = 2113;
        v61 = v44;
        _os_log_impl(&dword_2157C4000, v42, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.1(v41, v45, v46, v47, v48, v49, v50, v51);
    }

    TLLogGeneral();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v54 = 138543874;
      v55 = self;
      v56 = 2114;
      v57 = v7;
      v58 = 2114;
      v59 = (uint64_t)v23;
      _os_log_error_impl(&dword_2157C4000, v52, OS_LOG_TYPE_ERROR, "%{public}@ is about to return a nil cell for row at index path %{public}@ with toneClassicsPickerItem = %{public}@.", (uint8_t *)&v54, 0x20u);
    }

  }
  return v38;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  TKTonePickerItem *classicTonesHeaderItem;
  uint64_t v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  classicTonesHeaderItem = self->_classicTonesHeaderItem;
  v12 = objc_msgSend(v8, "row");

  -[TKTonePickerItem childItemAtIndex:](classicTonesHeaderItem, "childItemAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableView:willDisplayCell:forPickerRowItem:", v10, v9, v13);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TKToneClassicsTableViewController tonePickerTableViewControllerHelper](self, "tonePickerTableViewControllerHelper");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView:didSelectRowAtIndexPath:forPickerRowItem:", v7, v6, v8);

}

- (TKTonePickerTableViewControllerHelper)tonePickerTableViewControllerHelper
{
  return (TKTonePickerTableViewControllerHelper *)objc_loadWeakRetained((id *)&self->_tonePickerTableViewControllerHelper);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tonePickerTableViewControllerHelper);
  objc_storeStrong((id *)&self->_classicTonesHeaderItem, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)tableView:(uint64_t)a3 cellForRowAtIndexPath:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2157C4000, a1, a3, "*** Assertion failure.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2157C4000, v0, v1, "%{public}@ unexpectedly found a nil toneClassicsPickerItem while generating cell for row at index path %{public}@.");
}

- (void)tableView:cellForRowAtIndexPath:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2157C4000, v0, v1, "The tonePickerTableViewControllerHelper of %{public}@ was unexpectedly nil when UITableView requested the cell for row at index path %{public}@.");
}

@end
