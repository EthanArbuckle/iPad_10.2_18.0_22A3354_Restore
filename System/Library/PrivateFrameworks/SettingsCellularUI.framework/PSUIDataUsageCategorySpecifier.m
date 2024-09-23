@implementation PSUIDataUsageCategorySpecifier

- (PSUIDataUsageCategorySpecifier)initWithType:(unint64_t)a3 subSpecifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  PSUIDataUsageCategorySpecifier *v19;
  PSUIDataUsageCategorySpecifier *v20;
  uint64_t v21;
  PSDataUsageStatisticsCache *statisticsCache;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v6 = a4;
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNINSTALLED_APPS"), &stru_24D5028C8, CFSTR("Cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("UninstalledApps");
      goto LABEL_5;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WATCH_ONLY_APPS"), &stru_24D5028C8, CFSTR("Cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("AppsOnlyOnWatch");
LABEL_5:
      objc_msgSend(v9, "imageNamed:inBundle:", v11, v10);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SYSTEM_SERVICES"), &stru_24D5028C8, CFSTR("Cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v17 = (_QWORD *)MEMORY[0x24BE757D0];
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_CLIENTS"), &stru_24D5028C8, CFSTR("Cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v17 = (_QWORD *)MEMORY[0x24BE757F8];
LABEL_8:
      objc_msgSend(v16, "imageForKey:", *v17);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = (void *)v14;

      break;
    default:
      v8 = 0;
      v12 = 0;
      break;
  }
  v26.receiver = self;
  v26.super_class = (Class)PSUIDataUsageCategorySpecifier;
  v19 = -[PSUIDataUsageCategorySpecifier initWithName:target:set:get:detail:cell:edit:](&v26, sel_initWithName_target_set_get_detail_cell_edit_, v8, 0, 0, 0, 0, 4, 0);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    statisticsCache = v20->_statisticsCache;
    v20->_statisticsCache = (PSDataUsageStatisticsCache *)v21;

    -[PSUIDataUsageCategorySpecifier setTarget:](v20, "setTarget:", v20);
    *(Class *)((char *)&v20->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel_dataUsageString;
    if (v20->_type == 1)
    {
      -[PSUIDataUsageCategorySpecifier setCellType:](v20, "setCellType:", 4);
    }
    else
    {
      if (objc_msgSend(v6, "count"))
        v23 = 2;
      else
        v23 = 4;
      -[PSUIDataUsageCategorySpecifier setCellType:](v20, "setCellType:", v23);
      if (objc_msgSend(v6, "count"))
      {
        v24 = objc_opt_class();
LABEL_19:
        -[PSUIDataUsageCategorySpecifier setDetailControllerClass:](v20, "setDetailControllerClass:", v24);
        -[PSUIDataUsageCategorySpecifier setProperty:forKey:](v20, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
        if (v12)
          -[PSUIDataUsageCategorySpecifier setProperty:forKey:](v20, "setProperty:forKey:", v12, *MEMORY[0x24BE75AC8]);
        -[PSUIDataUsageCategorySpecifier setSubcategorySpecifiers:](v20, "setSubcategorySpecifiers:", v6);
        goto LABEL_22;
      }
    }
    v24 = 0;
    goto LABEL_19;
  }
LABEL_22:

  return v20;
}

- (unint64_t)dataUsage
{
  void *v3;
  void *v4;
  PSDataUsageStatisticsCache *statisticsCache;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  PSDataUsageStatisticsCache *v9;
  uint64_t v10;
  PSDataUsageStatisticsCache *v11;
  uint64_t v12;
  PSDataUsageStatisticsCache *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PSDataUsageStatisticsCache *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t type;
  void *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[PSUIDataUsageCategorySpecifier billingPeriodSource](self, "billingPeriodSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  switch(self->_type)
  {
    case 1uLL:
      statisticsCache = self->_statisticsCache;
      if (v3)
        v6 = objc_msgSend(v3, "selectedPeriod");
      else
        v6 = 0;
      v31 = v4;
      -[PSDataUsageStatisticsCache totalUninstalledAppUsageForPeriod:](statisticsCache, "totalUninstalledAppUsageForPeriod:", v6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 2uLL:
      v9 = self->_statisticsCache;
      if (v3)
        v10 = objc_msgSend(v3, "selectedPeriod");
      else
        v10 = 0;
      v31 = v4;
      -[PSDataUsageStatisticsCache totalWatchOnlyAppUsageForPeriod:](v9, "totalWatchOnlyAppUsageForPeriod:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 3uLL:
      v11 = self->_statisticsCache;
      if (v3)
        v12 = objc_msgSend(v3, "selectedPeriod");
      else
        v12 = 0;
      v31 = v4;
      -[PSDataUsageStatisticsCache totalSystemServicesUsageForPeriod:](v11, "totalSystemServicesUsageForPeriod:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v16 = (void *)v15;
LABEL_20:
      objc_msgSend(v16, "native");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "cellularHome");
      objc_msgSend(v16, "native");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "cellularRoaming") + v18;
      objc_msgSend(v16, "proxied");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "cellularHome");
      objc_msgSend(v16, "proxied");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v20 + v22 + objc_msgSend(v23, "cellularRoaming");

      if (self->_type == 3)
      {
        v24 = self->_statisticsCache;
        v4 = v31;
        if (v31)
          v25 = objc_msgSend(v31, "selectedPeriod");
        else
          v25 = 0;
        v26 = -[PSDataUsageStatisticsCache totalHotspotClientUsageForPeriod:](v24, "totalHotspotClientUsageForPeriod:", v25);
        -[PSUIDataUsageCategorySpecifier getLogger](self, "getLogger");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v8 >= v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v33 = v26;
            v34 = 2048;
            v35 = v8;
            _os_log_impl(&dword_2161C6000, v28, OS_LOG_TYPE_INFO, "Removing %zu bytes of hotspot usage from %zu bytes of system services", buf, 0x16u);
          }

          v8 -= v26;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            v33 = v26;
            v34 = 2048;
            v35 = v8;
            _os_log_fault_impl(&dword_2161C6000, v28, OS_LOG_TYPE_FAULT, "Hotspot usage %zu is greater than system services usage %zu", buf, 0x16u);
          }

        }
      }
      else
      {
        v4 = v31;
      }
      goto LABEL_35;
    case 4uLL:
      v13 = self->_statisticsCache;
      if (v3)
        v14 = objc_msgSend(v3, "selectedPeriod");
      else
        v14 = 0;
      v8 = -[PSDataUsageStatisticsCache totalHotspotClientUsageForPeriod:](v13, "totalHotspotClientUsageForPeriod:", v14);
      goto LABEL_34;
    default:
      -[PSUIDataUsageCategorySpecifier getLogger](self, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        type = self->_type;
        *(_DWORD *)buf = 134217984;
        v33 = type;
        _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Unhandled usage category %lu", buf, 0xCu);
      }

      v8 = 0;
LABEL_34:
      v16 = 0;
LABEL_35:

      return v8;
  }
}

- (id)dataUsageString
{
  unint64_t v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = -[PSUIDataUsageCategorySpecifier dataUsage](self, "dataUsage");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE856B8], "usageSizeString:", (double)v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D5028C8;
  v5 = v4;

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("DataUsageCategory"));
}

- (PSBillingPeriodSource)billingPeriodSource
{
  return (PSBillingPeriodSource *)objc_loadWeakRetained((id *)&self->_billingPeriodSource);
}

- (void)setBillingPeriodSource:(id)a3
{
  objc_storeWeak((id *)&self->_billingPeriodSource, a3);
}

- (NSArray)subcategorySpecifiers
{
  return self->_subcategorySpecifiers;
}

- (void)setSubcategorySpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_subcategorySpecifiers, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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
  objc_storeStrong((id *)&self->_subcategorySpecifiers, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end
