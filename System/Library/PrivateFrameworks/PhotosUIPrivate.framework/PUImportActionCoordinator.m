@implementation PUImportActionCoordinator

- (PUImportActionCoordinator)initWithViewController:(id)a3 importController:(id)a4 loggingSource:(int64_t)a5
{
  id v8;
  id v9;
  PUImportActionCoordinator *v10;
  PUImportActionCoordinator *v11;
  __CFString *v12;
  NSNumberFormatter *v13;
  NSNumberFormatter *percentageNumberFormatter;
  NSByteCountFormatter *v15;
  NSByteCountFormatter *byteCountFormatter;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUImportActionCoordinator;
  v10 = -[PUImportActionCoordinator init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v11->_importController, a4);
    v11->_loggingSource = a5;
    if (a5)
      v12 = CFSTR("OneUp");
    else
      v12 = CFSTR("Grid");
    objc_storeStrong((id *)&v11->_loggingPrefix, v12);
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    percentageNumberFormatter = v11->_percentageNumberFormatter;
    v11->_percentageNumberFormatter = v13;

    -[NSNumberFormatter setNumberStyle:](v11->_percentageNumberFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMaximumFractionDigits:](v11->_percentageNumberFormatter, "setMaximumFractionDigits:", 0);
    -[NSNumberFormatter setMultiplier:](v11->_percentageNumberFormatter, "setMultiplier:", &unk_1E59BB0E8);
    v15 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    byteCountFormatter = v11->_byteCountFormatter;
    v11->_byteCountFormatter = v15;

  }
  return v11;
}

- (void)configureImportActionsForBarButtonItem:(id)a3
{
  id v4;
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
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v4 = a3;
  -[PUImportActionCoordinator actionMenuForImportButton](self, "actionMenuForImportButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setMenu:", v5);
    objc_msgSend(v4, "setPrimaryAction:", 0);
    PLLocalizedFrameworkString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

  }
  else
  {
    objc_msgSend(v4, "setMenu:", 0);
    -[PUImportActionCoordinator importAllAction](self, "importAllAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0DC3428];
      PLLocalizedFrameworkString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __68__PUImportActionCoordinator_configureImportActionsForBarButtonItem___block_invoke;
      v20 = &unk_1E58AB5D0;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportActionCoordinator setImportAllAction:](self, "setImportAllAction:", v10, v17, v18, v19, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    -[PUImportActionCoordinator importController](self, "importController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isAnyItemSelected");

    PLLocalizedFrameworkString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportActionCoordinator importAllAction](self, "importAllAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v14);

    -[PUImportActionCoordinator importAllAction](self, "importAllAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryAction:", v16);

  }
}

- (id)actionMenuForImportButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (-[PUImportActionCoordinator someItemsButNotAllAreSelected](self, "someItemsButNotAllAreSelected"))
  {
    -[PUImportActionCoordinator importActionsMenu](self, "importActionsMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_initWeak(&location, self);
      v4 = (void *)MEMORY[0x1E0DC3428];
      PLLocalizedFrameworkString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down.on.square"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke;
      v19[3] = &unk_1E58AB5D0;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v9 = (void *)MEMORY[0x1E0DC3428];
      PLLocalizedFrameworkString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke_148;
      v17[3] = &unk_1E58AB5D0;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E58AD278, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportActionCoordinator setImportActionsMenu:](self, "setImportActionsMenu:", v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    -[PUImportActionCoordinator importActionsMenu](self, "importActionsMenu");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (BOOL)someItemsButNotAllAreSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[PUImportActionCoordinator importController](self, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportActionCoordinator importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfilteredDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v8 = objc_msgSend(v7, "numberOfItems");
    v9 = v8 != objc_msgSend(v4, "count");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)ppt_beginImportFromBarButtonItem
{
  void *v3;
  id v4;

  if (-[PUImportActionCoordinator someItemsButNotAllAreSelected](self, "someItemsButNotAllAreSelected"))
  {
    -[PUImportActionCoordinator importController](self, "importController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedItems");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUImportActionCoordinator _importItems:allowDuplicates:](self, "_importItems:allowDuplicates:", v4, 1);
  }
  else
  {
    -[PUImportActionCoordinator importAllFromBarButtonItem](self, "importAllFromBarButtonItem");
  }
}

- (void)importAllFromBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PUImportActionCoordinator importController](self, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unfilteredDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "numberOfAlreadyImportedItems");
  objc_initWeak(&location, self);
  if (v6 < 1)
  {
    _importActionCoordinatorLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v19;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: No duplicates found, performing Import All...", buf, 0xCu);

    }
    objc_msgSend(v5, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportActionCoordinator _importItems:allowDuplicates:](self, "_importItems:allowDuplicates:", v14, 0);
  }
  else
  {
    v7 = objc_msgSend(v5, "numberOfNotYetImportedItems");
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      _importActionCoordinatorLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v10;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Duplicates found. Presenting alert.", buf, 0xCu);

      }
      v11 = (void *)MEMORY[0x1E0DC3450];
      PLLocalizedFrameworkString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PLLocalizedFrameworkString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0DC3448];
      PLLocalizedFrameworkString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v8;
      v41[1] = 3221225472;
      v41[2] = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke;
      v41[3] = &unk_1E58A01B0;
      objc_copyWeak(&v43, &location);
      v42 = v5;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v41);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v17);

      objc_destroyWeak(&v43);
    }
    else
    {
      _importActionCoordinatorLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v21;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: All items to import are dupes. Presenting alert.", buf, 0xCu);

      }
      v22 = (void *)MEMORY[0x1E0DC3450];
      PLLocalizedFrameworkString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PLLocalizedFrameworkString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "alertControllerWithTitle:message:preferredStyle:", v23, v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v25 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_164;
    v38[3] = &unk_1E58A01B0;
    objc_copyWeak(&v40, &location);
    v27 = v5;
    v39 = v27;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 0, v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v28);

    v29 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    v34 = 3221225472;
    v35 = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_167;
    v36 = &unk_1E58AA850;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, &v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v31, v33, v34, v35, v36);

    if (-[PUImportActionCoordinator ppt_alwaysImportDuplicatesNoPrompt](self, "ppt_alwaysImportDuplicatesNoPrompt"))
    {
      objc_msgSend(v27, "allItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportActionCoordinator _importItems:allowDuplicates:](self, "_importItems:allowDuplicates:", v32, 1);
    }
    else
    {
      -[PUImportActionCoordinator viewController](self, "viewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "presentViewController:animated:completion:", v14, 1, 0);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v40);
  }

  objc_destroyWeak(&location);
}

- (void)checkBatteryLevelWithCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  double v11;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  int v47;
  uint64_t v48;

  v4 = a3;
  v48 = 0;
  v47 = 0;
  objc_msgSend((id)objc_opt_class(), "retrieveBatteryState:batteryLevel:", &v48, &v47);
  v5 = (void *)objc_opt_class();
  LODWORD(v6) = v47;
  v7 = objc_msgSend(v5, "importBehaviorForBatteryState:batteryLevel:", v48, v6);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasPrefix:](v9, "hasPrefix:", CFSTR("iPod")))
  {

    v9 = CFSTR("iPod");
  }
  -[PUImportActionCoordinator percentageNumberFormatter](self, "percentageNumberFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v47;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("IMPORT_BATTERY_LOW_MESSAGE_"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "appendString:", v9);
    PLLocalizedFrameworkString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0DC3450];
    PLLocalizedFrameworkString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v26, v39, 1, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_2;
    v43[3] = &unk_1E58AB6C0;
    v31 = v4;
    v32 = v4;
    v44 = v32;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v33);

    v34 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v30;
    v41[1] = 3221225472;
    v41[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_3;
    v41[3] = &unk_1E58AB6C0;
    v36 = v32;
    v4 = v31;
    v42 = v36;
    objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v41);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v37);

    -[PUImportActionCoordinator viewController](self, "viewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "presentViewController:animated:completion:", v27, 1, 0);

  }
  else if (v7 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("IMPORT_BATTERY_CRITICAL_MESSAGE_"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v9);
    PLLocalizedFrameworkString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3450];
    PLLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v16, 1, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke;
    v45[3] = &unk_1E58AB6C0;
    v46 = v4;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v45);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v22);

    -[PUImportActionCoordinator viewController](self, "viewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentViewController:animated:completion:", v19, 1, 0);

  }
  else if (v4 && !v7)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (void)stopImport
{
  id v2;

  -[PUImportActionCoordinator importController](self, "importController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopImport");

}

- (void)_importItems:(id)a3 allowDuplicates:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke;
  v8[3] = &unk_1E58A7E20;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PUImportActionCoordinator checkBatteryLevelWithCompletion:](self, "checkBatteryLevelWithCompletion:", v8);

}

- (void)_handleDiskAvailabilityRequestForItems:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v10 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  _importActionCoordinatorLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
    v41 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("NO");
    if (v10)
      v16 = CFSTR("YES");
    v17 = v16;
    -[PUImportActionCoordinator byteCountFormatter](self, "byteCountFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromByteCount:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportActionCoordinator byteCountFormatter](self, "byteCountFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromByteCount:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v47 = v15;
    v48 = 2114;
    v49 = v17;
    v50 = 2114;
    v51 = v19;
    v52 = 2114;
    v53 = v21;
    v54 = 2112;
    v55 = v13;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting disk space succeeded: %{public}@. Bytes purged: %{public}@, Additional bytes required: %{public}@, Error: %@", buf, 0x34u);

    v12 = v41;
  }

  if (v13)
    v22 = objc_msgSend(v13, "code") != 1;
  else
    v22 = 1;
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "simulatedDiskSpace");

  if (v22 && v24)
  {
    if (v24 == 4)
    {
      _importActionCoordinatorLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v28;
        _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating failure in Cache Delete", buf, 0xCu);

      }
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0D71CD0];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = CFSTR("This is a simulated Cache Delete failure.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v29;
      v33 = v30;
      v34 = 4;
    }
    else
    {
      if (v24 == 1)
      {
        _importActionCoordinatorLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v26;
          _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating disk space ALWAYS available", buf, 0xCu);

        }
        v13 = 0;
        goto LABEL_16;
      }
      _importActionCoordinatorLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating insufficient disk space", buf, 0xCu);

      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0D71CD0];
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = CFSTR("This is a simulated disk space error.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v37;
      v33 = v38;
      v34 = 0;
    }
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v34, v31);
    v39 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v39;
  }
  else if (v10)
  {
LABEL_16:
    -[PUImportActionCoordinator _commitImportingItems:](self, "_commitImportingItems:", v12);
    goto LABEL_29;
  }
  if (v13)
    v40 = v22;
  else
    v40 = 0;
  if (v40)
    -[PUImportActionCoordinator _presentInsufficientDiskSpaceAlertForItems:](self, "_presentInsufficientDiskSpaceAlertForItems:", v12);
LABEL_29:

}

- (void)_presentInsufficientDiskSpaceAlertForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;

  v4 = a3;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0D7B518], "itemsConstrainedByAvailableDiskSpaceFromItems:additionalBytesRequired:", v4, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "simulatedDiskSpace");

  if (v7 != 3)
  {
    if (!objc_msgSend(v5, "count"))
      goto LABEL_10;
    goto LABEL_5;
  }
  v31 = 0x100000;
  if (objc_msgSend(v5, "count"))
  {
LABEL_5:
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(v4, "count");
    if (v7 == 3 || v8 < v9)
      goto LABEL_9;
LABEL_10:
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("NO_SPACE_MESSAGE_%@"), v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLLocalizedFrameworkString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0DC3450];
    PLLocalizedFrameworkString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v25, v13, 1, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke_2;
    v29[3] = &unk_1E58A8DE8;
    v29[4] = self;
    v19 = v29;
    goto LABEL_11;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v31, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedFrameworkString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3450];
  PLLocalizedFrameworkString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v13, 1, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3448];
  PLLocalizedFrameworkString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke;
  v30[3] = &unk_1E58A8DE8;
  v30[4] = self;
  v19 = v30;
LABEL_11:
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v26);

  -[PUImportActionCoordinator viewController](self, "viewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", v16, 1, 0);

}

- (void)_commitImportingItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  PUImportActionCoordinator *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importActionCoordinatorLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2048;
    v18 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Importing %tu items", buf, 0x16u);

  }
  -[PUImportActionCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionCoordinatorWillBeginImport:", self);

  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke;
  aBlock[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v14, (id *)buf);
  v8 = v4;
  v12 = v8;
  v13 = self;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (v9)
    (*((void (**)(void *))v9 + 2))(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)notifyDelegateOfImportCancellation
{
  id v3;

  -[PUImportActionCoordinator delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionCoordinatorDidCancelImport:", self);

}

- (void)deleteItemsFromBarButtonItem:(id)a3
{
  -[PUImportActionCoordinator deleteItemsFromBarButtonItem:withOneUpHintItems:](self, "deleteItemsFromBarButtonItem:withOneUpHintItems:", a3, 0);
}

- (void)deleteItemsFromBarButtonItem:(id)a3 withOneUpHintItems:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _importActionCoordinatorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v9;
    v48 = 2048;
    v49 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Delete bar button tapped. Hint items: %lu", buf, 0x16u);

  }
  v10 = objc_msgSend(v7, "count");
  -[PUImportActionCoordinator importController](self, "importController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "count");
  if (!v7)
  {
    _importActionCoordinatorLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v22)
      {
        -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v38;
        _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing 'Delete All' confirmation", buf, 0xCu);

      }
      PLLocalizedFrameworkString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportActionCoordinator importController](self, "importController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "dataSourceManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "unfilteredDataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "allItems");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 1;
      goto LABEL_18;
    }
    if (v22)
    {
      -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v23;
      v48 = 2048;
      v49 = (uint64_t)v13;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing delete confirmation action sheet for %lu items", buf, 0x16u);

    }
    v16 = v12;
    objc_msgSend(MEMORY[0x1E0D7B520], "importAssetsFromModels:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXImportSuffixForItems();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("S");
    if (v13 == (void *)1)
      v24 = &stru_1E58AD278;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_BUTTON_TITLE_%@%@"), v18, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v13;
    PFLocalizedStringWithValidatedFormat();
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  _importActionCoordinatorLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[PUImportActionCoordinator loggingPrefix](self, "loggingPrefix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v15;
    v48 = 2048;
    v49 = (uint64_t)v13;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing delete confirmation action sheet for %lu hint items", buf, 0x16u);

  }
  if (v10 == 1)
  {
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0D7B520], "importAssetsFromModels:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXImportSuffixForItems();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE_BUTTON_TITLE_THIS_%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = (void *)v20;

LABEL_17:
    v26 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (v13)
  {
    v16 = v12;
    PULocalizedString(CFSTR("DELETE_BUTTON_TITLE_SELECTED_ITEM"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v13;
    PUStringWithValidatedFormat();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v26 = 0;
  v16 = 0;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0, v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0DC3448];
  PLLocalizedFrameworkString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v30);

  v31 = (void *)MEMORY[0x1E0DC3448];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke;
  v42[3] = &unk_1E58A02E8;
  v45 = v26;
  v42[4] = self;
  v43 = v13;
  v44 = v16;
  v32 = v16;
  v33 = v13;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 2, v42);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v34);

  objc_msgSend(v27, "popoverPresentationController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
    objc_msgSend(v35, "setBarButtonItem:", v6);
  -[PUImportActionCoordinator viewController](self, "viewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "presentViewController:animated:completion:", v27, 1, 0);

}

- (void)_deleteItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    _PFAssertContinueHandler();
  -[PUImportActionCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCoordinatorWillBeginDelete:", self);

  objc_initWeak(&location, self);
  -[PUImportActionCoordinator importController](self, "importController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__PUImportActionCoordinator__deleteItems___block_invoke;
  v11 = &unk_1E58AA4C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "deleteItems:withCompletionHandler:", v4, &v8);

  -[PUImportActionCoordinator delegate](self, "delegate", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionCoordinatorDidBeginDelete:", self);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (PUImportActionCoordinatorDelegate)delegate
{
  return (PUImportActionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)loggingSource
{
  return self->_loggingSource;
}

- (BOOL)presentsAdditionalDeleteAllConfirmation
{
  return self->_presentsAdditionalDeleteAllConfirmation;
}

- (void)setPresentsAdditionalDeleteAllConfirmation:(BOOL)a3
{
  self->_presentsAdditionalDeleteAllConfirmation = a3;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (PXImportController)importController
{
  return self->_importController;
}

- (void)setImportController:(id)a3
{
  objc_storeStrong((id *)&self->_importController, a3);
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

- (void)setLoggingPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_loggingPrefix, a3);
}

- (UIAction)importAllAction
{
  return self->_importAllAction;
}

- (void)setImportAllAction:(id)a3
{
  objc_storeStrong((id *)&self->_importAllAction, a3);
}

- (UIMenu)importActionsMenu
{
  return self->_importActionsMenu;
}

- (void)setImportActionsMenu:(id)a3
{
  objc_storeStrong((id *)&self->_importActionsMenu, a3);
}

- (NSNumberFormatter)percentageNumberFormatter
{
  return self->_percentageNumberFormatter;
}

- (void)setPercentageNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_percentageNumberFormatter, a3);
}

- (BOOL)ppt_alwaysImportDuplicatesNoPrompt
{
  return self->_ppt_alwaysImportDuplicatesNoPrompt;
}

- (void)setPpt_alwaysImportDuplicatesNoPrompt:(BOOL)a3
{
  self->_ppt_alwaysImportDuplicatesNoPrompt = a3;
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (void)setByteCountFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_byteCountFormatter, a3);
}

- (PLCacheDeleteClient)cacheDeleteClient
{
  return self->_cacheDeleteClient;
}

- (void)setCacheDeleteClient:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_percentageNumberFormatter, 0);
  objc_storeStrong((id *)&self->_importActionsMenu, 0);
  objc_storeStrong((id *)&self->_importAllAction, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__PUImportActionCoordinator__deleteItems___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "actionCoordinatorDidEndDelete:", v3);

}

void __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  id v23;

  v3 = a2;
  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "presentsAdditionalDeleteAllConfirmation"))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v5, "importController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "importSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUImportActionCoordinator deleteAllConfirmationMessageForItems:importSource:](PUImportActionCoordinator, "deleteAllConfirmationMessageForItems:importSource:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke_2;
    v21 = &unk_1E58A4748;
    v15 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v16, v18, v19, v20, v21, v22);

    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_deleteItems:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteItems:", *(_QWORD *)(a1 + 40));
}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "importController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke_2;
  v9[3] = &unk_1E58A0298;
  v5 = *(_QWORD *)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke_3;
  v7[3] = &unk_1E58A02C0;
  objc_copyWeak(&v8, v2);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "importItems:configuration:completion:", v5, v9, v7);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionCoordinatorDidBeginImport:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v8);
}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importDestinationForActionCoordinator:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationAlbum:", v6);

  objc_msgSend(v4, "setSkipDiskSpaceCheck:", 1);
  objc_msgSend(*(id *)(a1 + 32), "importController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXTargetLibraryFetchLibraryScopeOrNil();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLibraryScope:", v8);

}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionCoordinator:didCompleteWithImportSession:results:", *(_QWORD *)(a1 + 32), v7, v6);

}

uint64_t __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfImportCancellation");
}

uint64_t __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfImportCancellation");
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  dispatch_time_t v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _BYTE *v39;
  id v40;
  id location;
  _QWORD v42[3];
  char v43;
  _QWORD v44[3];
  char v45;
  _QWORD v46[4];
  char v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 40);
    v4 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2;
    v46[3] = &__block_descriptor_33_e48_B24__0__PXImportItemViewModel_8__NSDictionary_16l;
    v47 = *(_BYTE *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v46);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "count");
    if (v7 < objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      _importActionCoordinatorLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingPrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v6, "count");
        v11 = objc_msgSend(*(id *)(a1 + 40), "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2048;
        v49 = (uint64_t (*)(uint64_t, uint64_t))v11;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Importing %tu items instead of the %tu selected, as the others are already imported or invalid", buf, 0x20u);

      }
    }
    v12 = objc_msgSend(MEMORY[0x1E0D7B518], "diskSpaceRequiredToImportItems:", v6);
    _importActionCoordinatorLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingPrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "count");
      objc_msgSend(*(id *)(a1 + 32), "byteCountFormatter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromByteCount:", v12);
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2114;
      v49 = v17;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Disk space required to import %tu items: %{public}@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__35458;
    v50 = __Block_byref_object_dispose__35459;
    v51 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v43 = 0;
    objc_msgSend(*(id *)(a1 + 32), "importController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "photoLibraryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v22 = objc_alloc(MEMORY[0x1E0D715D0]);
    v23 = MEMORY[0x1E0C80D38];
    v24 = MEMORY[0x1E0C80D38];
    v25 = (void *)objc_msgSend(v22, "initWithQoSClass:pathForVolume:callbackQueue:", 25, v21, v23);
    objc_msgSend(*(id *)(a1 + 32), "setCacheDeleteClient:", v25);

    objc_msgSend(*(id *)(a1 + 32), "cacheDeleteClient");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v4;
    v35[1] = 3221225472;
    v35[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_199;
    v35[3] = &unk_1E58A0220;
    v27 = *(_QWORD *)(a1 + 32);
    v37 = v42;
    v38 = v44;
    v35[4] = v27;
    v39 = buf;
    objc_copyWeak(&v40, &location);
    v28 = v6;
    v36 = v28;
    objc_msgSend(v26, "requestDiskSpaceAvailabilityOfSize:completion:", v12, v35);

    objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "delayBeforeShowingPreparationAlert");
    v31 = v30;

    v32 = dispatch_time(0, (uint64_t)(v31 * 1000000000.0));
    v34[0] = v4;
    v34[1] = 3221225472;
    v34[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_208;
    v34[3] = &unk_1E58A0270;
    v34[4] = *(_QWORD *)(a1 + 32);
    v34[5] = v42;
    v34[6] = buf;
    v34[7] = v44;
    v33 = (void *)MEMORY[0x1E0C80D38];
    dispatch_after(v32, MEMORY[0x1E0C80D38], v34);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfImportCancellation");
  }
}

uint64_t __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isMediaAsset"))
  {
    if (*(_BYTE *)(a1 + 32))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isNotYetImported");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_199(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  int v11;
  int64_t v12;
  dispatch_time_t v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  id v23[3];
  char v24;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "simulateLongDiskSpacePreparation");

  if (v11)
    v12 = 5000000000;
  else
    v12 = 0;
  v13 = dispatch_time(0, v12);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_201;
  v17[3] = &unk_1E58A01F8;
  v24 = a2;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v15;
  v22 = *(_QWORD *)(a1 + 64);
  v21 = v14;
  v16 = v9;
  objc_copyWeak(v23, (id *)(a1 + 72));
  v20 = *(id *)(a1 + 40);
  v23[1] = a3;
  v23[2] = a4;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v17);

  objc_destroyWeak(v23);
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_208(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[6];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1E0DC3450];
    PLLocalizedFrameworkString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBounds:", v10, v12, v14, v16);

    objc_msgSend(v7, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v8);

    objc_msgSend(v8, "startAnimating");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setContentViewController:", v7);
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = (void *)MEMORY[0x1E0DC3448];
    PLLocalizedFrameworkString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_213;
    v25[3] = &unk_1E58A0248;
    v22 = *(_QWORD *)(a1 + 56);
    v25[4] = *(_QWORD *)(a1 + 32);
    v25[5] = v22;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v23);

    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1, 0);

  }
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_213(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importActionCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancel button pressed on the preparation alert.", (uint8_t *)&v5, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "cacheDeleteClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelDiskSpaceAvailabilityRequest");

}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_201(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v2 = *(unsigned __int8 *)(a1 + 104);
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v3)
  {
    v5 = v2 != 0;
    if (objc_msgSend(v3, "code") == 1)
      goto LABEL_10;
  }
  else
  {
    v5 = v2 != 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    _importActionCoordinatorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cache delete client did not receive cancellation in time, but treating as a cancel anyway.", buf, 0xCu);

    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D71CD0];
    v16 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("User cancelled the purge request, though the cache delete client finished.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v4 = (void *)v11;
  }
  if (!v4)
  {
    v12 = 0;
    goto LABEL_12;
  }
LABEL_10:
  v12 = objc_msgSend(v4, "code") == 1;
LABEL_12:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) && !v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "viewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v15 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v15, "_handleDiskAvailabilityRequestForItems:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v4);

}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _importActionCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "loggingPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping duplicates.", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "notYetImportedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "_importItems:allowDuplicates:", v5, 0);

}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_164(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _importActionCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "loggingPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import all, including dupes", (uint8_t *)&v7, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_importItems:allowDuplicates:", v6, 1);

}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_167(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyDelegateOfImportCancellation");

}

void __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importActionCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "loggingPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import All menu action triggered. Beginning an import-all session", (uint8_t *)&v6, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "importAllFromBarButtonItem");

}

void __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke_148(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "importController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _importActionCoordinatorLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "loggingPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Import Selected menu button triggered. Beginning an import-selected session with %lu selected items.", (uint8_t *)&v9, 0x16u);

  }
  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "_importItems:allowDuplicates:", v4, 1);

}

void __68__PUImportActionCoordinator_configureImportActionsForBarButtonItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importActionCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "loggingPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import All bar button tapped. Beginning an import-all session", (uint8_t *)&v6, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "importAllFromBarButtonItem");

}

+ (float)lowBatteryLevelThresholdForDevice
{
  if (lowBatteryLevelThresholdForDevice_onceToken != -1)
    dispatch_once(&lowBatteryLevelThresholdForDevice_onceToken, &__block_literal_global_35557);
  return *(float *)&lowBatteryLevelThresholdForDevice_lowThreshold;
}

+ (void)retrieveBatteryState:(int64_t *)a3 batteryLevel:(float *)a4
{
  int64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  objc_msgSend(v13, "setBatteryMonitoringEnabled:", 1);
  v7 = objc_msgSend(v13, "batteryState");
  objc_msgSend(v13, "batteryLevel");
  v9 = v8;
  objc_msgSend(v13, "setBatteryMonitoringEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "simulatedBatteryLevel");

  if (v11 == 2)
  {
    v9 = 1028443341;
  }
  else if (v11 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "lowBatteryLevelThresholdForDevice");
    v9 = v12;
    v6 = 1;
  }
  else
  {
    v6 = v7;
  }
  *a3 = v6;
  *(_DWORD *)a4 = v9;

}

+ (int64_t)importBehaviorForBatteryState:(int64_t)a3 batteryLevel:(float)a4
{
  _BOOL4 v5;
  float v6;
  int64_t v7;

  v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
  objc_msgSend((id)objc_opt_class(), "lowBatteryLevelThresholdForDevice");
  v7 = v6 >= a4 && v5;
  if (v5 && a4 <= 0.05)
    return 2;
  else
    return v7;
}

+ (id)deleteAllConfirmationMessageForItems:(id)a3 importSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t i;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("IMPORT_CONFIRM_DELETE_ALL_"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v10 = CFSTR("PHOTOS_");
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    v13 = 1;
    v14 = 1;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "importAsset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isImage") & 1) != 0)
        {
          v13 = 0;
        }
        else
        {
          v14 = 0;
          v13 &= objc_msgSend(v16, "isMovie");
        }

        if ((v14 & 1) == 0 && !v13)
        {
          v10 = CFSTR("MEDIA_");
          goto LABEL_19;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }

    v17 = CFSTR("VIDEOS_");
    if (!v13)
      v17 = CFSTR("MEDIA_");
    if ((v14 & 1) == 0)
      v10 = v17;
  }
  else
  {
LABEL_19:

  }
  objc_msgSend(v7, "appendString:", v10);
  objc_msgSend(v6, "productKind");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("Camera")) & 1) != 0 || !objc_msgSend(v19, "length"))
  {
    objc_msgSend(v7, "appendString:", v18);
    PLLocalizedFrameworkString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "appendString:", CFSTR("FORMAT"));
    PLLocalizedFrameworkString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

float __62__PUImportActionCoordinator_lowBatteryLevelThresholdForDevice__block_invoke()
{
  void *v0;
  uint64_t v1;
  float result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  result = flt_1AB0EEC88[(v1 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  lowBatteryLevelThresholdForDevice_lowThreshold = LODWORD(result);
  return result;
}

@end
