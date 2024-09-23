@implementation PSUsageBundleDetailController

+ (id)mediaGroups
{
  return 0;
}

+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "usageBundleStorageReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v9, "totalSize");
      if (v7 <= 0.0)
        v8 = 4;
      else
        v8 = 2;
    }
    else
    {
      v8 = 4;
    }

  }
  else
  {
    v8 = 4;
  }

  objc_msgSend(v4, "setCellType:", v8);
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUsageBundleDetailController;
  -[PSListController loadView](&v8, sel_loadView);
  -[PSListController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "sf_isiPad"))
    v6 = 20.0;
  else
    v6 = 10.0;
  v7 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 0.0, v6);

  objc_msgSend(v3, "setTableHeaderView:", v7);
  -[PSEditableListController setEditingButtonHidden:animated:](self, "setEditingButtonHidden:animated:", 1, 0);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)size:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB34E8];
  objc_msgSend(v3, "totalSize");
  objc_msgSend(v4, "stringFromByteCount:countStyle:", (uint64_t)v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char v13;
  int64_t v14;

  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cellType");
  objc_msgSend(v5, "propertyForKey:", CFSTR("USAGE_BUNDLE_CATEGORY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "usageBundleStorageReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "allowDeletionForCategory:", v7) & 1) != 0)
  {
    v11 = v6 - 1;
    objc_msgSend(v9, "usageBundleStorageReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    v14 = 0;
    if (v11 <= 3 && (v13 & 1) != 0)
      v14 = objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode") ^ 1;
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (void)updateSizesAfterDeletingSize:(float)a3 shouldPop:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  float v8;
  double v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;

  v4 = a4;
  -[PSListController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "totalSize");
  *(float *)&v9 = v8 - a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v14, "setTotalSize:");
  -[PSSpecifier setProperty:forKey:](self->super.super.super._specifier, "setProperty:forKey:", v10, CFSTR("TOTAL_SIZE"));
  objc_msgSend((id)objc_opt_class(), "setupSpecifier:forMediaGroups:", self->super.super.super._specifier, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._parentController);
  objc_msgSend(WeakRetained, "reloadSpecifier:", self->super.super.super._specifier);

  if (v4)
  {
    -[PSUsageBundleDetailController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);

  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  double v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a5, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("USAGE_BUNDLE_CATEGORY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "usageBundleStorageReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeForCategory:", v10);
  v13 = v12;

  dispatch_get_global_queue(-2, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PSUsageBundleDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_1E4A66370;
  v20 = v8;
  v21 = v10;
  v22 = v9;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  dispatch_async(v14, block);

  LODWORD(v18) = v13;
  -[PSUsageBundleDetailController updateSizesAfterDeletingSize:shouldPop:](self, "updateSizesAfterDeletingSize:shouldPop:", 1, v18);

}

void __80__PSUsageBundleDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "usageBundleStorageReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v4 = objc_msgSend(v2, "deleteDataForCategory:withError:", v3, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Unable to delete data for %@ : %@. Encountered error: %@", buf, 0x20u);
    }

  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return -[PSUsageBundleDetailController tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", a3, a4) != 0;
}

- (id)sizeForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;

  objc_msgSend(a3, "propertyForKey:", CFSTR("USAGE_BUNDLE_CATEGORY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageBundleApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageBundleStorageReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB34E8];
  objc_msgSend(v5, "sizeForCategory:", v3);
  objc_msgSend(v6, "stringFromByteCount:countStyle:", (uint64_t)v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)specifiers
{
  NSArray *specifiers;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  void *v22;
  id obj;
  PSUsageBundleDetailController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PSListController specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyForKey:", CFSTR("USAGE_BUNDLE_APP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, 0, 0, 0, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", CFSTR("PSUsageSizeHeader"), CFSTR("headerCellClass"));
    v24 = self;
    -[PSListController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("TOTAL_SIZE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v10, CFSTR("SIZE"));

    v11 = v4;
    v22 = v8;
    -[NSArray insertObject:atIndex:](v4, "insertObject:atIndex:", v8, 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "categories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, v24, 0, sel_sizeForSpecifier_, 0, 4, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setProperty:forKey:", v16, CFSTR("USAGE_BUNDLE_CATEGORY"));
          objc_msgSend(v16, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setProperty:forKey:", v19, CFSTR("id"));

          objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
          -[NSArray addObject:](v11, "addObject:", v18);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v20 = v24->super.super._specifiers;
    v24->super.super._specifiers = v11;

    specifiers = v24->super.super._specifiers;
  }
  return specifiers;
}

@end
