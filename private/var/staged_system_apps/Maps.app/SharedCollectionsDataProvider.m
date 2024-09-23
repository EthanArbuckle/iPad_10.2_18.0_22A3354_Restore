@implementation SharedCollectionsDataProvider

- (SharedCollectionsDataProvider)init
{
  SharedCollectionsDataProvider *v2;
  SharedCollectionsDataProvider *v3;
  NSArray *sharedCollections;
  uint64_t v5;
  NSMutableArray *mutableCollections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SharedCollectionsDataProvider;
  v2 = -[SharedCollectionsDataProvider init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    sharedCollections = v2->_sharedCollections;
    v2->_sharedCollections = (NSArray *)&__NSArray0__struct;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mutableCollections = v3->_mutableCollections;
    v3->_mutableCollections = (NSMutableArray *)v5;

  }
  return v3;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[SharedCollectionsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
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
  id v6;
  NSArray *v7;
  NSArray *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  unsigned int v19;
  NSArray *v20;
  NSArray *sharedCollections;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;

  if (self->_active)
  {
    v3 = a3;
    v6 = sub_10039E080(self->_mutableCollections, &stru_1011DCAA0);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v7 == self->_sharedCollections)
      v9 = 1;
    else
      v9 = -[NSArray isEqual:](v7, "isEqual:");
    v10 = sub_100432EDC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class(self);
      v22 = v12;
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = sub_10039E4FC(v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = sub_10039E4FC(v9 ^ 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = -[NSMutableArray count](self->_mutableCollections, "count");
      *(_DWORD *)buf = 138413570;
      v24 = v12;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v18;
      v31 = 1024;
      v32 = v19 - -[NSArray count](v8, "count");
      v33 = 1024;
      v34 = -[NSArray count](v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@%@, collectionDidChange = %@, # loading collections = %d, # loaded collections = %d", buf, 0x36u);

    }
    if ((v9 & 1) == 0)
    {
      v20 = (NSArray *)-[NSArray copy](v8, "copy");
      sharedCollections = self->_sharedCollections;
      self->_sharedCollections = v20;

      if (v3)
        -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
    }

  }
}

- (void)addSharedCollection:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_mutableCollections, "containsObject:") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_mutableCollections, "addObject:", v4);
    objc_msgSend(v4, "addObserver:", self);
    -[SharedCollectionsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }

}

- (void)removeSharedCollection:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableCollections, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_mutableCollections, "removeObject:", v4);
    objc_msgSend(v4, "removeObserver:", self);
    -[SharedCollectionsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }

}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  -[SharedCollectionsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  -[SharedCollectionsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)sharedCollections
{
  return self->_sharedCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCollections, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mutableCollections, 0);
}

@end
