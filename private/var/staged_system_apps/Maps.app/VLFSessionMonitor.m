@implementation VLFSessionMonitor

- (VLFSessionMonitor)initWithObserver:(id)a3
{
  id v4;
  VLFSessionMonitor *v5;
  VLFSessionMonitor *v6;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v4 = a3;
  if (!v4)
  {
    v8 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "-[VLFSessionMonitor initWithObserver:]";
      v16 = 2080;
      v17 = "VLFSessionMonitor.m";
      v18 = 1024;
      v19 = 23;
      v20 = 2080;
      v21 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)VLFSessionMonitor;
  v5 = -[VLFSessionMonitor init](&v13, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_observer, v4);

  return v6;
}

+ (BOOL)isEnabled
{
  return 0;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;

  if (self->_state != a3)
  {
    if (qword_1014D1D78 != -1)
      dispatch_once(&qword_1014D1D78, &stru_1011ACAF0);
    v5 = (id)qword_1014D1D70;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class(self);
      v7 = NSStringFromClass(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)v8;
      v10 = CFSTR("Hide");
      if (a3 == 1)
        v10 = CFSTR("EnablePuck");
      if (a3 == 2)
        v10 = CFSTR("EnablePuckAndBanner");
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: updating state: %@", (uint8_t *)&v12, 0x16u);

    }
    self->_state = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionMonitor observer](self, "observer"));
    objc_msgSend(v11, "monitor:didChangeState:", self, -[VLFSessionMonitor state](self, "state"));

  }
}

- (int64_t)state
{
  return self->_state;
}

- (VLFSessionMonitorObserver)observer
{
  return (VLFSessionMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
