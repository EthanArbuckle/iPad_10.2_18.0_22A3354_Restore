@implementation TrafficIncidentsSourceManager

+ (id)sharedInstance
{
  if (qword_1014D2F20 != -1)
    dispatch_once(&qword_1014D2F20, &stru_1011C0AD8);
  return (id)qword_1014D2F18;
}

- (TrafficIncidentsSourceManager)init
{
  TrafficIncidentsSourceManager *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *cachedIncidentsPersonalizedItems;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *cachedIncidentsPersonalizedItemsLockQueue;
  NSMutableArray *v10;
  NSMutableArray *cachedVKTrafficIncidentFeatureItems;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cachedVKTrafficIncidentFeatureItemsLockQueue;
  TrafficIncidentsSourceManager *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TrafficIncidentsSourceManager;
  v2 = -[TrafficIncidentsSourceManager init](&v18, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
    objc_msgSend(v3, "addObserver:", v2);

    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedIncidentsPersonalizedItems = v2->_cachedIncidentsPersonalizedItems;
    v2->_cachedIncidentsPersonalizedItems = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("TrafficIncidentsSourceManager.cachedIncidentsPersonalizedItemsLock", v7);
    cachedIncidentsPersonalizedItemsLockQueue = v2->_cachedIncidentsPersonalizedItemsLockQueue;
    v2->_cachedIncidentsPersonalizedItemsLockQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedVKTrafficIncidentFeatureItems = v2->_cachedVKTrafficIncidentFeatureItems;
    v2->_cachedVKTrafficIncidentFeatureItems = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("TrafficIncidentsSourceManager.cachedVKTrafficIncidentFeatureItemsLock", v13);
    cachedVKTrafficIncidentFeatureItemsLockQueue = v2->_cachedVKTrafficIncidentFeatureItemsLockQueue;
    v2->_cachedVKTrafficIncidentFeatureItemsLockQueue = (OS_dispatch_queue *)v14;

    -[TrafficIncidentsSourceManager _refreshDataSource](v2, "_refreshDataSource");
    v16 = v2;
  }

  return v2;
}

- (id)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___TrafficIncidentsSourceManagerObserver, &_dispatch_main_q);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (id)cachedIncidentsPersonalizedItems
{
  NSObject *cachedIncidentsPersonalizedItemsLockQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006E78E8;
  v10 = sub_1006E78F8;
  v11 = 0;
  cachedIncidentsPersonalizedItemsLockQueue = self->_cachedIncidentsPersonalizedItemsLockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006E7900;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedIncidentsPersonalizedItemsLockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)cachedVKTrafficIncidentFeatureItemsForSelectedRoute:(id)a3
{
  id v5;
  GEOComposedRoute *v6;
  NSObject *cachedVKTrafficIncidentFeatureItemsLockQueue;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];

  v5 = a3;
  v25 = v5;
  if (v5)
  {
    v6 = (GEOComposedRoute *)v5;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_1006E78E8;
    v37 = sub_1006E78F8;
    v38 = 0;
    cachedVKTrafficIncidentFeatureItemsLockQueue = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006E7C4C;
    block[3] = &unk_1011ADF48;
    block[4] = self;
    block[5] = &v33;
    dispatch_sync(cachedVKTrafficIncidentFeatureItemsLockQueue, block);
    if (self->_selectedRoute == v6 && objc_msgSend((id)v34[5], "count"))
    {
      v23 = (id)v34[5];
    }
    else
    {
      objc_storeStrong((id *)&self->_selectedRoute, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleReports"));
      v10 = objc_msgSend(v9, "copy");

      v11 = objc_alloc_init((Class)NSMutableArray);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
            v18 = objc_msgSend(v17, "isIncidentTypeDisplayedOnMap:", objc_msgSend(v16, "incidentType"));

            if ((v18 & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager _VKTrafficIncidentFeatureForIncidentReport:](self, "_VKTrafficIncidentFeatureForIncidentReport:", v16));
              if (v19)
                objc_msgSend(v11, "addObject:", v19);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
        }
        while (v13);
      }

      v20 = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1006E7C84;
      v26[3] = &unk_1011AC8B0;
      v26[4] = self;
      v21 = v11;
      v27 = v21;
      dispatch_sync(v20, v26);
      v22 = v27;
      v23 = v21;

    }
    _Block_object_dispose(&v33, 8);

  }
  else
  {
    v23 = &__NSArray0__struct;
  }

  return v23;
}

- (void)_addVKTrafficIncidentFeatureItemToCache:(id)a3
{
  void *v4;
  NSObject *cachedVKTrafficIncidentFeatureItemsLockQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager _VKTrafficIncidentFeatureForIncidentReport:](self, "_VKTrafficIncidentFeatureForIncidentReport:", a3));
  cachedVKTrafficIncidentFeatureItemsLockQueue = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006E7D34;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(cachedVKTrafficIncidentFeatureItemsLockQueue, block);

}

- (id)_VKTrafficIncidentFeatureForIncidentReport:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = +[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:](TrafficIncidentLayoutItem, "vkTrafficIncidentTypeForGEOType:", objc_msgSend(v4, "incidentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "latLng"));
  objc_msgSend(v7, "lat");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemLocation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "latLng"));
  objc_msgSend(v11, "lng");
  v13 = v12;

  v14 = objc_alloc((Class)VKUserReportedTrafficIncident);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
  v17 = objc_msgSend(v14, "initWithIncidentType:uniqueIdentifier:position:onRoute:", v5, v16, self->_selectedRoute, v9, v13, 1.79769313e308);

  return v17;
}

- (void)_addReport:(id)a3
{
  void *v4;
  unsigned int v5;
  TrafficIncidentPersonalizedItem *v6;
  NSObject *cachedIncidentsPersonalizedItemsLockQueue;
  TrafficIncidentPersonalizedItem *v8;
  id v9;
  _QWORD block[5];
  TrafficIncidentPersonalizedItem *v11;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v5 = objc_msgSend(v4, "isIncidentTypeDisplayedOnMap:", objc_msgSend(v9, "incidentType"));

  if (v5)
  {
    v6 = -[TrafficIncidentPersonalizedItem initWithIncidentReport:]([TrafficIncidentPersonalizedItem alloc], "initWithIncidentReport:", v9);
    cachedIncidentsPersonalizedItemsLockQueue = self->_cachedIncidentsPersonalizedItemsLockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006E7F40;
    block[3] = &unk_1011AC8B0;
    block[4] = self;
    v11 = v6;
    v8 = v6;
    dispatch_sync(cachedIncidentsPersonalizedItemsLockQueue, block);
    -[TrafficIncidentsSourceManager _addVKTrafficIncidentFeatureItemToCache:](self, "_addVKTrafficIncidentFeatureItemToCache:", v9);

  }
}

- (void)_refreshDataSource
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *cachedVKTrafficIncidentFeatureItems;
  NSMutableArray *v7;
  NSMutableArray *cachedIncidentsPersonalizedItems;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleReports"));

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cachedVKTrafficIncidentFeatureItems = self->_cachedVKTrafficIncidentFeatureItems;
  self->_cachedVKTrafficIncidentFeatureItems = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cachedIncidentsPersonalizedItems = self->_cachedIncidentsPersonalizedItems;
  self->_cachedIncidentsPersonalizedItems = v7;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[TrafficIncidentsSourceManager _addReport:](self, "_addReport:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), (_QWORD)v17);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager observers](self, "observers"));
  objc_msgSend(v14, "incidentsSourceManagerDidUpdate");

  v15 = sub_1006E80F4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "TrafficIncidentsSourceManager did update with reports %@", buf, 0xCu);
  }

}

- (void)incidentsStorageManagerDidAddReport:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  -[TrafficIncidentsSourceManager _addReport:](self, "_addReport:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsSourceManager observers](self, "observers"));
  objc_msgSend(v5, "incidentsSourceManagerDidUpdate");

  v6 = sub_1006E80F4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TrafficIncidentsSourceManager did update with report %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIncidentsPersonalizedItemsLockQueue, 0);
  objc_storeStrong((id *)&self->_cachedIncidentsPersonalizedItems, 0);
  objc_storeStrong((id *)&self->_cachedVKTrafficIncidentFeatureItemsLockQueue, 0);
  objc_storeStrong((id *)&self->_cachedVKTrafficIncidentFeatureItems, 0);
  objc_storeStrong((id *)&self->_selectedRoute, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
