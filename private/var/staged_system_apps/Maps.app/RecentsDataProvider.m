@implementation RecentsDataProvider

- (RecentsDataProvider)init
{
  RecentsDataProvider *v2;
  RecentsDataProvider *v3;
  NSArray *recents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RecentsDataProvider;
  v2 = -[RecentsDataProvider init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    recents = v2->_recents;
    v2->_recents = (NSArray *)&__NSArray0__struct;

  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = v5;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider _recentsEngine](self, "_recentsEngine"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_recentsDidChange:", CFSTR("RecentsDidChangeNotification"), v6);

      -[RecentsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);

    }
  }
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  if (self->_active)
  {
    v3 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider _recentsEngine](self, "_recentsEngine"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "orderedRecents"));
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = &__NSArray0__struct;
    objc_storeStrong((id *)&self->_recents, v9);

    self->_hasInitialData = 1;
    v10 = sub_100432EDC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = -[NSArray count](self->_recents, "count");
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      v22 = 1024;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@, # recents = %d", (uint8_t *)&v18, 0x1Cu);

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

- (id)_recentsEngine
{
  return +[Recents sharedRecents](Recents, "sharedRecents");
}

- (void)_recentsDidChange:(id)a3
{
  -[RecentsDataProvider setInitialDataHasBeenLoaded:](self, "setInitialDataHasBeenLoaded:", 1);
  -[RecentsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (void)deleteRecents:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v7 = a4;
  v8 = a3;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v17 = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v17, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider _recentsEngine](self, "_recentsEngine"));
  objc_msgSend(v16, "deleteRecents:completion:", v8, v7);

}

- (void)deleteAllRecentsWithCompletion:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v14, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider _recentsEngine](self, "_recentsEngine"));
  objc_msgSend(v13, "deleteAllRecentsWithCompletion:", v5);

}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (NSArray)recents
{
  return self->_recents;
}

- (BOOL)initialDataHasBeenLoaded
{
  return self->_initialDataHasBeenLoaded;
}

- (void)setInitialDataHasBeenLoaded:(BOOL)a3
{
  self->_initialDataHasBeenLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
