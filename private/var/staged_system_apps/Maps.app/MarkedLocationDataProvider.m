@implementation MarkedLocationDataProvider

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:", self);

      -[MarkedLocationDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);

    }
  }
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  void *v8;
  SearchResult *v9;
  SearchResult *markedLocation;
  SearchResult *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  id v18;
  SearchResult *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  if (self->_active)
  {
    v3 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customSearchResult"));

    if (objc_msgSend(v7, "type") == 3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
      v9 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customSearchResult"));
      markedLocation = self->_markedLocation;
      self->_markedLocation = v9;

      v11 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
      -[SearchResult processSearchResult:traits:](v11, "processSearchResult:traits:", self->_markedLocation, 0);
    }
    else
    {
      v11 = self->_markedLocation;
      self->_markedLocation = 0;
    }

    v12 = sub_100432EDC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class(self);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = NSStringFromSelector(a2);
      v18 = (id)objc_claimAutoreleasedReturnValue(v17);
      v19 = self->_markedLocation;
      if (v19)
      {
        -[SearchResult coordinate](self->_markedLocation, "coordinate");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v20, v21));
      }
      else
      {
        v22 = 0;
      }
      v23 = sub_10039E4FC(v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138413058;
      v26 = v16;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@, markedLocation = %@, notifyObservers = %@", buf, 0x2Au);
      if (v19)

    }
    if (v3)
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);

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

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
  -[MarkedLocationDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4, a5, a6, a7);
}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
  -[MarkedLocationDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4, a5);
}

- (BOOL)active
{
  return self->_active;
}

- (SearchResult)markedLocation
{
  return self->_markedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedLocation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
