@implementation WFNetworkSettingsViewController

- (WFNetworkSettingsViewController)initWithConfig:(id)a3
{
  return -[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:](self, "initWithConfig:detailsContext:hardwareMACAddress:", a3, 0, 0);
}

- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WFNetworkSettingsViewController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:](self, "initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:", v10, v9, v8, v11);

  return v12;
}

- (WFNetworkSettingsViewController)initWithConfig:(id)a3 detailsContext:(id)a4 hardwareMACAddress:(id)a5 appearanceProxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  WFNetworkSettingsViewController *v15;
  WFNetworkSettingsConfig *v16;
  WFNetworkSettingsConfig *config;
  WFDetailsProviderContext **p_context;
  unint64_t v19;
  NSString *v20;
  NSString *randomMACAddress;
  unint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 isDeviceInDemoMode;
  void *v29;
  os_log_type_t v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (v33.receiver = self,
        v33.super_class = (Class)WFNetworkSettingsViewController,
        v15 = -[WFNetworkSettingsViewController initWithStyle:](&v33, sel_initWithStyle_, objc_msgSend(v13, "tableViewStyle")), self = v15, v10)&& v15)
  {
    v16 = (WFNetworkSettingsConfig *)objc_msgSend(v10, "copy");
    config = self->_config;
    self->_config = v16;

    p_context = &self->_context;
    objc_storeStrong((id *)&self->_context, a4);
    objc_storeStrong((id *)&self->_hardwareMACAddress, a5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(v11, "privateAddressMode");
    else
      v19 = 0;
    self->_privateAddressMode = v19;
    -[WFDetailsProviderContext randomMACAddress](*p_context, "randomMACAddress");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    randomMACAddress = self->_randomMACAddress;
    self->_randomMACAddress = v20;

    self->_randomFeatureEnabled = (objc_msgSend(v11, "requestedFields") & 0x400) != 0;
    objc_storeStrong((id *)&self->_appearanceProxy, a6);
    self->_isDeviceInDemoMode = 0;
    self->_isRandomMACManageFeatureEnabled = _os_feature_enabled_impl();
    self->_isRotatingTurnedOnForMigratedNetwork = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = -[WFDetailsProviderContext scrollToCellType](*p_context, "scrollToCellType");
      self->_scrollToCellType = v22;
      -[WFNetworkSettingsViewController scrollToCell:](self, "scrollToCell:", v22);
    }
    if (objc_opt_class())
    {
      objc_msgSend(MEMORY[0x24BE676A0], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v24 = objc_msgSend(v23, "isStoreDemoModeEnabled:", &v32);
      v25 = v32;
      self->_isDeviceInDemoMode = v24;

      WFLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v26 && os_log_type_enabled(v26, v27))
      {
        isDeviceInDemoMode = self->_isDeviceInDemoMode;
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:]";
        v36 = 1024;
        v37 = isDeviceInDemoMode;
        _os_log_impl(&dword_2196CC000, v26, v27, "%s INIT : Device in demo mode ? [%hhu]", buf, 0x12u);
      }

    }
    else
    {
      WFLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      v31 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v31))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFNetworkSettingsViewController initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:]";
        _os_log_impl(&dword_2196CC000, v25, v31, "%s: INIT : runtime check failed for MSDKDemoState ", buf, 0xCu);
      }
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_allowViewPassword = objc_msgSend(v11, "isCredentialsVisible");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "daDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      self->_accessory = v29 != 0;

    }
    self->_credentailCellTapped = 0;
    self->_detailViewControllerVisible = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFNetworkSettingsCellFactory *v14;
  void *v15;
  WFNetworkSettingsCellFactory *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)WFNetworkSettingsViewController;
  -[WFNetworkSettingsViewController viewDidLoad](&v26, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x24BEBE010], 0);

  -[WFNetworkSettingsViewController backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFNetworkSettingsViewController backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  -[WFNetworkSettingsViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController _autoJoinRowsFromContext:](self, "_autoJoinRowsFromContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController setAutoJoinSectionRows:](self, "setAutoJoinSectionRows:", v9);

  -[WFNetworkSettingsViewController config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController _sectionsFromConfig:context:](self, "_sectionsFromConfig:context:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController setSections:](self, "setSections:", v12);

  -[WFNetworkSettingsViewController sections](self, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController _logSections:](self, "_logSections:", v13);

  v14 = [WFNetworkSettingsCellFactory alloc];
  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFNetworkSettingsCellFactory initWithTableView:](v14, "initWithTableView:", v15);
  -[WFNetworkSettingsViewController setCellFactory:](self, "setCellFactory:", v16);

  -[WFNetworkSettingsViewController config](self, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayFriendlyName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController setTitle:](self, "setTitle:", v18);

  if (objc_msgSend(MEMORY[0x24BEBD538], "currentIsIPad"))
  {
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);

  }
  v20 = *MEMORY[0x24BEBE770];
  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRowHeight:", v20);

  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEstimatedRowHeight:", v20);

  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSectionFooterHeight:", v20);

  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEstimatedSectionFooterHeight:", v20);

  -[WFNetworkSettingsViewController _updateManagedNetworkHeader](self, "_updateManagedNetworkHeader");
  if (_os_feature_enabled_impl())
    -[WFNetworkSettingsViewController _setupAccessoryHeader](self, "_setupAccessoryHeader");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFNetworkSettingsViewController;
  -[WFNetworkSettingsViewController dealloc](&v4, sel_dealloc);
}

- (void)refreshConfig:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  WFNetworkSettingsConfig *config;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WFNetworkSettingsConfig isEqual:](self->_config, "isEqual:", v4);
  if (!v4 || v5)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      v16 = 136315138;
      v17 = "-[WFNetworkSettingsViewController refreshConfig:]";
      _os_log_impl(&dword_2196CC000, v14, v15, "%s- config was unchanged.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[WFNetworkSettingsViewController setConfig:](self, "setConfig:", v6);

    -[WFNetworkSettingsViewController config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController _sectionsFromConfig:context:](self, "_sectionsFromConfig:context:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController setSections:](self, "setSections:", v9);

    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      config = self->_config;
      v16 = 138412290;
      v17 = (const char *)config;
      _os_log_impl(&dword_2196CC000, v10, v11, "Refreshed settings config %@", (uint8_t *)&v16, 0xCu);
    }

    -[WFNetworkSettingsViewController sections](self, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController _logSections:](self, "_logSections:", v13);

    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject reloadData](v14, "reloadData");
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[WFNetworkSettingsViewController alert](self, "alert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFNetworkSettingsViewController alert](self, "alert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)WFNetworkSettingsViewController;
  -[WFNetworkSettingsViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  if (-[WFNetworkSettingsViewController networkQualitySpinning](self, "networkQualitySpinning"))
  {
    -[WFNetworkSettingsViewController setNetworkQualitySpinning:](self, "setNetworkQualitySpinning:", 0);
    -[WFNetworkSettingsViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelNetworkQualityRun");

  }
}

- (id)_autoJoinRowsFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "autoJoinConfigurable");

  if (v7)
    objc_msgSend(v5, "addObject:", &unk_24DB59998);
  -[WFNetworkSettingsViewController config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autoLoginConfigurable");

  if (v9)
    objc_msgSend(v5, "addObject:", &unk_24DB599B0);
  if ((objc_opt_respondsToSelector() & 1) != 0 && !-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    objc_msgSend(v4, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
      objc_msgSend(v5, "addObject:", &unk_24DB599C8);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    objc_msgSend(v4, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
      objc_msgSend(v5, "addObject:", &unk_24DB599E0);
  }

  return v5;
}

- (id)_sectionsFromConfig:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    objc_msgSend(v6, "healthRecommendations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
      objc_msgSend(v8, "addObject:", &unk_24DB59998);
    -[WFNetworkSettingsViewController _portalURL](self, "_portalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v8, "addObject:", &unk_24DB599B0);
  }
  if (objc_msgSend(v6, "diagnosable"))
    objc_msgSend(v8, "addObject:", &unk_24DB599F8);
  if ((objc_msgSend(v7, "requestedFields") & 0x1000) != 0 || (objc_msgSend(v7, "requestedFields") & 0x4000) != 0)
    objc_msgSend(v8, "addObject:", &unk_24DB59A10);
  if (objc_msgSend(v6, "joinable"))
    objc_msgSend(v8, "addObject:", &unk_24DB599C8);
  if (objc_msgSend(v6, "forgetable"))
    objc_msgSend(v8, "addObject:", &unk_24DB59A28);
  if (!-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    -[WFNetworkSettingsViewController autoJoinSectionRows](self, "autoJoinSectionRows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      objc_msgSend(v8, "addObject:", &unk_24DB599E0);
    if (objc_msgSend(v6, "saveDataModeConfigurable"))
      objc_msgSend(v8, "addObject:", &unk_24DB59A40);
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "isWifiModeConfigurable"))
      objc_msgSend(v8, "addObject:", &unk_24DB59A58);
    if (self->_randomFeatureEnabled)
      objc_msgSend(v8, "addObject:", &unk_24DB59A70);
    if (objc_msgSend(v6, "privacyProxyTierStatus"))
      objc_msgSend(v8, "addObject:", &unk_24DB59A88);
    if (objc_msgSend(v6, "networkQualityVisible"))
    {
      if (!-[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
      {
        objc_msgSend(v6, "networkQualityResponsiveness");
        if (v14 != 0.0
          || (-[WFNetworkSettingsViewController context](self, "context"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isCurrent"),
              v15,
              v16))
        {
          objc_msgSend(v8, "addObject:", &unk_24DB59AA0);
        }
      }
    }
  }
  objc_msgSend(v8, "addObject:", &unk_24DB59AB8);
  if (-[WFNetworkSettingsViewController _shouldShowIPv6ForConfig:](self, "_shouldShowIPv6ForConfig:", v6))
    objc_msgSend(v8, "addObject:", &unk_24DB59AD0);
  objc_msgSend(v8, "addObject:", &unk_24DB59AE8);
  if (objc_msgSend(v6, "httpProxyConfigurable"))
    objc_msgSend(v8, "addObject:", &unk_24DB59B00);
  if (objc_msgSend(v6, "manageable"))
    objc_msgSend(v8, "addObject:", &unk_24DB59B18);

  return v8;
}

- (void)_httpProxyConfigChanged:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  _QWORD v58[3];
  void *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x24BDAC8D0];
  -[WFNetworkSettingsViewController config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "httpProxyConfig");

  if (v6 != a3)
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "httpProxyConfig");

    -[WFNetworkSettingsViewController config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "httpProxyAuthenticationRequired");

    -[WFNetworkSettingsViewController config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHttpProxyConfig:", a3);

    if (a3 != 1 && v10)
    {
      -[WFNetworkSettingsViewController config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHttpProxyAuthenticationRequired:", 0);

    }
    -[WFNetworkSettingsViewController sections](self, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", &unk_24DB59B00);

    if (a3 == 2)
    {
      if (v8 == 1)
      {
        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "beginUpdates");

        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, v14);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v43;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, v14);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v44;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "deleteRowsAtIndexPaths:withRowAnimation:", v45, 0);

        if (v10)
        {
          -[WFNetworkSettingsViewController tableView](self, "tableView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, v14);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v47;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 5, v14);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v48;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "deleteRowsAtIndexPaths:withRowAnimation:", v49, 0);

        }
        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "endUpdates");

        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reloadRowsAtIndexPaths:withRowAnimation:", v17, 0);
        goto LABEL_24;
      }
      if (v8)
      {
LABEL_26:
        -[WFNetworkSettingsViewController config](self, "config");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setHttpProxyConfig:", a3);

        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v14);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "reloadSections:withRowAnimation:", v53, 5);

        return;
      }
      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertRowsAtIndexPaths:withRowAnimation:", v20, 0);

      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD15D8];
      v22 = 1;
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3)
        {
          if (v8 == 1)
          {
            v33 = (void *)MEMORY[0x24BDBCEB8];
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, v14);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, v14);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "arrayWithObjects:", v34, v35, v36, 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, v14);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v38);

              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 5, v14);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v39);

            }
            -[WFNetworkSettingsViewController tableView](self, "tableView");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "deleteRowsAtIndexPaths:withRowAnimation:", v37, 0);

            goto LABEL_26;
          }
          if (v8 == 2)
          {
            -[WFNetworkSettingsViewController tableView](self, "tableView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v60[0] = v16;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "deleteRowsAtIndexPaths:withRowAnimation:", v17, 0);
LABEL_24:

            goto LABEL_25;
          }
        }
        goto LABEL_26;
      }
      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "beginUpdates");

      if (v8 == 2)
      {
        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deleteRowsAtIndexPaths:withRowAnimation:", v26, 0);

      }
      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v28;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, v14);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v29;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, v14);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "insertRowsAtIndexPaths:withRowAnimation:", v31, 0);

      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "endUpdates");

      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD15D8];
      v22 = 3;
    }
    objc_msgSend(v21, "indexPathForRow:inSection:", v22, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollToRowAtIndexPath:atScrollPosition:animated:", v16, 3, 1);
LABEL_25:

    goto LABEL_26;
  }
}

- (void)_httpProxyAuthChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHttpProxyAuthenticationRequired:", v5);

  -[WFNetworkSettingsViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB59B00);

  v9 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9)
  {
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 5, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v14, 0);

    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 3, 1);
  }
  else
  {
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 5, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 0);

  }
}

- (void)_promptForgetNetwork
{
  _BOOL4 v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    v38 = CFSTR("kWFLocSettingForgetDeviceTitle");
  }
  else
  {
    v3 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
    v4 = CFSTR("kWFLocForgetNetworkTitle");
    if (v3)
      v4 = CFSTR("kWFLocForgetNetworkTitleCH");
    v38 = v4;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v38, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[WFNetworkSettingsViewController config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayFriendlyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v37, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    v10 = CFSTR("kWFLocForgetDeviceMessage");
  }
  else
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "cloudSyncable");
    v13 = CFSTR("kWFLocForgetNetworkMessage");
    if (v12)
      v13 = CFSTR("kWFLocForgetNetworkSyncedMessage");
    v10 = v13;

    if (-[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
    {
      -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("_CH"));
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v14;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    objc_msgSend(MEMORY[0x24BDB3D90], "forgetDeviceAlertTitle");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB3D90], "forgetDeviceAlertBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v17;
      v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_2196CC000, v19, v20, "Replacing alert title with: %@, replacing alert message text with: %@", buf, 0x16u);
    }

    v21 = (void *)v17;
  }
  else
  {
    v18 = v16;
    v21 = v9;
  }
  v36 = v21;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocForgetNetworkForgetButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("kWFLocForgetNetworkCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkSettingsViewController isAccessory](self, "isAccessory"))
  {
    objc_msgSend(MEMORY[0x24BDB3D90], "forgetDeviceAlertConfirm");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB3D90], "forgetDeviceAlertCancel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 138412546;
      v44 = (uint64_t)v27;
      v45 = 2112;
      v46 = v28;
      _os_log_impl(&dword_2196CC000, v29, v30, "Replacing confirm title with: %@, replacing cancel text with: %@", buf, 0x16u);
    }

  }
  else
  {
    v27 = v24;
    v28 = v26;
  }
  objc_initWeak((id *)buf, self);
  v31 = (void *)MEMORY[0x24BEBD3A8];
  v32 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke;
  v41[3] = &unk_24DB37D80;
  objc_copyWeak(&v42, (id *)buf);
  v41[4] = self;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v27, 2, v41);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v33);

  v34 = (void *)MEMORY[0x24BEBD3A8];
  v39[0] = v32;
  v39[1] = 3221225472;
  v39[2] = __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke_2;
  v39[3] = &unk_24DB376C0;
  objc_copyWeak(&v40, (id *)buf);
  objc_msgSend(v34, "actionWithTitle:style:handler:", v28, 1, v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v35);

  -[WFNetworkSettingsViewController setAlert:](self, "setAlert:", v22);
  -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

}

void __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forget");
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkSettingsViewControllerDidForgetNetwork:", *(_QWORD *)(a1 + 32));
  }

  objc_msgSend(WeakRetained, "setAlert:", 0);
}

void __55__WFNetworkSettingsViewController__promptForgetNetwork__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlert:", 0);

}

- (BOOL)_showDemoModeFeatureDisabledAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id location;

  if (!self->_isDemoModeAlertShowing)
  {
    self->_isDemoModeAlertShowing = 1;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACDeviceInDemoAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACDeviceInDemoAlertBody"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACDeviceInDemoAlertButtonOk"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__WFNetworkSettingsViewController__showDemoModeFeatureDisabledAlert__block_invoke;
    v13[3] = &unk_24DB37D80;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    -[WFNetworkSettingsViewController setAlert:](self, "setAlert:", v7);
    -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return 1;
}

void __68__WFNetworkSettingsViewController__showDemoModeFeatureDisabledAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1080) = 0;
  objc_msgSend(WeakRetained, "setAlert:", 0);

}

- (void)_promptOverrideWiFiOutrankedForPrivateCellular:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __82__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedForPrivateCellular___block_invoke;
  v14 = &unk_24DB37DA8;
  objc_copyWeak(&v15, &location);
  v5 = _Block_copy(&v11);
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedForPrivateCellular:]";
    _os_log_impl(&dword_2196CC000, v6, v7, "%s: showing cellular outrank prompt", buf, 0xCu);
  }

  -[WFNetworkSettingsViewController config](self, "config", v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayFriendlyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCellularOutrankAlertController cellularOutrankAlertControllerWithNetworkName:chinaDevice:privateCellular:completionHandler:](WFCellularOutrankAlertController, "cellularOutrankAlertControllerWithNetworkName:chinaDevice:privateCellular:completionHandler:", v9, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"), v3, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkSettingsViewController setAlert:](self, "setAlert:", v10);
  -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __82__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedForPrivateCellular___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (a2)
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v4, v5, "User accepted celluar outrank prompt", buf, 2u);
    }

    objc_msgSend(WeakRetained, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideWiFiOutrank");

    objc_msgSend(WeakRetained, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sectionsFromConfig:context:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSections:", v11);

    objc_msgSend(WeakRetained, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_logSections:", v12);

    objc_msgSend(WeakRetained, "tableView");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject reloadData](v4, "reloadData");
  }
  else if (v7 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2196CC000, v4, v5, "User declined celluar outrank prompt", v13, 2u);
  }

  objc_msgSend(WeakRetained, "setAlert:", 0);
}

- (void)_promptOverrideWiFiOutrankedDev
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v8 = 136315138;
    v9 = "-[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedDev]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: showing developer outrank prompt", (uint8_t *)&v8, 0xCu);
  }

  -[WFNetworkSettingsViewController config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayFriendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDeveloperOutrankAlertController developerOutrankAlertControllerWithNetworkName:chinaDevice:completionHandler:](WFDeveloperOutrankAlertController, "developerOutrankAlertControllerWithNetworkName:chinaDevice:completionHandler:", v6, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"), &__block_literal_global_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __66__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedDev__block_invoke(uint64_t a1, int a2)
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE75620], "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=DEVELOPER_SETTINGS&path=NCO"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processURL:animated:fromSearch:withCompletion:", v2, 1, 0, &__block_literal_global_94);

  }
  else
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v3, v4, "User bypassed option to go to developer settings", buf, 2u);
    }

  }
}

void __66__WFNetworkSettingsViewController__promptOverrideWiFiOutrankedDev__block_invoke_2()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t v2[16];

  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2196CC000, v0, v1, "User taken to developer settings", v2, 2u);
  }

}

- (BOOL)_isIPv4ConfigAuto
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFNetworkSettingsViewController config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ipv4Config"))
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ipv4Config") == 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFNetworkSettingsViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint8_t v29[16];

  v5 = 1;
  switch(-[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4))
  {
    case 0:
      -[WFNetworkSettingsViewController config](self, "config");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "healthRecommendations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "count");

      goto LABEL_6;
    case 1:
      return 2;
    case 2:
    case 4:
    case 6:
    case 8:
    case 10:
    case 12:
    case 14:
    case 16:
    case 17:
      return 1;
    case 3:
      -[WFNetworkSettingsViewController autoJoinSectionRows](self, "autoJoinSectionRows");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "count");
LABEL_6:

      return v5;
    case 5:
      -[WFNetworkSettingsViewController config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "current");

      -[WFNetworkSettingsViewController config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "ipv4Config");
      if (v10)
      {
        if (v12)
        {
LABEL_9:

          return 4;
        }
        -[WFNetworkSettingsViewController config](self, "config");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dhcpClientID");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {

          goto LABEL_9;
        }
        v23 = (void *)v22;
        -[WFNetworkSettingsViewController config](self, "config");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dhcpClientID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
          return 5;
        else
          return 4;
      }
      else
      {
        if (v12 == 2)
          v5 = 4;
        else
          v5 = 1;

      }
      return v5;
    case 7:
      -[WFNetworkSettingsViewController config](self, "config");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[WFNetworkSettingsViewController _shouldShowIPv6ForConfig:](self, "_shouldShowIPv6ForConfig:", v13);

      if (v14)
        return 2;
      else
        return 0;
    case 9:
      return v5;
    case 11:
      -[WFNetworkSettingsViewController config](self, "config");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v15, "saveDataModeConfigurable");

      return v5;
    case 13:
      -[WFNetworkSettingsViewController config](self, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "networkQualityVisible")
        && !-[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
      {
        -[WFNetworkSettingsViewController config](self, "config");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "networkQualityResponsiveness");
        if (v20 == 0.0)
        {
          -[WFNetworkSettingsViewController context](self, "context");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isCurrent");

          if ((v28 & 1) == 0)
            goto LABEL_17;
        }
        else
        {

        }
        return 1;
      }

LABEL_17:
      WFLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2196CC000, v17, v18, "NetQuality: WFNetworkSettingsNetworkQuality set but it shouldn't", v29, 2u);
      }

      return 0;
    case 15:
      if (!self->_randomFeatureEnabled)
        return 0;
      return 2;
    default:
      return 0;
  }
}

- (void)_reloadNetworkQuality
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[WFNetworkSettingsViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", &unk_24DB59AA0);

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 5);

  }
}

- (void)_runNetworkQuality
{
  BOOL v3;
  NSObject *v4;
  os_log_type_t v5;
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
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkSettingsViewController config](self, "config");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "current"))
  {
    v3 = -[WFNetworkSettingsViewController networkQualitySpinning](self, "networkQualitySpinning");

    if (!v3)
    {
      WFLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[WFNetworkSettingsViewController _runNetworkQuality]";
        _os_log_impl(&dword_2196CC000, v4, v5, "NetQuality: %s: User scheduled a run", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertText"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertContinue"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertCancel"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_104);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v15);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_105;
      v18[3] = &unk_24DB378E8;
      v18[4] = self;
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v11, 0, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v16);
      objc_msgSend(v14, "setPreferredAction:", v16);
      -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

    }
  }
  else
  {

  }
}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke()
{
  NSObject *v0;
  os_log_type_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    v2 = 136315138;
    v3 = "-[WFNetworkSettingsViewController _runNetworkQuality]_block_invoke";
    _os_log_impl(&dword_2196CC000, v0, v1, "NetQuality: %s: User canceled test-run", (uint8_t *)&v2, 0xCu);
  }

}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_105(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "setNetworkQualitySpinning:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkQuality");
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_2;
  v3[3] = &unk_24DB378C0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "runNetworkQualityWithCompletionHandler:", v3);

}

void __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  char v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  char v12;

  v4 = a2;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    objc_msgSend(v7, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNetworkQualityResponsiveness:", a4);

    objc_msgSend(*(id *)(a1 + 32), "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNetworkQualityDate:", v8);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_3;
  v11[3] = &unk_24DB37898;
  v12 = v4;
  v11[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
}

uint64_t __53__WFNetworkSettingsViewController__runNetworkQuality__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "networkQualitySpinning"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureText"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureOK"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v9);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setNetworkQualitySpinning:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkQuality");
}

- (void)_fillNetworkQualityCell:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  if (!-[WFNetworkSettingsViewController networkQualitySpinning](self, "networkQualitySpinning"))
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkQualityResponsiveness");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 0.0)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityNoData"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
LABEL_14:

      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitle:forState:", v26, 0);
      objc_msgSend(v4, "setAccessoryView:", v22);
      objc_msgSend(v4, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "font");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFont:", v24);

      objc_msgSend(v22, "sizeToFit");
      objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__runNetworkQuality, 64);

      goto LABEL_15;
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityRPM"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEDCBF8];
    -[WFNetworkSettingsViewController config](self, "config");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "networkQualityResponsiveness");
    v14 = objc_msgSend(v11, "ratingForResponsivenessScore:", (uint64_t)v13);

    if (v14 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityHigh");
    }
    else if (v14 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityMedium");
    }
    else
    {
      if (v14)
      {
        v18 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityLow");
    }
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[WFNetworkSettingsViewController config](self, "config");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "networkQualityResponsiveness");
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%u %@)"), v18, v21, v10);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "setAccessoryView:", v26);

  objc_msgSend(v26, "startAnimating");
LABEL_15:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
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
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  os_log_type_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  os_log_type_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  _BOOL4 v89;
  __CFString *v90;
  void *v91;
  __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  char v109;
  void *v110;
  void *v111;
  _BOOL4 v112;
  void *v113;
  void *v114;
  _BOOL4 v115;
  void *v116;
  void *v117;
  _BOOL4 v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  os_log_type_t v137;
  NSObject *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  _BOOL4 v142;
  const char *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint8_t buf[4];
  const char *v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  const char *v159;
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  switch(-[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v5, "section")))
  {
    case 0:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recommendationCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "healthRecommendations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "issueTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      objc_msgSend(v8, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);

      objc_msgSend(v11, "issueDetailText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      objc_msgSend(v8, "descriptionLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextColor:", v19);
      goto LABEL_115;
    case 1:
      if (v6 == 1)
      {
        -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "forgetCellAtIndexPath:accessory:", v5, -[WFNetworkSettingsViewController isAccessory](self, "isAccessory"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkPortalButtonTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textLabel");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_114;
      }
      if (v6)
        goto LABEL_34;
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recommendationCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkPortalTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v22);

      objc_msgSend(v8, "titleLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTextColor:", v25);

      -[WFNetworkSettingsViewController _portalURL](self, "_portalURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v11);
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkPortalDescriptionFormat"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "host");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v30);

      objc_msgSend(v8, "descriptionLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTextColor:", v32);
      goto LABEL_21;
    case 2:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "joinCellAtIndexPath:", v5);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 3:
      -[WFNetworkSettingsViewController autoJoinSectionRows](self, "autoJoinSectionRows");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndex:", objc_msgSend(v5, "row"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "integerValue");

      switch(v36)
      {
        case 0:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "autoJoinCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFNetworkSettingsViewController autoJoinSwitch](self, "autoJoinSwitch");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAccessoryView:", v38);

          if (-[WFNetworkSettingsViewController _isAutoJoinConfigurable](self, "_isAutoJoinConfigurable"))
          {
            -[WFNetworkSettingsViewController config](self, "config");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "autoJoinEnabled");
            -[WFNetworkSettingsViewController autoJoinSwitch](self, "autoJoinSwitch");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setOn:", v40);

            -[WFNetworkSettingsViewController autoJoinSwitch](self, "autoJoinSwitch");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v42;
            v43 = 1;
          }
          else
          {
            -[WFNetworkSettingsViewController autoJoinSwitch](self, "autoJoinSwitch");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "setOn:", 0);

            -[WFNetworkSettingsViewController autoJoinSwitch](self, "autoJoinSwitch");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v42;
            v43 = 0;
          }
          objc_msgSend(v42, "setEnabled:", v43);
          goto LABEL_117;
        case 1:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "autoLoginCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFNetworkSettingsViewController autoLoginSwitch](self, "autoLoginSwitch");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAccessoryView:", v104);

          -[WFNetworkSettingsViewController config](self, "config");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v11, "autoLoginEnabled");
          -[WFNetworkSettingsViewController autoLoginSwitch](self, "autoLoginSwitch");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 2:
          -[WFNetworkSettingsViewController context](self, "context");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_opt_respondsToSelector();

          if ((v106 & 1) != 0)
          {
            -[WFNetworkSettingsViewController context](self, "context");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "username");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v11 = 0;
          }
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WFNetworkSettingsViewController allowViewPassword](self, "allowViewPassword"))
            v128 = -[WFNetworkSettingsViewController credentailCellTapped](self, "credentailCellTapped") ^ 1;
          else
            v128 = 1;
          v129 = v18;
          v130 = v5;
          v131 = v11;
          v132 = 0;
          break;
        case 3:
          -[WFNetworkSettingsViewController context](self, "context");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_opt_respondsToSelector();

          if ((v109 & 1) != 0)
          {
            -[WFNetworkSettingsViewController context](self, "context");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "password");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v11 = 0;
          }
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WFNetworkSettingsViewController allowViewPassword](self, "allowViewPassword"))
            v128 = -[WFNetworkSettingsViewController credentailCellTapped](self, "credentailCellTapped") ^ 1;
          else
            v128 = 1;
          v129 = v18;
          v130 = v5;
          v131 = v11;
          v132 = 1;
          break;
        default:
          goto LABEL_34;
      }
      objc_msgSend(v129, "credentialsViewerCellAtIndexPath:credentails:hideCredentials:isPassword:", v130, v131, v128, v132);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_116;
    case 4:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "forgetCellAtIndexPath:accessory:", v5, -[WFNetworkSettingsViewController isAccessory](self, "isAccessory"));
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 5:
      switch(v6)
      {
        case 0:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "ipv4AddressConfigCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFNetworkSettingsViewController config](self, "config");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "ipv4Config");

          if (!v46)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v49;
            v50 = CFSTR("kWFLocSettingsIPV4ConfigureAutomatic");
            goto LABEL_112;
          }
          -[WFNetworkSettingsViewController config](self, "config");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "ipv4Config");

          if (v48 == 2)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v49;
            v50 = CFSTR("kWFLocSettingsIPV4ConfigureManual");
            goto LABEL_112;
          }
          -[WFNetworkSettingsViewController config](self, "config");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = objc_msgSend(v144, "ipv4Config");

          if (v145 != 1)
            goto LABEL_118;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v49;
          v50 = CFSTR("kWFLocSettingsIPV4ConfigureBootP");
          break;
        case 1:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "ipv4AddressCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v112 = -[WFNetworkSettingsViewController _isIPv4ConfigAuto](self, "_isIPv4ConfigAuto");
          -[WFNetworkSettingsViewController config](self, "config");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v113;
          if (v112)
            objc_msgSend(v113, "ipv4Address");
          else
            objc_msgSend(v113, "ipv4AddressManual");
          goto LABEL_78;
        case 2:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "ipv4SubnetMaskCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v115 = -[WFNetworkSettingsViewController _isIPv4ConfigAuto](self, "_isIPv4ConfigAuto");
          -[WFNetworkSettingsViewController config](self, "config");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v116;
          if (v115)
            objc_msgSend(v116, "ipv4SubnetMask");
          else
            objc_msgSend(v116, "ipv4SubnetMaskManual");
          goto LABEL_78;
        case 3:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "ipv4RouterCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = -[WFNetworkSettingsViewController _isIPv4ConfigAuto](self, "_isIPv4ConfigAuto");
          -[WFNetworkSettingsViewController config](self, "config");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v119;
          if (v118)
            objc_msgSend(v119, "ipv4RouterAddress");
          else
            objc_msgSend(v119, "ipv4RouterAddressManual");
LABEL_78:
          v100 = objc_claimAutoreleasedReturnValue();
          goto LABEL_113;
        case 4:
          -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "dhcpClientIDCellAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFNetworkSettingsViewController config](self, "config");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "dhcpClientID");
          v100 = objc_claimAutoreleasedReturnValue();
          goto LABEL_113;
        default:
          goto LABEL_34;
      }
      goto LABEL_112;
    case 6:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "renewLeaseCellAtIndexPath:", v5);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 7:
      if (v6 == 1)
      {
        -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "ipv6RouterCellAtIndexPath:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFNetworkSettingsViewController config](self, "config");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ipv6RouterAddress");
        v100 = objc_claimAutoreleasedReturnValue();
        goto LABEL_113;
      }
      if (v6)
      {
LABEL_34:
        v8 = 0;
        goto LABEL_118;
      }
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "ipv6AddressCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController config](self, "config");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "ipv6Addresses");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (!v54)
        goto LABEL_118;
      objc_msgSend(v8, "setAccessoryType:", 0);
      if (v54 != 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsAddressesTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu %@"), v54, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "detailTextLabel");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setText:", v125);

        objc_msgSend(v8, "setAccessoryType:", 1);
        objc_msgSend(v8, "setSelectionStyle:", 1);

        goto LABEL_118;
      }
      -[WFNetworkSettingsViewController config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ipv6Addresses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "detailTextLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v19);
LABEL_21:

      goto LABEL_115;
    case 8:
      if (v6)
        goto LABEL_34;
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "dnsConfigureCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v11, "dnsConfig");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (v56)
        v59 = CFSTR("kWFLocSettingsDNSConfigureManual");
      else
        v59 = CFSTR("kWFLocSettingsDNSConfigureAutomatic");
      objc_msgSend(v57, "localizedStringForKey:value:table:", v59, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "detailTextLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setText:", v60);

      goto LABEL_37;
    case 9:
      if (v6)
        goto LABEL_34;
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "httpProxyConfigCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController config](self, "config");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "httpProxyConfig");

      if (v64)
      {
        -[WFNetworkSettingsViewController config](self, "config");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "httpProxyConfig");

        if (v66 == 2)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v49;
          v50 = CFSTR("kWFLocSettingsProxyConfigAutomaticTitle");
        }
        else
        {
          -[WFNetworkSettingsViewController config](self, "config");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v121, "httpProxyConfig");

          if (v122 != 1)
            goto LABEL_118;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v49;
          v50 = CFSTR("kWFLocSettingsProxyConfigManualTitle");
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v49;
        v50 = CFSTR("kWFLocSettingsProxyConfigOffTitle");
      }
LABEL_112:
      objc_msgSend(v49, "localizedStringForKey:value:table:", v50, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v100 = objc_claimAutoreleasedReturnValue();
LABEL_113:
      v18 = (void *)v100;
      objc_msgSend(v8, "detailTextLabel");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_114:
      v19 = v98;
      objc_msgSend(v98, "setText:", v18);
LABEL_115:

      goto LABEL_116;
    case 10:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "manageCellAtIndexPath:", v5);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 11:
      -[WFNetworkSettingsViewController config](self, "config");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "saveDataModeConfigurable");

      if (!v68)
        goto LABEL_34;
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "saveDataModeCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController saveDataModeSwitch](self, "saveDataModeSwitch");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryView:", v70);

      -[WFNetworkSettingsViewController config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v11, "isInSaveDataMode");
      -[WFNetworkSettingsViewController saveDataModeSwitch](self, "saveDataModeSwitch");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
      v58 = v72;
      objc_msgSend(v72, "setOn:", v71);
LABEL_37:

      goto LABEL_117;
    case 12:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "privacyProxyEnabledCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController privacyProxyEnabledSwitch](self, "privacyProxyEnabledSwitch");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryView:", v74);

      -[WFNetworkSettingsViewController config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v11, "privacyProxyEnabled");
      -[WFNetworkSettingsViewController privacyProxyEnabledSwitch](self, "privacyProxyEnabledSwitch");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 13:
      -[WFNetworkSettingsViewController config](self, "config");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v75, "networkQualityVisible")
        || -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
      {

        goto LABEL_41;
      }
      -[WFNetworkSettingsViewController config](self, "config");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "networkQualityResponsiveness");
      if (v102 == 0.0)
      {
        -[WFNetworkSettingsViewController context](self, "context");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v133, "isCurrent");

        if (!v134)
        {
LABEL_41:
          WFLogForCategory(0);
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v76 && os_log_type_enabled(v76, v77))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2196CC000, v76, v77, "NetQuality: WFNetworkSettingsNetworkQuality set but it shouldn't", buf, 2u);
          }

          v8 = 0;
          goto LABEL_119;
        }
      }
      else
      {

      }
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "networkQualityCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v136)
      {
        v138 = v136;
        if (os_log_type_enabled(v138, v137))
        {
          -[WFNetworkSettingsViewController config](self, "config");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "networkQualityResponsiveness");
          v141 = v140;
          v142 = -[WFNetworkSettingsViewController networkQualitySpinning](self, "networkQualitySpinning");
          v143 = "NO";
          v155 = "-[WFNetworkSettingsViewController tableView:cellForRowAtIndexPath:]";
          *(_DWORD *)buf = 136315650;
          if (v142)
            v143 = "YES";
          v156 = 2048;
          v157 = v141;
          v158 = 2080;
          v159 = v143;
          _os_log_impl(&dword_2196CC000, v138, v137, "NetQuality: %s: Responsiveness is %.1f, execution running? %s", buf, 0x20u);

        }
      }

      -[WFNetworkSettingsViewController _fillNetworkQualityCell:](self, "_fillNetworkQualityCell:", v8);
LABEL_119:
      -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "cellTextLabelFont");
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (v149)
      {
        -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "cellTextLabelFont");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textLabel");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "setFont:", v151);

      }
      return v8;
    case 14:
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, 0);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDiagnosticsTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setText:", v79);

      objc_msgSend(MEMORY[0x24BEBD4B8], "defaultButtonColor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "detailTextLabel");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setTextColor:", v81);

      objc_msgSend(v8, "setAccessoryType:", 1);
      objc_msgSend(v8, "setSelectionStyle:", 1);
      goto LABEL_118;
    case 15:
      -[WFNetworkSettingsViewController _macAddressToDisplay](self, "_macAddressToDisplay");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v83)
      {
        WFLogForCategory(0);
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = OSLogForWFLogLevel(2uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 2 && v84 && os_log_type_enabled(v84, v85))
        {
          *(_DWORD *)buf = 136315138;
          v155 = "-[WFNetworkSettingsViewController tableView:cellForRowAtIndexPath:]";
          _os_log_impl(&dword_2196CC000, v84, v85, "%s - MAC address to display is empty", buf, 0xCu);
        }

      }
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "randomMACCellAtIndexPath:chinaDevice:", v5, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "row") == 1)
      {
        -[WFNetworkSettingsViewController _macAddressToDisplay](self, "_macAddressToDisplay");
        v87 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v5, "row"))
          goto LABEL_118;
        -[WFNetworkSettingsViewController _selectedPrivateModeForOption:](self, "_selectedPrivateModeForOption:", self->_privateAddressMode);
        v87 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v87;
      objc_msgSend(v8, "detailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v11);
LABEL_116:

LABEL_117:
LABEL_118:
      objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "detailTextLabel");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setTextColor:", v146);

      goto LABEL_119;
    case 16:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "outrankedCellAtIndexPath:chinaDevice:", v5, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"));
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_56:
      v8 = (void *)v33;
      goto LABEL_117;
    case 17:
      -[WFNetworkSettingsViewController cellFactory](self, "cellFactory");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "wifiModeCellAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "contentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
      v90 = CFSTR("kWFLocSettingsWiFiModeTitle");
      if (v89)
        v90 = CFSTR("kWFLocSettingsWiFiModeTitle_CH");
      v91 = (void *)MEMORY[0x24BDD1488];
      v92 = v90;
      objc_msgSend(v91, "bundleForClass:", objc_opt_class());
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedStringForKey:value:table:", v92, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setText:", v94);
      -[WFNetworkSettingsViewController context](self, "context");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController _displayStringForDisableMode:](self, "_displayStringForDisableMode:", objc_msgSend(v95, "wifiMode"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecondaryText:", v96);

      objc_msgSend(v8, "setContentConfiguration:", v11);
      objc_msgSend(v8, "setAccessoryType:", 1);
      goto LABEL_117;
    default:
      goto LABEL_34;
  }
}

- (int64_t)_sectionTypeAtSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[WFNetworkSettingsViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)_saveConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNetworkSettingsViewController config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changesBetweenConfig:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v7 && os_log_type_enabled(v7, v8))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_2196CC000, v7, v8, "save handler new config %@", (uint8_t *)&v12, 0xCu);
  }

  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_2196CC000, v9, v10, "changes: %@", (uint8_t *)&v12, 0xCu);
  }

  -[WFNetworkSettingsViewController dataCoordinator](self, "dataCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "networkSettingsViewController:saveConfig:errorHandler:", self, v4, &__block_literal_global_170);

}

void __47__WFNetworkSettingsViewController__saveConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(2uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 2 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = objc_msgSend(v2, "code");
      objc_msgSend(v2, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_2196CC000, v5, v4, "Failed to save settings config (errCode %lu) - userInfo %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (BOOL)_shouldShowIPv6ForConfig:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "ipv6Addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v3, "current");
  }
  else
  {
    objc_msgSend(v3, "ipv6RouterAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = objc_msgSend(v3, "current");
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  BOOL v7;
  BOOL v8;

  v5 = a4;
  v6 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v5, "section"));
  v7 = v6 == 15 || v6 == 5;
  v8 = v7 && objc_msgSend(v5, "row");

  return v8;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v9 = a5;
  v10 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v9, "section"));
  if (sel_copy_ == a4)
  {
    v11 = v10;
    objc_msgSend(v25, "cellForRowAtIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 3)
    {
      -[WFNetworkSettingsViewController autoJoinSectionRows](self, "autoJoinSectionRows");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "row"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(v13, "contentConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "secondaryText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "length"))
        {
LABEL_9:

          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = v18;
LABEL_8:
        objc_msgSend(v19, "setString:", v21);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v12, "detailTextLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v24)
      {
        objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "detailTextLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v21 = v20;
        goto LABEL_8;
      }
    }
LABEL_10:

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  BOOL v54;
  WFIPViewController *v55;
  void *v56;
  void *v57;
  void *v58;
  WFIPViewController *v59;
  WFDNSConfigViewController *v60;
  void *v61;
  void *v62;
  WFDNSConfigViewController *v63;
  WFProxyConfigViewController *v64;
  void *v65;
  void *v66;
  WFProxyConfigViewController *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  WFDiagnosticsTableViewController *v72;
  void *v73;
  void *v74;
  WFDiagnosticsTableViewController *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  WFValueListViewController *v85;
  _BOOL4 v86;
  __CFString *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  WFIPConfigViewController *v94;
  void *v95;
  void *v96;
  WFIPConfigViewController *v97;
  os_log_type_t v98;
  NSObject *v99;
  void *v100;
  id v101;
  WFNetworkSettingsViewController *v102;
  void *v103;
  void *v104;
  id v105;
  _QWORD v106[5];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[5];
  id v115;
  id v116;
  uint8_t buf[4];
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v105 = a3;
  v6 = a4;
  v7 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v6, "section"));
  -[WFNetworkSettingsViewController delegate](self, "delegate");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      v11 = objc_msgSend(v6, "row");
      v12 = objc_msgSend(v6, "section");
      -[WFNetworkSettingsViewController _stringForSettingsSection:](self, "_stringForSettingsSection:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v118 = v11;
      v119 = 2048;
      v120 = v12;
      v121 = 2112;
      v122 = v13;
      _os_log_impl(&dword_2196CC000, v10, v9, "User did select network settings row=%ld in section=%ld (%@)", buf, 0x20u);

    }
  }

  switch(v7)
  {
    case 1:
      if (objc_msgSend(v6, "row") == 1)
      {
        -[WFNetworkSettingsViewController _portalURL](self, "_portalURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkSettingsViewController context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[WFNetworkSettingsViewController context](self, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "openPortalURL");

        }
        goto LABEL_10;
      }
      break;
    case 2:
      -[WFNetworkSettingsViewController context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[WFNetworkSettingsViewController context](self, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "join");
      }
      else
      {
        -[WFNetworkSettingsViewController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "networkSettingsViewControllerDidJoinNetwork:", self);
      }

      break;
    case 3:
      -[WFNetworkSettingsViewController autoJoinSectionRows](self, "autoJoinSectionRows");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v6, "row"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        self->_credentailCellTapped = 1;
        -[WFNetworkSettingsViewController tableView](self, "tableView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reloadData");

        -[WFNetworkSettingsViewController context](self, "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[WFNetworkSettingsViewController context](self, "context");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_opt_respondsToSelector();

          if ((v26 & 1) != 0)
          {
            -[WFNetworkSettingsViewController context](self, "context");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "credentialsTappedHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v29 = v22 == 3;
              -[WFNetworkSettingsViewController context](self, "context");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "credentialsTappedHandler");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)v31;
              if (v29)
                v33 = 2;
              else
                v33 = 1;
              (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, v33);

            }
          }
        }
        if (self->_allowViewPassword)
        {
          WFLogForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v34 && os_log_type_enabled(v34, v35))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2196CC000, v34, v35, "Already allow viewing password. Show copy menu.", buf, 2u);
          }

          objc_msgSend(v105, "cellForRowAtIndexPath:", v6);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v36, "canBecomeFirstResponder") & 1) == 0)
          {
            WFLogForCategory(0);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v37 && os_log_type_enabled(v37, v38))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2196CC000, v37, v38, "Unable to present context menu as the credentail cell cannot become first responder!", buf, 2u);
            }

          }
          objc_msgSend(v36, "becomeFirstResponder");
          objc_msgSend(MEMORY[0x24BEBD750], "sharedMenuController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "update");
          objc_msgSend(MEMORY[0x24BEBD750], "sharedMenuController");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "bounds");
          objc_msgSend(v40, "showMenuFromView:rect:", v36);

        }
        else
        {
          v101 = objc_alloc_init(MEMORY[0x24BDDA930]);
          v102 = self;
          -[WFNetworkSettingsViewController _wifiPasswordContextOptions](v102, "_wifiPasswordContextOptions");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = MEMORY[0x24BDAC760];
          v114[1] = 3221225472;
          v114[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v114[3] = &unk_24DB37E98;
          v114[4] = v102;
          v115 = v105;
          v116 = v6;
          objc_msgSend(v101, "evaluatePolicy:options:reply:", 2, v103, v114);

        }
      }
      break;
    case 4:
      -[WFNetworkSettingsViewController _promptForgetNetwork](self, "_promptForgetNetwork");
      break;
    case 5:
      if (objc_msgSend(v6, "row"))
      {
        if (objc_msgSend(v6, "row") == 6)
        {
          -[WFNetworkSettingsViewController config](self, "config");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "ipv4Config") == 0;

          if (v42)
            goto LABEL_38;
        }
      }
      else
      {
        v94 = [WFIPConfigViewController alloc];
        -[WFNetworkSettingsViewController config](self, "config");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = -[WFIPConfigViewController initWithConfig:ipType:appearanceProxy:](v94, "initWithConfig:ipType:appearanceProxy:", v95, 0, v96);

        objc_initWeak((id *)buf, self);
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_185;
        v110[3] = &unk_24DB37EE8;
        objc_copyWeak(&v111, (id *)buf);
        -[WFIPConfigViewController setSaveHandler:](v97, "setSaveHandler:", v110);
        -[WFNetworkSettingsViewController _presentDetailViewController:](self, "_presentDetailViewController:", v97);
        objc_destroyWeak(&v111);
        objc_destroyWeak((id *)buf);

      }
      break;
    case 6:
LABEL_38:
      -[WFNetworkSettingsViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "rectForRowAtIndexPath:", v6);
      objc_msgSend(v43, "convertRect:fromView:", v105);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;

      -[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:](self, "_presentRenewLeaseAlertWithSourceRect:", v45, v47, v49, v51);
      break;
    case 7:
      if (!objc_msgSend(v6, "row"))
      {
        -[WFNetworkSettingsViewController config](self, "config");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "ipv6Addresses");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "count") == 0;

        if (!v54)
        {
          v55 = [WFIPViewController alloc];
          -[WFNetworkSettingsViewController config](self, "config");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "ipv6Addresses");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[WFIPViewController initWithAddresses:prefixLengths:appearanceProxy:](v55, "initWithAddresses:prefixLengths:appearanceProxy:", v57, 0, v58);

          -[WFNetworkSettingsViewController _presentDetailViewController:](self, "_presentDetailViewController:", v59);
        }
      }
      break;
    case 8:
      v60 = [WFDNSConfigViewController alloc];
      -[WFNetworkSettingsViewController config](self, "config");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[WFDNSConfigViewController initWithConfig:appearanceProxy:](v60, "initWithConfig:appearanceProxy:", v61, v62);

      objc_initWeak((id *)buf, self);
      v112[0] = MEMORY[0x24BDAC760];
      v112[1] = 3221225472;
      v112[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_182;
      v112[3] = &unk_24DB37EC0;
      objc_copyWeak(&v113, (id *)buf);
      -[WFDNSConfigViewController setSaveHandler:](v63, "setSaveHandler:", v112);
      -[WFNetworkSettingsViewController _presentDetailViewController:](self, "_presentDetailViewController:", v63);
      objc_destroyWeak(&v113);
      objc_destroyWeak((id *)buf);

      break;
    case 9:
      v64 = [WFProxyConfigViewController alloc];
      -[WFNetworkSettingsViewController config](self, "config");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[WFProxyConfigViewController initWithConfig:appearanceProxy:](v64, "initWithConfig:appearanceProxy:", v65, v66);

      objc_initWeak((id *)buf, self);
      v108[0] = MEMORY[0x24BDAC760];
      v108[1] = 3221225472;
      v108[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v108[3] = &unk_24DB37EE8;
      objc_copyWeak(&v109, (id *)buf);
      -[WFProxyConfigViewController setSaveHandler:](v67, "setSaveHandler:", v108);
      -[WFNetworkSettingsViewController _presentDetailViewController:](self, "_presentDetailViewController:", v67);
      objc_destroyWeak(&v109);
      objc_destroyWeak((id *)buf);

      break;
    case 10:
      -[WFNetworkSettingsViewController context](self, "context");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        -[WFNetworkSettingsViewController context](self, "context");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "manage");

      }
      else
      {
        objc_msgSend(v104, "networkSettingsViewControllerDidManageNetwork:", self);
      }
      break;
    case 14:
      -[WFNetworkSettingsViewController context](self, "context");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "diagnosticsContext");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = [WFDiagnosticsTableViewController alloc];
      -[WFNetworkSettingsViewController context](self, "context");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController appearanceProxy](self, "appearanceProxy");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = -[WFDiagnosticsTableViewController initWithDiagnosticsContext:detailsProviderContext:appearanceProxy:](v72, "initWithDiagnosticsContext:detailsProviderContext:appearanceProxy:", v71, v73, v74);

      -[WFNetworkSettingsViewController _presentDetailViewController:](self, "_presentDetailViewController:", v75);
      break;
    case 15:
      if (!objc_msgSend(v6, "row"))
      {
        if (-[WFDetailsProviderContext isRandomMACAddressConfigurable](self->_context, "isRandomMACAddressConfigurable"))
        {
          -[WFNetworkSettingsViewController _pushPrivateModeSelectionViewController](self, "_pushPrivateModeSelectionViewController");
        }
        else
        {
          WFLogForCategory(0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v14)
          {
            v99 = v14;
            if (os_log_type_enabled(v99, v98))
            {
              -[WFNetworkSettingsConfig ssid](self->_config, "ssid");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v118 = (uint64_t)v100;
              _os_log_impl(&dword_2196CC000, v99, v98, "Private Address mode for %@ is not configurable!", buf, 0xCu);

            }
          }
LABEL_10:

        }
      }
      break;
    case 16:
      -[WFNetworkSettingsViewController context](self, "context");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (objc_msgSend(v76, "requestedFields") & 0x2000) == 0;

      if (v77)
      {
        -[WFNetworkSettingsViewController context](self, "context");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedForPrivateCellular:](self, "_promptOverrideWiFiOutrankedForPrivateCellular:", ((unint64_t)objc_msgSend(v78, "requestedFields") >> 14) & 1);

      }
      else
      {
        -[WFNetworkSettingsViewController _promptOverrideWiFiOutrankedDev](self, "_promptOverrideWiFiOutrankedDev");
      }
      break;
    case 17:
      v79 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeAuto"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeOff"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "arrayWithObjects:", v81, v83, 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = -[WFValueListViewController initWithTitles:switchTitle:]([WFValueListViewController alloc], "initWithTitles:switchTitle:", v84, 0);
      v86 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
      v87 = CFSTR("kWFLocSettingsWiFiModeTitle");
      if (v86)
        v87 = CFSTR("kWFLocSettingsWiFiModeTitle_CH");
      v88 = v87;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "localizedStringForKey:value:table:", v88, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFValueListViewController navigationItem](v85, "navigationItem");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setTitle:", v90);

      -[WFNetworkSettingsViewController _displayStringForDisableMode:](self, "_displayStringForDisableMode:", -[WFDetailsProviderContext wifiMode](self->_context, "wifiMode"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFValueListViewController setSelectedTitle:](v85, "setSelectedTitle:", v92);

      objc_initWeak((id *)buf, self);
      v106[0] = MEMORY[0x24BDAC760];
      v106[1] = 3221225472;
      v106[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v106[3] = &unk_24DB37B88;
      objc_copyWeak(&v107, (id *)buf);
      v106[4] = self;
      -[WFValueListViewController setCompletionHandler:](v85, "setCompletionHandler:", v106);
      -[WFNetworkSettingsViewController navigationController](self, "navigationController");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "pushViewController:animated:", v85, 1);

      -[WFNetworkSettingsViewController _didStartPresentingDetailViewController](self, "_didStartPresentingDetailViewController");
      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);

      break;
    default:
      break;
  }
  objc_msgSend(v105, "deselectRowAtIndexPath:animated:", v6, 1);

}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v8[3] = &unk_24DB37E70;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    WFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_2196CC000, v2, v3, "Authentication Error: %@", (uint8_t *)&v15, 0xCu);
    }

    v5 = *(void **)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, "code");
  if (v6 == -5)
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2196CC000, v7, v8, "User turned off passcode", (uint8_t *)&v15, 2u);
    }

  }
  if (v5)
    v9 = v6 == -5;
  else
    v9 = 1;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "setAllowViewPassword:", v10);
  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  if (objc_msgSend(*(id *)(a1 + 40), "allowViewPassword"))
  {
    objc_msgSend(*(id *)(a1 + 48), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeFirstResponder");
    objc_msgSend(MEMORY[0x24BEBD750], "sharedMenuController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "update");
    objc_msgSend(MEMORY[0x24BEBD750], "sharedMenuController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v14, "showMenuFromView:rect:", v12);

  }
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_182(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  id v19;

  v19 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "dnsConfig");
  v12 = v11 != a2;
  if (v11 != a2)
    objc_msgSend(v10, "setDnsConfig:", a2);
  objc_msgSend(WeakRetained, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dnsServerAddresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToArray:", v19);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v10, "setDnsServerAddresses:", v19);
    v12 = 1;
  }
  objc_msgSend(WeakRetained, "config");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dnsSearchDomains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToArray:", v7);

  if ((v18 & 1) != 0)
  {
    if (!v12)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(v10, "setDnsSearchDomains:", v7);
  }
  objc_msgSend(WeakRetained, "_saveConfig:", v10);
LABEL_10:
  objc_msgSend(WeakRetained, "_didDismissDetailViewController");

}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_185(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_saveConfig:", v3);

  objc_msgSend(WeakRetained, "_didDismissDetailViewController");
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_saveConfig:", v3);

  objc_msgSend(WeakRetained, "_didDismissDetailViewController");
}

void __69__WFNetworkSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeAuto"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v5))
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "wifiMode");

    if (v6 > 1)
    {
LABEL_7:
      objc_msgSend(WeakRetained, "_updateWiFiEMode:", objc_msgSend(*(id *)(a1 + 32), "_disableModeFromKey:", v10));
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeOff"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v8))
  {

    goto LABEL_9;
  }
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "wifiMode");

  if (v9 < 2)
    goto LABEL_7;
LABEL_9:
  objc_msgSend(WeakRetained, "_didDismissDetailViewController");

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v4 = 0;
  switch(-[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4))
  {
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("kWFLocSettingsIPSectionTitle");
      goto LABEL_6;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("kWFLocSettingsIPV6SectionTitle");
      goto LABEL_6;
    case 8:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("kWFLocSettingsDNSSectionTitle");
      goto LABEL_6;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("kWFLocSettingsProxySectionTitle");
LABEL_6:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v4;
  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5;
  uint64_t v6;
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
  id v20;
  void *v21;
  void *v22;

  v5 = 0;
  switch(-[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4))
  {
    case 0:
      if (!-[WFNetworkSettingsViewController _showRecommendationSupportLink](self, "_showRecommendationSupportLink"))
        goto LABEL_15;
      -[WFNetworkSettingsViewController linkFooterView](self, "linkFooterView");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6:
      -[WFNetworkSettingsViewController config](self, "config");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dhcpLeaseExpirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDHCPLeaseExpiresTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFNetworkSettingsViewController config](self, "config");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dhcpLeaseExpirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDHCPLeaseExpiresDateFormat"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromDHCPLeaseExpirationDateWithFormatString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 15.0, 0.0, 0.0, 0.0);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v10, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v17);

        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1F0], 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFont:", v18);

        objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTextColor:", v19);

        objc_msgSend(v16, "sizeToFit");
        v20 = objc_alloc(MEMORY[0x24BEBDB00]);
        v5 = (id)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        objc_msgSend(v5, "addSubview:", v16);

LABEL_12:
      }
      else
      {
LABEL_15:
        v5 = 0;
      }
      return v5;
    case 11:
      -[WFNetworkSettingsViewController _lowDataModeFooterView](self, "_lowDataModeFooterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 12:
      -[WFNetworkSettingsViewController _privacyProxyEnabledFooterView](self, "_privacyProxyEnabledFooterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 13:
      -[WFNetworkSettingsViewController networkQualityFooterView](self, "networkQualityFooterView");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v5 = (id)v6;
      return v5;
    case 15:
      -[WFNetworkSettingsViewController _randomMACFooterView](self, "_randomMACFooterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 16:
      -[WFNetworkSettingsViewController _outrankedFooterView](self, "_outrankedFooterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 17:
      -[WFNetworkSettingsViewController _WiFiModeFooterView](self, "_WiFiModeFooterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v5 = v21;
      objc_msgSend(v5, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNumberOfLines:", 0);

      objc_msgSend(v5, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "sizeToFit");
      goto LABEL_12;
    default:
      return v5;
  }
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  int64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[WFNetworkSettingsViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4);
  v6 = 0.0;
  switch(v5)
  {
    case 11:
      -[WFNetworkSettingsViewController _lowDataModeFooterView](self, "_lowDataModeFooterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 12:
      -[WFNetworkSettingsViewController _privacyProxyEnabledFooterView](self, "_privacyProxyEnabledFooterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 13:
      -[WFNetworkSettingsViewController networkQualityFooterView](self, "networkQualityFooterView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      if (v17 != 0.0)
        goto LABEL_14;
      v30[0] = *MEMORY[0x24BEBB368];
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      v30[1] = *MEMORY[0x24BEBB360];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeWithAttributes:", v20);
      v23 = v22;
      goto LABEL_13;
    case 14:
      return v6;
    case 15:
      -[WFNetworkSettingsViewController _randomMACFooterView](self, "_randomMACFooterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 16:
      -[WFNetworkSettingsViewController _outrankedFooterView](self, "_outrankedFooterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 17:
      -[WFNetworkSettingsViewController _WiFiModeFooterView](self, "_WiFiModeFooterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v16 = v7;
      objc_msgSend(v7, "frame");
      if (v17 == 0.0)
      {
        objc_msgSend(v16, "textLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "attributedText");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attributesAtIndex:effectiveRange:", 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "textLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "text");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sizeWithAttributes:", 0);
        v23 = v27;

LABEL_13:
        objc_msgSend(CFSTR("A"), "sizeWithAttributes:", v20);
        v6 = ceil(v23 + v28 * 2.0);

      }
      else
      {
LABEL_14:
        v6 = v17;
      }

      return v6;
    default:
      if (!v5)
      {
        v32[0] = *MEMORY[0x24BEBB368];
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v8;
        v32[1] = *MEMORY[0x24BEBB360];
        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFNetworkSettingsViewController recommendationLinkAttributedString](self, "recommendationLinkAttributedString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sizeWithAttributes:", v10);
        v14 = v13;

        objc_msgSend(CFSTR("A"), "sizeWithAttributes:", v10);
        v6 = ceil(v14 + v15 * 2.0);

      }
      return v6;
  }
}

- (void)_autoJoinSwitchChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoJoinEnabled:", v5);

  v7 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController _saveAutoJoinEnabledChanged:](self, "_saveAutoJoinEnabledChanged:", v7);
}

- (void)_autoLoginSwitchChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoLoginEnabled:", v5);

  v7 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController _saveAutoLoginEnabledChanged:](self, "_saveAutoLoginEnabledChanged:", v7);
}

- (void)_saveDataModeSwitchChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsInSaveDataMode:", v5);

  v7 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController _saveSaveDataModeChanged:](self, "_saveSaveDataModeChanged:", v7);
}

- (void)_privacyProxyEnabledSwitchChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrivacyProxyEnabled:", v5);

  v7 = objc_msgSend(v4, "isOn");
  -[WFNetworkSettingsViewController _privacyProxyEnabledChanged:](self, "_privacyProxyEnabledChanged:", v7);
}

- (void)_updateWiFiEMode:(int64_t)a3
{
  void *v5;
  id v6;

  -[WFNetworkSettingsViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWifiMode:", a3);

  -[WFNetworkSettingsViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (int64_t)_disableModeFromKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeAuto"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeOff"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if (v10)
      v7 = 2;
    else
      v7 = 0;
  }

  return v7;
}

- (void)_pushPrivateModeSelectionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFPrivateAddressModeOptionsViewController *v11;
  uint64_t v12;
  void *v13;
  WFPrivateAddressModeOptionsViewController *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  WFNetworkSettingsViewController *v25;

  -[WFNetworkSettingsViewController _selectedPrivateModeForOption:](self, "_selectedPrivateModeForOption:", self->_privateAddressMode);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACStaticOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACRotatingOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [WFPrivateAddressModeOptionsViewController alloc];
  v12 = -[WFDetailsProviderContext isCurrent](self->_context, "isCurrent");
  -[WFNetworkSettingsConfig ssid](self->_config, "ssid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFPrivateAddressModeOptionsViewController initWithTitles:originalSelection:isCurrentNetwork:currentNetworkName:isChinaDevice:](v11, "initWithTitles:originalSelection:isCurrentNetwork:currentNetworkName:isChinaDevice:", v10, v22, v12, v13, -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"));

  LODWORD(v11) = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((_DWORD)v11)
    v17 = CFSTR("KWFLocSettingRandomMACSwitchChinaTitle");
  else
    v17 = CFSTR("KWFLocSettingRandomMACSwitchTitle");
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPrivateAddressModeOptionsViewController navigationItem](v14, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v18);

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__WFNetworkSettingsViewController__pushPrivateModeSelectionViewController__block_invoke;
  v23[3] = &unk_24DB37F10;
  v24 = v22;
  v25 = self;
  v20 = v22;
  -[WFValueListViewController setCompletionHandler:](v14, "setCompletionHandler:", v23);
  -[WFNetworkSettingsViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pushViewController:animated:", v14, 1);

}

void __74__WFNetworkSettingsViewController__pushPrivateModeSelectionViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_updatePrivateAddressMode:", objc_msgSend(*(id *)(a1 + 40), "_selectedPrivateModeForString:", v3));

}

- (void)_updatePrivateAddressMode:(unint64_t)a3
{
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      -[WFNetworkSettingsConfig ssid](self->_config, "ssid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v8;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_2196CC000, v7, v6, "Private address mode for %@ has been updated to %ld", (uint8_t *)&v15, 0x16u);

    }
  }

  -[WFNetworkSettingsViewController setPrivateAddressMode:](self, "setPrivateAddressMode:", a3);
  -[WFNetworkSettingsViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", &unk_24DB59A70);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 5);

    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_reloadSectionHeaderFooters:withRowAnimation:", v14, 100);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WFDetailsProviderContext updatePrivateAddressMode:](self->_context, "updatePrivateAddressMode:", a3);
}

- (id)_selectedPrivateModeForOption:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("kWFLocRandomMACStaticOption");
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("kWFLocRandomMACRotatingOption");
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("kWFLocRandomMACOffOption");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_selectedPrivateModeForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACStaticOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 3;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACRotatingOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if (v13)
        v7 = 2;
      else
        v7 = 1;
    }
  }

  return v7;
}

- (void)_saveAutoJoinEnabledChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFNetworkSettingsViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoJoinEnabled:", v3);

}

- (void)_saveAutoLoginEnabledChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFNetworkSettingsViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoLoginEnabled:", v3);

}

- (void)_saveSaveDataModeChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFNetworkSettingsViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsInSaveDataMode:", v3);

}

- (void)_privacyProxyEnabledChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFNetworkSettingsViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPrivacyProxyEnabled:", v3);

}

- (BOOL)_shouldShowRandomConfigSwith
{
  void *v2;
  char v3;

  -[WFNetworkSettingsViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRandomMACFeatureEnabled");

  return v3;
}

- (UISwitch)autoJoinSwitch
{
  UISwitch *autoJoinSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;

  autoJoinSwitch = self->_autoJoinSwitch;
  if (!autoJoinSwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_autoJoinSwitch;
    self->_autoJoinSwitch = v5;

    -[UISwitch addTarget:action:forControlEvents:](self->_autoJoinSwitch, "addTarget:action:forControlEvents:", self, sel__autoJoinSwitchChanged_, 4096);
    autoJoinSwitch = self->_autoJoinSwitch;
  }
  return autoJoinSwitch;
}

- (UISwitch)autoLoginSwitch
{
  UISwitch *autoLoginSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;

  autoLoginSwitch = self->_autoLoginSwitch;
  if (!autoLoginSwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_autoLoginSwitch;
    self->_autoLoginSwitch = v5;

    -[UISwitch addTarget:action:forControlEvents:](self->_autoLoginSwitch, "addTarget:action:forControlEvents:", self, sel__autoLoginSwitchChanged_, 4096);
    autoLoginSwitch = self->_autoLoginSwitch;
  }
  return autoLoginSwitch;
}

- (UISwitch)saveDataModeSwitch
{
  UISwitch *saveDataModeSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;

  saveDataModeSwitch = self->_saveDataModeSwitch;
  if (!saveDataModeSwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_saveDataModeSwitch;
    self->_saveDataModeSwitch = v5;

    -[UISwitch addTarget:action:forControlEvents:](self->_saveDataModeSwitch, "addTarget:action:forControlEvents:", self, sel__saveDataModeSwitchChanged_, 4096);
    saveDataModeSwitch = self->_saveDataModeSwitch;
  }
  return saveDataModeSwitch;
}

- (UISwitch)privacyProxyEnabledSwitch
{
  UISwitch *privacyProxyEnabledSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;

  privacyProxyEnabledSwitch = self->_privacyProxyEnabledSwitch;
  if (!privacyProxyEnabledSwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_privacyProxyEnabledSwitch;
    self->_privacyProxyEnabledSwitch = v5;

    -[UISwitch addTarget:action:forControlEvents:](self->_privacyProxyEnabledSwitch, "addTarget:action:forControlEvents:", self, sel__privacyProxyEnabledSwitchChanged_, 4096);
    privacyProxyEnabledSwitch = self->_privacyProxyEnabledSwitch;
  }
  return privacyProxyEnabledSwitch;
}

- (UITableViewCell)networkQualityCell
{
  UITableViewCell *networkQualityCell;
  UITableViewCell *v4;
  UITableViewCell *v5;

  networkQualityCell = self->_networkQualityCell;
  if (!networkQualityCell)
  {
    v4 = (UITableViewCell *)objc_alloc_init(MEMORY[0x24BEBD9F8]);
    v5 = self->_networkQualityCell;
    self->_networkQualityCell = v4;

    networkQualityCell = self->_networkQualityCell;
  }
  return networkQualityCell;
}

- (UISwitch)randomMACSwitch
{
  UISwitch *randomMACSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;

  randomMACSwitch = self->_randomMACSwitch;
  if (!randomMACSwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_randomMACSwitch;
    self->_randomMACSwitch = v5;

    -[UISwitch addTarget:action:forEvents:](self->_randomMACSwitch, "addTarget:action:forEvents:", self, sel__usingRandomMACSwitchChanged_, 4096);
    randomMACSwitch = self->_randomMACSwitch;
  }
  return randomMACSwitch;
}

- (WFHyperlinkFooterView)linkFooterView
{
  WFHyperlinkFooterView *linkFooterView;
  WFHyperlinkFooterView *v4;
  WFHyperlinkFooterView *v5;
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  linkFooterView = self->_linkFooterView;
  if (!linkFooterView)
  {
    v4 = objc_alloc_init(WFHyperlinkFooterView);
    v5 = self->_linkFooterView;
    self->_linkFooterView = v4;

    v6 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
    v7 = CFSTR("kWFLocSettingsRecommendationLinkTitle");
    if (v6)
      v7 = CFSTR("kWFLocSettingsRecommendationLinkTitleCH");
    v8 = (void *)MEMORY[0x24BDD1488];
    v9 = v7;
    objc_msgSend(v8, "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHyperlinkFooterView setText:](self->_linkFooterView, "setText:", v11);
    -[WFHyperlinkFooterView setLinkRange:](self->_linkFooterView, "setLinkRange:", 0, objc_msgSend(v11, "length"));
    -[WFHyperlinkFooterView setTarget:](self->_linkFooterView, "setTarget:", self);
    -[WFHyperlinkFooterView setAction:](self->_linkFooterView, "setAction:", sel__openRecommendationsLink_);

    linkFooterView = self->_linkFooterView;
  }
  return linkFooterView;
}

- (void)_openRecommendationsLink:(id)a3
{
  void *v4;
  id v5;

  -[WFNetworkSettingsViewController context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFNetworkSettingsViewController context](self, "context");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openRecommendationLink");
  }
  else
  {
    -[WFNetworkSettingsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkSettingsViewControllerDidTapRecommendationLink:", self);
  }

}

- (BOOL)_showRecommendationSupportLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[WFNetworkSettingsViewController config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthRecommendations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "healthRecommendations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHealthIssue issueWithType:](WFHealthIssue, "issueWithType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_presentDetailViewController:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v8 = 136315394;
    v9 = "-[WFNetworkSettingsViewController _presentDetailViewController:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: pushing view controller='%@'", (uint8_t *)&v8, 0x16u);
  }

  self->_detailViewControllerVisible = 1;
  -[WFNetworkSettingsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v4, 1);

}

- (BOOL)_isChinaDevice
{
  return WFCapabilityIsChinaDevice(-[WFNetworkSettingsViewController deviceCapability](self, "deviceCapability"));
}

- (void)_logSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        -[WFNetworkSettingsViewController _stringForSettingsSection:](self, "_stringForSettingsSection:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "integerValue", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        if (v9 + 1 + v11 < (unint64_t)objc_msgSend(v6, "count"))
          objc_msgSend(v5, "appendString:", CFSTR(", "));
        ++v11;
      }
      while (v8 != v11);
      v9 += v8;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_2196CC000, v13, v14, "Settings Sections: %@", buf, 0xCu);
  }

}

- (id)_displayStringForDisableMode:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t v10[16];

  if ((unint64_t)a3 < 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocSettingsWiFiModeAuto");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocSettingsWiFiModeOff");
    goto LABEL_6;
  }
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2196CC000, v8, v9, "Unexpected disable mode.", v10, 2u);
  }

  return 0;
}

- (id)_stringForSettingsSection:(int64_t)a3
{
  if ((unint64_t)a3 > 0x11)
    return 0;
  else
    return off_24DB37F78[a3];
}

- (id)_randomAddressToDisplay
{
  NSString *randomMACAddress;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t v6[16];

  randomMACAddress = self->_randomMACAddress;
  if (randomMACAddress)
    return randomMACAddress;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2196CC000, v4, v5, "Random MAC Address is Empty!", v6, 2u);
  }

  return &stru_24DB39F78;
}

- (id)_macAddressToDisplay
{
  NSString *v3;

  if (-[WFNetworkSettingsViewController privateAddressMode](self, "privateAddressMode") == 1)
  {
    v3 = self->_hardwareMACAddress;
  }
  else
  {
    -[WFNetworkSettingsViewController _randomAddressToDisplay](self, "_randomAddressToDisplay");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_randomMACFooterTextToDisplay
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("kWFLocPirvateAddressFooterMainTitle_CH");
  else
    v6 = CFSTR("kWFLocPirvateAddressFooterMainTitle");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[WFNetworkSettingsViewController _detailFooterForMode:](self, "_detailFooterForMode:", self->_privateAddressMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@\n%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocPrivateAddressNotConfigurableDescription"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[WFDetailsProviderContext isRandomMACAddressConfigurable](self->_context, "isRandomMACAddressConfigurable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return v10;
}

- (id)_detailFooterForMode:(unint64_t)a3
{
  BOOL v3;
  void *v4;
  const __CFString *v5;
  BOOL v6;
  BOOL v7;
  void *v8;

  switch(a3)
  {
    case 3uLL:
      v6 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v5 = CFSTR("kWFLocPirvateAddressFooterStaticDetail_CH");
      else
        v5 = CFSTR("kWFLocPirvateAddressFooterStaticDetail");
      goto LABEL_14;
    case 2uLL:
      v7 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v5 = CFSTR("kWFLocPirvateAddressFooterRotatingDetail_CH");
      else
        v5 = CFSTR("kWFLocPirvateAddressFooterRotatingDetail");
      goto LABEL_14;
    case 1uLL:
      v3 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v5 = CFSTR("kWFLocPirvateAddressFooterOffDetail_CH");
      else
        v5 = CFSTR("kWFLocPirvateAddressFooterOffDetail");
LABEL_14:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
  }
  v8 = 0;
  return v8;
}

- (void)scrollToCell:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  switch(a3)
  {
    case 4uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFNetworkSettingsViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB599E0;
      goto LABEL_6;
    case 5uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFNetworkSettingsViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB59A40;
      goto LABEL_6;
    case 6uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFNetworkSettingsViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB59A70;
      goto LABEL_6;
    case 7uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFNetworkSettingsViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB59A88;
LABEL_6:
      objc_msgSend(v4, "indexPathForRow:inSection:", 0, objc_msgSend(v5, "indexOfObject:", v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 1, 1);

      break;
    default:
      return;
  }
}

- (void)_presentRenewLeaseAlertWithSourceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24[5];
  id buf[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2196CC000, v8, v9, "User tapped renew lease", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocRenewLeaseActionSheetButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke;
  v23[3] = &unk_24DB37F38;
  objc_copyWeak(v24, buf);
  v24[1] = *(id *)&x;
  v24[2] = *(id *)&y;
  v24[3] = *(id *)&width;
  v24[4] = *(id *)&height;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v10, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceView:", v18);

    objc_msgSend(v17, "setSourceRect:", x, y, width, height);
  }
  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocRenewLeaseActionSheetCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_318);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v22);

  -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  objc_destroyWeak(v24);

  objc_destroyWeak(buf);
}

void __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  char v14;
  os_log_type_t v15;
  id v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v18 = 136315138;
    v19 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: user confirmed renew lease", (uint8_t *)&v18, 0xCu);
  }

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v2);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "context");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject renewLease](v10, "renewLease");
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if ((v12 & 1) != 0)
  {
    -[NSObject networkSettingsViewControllerDidRenewLease:sourceRect:](v13, "networkSettingsViewControllerDidRenewLease:sourceRect:", WeakRetained, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    goto LABEL_16;
  }
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject networkSettingsViewControllerDidRenewLease:](v10, "networkSettingsViewControllerDidRenewLease:", WeakRetained);
    goto LABEL_16;
  }
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v10, v15))
    {
      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315394;
      v19 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_2196CC000, v10, v15, "%s: delegate %@ doesn't respond to selector for lease renewal", (uint8_t *)&v18, 0x16u);

    }
    v9 = v10;
    goto LABEL_16;
  }
LABEL_17:

}

void __73__WFNetworkSettingsViewController__presentRenewLeaseAlertWithSourceRect___block_invoke_317()
{
  NSObject *v0;
  os_log_type_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    v2 = 136315138;
    v3 = "-[WFNetworkSettingsViewController _presentRenewLeaseAlertWithSourceRect:]_block_invoke";
    _os_log_impl(&dword_2196CC000, v0, v1, "%s: user cancelled renew lease", (uint8_t *)&v2, 0xCu);
  }

}

- (id)_lowDataModeFooterView
{
  UITableViewHeaderFooterView *v3;
  UITableViewHeaderFooterView *lowDataModeFooterView;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  UITableViewHeaderFooterView *v14;

  if (!self->_lowDataModeFooterView)
  {
    v3 = (UITableViewHeaderFooterView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA18]), "initWithReuseIdentifier:", CFSTR("LowDataMode"));
    lowDataModeFooterView = self->_lowDataModeFooterView;
    self->_lowDataModeFooterView = v3;

  }
  if (-[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
  {
    objc_msgSend(CFSTR("kWFLocLowDataModeFooter"), "stringByAppendingString:", CFSTR("_CH"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("kWFLocLowDataModeFooter");
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewHeaderFooterView textLabel](self->_lowDataModeFooterView, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    -[UITableViewHeaderFooterView textLabel](self->_lowDataModeFooterView, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v7);

    -[UITableViewHeaderFooterView textLabel](self->_lowDataModeFooterView, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_lowDataModeFooterView, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

  }
  v14 = self->_lowDataModeFooterView;

  return v14;
}

- (id)_WiFiModeFooterView
{
  UITableViewHeaderFooterView *wifiModeFooterView;
  UITableViewHeaderFooterView *v4;
  UITableViewHeaderFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  wifiModeFooterView = self->_wifiModeFooterView;
  if (!wifiModeFooterView)
  {
    v4 = (UITableViewHeaderFooterView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA18]), "initWithReuseIdentifier:", CFSTR("wifiMode"));
    v5 = self->_wifiModeFooterView;
    self->_wifiModeFooterView = v4;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsWiFiModeFooter"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView textLabel](self->_wifiModeFooterView, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[UITableViewHeaderFooterView textLabel](self->_wifiModeFooterView, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_wifiModeFooterView, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

    wifiModeFooterView = self->_wifiModeFooterView;
  }
  return wifiModeFooterView;
}

- (id)_privacyProxyEnabledFooterView
{
  UITableViewHeaderFooterView *privacyProxyEnabledFooterView;
  UITableViewHeaderFooterView *v4;
  UITableViewHeaderFooterView *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  privacyProxyEnabledFooterView = self->_privacyProxyEnabledFooterView;
  if (!privacyProxyEnabledFooterView)
  {
    v4 = (UITableViewHeaderFooterView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA18]), "initWithReuseIdentifier:", CFSTR("ProxyEnabled"));
    v5 = self->_privacyProxyEnabledFooterView;
    self->_privacyProxyEnabledFooterView = v4;

    -[WFNetworkSettingsViewController config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "privacyProxyTierStatus");

    if (v7 == 1)
    {
      v8 = CFSTR("kWFLocPrivacyProxyNonSubscriberFooter");
    }
    else
    {
      -[WFNetworkSettingsViewController config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "privacyProxyTierStatus");

      if (v10 == 2)
        v8 = CFSTR("kWFLocPrivacyProxySubscriberFooter");
      else
        v8 = &stru_24DB39F78;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITableViewHeaderFooterView textLabel](self->_privacyProxyEnabledFooterView, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[UITableViewHeaderFooterView textLabel](self->_privacyProxyEnabledFooterView, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_privacyProxyEnabledFooterView, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeToFit");

    privacyProxyEnabledFooterView = self->_privacyProxyEnabledFooterView;
  }
  return privacyProxyEnabledFooterView;
}

- (id)_outrankedFooterView
{
  UITableViewHeaderFooterView *v3;
  UITableViewHeaderFooterView *outrankedFooterView;
  void *v5;
  __int16 v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  UITableViewHeaderFooterView *v19;

  if (!self->_outrankedFooterView)
  {
    v3 = (UITableViewHeaderFooterView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA18]), "initWithReuseIdentifier:", CFSTR("OutrankedFooterView"));
    outrankedFooterView = self->_outrankedFooterView;
    self->_outrankedFooterView = v3;

  }
  -[WFNetworkSettingsViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestedFields");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice");
  v9 = CFSTR("kWFLocSettingOutrankFooter");
  if (v8)
    v9 = CFSTR("kWFLocSettingOutrankFooter_CH");
  v10 = CFSTR("kWFLocSettingPrivateOutrankFooter_CH");
  if (!v8)
    v10 = CFSTR("kWFLocSettingPrivateOutrankFooter");
  if ((v6 & 0x4000) != 0)
    v11 = v10;
  else
    v11 = v9;
  objc_msgSend(v7, "localizedStringForKey:value:table:", v11, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewHeaderFooterView textLabel](self->_outrankedFooterView, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v12);

  if ((v15 & 1) == 0)
  {
    -[UITableViewHeaderFooterView textLabel](self->_outrankedFooterView, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v12);

    -[UITableViewHeaderFooterView textLabel](self->_outrankedFooterView, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_outrankedFooterView, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeToFit");

  }
  v19 = self->_outrankedFooterView;

  return v19;
}

- (WFHyperlinkFooterView)networkQualityFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WFHyperlinkFooterView *networkQualityFooterView;
  const char *v17;
  NSDate *networkQualityFooterDate;
  WFHyperlinkFooterView *v19;
  WFHyperlinkFooterView *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSDate *v37;
  NSDate *v38;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  NSDate *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if (self->_networkQualityFooterView)
  {
    -[WFNetworkSettingsViewController config](self, "config");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkQualityDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {

      return self->_networkQualityFooterView;
    }
    v5 = v4;
    if (self->_networkQualityFooterDate)
    {
      -[WFNetworkSettingsViewController config](self, "config");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "networkQualityDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_networkQualityFooterDate);

      if ((v8 & 1) != 0)
        return self->_networkQualityFooterView;
    }
    else
    {

    }
  }
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      -[WFNetworkSettingsViewController config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "networkQualityDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController config](self, "config");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkQualityResponsiveness");
      networkQualityFooterView = self->_networkQualityFooterView;
      v17 = "YES";
      networkQualityFooterDate = self->_networkQualityFooterDate;
      v42 = "-[WFNetworkSettingsViewController networkQualityFooterView]";
      *(_DWORD *)buf = 136316162;
      v43 = 2112;
      if (!networkQualityFooterView)
        v17 = "NO";
      v44 = v13;
      v45 = 2048;
      v46 = v15;
      v47 = 2080;
      v48 = v17;
      v49 = 2112;
      v50 = networkQualityFooterDate;
      _os_log_impl(&dword_2196CC000, v11, v10, "NetQuality: %s: Date is %@, responsiveness %.3f, existing view? %s existing date? %@", buf, 0x34u);

    }
  }

  v19 = objc_alloc_init(WFHyperlinkFooterView);
  v20 = self->_networkQualityFooterView;
  self->_networkQualityFooterView = v19;

  -[WFNetworkSettingsViewController config](self, "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "networkQualityDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterKnown"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterLink"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterLastChecked"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setDateStyle:", 1);
    objc_msgSend(v28, "setTimeStyle:", 1);
    objc_msgSend(v28, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v40, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD17C8];
    -[WFNetworkSettingsViewController config](self, "config");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "networkQualityDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringFromDate:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@\n%@ %@"), v29, v27, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFNetworkSettingsViewController config](self, "config");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "networkQualityDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (NSDate *)objc_msgSend(v36, "copy");
    v38 = self->_networkQualityFooterDate;
    self->_networkQualityFooterDate = v37;

    -[WFHyperlinkFooterView setText:](self->_networkQualityFooterView, "setText:", v34);
    -[WFHyperlinkFooterView setLinkRange:](self->_networkQualityFooterView, "setLinkRange:", objc_msgSend(v29, "length") - objc_msgSend(v25, "length"), objc_msgSend(v25, "length"));
    -[WFHyperlinkFooterView setTarget:](self->_networkQualityFooterView, "setTarget:", self);
    -[WFHyperlinkFooterView setAction:](self->_networkQualityFooterView, "setAction:", sel__openNetworkQualityDetails_);

  }
  else
  {
    -[WFHyperlinkFooterView setText:](self->_networkQualityFooterView, "setText:", 0);
  }
  return self->_networkQualityFooterView;
}

- (void)_networkQualityOpenURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityKBURL"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

}

- (void)_openNetworkQualityDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = objc_alloc(MEMORY[0x24BE6E448]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v4, "initWithTitle:detailText:symbolName:contentLayout:", v6, 0, 0, 2);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection1Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFNetworkSettingsViewController _isChinaDevice](self, "_isChinaDevice"))
    v10 = CFSTR("kWFLocNetworkQualityLearnMoreSection1TextCH");
  else
    v10 = CFSTR("kWFLocNetworkQualityLearnMoreSection1Text");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSectionWithHeader:content:", v8, v11);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection2Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection2Text"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSectionWithHeader:content:", v13, v15);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection3Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection3Text"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSectionWithHeader:content:", v17, v19);

  objc_msgSend(MEMORY[0x24BE6E440], "accessoryButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityKBURL"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:forState:", v22, 0);

  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__networkQualityOpenURL, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection4Text"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSectionWithHeader:content:accessoryButton:", 0, v24, v20);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePressed);
  objc_msgSend(v28, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRightBarButtonItem:", v25);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v28);
  -[WFNetworkSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

}

- (void)donePressed
{
  id v2;

  -[WFNetworkSettingsViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_randomMACFooterView
{
  UITableViewHeaderFooterView *v3;
  UITableViewHeaderFooterView *randomMACFooterView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_randomMACFooterView)
  {
    v3 = (UITableViewHeaderFooterView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA18]), "initWithReuseIdentifier:", CFSTR("RandomMAC"));
    randomMACFooterView = self->_randomMACFooterView;
    self->_randomMACFooterView = v3;

    -[UITableViewHeaderFooterView textLabel](self->_randomMACFooterView, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_randomMACFooterView, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");

  }
  -[WFNetworkSettingsViewController _randomMACFooterTextToDisplay](self, "_randomMACFooterTextToDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView textLabel](self->_randomMACFooterView, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  return self->_randomMACFooterView;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  UITableViewHeaderFooterView *lowDataModeFooterView;
  WFHyperlinkFooterView *networkQualityFooterView;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WFNetworkSettingsViewController _contentSizeCategoryDidChange:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2196CC000, v7, v6, "%s: size changed to %@", (uint8_t *)&v11, 0x16u);

    }
  }

  lowDataModeFooterView = self->_lowDataModeFooterView;
  self->_lowDataModeFooterView = 0;

  networkQualityFooterView = self->_networkQualityFooterView;
  self->_networkQualityFooterView = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_portalURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFNetworkSettingsViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFNetworkSettingsViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portalURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_wifiPasswordContextOptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = &unk_24DB59B30;
  -[WFNetworkSettingsViewController _passcodePromptForViewingPasswords](self, "_passcodePromptForViewingPasswords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = &unk_24DB59B48;
  v8[0] = v3;
  -[WFNetworkSettingsViewController _touchIDPromptForViewingPasswords](self, "_touchIDPromptForViewingPasswords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_passcodePromptForViewingPasswords
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocPasswordConfirmationViewPassword"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_touchIDPromptForViewingPasswords
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocTouchIDConfirmationViewPassword"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isAutoJoinConfigurable
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;

  -[WFNetworkSettingsViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[WFNetworkSettingsViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autoJoinConfigurable") == 0;

  return v6;
}

- (void)_setupAccessoryHeader
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint8_t buf[16];

  -[WFNetworkSettingsViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDB3D90];
    -[WFNetworkSettingsViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "daDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infoViewControllerFromDevice:", v7);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[WFNetworkSettingsViewController addChildViewController:](self, "addChildViewController:", v20);
      objc_msgSend(v20, "preferredContentSize");
      v9 = v8;
      objc_msgSend(v20, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

      objc_msgSend(v20, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 2);

      -[WFNetworkSettingsViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      objc_msgSend(v20, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", 0.0, 0.0, v14, v9);

      -[WFNetworkSettingsViewController setAccessoryInfoController:](self, "setAccessoryInfoController:", v20);
      objc_msgSend(v20, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkSettingsViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTableHeaderView:", v16);

      objc_msgSend(v20, "didMoveToParentViewController:", self);
    }

  }
  else
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v18, v19, "Not setting up AccessoryHeader because current context hasn't implemented daDevice", buf, 2u);
    }

  }
}

- (void)_applicationWillResignActive:(id)a3
{
  id v3;

  if (self->_allowViewPassword)
  {
    objc_msgSend(MEMORY[0x24BEBD750], "sharedMenuController", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideMenu");

  }
}

- (void)_updateManagedNetworkHeader
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  if (-[WFNetworkSettingsViewController showManagedNetworkHeader](self, "showManagedNetworkHeader")
    && (-[WFNetworkSettingsViewController context](self, "context"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v7, 0.0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, v7, 100.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.427450985, 0.427450985, 0.447058827, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setTextAlignment:", 0);
    -[WFNetworkSettingsViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "networkOrigin");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 1)
      v14 = CFSTR("kWFLocManagedCarrierNetworkTitle");
    else
      v14 = CFSTR("kWFLocManagedProfileNetworkTitle");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v16);

    objc_msgSend(v8, "setText:", v15);
    objc_msgSend(v27, "addSubview:", v8);
    v17 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("headerLabel"), v8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-10-[headerLabel]-10-|"), 0, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addConstraints:", v19);

    v20 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("headerLabel"), v8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-40-[headerLabel]-40-|"), 0, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addConstraints:", v22);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 7, 0, 0, 0, 1.0, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addConstraint:", v23);
    objc_msgSend(v27, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    v25 = v24 + 40.0;
    objc_msgSend(v27, "removeConstraint:", v23);
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v7, v25);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    objc_msgSend(v8, "setPreferredMaxLayoutWidth:", v7);
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTableHeaderView:", v27);

  }
  else
  {
    -[WFNetworkSettingsViewController tableView](self, "tableView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTableHeaderView:", 0);
  }

}

- (void)_didStartPresentingDetailViewController
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  WFNetworkSettingsViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "-[WFNetworkSettingsViewController _didStartPresentingDetailViewController]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: %@", (uint8_t *)&v5, 0x16u);
  }

  self->_detailViewControllerVisible = 1;
}

- (void)_didDismissDetailViewController
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  WFNetworkSettingsViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "-[WFNetworkSettingsViewController _didDismissDetailViewController]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: %@", (uint8_t *)&v5, 0x16u);
  }

  self->_detailViewControllerVisible = 0;
}

- (WFNetworkSettingsViewControllerDataCoordinator)dataCoordinator
{
  return (WFNetworkSettingsViewControllerDataCoordinator *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
}

- (WFNetworkSettingsViewControllerDelegate)delegate
{
  return (WFNetworkSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFNetworkSettingsConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (BOOL)detailViewControllerVisible
{
  return self->_detailViewControllerVisible;
}

- (void)setDetailViewControllerVisible:(BOOL)a3
{
  self->_detailViewControllerVisible = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (NSArray)autoJoinSectionRows
{
  return (NSArray *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setAutoJoinSectionRows:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
  objc_storeStrong((id *)&self->_cellFactory, a3);
}

- (NSAttributedString)recommendationLinkAttributedString
{
  return self->_recommendationLinkAttributedString;
}

- (void)setRecommendationLinkAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationLinkAttributedString, a3);
}

- (void)setLinkFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_linkFooterView, a3);
}

- (void)setNetworkQualityFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityFooterView, a3);
}

- (void)setAutoJoinSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_autoJoinSwitch, a3);
}

- (void)setAutoLoginSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_autoLoginSwitch, a3);
}

- (void)setSaveDataModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_saveDataModeSwitch, a3);
}

- (void)setPrivacyProxyEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_privacyProxyEnabledSwitch, a3);
}

- (void)setNetworkQualityCell:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityCell, a3);
}

- (NSDate)networkQualityFooterDate
{
  return self->_networkQualityFooterDate;
}

- (void)setNetworkQualityFooterDate:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityFooterDate, a3);
}

- (void)setRandomMACSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_randomMACSwitch, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (WFDetailsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, a3);
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_randomMACAddress, a3);
}

- (BOOL)isUsingRandomMac
{
  return self->_isUsingRandomMac;
}

- (void)setIsUsingRandomMac:(BOOL)a3
{
  self->_isUsingRandomMac = a3;
}

- (BOOL)randomFeatureEnabled
{
  return self->_randomFeatureEnabled;
}

- (void)setRandomFeatureEnabled:(BOOL)a3
{
  self->_randomFeatureEnabled = a3;
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (BOOL)networkQualitySpinning
{
  return self->_networkQualitySpinning;
}

- (void)setNetworkQualitySpinning:(BOOL)a3
{
  self->_networkQualitySpinning = a3;
}

- (BOOL)allowViewPassword
{
  return self->_allowViewPassword;
}

- (void)setAllowViewPassword:(BOOL)a3
{
  self->_allowViewPassword = a3;
}

- (BOOL)credentailCellTapped
{
  return self->_credentailCellTapped;
}

- (void)setCredentailCellTapped:(BOOL)a3
{
  self->_credentailCellTapped = a3;
}

- (BOOL)showManagedNetworkHeader
{
  return self->_showManagedNetworkHeader;
}

- (void)setShowManagedNetworkHeader:(BOOL)a3
{
  self->_showManagedNetworkHeader = a3;
}

- (BOOL)isDeviceInDemoMode
{
  return self->_isDeviceInDemoMode;
}

- (void)setIsDeviceInDemoMode:(BOOL)a3
{
  self->_isDeviceInDemoMode = a3;
}

- (BOOL)isDemoModeAlertShowing
{
  return self->_isDemoModeAlertShowing;
}

- (void)setIsDemoModeAlertShowing:(BOOL)a3
{
  self->_isDemoModeAlertShowing = a3;
}

- (unint64_t)scrollToCellType
{
  return self->_scrollToCellType;
}

- (void)setScrollToCellType:(unint64_t)a3
{
  self->_scrollToCellType = a3;
}

- (BOOL)isRandomMACManageFeatureEnabled
{
  return self->_isRandomMACManageFeatureEnabled;
}

- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3
{
  self->_isRandomMACManageFeatureEnabled = a3;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (BOOL)isRotatingTurnedOnForMigratedNetwork
{
  return self->_isRotatingTurnedOnForMigratedNetwork;
}

- (void)setIsRotatingTurnedOnForMigratedNetwork:(BOOL)a3
{
  self->_isRotatingTurnedOnForMigratedNetwork = a3;
}

- (UIViewController)accessoryInfoController
{
  return self->_accessoryInfoController;
}

- (void)setAccessoryInfoController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoController, a3);
}

- (BOOL)isAccessory
{
  return self->_accessory;
}

- (void)setAccessory:(BOOL)a3
{
  self->_accessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfoController, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_randomMACSwitch, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterDate, 0);
  objc_storeStrong((id *)&self->_networkQualityCell, 0);
  objc_storeStrong((id *)&self->_privacyProxyEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_saveDataModeSwitch, 0);
  objc_storeStrong((id *)&self->_autoLoginSwitch, 0);
  objc_storeStrong((id *)&self->_autoJoinSwitch, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterView, 0);
  objc_storeStrong((id *)&self->_linkFooterView, 0);
  objc_storeStrong((id *)&self->_recommendationLinkAttributedString, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_autoJoinSectionRows, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_managedNetworkHeaderView, 0);
  objc_storeStrong((id *)&self->_outrankedFooterView, 0);
  objc_storeStrong((id *)&self->_randomMACFooterView, 0);
  objc_storeStrong((id *)&self->_privacyProxyEnabledFooterView, 0);
  objc_storeStrong((id *)&self->_lowDataModeFooterView, 0);
  objc_storeStrong((id *)&self->_wifiModeFooterView, 0);
}

@end
