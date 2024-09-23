@implementation PBFConfigViewController

- (void)viewDidLoad
{
  void *v3;
  PBFPosterExtensionDataStoreXPCServiceGlue *v4;
  PBFPosterExtensionDataStoreXPCServiceGlue *glue;
  void *v6;
  void *v7;
  PRSwitcherConfiguration *v8;
  PRSwitcherConfiguration *switcherConfiguration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBFConfigViewController;
  -[PBFConfigViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PBFConfigViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LOL"));

  if (!self->_glue)
  {
    +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
    v4 = (PBFPosterExtensionDataStoreXPCServiceGlue *)objc_claimAutoreleasedReturnValue();
    glue = self->_glue;
    self->_glue = v4;

    -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);

    -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherConfiguration");
    v8 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
    switcherConfiguration = self->_switcherConfiguration;
    self->_switcherConfiguration = v8;

  }
  -[PBFConfigViewController _updateEditing:](self, "_updateEditing:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFConfigViewController;
  -[PBFConfigViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PBFConfigViewController _reloadData](self, "_reloadData");
}

- (void)_toggleEdit:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PBFConfigViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFConfigViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", objc_msgSend(v5, "isEditing") ^ 1);

  -[PBFConfigViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFConfigViewController _updateEditing:](self, "_updateEditing:", objc_msgSend(v6, "isEditing"));

}

- (void)_updateEditing:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  if (v3)
    v6 = CFSTR("Done");
  else
    v6 = CFSTR("Edit");
  v8 = (id)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__toggleEdit_);
  -[PBFConfigViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_configurations, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_class *v5;
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;

  v5 = (objc_class *)MEMORY[0x1E0DC3D50];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("LOL"));
  -[PBFConfigViewController _posterPathAtIndexPath:](self, "_posterPathAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v7, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "version"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v17);

  -[PBFConfigViewController _posterConfigurationAtIndexPath:](self, "_posterConfigurationAtIndexPath:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController pbf_displayContext](self, "pbf_displayContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v31 = &unk_1E86F62B8;
  v21 = v7;
  v32 = v21;
  v22 = v11;
  v33 = v22;
  objc_msgSend(v19, "fetchSwitcherSnapshotForConfiguration:context:completion:", v18, v20, &v28);

  -[PRSwitcherConfiguration selectedConfiguration](self->_switcherConfiguration, "selectedConfiguration", v28, v29, v30, v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v18, "isEqual:", v23);

  if ((_DWORD)v11)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v24, "setText:", CFSTR("⭐️"));
    objc_msgSend(v24, "sizeToFit");
    objc_msgSend(v21, "setAccessoryView:", v24);

  }
  else
  {
    objc_msgSend(v21, "setAccessoryView:", 0);
  }
  v25 = v33;
  v26 = v21;

  return v26;
}

void __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E86F3130;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "imageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "textLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "imageView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setImage:", *(_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
        objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
      }
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return CFSTR("Configurations");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PBFConfigViewController _posterPathAtIndexPath:](self, "_posterPathAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFConfigViewController _presentPath:mode:](self, "_presentPath:mode:", v8, 2);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC36B8];
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v18[3] = &unk_1E86F62E0;
  objc_copyWeak(&v20, &location);
  v11 = v8;
  v19 = v11;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v15[3] = &unk_1E86F6330;
  objc_copyWeak(&v17, &location);
  v12 = v11;
  v16 = v12;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("LOL"), v18, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

id __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_previewForPathAtIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];

  v28[3] = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = (void *)MEMORY[0x1E0DC39D0];
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.pencil"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3;
  v25[3] = &unk_1E86F6308;
  objc_copyWeak(&v27, (id *)(a1 + 40));
  v26 = *(id *)(a1 + 32);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", CFSTR("Edit"), v18, CFSTR("EDIT"), v25);
  v5 = objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v6 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("wand.and.stars.inverse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v5;
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4;
  v22[3] = &unk_1E86F6308;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", CFSTR("Render"), v7, CFSTR("RENDER"), v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  v9 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5;
  v19[3] = &unk_1E86F6308;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", CFSTR("Select"), v10, CFSTR("SELECT"), v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "menuWithTitle:children:", CFSTR("MAIN MENU"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  return v13;
}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v5, "_posterPathAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentPath:mode:", v4, 2);

}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v5, "_posterPathAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentPath:mode:", v4, 1);

}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v5, "_posterConfigurationAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectConfiguration:", v4);

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a4 == 1)
  {
    -[PBFConfigViewController _posterConfigurationAtIndexPath:](self, "_posterConfigurationAtIndexPath:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[PRSwitcherConfiguration mutableCopy](self->_switcherConfiguration, "mutableCopy");
    objc_msgSend(v6, "removeConfiguration:", v9);
    -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "updateDataStoreForSwitcherConfiguration:reason:error:", v6, CFSTR("PBFConfigViewController commit editing style"), 0);

  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  PRSwitcherConfiguration *switcherConfiguration;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PBFPosterExtensionDataStoreXPCServiceGlue *v14;
  void *v15;
  PRSwitcherConfiguration *v16;
  id v17;
  PRSwitcherConfiguration *v18;
  id v19;
  void *v20;
  id v21;

  switcherConfiguration = self->_switcherConfiguration;
  v19 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)-[PRSwitcherConfiguration mutableCopy](switcherConfiguration, "mutableCopy");
  objc_msgSend(v11, "configurations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "row"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v9, "row"));
  objc_msgSend(v13, "insertObject:atIndex:", v20, objc_msgSend(v19, "row"));
  objc_msgSend(v11, "setConfigurations:", v13);
  v14 = self->_glue;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](v14, "dataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v15, "updateDataStoreForSwitcherConfiguration:reason:error:", v11, CFSTR("PBFConfigViewController moveRowAtIndexPath"), &v21);
  v16 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  v18 = self->_switcherConfiguration;
  self->_switcherConfiguration = v16;

  objc_msgSend(v10, "beginUpdates");
  objc_msgSend(v10, "moveRowAtIndexPath:toIndexPath:", v9, v19);

  objc_msgSend(v10, "endUpdates");
}

- (void)_selectConfiguration:(id)a3
{
  PRSwitcherConfiguration *switcherConfiguration;
  id v5;
  void *v6;
  id v7;
  id v8;

  switcherConfiguration = self->_switcherConfiguration;
  v5 = a3;
  v8 = (id)-[PRSwitcherConfiguration mutableCopy](switcherConfiguration, "mutableCopy");
  objc_msgSend(v8, "setSelectedConfiguration:", v5);

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "updateDataStoreForSwitcherConfiguration:reason:error:", v8, CFSTR("PBFConfigViewController selectConfiguration"), 0);

  -[PBFConfigViewController _reloadData](self, "_reloadData");
}

- (id)_posterPathAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_configurations, "objectAtIndex:", objc_msgSend(a3, "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_posterConfigurationAtIndexPath:(id)a3
{
  return -[NSArray objectAtIndex:](self->_configurations, "objectAtIndex:", objc_msgSend(a3, "row"));
}

- (void)_reloadData
{
  void *v3;
  PRSwitcherConfiguration *v4;
  PRSwitcherConfiguration *switcherConfiguration;
  NSArray *v6;
  NSArray *configurations;
  id v8;

  if (MEMORY[0x1D17A3148]("-[PBFConfigViewController _reloadData]", a2))
  {
    -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switcherConfiguration");
    v4 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
    switcherConfiguration = self->_switcherConfiguration;
    self->_switcherConfiguration = v4;

    -[PRSwitcherConfiguration configurations](self->_switcherConfiguration, "configurations");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    configurations = self->_configurations;
    self->_configurations = v6;

    -[PBFConfigViewController tableView](self, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (void)_presentPath:(id)a3 mode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerForPath:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v7)
  {
    v8 = (void *)MEMORY[0x1E0D7F8C0];
    objc_msgSend(v7, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionInstanceForIdentity:instanceIdentifier:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 2)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA40]), "initWithProvider:contents:", v11, v13);
      objc_msgSend(v12, "setDelegate:", self);
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBA8]), "initWithProvider:contents:previewing:", v11, v13, a4 == 1);
    }

    objc_msgSend(v12, "setModalPresentationStyle:", 0);
    -[PBFConfigViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

- (id)_previewForPathAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PBFConfigViewController _posterPathAtIndexPath:](self, "_posterPathAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerForPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D7F8C0];
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionInstanceForIdentity:instanceIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v4 && v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBA8]), "initWithProvider:contents:previewing:", v10, v4, 1);

  return v11;
}

- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PBFConfigViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __75__PBFConfigViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadData");
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__PBFConfigViewController_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __114__PBFConfigViewController_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadData");
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  PREditingSceneViewControllerTopButtonLayout *result;
  id v18;

  -[PBFConfigViewController view](self, "view", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "prui_leadingTopButtonFrame");
  retstr->leadingTopButtonFrame.origin.x = v9;
  retstr->leadingTopButtonFrame.origin.y = v10;
  retstr->leadingTopButtonFrame.size.width = v11;
  retstr->leadingTopButtonFrame.size.height = v12;
  objc_msgSend(v18, "prui_trailingTopButtonFrame");
  retstr->trailingTopButtonFrame.origin.x = v13;
  retstr->trailingTopButtonFrame.origin.y = v14;
  retstr->trailingTopButtonFrame.size.width = v15;
  retstr->trailingTopButtonFrame.size.height = v16;

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4 == 1)
  {
    objc_msgSend(v12, "contentsIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D7FA60]);
    objc_msgSend(v13, "_path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v19, 0, v16, v14, 0);

    objc_msgSend(v17, "switcherConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "ingestNewPosterConfiguration:", v20);
    v30 = 0;
    v23 = (id)objc_msgSend(v17, "updateDataStoreForSwitcherConfiguration:reason:error:", v22, CFSTR("PBFConfigViewController ingest new poster"), &v30);
    v24 = v30;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __139__PBFConfigViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v26[3] = &unk_1E86F6238;
    v27 = v12;
    v28 = v24;
    v29 = v15;
    v25 = v24;
    dispatch_async(MEMORY[0x1E0C80D38], v26);

  }
  else
  {
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

uint64_t __139__PBFConfigViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_glue, 0);
}

@end
