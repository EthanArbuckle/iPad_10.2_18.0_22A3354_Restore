@implementation BKLibraryAssetStatusObserver

- (BKLibraryAssetStatusObserver)initWithFilter:(id)a3 notify:(id)a4
{
  id v6;
  id v7;
  BKLibraryAssetStatusObserver *v8;
  void *v9;
  uint64_t v10;
  IMArrayController *controller;
  id v12;
  id notify;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryAssetStatusObserver;
  v8 = -[BKLibraryAssetStatusObserver init](&v15, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_addArrayControllerWithFilter:", v6));
    controller = v8->_controller;
    v8->_controller = (IMArrayController *)v10;

    -[IMArrayController addObserver:forKeyPath:options:context:](v8->_controller, "addObserver:forKeyPath:options:context:", v8, CFSTR("arrangedObjects"), 3, off_DD340);
    v12 = objc_msgSend(v7, "copy");
    notify = v8->_notify;
    v8->_notify = v12;

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[IMArrayController removeObserver:forKeyPath:context:](self->_controller, "removeObserver:forKeyPath:context:", self, CFSTR("arrangedObjects"), off_DD340);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  objc_msgSend(v3, "_removeArrayController:", self->_controller);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAssetStatusObserver;
  -[BKLibraryAssetStatusObserver dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;

  if (off_DD340 == a6)
  {
    v11 = a5;
    v12 = objc_opt_class(NSArray);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSKeyValueChangeOldKey));
    v14 = BUDynamicCast(v12, v13);
    v23 = (id)objc_claimAutoreleasedReturnValue(v14);

    v15 = objc_opt_class(NSArray);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSKeyValueChangeNewKey));

    v17 = BUDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
    objc_msgSend(v19, "minusSet:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v23));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));
    objc_msgSend(v21, "minusSet:", v22);

    if (objc_msgSend(v19, "count") || objc_msgSend(v21, "count"))
      (*((void (**)(void))self->_notify + 2))();

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)BKLibraryAssetStatusObserver;
    v10 = a5;
    -[BKLibraryAssetStatusObserver observeValueForKeyPath:ofObject:change:context:](&v24, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v10, a6);

  }
}

- (IMArrayController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (id)notify
{
  return self->_notify;
}

- (void)setNotify:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notify, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
