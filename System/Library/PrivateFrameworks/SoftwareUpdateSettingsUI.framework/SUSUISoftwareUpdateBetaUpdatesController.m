@implementation SUSUISoftwareUpdateBetaUpdatesController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  SUSUISoftwareUpdateBetaUpdatesController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  -[SUSUISoftwareUpdateBetaUpdatesController viewDidLoad](&v5, sel_viewDidLoad);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GET_BETA_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  v2 = (id)-[SUSUISoftwareUpdateBetaUpdatesController navigationItem](v7, "navigationItem");
  objc_msgSend(v2, "setTitle:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  SUSUISoftwareUpdateBetaUpdatesController *v3;
  id v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUISoftwareUpdateBetaUpdatesController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  -[SUSUISoftwareUpdateBetaUpdatesController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v3 = v9;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GET_BETA_UPDATES"), &stru_24E0011F0, CFSTR("Software Update"));
  -[PSListController addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:](v3, "addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:");

}

- (id)specifiers
{
  id v2;
  void **v3;
  void *v4;
  int *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  PSSpecifier *v9;
  PSSpecifier *v10;
  NSArray *v11;
  PSSpecifier *v12;
  PSSpecifier *v13;
  BOOL v14;
  char v15;
  id v16;
  id v17[2];
  SUSUISoftwareUpdateBetaUpdatesController *v18;
  id v19;

  v18 = self;
  v17[1] = (id)a2;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    v19 = *(id *)((char *)&v18->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  }
  else
  {
    -[SUSUISoftwareUpdateBetaUpdatesController setupProgramsGroupSpecifier](v18, "setupProgramsGroupSpecifier");
    -[SUSUISoftwareUpdateBetaUpdatesController setupProgramListSpecifiers](v18, "setupProgramListSpecifiers");
    -[SUSUISoftwareUpdateBetaUpdatesController updateFooter](v18, "updateFooter");
    v17[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 6);
    v10 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v18, "programsGroup");
    objc_msgSend(v17[0], "addObject:");

    v11 = -[SUSUISoftwareUpdateBetaUpdatesController programsList](v18, "programsList");
    objc_msgSend(v17[0], "addObjectsFromArray:");

    v12 = -[SUSUISoftwareUpdateBetaUpdatesController appleIDGroupSpecifier](v18, "appleIDGroupSpecifier");
    objc_msgSend(v17[0], "addObject:");

    v13 = -[SUSUISoftwareUpdateBetaUpdatesController mismatchedSpecifier](v18, "mismatchedSpecifier");
    v15 = 0;
    v14 = 1;
    if (!v13)
    {
      v16 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v18, "updateController");
      v15 = 1;
      v14 = objc_msgSend(v16, "betaUpdatesHasInstallationRestriction") != 0;
    }
    if ((v15 & 1) != 0)

    if (v14)
    {
      v9 = -[SUSUISoftwareUpdateBetaUpdatesController unavailableProgramNoticeSpecifier](v18, "unavailableProgramNoticeSpecifier");
      objc_msgSend(v17[0], "addObject:");

    }
    v8 = -[SUSUISoftwareUpdateBetaUpdatesController appleIDSpecifier](v18, "appleIDSpecifier");

    if (v8)
    {
      v7 = -[SUSUISoftwareUpdateBetaUpdatesController appleIDSpecifier](v18, "appleIDSpecifier");
      objc_msgSend(v17[0], "addObject:");

    }
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v17[0]);
    v6 = (int *)MEMORY[0x24BE756E0];
    v3 = (void **)((char *)&v18->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v4 = *v3;
    *v3 = v2;

    v19 = *(id *)((char *)&v18->super.super.super.super.super.isa + *v6);
    objc_storeStrong(v17, 0);
  }
  return v19;
}

- (void)setMismatchedSpecifier:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateBetaUpdatesController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_mismatchedSpecifier, location[0]);
  objc_storeStrong((id *)&v4->_appleIDSpecifier, 0);
  objc_storeStrong((id *)&v4->_appleIDGroupSpecifier, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAppleAccountFeatureFlagOn
{
  return _os_feature_enabled_impl() & 1;
}

- (PSSpecifier)appleIDGroupSpecifier
{
  PSSpecifier *v3;
  PSSpecifier *appleIDGroupSpecifier;

  if (!self->_appleIDGroupSpecifier)
  {
    v3 = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BETA_PROGRAMS_APPLE_ID_GROUP"));
    appleIDGroupSpecifier = self->_appleIDGroupSpecifier;
    self->_appleIDGroupSpecifier = v3;

  }
  return self->_appleIDGroupSpecifier;
}

- (PSSpecifier)unavailableProgramNoticeSpecifier
{
  PSSpecifier *v2;
  PSSpecifier *unavailableProgramNoticeSpecifier;
  id v4;
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27[2];
  SUSUISoftwareUpdateBetaUpdatesController *v28;
  PSSpecifier *v29;

  v28 = self;
  v27[1] = (id)a2;
  if (self->_unavailableProgramNoticeSpecifier)
  {
    v29 = v28->_unavailableProgramNoticeSpecifier;
  }
  else
  {
    v2 = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E0011F0, 0, 0, 0, 0, 4, 0);
    unavailableProgramNoticeSpecifier = v28->_unavailableProgramNoticeSpecifier;
    v28->_unavailableProgramNoticeSpecifier = v2;

    -[PSSpecifier setProperty:forKey:](v28->_unavailableProgramNoticeSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v23 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v28, "updateController");
    v27[0] = (id)objc_msgSend(v23, "betaUpdatesAppleID");

    v26 = 0;
    v24 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v28, "updateController");
    v25 = objc_msgSend(v24, "betaUpdatesHasInstallationRestriction");

    if (v25 == 2)
    {
      v22 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("BETA_UPDATES_MDM_RESTRICTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v5 = v26;
      v26 = v4;

    }
    else if (v25 == 1)
    {
      v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BETA_UPDATES_LOCKDOWN_RESTRICTED"), &stru_24E0011F0, CFSTR("Software Update"));
      v7 = v26;
      v26 = v6;

    }
    else if (v27[0])
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      v20 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v28, "isAppleAccountFeatureFlagOn"))
        v8 = CFSTR("BETA_UPDATES_MISMATCHED_APPLE_ACCOUNT");
      else
        v8 = CFSTR("BETA_UPDATES_MISMATCHED_APPLE_ID");
      v19 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", v8, &stru_24E0011F0, CFSTR("Software Update"));
      v9 = (id)objc_msgSend(v18, "stringWithFormat:", v27[0]);
      v10 = v26;
      v26 = v9;

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v28, "isAppleAccountFeatureFlagOn"))
        v11 = CFSTR("BETA_UPDATES_NO_APPLE_ACCOUNT");
      else
        v11 = CFSTR("BETA_UPDATES_NO_APPLE_ID");
      v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", v11, &stru_24E0011F0, CFSTR("Software Update"));
      v12 = (id)objc_msgSend(v15, "stringWithFormat:");
      v13 = v26;
      v26 = v12;

    }
    -[PSSpecifier setProperty:forKey:](v28->_unavailableProgramNoticeSpecifier, "setProperty:forKey:", v26, *MEMORY[0x24BE75D28]);
    -[PSSpecifier setProperty:forKey:](v28->_unavailableProgramNoticeSpecifier, "setProperty:forKey:", &unk_24E0116D0, *MEMORY[0x24BE75850]);
    -[PSSpecifier setProperty:forKey:](v28->_unavailableProgramNoticeSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    -[PSSpecifier setProperty:forKey:](v28->_unavailableProgramNoticeSpecifier, "setProperty:forKey:", CFSTR("BETA_PROGRAMS_NOTICE"), *MEMORY[0x24BE75AC0]);
    v29 = v28->_unavailableProgramNoticeSpecifier;
    objc_storeStrong(&v26, 0);
    objc_storeStrong(v27, 0);
  }
  return v29;
}

- (PSSpecifier)appleIDSpecifier
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  PSSpecifier *v10;
  PSSpecifier *appleIDSpecifier;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id obj;
  id v24;
  PSSpecifier *v25;
  id v26;
  uint64_t v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  void *v33;
  char v34;
  id v35;
  char v36;
  id v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  os_log_type_t v42;
  id location;
  uint64_t v44;
  SEL v45;
  SUSUISoftwareUpdateBetaUpdatesController *v46;
  PSSpecifier *v47;
  uint8_t v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  v45 = a2;
  if (self->_appleIDSpecifier)
  {
    v47 = v46->_appleIDSpecifier;
  }
  else
  {
    v26 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v46, "updateController");
    v27 = objc_msgSend(v26, "betaUpdatesHasInstallationRestriction");

    v44 = v27;
    if (v27)
    {
      location = _SUSUILoggingFacility();
      v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v48, v44);
        _os_log_impl(&dword_21BF33000, (os_log_t)location, v42, "Hiding Apple ID row - device has installation restriction (%ld).", v48, 0xCu);
      }
      objc_storeStrong(&location, 0);
      v47 = 0;
    }
    else
    {
      v24 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v46, "updateController");
      v41 = (id)objc_msgSend(v24, "betaUpdatesAppleID");

      v40 = 0;
      v25 = -[SUSUISoftwareUpdateBetaUpdatesController mismatchedSpecifier](v46, "mismatchedSpecifier");

      if (v25)
      {
        v38 = 0;
        v36 = 0;
        v34 = 0;
        v32 = 0;
        v30 = 0;
        v28 = 0;
        if (v41)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          v21 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v39 = v21;
          v38 = 1;
          if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v46, "isAppleAccountFeatureFlagOn"))
          {
            v2 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_MISMATCH_PROMPT");
          }
          else
          {
            v2 = CFSTR("BETA_UPDATES_APPLE_ID_MISMATCH_PROMPT");
          }
          v37 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", v2, &stru_24E0011F0, CFSTR("Software Update"));
          v36 = 1;
          v35 = (id)objc_msgSend(v22, "stringWithFormat:");
          v34 = 1;
          obj = v35;
        }
        else
        {
          v20 = (void *)MEMORY[0x24BDD17C8];
          v19 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = v19;
          v32 = 1;
          if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v46, "isAppleAccountFeatureFlagOn"))
          {
            v3 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_PROMPT");
          }
          else
          {
            v3 = CFSTR("BETA_UPDATES_APPLE_ID_PROMPT");
          }
          v31 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", v3, &stru_24E0011F0, CFSTR("Software Update"));
          v30 = 1;
          v29 = (id)objc_msgSend(v20, "stringWithFormat:");
          v28 = 1;
          obj = v29;
        }
        objc_storeStrong(&v40, obj);
        if ((v28 & 1) != 0)

        if ((v30 & 1) != 0)
        if ((v32 & 1) != 0)

        if ((v34 & 1) != 0)
        if ((v36 & 1) != 0)

        if ((v38 & 1) != 0)
      }
      else if (v41)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v46, "isAppleAccountFeatureFlagOn"))
          v4 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_PREFIX");
        else
          v4 = CFSTR("BETA_UPDATES_APPLE_ID_PREFIX");
        v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", v4, &stru_24E0011F0, CFSTR("Software Update"));
        v5 = (id)objc_msgSend(v16, "stringWithFormat:", v41);
        v6 = v40;
        v40 = v5;

      }
      else
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        v15 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v46, "isAppleAccountFeatureFlagOn"))
          v7 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_PROMPT");
        else
          v7 = CFSTR("BETA_UPDATES_APPLE_ID_PROMPT");
        v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", v7, &stru_24E0011F0, CFSTR("Software Update"));
        v8 = (id)objc_msgSend(v13, "stringWithFormat:");
        v9 = v40;
        v40 = v8;

      }
      v10 = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v40, v46, 0, 0, 0, 13, 0);
      appleIDSpecifier = v46->_appleIDSpecifier;
      v46->_appleIDSpecifier = v10;

      -[PSSpecifier setProperty:forKey:](v46->_appleIDSpecifier, "setProperty:forKey:", CFSTR("BETA_PROGRAMS_APPLE_ID"), *MEMORY[0x24BE75AC0]);
      v47 = v46->_appleIDSpecifier;
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
    }
  }
  return v47;
}

- (void)setupProgramsGroupSpecifier
{
  PSSpecifier *v2;
  id v3;
  PSSpecifier *v4;
  BOOL v5;

  v2 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](self, "programsGroup");
  v5 = v2 != 0;

  if (!v5)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BETA_PROGRAMS_LIST_GROUP"));
    -[SUSUISoftwareUpdateBetaUpdatesController setProgramsGroup:](self, "setProgramsGroup:");

    v4 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](self, "programsGroup");
    -[PSSpecifier setProperty:forKey:](v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);

  }
}

- (void)updateFooter
{
  NSUInteger v2;
  objc_class *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  PSSpecifier *v14;
  PSSpecifier *v15;
  NSString *v16;
  PSSpecifier *v17;
  PSSpecifier *v18;
  NSRange v19;
  id v20[2];
  SUSUISoftwareUpdateBetaUpdatesController *v21;

  v21 = self;
  v20[1] = (id)a2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BETA_UPDATES_FOOTER"));
  v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:");
  v20[0] = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

  v10 = v20[0];
  v12 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_LINK"), &stru_24E0011F0, CFSTR("Software Update"));
  v19.location = objc_msgSend(v10, "rangeOfString:");
  v19.length = v2;

  v14 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v21, "programsGroup");
  v3 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v3);
  -[PSSpecifier setProperty:forKey:](v14, "setProperty:forKey:");

  v15 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v21, "programsGroup");
  -[PSSpecifier setProperty:forKey:](v15, "setProperty:forKey:", v20[0], *MEMORY[0x24BE75A58]);

  v17 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v21, "programsGroup");
  v16 = NSStringFromRange(v19);
  -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:");

  v18 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v21, "programsGroup");
  -[PSSpecifier setProperty:forKey:](v18, "setProperty:forKey:", CFSTR("https://beta.apple.com/"), *MEMORY[0x24BE75A60]);

  objc_storeStrong(v20, 0);
}

- (void)setupProgramListSpecifiers
{
  id v2;
  id v3;
  id v4;
  const __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  PSSpecifier *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  NSObject *log;
  os_log_type_t v18;
  __CFString *v19;
  id v20;
  uint64_t v21;
  PSSpecifier *v22;
  int v23;
  PSSpecifier *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  os_log_t v32;
  id v33;
  BOOL v34;
  _QWORD __b[8];
  id v36;
  __CFString *v37;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v40;
  uint64_t v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50[2];
  SUSUISoftwareUpdateBetaUpdatesController *v51;
  uint8_t v52[16];
  _BYTE v53[128];
  uint8_t v54[40];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v51 = self;
  v50[1] = (id)a2;
  -[SUSUISoftwareUpdateBetaUpdatesController setMismatchedSpecifier:](self, "setMismatchedSpecifier:");
  v25 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v51, "updateController");
  v50[0] = (id)objc_msgSend(v25, "availableBetaPrograms");

  v49 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v50[0], "count") + 2);
  v26 = (void *)MEMORY[0x24BE75590];
  v28 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24E0011F0, CFSTR("Software Update"));
  v48 = (id)objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  objc_msgSend(v48, "setProperty:forKey:", CFSTR("BETA_PROGRAMS_OFF_SELECTION"), *MEMORY[0x24BE75AC0]);
  v29 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v51, "updateController");
  v47 = (id)objc_msgSend(v29, "enrolledBetaProgram");

  v30 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v51, "updateController");
  v2 = (id)objc_msgSend(v30, "enrolledBetaProgram");
  v31 = v2 != 0;

  if (!v31)
  {
    v24 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v51, "programsGroup");
    -[PSSpecifier setProperty:forKey:](v24, "setProperty:forKey:", v48, *MEMORY[0x24BE75C20]);

  }
  objc_msgSend(v49, "addObject:", v48);
  v45 = 0;
  v43 = 0;
  LOBYTE(v23) = 0;
  if (v47)
  {
    v46 = (id)objc_msgSend(v50[0], "valueForKey:", CFSTR("programID"));
    v45 = 1;
    v44 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v47, "programID"));
    v43 = 1;
    v23 = objc_msgSend(v46, "containsObject:") ^ 1;
  }
  if ((v43 & 1) != 0)

  if ((v45 & 1) != 0)
  if ((v23 & 1) != 0)
  {
    v42 = -[SUSUISoftwareUpdateBetaUpdatesController _specifierForBetaProgram:rowIdentifier:](v51, "_specifierForBetaProgram:rowIdentifier:", v47, CFSTR("BETA_PROGRAMS_UNAVAILABLE_PROGRAM"));
    objc_msgSend(v49, "addObject:", v42);
    v22 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v51, "programsGroup");
    -[PSSpecifier setProperty:forKey:](v22, "setProperty:forKey:", v42, *MEMORY[0x24BE75C20]);

    -[SUSUISoftwareUpdateBetaUpdatesController setMismatchedSpecifier:](v51, "setMismatchedSpecifier:", v42);
    objc_storeStrong(&v42, 0);
  }
  v20 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v51, "updateController");
  v21 = objc_msgSend(v20, "betaUpdatesHasInstallationRestriction");

  v41 = v21;
  v40 = v21 == 0;
  oslog = (os_log_t)_SUSUILoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v18 = type;
    v19 = SUBetaUpdatesRestrictionToString(v41);
    v37 = v19;
    __os_log_helper_16_2_3_8_32_8_64_8_0((uint64_t)v54, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController setupProgramListSpecifiers]", (uint64_t)v37, v41);
    _os_log_impl(&dword_21BF33000, log, v18, "%s: Beta program restriction type: %@ (%ld)", v54, 0x20u);

    objc_storeStrong((id *)&v37, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  obj = v50[0];
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
  if (v16)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v16;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(obj);
      v36 = *(id *)(__b[1] + 8 * v13);
      v3 = (id)objc_msgSend(v36, "title");
      v10 = v3 != 0;

      if (v10)
      {
        v34 = 0;
        v9 = objc_msgSend(v47, "programID");
        v34 = v9 == objc_msgSend(v36, "programID");
        v33 = -[SUSUISoftwareUpdateBetaUpdatesController _specifierForBetaProgram:rowIdentifier:](v51, "_specifierForBetaProgram:rowIdentifier:", v36, 0);
        if (v34)
        {
          v8 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v51, "programsGroup");
          -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v33, *MEMORY[0x24BE75C20]);

          objc_msgSend(v49, "addObject:", v33);
        }
        else if (v40)
        {
          objc_msgSend(v49, "addObject:", v33);
        }
        else
        {
          v32 = (os_log_t)_SUSUILoggingFacility();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v6 = v32;
            v7 = (__CFString *)(id)objc_msgSend(v36, "title");
            if (v7)
              v5 = v7;
            else
              v5 = CFSTR("(null))");
            __os_log_helper_16_2_1_8_66((uint64_t)v52, (uint64_t)v5);
            _os_log_impl(&dword_21BF33000, v6, OS_LOG_TYPE_DEFAULT, "Skipping adding %{public}@ to program list", v52, 0xCu);

          }
          objc_storeStrong((id *)&v32, 0);
        }
        objc_storeStrong(&v33, 0);
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
        if (!v14)
          break;
      }
    }
  }

  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v49);
  -[SUSUISoftwareUpdateBetaUpdatesController setProgramsList:](v51, "setProgramsList:");

  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(v50, 0);
}

- (id)_specifierForBetaProgram:(id)a3 rowIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v8 = (void *)MEMORY[0x24BE75590];
  v9 = (id)objc_msgSend(location[0], "title");
  v11 = (id)objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  if (v12)
  {
    objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x24BE75AC0]);
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(location[0], "programID"));
    v10 = (id)objc_msgSend(v6, "stringValue");

    objc_msgSend(v11, "setUserInfo:", location[0]);
    objc_msgSend(v11, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC0]);
    objc_storeStrong(&v10, 0);
  }
  objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)updateController
{
  return (id)-[SUSUISoftwareUpdateBetaUpdatesController parentController](self, "parentController", a2, self);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v4;
  PSSpecifier *v5;
  id v6;
  int v7;
  PSSpecifier *v8;
  BOOL v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  PSSpecifier *v13;
  NSObject *log;
  os_log_type_t type;
  os_log_t oslog;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  uint8_t v23[15];
  os_log_type_t v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  SUSUISoftwareUpdateBetaUpdatesController *v31;
  uint8_t v32[7];
  os_log_type_t v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  id v38;
  id location[2];
  SUSUISoftwareUpdateBetaUpdatesController *v40;
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37.receiver = v40;
  v37.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  -[SUSUISoftwareUpdateBetaUpdatesController tableView:didSelectRowAtIndexPath:](&v37, sel_tableView_didSelectRowAtIndexPath_, location[0], v38);
  v36 = (id)-[SUSUISoftwareUpdateBetaUpdatesController specifierAtIndexPath:](v40, "specifierAtIndexPath:", v38);
  v35 = (id)objc_msgSend(v36, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BETA_PROGRAMS_OFF_SELECTION")) & 1) != 0)
  {
    v34 = _SUSUILoggingFacility();
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      log = v34;
      type = v33;
      __os_log_helper_16_0_0(v32);
      _os_log_impl(&dword_21BF33000, log, type, "Unenrolling from beta updates", v32, 2u);
    }
    objc_storeStrong(&v34, 0);
    v12 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v40, "updateController");
    v26 = MEMORY[0x24BDAC760];
    v27 = -1073741824;
    v28 = 0;
    v29 = __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke;
    v30 = &unk_24DFF8008;
    v31 = v40;
    objc_msgSend(v12, "unenrollFromBetaProgramsWithCompletion:", &v26);

    v13 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v40, "programsGroup");
    -[PSSpecifier setProperty:forKey:](v13, "setProperty:forKey:", v36, *MEMORY[0x24BE75C20]);

    objc_storeStrong((id *)&v31, 0);
  }
  else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BETA_PROGRAMS_APPLE_ID")) & 1) != 0)
  {
    v25 = _SUSUILoggingFacility();
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v25;
      v11 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_21BF33000, v10, v11, "Switch Beta Apple ID button tapped.", v23, 2u);
    }
    objc_storeStrong(&v25, 0);
    v8 = -[SUSUISoftwareUpdateBetaUpdatesController mismatchedSpecifier](v40, "mismatchedSpecifier");
    v21 = 0;
    v19 = 0;
    v9 = 1;
    if (!v8)
    {
      v22 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
      v21 = 1;
      v20 = (id)objc_msgSend(v22, "seedingAppleIDUsernameForCurrentDevice");
      v19 = 1;
      v9 = v20 == 0;
    }
    if ((v19 & 1) != 0)

    if ((v21 & 1) != 0)
    if (v9)
      -[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController](v40, "presentAuthKitController");
    else
      -[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog](v40, "presentAuthenticationDialog");
  }
  else
  {
    v6 = (id)objc_msgSend(v36, "userInfo");
    objc_opt_class();
    LOBYTE(v7) = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v35, "isEqualToString:", CFSTR("BETA_PROGRAMS_UNAVAILABLE_PROGRAM")) ^ 1;

    if ((v7 & 1) != 0)
    {
      v18 = (id)objc_msgSend(v36, "userInfo");
      oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v41, objc_msgSend(v18, "programID"));
        _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "Enrolling in program %ld", v41, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = -[SUSUISoftwareUpdateBetaUpdatesController updateController](v40, "updateController");
      objc_msgSend(v4, "setBetaProgramFromUI:forSpecifier:", v18, v36);

      v5 = -[SUSUISoftwareUpdateBetaUpdatesController programsGroup](v40, "programsGroup");
      -[PSSpecifier setProperty:forKey:](v5, "setProperty:forKey:", v36, *MEMORY[0x24BE75C20]);

      -[SUSUISoftwareUpdateBetaUpdatesController reloadSpecifiers](v40, "reloadSpecifiers");
      objc_storeStrong(&v18, 0);
    }
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __78__SUSUISoftwareUpdateBetaUpdatesController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  objc_super v17;
  id v18;
  id v19;
  id location[2];
  SUSUISoftwareUpdateBetaUpdatesController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v17.receiver = v21;
  v17.super_class = (Class)SUSUISoftwareUpdateBetaUpdatesController;
  v18 = -[SUSUISoftwareUpdateBetaUpdatesController tableView:cellForRowAtIndexPath:](&v17, sel_tableView_cellForRowAtIndexPath_, location[0], v19);
  v16 = (id)-[SUSUISoftwareUpdateBetaUpdatesController specifierAtIndexPath:](v21, "specifierAtIndexPath:", v19);
  v15 = (id)objc_msgSend(v16, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BETA_PROGRAMS_NOTICE")) & 1) != 0)
  {
    v14 = v18;
    v6 = (id)objc_msgSend(v14, "detailTextLabel");
    objc_msgSend(v6, "setNumberOfLines:", 0);

    v10 = (id)objc_msgSend(v14, "imageView");
    v7 = (void *)MEMORY[0x24BEBD640];
    v9 = (id)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
    v8 = (id)objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"));
    objc_msgSend(v10, "setImage:");

    v12 = (id)objc_msgSend(v14, "imageView");
    v11 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    objc_msgSend(v12, "setTintColor:");

    objc_storeStrong(&v14, 0);
  }
  v5 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)presentAuthenticationDialog
{
  const __CFString *v2;
  id v3;
  id v4;
  const __CFString *v5;
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  char v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  void (*v46)(id *, void *);
  void *v47;
  SUSUISoftwareUpdateBetaUpdatesController *v48;
  id v49;
  char v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  int v63;
  int v64;
  void (*v65)(id *, void *);
  void *v66;
  id v67;
  id v68;
  id v69;
  char v70;
  id v71;
  id location[2];
  SUSUISoftwareUpdateBetaUpdatesController *v73;

  v73 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v42 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v71 = (id)objc_msgSend(v42, "seedingAppleIDUsernameForCurrentDevice");

  v40 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v41 = objc_msgSend(v40, "isCurrentDeviceUsingSeedingAppleID");

  v70 = v41 & 1;
  v69 = 0;
  if (v71)
  {
    v36 = (void *)MEMORY[0x24BDD17C8];
    v35 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v73, "isAppleAccountFeatureFlagOn"))
      v5 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_ALERT_MESSAGE");
    else
      v5 = CFSTR("BETA_UPDATES_APPLE_ID_AUTHENTICATION_ALERT_MESSAGE");
    v34 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:", v5, &stru_24E0011F0, CFSTR("Software Update"));
    v6 = (id)objc_msgSend(v36, "stringWithFormat:", v71);
    v7 = v69;
    v69 = v6;

  }
  else
  {
    v39 = (void *)MEMORY[0x24BDD17C8];
    v38 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v73, "isAppleAccountFeatureFlagOn"))
      v2 = CFSTR("BETA_UPDATES_AUTHENTICATION_NO_APPLE_ACCOUNT_MESSAGE");
    else
      v2 = CFSTR("BETA_UPDATES_AUTHENTICATION_NO_APPLE_ID_MESSAGE");
    v37 = (id)objc_msgSend(v38, "localizedStringForKey:value:table:", v2, &stru_24E0011F0, CFSTR("Software Update"));
    v3 = (id)objc_msgSend(v39, "stringWithFormat:");
    v4 = v69;
    v69 = v3;

  }
  v32 = (void *)MEMORY[0x24BEBD3B0];
  v33 = (void *)MEMORY[0x24BDD17C8];
  v31 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v73, "isAppleAccountFeatureFlagOn"))
    v8 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_TITLE");
  else
    v8 = CFSTR("BETA_UPDATES_APPLE_ID_AUTHENTICATION_TITLE");
  v30 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:", v8, &stru_24E0011F0, CFSTR("Software Update"));
  v29 = (id)objc_msgSend(v33, "stringWithFormat:");
  v68 = (id)objc_msgSend(v32, "alertControllerWithTitle:message:preferredStyle:");

  v26 = v68;
  v27 = (void *)MEMORY[0x24BEBD3A8];
  v28 = (void *)MEMORY[0x24BDD17C8];
  v25 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v73, "isAppleAccountFeatureFlagOn"))
    v9 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_MISMATCH_PROMPT");
  else
    v9 = CFSTR("BETA_UPDATES_APPLE_ID_MISMATCH_PROMPT");
  v24 = (id)objc_msgSend(v25, "localizedStringForKey:value:table:", v9, &stru_24E0011F0, CFSTR("Software Update"));
  v23 = (id)objc_msgSend(v28, "stringWithFormat:");
  v62 = MEMORY[0x24BDAC760];
  v63 = -1073741824;
  v64 = 0;
  v65 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke;
  v66 = &unk_24DFF9858;
  objc_copyWeak(&v67, location);
  v22 = (id)objc_msgSend(v27, "actionWithTitle:style:handler:", v23, 0, &v62);
  objc_msgSend(v26, "addAction:");

  if ((v70 & 1) != 0)
  {
    v21 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
    v61 = (id)objc_msgSend(v21, "deviceAppleIDUsernameForCurrentDevice");

    v58 = 0;
    v56 = 0;
    v54 = 0;
    v52 = 0;
    v50 = 0;
    if (v61)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      v59 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v58 = 1;
      v57 = (id)objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("BETA_UPDATES_SIGN_OUT_APPLE_ACCOUNT"), &stru_24E0011F0, CFSTR("Software Update"));
      v56 = 1;
      v55 = (id)objc_msgSend(v20, "stringWithFormat:", v61);
      v54 = 1;
      v10 = v55;
    }
    else
    {
      v53 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v52 = 1;
      v51 = (id)objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("BETA_UPDATES_SIGN_OUT"), &stru_24E0011F0, CFSTR("Software Update"));
      v50 = 1;
      v10 = v51;
    }
    v60 = v10;
    if ((v50 & 1) != 0)

    if ((v52 & 1) != 0)
    if ((v54 & 1) != 0)

    if ((v56 & 1) != 0)
    if ((v58 & 1) != 0)

    v17 = v68;
    v19 = (void *)MEMORY[0x24BEBD3A8];
    v18 = v60;
    v43 = MEMORY[0x24BDAC760];
    v44 = -1073741824;
    v45 = 0;
    v46 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_278;
    v47 = &unk_24DFF98D0;
    objc_copyWeak(&v49, location);
    v48 = v73;
    v16 = (id)objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 0, &v43);
    objc_msgSend(v17, "addAction:");

    objc_storeStrong((id *)&v48, 0);
    objc_destroyWeak(&v49);
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v61, 0);
  }
  v14 = v68;
  v15 = (void *)MEMORY[0x24BEBD3A8];
  v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E0011F0, CFSTR("Software Update"));
  v11 = (id)objc_msgSend(v15, "actionWithTitle:style:handler:");
  objc_msgSend(v14, "addAction:");

  -[SUSUISoftwareUpdateBetaUpdatesController presentViewController:animated:completion:](v73, "presentViewController:animated:completion:", v68, 1, 0);
  objc_destroyWeak(&v67);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v71, 0);
  objc_destroyWeak(location);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke(id *a1, void *a2)
{
  os_log_t oslog;
  id v4[2];
  id location[2];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke");
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Asked to use a different account.", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(v4[0], "presentAuthKitController");
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_278(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  id v9;
  id v10;
  id v11[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  v11[0] = objc_loadWeakRetained(a1 + 5);
  v3 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_2;
  v8 = &unk_24DFF98A8;
  v9 = v11[0];
  v10 = a1[4];
  objc_msgSend(v3, "deleteSeedingAppleAccountForCurrentDeviceWithCompletion:");

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_2(id *a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, void *, void *);
  void *v9;
  id v10;
  os_log_type_t v11;
  id v12[2];
  id location[2];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  if (location[0])
  {
    v12[0] = _SUSUILoggingFacility();
    v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke_2", (uint64_t)location[0]);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v12[0], v11, "%s: Failed to delete seeding data. Error: %{public}@.", v14, 0x16u);
    }
    objc_storeStrong(v12, 0);
  }
  v3 = (id)objc_msgSend(a1[4], "updateController");
  v2 = (id)objc_msgSend(v3, "manager");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_279;
  v9 = &unk_24DFF9880;
  v10 = a1[5];
  objc_msgSend(v2, "refreshBetaUpdates:", &v5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_279(NSObject *a1, void *a2, void *a3)
{
  os_log_t oslog[2];
  id v6;
  id location[2];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthenticationDialog]_block_invoke", (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Beta Updates have been refreshed. Error: %{public}@.", v8, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[objc_class reloadSpecifiers](a1[4].isa, "reloadSpecifiers");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateBetaUpdatesController_presentAuthenticationDialog__block_invoke_284(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0);
}

- (void)presentAuthKitController
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *, void *, void *);
  void *v19;
  SUSUISoftwareUpdateBetaUpdatesController *v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  SUSUISoftwareUpdateBetaUpdatesController *v25;

  v25 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v23 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v23, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v23, "setAuthenticationType:", 2);
  objc_msgSend(v23, "setPresentingViewController:", v25);
  objc_msgSend(v23, "setIsEphemeral:", 0);
  v14 = (void *)MEMORY[0x24BDD17C8];
  v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v25, "isAppleAccountFeatureFlagOn"))
    v2 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_TITLE");
  else
    v2 = CFSTR("BETA_UPDATES_APPLE_ID_AUTHENTICATION_TITLE");
  v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", v2, &stru_24E0011F0, CFSTR("Software Update"));
  v11 = (id)objc_msgSend(v14, "stringWithFormat:");
  objc_msgSend(v23, "setTitle:");

  v10 = (void *)MEMORY[0x24BDD17C8];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (-[SUSUISoftwareUpdateBetaUpdatesController isAppleAccountFeatureFlagOn](v25, "isAppleAccountFeatureFlagOn"))
    v3 = CFSTR("BETA_UPDATES_APPLE_ACCOUNT_AUTHENTICATION_PROMPT");
  else
    v3 = CFSTR("BETA_UPDATES_APPLE_ID_AUTHENTICATION_PROMPT");
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", v3, &stru_24E0011F0, CFSTR("Software Update"));
  v7 = (id)objc_msgSend(v10, "stringWithFormat:");
  objc_msgSend(v23, "setReason:");

  v6 = objc_alloc(MEMORY[0x24BE0ACC0]);
  v22 = (id)objc_msgSend(v6, "initWithIdentifier:", *MEMORY[0x24BE85348]);
  v5 = v22;
  v4 = v23;
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke;
  v19 = &unk_24DFF9918;
  objc_copyWeak(&v21, location);
  v20 = v25;
  objc_msgSend(v5, "authenticateWithContext:completion:", v4, &v15);
  objc_storeStrong((id *)&v20, 0);
  objc_destroyWeak(&v21);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_destroyWeak(location);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  id v4;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *);
  void *v11;
  id v12;
  id v13;
  id v14;
  os_log_type_t v15;
  id v16;
  int v17;
  os_log_type_t v18;
  id v19;
  id v20[2];
  id v21;
  id location[2];
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 5);
  objc_storeStrong((id *)a1[4] + 175, 0);
  if (v21)
  {
    v19 = _SUSUILoggingFacility();
    v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v24, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v21);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v19, v18, "%s: Beta Updates failed to log in: %{public}@", v24, 0x16u);
    }
    objc_storeStrong(&v19, 0);
    v17 = 1;
  }
  else
  {
    v16 = _SUSUILoggingFacility();
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v23, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke");
      _os_log_impl(&dword_21BF33000, (os_log_t)v16, v15, "%s: Beta Updates successfully log in", v23, 0xCu);
    }
    objc_storeStrong(&v16, 0);
    v14 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
    v4 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
    v3 = v14;
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_291;
    v11 = &unk_24DFF98A8;
    v12 = v20[0];
    v13 = a1[4];
    objc_msgSend(v4, "saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:completion:", v3, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v14, 0);
    v17 = 0;
  }
  objc_storeStrong(v20, 0);
  if (!v17)
    v17 = 0;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_291(id *a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(NSObject *, void *, void *);
  void *v10;
  id v11;
  os_log_type_t v12;
  id v13[2];
  id location[2];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  if (location[0])
  {
    v13[0] = _SUSUILoggingFacility();
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_ERROR))
    {
      v4 = (id)objc_msgSend(location[0], "description");
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v4);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v13[0], v12, "%s: Failed to save new Apple ID to seeding: %@", v15, 0x16u);

    }
    objc_storeStrong(v13, 0);
  }
  v3 = (id)objc_msgSend(a1[4], "updateController");
  v2 = (id)objc_msgSend(v3, "manager");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_292;
  v10 = &unk_24DFF9880;
  v11 = a1[5];
  objc_msgSend(v2, "refreshBetaUpdates:", &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateBetaUpdatesController_presentAuthKitController__block_invoke_292(NSObject *a1, void *a2, void *a3)
{
  os_log_t oslog[2];
  id v6;
  id location[2];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateBetaUpdatesController presentAuthKitController]_block_invoke", (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Beta Updates have been refreshed. Error: %{public}@.", v8, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[objc_class reloadSpecifiers](a1[4].isa, "reloadSpecifiers");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (PSSpecifier)programsGroup
{
  return self->_programsGroup;
}

- (void)setProgramsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_programsGroup, a3);
}

- (NSArray)programsList
{
  return self->_programsList;
}

- (void)setProgramsList:(id)a3
{
  objc_storeStrong((id *)&self->_programsList, a3);
}

- (void)setAppleIDGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDGroupSpecifier, a3);
}

- (void)setAppleIDSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDSpecifier, a3);
}

- (void)setUnavailableProgramNoticeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableProgramNoticeSpecifier, a3);
}

- (NSString)appleAccountServiceName
{
  return self->_appleAccountServiceName;
}

- (void)setAppleAccountServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountServiceName, a3);
}

- (PSSpecifier)mismatchedSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_mismatchedSpecifier);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mismatchedSpecifier);
  objc_storeStrong((id *)&self->_appleAccountServiceName, 0);
  objc_storeStrong((id *)&self->_unavailableProgramNoticeSpecifier, 0);
  objc_storeStrong((id *)&self->_appleIDSpecifier, 0);
  objc_storeStrong((id *)&self->_appleIDGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_programsList, 0);
  objc_storeStrong((id *)&self->_programsGroup, 0);
}

@end
