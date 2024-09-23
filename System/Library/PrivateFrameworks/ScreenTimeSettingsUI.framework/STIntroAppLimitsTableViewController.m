@implementation STIntroAppLimitsTableViewController

- (STIntroAppLimitsTableViewController)initWithStyle:(int64_t)a3
{
  STIntroAppLimitsTableViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  v3 = -[STIntroAppLimitsTableViewController initWithStyle:](&v5, sel_initWithStyle_, a3);
  -[STIntroAppLimitsTableViewController _stIntroAppLimitsTableViewControllerCommonInit](v3, "_stIntroAppLimitsTableViewControllerCommonInit");
  return v3;
}

- (STIntroAppLimitsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  STIntroAppLimitsTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STIntroAppLimitsTableViewController;
  v4 = -[STIntroAppLimitsTableViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[STIntroAppLimitsTableViewController _stIntroAppLimitsTableViewControllerCommonInit](v4, "_stIntroAppLimitsTableViewControllerCommonInit");
  return v4;
}

- (STIntroAppLimitsTableViewController)initWithCoder:(id)a3
{
  STIntroAppLimitsTableViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  v3 = -[STIntroAppLimitsTableViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STIntroAppLimitsTableViewController _stIntroAppLimitsTableViewControllerCommonInit](v3, "_stIntroAppLimitsTableViewControllerCommonInit");
  return v3;
}

- (void)_stIntroAppLimitsTableViewControllerCommonInit
{
  STAllowance *v3;
  STAllowance *allowance;
  NSDateComponentsFormatter *v5;
  NSDateComponentsFormatter *timeAmountFormatter;

  v3 = (STAllowance *)objc_opt_new();
  allowance = self->_allowance;
  self->_allowance = v3;

  -[STAllowance setBehaviorType:](self->_allowance, "setBehaviorType:", 1);
  v5 = (NSDateComponentsFormatter *)objc_opt_new();
  timeAmountFormatter = self->_timeAmountFormatter;
  self->_timeAmountFormatter = v5;

  -[NSDateComponentsFormatter setUnitsStyle:](self->_timeAmountFormatter, "setUnitsStyle:", 2);
  -[NSDateComponentsFormatter setFormattingContext:](self->_timeAmountFormatter, "setFormattingContext:", 3);
}

- (void)viewDidLoad
{
  void *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  -[STIntroAppLimitsTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[STIntroAppLimitsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 1);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STIntroAppLimitsTableViewController.viewDidLoad", v4, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STIntroAppLimitsTableViewController;
  -[STIntroAppLimitsTableViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v4, 0, 0);

  -[STIntroAppLimitsTableViewController _selectedCategories](self, "_selectedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsTableViewController allowance](self, "allowance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCategoryIdentifiers:", v6);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STIntroAppLimitsTableViewController.viewWillAppear", v8, 2u);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  if (a4 == 1)
  {
    if (-[STIntroAppLimitsTableViewController showingDatePicker](self, "showingDatePicker"))
      v10 = 2;
    else
      v10 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroAppLimitsTableViewController.m"), 112, CFSTR("Unhandled App Limits table section %ld"), a4);

    v10 = 0;
  }
  else if (-[STIntroAppLimitsTableViewController showingAllCategories](self, "showingAllCategories"))
  {
    STSortedCategoriesForUsageLimits();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = v9 + 1;
    if (v9 + 1 < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroAppLimitsTableViewController.m"), 102, CFSTR("number of rows overflowed %lu"), v9);

    }
  }
  else
  {
    v10 = 4;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  if (v9 != 1)
  {
    v10 = v9;
    if (!v9)
    {
      v11 = objc_msgSend(v8, "row");
      if (v11)
      {
        v12 = v11;
        v13 = -[STIntroAppLimitsTableViewController showingAllCategories](self, "showingAllCategories");
        if (v12 >= 3 && !v13)
        {
          objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Show All Categories"), v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "blankSpaceImageWithSize:", 29.0, 29.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "imageView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setImage:", v16);
LABEL_11:

LABEL_20:
          goto LABEL_21;
        }
        objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Category"), v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        STSortedCategoriesForUsageLimits();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v12 - 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        STCategoryNameWithIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v29);

        objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "imageForCategoryIdentifier:", v28);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setImage:", v39);

      }
      else
      {
        objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Category"), v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("AllAppsAndCategoriesSpecifierName"), &stru_24DB8A1D0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setText:", v26);

        objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "roundedImageForImageWithName:", CFSTR("AllApps"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setImage:", v29);
      }

      v15 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v41);

      objc_msgSend(v14, "setMultipleSelectionBackgroundView:", v15);
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroAppLimitsTableViewController.m"), 173, CFSTR("Unhandled App Limits table section %ld"), v10);
    goto LABEL_16;
  }
  v18 = objc_msgSend(v8, "row");
  if (v18 != 1)
  {
    v19 = v18;
    if (!v18)
    {
      -[STIntroAppLimitsTableViewController allowance](self, "allowance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "time");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v21);
      v23 = v22;

      if (v23 > 0.0)
      {
        objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Has Set Time Amount"), v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STIntroAppLimitsTableViewController timeAmountFormatter](self, "timeAmountFormatter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringFromTimeInterval:", v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "detailTextLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v16);
        goto LABEL_11;
      }
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("No Set Time Amount"), v8);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroAppLimitsTableViewController.m"), 167, CFSTR("Unhandled App Limits Time Amount section row %ld"), v19);
LABEL_16:

    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
LABEL_17:
    v14 = (void *)v36;
    goto LABEL_21;
  }
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Date Picker"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "subviews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[STIntroAppLimitsTableViewController allowance](self, "allowance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "time");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v35);
  objc_msgSend(v33, "setCountDownDuration:");

  objc_msgSend(v33, "sendActionsForControlEvents:", 4096);
LABEL_21:

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 1)
  {
    if (!objc_msgSend(v7, "row"))
    {
      -[STIntroAppLimitsTableViewController setShowingDatePicker:](self, "setShowingDatePicker:", -[STIntroAppLimitsTableViewController showingDatePicker](self, "showingDatePicker") ^ 1);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndex:", 1);
      objc_msgSend(v6, "reloadSections:withRowAnimation:", v10, 100);

    }
  }
  else if (!v8)
  {
    if (-[STIntroAppLimitsTableViewController showingAllCategories](self, "showingAllCategories")
      || objc_msgSend(v7, "row") != 3)
    {
      if (objc_msgSend(v7, "row"))
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v6, "indexPathsForSelectedRows", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              if (!objc_msgSend(v16, "section") && !objc_msgSend(v16, "row"))
              {
                objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v16, 1);
                goto LABEL_22;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_22:

        goto LABEL_23;
      }
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v23[3] = &unk_24DB86588;
      v24 = v6;
      v25 = v7;
      objc_msgSend(v24, "performBatchUpdates:completion:", v23, 0);

      v9 = v24;
    }
    else
    {
      -[STIntroAppLimitsTableViewController setShowingAllCategories:](self, "setShowingAllCategories:", 1);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v26[3] = &unk_24DB86440;
      v27 = v6;
      objc_msgSend(v27, "performBatchUpdates:completion:", v26, 0);
      v9 = v27;
    }

LABEL_23:
    -[STIntroAppLimitsTableViewController _selectedCategories](self, "_selectedCategories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIntroAppLimitsTableViewController allowance](self, "allowance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCategoryIdentifiers:", v17);

  }
}

void __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v13[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 5);

  v5 = (void *)objc_opt_new();
  STSortedCategoriesForUsageLimits();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)(v7 - 0x7FFFFFFFFFFFFFFFLL) <= 2)
  {
    v10 = v7 - 2;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[STIntroAppLimitsTableViewController tableView:didSelectRowAtIndexPath:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("STIntroAppLimitsTableViewController.m"), 196, CFSTR("indexOffset (%lu) + numberOfRowsToAdd (%lu) will overflow"), 3, v10);

  }
  else if (v7 >= 3)
  {
    v8 = 2;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", ++v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
    while (v7 != v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "insertRowsAtIndexPaths:withRowAnimation:", v5, 5);

}

void __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "indexPathsForSelectedRows", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", v7, 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = objc_msgSend(a4, "section");
  v7 = v13;
  if (!v6)
  {
    objc_msgSend(v13, "indexPathsForSelectedRows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 0);

    }
    -[STIntroAppLimitsTableViewController _selectedCategories](self, "_selectedCategories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIntroAppLimitsTableViewController allowance](self, "allowance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCategoryIdentifiers:", v11);

    v7 = v13;
  }

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;

  v5 = a4;
  if (objc_msgSend(v5, "section")
    || !-[STIntroAppLimitsTableViewController showingAllCategories](self, "showingAllCategories")
    && objc_msgSend(v5, "row") == 3)
  {
    v6 = 0;
  }
  else
  {
    v6 = 3;
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4;
  double v5;

  v4 = a4;
  if (objc_msgSend(v4, "section") == 1)
  {
    if (objc_msgSend(v4, "row") == 1)
      v5 = *MEMORY[0x24BEBE770];
    else
      v5 = 61.0;
  }
  else
  {
    v5 = 61.0;
  }

  return v5;
}

- (id)_selectedCategories
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  STSortedCategoriesForUsageLimits();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[STIntroAppLimitsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v11, "section"))
        {
          v12 = objc_msgSend(v11, "row");
          if (!v12)
          {

            goto LABEL_16;
          }
          objc_msgSend(v3, "objectAtIndexedSubscript:", v12 - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v8, "addObject:", v13);
          else
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v13, 0);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
LABEL_16:
    v8 = 0;
  }

  if (v8)
    v14 = v8;
  else
    v14 = v3;
  v15 = v14;

  return v15;
}

- (void)_datePickerChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "countDownDuration");
  +[STAllowance dateComponentsForDuration:](STAllowance, "dateComponentsForDuration:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsTableViewController allowance](self, "allowance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTime:", v4);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100);

}

- (STAllowance)allowance
{
  return (STAllowance *)objc_getProperty(self, a2, 1024, 1);
}

- (BOOL)showingAllCategories
{
  return self->_showingAllCategories;
}

- (void)setShowingAllCategories:(BOOL)a3
{
  self->_showingAllCategories = a3;
}

- (BOOL)showingDatePicker
{
  return self->_showingDatePicker;
}

- (void)setShowingDatePicker:(BOOL)a3
{
  self->_showingDatePicker = a3;
}

- (NSDateComponentsFormatter)timeAmountFormatter
{
  return (NSDateComponentsFormatter *)objc_getProperty(self, a2, 1032, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeAmountFormatter, 0);
  objc_storeStrong((id *)&self->_allowance, 0);
}

@end
