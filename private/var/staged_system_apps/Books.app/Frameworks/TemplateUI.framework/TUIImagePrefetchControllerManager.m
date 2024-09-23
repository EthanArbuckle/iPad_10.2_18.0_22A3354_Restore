@implementation TUIImagePrefetchControllerManager

+ (id)sharedManager
{
  if (qword_2CB2F0 != -1)
    dispatch_once(&qword_2CB2F0, &stru_23E820);
  return (id)qword_2CB2E8;
}

- (TUIImagePrefetchControllerManager)init
{
  TUIImagePrefetchControllerManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_queue_t v7;
  OS_dispatch_queue *access;
  NSMutableDictionary *v9;
  NSMutableDictionary *map;
  uint64_t v11;
  NSHashTable *controllers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIImagePrefetchControllerManager;
  v2 = -[TUIImagePrefetchControllerManager init](&v14, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("TUIImagePrefetchControllerManager.workQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("TUIImagePrefetchControllerManager.access", 0);
    access = v2->_access;
    v2->_access = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    map = v2->_map;
    v2->_map = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    controllers = v2->_controllers;
    v2->_controllers = (NSHashTable *)v11;

  }
  return v2;
}

- (void)registerPrefetchController:(id)a3
{
  id v4;
  NSObject *access;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A240;
  block[3] = &unk_23D7D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(access, block);

}

- (void)unregisterPrefetchController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *access;
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controllerID"));
  v6 = objc_msgSend(v5, "copy");

  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A338;
  block[3] = &unk_23D7D0;
  block[4] = self;
  v14 = v4;
  v8 = v4;
  dispatch_sync(access, block);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3A344;
  v11[3] = &unk_23D7D0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (id)_controllerWithID:(id)a3
{
  id v4;
  NSObject *access;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_3A5BC;
  v16 = sub_3A5CC;
  v17 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A5D4;
  block[3] = &unk_23D7A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(access, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)prefetchResources:(id)a3 controllerID:(id)a4 loader:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3A7DC;
  v15[3] = &unk_23E620;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
