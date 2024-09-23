@implementation BKCloudQuotaUIServices

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKCloudQuotaUIServices)init
{
  BKCloudQuotaUIServices *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  ICQUICloudStorageOffersManager *v7;
  ICQUICloudStorageOffersManager *offersManager;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKCloudQuotaUIServices;
  v2 = -[BKCloudQuotaUIServices init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_create("com.apple.iBooks.BKCloudQuotaUIServices.SerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(ICQUICloudStorageOffersManager);
    offersManager = v2->_offersManager;
    v2->_offersManager = v7;

    -[ICQUICloudStorageOffersManager setDelegate:](v2->_offersManager, "setDelegate:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_upgradeOfferReceived:", ICQCurrentOfferChangedNotification, 0);

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100059114;
    v7[3] = &unk_1008E7338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(serialQueue, v7);

  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKCloudQuotaUIServices.m", 168, "-[BKCloudQuotaUIServices addObserver:]", "observer", 0);
  }

}

+ (id)sharedInstance
{
  if (qword_1009F5148 != -1)
    dispatch_once(&qword_1009F5148, &stru_1008ED1C0);
  return (id)qword_1009F5150;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKCloudQuotaUIServices;
  -[BKCloudQuotaUIServices dealloc](&v4, "dealloc");
}

- (void)_upgradeOfferReceived:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177F50;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateWithNewOffer
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
  v4 = objc_msgSend(v3, "fetchOfferIfNeeded");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentOffer"));

    if (v10
      && +[ICQUpgradeFlowManager shouldShowForOffer:](ICQUpgradeFlowManager, "shouldShowForOffer:", v10))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCloudQuotaUIServices upgradeFlowManager](self, "upgradeFlowManager"));

      if (!v6)
      {
        v7 = objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", v10);
        -[BKCloudQuotaUIServices setUpgradeFlowManager:](self, "setUpgradeFlowManager:", v7);

      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCloudQuotaUIServices upgradeFlowManagerFuture](self, "upgradeFlowManagerFuture"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKCloudQuotaUIServices upgradeFlowManager](self, "upgradeFlowManager"));
    objc_msgSend(v8, "set:error:", v9, 0);

  }
}

- (id)getUpgradeStorageFlowManager
{
  void *v3;
  BCMutableFutureValue *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCloudQuotaUIServices upgradeFlowManagerFuture](self, "upgradeFlowManagerFuture"));
  objc_msgSend(v3, "cancel");

  -[BKCloudQuotaUIServices setUpgradeFlowManagerFuture:](self, "setUpgradeFlowManagerFuture:", 0);
  v4 = objc_opt_new(BCMutableFutureValue);
  -[BKCloudQuotaUIServices setUpgradeFlowManagerFuture:](self, "setUpgradeFlowManagerFuture:", v4);

  -[BKCloudQuotaUIServices _updateWithNewOffer](self, "_updateWithNewOffer");
  return -[BKCloudQuotaUIServices upgradeFlowManagerFuture](self, "upgradeFlowManagerFuture");
}

- (void)goToSettingsUpgradePane
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=CASTLE&path=STORAGE_AND_BACKUP/CHANGE_STORAGE_PLAN")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = 0;
  objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v2, 0, &v4);

}

- (void)goToSettingsManagePane
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=CASTLE&path=STORAGE_AND_BACKUP/MANAGE_STORAGE")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = 0;
  objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v2, 0, &v4);

}

- (void)presentUpgradeOfferWithNavigationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKCloudQuotaUIServices offersManager](self, "offersManager"));
  objc_msgSend(v5, "beginFlowWithNavigationController:modally:", v4, 1);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001782D8;
    v7[3] = &unk_1008E7338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(serialQueue, v7);

  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKCloudQuotaUIServices.m", 181, "-[BKCloudQuotaUIServices removeObserver:]", "observer", 0);
  }

}

- (void)managerDidCancel:(id)a3
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001783B8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (ICQUpgradeFlowManager)upgradeFlowManager
{
  return self->_upgradeFlowManager;
}

- (void)setUpgradeFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeFlowManager, a3);
}

- (BCMutableFutureValue)upgradeFlowManagerFuture
{
  return self->_upgradeFlowManagerFuture;
}

- (void)setUpgradeFlowManagerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeFlowManagerFuture, a3);
}

- (ICQUICloudStorageOffersManager)offersManager
{
  return self->_offersManager;
}

- (void)setOffersManager:(id)a3
{
  objc_storeStrong((id *)&self->_offersManager, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_offersManager, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManagerFuture, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
}

@end
