@implementation HomePhotoLookupDataProvider

- (HomePhotoLookupDataProvider)initWithSuggestionsDataProvider:(id)a3
{
  id v5;
  HomePhotoLookupDataProvider *v6;
  HomePhotoLookupDataProvider *v7;
  void *v8;
  NSDictionary *ratingRequestSuggestions;
  uint64_t v10;
  NSMutableSet *inProgressLookups;
  NSDictionary *results;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomePhotoLookupDataProvider;
  v6 = -[HomePhotoLookupDataProvider init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionsDataProvider, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider observers](v7->_suggestionsDataProvider, "observers"));
    objc_msgSend(v8, "registerObserver:", v7);

    ratingRequestSuggestions = v7->_ratingRequestSuggestions;
    v7->_ratingRequestSuggestions = (NSDictionary *)&__NSDictionary0__struct;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    inProgressLookups = v7->_inProgressLookups;
    v7->_inProgressLookups = (NSMutableSet *)v10;

    results = v7->_results;
    v7->_results = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v7;
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
    if (a3)
      -[HomePhotoLookupDataProvider _performLookups](self, "_performLookups");
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

- (int64_t)resultForSuggestionsEntry:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomePhotoLookupDataProvider _lookupKeyForEntry:](self, "_lookupKeyForEntry:", v4));
  if (v5)
  {
    if ((-[NSMutableSet containsObject:](self->_inProgressLookups, "containsObject:", v5) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_results, "objectForKeyedSubscript:", v5));
      v8 = v7;
      if (v7)
      {
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        v10[4] = &v12;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100567E04;
        v11[3] = &unk_1011BB460;
        v11[4] = &v12;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100567E40;
        v10[3] = &unk_1011B17D0;
        objc_msgSend(v7, "withValue:orError:", v11, v10);
        v6 = v13[3];
        _Block_object_dispose(&v12, 8);
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (id)_lookupKeyForEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray](RatingRequestHomeAvailability, "shouldShowRatingRequestSuggestionsOnProactiveTray")&& (objc_msgSend(v3, "type") == (id)21|| GEOConfigGetBOOL(MapsConfig_ARPForceAllMapsHomeSuggestionsAsRatingSuggestions, off_1014B3A78)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MKMapItem"));
    if (v4
      && +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowPhotosCallToActionForMapItem:", v4))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_performLookups
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *ratingRequestSuggestions;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (self->_active)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider suggestions](self->_suggestionsDataProvider, "suggestions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomePhotoLookupDataProvider _lookupKeyForEntry:](self, "_lookupKeyForEntry:", v10));
          if (v11)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_ratingRequestSuggestions, "allKeys"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    if (v13 != v15 && (objc_msgSend(v13, "isEqual:", v15) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_ratingRequestSuggestions, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v15));
      objc_msgSend(v16, "minusSet:", v13);
      ratingRequestSuggestions = self->_ratingRequestSuggestions;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100568148;
      v18[3] = &unk_1011BB488;
      v18[4] = self;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](ratingRequestSuggestions, "enumerateKeysAndObjectsUsingBlock:", v18);
      -[HomePhotoLookupDataProvider _pruneOldResults](self, "_pruneOldResults");

    }
  }
}

- (void)_startLookupForEntry:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_opt_class(self);
    v9 = v8;
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412802;
    v31 = v8;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomePhotoLookupDataProvider _lookupKeyForEntry:](self, "_lookupKeyForEntry:", v5));
  if (v12)
  {
    if ((-[NSMutableSet containsObject:](self->_inProgressLookups, "containsObject:", v12) & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_results, "valueForKey:", v12));
      v14 = v13 == 0;

      if (v14)
      {
        -[NSMutableSet addObject:](self->_inProgressLookups, "addObject:", v12);
        objc_initWeak((id *)buf, self);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1005684D4;
        v27[3] = &unk_1011BB4B0;
        objc_copyWeak(&v29, (id *)buf);
        v15 = v5;
        v28 = v15;
        v16 = objc_retainBlock(v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MKMapItem"));
        if (v17)
        {
          v18 = sub_100B3A5D4();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "oneUser"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_geoMapItem"));
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1005685C8;
          v24[3] = &unk_1011BB500;
          v26 = v16;
          v25 = v17;
          objc_msgSend(v20, "hasVisitedMapItem:handler:", v21, v24);

          v22 = v26;
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HomePhotoLookupDataProviderErrorDomain"), 1, 0));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v22));
          ((void (*)(_QWORD *, void *))v16[2])(v16, v23);

        }
        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)buf);
      }
    }
  }

}

- (void)_setResult:(id)a3 forEntry:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_opt_class(self);
    v12 = v11;
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v19 = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, result = %@, entry = %@", (uint8_t *)&v19, 0x2Au);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomePhotoLookupDataProvider _lookupKeyForEntry:](self, "_lookupKeyForEntry:", v8));
  if (v15)
  {
    if (-[NSMutableSet containsObject:](self->_inProgressLookups, "containsObject:", v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_results, "valueForKey:", v15));

      if (!v16)
      {
        -[NSMutableSet removeObject:](self->_inProgressLookups, "removeObject:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_ratingRequestSuggestions, "objectForKeyedSubscript:", v15));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_results));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, v15);
          -[HomePhotoLookupDataProvider _updateResults:notifyObservers:](self, "_updateResults:notifyObservers:", v18, 1);

        }
      }
    }
  }

}

- (void)_pruneOldResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *results;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_results, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_ratingRequestSuggestions, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  objc_msgSend(v4, "minusSet:", v6);

  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_results));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), (_QWORD)v15);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = (NSDictionary *)objc_msgSend(v7, "copy");
    results = self->_results;
    self->_results = v13;

  }
}

- (void)_updateResults:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  NSDictionary *v6;
  NSDictionary *v7;
  unsigned __int8 v8;
  NSDictionary *v9;
  NSDictionary *results;
  NSDictionary *v11;

  v4 = a4;
  v6 = (NSDictionary *)a3;
  v7 = v6;
  if (self->_results != v6)
  {
    v11 = v6;
    v8 = -[NSDictionary isEqual:](v6, "isEqual:");
    v7 = v11;
    if ((v8 & 1) == 0)
    {
      v9 = (NSDictionary *)-[NSDictionary copy](v11, "copy");
      results = self->_results;
      self->_results = v9;

      v7 = v11;
      if (self->_active && v4)
      {
        -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
        v7 = v11;
      }
    }
  }

}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  -[HomePhotoLookupDataProvider _performLookups](self, "_performLookups", a3);
}

- (BOOL)active
{
  return self->_active;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_inProgressLookups, 0);
  objc_storeStrong((id *)&self->_ratingRequestSuggestions, 0);
}

@end
