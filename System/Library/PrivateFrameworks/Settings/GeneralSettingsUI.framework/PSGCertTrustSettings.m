@implementation PSGCertTrustSettings

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)PSGCertTrustSettings;
  -[PSGCertTrustSettings viewWillAppear:](&v21, sel_viewWillAppear_, a3);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __39__PSGCertTrustSettings_viewWillAppear___block_invoke;
  v18 = &unk_24F9C81B0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BE63B78], 0, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCertTrustSettings setProfileListChangedNotificationObserver:](self, "setProfileListChangedNotificationObserver:", v6, v15, v16, v17, v18);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/About"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("ABOUT"), CFSTR("General"), v9, v11);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCertTrustSettings pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.about-current-device"), v12, v14, v7);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __39__PSGCertTrustSettings_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSGCertTrustSettings;
  -[PSGCertTrustSettings viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCertTrustSettings profileListChangedNotificationObserver](self, "profileListChangedNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", v5);

  -[PSGCertTrustSettings setProfileListChangedNotificationObserver:](self, "setProfileListChangedNotificationObserver:", 0);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSRange v35;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "lockedDownRootCertificatesWithOutLocalizedSourceDescription:", &v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    objc_msgSend(v9, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);
    objc_msgSend(v5, "addObject:", v9);
    v10 = v9;
    PSG_BundleForGeneralSettingsUIFramework();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", &stru_24F9C95C8, &stru_24F9C95C8, 0);

    PSG_BundleForGeneralSettingsUIFramework();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRUST_STORE_VERSION"), &stru_24F9C95C8, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v14;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_trustVersionString_, 0, 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v15, "setProperty:forKey:", CFSTR("TRUST_STORE_VERSION"), *MEMORY[0x24BE75AC0]);
    v31 = v15;
    objc_msgSend(v5, "addObject:", v15);
    v17 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForGeneral(CFSTR("TRUST_ASSET_VERSION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, sel_trustAssetVersionString_, 0, 4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    objc_msgSend(v19, "setProperty:forKey:", CFSTR("TRUST_ASSET_VERSION"), v16);
    objc_msgSend(v5, "addObject:", v19);
    SecTrustStoreForDomain();
    SecTrustStoreCopyAll();
    PSG_LocalizedStringForGeneral(CFSTR("TRUST_STORE_ABOUT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v23, *MEMORY[0x24BE75A30]);

    objc_msgSend(v10, "setProperty:forKey:", v21, *MEMORY[0x24BE75A58]);
    v35.length = objc_msgSend(v21, "length");
    v35.location = 0;
    NSStringFromRange(v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v24, *MEMORY[0x24BE75A40]);

    v25 = (void *)MEMORY[0x24BDBCF48];
    PSG_LocalizedStringForGeneral(CFSTR("TRUST_STORE_URL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v27, *MEMORY[0x24BE75A60]);

    v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
    v29 = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)isFullTrustEnabled:(id)a3
{
  objc_msgSend(a3, "propertyForKey:", CFSTR("certName"));
  SecTrustStoreForDomain();
  SecTrustStoreCopyUsageConstraints();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFullTrustEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
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
  SecPolicyRef SSL;
  SecPolicyRef v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  PSGCertTrustSettings *v29;
  id v30;
  _QWORD v31[5];
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "propertyForKey:", CFSTR("certName"));
  v9 = objc_msgSend(v7, "intValue");

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BEBD3B0];
    PSG_LocalizedStringForGeneral(CFSTR("ROOT_CERTIFICATE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForGeneral(CFSTR("ROOT_CERTIFICATE_MESSAGE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForGeneral(CFSTR("CONTINUE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke;
    v31[3] = &__block_descriptor_40_e23_v16__0__UIAlertAction_8l;
    v31[4] = v8;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v17);

    v18 = (void *)MEMORY[0x24BEBD3A8];
    PSG_LocalizedStringForGeneral(CFSTR("CANCEL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v16;
    v26 = 3221225472;
    v27 = __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke_2;
    v28 = &unk_24F9C7E20;
    v29 = self;
    v30 = v6;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v20, v25, v26, v27, v28, v29);

    -[PSGCertTrustSettings presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
LABEL_5:

    goto LABEL_6;
  }
  SSL = SecPolicyCreateSSL(1u, 0);
  if (SSL)
  {
    v22 = SSL;
    v34[0] = CFSTR("kSecTrustSettingsPolicy");
    v34[1] = CFSTR("kSecTrustSettingsResult");
    v35[0] = SSL;
    v35[1] = &unk_24F9D4320;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    v32 = CFSTR("kSecTrustSettingsResult");
    v33 = &unk_24F9D4338;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    SecTrustStoreForDomain();
    SecTrustStoreSetTrustSettings();
    CFRelease(v22);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke()
{
  SecTrustStoreForDomain();
  return SecTrustStoreSetTrustSettings();
}

uint64_t __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (id)specifierForTrustSettings:(__SecCertificate *)a3 isRestricted:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v7 = (void *)SecCertificateCopyCommonNames();
  if (objc_msgSend(v7, "count") && (objc_msgSend(v7, "firstObject"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setFullTrustEnabled_forSpecifier_, sel_isFullTrustEnabled_, 0, 6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", a3, CFSTR("certName"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)trustVersionString:(id)a3
{
  if (SecTrustStoreGetSettingsVersionNumber())
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)trustAssetVersionString:(id)a3
{
  if (SecTrustStoreGetSettingsAssetVersionNumber())
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)profileListChangedNotificationObserver
{
  return self->_profileListChangedNotificationObserver;
}

- (void)setProfileListChangedNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_profileListChangedNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_profileListChangedNotificationObserver, 0);
}

@end
