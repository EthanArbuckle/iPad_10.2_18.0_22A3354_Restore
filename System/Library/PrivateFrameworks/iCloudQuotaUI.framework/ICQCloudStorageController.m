@implementation ICQCloudStorageController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ICQCloudStorageGroupController groupRemovedFromListController](self->_cloudGroup, "groupRemovedFromListController");
  -[NSTimer invalidate](self->_storageUpgradeOfferTimer, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC7218], 0);

  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  -[ICQCloudStorageController dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  ICQCloudStorageGroupController *v6;
  ICQCloudStorageGroupController *cloudGroup;
  void *v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!self->_cloudGroup)
    {
      v6 = objc_alloc_init(ICQCloudStorageGroupController);
      cloudGroup = self->_cloudGroup;
      self->_cloudGroup = v6;

    }
    -[ICQCloudStorageGroupController specifiersWithBuyMore:](self->_cloudGroup, "specifiersWithBuyMore:", PSUsedByManagedAccount() ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_changeStoragePlan
{
  id v3;

  v3 = -[ICQCloudStorageController specifiers](self, "specifiers");
  -[ICQCloudStorageGroupController addGroupToListController:](self->_cloudGroup, "addGroupToListController:", self);
  -[ICQCloudStorageGroupController enterBuyStorage](self->_cloudGroup, "enterBuyStorage");
}

- (void)_storageUpgradeOfferTimeout:(id)a3
{
  -[ICQCloudStorageController _storageUpgradeOfferNotification:](self, "_storageUpgradeOfferNotification:", 0);
}

- (void)_storageUpgradeOfferNotification:(id)a3
{
  void *v4;
  NSTimer *storageUpgradeOfferTimer;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEC7218], 0);

  -[NSTimer invalidate](self->_storageUpgradeOfferTimer, "invalidate");
  storageUpgradeOfferTimer = self->_storageUpgradeOfferTimer;
  self->_storageUpgradeOfferTimer = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ICQCloudStorageController__storageUpgradeOfferNotification___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __62__ICQCloudStorageController__storageUpgradeOfferNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  ICQUpgradeFlowManager *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentOffer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (+[ICQUpgradeFlowManager shouldShowForOffer:](ICQUpgradeFlowManager, "shouldShowForOffer:", v12))
    {
      v6 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v12);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 1384);
      *(_QWORD *)(v7 + 1384) = v6;

      v9 = *(_QWORD **)(a1 + 32);
      v10 = (void *)v9[173];
      objc_msgSend(v9, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginFlowWithPresentingViewController:", v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_changeStoragePlan");
    }

  }
}

- (void)_storageUpgrade
{
  void *v3;
  void *v4;
  int v5;
  NSTimer *v6;
  NSTimer *storageUpgradeOfferTimer;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__storageUpgradeOfferNotification_, *MEMORY[0x24BEC7218], 0);

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fetchOfferIfNeeded");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__storageUpgradeOfferTimeout_, 0, 0, 10.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    storageUpgradeOfferTimer = self->_storageUpgradeOfferTimer;
    self->_storageUpgradeOfferTimer = v6;

  }
  else
  {
    -[ICQCloudStorageController _storageUpgradeOfferNotification:](self, "_storageUpgradeOfferNotification:", 0);
  }
}

- (void)handleURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MANAGE_STORAGE")))
  {
    v6 = -[ICQCloudStorageController specifiers](self, "specifiers");
    -[ICQCloudStorageGroupController addGroupToListController:](self->_cloudGroup, "addGroupToListController:", self);
    -[ICQCloudStorageGroupController enterManageStorageWhenPossible](self->_cloudGroup, "enterManageStorageWhenPossible");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CHANGE_STORAGE_PLAN")))
  {
    -[ICQCloudStorageController _changeStoragePlan](self, "_changeStoragePlan");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("STORAGE_UPGRADE")))
  {
    -[ICQCloudStorageController _storageUpgrade](self, "_storageUpgrade");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICQCloudStorageController;
    -[ICQCloudStorageController handleURL:](&v7, sel_handleURL_, v4);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  -[ICQCloudStorageController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[ICQCloudStorageController isMovingToParentViewController](self, "isMovingToParentViewController"))
    -[ICQCloudStorageGroupController addGroupToListController:](self->_cloudGroup, "addGroupToListController:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQCloudStorageController;
  -[ICQCloudStorageController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[ICQCloudStorageController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[ICQCloudStorageGroupController groupRemovedFromListController](self->_cloudGroup, "groupRemovedFromListController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUpgradeOfferTimer, 0);
  objc_storeStrong((id *)&self->_quotaManager, 0);
  objc_storeStrong((id *)&self->_cloudGroup, 0);
}

@end
