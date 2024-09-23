@implementation PSUITotalCellularUsageSubgroup

- (PSUITotalCellularUsageSubgroup)initWithStatisticsCache:(id)a3 andBillingPeriodSource:(id)a4
{
  id v7;
  id v8;
  PSUITotalCellularUsageSubgroup *v9;
  PSUITotalCellularUsageSubgroup *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  PSSpecifier *totalUsageSpecifier;
  PSSpecifier *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PSSpecifier *totalRoamingUsageSpecifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PSUITotalCellularUsageSubgroup;
  v9 = -[PSUITotalCellularUsageSubgroup init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statisticsCache, a3);
    objc_storeWeak((id *)&v10->_billingPeriodSource, v8);
    v11 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CURRENT_DATA_PERIOD"), &stru_24D5028C8, CFSTR("Cellular"));
    v13 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v10, 0, sel_totalDataUsageForSpecifier_, 0, 4, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    totalUsageSpecifier = v10->_totalUsageSpecifier;
    v10->_totalUsageSpecifier = (PSSpecifier *)v15;

    -[PSSpecifier setIdentifier:](v10->_totalUsageSpecifier, "setIdentifier:", CFSTR("DATA_USAGE_IN_PERIOD"));
    v17 = v10->_totalUsageSpecifier;
    v18 = objc_opt_class();
    v19 = *MEMORY[0x24BE75948];
    -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75948]);
    v20 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CURRENT_ROAMING"), &stru_24D5028C8, CFSTR("Cellular"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, v10, 0, sel_totalRoamingDataUsageForSpecifier_, 0, 4, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    totalRoamingUsageSpecifier = v10->_totalRoamingUsageSpecifier;
    v10->_totalRoamingUsageSpecifier = (PSSpecifier *)v23;

    v8 = v13;
    -[PSSpecifier setProperty:forKey:](v10->_totalRoamingUsageSpecifier, "setProperty:forKey:", objc_opt_class(), v19);
    -[PSSpecifier setIdentifier:](v10->_totalRoamingUsageSpecifier, "setIdentifier:", CFSTR("ROAMING_DATA_USAGE_IN_PERIOD"));
    if (-[PSDataUsageStatisticsCache useCalendarMonthBillingCycle](v10->_statisticsCache, "useCalendarMonthBillingCycle"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_USED"), &stru_24D5028C8, CFSTR("Cellular"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v10->_totalUsageSpecifier, "setName:", v26);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ROAMING"), &stru_24D5028C8, CFSTR("Cellular"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v10->_totalRoamingUsageSpecifier, "setName:", v28);

    }
  }

  return v10;
}

- (id)specifiers
{
  PSSpecifier *totalRoamingUsageSpecifier;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  totalRoamingUsageSpecifier = self->_totalRoamingUsageSpecifier;
  v4[0] = self->_totalUsageSpecifier;
  v4[1] = totalRoamingUsageSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)totalBytesUsed
{
  void *v3;
  void *v4;
  uint64_t v5;
  PSDataUsageStatisticsCache *statisticsCache;
  double v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PSUITotalCellularUsageSubgroup billingPeriodSource](self, "billingPeriodSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "selectedPeriod");
    statisticsCache = self->_statisticsCache;
    if (v5)
    {
      v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalCellularUsageForPeriod:](statisticsCache, "totalCellularUsageForPeriod:", 1);
      -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
        v14 = 2048;
        v15 = v7;
        v9 = "%s returning previous billing cycle usage %f";
LABEL_9:
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalCellularUsageForPeriod:](statisticsCache, "totalCellularUsageForPeriod:", 0);
      -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
        v14 = 2048;
        v15 = v7;
        v9 = "%s returning current billing cycle usage %f";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalCellularUsageForPeriod:](self->_statisticsCache, "totalCellularUsageForPeriod:", 0);
    -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
      v14 = 2048;
      v15 = v7;
      v9 = "%s returning total usage %f";
      goto LABEL_9;
    }
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)totalRoamingBytesUsed
{
  void *v3;
  void *v4;
  uint64_t v5;
  PSDataUsageStatisticsCache *statisticsCache;
  double v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PSUITotalCellularUsageSubgroup billingPeriodSource](self, "billingPeriodSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "selectedPeriod");
    statisticsCache = self->_statisticsCache;
    if (v5)
    {
      v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalRoamingUsageForPeriod:](statisticsCache, "totalRoamingUsageForPeriod:", 1);
      -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
        v14 = 2048;
        v15 = v7;
        v9 = "%s returning previous billing cycle roaming %f";
LABEL_9:
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalRoamingUsageForPeriod:](statisticsCache, "totalRoamingUsageForPeriod:", 0);
      -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
        v14 = 2048;
        v15 = v7;
        v9 = "%s returning current billing cycle roaming %f";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (double)(unint64_t)-[PSDataUsageStatisticsCache totalRoamingUsageForPeriod:](self->_statisticsCache, "totalRoamingUsageForPeriod:", 0);
    -[PSUITotalCellularUsageSubgroup getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
      v14 = 2048;
      v15 = v7;
      v9 = "%s returning total roaming %f";
      goto LABEL_9;
    }
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)totalDataUsageForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  -[PSUITotalCellularUsageSubgroup totalBytesUsed](self, "totalBytesUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    v7 = (void *)MEMORY[0x24BE856B8];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "usageSizeString:");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v9);

    v8 = &stru_24D5028C8;
  }

  return v8;
}

- (id)totalRoamingDataUsageForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  -[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed](self, "totalRoamingBytesUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    v7 = (void *)MEMORY[0x24BE856B8];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "usageSizeString:");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v9);

    v8 = &stru_24D5028C8;
  }

  return v8;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("TotalCellularUsage"));
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

- (PSSpecifier)totalUsageSpecifier
{
  return self->_totalUsageSpecifier;
}

- (void)setTotalUsageSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_totalUsageSpecifier, a3);
}

- (PSSpecifier)totalRoamingUsageSpecifier
{
  return self->_totalRoamingUsageSpecifier;
}

- (void)setTotalRoamingUsageSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_totalRoamingUsageSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalRoamingUsageSpecifier, 0);
  objc_storeStrong((id *)&self->_totalUsageSpecifier, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end
