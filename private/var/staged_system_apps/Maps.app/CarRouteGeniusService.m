@implementation CarRouteGeniusService

+ (id)sharedService
{
  if (qword_1014D2A40 != -1)
    dispatch_once(&qword_1014D2A40, &stru_1011BCD98);
  return (id)qword_1014D2A38;
}

- (CarRouteGeniusService)init
{
  CarRouteGeniusService *v2;
  MNRouteGeniusRemoteService *v3;
  MNRouteGeniusRemoteService *remote;
  dispatch_queue_attr_t v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *innerQueue;
  NSString *name;
  id v13;
  OS_dispatch_queue *v14;
  MapsSuggestionsObservers *v15;
  MapsSuggestionsObservers *observers;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CarRouteGeniusService;
  v2 = -[CarRouteGeniusService init](&v18, "init");
  if (v2)
  {
    v3 = (MNRouteGeniusRemoteService *)objc_msgSend(objc_alloc((Class)MNRouteGeniusRemoteService), "initWithDelegate:", v2);
    remote = v2->_config.remote;
    v2->_config.remote = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = CFSTR("MapsSuggestionsRouteGeniusServiceQueue");
    v8 = v6;
    v9 = objc_msgSend(CFSTR("MapsSuggestionsRouteGeniusServiceQueue"), "copy");
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), v8);

    innerQueue = v2->_state.queue._innerQueue;
    v2->_state.queue._innerQueue = (OS_dispatch_queue *)v10;

    name = v2->_state.queue._name;
    v2->_state.queue._name = (NSString *)v9;

    v13 = objc_alloc((Class)MapsSuggestionsObservers);
    v14 = v2->_state.queue._innerQueue;
    v15 = (MapsSuggestionsObservers *)objc_msgSend(v13, "initWithCallbackQueue:name:", v14, CFSTR("MapsSuggestionsRouteGeniusServiceObservers"));
    observers = v2->_state.observers;
    v2->_state.observers = v15;

  }
  return v2;
}

- (void)start
{
  uint64_t Log;
  NSObject *v4;
  uint8_t v5[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusService");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "About to start RouteGeniusService", v5, 2u);
  }

  sub_1005CC004((NSObject **)&self->_state.queue, self, &stru_1011BCDD8);
}

- (void)forceReroute
{
  uint64_t Log;
  NSObject *v4;
  uint8_t v5[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusService");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "About to force RouteGenius to reroute", v5, 2u);
  }

  sub_1005CC004((NSObject **)&self->_state.queue, self, &stru_1011BCDF8);
}

- (void)stop
{
  uint64_t Log;
  NSObject *v4;
  uint8_t v5[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusService");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "About to stop RouteGeniusService", v5, 2u);
  }

  sub_1005CC004((NSObject **)&self->_state.queue, self, &stru_1011BCE18);
}

- (BOOL)isActive
{
  CarRouteGeniusService *v2;
  BOOL isActive;

  v2 = self;
  objc_sync_enter(v2);
  isActive = v2->_state.isActive;
  objc_sync_exit(v2);

  return isActive;
}

- (void)_isActive:(BOOL)a3
{
  CarRouteGeniusService *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_state.isActive = a3;
  objc_sync_exit(obj);

}

- (void)registerObserver:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusService");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering observer: %@", (uint8_t *)&v7, 0xCu);
  }

  -[MapsSuggestionsObservers registerObserver:handler:](self->_state.observers, "registerObserver:handler:", v4, &stru_1011BCE38);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusService");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unregistering observer: %@", (uint8_t *)&v7, 0xCu);
  }

  -[MapsSuggestionsObservers unregisterObserver:handler:](self->_state.observers, "unregisterObserver:handler:", v4, &stru_1011BCE58);
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  NSObject *innerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005CC8F8;
  block[3] = &unk_1011BCF38;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  innerQueue = self->_state.queue._innerQueue;
  v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)suggestion
{
  _QWORD *v3;
  NSObject *innerQueue;
  _QWORD *v5;
  const char *label;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[2];
  id (*v15)(uint64_t);
  void *v16;
  CarRouteGeniusService *v17;
  _QWORD block[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v15 = sub_1005CCE4C;
  v16 = &unk_1011BCF60;
  v17 = self;
  v3 = v14;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1005CCF74;
  v25 = sub_1005CCF84;
  v26 = 0;
  innerQueue = self->_state.queue._innerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005CCF8C;
  block[3] = &unk_1011BCFB0;
  v20 = &v21;
  v5 = v3;
  v19 = v5;
  label = dispatch_queue_get_label(innerQueue);
  if (label == dispatch_queue_get_label(0))
  {
    v8 = objc_autoreleasePoolPush();
    v9 = (uint64_t)v15((uint64_t)v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)v22[5];
    v22[5] = v10;

    objc_autoreleasePoolPop(v8);
    v7 = v5;
  }
  else
  {
    dispatch_sync(innerQueue, block);
    v7 = v19;
  }
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
