@implementation PUPhotoEditCopyEditsViewController

- (PUPhotoEditCopyEditsViewController)initWithCompositionController:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  PUPhotoEditCopyEditsViewController *v8;
  uint64_t v9;
  PECopyEditsConfiguration *configuration;
  uint64_t v11;
  NSArray *sections;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditCopyEditsViewController;
  v8 = -[PUPhotoEditCopyEditsViewController initWithStyle:](&v14, sel_initWithStyle_, 2);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CAC8]), "initWithCompositionController:asset:", v6, v7);
    configuration = v8->_configuration;
    v8->_configuration = (PECopyEditsConfiguration *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    +[PUPhotoEditCopyEditsViewController _sectionsForConfiguration:](PUPhotoEditCopyEditsViewController, "_sectionsForConfiguration:", v8->_configuration);
    v11 = objc_claimAutoreleasedReturnValue();
    sections = v8->_sections;
    v8->_sections = (NSArray *)v11;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PUPhotoEditCopyEditsViewController;
  -[PUPhotoEditCopyEditsViewController viewDidLoad](&v21, sel_viewDidLoad);
  PULocalizedString(CFSTR("PHOTOEDIT_COPY_EDITS_MENU_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCopyEditsViewController setTitle:](self, "setTitle:", v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_COPY_EDITS_MENU_ACTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __49__PUPhotoEditCopyEditsViewController_viewDidLoad__block_invoke;
  v18 = &unk_1E58AB5D0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v8 = (void *)objc_msgSend(v7, "initWithPrimaryAction:", v6, v15, v16, v17, v18);
  objc_msgSend(v8, "setStyle:", 2);
  objc_msgSend(v8, "creatingFixedGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCopyEditsViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTrailingItemGroups:", v10);

  -[PUPhotoEditCopyEditsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoEditCopyEditsViewControllerCellReuseIdentifier"));

  -[PUPhotoEditCopyEditsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsSelection:", 0);

  -[PUPhotoEditCopyEditsViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysBounceVertical:", 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditCopyEditsViewController;
  -[PUPhotoEditCopyEditsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PUPhotoEditCopyEditsViewController _finish](self, "_finish");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PUPhotoEditCopyEditsViewController;
  -[PUPhotoEditCopyEditsViewController viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[PUPhotoEditCopyEditsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PUPhotoEditCopyEditsViewController configuration](self, "configuration", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      v13 = *MEMORY[0x1E0DC1138];
      v14 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v16 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "localizedTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v13;
          v30 = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, v14, v15);
          v21 = v20;

          if (v21 > v16)
            v16 = v21;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v11);
    }
    else
    {
      v16 = 0.0;
    }

  }
  else
  {
    v16 = 0.0;
  }
  if (v16 + 150.0 >= 300.0)
    v22 = v16 + 150.0;
  else
    v22 = 300.0;
  -[PUPhotoEditCopyEditsViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentSize");
  -[PUPhotoEditCopyEditsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v22);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUPhotoEditCopyEditsViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PUPhotoEditCopyEditsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[PUPhotoEditCopyEditsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PUPhotoEditCopyEditsViewControllerCellReuseIdentifier"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "accessoryView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_switchControlDidSwitch_, 4096);
    objc_msgSend(v12, "setAccessoryView:", v13);
    if (objc_msgSend(v11, "identifier") == 6)
      -[PUPhotoEditCopyEditsViewController setSmartSwitch:](self, "setSmartSwitch:", v13);
  }
  objc_msgSend(v11, "localizedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  objc_msgSend(v13, "setTag:", objc_msgSend(v11, "identifier"));
  objc_msgSend(v13, "setOn:", objc_msgSend(v11, "enabled"));

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PUPhotoEditCopyEditsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PUPhotoEditCopyEditsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)switchControlDidSwitch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "tag");
  -[PUPhotoEditCopyEditsViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PFFind();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnabled:", objc_msgSend(v6, "enabled") ^ 1);
  if (objc_msgSend(v6, "identifier") == 2)
  {
    -[PUPhotoEditCopyEditsViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PFFind();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isOn") & 1) == 0)
    {
      objc_msgSend(v9, "setEnabled:", 0);
      -[PUPhotoEditCopyEditsViewController smartSwitch](self, "smartSwitch");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOn:", 0);

    }
    v11 = objc_msgSend(v13, "isOn");
    -[PUPhotoEditCopyEditsViewController smartSwitch](self, "smartSwitch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", v11);

  }
}

- (void)_finish
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  -[PUPhotoEditCopyEditsViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0D7CAF0], "hasValidAdjustmentsInCompositionController:", v4);
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditCopyEditsViewController asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "smartCopyEnabled");
    objc_msgSend(v12, "analyticsPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:configurationAnalyticsPayload:", v4, v7, v8, v9);

  }
  -[PUPhotoEditCopyEditsViewController completionHandler](self, "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PUPhotoEditCopyEditsViewController completionHandler](self, "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, v5);

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (PECopyEditsConfiguration)configuration
{
  return self->_configuration;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (NSArray)sections
{
  return self->_sections;
}

- (UISwitch)smartSwitch
{
  return self->_smartSwitch;
}

- (void)setSmartSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_smartSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartSwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

BOOL __61__PUPhotoEditCopyEditsViewController_switchControlDidSwitch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == *(_QWORD *)(a1 + 32);
}

BOOL __61__PUPhotoEditCopyEditsViewController_switchControlDidSwitch___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == 6;
}

void __49__PUPhotoEditCopyEditsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_76288);

}

+ (BOOL)shouldPresentForCopyingFromCompositionController:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enableSelectiveCopyEdits");

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CAC8]), "initWithCompositionController:asset:", v5, v6);
    +[PUPhotoEditCopyEditsViewController _sectionsForConfiguration:](PUPhotoEditCopyEditsViewController, "_sectionsForConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_sectionsForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PUCopyEditsSettingSection *v7;
  void *v8;
  void *v9;
  PUCopyEditsSettingSection *v10;
  void *v11;
  void *v12;
  PUCopyEditsSettingSection *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[PUCopyEditsSettingSection initWithItems:header:footer:]([PUCopyEditsSettingSection alloc], "initWithItems:header:footer:", v6, 0, 0);
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v3, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PFFind();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [PUCopyEditsSettingSection alloc];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PELocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUCopyEditsSettingSection initWithItems:header:footer:](v10, "initWithItems:header:footer:", v11, 0, v12);

    objc_msgSend(v4, "addObject:", v13);
  }

  return v4;
}

BOOL __64__PUPhotoEditCopyEditsViewController__sectionsForConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == 6;
}

BOOL __64__PUPhotoEditCopyEditsViewController__sectionsForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") != 6;
}

@end
