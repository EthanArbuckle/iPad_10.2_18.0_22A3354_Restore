@implementation STCommunicationLimitsListController

- (STCommunicationLimitsListController)initWithRootViewModelCoordinator:(id)a3
{
  id v4;
  STCommunicationLimitsListController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  STCommunicationLimits *communicationLimits;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CNUIFamilyMemberContactsController *familyMemberContactsController;
  uint8_t v27[8];
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)STCommunicationLimitsListController;
  v5 = -[STPINListViewController initWithRootViewModelCoordinator:](&v28, sel_initWithRootViewModelCoordinator_, v4);
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "communicationLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  communicationLimits = v5->_communicationLimits;
  v5->_communicationLimits = (STCommunicationLimits *)v9;

  objc_msgSend(v4, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "me");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isManaged") & 1) != 0 || objc_msgSend(v12, "hasPasscode"))
  {
    objc_msgSend(v12, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (!objc_msgSend(v12, "isRemoteUser"))
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v12, "givenName");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v32[0] = v14;
        v31[0] = CFSTR("member-first-name");
        v31[1] = CFSTR("member-dsid");
        objc_msgSend(v12, "dsid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = CFSTR("member-altDSID");
        v32[1] = v16;
        v32[2] = v13;
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v32;
        v19 = v31;
        v20 = 3;
      }
      else
      {
        +[STUILog communication](STUILog, "communication");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_219AB4000, v21, OS_LOG_TYPE_DEFAULT, "User's givenName is nil.", v27, 2u);
        }

        v29[0] = CFSTR("member-dsid");
        objc_msgSend(v12, "dsid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = CFSTR("member-altDSID");
        v30[0] = v16;
        v30[1] = v13;
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v30;
        v19 = v29;
        v20 = 2;
      }
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A70]), "initWithDictionaryRepresentation:", v22);
      v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAED8]), "initWithFamilyMember:familyMemberContactsPresentation:", v23, v5);
      familyMemberContactsController = v5->_familyMemberContactsController;
      v5->_familyMemberContactsController = (CNUIFamilyMemberContactsController *)v24;

    }
    else
    {
      +[STUILog communication](STUILog, "communication");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[STCommunicationLimitsDowntimeDetailListController viewDidLoad].cold.1(v15);
    }

    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v5, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 3, "KVOContextCommunicationLimitsListController");

  return v5;
}

- (void)viewDidLoad
{
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationLimitsListController;
  -[STCommunicationLimitsListController viewDidLoad](&v4, sel_viewDidLoad);
  -[STCommunicationLimitsListController _indicateiCloudContactsSyncingStatus](self, "_indicateiCloudContactsSyncingStatus");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsListController.viewDidLoad", v3, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)STCommunicationLimitsListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/COMMUNICATION_LIMITS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("CommunicationLimitsSpecifierName"), CFSTR("Localizable"), v6, v8);

  v10 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenTimeControllerTitle"), CFSTR("Localizable"), v11, v13);

  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationLimitsListController;
  -[STListViewController dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
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
  objc_super v14;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));
  v14.receiver = self;
  v14.super_class = (Class)STCommunicationLimitsListController;
  -[STPINListViewController setCoordinator:](&v14, sel_setCoordinator_, v4);
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "communicationLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "communicationLimits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v8, v11);

  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 3, "KVOContextCommunicationLimitsListController");
  -[STCommunicationLimitsListController duringDowntimeSpecifier](self, "duringDowntimeSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, 0x24DB91230);

  -[STCommunicationLimitsListController duringScreenTimeSpecifier](self, "duringScreenTimeSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, 0x24DB91230);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a5;
  if (a6 == "KVOContextCommunicationLimitsListController")
  {
    v12 = a3;
    -[STPINListViewController coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));

    if (v14)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == v16)
      {

        v15 = 0;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v18)
      {

        v17 = 0;
      }
      -[STCommunicationLimitsListController _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v15, v17);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STCommunicationLimitsListController;
    v11 = a3;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 != v6 && (objc_msgSend(v7, "isEqualToCommunicationLimits:", v6) & 1) == 0)
  {
    -[STCommunicationLimitsListController setCommunicationLimits:](self, "setCommunicationLimits:", v6);
    -[STCommunicationLimitsListController reloadSpecifiers](self, "reloadSpecifiers");
    if (objc_msgSend(v7, "contactManagementState") == 1 && objc_msgSend(v6, "contactManagementState") == 2)
      -[STCommunicationLimitsListController _indicateiCloudContactsSyncingStatus](self, "_indicateiCloudContactsSyncingStatus");
  }

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  char v62;
  objc_class *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_class *v82;
  void *v83;
  uint64_t v84;
  char v85;
  char v86;
  void *v87;
  id v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  _QWORD v114[5];
  _QWORD aBlock[6];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v6 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v109 = v10;
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
      v10 = v109;
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

  v16 = *MEMORY[0x24BE75A68];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A68]);

  objc_msgSend(v6, "addObject:", v9);
  v17 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("AllowedCommunicationSectionTitle"), &stru_24DB8A1D0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "groupSpecifierWithName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "givenName");
  v20 = objc_claimAutoreleasedReturnValue();
  v107 = (void *)v20;
  v111 = objc_msgSend(v10, "isRemoteUser");
  v102 = v9;
  v103 = v3;
  if (v111)
  {
    if (v20)
    {
      objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeSpecifierRemoteFooterText"), &stru_24DB8A1D0, 0);
      v21 = v16;
      v22 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v22;
      v16 = v21;
      v26 = objc_msgSend(v24, "initWithFormat:locale:", v23, v25, v90);

      goto LABEL_14;
    }
    v27 = CFSTR("DuringScreenTimeSpecifierRemoteGenericFooterText");
  }
  else
  {
    v27 = CFSTR("DuringScreenTimeSpecifierLocalFooterText");
  }
  objc_msgSend(v113, "localizedStringForKey:value:table:", v27, &stru_24DB8A1D0, 0);
  v26 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v100 = (void *)v26;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v16);
  objc_msgSend(v6, "addObject:", v19);
  objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringScreenTimeSpecifierName"), &stru_24DB8A1D0, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BE75590];
  v30 = objc_opt_class();
  v99 = (void *)v28;
  objc_msgSend(v29, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, 0, v30, 2, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = *MEMORY[0x24BE75C60];
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v33);

  v104 = *MEMORY[0x24BE75E18];
  objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_24DBBE7A8);
  objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8]);
  v34 = objc_opt_class();
  v35 = *MEMORY[0x24BE75948];
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE75948]);
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v112);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__STCommunicationLimitsListController_specifiers__block_invoke;
  aBlock[3] = &unk_24DB86728;
  aBlock[4] = self;
  v98 = _Block_copy(aBlock);
  v36 = _Block_copy(v98);
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, 0x24DB90C10);

  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v110, "screenTimeCommunicationLimit"))
  {
    case 0:
      v37 = CFSTR("AllowEveryoneSpecifierName");
      goto LABEL_18;
    case 1:
      v37 = CFSTR("AllowGroupsWithOneContactSpecifierName");
      goto LABEL_18;
    case 2:
      v37 = CFSTR("AllowContactsOnlySpecifierName");
LABEL_18:
      objc_msgSend(v113, "localizedStringForKey:value:table:", v37, &stru_24DB8A1D0, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCommunicationLimitsListController.m"), 223, CFSTR("Unexpected general communication policy whitelisted contacts"));

      goto LABEL_20;
    default:
LABEL_20:
      v38 = 0;
LABEL_21:
      v40 = *MEMORY[0x24BE75D28];
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BE75D28]);
      -[STCommunicationLimitsListController setDuringScreenTimeSpecifier:](self, "setDuringScreenTimeSpecifier:", v31);
      objc_msgSend(v6, "addObject:", v31);
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v19;
      v97 = (void *)v38;
      if (v111)
      {
        if (v107)
        {
          objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeRemoteFooterText"), &stru_24DB8A1D0, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v41, v107);
          v42 = objc_claimAutoreleasedReturnValue();

          v43 = v42;
        }
        else
        {
          objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeRemoteGenericFooterText"), &stru_24DB8A1D0, 0);
          v43 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeLocalFooterText"), &stru_24DB8A1D0, 0);
        v43 = objc_claimAutoreleasedReturnValue();
      }
      v96 = (void *)v43;
      v92 = v16;
      objc_msgSend(v108, "setObject:forKeyedSubscript:", v43, v16);
      objc_msgSend(v6, "addObject:", v108);
      objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DuringDowntimeSpecifierName"), &stru_24DB8A1D0, 0);
      v44 = v6;
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BE75590];
      v47 = objc_opt_class();
      v95 = (void *)v45;
      objc_msgSend(v46, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v45, self, 0, 0, v47, 2, objc_opt_class());
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, v105);

      objc_msgSend(v48, "setObject:forKeyedSubscript:", &unk_24DBBE7A8, v104);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_opt_class(), v35);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v112, 0x24DB91230);
      v114[0] = MEMORY[0x24BDAC760];
      v114[1] = 3221225472;
      v114[2] = __49__STCommunicationLimitsListController_specifiers__block_invoke_2;
      v114[3] = &unk_24DB86728;
      v114[4] = self;
      v51 = _Block_copy(v114);
      v52 = _Block_copy(v51);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v52, 0x24DB90C10);

      v53 = objc_msgSend(v110, "downtimeCommunicationLimit");
      v54 = 0;
      if (v53 <= 3)
      {
        objc_msgSend(v113, "localizedStringForKey:value:table:", off_24DB86CF8[v53], &stru_24DB8A1D0, 0);
        v54 = objc_claimAutoreleasedReturnValue();
      }
      v94 = (void *)v54;
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v54, v40);
      -[STCommunicationLimitsListController setDuringDowntimeSpecifier:](self, "setDuringDowntimeSpecifier:", v48);
      objc_msgSend(v44, "addObject:", v48);
      -[STCommunicationLimitsListController familyMemberContactsController](self, "familyMemberContactsController");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v109;
      v56 = v44;
      if (!objc_msgSend(v109, "isManaged"))
        goto LABEL_47;
      v57 = (void *)MEMORY[0x24BE75590];
      v58 = (void *)objc_opt_new();
      objc_msgSend(v58, "UUIDString");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "groupSpecifierWithID:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = objc_msgSend(v110, "contactManagementState");
      v62 = v111 ^ 1;
      if (v61 != 2)
        v62 = 1;
      if ((v62 & 1) == 0 && !objc_msgSend(v106, "fetchStatus"))
      {
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v64, *MEMORY[0x24BE75A30]);

        -[STCommunicationLimitsListController _startSyncingiCloudContacts](self, "_startSyncingiCloudContacts");
      }
      -[STCommunicationLimitsListController _manageContactsGroupFooterText](self, "_manageContactsGroupFooterText");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v65, v92);

      -[STCommunicationLimitsListController setManageContactsGroupSpecifier:](self, "setManageContactsGroupSpecifier:", v60);
      objc_msgSend(v56, "addObject:", v60);
      v91 = v61;
      if (v111)
      {
        v66 = v51;
        if (v107)
        {
          objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("ManageContactsRemoteSpecifierName"), &stru_24DB8A1D0, 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)objc_msgSend(v68, "initWithFormat:locale:", v67, v69, v107);

        }
        else
        {
          objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("ManageContactsRemoteGenericSpecifierName"), &stru_24DB8A1D0, 0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v66 = v51;
        objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("ManageContactsLocalSpecifierName"), &stru_24DB8A1D0, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v70, self, sel__setManageContacts_specifier_, sel__manageContacts_, 0, 6, objc_opt_class());
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v71);
      -[STCommunicationLimitsListController setManageContactsSpecifier:](self, "setManageContactsSpecifier:", v71);
      objc_msgSend(v56, "addObject:", v71);
      v51 = v66;
      if (!v111)
        goto LABEL_46;
      if (v91 == 2)
      {
        v93 = v70;
        objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("iCloudContactsSpecifierName"), &stru_24DB8A1D0, 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v72, self, 0, sel__totaliCloudContactsDetailText_, 0, 2, objc_opt_class());
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (objc_class *)objc_opt_class();
        NSStringFromClass(v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v75, v105);

        objc_msgSend(v73, "setObject:forKeyedSubscript:", &unk_24DBBE7A8, v104);
        objc_msgSend(v73, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
        -[STCommunicationLimitsListController setICloudContactsSpecifier:](self, "setICloudContactsSpecifier:", v73);
        if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
          goto LABEL_45;
      }
      else
      {
        if (v91 != 1)
          goto LABEL_46;
        v93 = v70;
        objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("iCloudContactsSpecifierName"), &stru_24DB8A1D0, 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v72, self, 0, sel__statusPendingDetailText_, 0, 4, 0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        -[STCommunicationLimitsListController setICloudContactsSpecifier:](self, "setICloudContactsSpecifier:", v73);
      }
      objc_msgSend(v56, "addObject:", v73);
LABEL_45:

      v70 = v93;
LABEL_46:

      v55 = v109;
LABEL_47:
      if (objc_msgSend(v55, "hasPasscode"))
      {
        v76 = (void *)MEMORY[0x24BE75590];
        v77 = (void *)objc_opt_new();
        objc_msgSend(v77, "UUIDString");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "groupSpecifierWithID:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "addObject:", v79);
        objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingSpecifierName"), &stru_24DB8A1D0, 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v80, self, sel__setAllowContactEditing_specifier_, sel__allowContactEditing_, 0, 6, objc_opt_class());
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v83, v105);

        objc_msgSend(v81, "setObject:forKeyedSubscript:", &unk_24DBBE7A8, v104);
        objc_msgSend(v81, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
        v84 = objc_msgSend(v106, "fetchStatus");
        if (v84 == 2)
          v85 = 1;
        else
          v85 = v111 ^ 1;
        if ((v85 & 1) == 0)
          objc_msgSend(v81, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        -[STCommunicationLimitsListController setAllowContactEditingSpecifier:](self, "setAllowContactEditingSpecifier:", v81);
        objc_msgSend(v56, "addObject:", v81);
        if (v84)
          v86 = 1;
        else
          v86 = v111 ^ 1;
        if ((v86 & 1) == 0)
          -[STCommunicationLimitsListController _startSyncingiCloudContacts](self, "_startSyncingiCloudContacts");

        v55 = v109;
      }
      v87 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v103);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v103) = (Class)v56;
      v88 = v56;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v103);
      break;
  }
  return v4;
}

void __49__STCommunicationLimitsListController_specifiers__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "duringScreenTimeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForSpecifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = v3;
    v8.super_class = (Class)STCommunicationLimitsListController;
    objc_msgSendSuper2(&v8, sel_tableView_didSelectRowAtIndexPath_, v4, v7);

  }
}

void __49__STCommunicationLimitsListController_specifiers__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "duringDowntimeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForSpecifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = v3;
    v8.super_class = (Class)STCommunicationLimitsListController;
    objc_msgSendSuper2(&v8, sel_tableView_didSelectRowAtIndexPath_, v4, v7);

  }
}

- (id)_totaliCloudContactsDetailText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TotaliCloudContacts"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[STCommunicationLimitsListController familyMemberContactsController](self, "familyMemberContactsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v5, objc_msgSend(v7, "countOfFamilyMemberContacts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_manageContacts:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL8 v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contactManagementState");

    -[STPINListViewController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRemoteUser");

    if (v10)
      v11 = (unint64_t)(v6 - 1) < 2;
    else
      v11 = v6 == 2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_setManageContacts:(id)a3 specifier:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  void (**v16)(_QWORD);
  _QWORD aBlock[5];
  id v18;
  char v19;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke;
  aBlock[3] = &unk_24DB86CB0;
  aBlock[4] = self;
  v19 = v7;
  v12 = v6;
  v18 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v10, "hasPasscode") && (objc_msgSend(v8, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke_2;
    v14[3] = &unk_24DB86CD8;
    v16 = v13;
    v14[4] = self;
    v15 = v12;
    -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v15, v14);

  }
  else
  {
    v13[2](v13);
  }

}

void __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "communicationLimits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v11, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRemoteUser");

  if (v3)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75DA0]);

      objc_msgSend(*(id *)(a1 + 32), "_startSyncingiCloudContacts");
      goto LABEL_10;
    }
    v8 = v2;
    v9 = 2;
LABEL_9:
    objc_msgSend(v8, "setContactManagementState:", v9);
    objc_msgSend(v11, "contentPrivacyCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveCommunicationLimits:completionHandler:", v2, 0);

    goto LABEL_10;
  }
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_didCancelSyncingiCloudContacts");
  if (objc_msgSend(v2, "contactManagementState"))
  {
    v8 = v2;
    v9 = 0;
    goto LABEL_9;
  }
LABEL_10:
  +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:](STCommunicationLimitsScreenTimeDetailListController, "showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:", v11, *(_QWORD *)(a1 + 32), 0);

}

uint64_t __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (id)_statusPendingDetailText:(id)a3
{
  void *v3;
  void *v4;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ManageContactsStatusPendingDetailText"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_manageContactsGroupFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "contactManagementState");

  if ((objc_msgSend(v6, "isRemoteUser") & 1) != 0)
  {
    if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
    {
      if (v7)
      {
        v10 = CFSTR("iCloudContactsSyncingRemoteFooterText");
LABEL_15:
        objc_msgSend(v3, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v15, v7, v18);
        goto LABEL_16;
      }
      v11 = CFSTR("iCloudContactsSyncingSpecifierRemoteGenericFooterText");
    }
    else if (v9 == 1)
    {
      if (!objc_msgSend(v6, "isRemoteUser"))
      {
        v12 = 0;
        goto LABEL_17;
      }
      if (v7)
      {
        objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("iCloudContactsPendingRemoteFooterText"), &stru_24DB8A1D0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v15, v7, v7);
LABEL_16:
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      v11 = CFSTR("iCloudContactsPendingRemoteGenericFooterText");
    }
    else
    {
      if (v7)
      {
        if (v9)
          v10 = CFSTR("iCloudContactsSpecifierRemoteFooterText");
        else
          v10 = CFSTR("ManageContactsGroupSpecifierRemoteFooterText");
        goto LABEL_15;
      }
      if (v9)
        v11 = CFSTR("iCloudContactsSpecifierRemoteGenericFooterText");
      else
        v11 = CFSTR("ManageContactsGroupSpecifierRemoteGenericFooterText");
    }
  }
  else
  {
    v11 = CFSTR("ManageContactsSpecifierLocalFooterText");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v11, &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v12;
}

- (id)_allowContactEditing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "contactsEditable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setAllowContactEditing:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasPasscode"))
  {

    goto LABEL_5;
  }
  v11 = objc_msgSend(v8, "hasAlreadyEnteredPINForSession");

  if ((v11 & 1) != 0)
  {
LABEL_5:
    -[STCommunicationLimitsListController _updateAllowContactEditingWithAlertIfNeeded:forSpecifier:](self, "_updateAllowContactEditingWithAlertIfNeeded:forSpecifier:", v6, v7);
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__STCommunicationLimitsListController__setAllowContactEditing_specifier___block_invoke;
  v12[3] = &unk_24DB867C8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v14, v12);

LABEL_6:
}

uint64_t __73__STCommunicationLimitsListController__setAllowContactEditing_specifier___block_invoke(_QWORD *a1, int a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "_updateAllowContactEditingWithAlertIfNeeded:forSpecifier:", a1[5], a1[6]);
  else
    return objc_msgSend(v3, "reloadSpecifier:animated:", a1[6], 1);
}

- (void)_updateAllowContactEditingWithAlertIfNeeded:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  v7 = a4;
  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "screenTimeCommunicationLimit");

  if (objc_msgSend(v6, "BOOLValue") && (unint64_t)(v9 - 1) <= 1)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPINListViewController coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "me");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v13;
    if (objc_msgSend(v13, "isRemoteUser"))
    {
      objc_msgSend(v13, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingRemoteAlertTitle"), &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v15, v16, v14);
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingRemoteAlertPrompt"), &stru_24DB8A1D0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v18, v16, v14);

      }
      else
      {
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingRemoteGenericAlertTitle"), &stru_24DB8A1D0, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingRemoteGenericAlertPrompt"), &stru_24DB8A1D0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingLocalAlertTitle"), &stru_24DB8A1D0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowContactEditingLocalAlertPrompt"), &stru_24DB8A1D0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v19;
    v29 = (void *)v17;
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v17, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonContinue"), &stru_24DB8A1D0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke;
    v33[3] = &unk_24DB868F8;
    v33[4] = self;
    v34 = v6;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addAction:", v24);
    objc_msgSend(v20, "setPreferredAction:", v24);
    v25 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke_2;
    v31[3] = &unk_24DB868F8;
    v31[4] = self;
    v32 = v7;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v27);

    -[STCommunicationLimitsListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
  }
  else
  {
    -[STCommunicationLimitsListController _updateAllowContactEditing:](self, "_updateAllowContactEditing:", v6);
  }

}

uint64_t __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllowContactEditing:", *(_QWORD *)(a1 + 40));
}

uint64_t __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_updateAllowContactEditing:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v8, "setContactsEditable:", v5);
  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentPrivacyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveCommunicationLimits:completionHandler:", v8, 0);

  +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:](STCommunicationLimitsScreenTimeDetailListController, "showCompatibilityAlertIfNeededWithCoordinator:presentingViewController:okHandler:", v6, self, 0);
}

- (void)_startSyncingiCloudContacts
{
  uint64_t v3;
  id v4;

  -[STCommunicationLimitsListController familyMemberContactsController](self, "familyMemberContactsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countOfFamilyMemberContacts");
  v3 = objc_msgSend(v4, "fetchStatus");
  if (v3 == 2)
  {
    -[STCommunicationLimitsListController _didFinishSyncingiCloudContacts](self, "_didFinishSyncingiCloudContacts");
  }
  else
  {
    -[STCommunicationLimitsListController setSyncingiCloudContacts:](self, "setSyncingiCloudContacts:", (v3 & 0xFFFFFFFFFFFFFFFDLL) == 1);
    -[STCommunicationLimitsListController _didStartSyncingiCloudContacts](self, "_didStartSyncingiCloudContacts");
  }

}

- (void)_didStartSyncingiCloudContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[STCommunicationLimitsListController _enableAllowContactEditingSwitch:](self, "_enableAllowContactEditingSwitch:", 0);
  -[STCommunicationLimitsListController _updateManageContactsGroupFooterView](self, "_updateManageContactsGroupFooterView");
  -[STCommunicationLimitsListController _indicateiCloudContactsSyncingStatus](self, "_indicateiCloudContactsSyncingStatus");
  -[STCommunicationLimitsListController familyMemberContactsController](self, "familyMemberContactsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fetchStatus");
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "givenName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  switch(v4)
  {
    case 0:
      +[STUILog communication](STUILog, "communication");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = 138412290;
      v12 = v8;
      v10 = "Did not fetch %@'s iCloud contacts.";
      break;
    case 1:
      +[STUILog communication](STUILog, "communication");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = 138412290;
      v12 = v8;
      v10 = "Fetching %@'s iCloud contacts.";
      break;
    case 2:
      +[STUILog communication](STUILog, "communication");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = 138412290;
      v12 = v8;
      v10 = "Finished syncing %@'s iCloud contacts.";
      break;
    case 3:
      +[STUILog communication](STUILog, "communication");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = 138412290;
      v12 = v8;
      v10 = "Syncing %@'s iCloud contacts.";
      break;
    default:
      goto LABEL_12;
  }
  _os_log_impl(&dword_219AB4000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
LABEL_11:

LABEL_12:
}

- (void)_didFinishSyncingiCloudContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STCommunicationLimitsListController setSyncingiCloudContacts:](self, "setSyncingiCloudContacts:", 0);
  -[STCommunicationLimitsListController _enableAllowContactEditingSwitch:](self, "_enableAllowContactEditingSwitch:", 1);
  -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contactManagementState");
  -[STCommunicationLimitsListController manageContactsSpecifier](self, "manageContactsSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController familyMemberContactsController](self, "familyMemberContactsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController _manageContacts:](self, "_manageContacts:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9 || v4)
  {
    if (v4 != 2)
      goto LABEL_11;
    -[STCommunicationLimitsListController iCloudContactsSpecifier](self, "iCloudContactsSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[STCommunicationLimitsListController containsSpecifier:](self, "containsSpecifier:", v11) & 1) == 0)
      -[STCommunicationLimitsListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v11, v5, 1);
  }
  else
  {
    if (objc_msgSend(v6, "countOfFamilyMemberContacts") >= 1)
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v3, "setContactManagementState:", v10);
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveCommunicationLimits:completionHandler:", v3, 0);
  }

LABEL_11:
  objc_msgSend(v5, "removePropertyForKey:", *MEMORY[0x24BE75DA0]);
  -[STCommunicationLimitsListController _updateManageContactsGroupFooterView](self, "_updateManageContactsGroupFooterView");
  -[STCommunicationLimitsListController _indicateiCloudContactsSyncingStatus](self, "_indicateiCloudContactsSyncingStatus");
  v12 = objc_msgSend(v6, "fetchStatus");
  objc_msgSend(v7, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "me");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "givenName");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  switch(v12)
  {
    case 0:
      +[STUILog communication](STUILog, "communication");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v18 = 138412290;
      v19 = v15;
      v17 = "Did not fetch %@'s iCloud contacts.";
      break;
    case 1:
      +[STUILog communication](STUILog, "communication");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v18 = 138412290;
      v19 = v15;
      v17 = "Fetching %@'s iCloud contacts.";
      break;
    case 2:
      +[STUILog communication](STUILog, "communication");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v18 = 138412290;
      v19 = v15;
      v17 = "Finished syncing %@'s iCloud contacts.";
      break;
    case 3:
      +[STUILog communication](STUILog, "communication");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v18 = 138412290;
      v19 = v15;
      v17 = "Syncing %@'s iCloud contacts.";
      break;
    default:
      goto LABEL_22;
  }
  _os_log_impl(&dword_219AB4000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0xCu);
LABEL_21:

LABEL_22:
}

- (void)_didCancelSyncingiCloudContacts
{
  void *v3;

  if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
  {
    -[STCommunicationLimitsListController setSyncingiCloudContacts:](self, "setSyncingiCloudContacts:", 0);
    -[STCommunicationLimitsListController manageContactsSpecifier](self, "manageContactsSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePropertyForKey:", *MEMORY[0x24BE75DA0]);

    -[STCommunicationLimitsListController _updateManageContactsGroupFooterView](self, "_updateManageContactsGroupFooterView");
    -[STCommunicationLimitsListController _indicateiCloudContactsSyncingStatus](self, "_indicateiCloudContactsSyncingStatus");
  }
}

- (void)_updateManageContactsGroupFooterView
{
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;

  -[STCommunicationLimitsListController manageContactsGroupSpecifier](self, "manageContactsGroupSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75A30]);

  }
  else
  {
    objc_msgSend(v6, "removePropertyForKey:", *MEMORY[0x24BE75A30]);
  }
  -[STCommunicationLimitsListController _manageContactsGroupFooterText](self, "_manageContactsGroupFooterText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

  -[STCommunicationLimitsListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v6, 0);
}

- (void)_indicateiCloudContactsSyncingStatus
{
  void *v3;
  id v4;

  -[STCommunicationLimitsListController manageContactsGroupSpecifier](self, "manageContactsGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75A78]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
    objc_msgSend(v4, "startAnimatingSpinner");
  else
    objc_msgSend(v4, "stopAnimatingSpinner");

}

- (void)_enableAllowContactEditingSwitch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[STCommunicationLimitsListController allowContactEditingSpecifier](self, "allowContactEditingSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A18]);

  -[STCommunicationLimitsListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v6, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
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
  char v16;
  objc_super v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  STCommunicationLimitsListController *v21;

  v6 = a3;
  v7 = a4;
  -[STCommunicationLimitsListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController iCloudContactsSpecifier](self, "iCloudContactsSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    -[STCommunicationLimitsListController communicationLimits](self, "communicationLimits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "contactManagementState");

    if (v11 != 2)
      goto LABEL_7;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__STCommunicationLimitsListController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_24DB867C8;
    v19 = v6;
    v20 = v7;
    v21 = self;
    v12 = _Block_copy(aBlock);
    -[STPINListViewController coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "me");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hasPasscode"))
    {
      v16 = objc_msgSend(v13, "hasAlreadyEnteredPINForSession");

      if ((v16 & 1) == 0)
      {
        -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v8, v12);
LABEL_11:

        goto LABEL_8;
      }
    }
    else
    {

    }
    (*((void (**)(void *, uint64_t))v12 + 2))(v12, 1);
    goto LABEL_11;
  }

LABEL_7:
  v17.receiver = self;
  v17.super_class = (Class)STCommunicationLimitsListController;
  -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
LABEL_8:

}

void __73__STCommunicationLimitsListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 48), "familyMemberContactsController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performInteraction:", 0);

  }
}

- (void)familyMemberContactsDidChange
{
  if (-[STCommunicationLimitsListController syncingiCloudContacts](self, "syncingiCloudContacts"))
    -[STCommunicationLimitsListController _didFinishSyncingiCloudContacts](self, "_didFinishSyncingiCloudContacts");
}

- (void)presentViewController:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isiPad");

  if (v5)
  {
    objc_msgSend(v9, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourceRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    -[STCommunicationLimitsListController iCloudContactsSpecifier](self, "iCloudContactsSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourceView:", v8);

    objc_msgSend(v6, "setPermittedArrowDirections:", 3);
  }
  -[STCommunicationLimitsListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)dismissPresentedViewController:(id)a3
{
  -[STCommunicationLimitsListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PSSpecifier)duringScreenTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setDuringScreenTimeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (PSSpecifier)duringDowntimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setDuringDowntimeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (PSSpecifier)manageContactsGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setManageContactsGroupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (PSSpecifier)manageContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setManageContactsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (PSSpecifier)iCloudContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setICloudContactsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (PSSpecifier)allowContactEditingSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setAllowContactEditingSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1456);
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setCommunicationLimits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1464);
}

- (CNUIFamilyMemberContactsController)familyMemberContactsController
{
  return (CNUIFamilyMemberContactsController *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setFamilyMemberContactsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (BOOL)syncingiCloudContacts
{
  return self->_syncingiCloudContacts;
}

- (void)setSyncingiCloudContacts:(BOOL)a3
{
  self->_syncingiCloudContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberContactsController, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowContactEditingSpecifier, 0);
  objc_storeStrong((id *)&self->_iCloudContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_manageContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_manageContactsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_duringDowntimeSpecifier, 0);
  objc_storeStrong((id *)&self->_duringScreenTimeSpecifier, 0);
}

@end
