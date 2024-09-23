@implementation WFNetworkSettingsCellFactory

- (WFNetworkSettingsCellFactory)initWithTableView:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_tableView, a3);
    -[WFNetworkSettingsCellFactory _registerCells](self, "_registerCells");
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)_registerCells
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDF6C08];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UITableView registerNib:forCellReuseIdentifier:](self->_tableView, "registerNib:forCellReuseIdentifier:", v11, CFSTR("kWFTextFieldCellIdentifier"));
  v5 = (void *)MEMORY[0x24BDF6C08];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nibWithNibName:bundle:", CFSTR("WFRecommendationCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableView registerNib:forCellReuseIdentifier:](self->_tableView, "registerNib:forCellReuseIdentifier:", v7, CFSTR("WFRecommendationCell"));
  v8 = (void *)MEMORY[0x24BDF6C08];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nibWithNibName:bundle:", CFSTR("WFSegmentedCell"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableView registerNib:forCellReuseIdentifier:](self->_tableView, "registerNib:forCellReuseIdentifier:", v10, CFSTR("WFSegmentedCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFJoinCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFForgetCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFManageCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFDNSCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFPriorityCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFAutoJoinCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFAutoLoginCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWiFiSaveDataModeCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFPrivacyProxyEnabledCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFPrivateAddressModeCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFRandomMACInfoCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFOutrankCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFCredentialsCellIdentifier"));

}

- (id)segmentedCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFSegmentedCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recommendationCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFRecommendationCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)joinCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFJoinCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingJoinNetworkTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  return v6;
}

- (id)forgetCellAtIndexPath:(id)a3 accessory:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFForgetCell"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = CFSTR("kWFLocSettingForgetNetworkTitle");
  if (v4)
    v12 = CFSTR("kWFLocSettingForgetDeviceTitle");
  else
    v12 = CFSTR("kWFLocSettingForgetNetworkTitle");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v12, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB3D90], "forgetDeviceButtonTitle");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v11, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  if (v4)
  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  return v8;
}

- (id)outrankedCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFOutrankCell"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    v11 = CFSTR("kWFLocSettingOutrankTitle_CH");
  else
    v11 = CFSTR("kWFLocSettingOutrankTitle");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  return v8;
}

- (id)manageCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFManageCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingManageNetworkTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  return v6;
}

- (id)priorityCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFPriorityCell"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingAutoJoinPriorityNetworkTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setAccessoryType:", 1);
  return v3;
}

- (id)autoJoinCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFAutoJoinCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingAutoJoinNetworkTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "setSelectionStyle:", 0);
  return v6;
}

- (id)autoLoginCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFAutoLoginCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingAutoLoginNetworkTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "setSelectionStyle:", 0);
  return v6;
}

- (id)saveDataModeCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWiFiSaveDataModeCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingSaveDataModeTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "setSelectionStyle:", 0);
  return v6;
}

- (id)privacyProxyEnabledCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFPrivacyProxyEnabledCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingPrivacyProxyEnabledTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v6, "setSelectionStyle:", 0);
  return v6;
}

- (id)networkQualityCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWiFiNetworkQualityCellIdentifier"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityText"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  return v3;
}

- (id)credentialsViewerCellAtIndexPath:(id)a3 credentails:(id)a4 hideCredentials:(BOOL)a5 isPassword:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFCredentialsCellIdentifier"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "contentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6)
    v17 = CFSTR("kWFLocSettingPasswordViewerTitle");
  else
    v17 = CFSTR("kWFLocSettingUsernameViewerTitle");
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v18);

  objc_msgSend(v13, "setContentConfiguration:", v14);
  objc_msgSend(v13, "setCredentials:", v10);

  objc_msgSend(v13, "setHideSecureText:", v7);
  return v13;
}

- (id)wifiModeCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFWiFiModeCellIdentifier"));
  objc_msgSend(v3, "defaultContentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentConfiguration:", v4);

  return v3;
}

- (id)randomMACCellAtIndexPath:(id)a3 chinaDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "row") == 1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFRandomMACInfoCellIdentifier"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      v9 = CFSTR("KWFLocSettingRandomMACInfoChinaTitle");
    else
      v9 = CFSTR("KWFLocSettingRandomMACInfoTitle");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(v6, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "altTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

  }
  else if (objc_msgSend(v5, "row"))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFPrivateAddressModeCellIdentifier"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v4)
      v16 = CFSTR("KWFLocSettingRandomMACSwitchChinaTitle");
    else
      v16 = CFSTR("KWFLocSettingRandomMACSwitchTitle");
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    objc_msgSend(v6, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "altTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

    objc_msgSend(v6, "setAccessoryType:", 1);
  }

  return v6;
}

- (id)ipv4AddressConfigCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPConfigureTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setSelectionStyle:", 1);
  return v3;
}

- (id)ipv4AddressCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4AddressCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  return v3;
}

- (id)ipv4SubnetMaskCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsSubnetMaskCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)ipv4RouterCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4RouterCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)dhcpClientIDCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsClientIDCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)renewLeaseCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFForgetCell"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsRenewLeaseCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  return v6;
}

- (id)ipv6AddressConfigCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPConfigureTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setSelectionStyle:", 1);
  return v3;
}

- (id)ipv6AddressCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6AddressCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)ipv6RouterCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6RouterCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)dnsConfigureCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFDNSCellIdentifier"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSConfigureButton"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setSelectionStyle:", 1);
  return v3;
}

- (id)httpProxyConfigCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyConfigureButton"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setSelectionStyle:", 1);
  return v3;
}

- (id)dnsSearchDomainsCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsSearchDomainsCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)dnsServerAddressesCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)ipv4AddressTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4AddressCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)ipv4SubnetMaskTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsSubnetMaskCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)ipv4RouterTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4RouterCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)dhcpClientIDTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsClientIDCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  return v6;
}

- (id)httpProxyURLTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyURLCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(v6, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyboardType:", 3);

  return v6;
}

- (id)httpProxyServerTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyServerCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(v6, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyboardType:", 3);

  return v6;
}

- (id)httpProxyPortTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyPortCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(v6, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyboardType:", 4);

  return v6;
}

- (id)httpProxyUserTextCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyUsernameCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(v6, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextContentType:", *MEMORY[0x24BDF7F40]);

  return v6;
}

- (id)httpProxyPasswordTextCellAtIndexPath:(id)a3
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

  v4 = a3;
  -[WFNetworkSettingsCellFactory tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyPasswordCell"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v6, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(v6, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextContentType:", *MEMORY[0x24BDF7EE0]);

  objc_msgSend(v6, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecureTextEntry:", 1);

  return v6;
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTableView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
