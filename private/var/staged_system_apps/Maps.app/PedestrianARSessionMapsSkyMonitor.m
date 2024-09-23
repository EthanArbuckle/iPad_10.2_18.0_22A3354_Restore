@implementation PedestrianARSessionMapsSkyMonitor

- (PedestrianARSessionMapsSkyMonitor)initWithObserver:(id)a3
{
  PedestrianARSessionMapsSkyMonitor *v3;
  id v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  PedestrianARSessionMapsSkyMonitor *v9;

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARSessionMapsSkyMonitor;
  v3 = -[PedestrianARSessionMonitor initWithObserver:](&v7, "initWithObserver:", a3);
  if (v3)
  {
    v4 = sub_100A7594C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    MapsFeature_AddDelegateListener(MapsFeaturesConfig_PedestrianAREnabled[0], MapsFeaturesConfig_PedestrianAREnabled[1], &_dispatch_main_q, v3);
    -[PedestrianARSessionMapsSkyMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  PedestrianARSessionMapsSkyMonitor *v8;

  v3 = sub_100A7594C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  MapsFeature_RemoveDelegateListenerForAllKeys(self, v5);
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionMapsSkyMonitor;
  -[PedestrianARSessionMonitor dealloc](&v6, "dealloc");
}

- (void)updateState
{
  int IsAvailable_PedestrianAR;
  unsigned int IsEnabled_PedestrianAR;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  PedestrianARSessionMapsSkyMonitor *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;

  IsAvailable_PedestrianAR = MapsFeature_IsAvailable_PedestrianAR(self, a2);
  IsEnabled_PedestrianAR = MapsFeature_IsEnabled_PedestrianAR();
  v5 = sub_100A7594C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (IsAvailable_PedestrianAR)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    if (IsEnabled_PedestrianAR)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v9;
    v11 = 134349570;
    v12 = self;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating state with MapsSky authorized: %{public}@, Pedestrian AR Enabled: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", IsAvailable_PedestrianAR & IsEnabled_PedestrianAR);
}

+ (BOOL)isEnabled
{
  return 1;
}

- (NSString)debugDescription
{
  id v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;

  v2 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (MapsFeature_IsAvailable_PedestrianAR(v3, v4))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  if (MapsFeature_IsEnabled_PedestrianAR())
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nMapsSky authorized: %@\nPedestrian AR enabled: %@\n"), v3, v6, v7));

  return (NSString *)v8;
}

+ (id)friendlyName
{
  return CFSTR("MapsSky Monitor");
}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  id v5;
  NSObject *v6;
  int v7;
  PedestrianARSessionMapsSkyMonitor *v8;

  v5 = sub_100A7594C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] One of the Pedestrian AR flags changed; updating state",
      (uint8_t *)&v7,
      0xCu);
  }

  -[PedestrianARSessionMapsSkyMonitor updateState](self, "updateState");
}

@end
