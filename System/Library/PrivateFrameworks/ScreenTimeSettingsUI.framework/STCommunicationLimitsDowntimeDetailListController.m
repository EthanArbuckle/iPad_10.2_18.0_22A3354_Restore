@implementation STCommunicationLimitsDowntimeDetailListController

- (void)viewDidLoad
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219AB4000, log, OS_LOG_TYPE_FAULT, "altDSID is nil. Getting altDSID from iCloud account or FamilyCircle did not succeed.", v1, 2u);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint8_t buf[16];

  v3 = a3;
  -[STCommunicationLimitsDowntimeDetailListController _selectLeastRestrictiveOptionIfNecessary](self, "_selectLeastRestrictiveOptionIfNecessary");
  -[STCommunicationLimitsDowntimeDetailListController _didFinishEditingCommunicationLimit](self, "_didFinishEditingCommunicationLimit");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsDowntimeDetailListController.viewWillDisappear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  -[STCommunicationLimitsDowntimeDetailListController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)willResignActive
{
  objc_super v3;

  -[STCommunicationLimitsDowntimeDetailListController _selectLeastRestrictiveOptionIfNecessary](self, "_selectLeastRestrictiveOptionIfNecessary");
  -[STCommunicationLimitsDowntimeDetailListController _didFinishEditingCommunicationLimit](self, "_didFinishEditingCommunicationLimit");
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  -[STCommunicationLimitsDowntimeDetailListController willResignActive](&v3, sel_willResignActive);
}

- (void)_didFinishEditingCommunicationLimit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[STCommunicationLimitsDowntimeDetailListController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x24DB91230);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[STCommunicationLimitsDowntimeDetailListController communicationLimits](self, "communicationLimits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDowntimeCommunicationLimit:", -[STCommunicationLimitsDowntimeDetailListController _downtimeCommunicationLimitForSpecifier:](self, "_downtimeCommunicationLimitForSpecifier:", v6));
  objc_msgSend(v8, "contentPrivacyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveCommunicationLimits:completionHandler:", v4, 0);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v46 = (void *)objc_opt_new();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x24BE75000uLL;
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB91230);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "me");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v9;
    if (objc_msgSend(v11, "isRemoteUser"))
    {
      objc_msgSend(v11, "givenName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12)
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsRemoteHeaderText"), &stru_24DB8A1D0, 0);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v15, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)v15;
        v7 = 0x24BE75000;
      }
      else
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsRemoteGenericHeaderText"), &stru_24DB8A1D0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsLocalHeaderText"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v42 = *MEMORY[0x24BE75A68];
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v16);

    objc_msgSend(v46, "addObject:", v48);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowedCommunicationSectionTitle"), &stru_24DB8A1D0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v7 + 1424), "groupSpecifierWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    -[STCommunicationLimitsDowntimeDetailListController setAllowedCommunicationGroupSpecifier:](self, "setAllowedCommunicationGroupSpecifier:", v18);
    objc_msgSend(v46, "addObject:", v18);
    v45 = v6;
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowSpecificContactsSpecifierName"), &stru_24DB8A1D0, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v7 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE75A18];
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A18]);
    -[STCommunicationLimitsDowntimeDetailListController setAllowSpecificContactsSpecifier:](self, "setAllowSpecificContactsSpecifier:", v20);
    objc_msgSend(v46, "addObject:", v20);
    -[STCommunicationLimitsDowntimeDetailListController communicationLimits](self, "communicationLimits");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v47, "screenTimeCommunicationLimit"))
    {
      case 0:
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowEveryoneSpecifierName"), &stru_24DB8A1D0, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v7;
        v24 = (void *)v22;
        objc_msgSend(*(id *)(v23 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, 0, 0, 3, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v21);
        -[STCommunicationLimitsDowntimeDetailListController setAllowEveryoneSpecifier:](self, "setAllowEveryoneSpecifier:", v25);
        objc_msgSend(v46, "addObject:", v25);
        v26 = 0;
        v27 = 0;
        goto LABEL_16;
      case 1:
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowGroupsWithOneContactSpecifierName"), &stru_24DB8A1D0, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v7;
        v24 = (void *)v28;
        objc_msgSend(*(id *)(v29 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, 0, 0, 3, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75868]);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v19, v21);
        -[STCommunicationLimitsDowntimeDetailListController setAllowGroupsWithOneContactSpecifier:](self, "setAllowGroupsWithOneContactSpecifier:", v26);
        objc_msgSend(v46, "addObject:", v26);
        goto LABEL_14;
      case 2:
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("AllowContactsOnlySpecifierName"), &stru_24DB8A1D0, 0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v7;
        v24 = (void *)v30;
        objc_msgSend(*(id *)(v31 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, 0, 0, 0, 3, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v21);
        -[STCommunicationLimitsDowntimeDetailListController setAllowContactsOnlySpecifier:](self, "setAllowContactsOnlySpecifier:", v27);
        objc_msgSend(v46, "addObject:", v27);
        v26 = 0;
        goto LABEL_15;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCommunicationLimitsDowntimeDetailListController.m"), 166, CFSTR("Unexpected general communication policy whitelisted contacts"));
        v26 = 0;
LABEL_14:
        v27 = 0;
LABEL_15:
        v25 = 0;
LABEL_16:

        break;
      default:
        v26 = 0;
        v27 = 0;
        v25 = 0;
        break;
    }
    v43 = (void *)v17;
    switch(objc_msgSend(v47, "downtimeCommunicationLimit"))
    {
      case 0:
        v32 = *MEMORY[0x24BE75C20];
        if (!v25)
          goto LABEL_28;
        v33 = v18;
        v34 = v25;
        goto LABEL_25;
      case 1:
        v32 = *MEMORY[0x24BE75C20];
        if (!v26)
          goto LABEL_28;
        v33 = v18;
        v34 = v26;
        goto LABEL_25;
      case 2:
        v32 = *MEMORY[0x24BE75C20];
        if (!v27)
          goto LABEL_28;
        v33 = v18;
        v34 = v27;
LABEL_25:
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, v32);
        goto LABEL_26;
      case 3:
        v32 = *MEMORY[0x24BE75C20];
LABEL_28:
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v32);
        -[STCommunicationLimitsDowntimeDetailListController _allowedContactsSpecifiers](self, "_allowedContactsSpecifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)v46;
        objc_msgSend(v46, "addObjectsFromArray:", v36);

        goto LABEL_29;
      default:
        v32 = *MEMORY[0x24BE75C20];
LABEL_26:
        v35 = (objc_class *)v46;
LABEL_29:
        objc_msgSend(v18, "objectForKeyedSubscript:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[STCommunicationLimitsDowntimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, v42);

        v39 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v35;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        break;
    }
  }
  return v4;
}

- (id)_allowedContactsSpecifiers
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  STCommunicationLimitsDowntimeDetailListController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowedContactsGroupSpecifierName"), &stru_24DB8A1D0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self;
  -[STCommunicationLimitsDowntimeDetailListController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB91230);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v7;
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "me");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isRemoteUser") && objc_msgSend(v9, "hasPasscode"))
  {
    objc_msgSend(v9, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowedContactsGroupSpecifierRemoteFooterText"), &stru_24DB8A1D0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:locale:", v11, v13, v10);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A68]);

    }
    else
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowedContactsGroupSpecifierRemoteGenericFooterText"), &stru_24DB8A1D0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A68]);
    }

  }
  v34 = v9;
  v37 = v4;
  -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](v39, "whitelistedContactsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "familyMemberContactItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BE75DA0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75DA0]);

  -[STCommunicationLimitsDowntimeDetailListController setAllowedContactsGroupSpecifier:](v39, "setAllowedContactsGroupSpecifier:", v5);
  objc_msgSend(v3, "addObject:", v5);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v20 = *MEMORY[0x24BE75A18];
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        v24 = v3;
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x24BE755F0];
        objc_msgSend(v25, "label");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, v39, 0, sel__allowedContactDetailLabelText_, 0, 2, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v20);
        objc_msgSend(v25, "detailLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v18);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v25, "isUnreachable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("UnreachableContact"));

        v3 = v24;
        objc_msgSend(v24, "addObject:", v28);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v21);
  }

  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("AddContactsSpecifierName"), &stru_24DB8A1D0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, v39, 0, 0, 0, 13, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v20);
  -[STCommunicationLimitsDowntimeDetailListController setAddContactsSpecifier:](v39, "setAddContactsSpecifier:", v32);
  objc_msgSend(v3, "addObject:", v32);
  -[STCommunicationLimitsDowntimeDetailListController setAllowedContactsSpecifiers:](v39, "setAllowedContactsSpecifiers:", v3);

  return v3;
}

- (id)_allowedContactDetailLabelText:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
}

- (int64_t)_downtimeCommunicationLimitForSpecifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int64_t v8;

  v4 = a3;
  -[STCommunicationLimitsDowntimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v8 = 0;
  }
  else
  {
    -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v8 = 2;
    }
    else
    {
      -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
        v8 = 1;
      else
        v8 = 3;
    }
  }

  return v8;
}

- (void)familyMemberContactsDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (-[STCommunicationLimitsDowntimeDetailListController syncingWhitelistedContacts](self, "syncingWhitelistedContacts"))
  {
    -[STCommunicationLimitsDowntimeDetailListController _didFinishSyncingWhitelistedContacts](self, "_didFinishSyncingWhitelistedContacts");
  }
  else
  {
    -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BE75DA0];
    v11 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "familyMemberContactItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v6 != v9)
    {
      -[STCommunicationLimitsDowntimeDetailListController reloadSpecifiers](self, "reloadSpecifiers");
      -[STCommunicationLimitsDowntimeDetailListController _selectLeastRestrictiveOptionIfNecessary](self, "_selectLeastRestrictiveOptionIfNecessary");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v4);

    }
  }
}

- (void)presentViewController:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isiPad");

  if (v5)
  {
    objc_msgSend(v13, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourceRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    -[STCommunicationLimitsDowntimeDetailListController addContactsSpecifier](self, "addContactsSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[STCommunicationLimitsDowntimeDetailListController containsSpecifier:](self, "containsSpecifier:", v7);
    -[STCommunicationLimitsDowntimeDetailListController table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsDowntimeDetailListController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourceView:", v11);
    }
    else
    {
      -[STCommunicationLimitsDowntimeDetailListController allowSpecificContactsSpecifier](self, "allowSpecificContactsSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsDowntimeDetailListController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourceView:", v12);

    }
    objc_msgSend(v6, "setPermittedArrowDirections:", 3);

  }
  -[STCommunicationLimitsDowntimeDetailListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)dismissPresentedViewController:(id)a3
{
  -[STCommunicationLimitsDowntimeDetailListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[STCommunicationLimitsDowntimeDetailListController _selectLeastRestrictiveOptionIfNecessary](self, "_selectLeastRestrictiveOptionIfNecessary");
}

- (void)_selectLeastRestrictiveOptionIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyMemberContactItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v5 = *MEMORY[0x24BE75C20];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowSpecificContactsSpecifier](self, "allowSpecificContactsSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
      goto LABEL_4;
    -[STCommunicationLimitsDowntimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = v3;
    if (v3 || (v10 = v4) != 0 || (v10 = (void *)v8) != 0)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v5);
    -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v11, 1);

    -[STCommunicationLimitsDowntimeDetailListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v14, 0);
    objc_msgSend(v14, "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A68]);

    -[STCommunicationLimitsDowntimeDetailListController _updateAllowedCommunicationGroupFooterText](self, "_updateAllowedCommunicationGroupFooterText");
  }

LABEL_4:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
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
  objc_super v30;
  objc_super v31;
  _QWORD v32[5];
  objc_super v33;

  v6 = a3;
  v7 = a4;
  -[STCommunicationLimitsDowntimeDetailListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v7, "section");
  if (v13 == objc_msgSend(v12, "section"))
  {
    v29 = v10;
    -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowSpecificContactsSpecifier](self, "allowSpecificContactsSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v33.receiver = self;
    v33.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
    -[STCommunicationLimitsDowntimeDetailListController tableView:didSelectRowAtIndexPath:](&v33, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
    v17 = -[STCommunicationLimitsDowntimeDetailListController _downtimeCommunicationLimitForSpecifier:](self, "_downtimeCommunicationLimitForSpecifier:", v8);
    -[STCommunicationLimitsDowntimeDetailListController communicationLimits](self, "communicationLimits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDowntimeCommunicationLimit:", v17);

    if (v8 != v15 || v16 == v15)
    {
      if (v8 != v15 && v16 == v15)
      {
        -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[STCommunicationLimitsDowntimeDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v24, 1);

      }
    }
    else
    {
      -[STCommunicationLimitsDowntimeDetailListController _startSyncingWhitelistedContacts](self, "_startSyncingWhitelistedContacts");
    }
    -[STCommunicationLimitsDowntimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE75A68]);

    -[STCommunicationLimitsDowntimeDetailListController _updateAllowedCommunicationGroupFooterText](self, "_updateAllowedCommunicationGroupFooterText");
    -[STCommunicationLimitsDowntimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v26)
    {
      -[STCommunicationLimitsDowntimeDetailListController specifier](self, "specifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", 0x24DB91230);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __87__STCommunicationLimitsDowntimeDetailListController_tableView_didSelectRowAtIndexPath___block_invoke;
      v32[3] = &unk_24DB86C88;
      v32[4] = self;
      +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:](STCommunicationLimitsScreenTimeDetailListController, "showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:", v28, self, v32);

    }
    v10 = v29;
  }
  else
  {
    v19 = objc_msgSend(v7, "section");
    if (v19 == objc_msgSend(v10, "section"))
    {
      -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsDowntimeDetailListController addContactsSpecifier](self, "addContactsSpecifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v21)
      {
        objc_msgSend(v20, "performInteraction:", 0);
        v31.receiver = self;
        v31.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
        -[STCommunicationLimitsDowntimeDetailListController tableView:didSelectRowAtIndexPath:](&v31, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
      }
      else
      {
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        objc_msgSend(v20, "familyMemberContactItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "presentDetailsOfFamilyMemberContactItem:", v23);

      }
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
      -[STCommunicationLimitsDowntimeDetailListController tableView:didSelectRowAtIndexPath:](&v30, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
    }
  }

}

uint64_t __87__STCommunicationLimitsDowntimeDetailListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSyncingWhitelistedContacts");
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v5 = a4;
  -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "section");
  v9 = v8 == objc_msgSend(v7, "section");

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
  -[STCommunicationLimitsDowntimeDetailListController tableView:cellForRowAtIndexPath:](&v23, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "section");
  if (v10 == objc_msgSend(v9, "section"))
  {
    -[STCommunicationLimitsDowntimeDetailListController addContactsSpecifier](self, "addContactsSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "isEqual:", v12);

    if ((v13 & 1) == 0)
      objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("AllowedContact"));
  }
  -[STCommunicationLimitsDowntimeDetailListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UnreachableContact"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithImage:", v19);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v21);

    objc_msgSend(v7, "setAccessoryView:", v20);
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = objc_msgSend(a5, "row", a3);
  if (a4 == 1)
  {
    v8 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "familyMemberContactItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deleteFamilyMemberContactItem:", v10);

    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "section");

  if (v8 == v11)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AllowedContactsDeleteConfirmationButtonTitle"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STCommunicationLimitsDowntimeDetailListController;
    -[STCommunicationLimitsDowntimeDetailListController tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:](&v15, sel_tableView_titleForDeleteConfirmationButtonForRowAtIndexPath_, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_updateAllowedCommunicationGroupFooterText
{
  id v3;

  -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsDowntimeDetailListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v3, 1);

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
  id v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  const __CFString *v22;
  id v23;
  id v24;
  void *v25;
  const __CFString *v26;
  void *v27;

  v4 = a3;
  -[STCommunicationLimitsDowntimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeEveryoneFooterText"), &stru_24DB8A1D0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STCommunicationLimitsDowntimeDetailListController specifier](self, "specifier");
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
      if (v10)
      {
        -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeGroupsWithOneContactRemoteFooterText"), &stru_24DB8A1D0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v16, v10, v10);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("DuringDowntimeSpecificContactsRemoteFooterText");
          if (v12 == v4)
            v13 = CFSTR("DuringDowntimeContactsOnlyRemoteFooterText");
          v14 = v13;

          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_24DB8A1D0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v10);
          v17 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 == v4)
        {
          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v25;
          v26 = CFSTR("DuringDowntimeContactsOnlyRemoteGenericFooterText");
        }
        else
        {
          -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
          v24 = (id)objc_claimAutoreleasedReturnValue();

          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v25;
          if (v24 == v4)
            v26 = CFSTR("DuringDowntimeGroupsWithOneContactRemoteGenericFooterText");
          else
            v26 = CFSTR("DuringDowntimeSpecificContactsRemoteGenericFooterText");
        }
        objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_24DB8A1D0, 0);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v17;

    }
    else
    {
      -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 == v4)
      {
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v21;
        v22 = CFSTR("DuringDowntimeContactsOnlyLocalFooterText");
      }
      else
      {
        -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v21;
        if (v20 == v4)
          v22 = CFSTR("DuringDowntimeGroupsWithOneContactLocalFooterText");
        else
          v22 = CFSTR("DuringDowntimeSpecificContactsLocalFooterText");
      }
      objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_24DB8A1D0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v18;
}

- (void)_startSyncingWhitelistedContacts
{
  uint64_t v3;
  id v4;

  -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMemberContactItems");

  v3 = objc_msgSend(v4, "fetchStatus");
  if (v3 == 2)
    -[STCommunicationLimitsDowntimeDetailListController _didFinishSyncingWhitelistedContacts](self, "_didFinishSyncingWhitelistedContacts");
  else
    -[STCommunicationLimitsDowntimeDetailListController setSyncingWhitelistedContacts:](self, "setSyncingWhitelistedContacts:", (v3 & 0xFFFFFFFFFFFFFFFDLL) == 1);

}

- (void)_didFinishSyncingWhitelistedContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[STCommunicationLimitsDowntimeDetailListController setSyncingWhitelistedContacts:](self, "setSyncingWhitelistedContacts:", 0);
  -[STCommunicationLimitsDowntimeDetailListController whitelistedContactsController](self, "whitelistedContactsController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "familyMemberContactItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[STCommunicationLimitsDowntimeDetailListController allowedContactsSpecifiers](self, "allowedContactsSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowEveryoneSpecifier](self, "allowEveryoneSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowContactsOnlySpecifier](self, "allowContactsOnlySpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowGroupsWithOneContactSpecifier](self, "allowGroupsWithOneContactSpecifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = v6;
    if (v6 || (v10 = v7) != 0 || (v10 = (void *)v8) != 0)
      v11 = v10;
    else
      v11 = 0;
    if (v5)
    {
      -[STCommunicationLimitsDowntimeDetailListController allowedContactsGroupSpecifier](self, "allowedContactsGroupSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[STCommunicationLimitsDowntimeDetailListController containsSpecifier:](self, "containsSpecifier:", v12);

      if ((v13 & 1) == 0)
        -[STCommunicationLimitsDowntimeDetailListController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v5, v11, 1);
    }
    else
    {
      -[STCommunicationLimitsDowntimeDetailListController _allowedContactsSpecifiers](self, "_allowedContactsSpecifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCommunicationLimitsDowntimeDetailListController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v14, v11, 1);

    }
    -[STCommunicationLimitsDowntimeDetailListController allowSpecificContactsSpecifier](self, "allowSpecificContactsSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController _allowedCommunicationGroupFooterText:](self, "_allowedCommunicationGroupFooterText:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsDowntimeDetailListController allowedCommunicationGroupSpecifier](self, "allowedCommunicationGroupSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A68]);

    -[STCommunicationLimitsDowntimeDetailListController _updateAllowedCommunicationGroupFooterText](self, "_updateAllowedCommunicationGroupFooterText");
  }
  else
  {
    objc_msgSend(v18, "performInteraction:", 0);
  }

}

- (PSSpecifier)allowedCommunicationGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setAllowedCommunicationGroupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (PSSpecifier)allowEveryoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setAllowEveryoneSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (PSSpecifier)allowContactsOnlySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAllowContactsOnlySpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (PSSpecifier)allowGroupsWithOneContactSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setAllowGroupsWithOneContactSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (PSSpecifier)allowSpecificContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setAllowSpecificContactsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (PSSpecifier)allowedContactsGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setAllowedContactsGroupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (PSSpecifier)addContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setAddContactsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (NSMutableArray)allowedContactsSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setAllowedContactsSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setCommunicationLimits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (CNUIFamilyMemberWhitelistedContactsController)whitelistedContactsController
{
  return (CNUIFamilyMemberWhitelistedContactsController *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setWhitelistedContactsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1456);
}

- (BOOL)syncingWhitelistedContacts
{
  return self->_syncingWhitelistedContacts;
}

- (void)setSyncingWhitelistedContacts:(BOOL)a3
{
  self->_syncingWhitelistedContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedContactsController, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowedContactsSpecifiers, 0);
  objc_storeStrong((id *)&self->_addContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedContactsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowSpecificContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_allowGroupsWithOneContactSpecifier, 0);
  objc_storeStrong((id *)&self->_allowContactsOnlySpecifier, 0);
  objc_storeStrong((id *)&self->_allowEveryoneSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedCommunicationGroupSpecifier, 0);
}

@end
