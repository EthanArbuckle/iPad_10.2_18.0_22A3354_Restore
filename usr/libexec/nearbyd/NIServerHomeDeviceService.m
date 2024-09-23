@implementation NIServerHomeDeviceService

+ (id)sharedInstance
{
  if (qword_100858CC0 != -1)
    dispatch_once(&qword_100858CC0, &stru_10080D738);
  return (id)qword_100858CB8;
}

- (id)_initInternal
{
  NIServerHomeDeviceService *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMapTable *clients;
  NSMutableDictionary *v9;
  NSMutableDictionary *configurations;
  void *v11;
  unsigned int v12;
  OS_dispatch_queue *v13;
  _QWORD v15[4];
  NIServerHomeDeviceService *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NIServerHomeDeviceService;
  v2 = -[NIServerHomeDeviceService init](&v17, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.nearbyd.home-device-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    configurations = v2->_configurations;
    v2->_configurations = v9;

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("EnableStateDump")),
          v11,
          v12))
    {
      v13 = v2->_queue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1001DBFF8;
      v15[3] = &unk_10080A8A0;
      v16 = v2;
      os_state_add_handler(v13, v15);

    }
  }
  return v2;
}

- (void)addServiceClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (v11)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001DC120;
    block[3] = &unk_10080A2B8;
    block[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v11;
    dispatch_sync((dispatch_queue_t)queue, block);

  }
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  NIServerHomeDeviceService *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DC338;
  v7[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (id)printableState
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1001DC4D4;
  v10 = sub_1001DC4E4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001DC4EC;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  NSMutableArray *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d clients"), -[NSMapTable count](self->_clients, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)_processCommonConfiguration
{
  NSMutableDictionary *configurations;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 3;
  configurations = self->_configurations;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DC700;
  v7[3] = &unk_10080D760;
  v7[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](configurations, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator"));
  v5 = 0;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));

    if (!v6)
      break;
    v5 = v6;
    if ((objc_opt_respondsToSelector(v6, "didUpdateMinimumPreferredUpdateRate:") & 1) != 0)
    {
      v5 = v6;
      objc_msgSend(v6, "didUpdateMinimumPreferredUpdateRate:", v9[3]);
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
