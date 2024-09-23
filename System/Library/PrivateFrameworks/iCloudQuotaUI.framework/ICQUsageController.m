@implementation ICQUsageController

- (id)usageStorageSpecifiers
{
  NSMutableArray *storageSpecifiers;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PSSpecifier *v11;
  PSSpecifier *storageUsedSpecifier;
  PSSpecifier *v13;
  PSSpecifier *storageAvailableSpecifier;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  storageSpecifiers = self->_storageSpecifiers;
  if (!storageSpecifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_storageSpecifiers;
    self->_storageSpecifiers = v4;

    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("STORAGE"), &stru_24E400750, CFSTR("Usage Statistics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, 0, 0, 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", CFSTR("STORAGE_GROUP"), *MEMORY[0x24BE75AC0]);
    -[NSMutableArray addObject:](self->_storageSpecifiers, "addObject:", v9);
    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchSystemSizeStrings");

    +[ICQUsageStorageController storageUsedSpecifier](ICQUsageStorageController, "storageUsedSpecifier");
    v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    storageUsedSpecifier = self->_storageUsedSpecifier;
    self->_storageUsedSpecifier = v11;

    -[NSMutableArray addObject:](self->_storageSpecifiers, "addObject:", self->_storageUsedSpecifier);
    +[ICQUsageStorageController storageAvailableSpecifier](ICQUsageStorageController, "storageAvailableSpecifier");
    v13 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    storageAvailableSpecifier = self->_storageAvailableSpecifier;
    self->_storageAvailableSpecifier = v13;

    -[NSMutableArray addObject:](self->_storageSpecifiers, "addObject:", self->_storageAvailableSpecifier);
    if ((PSIsInEDUMode() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MANAGE_STORAGE"), &stru_24E400750, CFSTR("Usage Statistics"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIdentifier:", CFSTR("DEVICE_STORAGE"));
      -[NSMutableArray addObject:](self->_storageSpecifiers, "addObject:", v18);

    }
    storageSpecifiers = self->_storageSpecifiers;
  }
  return storageSpecifiers;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[ICQUsageController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
    -[ICQCloudStorageGroupController groupRemovedFromListController](self->_cloudGroup, "groupRemovedFromListController");
  v5.receiver = self;
  v5.super_class = (Class)ICQUsageController;
  -[ICQUsageController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQUsageController;
  -[ICQUsageController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if ((-[ICQUsageController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteQuotaInfoChanged");

    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchSystemSizeStrings");

    -[ICQUsageController reloadSpecifier:](self, "reloadSpecifier:", self->_storageAvailableSpecifier);
    -[ICQUsageController reloadSpecifier:](self, "reloadSpecifier:", self->_storageUsedSpecifier);
  }
  -[ICQCloudStorageGroupController addGroupToListController:](self->_cloudGroup, "addGroupToListController:", self);
}

- (void)dealloc
{
  objc_super v3;

  -[ICQCloudStorageGroupController groupRemovedFromListController](self->_cloudGroup, "groupRemovedFromListController");
  v3.receiver = self;
  v3.super_class = (Class)ICQUsageController;
  -[ICQUsageController dealloc](&v3, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICQCloudStorageGroupController *v8;
  ICQCloudStorageGroupController *cloudGroup;
  void *v10;
  void *v11;
  void *v12;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_cloudGroup)
    {
      objc_msgSend(MEMORY[0x24BE048E0], "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primaryAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_alloc_init(ICQCloudStorageGroupController);
        cloudGroup = self->_cloudGroup;
        self->_cloudGroup = v8;

      }
    }
    -[ICQUsageController usageStorageSpecifiers](self, "usageStorageSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    -[ICQCloudStorageGroupController specifiersWithBuyMore:](self->_cloudGroup, "specifiersWithBuyMore:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageAvailableSpecifier, 0);
  objc_storeStrong((id *)&self->_storageUsedSpecifier, 0);
  objc_storeStrong((id *)&self->_storageSpecifiers, 0);
  objc_storeStrong((id *)&self->_cloudGroup, 0);
}

@end
