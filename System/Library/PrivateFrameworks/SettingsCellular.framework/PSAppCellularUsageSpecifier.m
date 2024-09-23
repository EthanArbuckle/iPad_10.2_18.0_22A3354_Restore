@implementation PSAppCellularUsageSpecifier

+ (id)_specifierWithDisplayName:(id)a3 bundleID:(id)a4 shouldShowUsage:(BOOL)a5 icon:(id)a6 statisticsCache:(id)a7
{
  _BOOL8 v8;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  __objc2_class **v18;
  void *v19;
  void *v20;

  v8 = a5;
  v11 = (void *)MEMORY[0x24BDF69C8];
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");

  v18 = off_24D96E800;
  if (!v17)
    v18 = off_24D96E7F8;
  v19 = (void *)objc_msgSend(objc_alloc(*v18), "initWithBundleID:displayName:statisticsCache:", v14, v15, v12);

  objc_msgSend(v19, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", v20);

  objc_msgSend(v19, "setShouldShowUsage:", v8);
  objc_msgSend(v19, "setProperty:forKey:", v13, *MEMORY[0x24BE75AC8]);

  return v19;
}

+ (id)appSpecifierWithBundleID:(id)a3 name:(id)a4 statisticsCache:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a1, "_specifierWithDisplayName:bundleID:shouldShowUsage:icon:statisticsCache:", a4, v8, 1, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(a1, "setIconForSpecifier:bundleID:", v9, v8);

  return v9;
}

+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)MEMORY[0x24BDF6FD0];
  v6 = a4;
  if (objc_msgSend(v5, "bundleIdentifierContainsWebClipIdentifier:", v6))
  {
    objc_msgSend(MEMORY[0x24BDF6FD0], "webClipIdentifierFromBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v8, "generateIconImageForFormat:scale:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v12, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC8]);

  }
  else
  {
    objc_msgSend(v12, "setProperty:forKey:", v6, *MEMORY[0x24BE75B70]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v11, *MEMORY[0x24BE75B88]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v7, *MEMORY[0x24BE75B80]);
  }

}

+ (id)systemPolicySpecifierForAppName:(id)a3 bundleID:(id)a4 icon:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x24BDF69C8];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v6, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sf_isChinaRegionCellularDevice");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24D96EF60, CFSTR("WirelessData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSDataUsageStatisticsCache sharedInstance](PSDataUsageStatisticsCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSAppCellularUsageSpecifier _specifierWithDisplayName:bundleID:shouldShowUsage:icon:statisticsCache:](PSAppCellularUsageSpecifier, "_specifierWithDisplayName:bundleID:shouldShowUsage:icon:statisticsCache:", v12, v8, 0, v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)dataUsage
{
  void *v3;
  PSDataUsageStatisticsCache *statisticsCache;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[PSAppCellularUsageSpecifier billingPeriodSource](self, "billingPeriodSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statisticsCache = self->_statisticsCache;
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = objc_msgSend(v3, "selectedPeriod");
  else
    v6 = 0;
  -[PSDataUsageStatisticsCache usageForBundleID:inPeriod:](statisticsCache, "usageForBundleID:inPeriod:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "native");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cellularHome");
  objc_msgSend(v7, "native");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cellularRoaming") + v9;
  objc_msgSend(v7, "proxied");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "cellularHome");
  objc_msgSend(v7, "proxied");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 + v13 + objc_msgSend(v14, "cellularRoaming");

  return v15;
}

- (id)dataUsageString
{
  unint64_t v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v17;
  void *v18;

  v3 = -[PSAppCellularUsageSpecifier dataUsage](self, "dataUsage");
  if (v3)
  {
    +[SettingsCellularSharedUtils usageSizeString:](SettingsCellularSharedUtils, "usageSizeString:", (double)v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  +[PSCellularManagementCache sharedInstance](PSCellularManagementCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isManaged:", v8);

  if (v9)
  {
    if (v4)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24D96EF60, CFSTR("WirelessData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v13, v4);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24D96EF60, CFSTR("WirelessData"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_8:
    v15 = &stru_24D96EF60;
    if (v4)
      v15 = v4;
    v14 = v15;
  }

  return v14;
}

- (id)cellularUsagePolicy
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented method."), CFSTR("This method is only implemented by subclasses."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented method."), CFSTR("This method is only implemented by subclasses."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isRestricted
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  +[PSCellularManagementCache sharedInstance](PSCellularManagementCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isGlobalDataModificationRestricted") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policiesFor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "isRestricted");

  }
  return v4;
}

- (BOOL)shouldShowUsage
{
  return self->_shouldShowUsage;
}

- (void)setShouldShowUsage:(BOOL)a3
{
  self->_shouldShowUsage = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (PSBillingPeriodSource)billingPeriodSource
{
  return (PSBillingPeriodSource *)objc_loadWeakRetained((id *)&self->_billingPeriodSource);
}

- (void)setBillingPeriodSource:(id)a3
{
  objc_storeWeak((id *)&self->_billingPeriodSource, a3);
}

- (PSAppCellularUsageSpecifierDelegate)delegate
{
  return (PSAppCellularUsageSpecifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
