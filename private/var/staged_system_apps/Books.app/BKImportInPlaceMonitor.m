@implementation BKImportInPlaceMonitor

- (BKImportInPlaceMonitor)initWithAssetID:(id)a3 notify:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BKImportInPlaceMonitor *v14;
  id v15;
  id notifyBlock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predicateForLocalLibraryAssets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("state"), CFSTR("dataSourceIdentifier"), 0));
  v18.receiver = self;
  v18.super_class = (Class)BKImportInPlaceMonitor;
  v14 = -[BKImportInPlaceMonitor initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:](&v18, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v10, CFSTR("BKLibraryAsset"), v12, CFSTR("assetID"), v13, self);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetID, a3);
    v15 = objc_msgSend(v8, "copy");
    notifyBlock = v14->_notifyBlock;
    v14->_notifyBlock = v15;

  }
  return v14;
}

- (void)dealloc
{
  id notifyBlock;
  objc_super v4;

  notifyBlock = self->_notifyBlock;
  self->_notifyBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKImportInPlaceMonitor;
  -[BKImportInPlaceMonitor dealloc](&v4, "dealloc");
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5;
  void *v6;
  NSString *assetID;
  void *v8;
  void *v9;
  _QWORD block[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  if (objc_msgSend(v6, "count") && self->_notifyBlock)
  {
    assetID = self->_assetID;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    LODWORD(assetID) = -[NSString isEqualToString:](assetID, "isEqualToString:", v9);

    if ((_DWORD)assetID)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001BD994;
      block[3] = &unk_1008E72C0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
