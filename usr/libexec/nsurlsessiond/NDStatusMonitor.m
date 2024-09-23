@implementation NDStatusMonitor

- (NDStatusMonitor)init
{
  NDStatusMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *clients;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NDStatusMonitor;
  v2 = -[NDStatusMonitor init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v3;

    v2->_networkChangeEventCount = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.nsurlsessiond.status-monitor", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)dealloc
{
  __SCDynamicStore *dynamicStore;
  objc_super v4;

  -[NDStatusMonitor stop](self, "stop");
  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
    CFRelease(dynamicStore);
  v4.receiver = self;
  v4.super_class = (Class)NDStatusMonitor;
  -[NDStatusMonitor dealloc](&v4, "dealloc");
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 numberOfPreviousRetries:(unint64_t)a5
{
  -[NDStatusMonitor performCallbackAfterNetworkChangedEvent:identifier:delay:](self, "performCallbackAfterNetworkChangedEvent:identifier:delay:", a3, a4, (uint64_t)(exp2((double)a5) * 900.0));
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 delay:(int64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int64_t v14;

  v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000444D4;
  v11[3] = &unk_1000B1748;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)simulateNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  NDStatusMonitor *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000443D4;
  block[3] = &unk_1000B2418;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)handleBetterNetworkEvent
{
  NSObject *v3;
  NSObject *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *clients;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received symptom that we may be on a better network", buf, 2u);
  }
  if (-[NSMutableSet count](self->_clients, "count"))
  {
    v4 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "executing blocks waiting for network change", buf, 2u);
    }
    v5 = self->_clients;
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = self->_clients;
    self->_clients = v6;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client", (_QWORD)v15));
          objc_msgSend(v13, "statusMonitor:callbackForIdentifier:networkChanged:", self, objc_msgSend(v12, "identifier"), 1);

        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v14 = symptom_create("com.apple.symptoms.discretionary.no.task");
    symptom_send(v14);

  }
}

- (void)startMonitoringDynamicStore
{
  __SCDynamicStore *dynamicStore;
  __SCDynamicStore *v4;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v6;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v8;
  __CFArray *Mutable;
  __CFArray *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  int v14;
  SCDynamicStoreContext context;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
    goto LABEL_10;
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v4 = SCDynamicStoreCreate(0, CFSTR("com.apple.nsurlsessiond"), (SCDynamicStoreCallBack)sub_1000443C0, &context);
  if (v4)
  {
    NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    v6 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv6);
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
    v8 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v10 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, NetworkGlobalEntity);
    CFArrayAppendValue(Mutable, v6);
    CFArrayAppendValue(v10, NetworkInterfaceEntity);
    CFArrayAppendValue(v10, v8);
    if (SCDynamicStoreSetNotificationKeys(v4, Mutable, v10))
    {
      self->_dynamicStore = v4;
    }
    else
    {
      v11 = (id)qword_1000C7158;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = SCError();
        v13 = SCErrorString(v12);
        v14 = SCError();
        *(_DWORD *)buf = 136315394;
        v17 = v13;
        v18 = 1024;
        v19 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SCDynamicStoreSetNotificationKeys failed: %s [%d]", buf, 0x12u);
      }

      CFRelease(v4);
    }
    CFRelease(NetworkGlobalEntity);
    CFRelease(v6);
    CFRelease(NetworkInterfaceEntity);
    CFRelease(v8);
    CFRelease(Mutable);
    CFRelease(v10);
  }
  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
LABEL_10:
    SCDynamicStoreSetDispatchQueue(dynamicStore, (dispatch_queue_t)self->_queue);
}

- (void)stopMonitoringDynamicStore
{
  __SCDynamicStore *dynamicStore;

  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
}

- (void)start
{
  NSObject *queue;
  _QWORD handler[5];

  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000443B8;
  handler[3] = &unk_1000B1DA0;
  handler[4] = self;
  notify_register_dispatch("com.apple.symptoms.managed_events.joined-known-good-network", &self->_symptomToken, queue, handler);
}

- (void)stop
{
  int symptomToken;

  symptomToken = self->_symptomToken;
  if (symptomToken)
  {
    notify_cancel(symptomToken);
    self->_symptomToken = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

+ (id)sharedMonitor
{
  if (qword_1000C7068 != -1)
    dispatch_once(&qword_1000C7068, &stru_1000B1720);
  return (id)qword_1000C7070;
}

@end
