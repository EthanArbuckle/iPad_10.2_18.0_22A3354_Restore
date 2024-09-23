@implementation STDrillInItemInfoGroupSpecifierProvider

- (STDrillInItemInfoGroupSpecifierProvider)initWithUsageItem:(id)a3
{
  id v6;
  unint64_t v7;
  void *v9;
  STDrillInItemInfoGroupSpecifierProvider *v10;
  STDrillInItemInfoGroupSpecifierProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PSSpecifier *appIconSpecifier;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  PSSpecifier *ageRatingSpecifier;
  void *v34;
  uint64_t v35;
  PSSpecifier *developerSpecifier;
  void *v37;
  void *v38;
  void *v39;
  char v41;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "itemType");
  if (v7 > 6 || ((1 << v7) & 0x54) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STDrillInItemInfoGroupSpecifierProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(itemType == STUsageItemTypeApp) || (itemType == STUsageItemTypeWebsite) || (itemType == STUsageItemTypePickups)"));

  }
  v42.receiver = self;
  v42.super_class = (Class)STDrillInItemInfoGroupSpecifierProvider;
  v10 = -[STGroupSpecifierProvider init](&v42, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_usageItem, a3);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MostUsedAppInfoGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "groupSpecifierWithName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "usageTrusted") & 1) != 0)
      goto LABEL_18;
    v16 = objc_msgSend(v6, "itemType");
    v17 = 0;
    if (v16 <= 6)
    {
      if (((1 << v16) & 0x64) != 0)
      {
        v19 = CFSTR("UntrustedApplicationFooterFormat");
      }
      else
      {
        if (((1 << v16) & 0xA) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("STDrillInItemInfoGroupSpecifierProvider.m"), 49, CFSTR("All screen time and category usage is trusted."));

          v17 = 0;
          goto LABEL_17;
        }
        if (v16 != 4)
          goto LABEL_17;
        v19 = CFSTR("UntrustedWebsiteFooterTextFormat");
      }
      objc_msgSend(v12, "localizedStringForKey:value:table:", v19, &stru_24DB8A1D0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE75A68]);

LABEL_18:
    -[STGroupSpecifierProvider setGroupSpecifier:](v11, "setGroupSpecifier:", v15);
    v23 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v6, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, v11, 0, sel_usageItem_, 0, -1, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    appIconSpecifier = v11->_appIconSpecifier;
    v11->_appIconSpecifier = (PSSpecifier *)v25;

    -[PSSpecifier setObject:forKeyedSubscript:](v11->_appIconSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[PSSpecifier setObject:forKeyedSubscript:](v11->_appIconSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    -[STGroupSpecifierProvider mutableSpecifiers](v11, "mutableSpecifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v11->_appIconSpecifier);
    objc_msgSend(v6, "categoryIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v6, "categoryIdentifier");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE157E0]) & 1) != 0
        || (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE157D0]) & 1) != 0)
      {

      }
      else
      {
        v41 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE157D8]);

        if ((v41 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MostUsedAppCategorySpecifierName"), &stru_24DB8A1D0, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, v11, 0, sel_category_, 0, 4, 0);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v30);
      }

    }
LABEL_23:
    if (v7 != 4)
    {
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MostUsedAppAgeRatingSpecifierName"), &stru_24DB8A1D0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, v11, 0, sel_ageRating_, 0, 4, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      ageRatingSpecifier = v11->_ageRatingSpecifier;
      v11->_ageRatingSpecifier = (PSSpecifier *)v32;

      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MostUsedAppDeveloperSpecifierName"), &stru_24DB8A1D0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v34, v11, 0, sel_developer_, 0, 4, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      developerSpecifier = v11->_developerSpecifier;
      v11->_developerSpecifier = (PSSpecifier *)v35;

      v43[0] = v11->_ageRatingSpecifier;
      v43[1] = v11->_developerSpecifier;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObjectsFromArray:", v37);

      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "budgetItemIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObserver:selector:bundleIdentifier:", v11, sel__didFetchAppInfo_, v39);

    }
  }

  return v11;
}

- (id)category:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[STDrillInItemInfoGroupSpecifierProvider usageItem](self, "usageItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STCategoryNameWithIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ageRating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE844B8], "sharedCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInItemInfoGroupSpecifierProvider usageItem](self, "usageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "budgetItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInfoForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[STRegionRatings sharedRatings](STRegionRatings, "sharedRatings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ratingLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForAppRatingLabel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)developer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE844B8], "sharedCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInItemInfoGroupSpecifierProvider usageItem](self, "usageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "budgetItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInfoForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "developerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_didFetchAppInfo:(id)a3
{
  void *v4;
  id v5;

  -[STDrillInItemInfoGroupSpecifierProvider ageRatingSpecifier](self, "ageRatingSpecifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 0);

  -[STDrillInItemInfoGroupSpecifierProvider developerSpecifier](self, "developerSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 0);

}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (PSSpecifier)appIconSpecifier
{
  return self->_appIconSpecifier;
}

- (PSSpecifier)ageRatingSpecifier
{
  return self->_ageRatingSpecifier;
}

- (PSSpecifier)developerSpecifier
{
  return self->_developerSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSpecifier, 0);
  objc_storeStrong((id *)&self->_ageRatingSpecifier, 0);
  objc_storeStrong((id *)&self->_appIconSpecifier, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end
