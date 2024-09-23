@implementation SHSToneController

- (SHSToneController)init
{
  SHSToneController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSToneController;
  v2 = -[SHSToneController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleAlertOverridePolicyDidChangeNotification_, *MEMORY[0x24BEB8DE8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB8DE8], 0);
  -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  if (objc_msgSend(v4, "isViewLoaded"))
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  objc_msgSend(v4, "removeFromParentViewController");
  objc_msgSend(v4, "setDelegate:", 0);

  v6.receiver = self;
  v6.super_class = (Class)SHSToneController;
  -[SHSToneController dealloc](&v6, sel_dealloc);
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SHSToneController;
  -[SHSToneController setSpecifier:](&v17, sel_setSpecifier_, v4);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSToneController setTitle:](self, "setTitle:", v5);

  objc_msgSend(v4, "propertyForKey:", CFSTR("alertType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = TLAlertTypeFromString();
      -[SHSToneController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = PSShouldInsetListView();

      if (v10)
        v11 = 2;
      else
        v11 = 1;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8C88]), "_initWithAlertType:tableViewStyle:", v8, v11);
      objc_msgSend(v4, "propertyForKey:", CFSTR("accountIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v12, "setTopic:", v13);
      if (v8 == 1)
      {
        objc_msgSend(v12, "setShowsNone:", 0);
      }
      else
      {
        objc_msgSend(v12, "setShowsNone:", 1);
        objc_msgSend(v12, "setNoneAtTop:", 1);
      }
      -[SHSToneController _defaultToneIdentifierForTonePickerWithAlertType:topic:](self, "_defaultToneIdentifierForTonePickerWithAlertType:topic:", v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDefaultToneIdentifier:", v14);

      objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentToneIdentifierForAlertType:topic:", v8, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedToneIdentifier:", v16);

      objc_msgSend(v12, "setShowsVibrations:", 1);
      objc_msgSend(v12, "setDelegate:", self);
      -[SHSToneController setTonePickerViewController:](self, "setTonePickerViewController:", v12);
      -[SHSToneController addChildViewController:](self, "addChildViewController:", v12);
      if (-[SHSToneController isViewLoaded](self, "isViewLoaded"))
        -[SHSToneController _insertTonePickerView](self, "_insertTonePickerView");
      objc_msgSend(v12, "didMoveToParentViewController:", self);

    }
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSToneController;
  -[SHSToneController viewDidLoad](&v3, sel_viewDidLoad);
  -[SHSToneController _insertTonePickerView](self, "_insertTonePickerView");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SHSToneController;
  -[SHSToneController viewDidAppear:](&v33, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[SHSToneController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = (void *)MEMORY[0x24BDD19B8];
  if ((isKindOfClass & 1) != 0)
  {
    -[SHSToneController parentController](self, "parentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shs_localizedPathComponentForTonePickerSpecifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v4, "addObject:", v11);
    v12 = objc_alloc(MEMORY[0x24BDD19B8]);
    -[SHSToneController specifier](self, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SHS_BundleForSoundsAndHapticsSettingsFramework();
    v32 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v12, "initWithKey:defaultValue:table:locale:bundleURL:", &stru_24F198178, v14, 0, v15, v17);

    v19 = (void *)MEMORY[0x24BDBCF48];
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[SHSToneController parentController](self, "parentController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "specifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSToneController specifier](self, "specifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.Sounds/%@/%@"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v32;
  }
  else
  {
    -[SHSToneController specifier](self, "specifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shs_localizedPathComponentForTonePickerSpecifier:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      SHSLogForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SHSToneController viewDidAppear:].cold.1(self, v29);

    }
    v30 = (void *)MEMORY[0x24BDBCF48];
    v31 = (void *)MEMORY[0x24BDD17C8];
    -[SHSToneController specifier](self, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.Sounds/%@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URLWithString:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (-[SHSToneController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) && v18)
    -[SHSToneController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v18, v4, v27);

}

- (void)_insertTonePickerView
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[SHSToneController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    PSTableViewSideInset();
    v8 = v7;
    v9 = *MEMORY[0x24BEBE770];
    objc_msgSend(v3, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSectionContentInset:", v9, v8, v9, v8);

  }
  objc_msgSend(v11, "addSubview:", v4);

}

- (void)_updateReloadSpecifierInParentController
{
  id v3;
  void *v4;
  id v5;

  -[SHSToneController parentController](self, "parentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
    -[SHSToneController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSpecifier:", v4);

  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BEB8CC8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedToneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "alertType");
  objc_msgSend(v8, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCurrentToneIdentifier:forAlertType:topic:", v7, v10, v11);
  -[SHSToneController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(v10, "setShowsDefault:", 0);
  objc_msgSend(v10, "setShowsUserGenerated:", 1);
  objc_msgSend(v10, "setShowsNone:", 1);
  objc_msgSend(v10, "setShowsEditButtonInNavigationBar:", 1);
  v7 = objc_msgSend(v6, "alertType");
  objc_msgSend(v6, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSToneController _defaultVibrationIdentifierForVibrationPickerWithAlertType:topic:](self, "_defaultVibrationIdentifierForVibrationPickerWithAlertType:topic:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultVibrationIdentifier:", v9);

  objc_msgSend(v10, "setAllowsDeletingDefaultVibration:", 1);
  objc_msgSend(v10, "setDelegate:", self);
  -[SHSToneController setVibrationPickerViewController:](self, "setVibrationPickerViewController:", v10);

}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
  objc_msgSend(a4, "setDelegate:", 0);
  -[SHSToneController setVibrationPickerViewController:](self, "setVibrationPickerViewController:", 0);
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BEB8CD8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedVibrationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "alertType");
  objc_msgSend(v8, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCurrentVibrationIdentifier:forAlertType:topic:", v7, v10, v11);
  -[SHSToneController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
}

- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SHSToneController__handleAlertOverridePolicyDidChangeNotification___block_invoke;
  block[3] = &unk_24F1978D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __69__SHSToneController__handleAlertOverridePolicyDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "tonePickerViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v9, "alertType");
  objc_msgSend(v9, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_defaultToneIdentifierForTonePickerWithAlertType:topic:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultToneIdentifier:", v4);

  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentToneIdentifierForAlertType:topic:", v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedToneIdentifier:", v6);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "vibrationPickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_defaultVibrationIdentifierForVibrationPickerWithAlertType:topic:", v2, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultVibrationIdentifier:", v8);

  }
}

- (id)_defaultToneIdentifierForTonePickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultToneIdentifierForAlertType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSpecificDefaultToneIdentifierForAlertType:topic:", a3, v5);

    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "defaultToneIdentifierForAlertType:topic:", a3, v5);
    else
      objc_msgSend(v10, "currentToneIdentifierForAlertType:", a3);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVibrationIdentifierForAlertType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSpecificDefaultVibrationIdentifierForAlertType:topic:", a3, v5);

    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "defaultVibrationIdentifierForAlertType:topic:", a3, v5);
    else
      objc_msgSend(v10, "currentVibrationIdentifierForAlertType:", a3);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tonePickerViewController, a3);
}

- (TKVibrationPickerViewController)vibrationPickerViewController
{
  return self->_vibrationPickerViewController;
}

- (void)setVibrationPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_vibrationPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationPickerViewController, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[SHSToneController viewDidAppear:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_228D17000, a2, OS_LOG_TYPE_ERROR, "%s shs_localizedPathComponentForTonePickerSpecifier returned nil for specifier: %@", (uint8_t *)&v4, 0x16u);

}

@end
