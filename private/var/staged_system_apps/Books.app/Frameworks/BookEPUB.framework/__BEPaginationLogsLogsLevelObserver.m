@implementation __BEPaginationLogsLogsLevelObserver

+ (__BEPaginationLogsLogsLevelObserver)shared
{
  if (qword_3C1B50[0] != -1)
    dispatch_once(qword_3C1B50, &stru_378A20);
  return (__BEPaginationLogsLogsLevelObserver *)(id)qword_3C1B48;
}

- (__BEPaginationLogsLogsLevelObserver)init
{
  __BEPaginationLogsLogsLevelObserver *v2;
  void *v3;
  uint64_t v4;
  NSDictionary *logLevels;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__BEPaginationLogsLogsLevelObserver;
  v2 = -[__BEPaginationLogsLogsLevelObserver init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("BEPaginationLogs")));
    logLevels = v2->_logLevels;
    v2->_logLevels = (NSDictionary *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "_userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

  }
  return v2;
}

- (void)_userDefaultsDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BEPaginationLogs")));
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &__NSDictionary0__struct;
  objc_storeStrong((id *)&self->_logLevels, v6);

}

- (void)setLogLevels:(id)a3
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *logLevels;

  v4 = (NSDictionary *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("BEPaginationLogs"));

  logLevels = self->_logLevels;
  self->_logLevels = v4;

}

- (void)setLevel:(id)a3 forLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[__BEPaginationLogsLogsLevelObserver logLevels](self, "logLevels"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
  -[__BEPaginationLogsLogsLevelObserver setLogLevels:](self, "setLogLevels:", v9);

}

- (NSDictionary)logLevels
{
  return self->_logLevels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logLevels, 0);
}

@end
