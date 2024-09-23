@implementation NIServerSystemConfigurator

+ (id)sharedInstance
{
  if (qword_10085A6C0 != -1)
    dispatch_once(&qword_10085A6C0, &stru_100810870);
  return (id)qword_10085A6B8;
}

- (id)_initInternal
{
  NSObject *v3;
  NIServerSystemConfigurator *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD block[4];
  NIServerSystemConfigurator *v12;
  objc_super v13;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#configurator,_initInternal", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerSystemConfigurator;
  v4 = -[NIServerSystemConfigurator init](&v13, "init");
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.nearbyd.system.configurator", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10025EED8;
    block[3] = &unk_1007FB340;
    v12 = v4;
    dispatch_sync(v9, block);

  }
  return v4;
}

- (void)activate
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025F0C8;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)addClient:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025F318;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)removeClientWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  NIServerSystemConfigurator *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025F5BC;
  v7[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)clientWithIdentifier:(id)a3 requestedPrewarmUWB:(BOOL)a4 prewarmSecureElementChannel:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025F7A4;
  block[3] = &unk_10080E0C0;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)clientWithIdentifier:(id)a3 notifiedResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD block[5];
  id v12;
  Class v13;
  BOOL v14;

  v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025FAE0;
  block[3] = &unk_100810898;
  block[4] = self;
  v12 = v8;
  v13 = a5;
  v14 = a4;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)clientWithIdentifier:(id)a3 notifiedPassiveAccessIntent:(unint64_t)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025FE8C;
  block[3] = &unk_10080F290;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

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
  v9 = sub_100260168;
  v10 = sub_100260178;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100260180;
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
  void *v3;
  void *v4;
  _BOOL8 activated;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *clientInfo;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  NSMutableArray *v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100260168;
  v18 = sub_100260178;
  v19 = objc_opt_new(NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)v15[5];
  activated = self->_activated;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemState descriptionInternal](self->_systemState, "descriptionInternal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Activated: %d. System state: %@"), activated, v6));
  objc_msgSend(v4, "addObject:", v7);

  v8 = (void *)v15[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Aggregated info from %d clients: %@"), -[NSMutableDictionary count](self->_clientInfo, "count"), self->_aggregatedClientInfo));
  objc_msgSend(v8, "addObject:", v9);

  clientInfo = self->_clientInfo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100260388;
  v13[3] = &unk_1008108C0;
  v13[4] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientInfo, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_autoreleasePoolPop(v3);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)_updateAggregatedClientInfo
{
  id v3;
  ConfiguratorClientInfo *v4;
  ConfiguratorClientInfo *aggregatedClientInfo;
  NSMutableDictionary *clientInfo;
  NSObject *v7;
  ConfiguratorClientInfo *v8;
  NSObject *v9;
  unsigned int v10;
  NSMutableDictionary *v11;
  unint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint8_t *v18;
  unsigned int v19;
  unsigned int v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t v25[8];
  char v26;
  _QWORD v27[5];
  unsigned int v28;
  _QWORD v29[5];
  uint8_t v30[4];
  uint8_t *v31;
  __int128 buf;
  uint64_t v33;
  int v34;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[ConfiguratorClientInfo copy](self->_aggregatedClientInfo, "copy");
  v4 = objc_opt_new(ConfiguratorClientInfo);
  aggregatedClientInfo = self->_aggregatedClientInfo;
  self->_aggregatedClientInfo = v4;

  clientInfo = self->_clientInfo;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100260848;
  v29[3] = &unk_1008108E8;
  v29[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientInfo, "enumerateKeysAndObjectsUsingBlock:", v29);
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_aggregatedClientInfo;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#configurator,Aggregated info - new: %@", (uint8_t *)&buf, 0xCu);
  }
  v9 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#configurator,Aggregated info - old: %@", (uint8_t *)&buf, 0xCu);
  }
  v10 = -[NSMutableDictionary count](self->_clientInfo, "count");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x2020000000;
  v34 = 0;
  v11 = self->_clientInfo;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100260854;
  v27[3] = &unk_100810910;
  v27[4] = &buf;
  v28 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB"))
  {
    -[ConfiguratorClientInfo prewarmUWB](self->_aggregatedClientInfo, "prewarmUWB");
    objc_msgSend(v3, "prewarmUWB");
  }
  if (+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB")
    && -[ConfiguratorClientInfo prewarmSecureElementChannel](self->_aggregatedClientInfo, "prewarmSecureElementChannel")
    && (objc_msgSend(v3, "prewarmSecureElementChannel") & 1) == 0)
  {
    v12 = -[NISystemState uwbPreciseDistanceAvailability](self->_systemState, "uwbPreciseDistanceAvailability");
    v13 = qword_10085F520;
    v14 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarm UWB-SE secure channel will be deferred until UWB is available", v25, 2u);
      }
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarming UWB-SE secure channel...", v25, 2u);
      }
      v15 = sub_1002CA108();
      v16 = sub_1002CA348((uint64_t)v15);
      v17 = (id)qword_10085F520;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        sub_100301BCC(v16, v25);
        v18 = v26 >= 0 ? v25 : *(uint8_t **)v25;
        *(_DWORD *)v30 = 136315138;
        v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarming UWB-SE secure channel... DONE. Status: %s", v30, 0xCu);
        if (v26 < 0)
          operator delete(*(void **)v25);
      }

    }
  }
  v19 = -[ConfiguratorClientInfo carKeyRangingLimitExceeded](self->_aggregatedClientInfo, "carKeyRangingLimitExceeded");
  if (v19 != objc_msgSend(v3, "carKeyRangingLimitExceeded"))
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100260950;
    v24[3] = &unk_100810938;
    v24[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v24);
  }
  v20 = -[ConfiguratorClientInfo acwgRangingLimitExceeded](self->_aggregatedClientInfo, "acwgRangingLimitExceeded");
  if (v20 != objc_msgSend(v3, "acwgRangingLimitExceeded"))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002609C0;
    v23[3] = &unk_100810938;
    v23[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v23);
  }
  v21 = -[ConfiguratorClientInfo passiveAccessIntent](self->_aggregatedClientInfo, "passiveAccessIntent");
  if (v21 != objc_msgSend(v3, "passiveAccessIntent"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100260A30;
    v22[3] = &unk_100810938;
    v22[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v22);
  }
  _Block_object_dispose(&buf, 8);

}

- (void)_relayBlockToClients:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_clients, "keyEnumerator"));
  while (1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
    if (!v5)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_clients, "objectForKey:", v5));
    if (v6)
      v7[2](v7, v6);

  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  NSObject *v7;
  int v8;
  void **v9;
  void **v10;
  void **v11;
  OS_dispatch_queue *queue;
  _QWORD v13[5];
  int v14;
  int v15;
  void *__p[2];
  char v17;
  void *v18[2];
  char v19;
  uint8_t buf[4];
  void **v21;
  __int16 v22;
  void **v23;

  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(v18, off_100810A38[a3]);
    v8 = v19;
    v9 = (void **)v18[0];
    sub_10000BF04(__p, off_100810A60[a4]);
    v10 = v18;
    if (v8 < 0)
      v10 = v9;
    if (v17 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    *(_DWORD *)buf = 136315394;
    v21 = v10;
    v22 = 2080;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#configurator,Ranging service updated state: %s. Cause: %s", buf, 0x16u);
    if (v17 < 0)
      operator delete(__p[0]);
    if (v19 < 0)
      operator delete(v18[0]);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100260D18;
  v13[3] = &unk_100809CD8;
  v13[4] = self;
  v14 = a3;
  v15 = a4;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  sub_10001AE68((uint64_t)&self->_uwbSystemListener);
  objc_storeStrong((id *)&self->_aggregatedClientInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
