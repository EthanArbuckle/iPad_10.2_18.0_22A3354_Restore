@implementation POISearchManager

- (POISearchManager)init
{
  POISearchManager *v2;
  NSMapTable *v3;
  NSMapTable *completionHandlers;
  POISearchManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)POISearchManager;
  v2 = -[POISearchManager init](&v7, "init");
  if (v2)
  {
    v3 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 5);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)_updateActivityIndicatorForIdentifier:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  void *v11;
  char v12;
  void *v13;
  NSMutableDictionary *loadingTokensForBusinessIDs;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_canShowActivityIndicatorForBusinessIDs, "objectForKeyedSubscript:", v17));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_loadingForBusinessIDs, "objectForKeyedSubscript:", v17));
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = v5 & v7;
  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_loadingTokensForBusinessIDs, "objectForKeyedSubscript:", v17));
  if (v8 == 1 && v9 == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LoadingIndicatorController sharedController](LoadingIndicatorController, "sharedController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "beginShowingLoadingIndicator"));

    loadingTokensForBusinessIDs = self->_loadingTokensForBusinessIDs;
    if (!loadingTokensForBusinessIDs)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16 = self->_loadingTokensForBusinessIDs;
      self->_loadingTokensForBusinessIDs = v15;

      loadingTokensForBusinessIDs = self->_loadingTokensForBusinessIDs;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](loadingTokensForBusinessIDs, "setObject:forKeyedSubscript:", v11, v17);
  }
  else
  {
    v11 = (void *)v9;
    if (v9)
      v12 = v8;
    else
      v12 = 1;
    if ((v12 & 1) == 0)
      -[NSMutableDictionary removeObjectForKey:](self->_loadingTokensForBusinessIDs, "removeObjectForKey:", v17);
  }

}

- (void)setCanShowActivityIndicator:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSMutableDictionary *canShowActivityIndicatorForBusinessIDs;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = sub_10066B10C(a4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  canShowActivityIndicatorForBusinessIDs = self->_canShowActivityIndicatorForBusinessIDs;
  v12 = (id)v7;
  if (v4)
  {
    if (!canShowActivityIndicatorForBusinessIDs)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v10 = self->_canShowActivityIndicatorForBusinessIDs;
      self->_canShowActivityIndicatorForBusinessIDs = v9;

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_canShowActivityIndicatorForBusinessIDs, "setObject:forKeyedSubscript:", v11, v12);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](canShowActivityIndicatorForBusinessIDs, "removeObjectForKey:", v7);
  }
  -[POISearchManager _updateActivityIndicatorForIdentifier:](self, "_updateActivityIndicatorForIdentifier:", v12);

}

- (void)_setLoading:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *loadingForBusinessIDs;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  loadingForBusinessIDs = self->_loadingForBusinessIDs;
  v11 = v6;
  if (v4)
  {
    if (!loadingForBusinessIDs)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_loadingForBusinessIDs;
      self->_loadingForBusinessIDs = v8;

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loadingForBusinessIDs, "setObject:forKeyedSubscript:", v10, v11);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](loadingForBusinessIDs, "removeObjectForKey:", v6);
  }
  -[POISearchManager _updateActivityIndicatorForIdentifier:](self, "_updateActivityIndicatorForIdentifier:", v11);

}

- (id)searchResultForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = sub_10066B10C(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_poiCache, "objectForKey:", v5));

  return v6;
}

- (void)_cacheAndHandleSearchResult:(id)a3 identifier:(id)a4 completionHandlers:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSCache *poiCache;
  NSCache *v12;
  NSCache *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  poiCache = self->_poiCache;
  if (!poiCache)
  {
    v12 = (NSCache *)objc_alloc_init((Class)NSCache);
    v13 = self->_poiCache;
    self->_poiCache = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v14, "addTileGroupObserver:queue:", self, &_dispatch_main_q);

    poiCache = self->_poiCache;
  }
  -[NSCache setObject:forKey:](poiCache, "setObject:forKey:", v8, v9);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

  -[NSMapTable removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v9, (_QWORD)v20);
  -[POISearchManager setCanShowActivityIndicator:forIdentifier:](self, "setCanShowActivityIndicator:forIdentifier:", 0, v9);

}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  -[NSCache removeAllObjects](self->_poiCache, "removeAllObjects", a3);
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 searchResultType:(unsigned int)a7 callbackQueue:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  POISearchManager *v31;
  unsigned int v32;
  void *v33;

  v11 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = sub_10066B10C(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_completionHandlers, "objectForKey:", v18));
  v20 = (id)v19;
  if (!v19)
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
    -[NSMapTable setObject:forKey:](self->_completionHandlers, "setObject:forKey:", v20, v18);
  }
  if (v15)
  {
    v21 = objc_msgSend(v15, "copy");
    objc_msgSend(v20, "addObject:", v21);

  }
  if (!v19)
  {
    objc_msgSend(v14, "setSource:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v23 = v22;
    if (v11)
    {
      v33 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", v24, 0, 0, v14));

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ticketForNonExpiredIdentifier:resultProviderID:contentProvider:traits:", v18, 0, 0, v14));
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10066B6D0;
    v28[3] = &unk_1011BF428;
    v29 = v20;
    v30 = v18;
    v31 = self;
    v32 = a7;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10066B860;
    v26[3] = &unk_1011ACCB8;
    v26[4] = self;
    v27 = v30;
    objc_msgSend(v25, "submitWithHandler:queue:networkActivity:", v28, v16, v26);

  }
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6
{
  -[POISearchManager searchForIdentifier:allowExpired:traits:completionHandler:searchResultType:callbackQueue:](self, "searchForIdentifier:allowExpired:traits:completionHandler:searchResultType:callbackQueue:", a3, a4, a5, a6, 9, &_dispatch_main_q);
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 callbackQueue:(id)a7
{
  -[POISearchManager searchForIdentifier:allowExpired:traits:completionHandler:searchResultType:callbackQueue:](self, "searchForIdentifier:allowExpired:traits:completionHandler:searchResultType:callbackQueue:", a3, a4, a5, a6, 9, a7);
}

- (void)didReceiveRAPNotification
{
  -[NSCache removeAllObjects](self->_poiCache, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingTokensForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_loadingForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_canShowActivityIndicatorForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
}

@end
