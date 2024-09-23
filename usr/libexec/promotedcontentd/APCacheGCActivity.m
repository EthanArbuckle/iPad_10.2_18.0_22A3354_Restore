@implementation APCacheGCActivity

- (APCacheGCActivity)initWithCache:(id)a3
{
  id v4;
  APCacheGCActivity *v5;
  APCacheGCActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APCacheGCActivity;
  v5 = -[APCacheGCActivity init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_cache, v4);

  return v6;
}

- (NSString)taskID
{
  return (NSString *)CFSTR("com.apple.ap.promotedcontentd.gc");
}

- (BOOL)runActivity:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = APLogForCategory(33);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Starting Cache GC activity.", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGCActivity cache](self, "cache"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003CB5C;
  v10[3] = &unk_10020E150;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "startGCWithCompletionHandler:", v10);

  return 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, uint64_t))a4;
  v6 = APLogForCategory(33);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Request GC activity deferral.", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGCActivity cache](self, "cache"));
  objc_msgSend(v8, "stopGC");

  v5[2](v5, 1);
}

- (void)terminateActivity:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[APCacheGCActivity cache](self, "cache", a3));
  objc_msgSend(v3, "stopGC");

}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (APPersistentCache)cache
{
  return (APPersistentCache *)objc_loadWeakRetained((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->criteria, 0);
  objc_storeStrong((id *)&self->taskID, 0);
}

@end
