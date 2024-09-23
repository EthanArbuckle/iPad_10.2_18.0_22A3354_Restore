@implementation PedestrianARSessionMonitor

- (PedestrianARSessionMonitor)initWithObserver:(id)a3
{
  id v4;
  PedestrianARSessionMonitor *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  char *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  if (!v4)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARSessionMonitor initWithObserver:]";
      v20 = 2080;
      v21 = "PedestrianARSessionMonitor.m";
      v22 = 1024;
      v23 = 23;
      v24 = 2080;
      v25 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PedestrianARSessionMonitor;
  v5 = -[PedestrianARSessionMonitor init](&v17, "init");
  if (v5)
  {
    v6 = sub_1006C06E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class(v5);
      v9 = NSStringFromClass(v8);
      v10 = (char *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 134349314;
      v19 = (const char *)v5;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ initializing", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  PedestrianARSessionMonitor *v10;
  __int16 v11;
  void *v12;

  v3 = sub_1006C06E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ deallocing", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionMonitor;
  -[PedestrianARSessionMonitor dealloc](&v8, "dealloc");
}

+ (BOOL)isEnabled
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "enablementGEOConfigKey");
  return GEOConfigGetBOOL(v2, v3);
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315650;
    v10 = "+[PedestrianARSessionMonitor enablementGEOConfigKey]";
    v11 = 2080;
    v12 = "PedestrianARSessionMonitor.m";
    v13 = 1024;
    v14 = 48;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = GEOConfigKey_InvalidBOOL[0];
  v8 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v8;
  *(_QWORD *)&result.var0.var0 = v7;
  return result;
}

- (void)setShouldShowPedestrianAR:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  PedestrianARSessionMonitor *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;

  if (self->_shouldShowPedestrianAR != a3)
  {
    v3 = a3;
    v5 = sub_1006C06E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(self);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v11 = v10;
      v13 = 134349570;
      v14 = self;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] %@: updating state: %@", (uint8_t *)&v13, 0x20u);

    }
    self->_shouldShowPedestrianAR = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionMonitor observer](self, "observer"));
    objc_msgSend(v12, "monitor:didChangeState:", self, self->_shouldShowPedestrianAR);

  }
}

+ (id)friendlyName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (BOOL)shouldShowPedestrianAR
{
  return self->_shouldShowPedestrianAR;
}

- (PedestrianARSessionMonitorObserver)observer
{
  return (PedestrianARSessionMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
