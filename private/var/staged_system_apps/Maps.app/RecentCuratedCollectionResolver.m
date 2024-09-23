@implementation RecentCuratedCollectionResolver

- (void)dealloc
{
  objc_super v3;

  -[RecentCuratedCollectionResolver _cancelTicket](self, "_cancelTicket");
  v3.receiver = self;
  v3.super_class = (Class)RecentCuratedCollectionResolver;
  -[RecentCuratedCollectionResolver dealloc](&v3, "dealloc");
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___RecentCuratedCollectionResolverObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)setRecentCuratedCollections:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *recentCuratedCollections;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *resolvedCuratedCollections;
  NSArray *v16;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_recentCuratedCollections != v4)
  {
    v16 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v16;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v16));
      recentCuratedCollections = self->_recentCuratedCollections;
      self->_recentCuratedCollections = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_recentCuratedCollections));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_resolvedCuratedCollections, "allKeys"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));

      objc_msgSend(v11, "minusSet:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_resolvedCuratedCollections));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
      objc_msgSend(v12, "removeObjectsForKeys:", v13);

      v14 = (NSDictionary *)objc_msgSend(v12, "copy");
      resolvedCuratedCollections = self->_resolvedCuratedCollections;
      self->_resolvedCuratedCollections = v14;

      -[RecentCuratedCollectionResolver _startTicket](self, "_startTicket");
      v5 = v16;
    }
  }

}

- (id)resolvedGEOPlaceCollectionForMapsSyncHistoryCuratedCollection:(id)a3
{
  id v4;
  NSDictionary *resolvedCuratedCollections;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  resolvedCuratedCollections = self->_resolvedCuratedCollections;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](resolvedCuratedCollections, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_1006FDFC8;
    v15 = sub_1006FDFD8;
    v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1006FDFE0;
    v10[3] = &unk_1011B8310;
    v10[4] = &v11;
    objc_msgSend(v7, "withValue:orError:", v10, &stru_1011C0EE8);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_collectionsNeedingResolution
{
  NSArray *recentCuratedCollections;
  id v3;
  _QWORD v5[5];

  recentCuratedCollections = self->_recentCuratedCollections;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006FE050;
  v5[3] = &unk_1011C0F10;
  v5[4] = self;
  v3 = sub_10039E080(recentCuratedCollections, v5);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)_cancelTicket
{
  MKMapServiceCuratedCollectionTicket *ticket;

  -[MKMapServiceCuratedCollectionTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

}

- (void)_startTicket
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  MKMapServiceCuratedCollectionTicket **p_ticket;
  MKMapServiceCuratedCollectionTicket *ticket;
  MKMapServiceCuratedCollectionTicket *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;

  -[RecentCuratedCollectionResolver _cancelTicket](self, "_cancelTicket");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCuratedCollectionResolver _collectionsNeedingResolution](self, "_collectionsNeedingResolution"));
  v4 = sub_10039DCD4(v3, &stru_1011C0F50);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend(v5, "count"))
  {
    v6 = sub_10043206C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Resolving curated collections for identifiers: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCuratedCollections:isBatchLookup:traits:", v10, 1, 0));
    ticket = self->_ticket;
    p_ticket = &self->_ticket;
    *p_ticket = (MKMapServiceCuratedCollectionTicket *)v11;

    v14 = *p_ticket;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1006FE290;
    v15[3] = &unk_1011AD9D0;
    objc_copyWeak(&v16, (id *)buf);
    -[MKMapServiceCuratedCollectionTicket submitWithHandler:networkActivity:](v14, "submitWithHandler:networkActivity:", v15, 0);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_mergeCollections:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSDictionary *v31;
  NSDictionary *resolvedCuratedCollections;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v5 = a3;
  v36 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionIdentifier"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v9);
  }
  v33 = v7;

  v14 = sub_10043206C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", v7));
    *(_DWORD *)buf = 138412546;
    v48 = v16;
    v49 = 2112;
    v50 = v36;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received resolved curated collections: %@, error = %@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSArray count](self->_recentCuratedCollections, "count")));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = self->_recentCuratedCollections;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v22), "mapItemIdentifier", v33));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_resolvedCuratedCollections, "objectForKeyedSubscript:", v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v23));
        if (v25)
        {
          v26 = (id)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v25));
LABEL_21:
          v28 = v26;
          goto LABEL_22;
        }
        v27 = objc_msgSend(v24, "isSuccess");
        if ((_DWORD)v27)
          goto LABEL_18;
        if (v36)
        {
          v26 = (id)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:"));
          goto LABEL_21;
        }
        if (v24)
        {
LABEL_18:
          v26 = v24;
          goto LABEL_21;
        }
        v29 = GEOErrorDomain(v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, -6, 0));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v34));

LABEL_22:
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      v20 = v30;
    }
    while (v30);
  }

  v31 = (NSDictionary *)objc_msgSend(v17, "copy");
  resolvedCuratedCollections = self->_resolvedCuratedCollections;
  self->_resolvedCuratedCollections = v31;

  -[RecentCuratedCollectionResolver _notifyObservers](self, "_notifyObservers");
}

- (void)_notifyObservers
{
  -[GEOObserverHashTable recentCuratedCollectionResolverDidUpdate:](self->_observers, "recentCuratedCollectionResolverDidUpdate:", self);
}

- (NSArray)recentCuratedCollections
{
  return self->_recentCuratedCollections;
}

- (NSDictionary)resolvedCuratedCollections
{
  return self->_resolvedCuratedCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedCuratedCollections, 0);
  objc_storeStrong((id *)&self->_recentCuratedCollections, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
