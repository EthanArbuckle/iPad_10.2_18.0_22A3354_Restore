@implementation PSAppDataUsagePolicyTernaryControlSpecifier

- (PSAppDataUsagePolicyTernaryControlSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  PSAppDataUsagePolicyTernaryControlSpecifier *v12;
  PSAppDataUsagePolicyTernaryControlSpecifier *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)PSAppDataUsagePolicyTernaryControlSpecifier;
  v12 = -[PSAppDataUsagePolicyTernaryControlSpecifier initWithName:target:set:get:detail:cell:edit:](&v15, sel_initWithName_target_set_get_detail_cell_edit_, v9, self, sel_setCellularUsagePolicy_, sel_cellularUsagePolicy, v11, 2, 0);
  v13 = v12;
  if (v12)
  {
    -[PSAppCellularUsageSpecifier setStatisticsCache:](v12, "setStatisticsCache:", v10);
    -[PSAppCellularUsageSpecifier setBundleID:](v13, "setBundleID:", v8);
    -[PSAppDataUsagePolicyTernaryControlSpecifier setDisplayName:](v13, "setDisplayName:", v9);
    -[PSAppDataUsagePolicyTernaryControlSpecifier setProperty:forKey:](v13, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[PSAppDataUsagePolicyTernaryControlSpecifier finishInitializing:](v13, "finishInitializing:", 3);
    v13->_fullyInitialized = 0;
  }

  return v13;
}

- (void)finishInitializing:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v5 = -[PSAppCellularUsageSpecifier isRestricted](self, "isRestricted");
  if (a3 == 3 || !v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_24D96EF60, CFSTR("WirelessData"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v23);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_24D96EF60, CFSTR("WirelessData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v26);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", v28, &stru_24D96EF60, CFSTR("WirelessData"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v29);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", v31, &stru_24D96EF60, CFSTR("WirelessData"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v32);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_24D96EF60, CFSTR("WirelessData"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v35);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", v37, &stru_24D96EF60, CFSTR("WirelessData"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v38);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", &unk_24D971928);
    objc_msgSend(v19, "addObject:", &unk_24D971940);
    v20 = &unk_24D971958;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24D96EF60, CFSTR("WirelessData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24D96EF60, CFSTR("WirelessData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_24D96EF60, CFSTR("WirelessData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_24D96EF60, CFSTR("WirelessData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", &unk_24D971928);
    v20 = &unk_24D971940;
  }
  objc_msgSend(v19, "addObject:", v20);
  -[PSAppDataUsagePolicyTernaryControlSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v19, v39, v12);

}

- (id)cellularUsagePolicy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSAppCellularUsageSpecifier isRestricted](self, "isRestricted") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE75A18];
  -[PSAppDataUsagePolicyTernaryControlSpecifier setProperty:forKey:](self, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

  +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policiesFor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PSAppDataUsagePolicyTernaryControlSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v4);
  v8 = objc_msgSend(v7, "wifi") != 0;
  if (objc_msgSend(v7, "cellular"))
    v8 |= 2uLL;
  if (!self->_fullyInitialized)
  {
    -[PSAppDataUsagePolicyTernaryControlSpecifier finishInitializing:](self, "finishInitializing:", v8);
    self->_fullyInitialized = 1;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  char v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policiesFor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v4, "unsignedIntegerValue");
    v9 = v8;
    objc_msgSend(v7, "setCellular:", (v8 >> 1) & 1);
    objc_msgSend(v7, "setWifi:", v9 & 1);
    +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__PSAppDataUsagePolicyTernaryControlSpecifier_setCellularUsagePolicy___block_invoke;
    v11[3] = &unk_24D96ECB8;
    v11[4] = self;
    objc_msgSend(v10, "setPolicies:completion:", v7, v11);
  }
  else
  {
    -[PSAppCellularUsageSpecifier delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFailToSetPolicyForSpecifier:", self);
  }

}

void __70__PSAppDataUsagePolicyTernaryControlSpecifier_setCellularUsagePolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didFailToSetPolicyForSpecifier:", *(_QWORD *)(a1 + 32));

  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
