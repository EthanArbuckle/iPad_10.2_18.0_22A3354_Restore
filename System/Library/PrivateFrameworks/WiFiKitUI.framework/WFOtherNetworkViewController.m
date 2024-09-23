@implementation WFOtherNetworkViewController

- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3 withTableStyle:(int64_t)a4
{
  WFOtherNetworkViewController *v5;
  WFOtherNetworkViewController *v6;
  uint64_t v7;
  NSOrderedSet *sections;
  uint64_t v9;
  NSOrderedSet *securityRows;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFOtherNetworkViewController;
  v5 = -[WFOtherNetworkViewController initWithStyle:](&v12, sel_initWithStyle_, a4);
  v6 = v5;
  if (v5)
  {
    v5->_style = a3;
    v5->_passwordRequired = 1;
    v5->_firstResponderCell = -1;
    v5->_profileMode = -1;
    v5->_WAPIEnabled = 0;
    v5->_wantsModalPresentation = 1;
    v5->_overrideDefaultSecurity = 1;
    -[WFOtherNetworkViewController _sectionsForStyle:](v5, "_sectionsForStyle:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    sections = v6->_sections;
    v6->_sections = (NSOrderedSet *)v7;

    -[WFOtherNetworkViewController _securityRowsForStyle:](v6, "_securityRowsForStyle:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    securityRows = v6->_securityRows;
    v6->_securityRows = (NSOrderedSet *)v9;

    v6->_shouldCancelContextWhenViewDisappear = 1;
  }
  return v6;
}

- (WFOtherNetworkViewController)initWithOtherNetworkStyle:(int64_t)a3
{
  return -[WFOtherNetworkViewController initWithOtherNetworkStyle:withTableStyle:](self, "initWithOtherNetworkStyle:withTableStyle:", a3, 1);
}

- (WFOtherNetworkViewController)initWithOtherNetworkProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5
{
  id v9;
  id v10;
  WFOtherNetworkViewController *v11;
  uint64_t v12;
  NSString *randomMACAddress;
  uint64_t v14;
  NSString *hardwareMACAddress;
  uint64_t v16;
  NSArray *TLSIdentities;
  uint64_t v18;
  NSArray *WAPIRootCertificates;
  uint64_t v20;
  NSArray *WAPIIdentities;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v11 = -[WFOtherNetworkViewController initWithOtherNetworkStyle:](self, "initWithOtherNetworkStyle:", 3);
  if (v11)
  {
    v23.receiver = v11;
    v23.super_class = (Class)WFOtherNetworkViewController;
    v11 = -[WFOtherNetworkViewController initWithStyle:](&v23, sel_initWithStyle_, objc_msgSend(v10, "tableViewStyle"));
    v11->_deviceCapability = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    v11->_isUsingRandomAddress = objc_msgSend(v9, "isUsingRandomMACAddress");
    objc_msgSend(v9, "randomMACAddress");
    v12 = objc_claimAutoreleasedReturnValue();
    randomMACAddress = v11->_randomMACAddress;
    v11->_randomMACAddress = (NSString *)v12;

    objc_msgSend(v9, "hardwareMACAddress");
    v14 = objc_claimAutoreleasedReturnValue();
    hardwareMACAddress = v11->_hardwareMACAddress;
    v11->_hardwareMACAddress = (NSString *)v14;

    v11->_WAPIEnabled = objc_msgSend(v9, "availableAuthTraits") & 1;
    v11->_WPA3PersonalEnabled = (objc_msgSend(v9, "availableAuthTraits") & 2) != 0;
    v11->_WPA3EnterpriseEnabled = (objc_msgSend(v9, "availableAuthTraits") & 4) != 0;
    v11->_WPA2EnterpriseEnabledMFPCapable = (objc_msgSend(v9, "availableAuthTraits") & 8) != 0;
    objc_msgSend(v9, "availableTLSIdentities");
    v16 = objc_claimAutoreleasedReturnValue();
    TLSIdentities = v11->_TLSIdentities;
    v11->_TLSIdentities = (NSArray *)v16;

    objc_msgSend(v9, "WAPIRootCertificates");
    v18 = objc_claimAutoreleasedReturnValue();
    WAPIRootCertificates = v11->_WAPIRootCertificates;
    v11->_WAPIRootCertificates = (NSArray *)v18;

    objc_msgSend(v9, "WAPIIdentities");
    v20 = objc_claimAutoreleasedReturnValue();
    WAPIIdentities = v11->_WAPIIdentities;
    v11->_WAPIIdentities = (NSArray *)v20;

    v11->_overrideDefaultSecurity = 1;
    v11->_profileMode = 0;
    objc_storeStrong((id *)&v11->_appearanceProxy, a5);
  }

  return v11;
}

- (WFOtherNetworkViewController)initWithCredentialsProviderContext:(id)a3 deviceCapability:(int64_t)a4 appearanceProxy:(id)a5
{
  id v9;
  id v10;
  WFOtherNetworkViewController *v11;
  WFOtherNetworkViewController *v12;
  void *v13;
  uint64_t v14;
  NSString *networkName;
  uint64_t v16;
  NSString *username;
  NSObject *v18;
  os_log_type_t v19;
  char v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSArray *TLSIdentities;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  os_log_type_t v30;
  NSObject *v31;
  int v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  NSString *details;
  NSString *v41;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = -[WFOtherNetworkViewController initWithOtherNetworkStyle:](self, "initWithOtherNetworkStyle:", objc_msgSend(v9, "isEnterprise"));
  v12 = v11;
  if (v11)
  {
    v11->_deviceCapability = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    objc_msgSend(v9, "network");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ssid");
    v14 = objc_claimAutoreleasedReturnValue();
    networkName = v12->_networkName;
    v12->_networkName = (NSString *)v14;

    v43.receiver = v12;
    v43.super_class = (Class)WFOtherNetworkViewController;
    v12 = -[WFOtherNetworkViewController initWithStyle:](&v43, sel_initWithStyle_, objc_msgSend(v10, "tableViewStyle"));
    objc_storeStrong((id *)&v12->_appearanceProxy, a5);
    if (objc_msgSend(v9, "isEnterprise"))
    {
      objc_msgSend(v9, "username");
      v16 = objc_claimAutoreleasedReturnValue();
      username = v12->_username;
      v12->_username = (NSString *)v16;

      v12->_securityMode = 5;
      v12->_overrideDefaultSecurity = 0;
      -[WFOtherNetworkViewController _updateSections](v12, "_updateSections");
      WFLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        _os_log_impl(&dword_2196CC000, v18, v19, "%s: enterprise context", buf, 0xCu);
      }

    }
    v12->_WAPIEnabled = objc_msgSend(v9, "availableAuthTraits") & 1;
    v12->_WPA3PersonalEnabled = (objc_msgSend(v9, "availableAuthTraits") & 2) != 0;
    v12->_WPA3EnterpriseEnabled = (objc_msgSend(v9, "availableAuthTraits") & 4) != 0;
    v12->_WPA2EnterpriseEnabledMFPCapable = (objc_msgSend(v9, "availableAuthTraits") & 8) != 0;
    v20 = objc_msgSend(v9, "requestedFields");
    v12->_passwordRequired = v20 & 1;
    if ((v20 & 1) == 0)
    {
      WFLogForCategory(0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v21)
      {
        v23 = v21;
        if (os_log_type_enabled(v23, v22))
        {
          objc_msgSend(v9, "network");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
          v46 = 2112;
          v47 = v24;
          _os_log_impl(&dword_2196CC000, v23, v22, "%s: password not required for %@", buf, 0x16u);

        }
      }

    }
    objc_msgSend(v9, "availableTLSIdentities");
    v25 = objc_claimAutoreleasedReturnValue();
    TLSIdentities = v12->_TLSIdentities;
    v12->_TLSIdentities = (NSArray *)v25;

    if (v12->_TLSIdentities && v12->_profileMode == -1)
    {
      v12->_profileMode = 0;
      -[WFOtherNetworkViewController _updateSections](v12, "_updateSections");
      WFLogForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        _os_log_impl(&dword_2196CC000, v27, v28, "%s: profileMode is automatic due to TLSIdentities", buf, 0xCu);
      }

    }
    WFLogForCategory(0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29)
    {
      v31 = v29;
      if (os_log_type_enabled(v31, v30))
      {
        v32 = objc_msgSend(v9, "isPasswordSharingSupported");
        *(_DWORD *)buf = 136315394;
        v45 = "-[WFOtherNetworkViewController initWithCredentialsProviderContext:deviceCapability:appearanceProxy:]";
        v46 = 1024;
        LODWORD(v47) = v32;
        _os_log_impl(&dword_2196CC000, v31, v30, "%s: passwordSharingSupported %d", buf, 0x12u);
      }

    }
    if (objc_msgSend(v9, "isPasswordSharingSupported"))
    {
      if (WFCapabilityIsChinaDevice(a4))
      {
        objc_msgSend(CFSTR("kWFLocPasswordSharingDetails"), "stringByAppendingString:", CFSTR("_CH"));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = CFSTR("kWFLocPasswordSharingDetails");
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", v33, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "securityIssue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v39 = 0;
        goto LABEL_35;
      }
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "securityIssue");
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString issueDescription](v33, "issueDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "securityIssue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "issueRecommendation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@\n\n%@"), v36, v38);
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
LABEL_35:
    details = v12->_details;
    v12->_details = v39;
    v41 = v39;

    -[WFAppearanceProxy apply](v12->_appearanceProxy, "apply");
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t style;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
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
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  os_log_type_t v43;
  NSObject *v44;
  int v45;
  int v46;
  void *v47;
  objc_super v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController viewDidLoad](&v48, sel_viewDidLoad);
  -[WFOtherNetworkViewController backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFOtherNetworkViewController backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateJoinable, *MEMORY[0x24BEBE580], 0);

  if (self->_overrideDefaultSecurity)
  {
    if (-[WFOtherNetworkViewController WPA3PersonalEnabled](self, "WPA3PersonalEnabled"))
      v7 = 9;
    else
      v7 = 3;
    -[WFOtherNetworkViewController setSecurityMode:](self, "setSecurityMode:", v7);
  }
  style = self->_style;
  if (style)
  {
    if (style == 3)
    {
      v9 = 0;
    }
    else
    {
      if (style != 1)
        goto LABEL_15;
      v9 = 1;
    }
  }
  else
  {
    v9 = 2;
  }
  -[WFOtherNetworkViewController setFirstResponderCell:](self, "setFirstResponderCell:", v9);
LABEL_15:
  v10 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOtherNetworkViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerNib:forCellReuseIdentifier:", v12, CFSTR("kWFTextFieldCellIdentifier"));

  -[WFOtherNetworkViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFOtherNetworkHeaderIdentifier"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss_);
  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  v17 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworksJoinButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 2, self, sel__join_);
  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRightBarButtonItem:", v20);

  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightBarButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEnabled:", 0);

  -[WFOtherNetworkViewController setJoinable:](self, "setJoinable:", 0);
  v24 = -[WFOtherNetworkViewController style](self, "style");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24 == 3)
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworksTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController setTitle:](self, "setTitle:", v27);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworksPrompt"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController setActivityString:](self, "setActivityString:", v29);
  }
  else
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworksPasswordTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController setTitle:](self, "setTitle:", v30);

    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("kWFLocPasswordAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController networkName](self, "networkName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v29, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController setActivityString:](self, "setActivityString:", v33);

  }
  -[WFOtherNetworkViewController activityString](self, "activityString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkViewController setDefaultActivityString:](self, "setDefaultActivityString:", v34);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "beginGeneratingDeviceOrientationNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x24BEBE100];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", self, sel_orientationChanged_, v37, v38);

  v39 = *MEMORY[0x24BEBE770];
  -[WFOtherNetworkViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setRowHeight:", v39);

  -[WFOtherNetworkViewController tableView](self, "tableView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEstimatedRowHeight:", 44.0);

  self->_privateAddressMode = 1;
  WFLogForCategory(0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v42)
  {
    v44 = v42;
    if (os_log_type_enabled(v44, v43))
    {
      v45 = -[WFOtherNetworkViewController style](self, "style");
      v46 = -[WFOtherNetworkViewController securityMode](self, "securityMode");
      -[WFOtherNetworkViewController networkName](self, "networkName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v50 = "-[WFOtherNetworkViewController viewDidLoad]";
      v51 = 1024;
      v52 = v45;
      v53 = 1024;
      v54 = v46;
      v55 = 2112;
      v56 = v47;
      _os_log_impl(&dword_2196CC000, v44, v43, "%s: style %d security type %d network %@", buf, 0x22u);

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  WFOtherNetworkViewController *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController viewDidAppear:](&v29, sel_viewDidAppear_, a3);
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[WFOtherNetworkViewController viewDidAppear:]";
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardShown_, *MEMORY[0x24BEBE448], 0);

  -[WFOtherNetworkViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPasswordSharingSupported");

  if (v9)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFOtherNetworkViewController viewDidAppear:]";
      v32 = 2112;
      v33 = self;
      _os_log_impl(&dword_2196CC000, v10, v11, "%s: activating password sharing %@", buf, 0x16u);
    }

    -[WFOtherNetworkViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activatePasswordSharing");

  }
  if (-[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell") != -1)
  {
    -[WFOtherNetworkViewController nameCell](self, "nameCell");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

      if (!v15)
      {
        -[WFOtherNetworkViewController nameCell](self, "nameCell");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

      if (v18 == 1)
      {
        -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        v23 = v19;
        objc_msgSend(v19, "becomeFirstResponder");

        -[WFOtherNetworkViewController setFirstResponderCell:](self, "setFirstResponderCell:", -1);
        goto LABEL_22;
      }
    }
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      v22 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

      if (v22 == 2)
      {
        -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "becomeFirstResponder");

      -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "becomeFirstResponder");

    }
  }
  self->_shouldCancelContextWhenViewDisappear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (self->_shouldCancelContextWhenViewDisappear)
    -[WFCredentialsProviderContext cancel](self->_context, "cancel");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  WFOtherNetworkViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)WFOtherNetworkViewController;
  -[WFOtherNetworkViewController viewWillDisappear:](&v14, sel_viewWillDisappear_, a3);
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFOtherNetworkViewController viewWillDisappear:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: %@", buf, 0x16u);
  }

  -[WFOtherNetworkViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPasswordSharingSupported");

  if (v7)
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFOtherNetworkViewController viewWillDisappear:]";
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_2196CC000, v8, v9, "%s: deactivating password sharing %@", buf, 0x16u);
    }

    -[WFOtherNetworkViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivatePasswordSharingWithReactivation:", 0);

  }
  -[WFOtherNetworkViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endEditing:", 1);

  -[WFOtherNetworkViewController setFirstResponderCell:](self, "setFirstResponderCell:", -1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);

}

- (void)_scrollToCellAndBecomeFirstResponder:(id)a3
{
  WFTextFieldCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = (WFTextFieldCell *)a3;
  -[WFOtherNetworkViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell frame](v4, "frame");
  v7 = v6;
  -[WFTextFieldCell frame](v4, "frame");
  v9 = v8 + 20.0;
  -[WFTextFieldCell frame](v4, "frame");
  v11 = v10;
  -[WFTextFieldCell frame](v4, "frame");
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0, v7, v9, v11);

  -[WFTextFieldCell textField](v4, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_becomeFirstResponder, 0, 1);

  -[WFTextFieldCell textField](v4, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performSelector:withObject:afterDelay:", sel_becomeFirstResponder, 0, 0.1);

  self->_mostRecentFirstResponder = v4;
}

- (void)orientationChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v4, "orientation") - 3) <= 1)
    -[WFOtherNetworkViewController _scrollToCellAndBecomeFirstResponder:](self, "_scrollToCellAndBecomeFirstResponder:", self->_mostRecentFirstResponder);

}

- (void)_dismiss:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "resignFirstResponder");
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v12 = 136315138;
    v13 = "-[WFOtherNetworkViewController _dismiss:]";
    _os_log_impl(&dword_2196CC000, v6, v7, "%s: user tapped cancel", (uint8_t *)&v12, 0xCu);
  }

  -[WFOtherNetworkViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[WFOtherNetworkViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFOtherNetworkViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "otherNetworkViewControllerUserDidTapCancel:", self);

  }
}

- (void)_join:(id)a3
{
  WFOtherNetworkViewController *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  WFOtherNetworkViewController *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (WFOtherNetworkViewController *)a3;
  self->_shouldCancelContextWhenViewDisappear = 0;
  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "deactivate");
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[WFOtherNetworkViewController _join:]";
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_2196CC000, v7, v8, "%s: join with sender %@", buf, 0x16u);
  }

  -[WFOtherNetworkViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "resignFirstResponder");
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[WFOtherNetworkViewController _join:]";
    _os_log_impl(&dword_2196CC000, v11, v12, "%s: user tapped join", buf, 0xCu);
  }

  -[WFOtherNetworkViewController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_2550D0D78);

  if (v14)
  {
    -[WFOtherNetworkViewController context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "savePrivateAddressMode:", -[WFOtherNetworkViewController privateAddressMode](self, "privateAddressMode"));

  }
  -[WFOtherNetworkViewController setJoining:](self, "setJoining:", 1);
  objc_initWeak(&location, self);
  -[WFOtherNetworkViewController context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __38__WFOtherNetworkViewController__join___block_invoke;
  v26 = &unk_24DB37B60;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v16, "gatherCredentials:", &v23);

  -[WFOtherNetworkViewController delegate](self, "delegate", v23, v24, v25, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = v17 == 0;

  if ((_DWORD)v16)
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[WFOtherNetworkViewController _join:]";
      v31 = 2112;
      v32 = self;
      _os_log_impl(&dword_2196CC000, v18, v19, "%s: %@ delegate is nil", buf, 0x16u);
    }

  }
  -[WFOtherNetworkViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[WFOtherNetworkViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "otherNetworkViewControllerUserDidTapJoin:", self);

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __38__WFOtherNetworkViewController__join___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setJoining:", 0);

}

- (void)_updateJoinable
{
  void *v3;
  int v4;
  unint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  int v15;
  void *v16;
  os_log_type_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  WFOtherNetworkViewController *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  _BYTE v32[10];
  _BYTE v33[6];
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", &unk_24DB59890);

  v5 = -[WFOtherNetworkViewController securityMode](self, "securityMode");
  v6 = v5 <= 0xA && ((1 << v5) & 0x430) != 0 || -[WFOtherNetworkViewController style](self, "style") == 1;
  v7 = (-[WFOtherNetworkViewController securityMode](self, "securityMode")
     || -[WFOtherNetworkViewController style](self, "style") == 1
     || !-[WFOtherNetworkViewController style](self, "style"))
    && -[WFOtherNetworkViewController passwordRequired](self, "passwordRequired");
  if (-[WFOtherNetworkViewController profileMode](self, "profileMode") == 1)
    v8 = -[WFOtherNetworkViewController securityMode](self, "securityMode") == 5
      || -[WFOtherNetworkViewController securityMode](self, "securityMode") == 4
      || -[WFOtherNetworkViewController securityMode](self, "securityMode") == 10;
  else
    v8 = 0;
  v9 = -[WFOtherNetworkViewController securityMode](self, "securityMode") == 7
    || -[WFOtherNetworkViewController style](self, "style") == 2;
  WFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v10 && os_log_type_enabled(v10, v11))
  {
    v29 = 136316418;
    v30 = "-[WFOtherNetworkViewController _updateJoinable]";
    v31 = 1024;
    *(_DWORD *)v32 = v4;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v6;
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v7;
    v34 = 1024;
    v35 = v8;
    v36 = 1024;
    v37 = v9;
    _os_log_impl(&dword_2196CC000, v10, v11, "%s: requiresNetworkName %d requiresUserName %d requiresPassword %d requiresIdentity %d requiresWAPIIdentities %d", (uint8_t *)&v29, 0x2Au);
  }

  if (v8 && v6)
  {
    if (-[WFOtherNetworkViewController TLSIdentity](self, "TLSIdentity"))
    {
      WFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v12 && os_log_type_enabled(v12, v13))
      {
        v29 = 136315138;
        v30 = "-[WFOtherNetworkViewController _updateJoinable]";
        _os_log_impl(&dword_2196CC000, v12, v13, "%s: username not required with TLSIdentity", (uint8_t *)&v29, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType") == 4)
    objc_msgSend(v14, "setReturnKeyEnabled:", 1);
  if (v4 && !-[NSString length](self->_networkName, "length") || v6 && !-[NSString length](self->_username, "length"))
    goto LABEL_51;
  v15 = v7 & ~(v8 || v9);
  WFLogForCategory(0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v16)
  {
    v18 = v16;
    if (os_log_type_enabled(v18, v17))
    {
      -[WFOtherNetworkViewController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOtherNetworkViewController context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "validateCredentials");
      v29 = 136315650;
      v30 = "-[WFOtherNetworkViewController _updateJoinable]";
      v31 = 2112;
      *(_QWORD *)v32 = v19;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)v33 = v21;
      _os_log_impl(&dword_2196CC000, v18, v17, "%s: self.context %@ [self.context validateCredentials] %d", (uint8_t *)&v29, 0x1Cu);

    }
  }

  if (v15)
  {
    if (!-[NSString length](self->_password, "length"))
      goto LABEL_51;
    -[WFOtherNetworkViewController context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "validateCredentials");

    if ((v23 & 1) == 0)
      goto LABEL_51;
  }
  if ((!v8 || -[WFOtherNetworkViewController TLSIdentity](self, "TLSIdentity"))
    && (!v9
     || (-[WFOtherNetworkViewController WAPIIdentity](self, "WAPIIdentity"),
         (v24 = objc_claimAutoreleasedReturnValue()) != 0)
     && (v25 = (void *)v24,
         -[WFOtherNetworkViewController WAPIRootCertificate](self, "WAPIRootCertificate"),
         v26 = (void *)objc_claimAutoreleasedReturnValue(),
         v26,
         v25,
         v26)))
  {
    v27 = self;
    v28 = 1;
  }
  else
  {
LABEL_51:
    v27 = self;
    v28 = 0;
  }
  -[WFOtherNetworkViewController setJoinable:](v27, "setJoinable:", v28);

}

- (void)setBackgroundColor:(id)a3
{
  UIColor **p_backgroundColor;
  id v6;
  UIColor *v7;
  id v8;

  p_backgroundColor = &self->_backgroundColor;
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  v6 = a3;
  v7 = *p_backgroundColor;
  -[WFOtherNetworkViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)setJoinable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType") == 3)
  {
    objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReturnKeyEnabled:", v3);

  }
  if (self->_joinable != v3)
  {
    self->_joinable = v3;
    -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);

  }
}

- (void)setJoining:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;

  self->_joining = a3;
  v4 = !a3;
  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

  v7 = !self->_joining;
  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  v10 = !self->_joining;
  -[WFOtherNetworkViewController nameCell](self, "nameCell");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", v10);

  v13 = !self->_joining;
  -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", v13);

  v16 = !self->_joining;
  -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", v16);

  if (!self->_joining)
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
}

- (void)setTLSIdentities:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_TLSIdentities, a3);
  if (objc_msgSend(v6, "count") && self->_profileMode == -1)
    self->_profileMode = 0;
  -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
  -[WFOtherNetworkViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  if (self->_TLSIdentity != a3)
  {
    self->_TLSIdentity = a3;
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
  }
}

- (void)setWAPIIdentity:(id)a3
{
  id v4;

  if (self->_WAPIIdentity != a3)
  {
    self->_WAPIIdentity = a3;
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
    -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setWAPIRootCertificate:(id)a3
{
  id v4;

  if (self->_WAPIRootCertificate != a3)
  {
    self->_WAPIRootCertificate = a3;
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
    -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setSecurityMode:(int64_t)a3
{
  id v4;

  self->_overrideDefaultSecurity = 0;
  if (self->_securityMode != a3)
  {
    self->_securityMode = a3;
    -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setProfileMode:(int64_t)a3
{
  id v4;

  if (self->_profileMode != a3)
  {
    self->_profileMode = a3;
    -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setNetworkName:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_networkName) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_networkName, a3);
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
  }

}

- (void)setUsername:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_username) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_username, a3);
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
  }

}

- (void)receiveSharedPassword:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFOtherNetworkViewController receiveSharedPassword:]";
    v15 = 2048;
    v16 = 0x3FD999999999999ALL;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: entering password with delay %f", buf, 0x16u);
  }

  if (!-[WFOtherNetworkViewController style](self, "style"))
  {
    -[WFOtherNetworkViewController setPassword:](self, "setPassword:", v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("********"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v7);

    -[WFOtherNetworkViewController setJoinable:](self, "setJoinable:", 1);
    objc_initWeak((id *)buf, self);
    v10 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__WFOtherNetworkViewController_receiveSharedPassword___block_invoke;
    block[3] = &unk_24DB37850;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __54__WFOtherNetworkViewController_receiveSharedPassword___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_join:", WeakRetained);

}

- (id)_sectionsForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v10;
  uint64_t v11;

  switch(a3)
  {
    case 0:
      v5 = (void *)MEMORY[0x24BDBCF00];
      goto LABEL_10;
    case 1:
      v8 = -[WFOtherNetworkViewController _canShowModes](self, "_canShowModes");
      v5 = (void *)MEMORY[0x24BDBCF00];
      if (v8)
      {
        v6 = &unk_24DB598C0;
LABEL_9:
        v10 = v6;
        v11 = 0;
      }
      else
      {
LABEL_10:
        v10 = 0;
      }
      objc_msgSend(v5, "orderedSetWithObjects:", &unk_24DB598A8, v10, v11, v3, v4);
LABEL_12:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    case 2:
      v5 = (void *)MEMORY[0x24BDBCF00];
      v6 = &unk_24DB598D8;
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59890, &unk_24DB598A8, 0, v3, v4);
      goto LABEL_12;
    default:
      v7 = 0;
      return v7;
  }
}

- (id)_securityRowsForStyle:(int64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v8;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB598C0, 0, v8);
      goto LABEL_12;
    case 1:
      if (-[WFOtherNetworkViewController profileMode](self, "profileMode") == 1
        || !-[WFOtherNetworkViewController passwordRequired](self, "passwordRequired"))
      {
        v5 = (void *)MEMORY[0x24BDBCF00];
        v6 = &unk_24DB598D8;
      }
      else
      {
        v5 = (void *)MEMORY[0x24BDBCF00];
        v6 = &unk_24DB598C0;
      }
      objc_msgSend(v5, "orderedSetWithObjects:", &unk_24DB598A8, v6, 0);
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB598F0, 0, v8);
      goto LABEL_12;
    case 3:
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59890, 0, v8);
LABEL_12:
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)_updateSections
{
  void *v3;
  unint64_t securityMode;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  -[WFOtherNetworkViewController _sectionsForStyle:](self, "_sectionsForStyle:", -[WFOtherNetworkViewController style](self, "style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "mutableCopy");

  if (-[WFOtherNetworkViewController style](self, "style") == 3)
  {
    securityMode = self->_securityMode;
    if (securityMode > 9 || ((1 << securityMode) & 0x34E) == 0)
    {
      if ((securityMode & 0xFFFFFFFFFFFFFFFELL) == 4
        || -[WFOtherNetworkViewController securityMode](self, "securityMode") == 10)
      {
        if (-[WFOtherNetworkViewController _canShowModes](self, "_canShowModes"))
        {
          if ((objc_msgSend(v13, "containsObject:", &unk_24DB598C0) & 1) == 0)
            objc_msgSend(v13, "addObject:", &unk_24DB598C0);
          if (-[WFOtherNetworkViewController profileMode](self, "profileMode") != 1)
          {
            if (-[WFOtherNetworkViewController profileMode](self, "profileMode"))
              goto LABEL_11;
            objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59890, &unk_24DB598A8, &unk_24DB598C0, 0);
            goto LABEL_7;
          }
          v8 = (void *)MEMORY[0x24BDBCF00];
          v9 = &unk_24DB598D8;
        }
        else
        {
          v8 = (void *)MEMORY[0x24BDBCF00];
          v9 = &unk_24DB598C0;
        }
        v10 = &unk_24DB598A8;
      }
      else
      {
        v8 = (void *)MEMORY[0x24BDBCF00];
        if (securityMode != 7)
        {
          objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59890, 0, v11, v12);
          goto LABEL_7;
        }
        v9 = &unk_24DB59908;
        v10 = &unk_24DB598F0;
      }
      objc_msgSend(v8, "orderedSetWithObjects:", &unk_24DB59890, v10, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59890, &unk_24DB598C0, 0, v12);
    }
LABEL_7:
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v7 = (void *)v6;
    -[WFOtherNetworkViewController setSecurityRows:](self, "setSecurityRows:", v6);

    goto LABEL_11;
  }
  if (-[WFOtherNetworkViewController style](self, "style") == 1)
  {
    -[WFOtherNetworkViewController _securityRowsForStyle:](self, "_securityRowsForStyle:", -[WFOtherNetworkViewController style](self, "style"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  -[WFOtherNetworkViewController setSections:](self, "setSections:", v13);

}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;

  v19 = a3;
  if (-[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType") == 3)
  {
LABEL_2:
    -[WFOtherNetworkViewController _join:](self, "_join:", self);
LABEL_24:
    v7 = v19;
    goto LABEL_25;
  }
  -[WFOtherNetworkViewController nameCell](self, "nameCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v19)
  {
    -[WFOtherNetworkViewController securityRows](self, "securityRows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", &unk_24DB598A8) & 1) != 0)
    {
      -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
LABEL_12:
        -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v15 = (void *)v12;
        -[WFOtherNetworkViewController _scrollToCellAndBecomeFirstResponder:](self, "_scrollToCellAndBecomeFirstResponder:", v12);
        goto LABEL_23;
      }
    }
    else
    {

    }
    -[WFOtherNetworkViewController securityRows](self, "securityRows");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsObject:", &unk_24DB598C0) & 1) == 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v19;
    if (!v16)
      goto LABEL_25;
LABEL_19:
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v19)
  {
    -[WFOtherNetworkViewController securityRows](self, "securityRows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", &unk_24DB598C0) & 1) == 0)
    {

      goto LABEL_21;
    }
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_21;
    goto LABEL_19;
  }
  -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v19;
  if (v6 == v19)
  {
    if (!-[WFOtherNetworkViewController style](self, "style"))
    {
      v17 = -[WFOtherNetworkViewController joinable](self, "joinable");
      v7 = v19;
      if (!v17)
        goto LABEL_25;
      goto LABEL_2;
    }
    -[WFOtherNetworkViewController sections](self, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", &unk_24DB59890) & 1) == 0)
    {

LABEL_29:
      -[WFOtherNetworkViewController securityRows](self, "securityRows");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "containsObject:", &unk_24DB598A8) & 1) == 0)
        goto LABEL_23;
      -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v19;
      if (!v18)
        goto LABEL_25;
      goto LABEL_12;
    }
    -[WFOtherNetworkViewController nameCell](self, "nameCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_29;
LABEL_21:
    -[WFOtherNetworkViewController nameCell](self, "nameCell");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_25:

}

- (void)_setTLSIdentity:(id)a3 specifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkViewController setTLSIdentity:](self, "setTLSIdentity:", a3, a4);
  -[WFOtherNetworkViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", &unk_24DB598A8);

  -[WFOtherNetworkViewController securityRows](self, "securityRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB598D8);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v12))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFOtherNetworkViewController _setTLSIdentity:specifier:]";
      v16 = 2050;
      v17 = v6;
      v18 = 2050;
      v19 = v8;
      _os_log_impl(&dword_2196CC000, v9, v12, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject reloadRowsAtIndexPaths:withRowAnimation:](v9, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

  }
}

- (void)_setWAPIRootCertificate:(id)a3 specifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkViewController setWAPIRootCertificate:](self, "setWAPIRootCertificate:", a3, a4);
  -[WFOtherNetworkViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", &unk_24DB598A8);

  -[WFOtherNetworkViewController securityRows](self, "securityRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB598F0);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v12))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFOtherNetworkViewController _setWAPIRootCertificate:specifier:]";
      v16 = 2050;
      v17 = v6;
      v18 = 2050;
      v19 = v8;
      _os_log_impl(&dword_2196CC000, v9, v12, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject reloadRowsAtIndexPaths:withRowAnimation:](v9, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

  }
}

- (void)_setWAPIIdentity:(id)a3 specifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_log_type_t v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkViewController setWAPIIdentity:](self, "setWAPIIdentity:", a3, a4);
  -[WFOtherNetworkViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", &unk_24DB598A8);

  -[WFOtherNetworkViewController securityRows](self, "securityRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB59908);

  if (-[WFOtherNetworkViewController style](self, "style") == 2)
  {
    -[WFOtherNetworkViewController sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "indexOfObject:", &unk_24DB598D8);

    v8 = 0;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v13))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[WFOtherNetworkViewController _setWAPIIdentity:specifier:]";
      v17 = 2050;
      v18 = v6;
      v19 = 2050;
      v20 = v8;
      _os_log_impl(&dword_2196CC000, v10, v13, "%s- Unable to find section and row for Identity cell (section %{public}lu, row %{public}lu)", buf, 0x20u);
    }
  }
  else
  {
    -[WFOtherNetworkViewController tableView](self, "tableView");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject reloadRowsAtIndexPaths:withRowAnimation:](v10, "reloadRowsAtIndexPaths:withRowAnimation:", v12, 5);

  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  WFTextFieldCell *v10;
  id v11;

  v11 = a3;
  -[WFOtherNetworkViewController nameCell](self, "nameCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v11)
  {
    v10 = (WFTextFieldCell *)-[WFOtherNetworkViewController nameCell](self, "nameCell");
    goto LABEL_7;
  }
  -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textField");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v11)
  {
    v10 = (WFTextFieldCell *)-[WFOtherNetworkViewController usernameCell](self, "usernameCell");
    goto LABEL_7;
  }
  -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textField");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v11)
  {
    v10 = (WFTextFieldCell *)-[WFOtherNetworkViewController passwordCell](self, "passwordCell");
LABEL_7:
    self->_mostRecentFirstResponder = v10;
  }
  objc_msgSend(v11, "setReturnKeyType:", -[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType"));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  WFValueListViewController *v18;
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
  WFValueListViewController *v29;
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
  _BOOL4 IsChinaDevice;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _UNKNOWN **v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  WFValueListViewController *v58;
  WFValueListViewController *privateAddressModeTitlesValueVC;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (!-[WFOtherNetworkViewController joining](self, "joining"))
  {
    -[WFOtherNetworkViewController sections](self, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == 3)
    {
LABEL_8:
      v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(CFSTR("MCCertificatePickerController")));
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkIdentityWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel__setWAPIIdentity_specifier_, sel__getWAPIIdentity_, 0, -1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOtherNetworkViewController WAPIIdentities](self, "WAPIIdentities");
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v23 = (void *)v22;
      objc_msgSend(v21, "setValues:", v22);

      -[WFValueListViewController setSpecifier:](v18, "setSpecifier:", v21);
      -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "prompt");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFValueListViewController navigationItem](v18, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setPrompt:", v25);

      self->_shouldCancelContextWhenViewDisappear = 0;
      -[WFOtherNetworkViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pushViewController:animated:", v18, 1);

    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 1)
        {
          -[WFOtherNetworkViewController securityRows](self, "securityRows");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v7, "row"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          switch(v16)
          {
            case 0:
              -[WFOtherNetworkViewController securityTitlesValueVC](self, "securityTitlesValueVC");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                -[WFOtherNetworkViewController securityTitlesValueVC](self, "securityTitlesValueVC");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                IsChinaDevice = WFCapabilityIsChinaDevice(-[WFOtherNetworkViewController deviceCapability](self, "deviceCapability"));
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v43;
                v78 = IsChinaDevice;
                if (IsChinaDevice)
                  v45 = CFSTR("KWFLocSettingRandomMACSwitchChinaTitle");
                else
                  v45 = CFSTR("KWFLocSettingRandomMACSwitchTitle");
                objc_msgSend(v43, "localizedStringForKey:value:table:", v45, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();

                v80 = (void *)MEMORY[0x24BDBCE30];
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACStaticOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACRotatingOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "arrayWithObjects:", v47, v49, v51, 0);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                v52 = &off_24DB36000;
                if (!self->_privateAddressModeTitlesValueVC)
                {
                  v76 = (void *)MEMORY[0x24BDBCE30];
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACStaticOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACRotatingOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "arrayWithObjects:", v75, v54, v56, 0);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  v52 = &off_24DB36000;
                  v58 = -[WFValueListViewController initWithTitles:switchTitle:]([WFValueListViewController alloc], "initWithTitles:switchTitle:", v57, 0);
                  privateAddressModeTitlesValueVC = self->_privateAddressModeTitlesValueVC;
                  self->_privateAddressModeTitlesValueVC = v58;

                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = v60;
                  if (v78)
                    v62 = CFSTR("KWFLocSettingRandomMACSwitchChinaTitle");
                  else
                    v62 = CFSTR("KWFLocSettingRandomMACSwitchTitle");
                  objc_msgSend(v60, "localizedStringForKey:value:table:", v62, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFValueListViewController navigationItem](self->_privateAddressModeTitlesValueVC, "navigationItem");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setTitle:", v63);

                }
                -[WFOtherNetworkViewController _selectedPrivateModeForOption:](self, "_selectedPrivateModeForOption:", self->_privateAddressMode);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFValueListViewController setSelectedTitle:](self->_privateAddressModeTitlesValueVC, "setSelectedTitle:", v65);

                v66 = objc_alloc((Class)v52[323]);
                -[WFOtherNetworkViewController _availableSecurityTitles](self, "_availableSecurityTitles");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = (void *)objc_msgSend(v66, "initWithTitles:switchTitle:sublist:", v67, 0, self->_privateAddressModeTitlesValueVC);

                -[WFOtherNetworkViewController _securityStringFromType:](self, "_securityStringFromType:", self->_securityMode);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setSelectedTitle:", v68);

                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkSecurityTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setTitle:", v70);

                objc_initWeak(location, self);
                v84[0] = MEMORY[0x24BDAC760];
                v84[1] = 3221225472;
                v84[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke;
                v84[3] = &unk_24DB37B88;
                objc_copyWeak(&v85, location);
                v84[4] = self;
                objc_msgSend(v39, "setCompletionHandler:", v84);
                -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "prompt");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "navigationItem");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setPrompt:", v72);

                -[WFOtherNetworkViewController setSecurityTitlesValueVC:](self, "setSecurityTitlesValueVC:", v39);
                objc_destroyWeak(&v85);
                objc_destroyWeak(location);

              }
              self->_shouldCancelContextWhenViewDisappear = 0;
              -[WFOtherNetworkViewController navigationController](self, "navigationController");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "pushViewController:animated:", v39, 1);

              break;
            case 1:
            case 2:
              objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "becomeFirstResponder");

              break;
            case 3:
              v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(CFSTR("MCCertificatePickerController")));
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkIdentityTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel__setTLSIdentity_specifier_, sel__getTLSIdentity_, 0, -1, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFOtherNetworkViewController TLSIdentities](self, "TLSIdentities");
              v22 = objc_claimAutoreleasedReturnValue();
              goto LABEL_9;
            case 4:
              v18 = (WFValueListViewController *)objc_alloc_init(WFManagedConfigurationUIClassFromString(CFSTR("MCCertificatePickerController")));
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkRootCertWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel__setWAPIRootCertificate_specifier_, sel__getWAPIRootCertificate_, 0, -1, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFOtherNetworkViewController WAPIRootCertificates](self, "WAPIRootCertificates");
              v22 = objc_claimAutoreleasedReturnValue();
              goto LABEL_9;
            case 5:
              goto LABEL_8;
            default:
              goto LABEL_15;
          }
        }
        goto LABEL_15;
      }
      -[WFOtherNetworkViewController profileModeTitlesValueVC](self, "profileModeTitlesValueVC");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[WFOtherNetworkViewController profileModeTitlesValueVC](self, "profileModeTitlesValueVC");
        v18 = (WFValueListViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = [WFValueListViewController alloc];
        -[WFOtherNetworkViewController _availableProfileModeTitles](self, "_availableProfileModeTitles");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[WFValueListViewController initWithTitles:switchTitle:](v29, "initWithTitles:switchTitle:", v30, 0);

        -[WFOtherNetworkViewController _profileModeStringFromType:](self, "_profileModeStringFromType:", self->_profileMode);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFValueListViewController setSelectedTitle:](v18, "setSelectedTitle:", v31);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkSecurityTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFValueListViewController setTitle:](v18, "setTitle:", v33);

        objc_initWeak(location, self);
        v82[0] = MEMORY[0x24BDAC760];
        v82[1] = 3221225472;
        v82[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
        v82[3] = &unk_24DB37BB0;
        v82[4] = self;
        objc_copyWeak(&v83, location);
        -[WFValueListViewController setCompletionHandler:](v18, "setCompletionHandler:", v82);
        -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "prompt");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFValueListViewController navigationItem](v18, "navigationItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPrompt:", v35);

        -[WFOtherNetworkViewController setProfileModeTitlesValueVC:](self, "setProfileModeTitlesValueVC:", v18);
        objc_destroyWeak(&v83);
        objc_destroyWeak(location);
      }
      self->_shouldCancelContextWhenViewDisappear = 0;
      -[WFOtherNetworkViewController navigationController](self, "navigationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pushViewController:animated:", v18, 1);

    }
LABEL_15:
    v8 = v6;
    v9 = v7;
    v10 = 1;
    goto LABEL_16;
  }
  v8 = v6;
  v9 = v7;
  v10 = 0;
LABEL_16:
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, v10);

}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_24DB37648;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id WeakRetained;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "_securityModeFromTitle:", *(_QWORD *)(a1 + 32));
  v4 = v3;
  v5 = 2;
  if (v3 == 10)
    v5 = 1;
  if (!v3)
    v5 = 0;
  if ((unint64_t)(v3 - 4) >= 2)
    v6 = v5;
  else
    v6 = 1;
  objc_msgSend(WeakRetained, "setFirstResponderCell:", v6);
  objc_msgSend(WeakRetained, "setSecurityMode:", v4);
  objc_msgSend(WeakRetained, "_updateJoinable");
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1280), "selectedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_selectedPrivateModeForString:", v8);

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "setPrivateAddressMode:", v9);

}

void __66__WFOtherNetworkViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_profileModeFromTitle:", a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setProfileMode:", v3);
  objc_msgSend(WeakRetained, "_updateJoinable");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  uint64_t v22;
  double v23;
  uint64_t v24;
  NSString *networkName;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  int64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  double v96;
  void *v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  switch(v11)
  {
    case 0:
      -[WFOtherNetworkViewController nameCell](self, "nameCell");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkNameTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "label");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v16);

        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkNamePlaceholder"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "textField");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPlaceholder:", v18);

        objc_msgSend(v15, "textField");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDelegate:", self);

        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "userInterfaceIdiom");

        v23 = 15.0;
        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          v23 = 20.0;
        objc_msgSend(v15, "setLayoutMargins:", 0.0, v23, 0.0, 0.0);
        v24 = MEMORY[0x24BDAC760];
        v109[0] = MEMORY[0x24BDAC760];
        v109[1] = 3221225472;
        v109[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v109[3] = &unk_24DB37BD8;
        objc_copyWeak(&v110, &location);
        objc_msgSend(v15, "setReturnKeyHandler:", v109);
        networkName = self->_networkName;
        objc_msgSend(v15, "textField");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setText:", networkName);

        v107[0] = v24;
        v107[1] = 3221225472;
        v107[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v107[3] = &unk_24DB37328;
        objc_copyWeak(&v108, &location);
        objc_msgSend(v15, "setTextChangeHandler:", v107);
        -[WFOtherNetworkViewController setNameCell:](self, "setNameCell:", v15);
        if (!self->_mostRecentFirstResponder)
          self->_mostRecentFirstResponder = (WFTextFieldCell *)-[WFOtherNetworkViewController nameCell](self, "nameCell");
        objc_destroyWeak(&v108);
        objc_destroyWeak(&v110);

        objc_destroyWeak(&location);
      }
      v27 = -[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType");
      -[WFOtherNetworkViewController nameCell](self, "nameCell");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textField");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setReturnKeyType:", v27);

      -[WFOtherNetworkViewController nameCell](self, "nameCell");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 1:
      -[WFOtherNetworkViewController securityRows](self, "securityRows");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v7, "row"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "integerValue");

      switch(v33)
      {
        case 0:
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFOtherNetworkCellGenericIdentifier"));
          objc_msgSend(v30, "setPreservesSuperviewLayoutMargins:", 0);
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "userInterfaceIdiom");

          v36 = 15.0;
          if ((v35 & 0xFFFFFFFFFFFFFFFBLL) != 1)
            v36 = 20.0;
          objc_msgSend(v30, "setLayoutMargins:", 0.0, v36, 0.0, 0.0);
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkSecurityTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "textLabel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setText:", v37);

          -[WFOtherNetworkViewController _securityStringFromType:](self, "_securityStringFromType:", self->_securityMode);
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        case 1:
          -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54)
          {
            objc_initWeak(&location, self);
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndex:", 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkUsernameTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "label");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setText:", v58);

            v60 = -[WFOtherNetworkViewController style](self, "style");
            objc_msgSend(v57, "textField");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setReturnKeyType:", 4 * (v60 != 0));

            objc_msgSend(v57, "textField");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setDelegate:", self);

            objc_msgSend(v57, "textField");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setTextContentType:", *MEMORY[0x24BEBE848]);

            objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "userInterfaceIdiom");

            v66 = 15.0;
            if ((v65 & 0xFFFFFFFFFFFFFFFBLL) != 1)
              v66 = 20.0;
            objc_msgSend(v57, "setLayoutMargins:", 0.0, v66, 0.0, 0.0);
            v67 = MEMORY[0x24BDAC760];
            v105[0] = MEMORY[0x24BDAC760];
            v105[1] = 3221225472;
            v105[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
            v105[3] = &unk_24DB37328;
            objc_copyWeak(&v106, &location);
            objc_msgSend(v57, "setTextChangeHandler:", v105);
            v103[0] = v67;
            v103[1] = 3221225472;
            v103[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
            v103[3] = &unk_24DB37BD8;
            objc_copyWeak(&v104, &location);
            objc_msgSend(v57, "setReturnKeyHandler:", v103);
            -[WFOtherNetworkViewController setUsernameCell:](self, "setUsernameCell:", v57);
            -[WFOtherNetworkViewController username](self, "username");
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            if (v68)
            {
              -[WFOtherNetworkViewController username](self, "username");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "textField");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setText:", v69);

            }
            objc_destroyWeak(&v104);
            objc_destroyWeak(&v106);

            objc_destroyWeak(&location);
          }
          -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = -[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType");
          -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "textField");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setReturnKeyType:", v71);

          goto LABEL_19;
        case 2:
          objc_initWeak(&location, self);
          -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v73)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "objectAtIndex:", 0);
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkPasswordTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "label");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setText:", v77);

            objc_msgSend(v76, "textField");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setSecureTextEntry:", 1);

            objc_msgSend(v76, "textField");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setDelegate:", self);

            objc_msgSend(v76, "textField");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setTextContentType:", *MEMORY[0x24BEBE810]);

            objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "userInterfaceIdiom");

            v84 = 15.0;
            if ((v83 & 0xFFFFFFFFFFFFFFFBLL) != 1)
              v84 = 20.0;
            objc_msgSend(v76, "setLayoutMargins:", 0.0, v84, 0.0, 0.0);
            v85 = MEMORY[0x24BDAC760];
            v101[0] = MEMORY[0x24BDAC760];
            v101[1] = 3221225472;
            v101[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_5;
            v101[3] = &unk_24DB37328;
            objc_copyWeak(&v102, &location);
            objc_msgSend(v76, "setTextChangeHandler:", v101);
            v99[0] = v85;
            v99[1] = 3221225472;
            v99[2] = __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_6;
            v99[3] = &unk_24DB37BD8;
            objc_copyWeak(&v100, &location);
            objc_msgSend(v76, "setReturnKeyHandler:", v99);
            -[WFOtherNetworkViewController setPasswordCell:](self, "setPasswordCell:", v76);
            objc_destroyWeak(&v100);
            objc_destroyWeak(&v102);

          }
          -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = -[WFOtherNetworkViewController _returnKeyType](self, "_returnKeyType");
          -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "textField");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setReturnKeyType:", v86);

          objc_destroyWeak(&location);
          break;
        case 3:
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFOtherNetworkCellGenericIdentifier"));
          objc_msgSend(v30, "setPreservesSuperviewLayoutMargins:", 0);
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "userInterfaceIdiom");

          v91 = 15.0;
          if ((v90 & 0xFFFFFFFFFFFFFFFBLL) != 1)
            v91 = 20.0;
          objc_msgSend(v30, "setLayoutMargins:", 0.0, v91, 0.0, 0.0);
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkIdentityTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "textLabel");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setText:", v92);

          -[WFOtherNetworkViewController _TLSIdentityDescription](self, "_TLSIdentityDescription");
          v45 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 4:
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFOtherNetworkCellGenericIdentifier"));
          objc_msgSend(v30, "setPreservesSuperviewLayoutMargins:", 0);
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "userInterfaceIdiom");

          v96 = 15.0;
          if ((v95 & 0xFFFFFFFFFFFFFFFBLL) != 1)
            v96 = 20.0;
          objc_msgSend(v30, "setLayoutMargins:", 0.0, v96, 0.0, 0.0);
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkRootCertWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "textLabel");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setText:", v97);

          -[WFOtherNetworkViewController _WAPIRootCertificateDescription](self, "_WAPIRootCertificateDescription");
          v45 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 5:
          goto LABEL_13;
        default:
          goto LABEL_20;
      }
      goto LABEL_28;
    case 2:
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, 0);
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkModeTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setText:", v48);

      if (-[WFOtherNetworkViewController profileMode](self, "profileMode"))
      {
        if (-[WFOtherNetworkViewController profileMode](self, "profileMode") != 1)
        {
LABEL_27:
          objc_msgSend(v30, "setAccessoryType:", 1);
          goto LABEL_28;
        }
        v50 = CFSTR("kWFLocOtherNetworkModeValueEAPTLS");
      }
      else
      {
        v50 = CFSTR("kWFLocOtherNetworkModeValueAuto");
      }
      objc_msgSend(v8, "localizedStringForKey:value:table:", v50, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v39 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v51 = (void *)v39;
      objc_msgSend(v30, "detailTextLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setText:", v51);

      goto LABEL_27;
    case 3:
LABEL_13:
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFOtherNetworkCellGenericIdentifier"));
      objc_msgSend(v30, "setPreservesSuperviewLayoutMargins:", 0);
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "userInterfaceIdiom");

      v42 = 15.0;
      if ((v41 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        v42 = 20.0;
      objc_msgSend(v30, "setLayoutMargins:", 0.0, v42, 0.0, 0.0);
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkIdentityWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setText:", v43);

      -[WFOtherNetworkViewController _WAPIIdentityDescription](self, "_WAPIIdentityDescription");
      v45 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v46 = (void *)v45;
      if (v45)
      {
        objc_msgSend(v30, "detailTextLabel");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setText:", v46);

      }
      objc_msgSend(v30, "setAccessoryType:", 1);
LABEL_19:

      goto LABEL_28;
    default:
LABEL_20:
      v30 = 0;
LABEL_28:

      return v30;
  }
}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setNetworkName:", v3);

}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setUsername:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_updateJoinable");

}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setPassword:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_updateJoinable");

}

void __64__WFOtherNetworkViewController_tableView_cellForRowAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  int64_t v7;
  id v8;
  int64_t v9;
  void *v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  if (-[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell") != -1)
  {
    -[WFOtherNetworkViewController nameCell](self, "nameCell");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v15)
    {
      v7 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

      if (!v7)
      {
        -[WFOtherNetworkViewController nameCell](self, "nameCell");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {

    }
    -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v15)
    {
      v9 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

      if (v9 == 1)
      {
        -[WFOtherNetworkViewController usernameCell](self, "usernameCell");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {

    }
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v15)
    {

      goto LABEL_15;
    }
    v12 = -[WFOtherNetworkViewController firstResponderCell](self, "firstResponderCell");

    if (v12 != 2)
      goto LABEL_15;
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = v10;
    objc_msgSend(v10, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "becomeFirstResponder");

    -[WFOtherNetworkViewController setFirstResponderCell:](self, "setFirstResponderCell:", -1);
  }
LABEL_15:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFOtherNetworkViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t result;
  void *v10;
  int64_t v11;

  -[WFOtherNetworkViewController sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  switch(v8)
  {
    case 0:
    case 2:
    case 3:
      result = 1;
      break;
    case 1:
      -[WFOtherNetworkViewController securityRows](self, "securityRows");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      result = v11;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_availableProfileModes
{
  return &unk_24DB59EA8;
}

- (id)_availableProfileModeTitles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFOtherNetworkViewController _availableProfileModes](self, "_availableProfileModes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[WFOtherNetworkViewController _profileModeStringFromType:](self, "_profileModeStringFromType:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_profileModeFromTitle:(id)a3
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkModeValueAuto"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkModeValueEAPTLS"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if (v10)
      v7 = 1;
    else
      v7 = -1;
  }

  return v7;
}

- (id)_profileModeStringFromType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    if (a3 != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("kWFLocOtherNetworkModeValueEAPTLS");
  }
  else
  {
    v6 = CFSTR("kWFLocOtherNetworkModeValueAuto");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (id)_availableSecurityModes
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = -[WFOtherNetworkViewController WPA3PersonalEnabled](self, "WPA3PersonalEnabled");
  v4 = (void *)objc_msgSend(&unk_24DB59EC0, "mutableCopy");
  v5 = v4;
  if (v3)
    v6 = &unk_24DB59ED8;
  else
    v6 = &unk_24DB59EF0;
  objc_msgSend(v4, "addObjectsFromArray:", v6);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "addObjectsFromArray:", &unk_24DB59F08);
  v8 = v7;

  if (-[WFOtherNetworkViewController WPA3EnterpriseEnabled](self, "WPA3EnterpriseEnabled")
    || (v9 = v8, -[WFOtherNetworkViewController WPA2EnterpriseEnabledMFPCapable](self, "WPA2EnterpriseEnabledMFPCapable")))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "addObjectsFromArray:", &unk_24DB59F20);

  }
  if (-[WFOtherNetworkViewController WAPIEnabled](self, "WAPIEnabled"))
  {
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v10, "addObjectsFromArray:", &unk_24DB59F38);

    v9 = v10;
  }

  return v9;
}

- (id)_availableSecurityTitles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFOtherNetworkViewController _availableSecurityModes](self, "_availableSecurityModes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[WFOtherNetworkViewController _securityStringFromType:](self, "_securityStringFromType:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_securityModeFromTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityNoneTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWEPTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPATitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPA2Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v3, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          v7 = 3;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPAEnterpriseTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v3, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {
            v7 = 4;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPA2EnterpriseTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v3, "isEqualToString:", v21);

            if ((v22 & 1) != 0)
            {
              v7 = 5;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v3, "isEqualToString:", v24);

              if ((v25 & 1) != 0)
              {
                v7 = 6;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWAPIEnterpriseTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v3, "isEqualToString:", v27);

                if ((v28 & 1) != 0)
                {
                  v7 = 7;
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPA3Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v3, "isEqualToString:", v30);

                  if ((v31 & 1) != 0)
                  {
                    v7 = 8;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPA2WPA3Title"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v3, "isEqualToString:", v33);

                    if ((v34 & 1) != 0)
                    {
                      v7 = 9;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("kWFLocSecurityWPA3EnterpriseTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = objc_msgSend(v3, "isEqualToString:", v36);

                      if (v37)
                        v7 = 10;
                      else
                        v7 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)_securityStringFromType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 0xA)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", off_24DB37BF8[a3], &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
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

- (BOOL)_canShowModes
{
  void *v2;
  BOOL v3;

  -[WFOtherNetworkViewController TLSIdentities](self, "TLSIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_TLSIdentityDescription
{
  return WFDescriptionFromIdentity(-[WFOtherNetworkViewController TLSIdentity](self, "TLSIdentity"));
}

- (id)_WAPIIdentityDescription
{
  void *v2;
  void *v3;

  -[WFOtherNetworkViewController WAPIIdentity](self, "WAPIIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFDescriptionFromIdentity(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_WAPIRootCertificateDescription
{
  void *v2;
  void *v3;

  -[WFOtherNetworkViewController WAPIRootCertificate](self, "WAPIRootCertificate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFDescriptionFromIdentity(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_returnKeyType
{
  _BOOL4 v3;
  int64_t v4;
  WFTextFieldCell *mostRecentFirstResponder;
  WFTextFieldCell *v6;
  BOOL v7;

  v3 = -[WFOtherNetworkViewController securityMode](self, "securityMode") != 4
    && -[WFOtherNetworkViewController securityMode](self, "securityMode") != 5
    && -[WFOtherNetworkViewController securityMode](self, "securityMode") != 10;
  if (-[WFOtherNetworkViewController style](self, "style") && -[WFOtherNetworkViewController style](self, "style") != 3)
  {
    v4 = 4;
    if (v3)
      return v4;
    goto LABEL_11;
  }
  if (v3)
    v4 = 3;
  else
    v4 = 4;
  if (!v3)
  {
LABEL_11:
    mostRecentFirstResponder = self->_mostRecentFirstResponder;
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();
    v7 = mostRecentFirstResponder == v6;

    if (v7)
      return 3;
  }
  return v4;
}

- (void)setPasswordRequired:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_passwordRequired != a3)
  {
    v3 = a3;
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v7 = 136315394;
      v8 = "-[WFOtherNetworkViewController setPasswordRequired:]";
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: passwordRequired %d", (uint8_t *)&v7, 0x12u);
    }

    self->_passwordRequired = v3;
    -[WFOtherNetworkViewController _updateSections](self, "_updateSections");
    -[WFOtherNetworkViewController _updateJoinable](self, "_updateJoinable");
  }
}

- (void)setActivityString:(id)a3
{
  NSString *defaultActivityString;
  id v6;
  id v7;

  self->_activityString = (NSString *)a3;
  if (a3)
  {
    defaultActivityString = (NSString *)a3;
  }
  else
  {
    defaultActivityString = self->_defaultActivityString;
    v6 = 0;
  }
  -[WFOtherNetworkViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrompt:", defaultActivityString);

}

- (void)resetFirstResponder
{
  void *v3;
  id v4;

  -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFOtherNetworkViewController passwordCell](self, "passwordCell");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
  else
  {
    -[WFOtherNetworkViewController setFirstResponderCell:](self, "setFirstResponderCell:", 2);
  }
}

- (BOOL)wantsModalPresentation
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)activityString
{
  return self->_activityString;
}

- (BOOL)joining
{
  return self->_joining;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (WFOtherNetworkViewControllerDelegate)delegate
{
  return (WFOtherNetworkViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (int64_t)profileMode
{
  return self->_profileMode;
}

- (BOOL)WAPIEnabled
{
  return self->_WAPIEnabled;
}

- (void)setWAPIEnabled:(BOOL)a3
{
  self->_WAPIEnabled = a3;
}

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
}

- (NSArray)TLSIdentities
{
  return self->_TLSIdentities;
}

- (NSArray)WAPIRootCertificates
{
  return self->_WAPIRootCertificates;
}

- (void)setWAPIRootCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_WAPIRootCertificates, a3);
}

- (id)WAPIRootCertificate
{
  return self->_WAPIRootCertificate;
}

- (NSArray)WAPIIdentities
{
  return self->_WAPIIdentities;
}

- (void)setWAPIIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_WAPIIdentities, a3);
}

- (id)WAPIIdentity
{
  return self->_WAPIIdentity;
}

- (BOOL)supportsWiFiPasswordSharing
{
  return self->_supportsWiFiPasswordSharing;
}

- (void)setSupportsWiFiPasswordSharing:(BOOL)a3
{
  self->_supportsWiFiPasswordSharing = a3;
}

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (BOOL)WPA3PersonalEnabled
{
  return self->_WPA3PersonalEnabled;
}

- (void)setWPA3PersonalEnabled:(BOOL)a3
{
  self->_WPA3PersonalEnabled = a3;
}

- (BOOL)WPA3EnterpriseEnabled
{
  return self->_WPA3EnterpriseEnabled;
}

- (void)setWPA3EnterpriseEnabled:(BOOL)a3
{
  self->_WPA3EnterpriseEnabled = a3;
}

- (BOOL)WPA2EnterpriseEnabledMFPCapable
{
  return self->_WPA2EnterpriseEnabledMFPCapable;
}

- (void)setWPA2EnterpriseEnabledMFPCapable:(BOOL)a3
{
  self->_WPA2EnterpriseEnabledMFPCapable = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)joinable
{
  return self->_joinable;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSOrderedSet)securityRows
{
  return self->_securityRows;
}

- (void)setSecurityRows:(id)a3
{
  objc_storeStrong((id *)&self->_securityRows, a3);
}

- (WFTextFieldCell)nameCell
{
  return self->_nameCell;
}

- (void)setNameCell:(id)a3
{
  objc_storeStrong((id *)&self->_nameCell, a3);
}

- (WFTextFieldCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
  objc_storeStrong((id *)&self->_usernameCell, a3);
}

- (WFTextFieldCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)firstResponderCell
{
  return self->_firstResponderCell;
}

- (void)setFirstResponderCell:(int64_t)a3
{
  self->_firstResponderCell = a3;
}

- (WFTextFieldCell)mostRecentFirstResponder
{
  return self->_mostRecentFirstResponder;
}

- (void)setMostRecentFirstResponder:(id)a3
{
  self->_mostRecentFirstResponder = (WFTextFieldCell *)a3;
}

- (NSString)defaultActivityString
{
  return self->_defaultActivityString;
}

- (void)setDefaultActivityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (BOOL)overrideDefaultSecurity
{
  return self->_overrideDefaultSecurity;
}

- (void)setOverrideDefaultSecurity:(BOOL)a3
{
  self->_overrideDefaultSecurity = a3;
}

- (WFCredentialsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (WFValueListViewController)securityTitlesValueVC
{
  return self->_securityTitlesValueVC;
}

- (void)setSecurityTitlesValueVC:(id)a3
{
  objc_storeStrong((id *)&self->_securityTitlesValueVC, a3);
}

- (WFValueListViewController)profileModeTitlesValueVC
{
  return self->_profileModeTitlesValueVC;
}

- (void)setProfileModeTitlesValueVC:(id)a3
{
  objc_storeStrong((id *)&self->_profileModeTitlesValueVC, a3);
}

- (WFValueListViewController)privateAddressModeTitlesValueVC
{
  return self->_privateAddressModeTitlesValueVC;
}

- (void)setPrivateAddressModeTitlesValueVC:(id)a3
{
  objc_storeStrong((id *)&self->_privateAddressModeTitlesValueVC, a3);
}

- (BOOL)shouldCancelContextWhenViewDisappear
{
  return self->_shouldCancelContextWhenViewDisappear;
}

- (void)setShouldCancelContextWhenViewDisappear:(BOOL)a3
{
  self->_shouldCancelContextWhenViewDisappear = a3;
}

- (BOOL)isUsingRandomAddress
{
  return self->_isUsingRandomAddress;
}

- (void)setIsUsingRandomAddress:(BOOL)a3
{
  self->_isUsingRandomAddress = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_privateAddressModeTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_profileModeTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_securityTitlesValueVC, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultActivityString, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_nameCell, 0);
  objc_storeStrong((id *)&self->_securityRows, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_WAPIIdentities, 0);
  objc_storeStrong((id *)&self->_WAPIRootCertificates, 0);
  objc_storeStrong((id *)&self->_TLSIdentities, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->SSID, 0);
}

@end
