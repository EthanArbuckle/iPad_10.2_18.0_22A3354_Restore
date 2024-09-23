@implementation STCommunicationLimitsScreenTimeDetailListController

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
  objc_super v11;
  uint8_t buf[16];

  -[STCommunicationLimitsScreenTimeDetailListController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x24DB91230);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentPrivacyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationLimits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[STCommunicationLimitsScreenTimeDetailListController setCommunicationLimits:](self, "setCommunicationLimits:", v8);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeTitle"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsScreenTimeDetailListController setTitle:](self, "setTitle:", v10);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsScreenTimeDetailListController.viewDidLoad", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  -[STCommunicationLimitsScreenTimeDetailListController viewDidLoad](&v11, sel_viewDidLoad);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint8_t buf[16];

  v3 = a3;
  -[STCommunicationLimitsScreenTimeDetailListController _didFinishEditingCommunicationLimit](self, "_didFinishEditingCommunicationLimit");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsScreenTimeDetailListController.viewWillDisappear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  -[STCommunicationLimitsScreenTimeDetailListController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)willResignActive
{
  objc_super v3;

  -[STCommunicationLimitsScreenTimeDetailListController _didFinishEditingCommunicationLimit](self, "_didFinishEditingCommunicationLimit");
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  -[STCommunicationLimitsScreenTimeDetailListController willResignActive](&v3, sel_willResignActive);
}

- (void)_didFinishEditingCommunicationLimit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  -[STCommunicationLimitsScreenTimeDetailListController specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB91230);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[STCommunicationLimitsScreenTimeDetailListController communicationLimits](self, "communicationLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsScreenTimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCommunicationLimitsScreenTimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v10 = 2;
  }
  else
  {
    -[STCommunicationLimitsScreenTimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 == v9;

  }
  objc_msgSend(v5, "setScreenTimeCommunicationLimit:", v10);
  v11 = objc_msgSend(v5, "screenTimeCommunicationLimit");
  objc_msgSend(v25, "contentPrivacyCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "communicationLimits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "screenTimeCommunicationLimit");

  if (v11 != v15)
  {
    v16 = objc_msgSend(v5, "downtimeCommunicationLimit");
    v17 = objc_msgSend(v5, "screenTimeCommunicationLimit");
    v18 = v25;
    switch(v17)
    {
      case 0:
        if (v16)
          objc_msgSend(v5, "setDowntimeCommunicationLimit:", 0);
        v19 = v5;
        v20 = 1;
        goto LABEL_16;
      case 1:
        if (v16 == 1)
          goto LABEL_15;
        v21 = v5;
        v22 = 1;
        break;
      case 2:
        if (v16 == 2)
          goto LABEL_15;
        v21 = v5;
        v22 = 2;
        break;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCommunicationLimitsScreenTimeDetailListController.m"), 97, CFSTR("Unexpected general communication policy whitelisted contacts"));

        goto LABEL_17;
      default:
        goto LABEL_18;
    }
    objc_msgSend(v21, "setDowntimeCommunicationLimit:", v22);
LABEL_15:
    v19 = v5;
    v20 = 0;
LABEL_16:
    objc_msgSend(v19, "setContactsEditable:", v20);
LABEL_17:
    v18 = v25;
LABEL_18:
    objc_msgSend(v18, "contentPrivacyCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "saveCommunicationLimits:completionHandler:", v5, 0);

  }
}

+ (void)showCompatibilityAlertIfNeededWithCoordinator:(id)a3 presentingViewController:(id)a4 okHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "shouldShowCompatibilityAlerts")
    && !+[STCommunicationLimits hasShownCompatibilityAlertForDSID:](STCommunicationLimits, "hasShownCompatibilityAlertForDSID:", v12))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isRemoteUser"))
    {
      objc_msgSend(v10, "givenName");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitleFormat"), &stru_24DB8A1D0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v24, v15, v14);
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsChildCompatibilityAlertMessageFormat"), &stru_24DB8A1D0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v16, v15, v14);

        v18 = v25;
LABEL_9:
        v26 = (void *)v18;

        objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v18, v17, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v22, 0, v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addAction:", v23);
        objc_msgSend(v21, "setPreferredAction:", v23);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __136__STCommunicationLimitsScreenTimeDetailListController_showCompatibilityAlertIfNeededWithCoordinator_presentingViewController_okHandler___block_invoke;
        v27[3] = &unk_24DB86440;
        v28 = v12;
        objc_msgSend(v7, "presentViewController:animated:completion:", v21, 1, v27);

        goto LABEL_10;
      }
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitle"), &stru_24DB8A1D0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("CommunicationLimitsChildCompatibilityAlertMessage");
      v19 = v13;
    }
    else
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UpdateOtherDevicesAlertTitle"), &stru_24DB8A1D0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CommunicationLimitsCompatibilityAlertMessage"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = v13;
      v20 = v14;
    }
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24DB8A1D0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __136__STCommunicationLimitsScreenTimeDetailListController_showCompatibilityAlertIfNeededWithCoordinator_presentingViewController_okHandler___block_invoke(uint64_t a1)
{
  return +[STCommunicationLimits setHasShownCompatibilityAlert:forDSID:](STCommunicationLimits, "setHasShownCompatibilityAlert:forDSID:", 1, *(_QWORD *)(a1 + 32));
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v44 = (int)*MEMORY[0x24BE756E0];
    v4 = (void *)objc_opt_new();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsScreenTimeDetailListController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB91230);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v7;
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    if (objc_msgSend(v10, "isRemoteUser"))
    {
      objc_msgSend(v10, "givenName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsRemoteHeaderText"), &stru_24DB8A1D0, 0);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)v14;
      }
      else
      {
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsRemoteGenericHeaderText"), &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsLocalHeaderText"), &stru_24DB8A1D0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v42 = v10;
    v41 = *MEMORY[0x24BE75A68];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15);

    objc_msgSend(v4, "addObject:", v5);
    v16 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowedCommunicationSectionTitle"), &stru_24DB8A1D0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "groupSpecifierWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    -[STCommunicationLimitsScreenTimeDetailListController setAllowedCommunicationGroupSpecifier:](self, "setAllowedCommunicationGroupSpecifier:", v18);
    objc_msgSend(v4, "addObject:", v18);
    v19 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowContactsOnlySpecifierName"), &stru_24DB8A1D0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 3, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *MEMORY[0x24BE75A18];
    v23 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    -[STCommunicationLimitsScreenTimeDetailListController setAllowContactsOnlySpecifier:](self, "setAllowContactsOnlySpecifier:", v21);
    objc_msgSend(v4, "addObject:", v21);
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowGroupsWithOneContactSpecifierName"), &stru_24DB8A1D0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE75868]);
    -[STCommunicationLimitsScreenTimeDetailListController setAllowGroupsWithOneContactSpecifier:](self, "setAllowGroupsWithOneContactSpecifier:", v24);
    objc_msgSend(v4, "addObject:", v24);
    v25 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowEveryoneSpecifierName"), &stru_24DB8A1D0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, 0, 0, 3, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v22);
    -[STCommunicationLimitsScreenTimeDetailListController setAllowEveryoneSpecifier:](self, "setAllowEveryoneSpecifier:", v27);
    objc_msgSend(v4, "addObject:", v27);
    -[STCommunicationLimitsScreenTimeDetailListController communicationLimits](self, "communicationLimits");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "screenTimeCommunicationLimit");

    v30 = (_QWORD *)MEMORY[0x24BE75C20];
    switch(v29)
    {
      case 0:
        v31 = *MEMORY[0x24BE75C20];
        v32 = v18;
        v33 = v27;
        goto LABEL_12;
      case 1:
        v31 = *MEMORY[0x24BE75C20];
        v32 = v18;
        v33 = v24;
        goto LABEL_12;
      case 2:
        v31 = *MEMORY[0x24BE75C20];
        v32 = v18;
        v33 = v21;
LABEL_12:
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v31);
        break;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCommunicationLimitsScreenTimeDetailListController.m"), 191, CFSTR("Unexpected general communication policy whitelisted contacts"));

        break;
      default:
        break;
    }
    objc_msgSend(v18, "objectForKeyedSubscript:", *v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsScreenTimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v36, v41);

    v37 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v44) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
  }
  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  v6 = a4;
  -[STCommunicationLimitsScreenTimeDetailListController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[STCommunicationLimitsScreenTimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier", v14.receiver, v14.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsScreenTimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsScreenTimeDetailListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v9 && v8 != v9)
  {
    -[STCommunicationLimitsScreenTimeDetailListController specifier](self, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", 0x24DB91230);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:", v12, self, 0);
  }
  -[STCommunicationLimitsScreenTimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A68]);

  -[STCommunicationLimitsScreenTimeDetailListController _updateAllowedCommunicationGroupFooterText](self, "_updateAllowedCommunicationGroupFooterText");
}

- (id)_allowedCommunicationGroupFooterText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v21;

  v4 = a3;
  -[STCommunicationLimitsScreenTimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeEveryoneFooterText"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STCommunicationLimitsScreenTimeDetailListController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB91230);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isRemoteUser"))
    {
      objc_msgSend(v9, "givenName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsScreenTimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v10)
      {
        if (v11 == v4)
        {
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeContactsOnlyRemoteFooterText"), &stru_24DB8A1D0, 0);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v14, v10, v21);
        }
        else
        {
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeGroupsWithOneContactRemoteFooterText"), &stru_24DB8A1D0, 0);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v14, v10, v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)v14;
      }
      else
      {
        if (v11 == v4)
          v19 = CFSTR("DuringScreenTimeContactsOnlyRemoteGenericFooterText");
        else
          v19 = CFSTR("DuringScreenTimeGroupsWithOneContactRemoteGenericFooterText");
        objc_msgSend(v12, "localizedStringForKey:value:table:", v19, &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[STCommunicationLimitsScreenTimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;
      if (v16 == v4)
        v18 = CFSTR("DuringScreenTimeContactsOnlyLocalFooterText");
      else
        v18 = CFSTR("DuringScreenTimeGroupsWithOneContactLocalFooterText");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24DB8A1D0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v15;
}

- (void)_updateAllowedCommunicationGroupFooterText
{
  id v3;

  -[STCommunicationLimitsScreenTimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsScreenTimeDetailListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v3, 1);

}

- (PSSpecifier)allowedCommunicationGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setAllowedCommunicationGroupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (PSSpecifier)allowEveryoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setAllowEveryoneSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (PSSpecifier)allowContactsOnlySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setAllowContactsOnlySpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (PSSpecifier)allowGroupsWithOneContactSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAllowGroupsWithOneContactSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setCommunicationLimits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowGroupsWithOneContactSpecifier, 0);
  objc_storeStrong((id *)&self->_allowContactsOnlySpecifier, 0);
  objc_storeStrong((id *)&self->_allowEveryoneSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedCommunicationGroupSpecifier, 0);
}

@end
