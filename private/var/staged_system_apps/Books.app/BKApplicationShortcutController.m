@implementation BKApplicationShortcutController

+ (void)preWarmWithLibrary:(id)a3 annotationProvider:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B57BC;
  block[3] = &unk_1008E7338;
  v9 = a3;
  v10 = a4;
  v5 = qword_1009F51D0;
  v6 = v10;
  v7 = v9;
  if (v5 != -1)
    dispatch_once(&qword_1009F51D0, block);

}

+ (void)performUpdate
{
  objc_msgSend((id)qword_1009F51C8, "_updateShortcuts");
}

- (BKApplicationShortcutController)initWithLibrary:(id)a3
{
  id v4;
  BKApplicationShortcutController *v5;
  BKApplicationShortcutController *v6;
  id v7;
  id v8;
  void *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *shortcutIconGenerationSerialQueue;
  void *v14;
  void *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BKApplicationShortcutController;
  v5 = -[BKApplicationShortcutController init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    -[BKApplicationShortcutController setMainLibrary:](v5, "setMainLibrary:", v4);
    objc_initWeak(&location, v6);
    v7 = objc_alloc((Class)BUCoalescingCallBlock);
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1001B59E8;
    v20 = &unk_1008E8718;
    objc_copyWeak(&v21, &location);
    v8 = objc_msgSend(v7, "initWithNotifyBlock:blockDescription:", &v17, CFSTR("BKApplicationShortcutController"));
    -[BKApplicationShortcutController setCoalescedUpdate:](v6, "setCoalescedUpdate:", v8, v17, v18, v19, v20);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKApplicationShortcutController coalescedUpdate](v6, "coalescedUpdate"));
    objc_msgSend(v9, "setCoalescingDelay:", 1.0);

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("BKApplicationShortcutController.shortcutIconCreationQueue", v11);
    shortcutIconGenerationSerialQueue = v6->_shortcutIconGenerationSerialQueue;
    v6->_shortcutIconGenerationSerialQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v14, "addObserver:", v6);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)BKApplicationShortcutController;
  -[BKApplicationShortcutController dealloc](&v5, "dealloc");
}

- (void)_updateShortcuts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKApplicationShortcutController coalescedUpdate](self, "coalescedUpdate"));
  objc_msgSend(v2, "signalWithCompletion:", &stru_1008EE508);

}

- (void)_performUpdateShortCutsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKApplicationShortcutController mainLibrary](self, "mainLibrary"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B5D20;
  v7[3] = &unk_1008EA548;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBackgroundReadOnlyBlock:", v7);

}

- (void)managedObjectContextDidSave:(id)a3
{
  void *v4;
  NSPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  NSPredicate *v9;
  void *v10;
  void *v11;
  void *v12;
  NSPredicate *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSInsertedObjectsKey));
  v5 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF isKindOfClass: %@"), objc_opt_class(BKLibraryAsset));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredSetUsingPredicate:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSDeletedObjectsKey));
  v9 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF isKindOfClass: %@"), objc_opt_class(BKLibraryAsset));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredSetUsingPredicate:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSUpdatedObjectsKey));
  v13 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF isKindOfClass: %@"), objc_opt_class(BKLibraryAsset));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredSetUsingPredicate:", v14));

  if (objc_msgSend(v7, "count") || objc_msgSend(v11, "count") || objc_msgSend(v15, "count"))
    -[BKApplicationShortcutController _updateShortcuts](self, "_updateShortcuts");

}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  objc_msgSend((id)qword_1009F51C8, "_updateShortcuts", a3);
}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_loadWeakRetained((id *)&self->_annotationProvider);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationProvider, a3);
}

- (NSArray)currentBookShortcuts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentBookShortcuts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BKLibraryAssetProvider)mainLibrary
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_mainLibrary);
}

- (void)setMainLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_mainLibrary, a3);
}

- (BUCoalescingCallBlock)coalescedUpdate
{
  return self->_coalescedUpdate;
}

- (void)setCoalescedUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedUpdate, a3);
}

- (OS_dispatch_queue)shortcutIconGenerationSerialQueue
{
  return self->_shortcutIconGenerationSerialQueue;
}

- (void)setShortcutIconGenerationSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutIconGenerationSerialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIconGenerationSerialQueue, 0);
  objc_storeStrong((id *)&self->_coalescedUpdate, 0);
  objc_destroyWeak((id *)&self->_mainLibrary);
  objc_storeStrong((id *)&self->_currentBookShortcuts, 0);
  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end
