@implementation PedestrianARSessionCarPlayConnectionMonitor

- (PedestrianARSessionCarPlayConnectionMonitor)initWithObserver:(id)a3
{
  PedestrianARSessionCarPlayConnectionMonitor *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  PedestrianARSessionCarPlayConnectionMonitor *v12;

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
  v3 = -[PedestrianARSessionMonitor initWithObserver:](&v10, "initWithObserver:", a3);
  if (v3)
  {
    v4 = sub_10033D6A0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v7 = NSStringFromSelector("state");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v3, v8, 0, 0);

    -[PedestrianARSessionCarPlayConnectionMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  NSString *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  PedestrianARSessionCarPlayConnectionMonitor *v10;

  v3 = sub_10033D6A0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = NSStringFromSelector("state");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v7, 0);

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
  -[PedestrianARSessionMonitor dealloc](&v8, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionCarPlayConnectionMonitorEnabled;
  v3 = off_1014B3FC8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  PedestrianARSessionCarPlayConnectionMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "state");

  v5 = sub_10033D6A0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 == (id)2)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      v8 = "[%{public}p] Detected that carplay is connected; updating state";
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    v9 = 134349056;
    v10 = self;
    v8 = "[%{public}p] Detected that carplay is not connected; updating state";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4 != (id)2);
}

- (id)debugDescription
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v2 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (unint64_t)objc_msgSend(v4, "state");
  if (v5 > 2)
    v6 = CFSTR("?");
  else
    v6 = off_1011B2380[v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\ncar display state: %@\n"), v3, v6));

  return v7;
}

+ (id)friendlyName
{
  return CFSTR("CarPlay Connection Monitor");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  PedestrianARSessionCarPlayConnectionMonitor *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = NSStringFromSelector("state");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) == 0)
  {

    goto LABEL_7;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));

  if (v15 != v11)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
    -[PedestrianARSessionCarPlayConnectionMonitor observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_8;
  }
  v16 = sub_10033D6A0();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Detected carplay connectivity state changed; updating state",
      buf,
      0xCu);
  }

  -[PedestrianARSessionCarPlayConnectionMonitor updateState](self, "updateState");
LABEL_8:

}

@end
