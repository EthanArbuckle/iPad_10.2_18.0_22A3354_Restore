@implementation PlaceCardOfflineMapProvider

- (PlaceCardOfflineMapProvider)initWithMapItem:(id)a3
{
  id v5;
  PlaceCardOfflineMapProvider *v6;
  GEOObserverHashTable *v7;
  GEOObserverHashTable *observers;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PlaceCardOfflineMapProvider;
  v6 = -[PlaceCardOfflineMapProvider init](&v16, "init");
  if (v6)
  {
    v7 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MUOfflineMapProviderObserver, &_dispatch_main_q);
    observers = v6->_observers;
    v6->_observers = v7;

    objc_storeStrong((id *)&v6->_mapItem, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    objc_msgSend(v9, "addObserver:", v6);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider mapItem](v6, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "offlineDownloadRegion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subscriptionInfoForRegion:", v13));
    -[PlaceCardOfflineMapProvider setSubscriptionInfo:](v6, "setSubscriptionInfo:", v14);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  objc_msgSend(v3, "removeObserver:", self);

  -[PlaceCardOfflineMapProvider setSubscriptionInfo:](self, "setSubscriptionInfo:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardOfflineMapProvider;
  -[PlaceCardOfflineMapProvider dealloc](&v4, "dealloc");
}

- (void)setSubscriptionInfo:(id)a3
{
  MapDataSubscriptionInfo *v5;
  MapDataSubscriptionInfo *subscriptionInfo;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  uint64_t v19;
  void *v20;
  MapDataSubscriptionInfo *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v5 = (MapDataSubscriptionInfo *)a3;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5 && !-[MapDataSubscriptionInfo isEqual:](subscriptionInfo, "isEqual:", v5))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v5;
    if (qword_1014D3A48 != -1)
      dispatch_once(&qword_1014D3A48, &stru_1011DCAC0);
    v7 = (id)qword_1014D3A50;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
          objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, v12, off_1014B7B40);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    if (qword_1014D3A48 != -1)
      dispatch_once(&qword_1014D3A48, &stru_1011DCAC0);
    v5 = v21;
    v14 = (id)qword_1014D3A50;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
          objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, v19, 0, off_1014B7B40);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

  }
}

- (int64_t)downloadState
{
  void *v3;
  char *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
  v4 = (char *)objc_msgSend(v3, "loadState");

  if ((unint64_t)(v4 - 1) < 2)
    return 5;
  if (v4 == (char *)3)
    return 1;
  if (v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_subscriptionInfo, "state"));
  v6 = (unint64_t)objc_msgSend(v5, "downloadState");

  if (v6 >= 6)
    return 0;
  return qword_100E3CB20[v6];
}

- (NSProgress)downloadProgress
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider subscriptionInfo](self, "subscriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloadProgress"));

  return (NSProgress *)v4;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)subscriptionInfosDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offlineDownloadRegion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionInfoForRegion:", v7));
  -[PlaceCardOfflineMapProvider setSubscriptionInfo:](self, "setSubscriptionInfo:", v8);

  -[GEOObserverHashTable offlineMapProviderUpdated:](self->_observers, "offlineMapProviderUpdated:", self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unsigned int v15;
  objc_super v16;
  _QWORD block[5];
  id v18;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014B7B40 != a6)
    goto LABEL_8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider subscriptionInfo](self, "subscriptionInfo"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "state"));
  if (v14 != v11)
  {

LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)PlaceCardOfflineMapProvider;
    -[PlaceCardOfflineMapProvider observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_9;
  }
  if (qword_1014D3A48 != -1)
    dispatch_once(&qword_1014D3A48, &stru_1011DCAC0);
  v15 = objc_msgSend((id)qword_1014D3A50, "containsObject:", v10);

  if (!v15)
    goto LABEL_8;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10095473C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v18, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_9:

}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (BOOL)isRegionDownloaded
{
  return self->_regionDownloaded;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
