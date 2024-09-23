@implementation DistanceUnitDataProvider

- (DistanceUnitDataProvider)init
{
  DistanceUnitDataProvider *v2;
  DistanceUnitDataProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DistanceUnitDataProvider;
  v2 = -[DistanceUnitDataProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[DistanceUnitDataProvider _updateAndNotifyObservers:](v2, "_updateAndNotifyObservers:", 0);
  return v3;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = MNLocaleDidChangeNotification();
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_localeDidChange:", v6, 0);

      -[DistanceUnitDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v8, "removeObserver:name:object:", self, v7, 0);

    }
  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  unsigned int v7;
  int64_t v8;
  int64_t distanceUnit;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;

  if (self->_active)
  {
    v3 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v7 = objc_msgSend(v6, "_navigation_distanceUsesMetricSystem");
    if (v7)
      v8 = 1;
    else
      v8 = 2;

    distanceUnit = self->_distanceUnit;
    v10 = sub_100432EDC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)v16;
      v18 = CFSTR("Imperial");
      v19 = 138412802;
      v20 = v14;
      v21 = 2112;
      if (v7)
        v18 = CFSTR("Metric");
      v22 = v16;
      v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@, distance unit = %@", (uint8_t *)&v19, 0x20u);

    }
    if (v8 != distanceUnit)
    {
      self->_distanceUnit = v8;
      if (v3)
        -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
    }
  }
}

- (void)_localeDidChange:(id)a3
{
  -[DistanceUnitDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (BOOL)active
{
  return self->_active;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
