@implementation APPCBaseEventListener

+ (void)startListeners
{
  id v3;
  id v4;

  v3 = +[APPCIntegrityReportEventListener sharedInstance](APPCIntegrityReportEventListener, "sharedInstance");
  if (objc_msgSend(a1, "_isEventDatabaseStorageEnabled"))
    v4 = +[APPCEventStorageListener sharedInstance](APPCEventStorageListener, "sharedInstance");
}

- (APPCBaseEventListener)init
{
  APPCBaseEventListener *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APPCBaseEventListener;
  v2 = -[APPCBaseEventListener init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ap.promotedcontent.eventlisteners", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[APPCBaseEventListener start](v2, "start");
  }
  return v2;
}

- (void)start
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (void)stop
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationRegistrar"));
  objc_msgSend(v3, "removeHandlerWithIdentifier:", -[APPCBaseEventListener token](self, "token"));

}

- (void)dealloc
{
  objc_super v3;

  -[APPCBaseEventListener stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)APPCBaseEventListener;
  -[APPCBaseEventListener dealloc](&v3, "dealloc");
}

+ (BOOL)_isEventDatabaseStorageEnabled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;

  v2 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSEventDatabase));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isEventDatabaseStorageEnabled"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isEventDatabaseStorageEnabled"));
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }
  v7 = APLogForCategory(34);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("DISABLED");
    if (v6)
      v9 = CFSTR("ENABLED");
    v11 = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[Event Database] Event storage is: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)token
{
  return self->_token;
}

- (void)setToken:(int64_t)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
