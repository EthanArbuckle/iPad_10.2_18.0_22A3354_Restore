@implementation BKSampleToPurchaseMonitor

- (BKSampleToPurchaseMonitor)initWithAssetID:(id)a3 notify:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BKSampleToPurchaseMonitor *v13;
  id v14;
  id notifyBlock;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets](BKLibraryManager, "predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("state"), CFSTR("dataSourceIdentifier"), 0));
  v17.receiver = self;
  v17.super_class = (Class)BKSampleToPurchaseMonitor;
  v13 = -[BKSampleToPurchaseMonitor initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:](&v17, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v10, CFSTR("BKLibraryAsset"), v11, CFSTR("assetID"), v12, self);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_assetID, a3);
    v14 = objc_msgSend(v8, "copy");
    notifyBlock = v13->_notifyBlock;
    v13->_notifyBlock = v14;

  }
  return v13;
}

- (void)dealloc
{
  id notifyBlock;
  objc_super v4;

  notifyBlock = self->_notifyBlock;
  self->_notifyBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKSampleToPurchaseMonitor;
  -[BKSampleToPurchaseMonitor dealloc](&v4, "dealloc");
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  if (objc_msgSend(v6, "count"))
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedObjects"));
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  if (objc_msgSend(v9, "length")
    && self->_notifyBlock
    && -[NSString isEqualToString:](self->_assetID, "isEqualToString:", v9))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015E8D8;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
