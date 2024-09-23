@implementation _DASComplicationManager

- (BOOL)isActiveComplication:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008400;
  block[3] = &unk_10015DB40;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (_DASComplicationManager)init
{
  _DASComplicationManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASComplicationManager;
  v2 = -[_DASComplicationManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.complicationsChangedQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    -[_DASComplicationManager registerForComplicationChangeNotifications](v2, "registerForComplicationChangeNotifications");
  }
  return v2;
}

+ (_DASComplicationManager)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C970;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABA10 != -1)
    dispatch_once(&qword_1001ABA10, block);
  return (_DASComplicationManager *)(id)qword_1001ABA18;
}

+ (id)obtainActiveComplications
{
  void *v2;
  uint64_t active;
  void *v4;
  void *v5;

  v2 = (void *)os_transaction_create("com.apple.dasd.activeComplications");
  active = _CDDCurrentActiveComplications();
  v4 = (void *)objc_claimAutoreleasedReturnValue(active);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  return v5;
}

+ (BOOL)watchIsPaired
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getPairedDevices"));

  LOBYTE(v2) = objc_msgSend(v3, "count") != 0;
  return (char)v2;
}

- (void)registerForComplicationChangeNotifications
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *queue;
  OS_dispatch_source *v9;
  OS_dispatch_source *timer;
  NSObject *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  OS_dispatch_queue *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  int v23;
  _QWORD v24[5];
  int out_token;
  _QWORD handler[5];

  if (objc_msgSend((id)objc_opt_class(self), "watchIsPaired"))
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.complicationsChangedQueue", v6);
    queue = self->_queue;
    self->_queue = v7;

    v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v9;

    dispatch_set_qos_class_fallback(self->_timer, 17);
    v11 = self->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006CC08;
    handler[3] = &unk_10015D4E0;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    out_token = 0;
    v12 = _CDDComplicationChangeOverCloudNotificationString();
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v12));
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = self->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006CDF8;
    v24[3] = &unk_10015D9B8;
    v24[4] = self;
    notify_register_dispatch(v14, &out_token, (dispatch_queue_t)v15, v24);

    v23 = 0;
    v16 = _CDDComplicationChangeNotificationString();
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v16));
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    v19 = self->_queue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006CE3C;
    v22[3] = &unk_10015D9B8;
    v22[4] = self;
    notify_register_dispatch(v18, &v23, (dispatch_queue_t)v19, v22);

    v20 = self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006CE80;
    v21[3] = &unk_10015D4E0;
    v21[4] = self;
    dispatch_sync((dispatch_queue_t)v20, v21);
  }
}

- (BOOL)isAnyActiveComplication:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v9;
  _DASComplicationManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D008;
  block[3] = &unk_10015D930;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

- (BOOL)isRecentlyAddedComplication:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D1C8;
  block[3] = &unk_10015E940;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (NSSet)activeComplications
{
  return self->_activeComplications;
}

- (void)setActiveComplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeComplications, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)lastComplicationChangeDate
{
  return self->_lastComplicationChangeDate;
}

- (void)setLastComplicationChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastComplicationChangeDate, a3);
}

- (NSSet)addedComplications
{
  return self->_addedComplications;
}

- (void)setAddedComplications:(id)a3
{
  objc_storeStrong((id *)&self->_addedComplications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedComplications, 0);
  objc_storeStrong((id *)&self->_lastComplicationChangeDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_activeComplications, 0);
}

@end
