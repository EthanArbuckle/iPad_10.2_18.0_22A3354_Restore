@implementation DBSReferenceAndCalibrationController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DBSReferenceAndCalibrationController;
  -[DBSReferenceAndCalibrationController viewDidLoad](&v4, sel_viewDidLoad);
  DBS_LocalizedStringForDisplays(CFSTR("ADVANCED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSReferenceAndCalibrationController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DBSReferenceAndCalibrationController;
  -[DBSReferenceAndCalibrationController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *proModeSwitchSpecifier;
  uint64_t v12;
  void *v13;
  void *v14;
  PSSpecifier *v15;
  PSSpecifier *fineTuneSpecifier;
  void *v17;
  void *v18;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADVANCED_DETAIL_GROUP_ID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForDisplays(CFSTR("PRO_MODE_FOOTER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v6);
    v8 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDisplays(CFSTR("PRO_MODE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setProModeEnabled_forSpecifier_, sel_getProModeEnabled_, 0, 6, 0);
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    proModeSwitchSpecifier = self->_proModeSwitchSpecifier;
    self->_proModeSwitchSpecifier = v10;

    v12 = *MEMORY[0x24BE75AC0];
    -[PSSpecifier setObject:forKeyedSubscript:](self->_proModeSwitchSpecifier, "setObject:forKeyedSubscript:", CFSTR("PRO_MODE_SWITCH"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v5, "addObject:", self->_proModeSwitchSpecifier);
    v13 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDisplays(CFSTR("FINE_TUNE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 2, 0);
    v15 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    fineTuneSpecifier = self->_fineTuneSpecifier;
    self->_fineTuneSpecifier = v15;

    -[PSSpecifier setButtonAction:](self->_fineTuneSpecifier, "setButtonAction:", sel_presentModalFineTuneController);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_fineTuneSpecifier, "setObject:forKeyedSubscript:", CFSTR("FINE_TUNE"), v12);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_fineTuneSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    -[DBSReferenceAndCalibrationController getProModeEnabled](self, "getProModeEnabled");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v17, "BOOLValue");

    if ((_DWORD)v13)
      objc_msgSend(v5, "addObject:", self->_fineTuneSpecifier);
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)presentModalFineTuneController
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BE75588]);
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v7, "setSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
  objc_msgSend(v7, "setParentController:", self);
  objc_msgSend(v7, "setupController");
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[DBSReferenceAndCalibrationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)getProModeEnabled
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setProModeEnabled:(id)a3 forSpecifier:(id)a4
{
  -[DBSReferenceAndCalibrationController setProModeEnabled:](self, "setProModeEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (void)setProModeEnabled:(BOOL)a3
{
  int v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PSSpecifier *fineTuneSpecifier;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReference");

  if (v6 != v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availablePresets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "isReference") == v3)
          {
            objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setCurrentPreset:", v13);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    fineTuneSpecifier = self->_fineTuneSpecifier;
    if (v3)
      -[DBSReferenceAndCalibrationController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", fineTuneSpecifier, self->_proModeSwitchSpecifier, 1);
    else
      -[DBSReferenceAndCalibrationController removeSpecifier:animated:](self, "removeSpecifier:animated:", fineTuneSpecifier, 1);
  }
}

- (PSSpecifier)proModeSwitchSpecifier
{
  return self->_proModeSwitchSpecifier;
}

- (PSSpecifier)fineTuneSpecifier
{
  return self->_fineTuneSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineTuneSpecifier, 0);
  objc_storeStrong((id *)&self->_proModeSwitchSpecifier, 0);
}

@end
