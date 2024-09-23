@implementation PSDataUsageSpecifier

- (PSDataUsageSpecifier)initWithType:(unint64_t)a3 bundleID:(id)a4 name:(id)a5 statisticsCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PSDataUsageSpecifier *v17;
  PSDataUsageSpecifier *v18;
  void *v19;
  int v20;
  objc_super v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 4 && objc_msgSend(v12, "isEqualToString:", CFSTR("Others")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24D96EF60, CFSTR("WirelessData"));
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v16;
  }
  v22.receiver = self;
  v22.super_class = (Class)PSDataUsageSpecifier;
  v17 = -[PSDataUsageSpecifier initWithName:target:set:get:detail:cell:edit:](&v22, sel_initWithName_target_set_get_detail_cell_edit_, v12, 0, 0, 0, 0, 4, 0);
  v18 = v17;
  if (v17)
  {
    -[PSDataUsageSpecifier setTarget:](v17, "setTarget:", v17);
    *(Class *)((char *)&v18->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel_dataUsageString;
    objc_storeStrong((id *)&v18->_statisticsCache, a6);
    objc_storeStrong((id *)&v18->_bundleID, a4);
    v18->_type = a3;
    -[PSDataUsageSpecifier setProperty:forKey:](v18, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C18]);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "sf_isChinaRegionCellularDevice");

    if (v20)
      -[PSDataUsageSpecifier setProperty:forKey:](v18, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  }

  return v18;
}

- (unint64_t)dataUsage
{
  void *v3;
  void *v4;
  PSDataUsageStatisticsCache *statisticsCache;
  NSString *bundleID;
  uint64_t v7;
  void *v8;
  void *v9;
  PSDataUsageStatisticsCache *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  -[PSDataUsageSpecifier billingPeriodSource](self, "billingPeriodSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  statisticsCache = self->_statisticsCache;
  bundleID = self->_bundleID;
  if (v3)
    v7 = objc_msgSend(v3, "selectedPeriod");
  else
    v7 = 0;
  -[PSDataUsageStatisticsCache usageForBundleID:inPeriod:](statisticsCache, "usageForBundleID:inPeriod:", bundleID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_type == 4)
  {
    v10 = self->_statisticsCache;
    v11 = self->_bundleID;
    if (v4)
      v12 = objc_msgSend(v4, "selectedPeriod");
    else
      v12 = 0;
    v20 = -[PSDataUsageStatisticsCache usageForHotspotClientID:inPeriod:](v10, "usageForHotspotClientID:inPeriod:", v11, v12);
  }
  else
  {
    objc_msgSend(v8, "native");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "cellularHome");
    objc_msgSend(v9, "native");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "cellularRoaming") + v14;
    objc_msgSend(v9, "proxied");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "cellularHome");
    objc_msgSend(v9, "proxied");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16 + v18 + objc_msgSend(v19, "cellularRoaming");

  }
  return v20;
}

- (id)dataUsageString
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v14;
  void *v15;

  v3 = -[PSDataUsageSpecifier dataUsage](self, "dataUsage");
  if (v3)
  {
    +[SettingsCellularSharedUtils usageSizeString:](SettingsCellularSharedUtils, "usageSizeString:", (double)v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (self->_bundleID
    && (+[PSCellularManagementCache sharedInstance](PSCellularManagementCache, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isManaged:", self->_bundleID),
        v5,
        v6))
  {
    if (v4)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24D96EF60, CFSTR("WirelessData"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v10, v4);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24D96EF60, CFSTR("WirelessData"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = &stru_24D96EF60;
    if (v4)
      v12 = v4;
    v11 = v12;
  }

  return v11;
}

- (PSBillingPeriodSource)billingPeriodSource
{
  return (PSBillingPeriodSource *)objc_loadWeakRetained((id *)&self->_billingPeriodSource);
}

- (void)setBillingPeriodSource:(id)a3
{
  objc_storeWeak((id *)&self->_billingPeriodSource, a3);
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsCache, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end
