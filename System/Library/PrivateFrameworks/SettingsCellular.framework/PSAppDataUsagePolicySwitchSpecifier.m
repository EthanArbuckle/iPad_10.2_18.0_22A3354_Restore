@implementation PSAppDataUsagePolicySwitchSpecifier

- (PSAppDataUsagePolicySwitchSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5
{
  id v8;
  id v9;
  PSAppDataUsagePolicySwitchSpecifier *v10;
  PSAppDataUsagePolicySwitchSpecifier *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PSAppDataUsagePolicySwitchSpecifier;
  v10 = -[PSAppDataUsagePolicySwitchSpecifier initWithName:target:set:get:detail:cell:edit:](&v13, sel_initWithName_target_set_get_detail_cell_edit_, a4, self, sel_setCellularUsagePolicy_, sel_cellularUsagePolicy, 0, 6, 0);
  v11 = v10;
  if (v10)
  {
    -[PSAppCellularUsageSpecifier setStatisticsCache:](v10, "setStatisticsCache:", v9);
    -[PSAppCellularUsageSpecifier setBundleID:](v11, "setBundleID:", v8);
  }

  return v11;
}

- (void)setShouldShowUsage:(BOOL)a3
{
  if (a3)
    -[PSAppDataUsagePolicySwitchSpecifier setProperty:forKey:](self, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  else
    -[PSAppDataUsagePolicySwitchSpecifier removePropertyForKey:](self, "removePropertyForKey:", *MEMORY[0x24BE75948]);
}

- (id)cellularUsagePolicy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSAppCellularUsageSpecifier isRestricted](self, "isRestricted") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE75A18];
  -[PSAppDataUsagePolicySwitchSpecifier setProperty:forKey:](self, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

  +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policiesFor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "cellular") != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSAppDataUsagePolicySwitchSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v4);
    v8 = &unk_24D971910;
  }

  return v8;
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = a3;
  +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppCellularUsageSpecifier bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policiesFor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setCellular:", objc_msgSend(v4, "integerValue"));
    +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__PSAppDataUsagePolicySwitchSpecifier_setCellularUsagePolicy___block_invoke;
    v11[3] = &unk_24D96ECB8;
    v11[4] = self;
    objc_msgSend(v8, "setPolicies:completion:", v7, v11);
LABEL_5:

    goto LABEL_6;
  }
  -[PSAppCellularUsageSpecifier delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PSAppCellularUsageSpecifier delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didFailToSetPolicyForSpecifier:", self);
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2188BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
  }
LABEL_6:

}

void __62__PSAppDataUsagePolicySwitchSpecifier_setCellularUsagePolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didFailToSetPolicyForSpecifier:", *(_QWORD *)(a1 + 32));

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2188BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", v7, 2u);
    }
  }

}

@end
