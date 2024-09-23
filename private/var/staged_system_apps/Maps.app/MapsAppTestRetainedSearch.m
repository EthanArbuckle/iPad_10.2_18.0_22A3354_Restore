@implementation MapsAppTestRetainedSearch

- (BOOL)runTest
{
  void *v3;
  NSString *v4;
  NSString *query;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  int64_t searchResultIndex;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchQuery")));
  query = self->_query;
  self->_query = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("autocompleteResultIndex")));
  if (objc_msgSend(v6, "length"))
    v7 = (int64_t)objc_msgSend(v6, "integerValue");
  else
    v7 = -1;

  self->_autocompleteResultIndex = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchResultIndex")));
  if (objc_msgSend(v8, "length"))
    v9 = (int64_t)objc_msgSend(v8, "integerValue");
  else
    v9 = -1;

  self->_searchResultIndex = v9;
  if (!-[NSString length](self->_query, "length"))
    goto LABEL_10;
  searchResultIndex = self->_searchResultIndex;
  if (self->_autocompleteResultIndex == -1)
  {
    if (searchResultIndex == -1)
      goto LABEL_10;
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v13, "pptTestResetForLaunchURL");

    v14 = objc_msgSend(v3, "_mapstest_mapType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_mapRegion"));
    -[MapsAppTest switchToMapType:](self, "switchToMapType:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v16, "setMapRegion:pitch:yaw:", v15, 0.0, 0.0);

    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10045DEAC;
    v19[3] = &unk_1011AD1E8;
    objc_copyWeak(&v21, &location);
    v17 = v12;
    v20 = v17;
    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    v11 = 1;
    goto LABEL_13;
  }
  if (searchResultIndex == -1)
    goto LABEL_12;
LABEL_10:
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)startAutoCompleteOrSearchTest
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);

  if (self->_autocompleteResultIndex == -1)
    -[MapsAppTestRetainedSearch startSearchTest](self, "startSearchTest");
  else
    -[MapsAppTestRetainedSearch startAutoCompleteTest](self, "startAutoCompleteTest");
}

- (void)startAutoCompleteTest
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;

  v5 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v5, "setSearchString:", self->_query);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "searchAutoCompleteTestReceiveResponse:", CFSTR("SearchDataProviderDidChangeDataNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v4, "pptTestAutocompleteSearchForFieldItem:", v5);

}

- (void)searchAutoCompleteTestReceiveResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *i;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t autocompleteResultIndex;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  id v37;
  MapsAppTestRetainedSearch *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SearchDataProviderQueryKey")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SearchDataProviderQueryResultGroupsKey")));

  v38 = self;
  if (objc_msgSend(v6, "isEqualToString:", self->_query))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v8;
    v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v37)
    {
      v32 = v8;
      v33 = v6;
      v34 = v4;
      obj = v9;
      v10 = 0;
      v11 = 0;
      v36 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v36)
            objc_enumerationMutation(obj);
          if (!v11)
          {
            v13 = 0;
            v14 = 0;
            v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            while (1)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
              v17 = objc_msgSend(v16, "count");

              if (v14 >= (unint64_t)v17)
                break;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v14));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "autocompleteObject"));
              v21 = objc_opt_class(MKLocalSearchCompletion);
              isKindOfClass = objc_opt_isKindOfClass(v20, v21);

              if ((isKindOfClass & 1) != 0)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v14));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "autocompleteObject"));

                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapItem"));
                v27 = v26;
                v11 = 0;
                if (v26)
                {
                  autocompleteResultIndex = v38->_autocompleteResultIndex;
                  if ((autocompleteResultIndex & 0x8000000000000000) == 0 && v13 == autocompleteResultIndex)
                    v11 = v26;
                  ++v13;
                }

                v10 = v25;
              }
              else
              {
                v11 = 0;
              }
              ++v14;
              if (v11)
                goto LABEL_21;
            }
            v11 = 0;
          }
LABEL_21:
          ;
        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v37);

      if (!v11)
      {
        v6 = v33;
        v4 = v34;
        v8 = v32;
        goto LABEL_28;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](v38, "testCoordinator"));
      objc_msgSend(v29, "pptTestSearchRetainQueryForSelectedSearchCompletion:", v10);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v30, "removeObserver:name:object:", v38, CFSTR("SearchDataProviderDidChangeDataNotification"), 0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v31, "addObserver:selector:name:object:", v38, "didPresentPlaceCard:", MKPlaceViewControllerDidShowNotification, 0);

      v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](v38, "testCoordinator"));
      objc_msgSend(v9, "pptTestPresentPlacecardWithMapItem:", v11);
      v6 = v33;
      v4 = v34;
      v8 = v32;
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }

LABEL_28:
  }

}

- (void)startSearchTest
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;

  v5 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v5, "setSearchString:", self->_query);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "searchSessionDidChangeSearchResults:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v4, "pptTestSearchForFieldItem:", v5);

}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t searchResultIndex;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0);

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = v16;
  if (v16)
  {
    searchResultIndex = self->_searchResultIndex;
    if ((searchResultIndex & 0x8000000000000000) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
      v10 = objc_msgSend(v9, "count");

      v6 = v16;
      if (searchResultIndex < (unint64_t)v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "results"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", self->_searchResultIndex));

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v14, "addObserver:selector:name:object:", self, "didPresentPlaceCard:", MKPlaceViewControllerDidShowNotification, 0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
        objc_msgSend(v15, "pptTestPresentPlaceCardForSearchResult:animated:", v13, 1);

        v6 = v16;
      }
    }
  }

}

- (void)didPresentPlaceCard:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKPlaceViewControllerDidShowNotification, 0);

  v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045E708;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)returnToRetainedAutoComplete
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  NSObject *v9;
  _QWORD v10[5];
  NSObject *v11;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10045E8A8;
  v10[3] = &unk_1011B5BB0;
  v10[4] = self;
  v4 = v3;
  v11 = v4;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("SearchDataProviderDidChangeDataNotification"), 0, v10);
  dispatch_group_enter(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10045E8D8;
  v8[3] = &unk_1011AD1C0;
  v9 = v4;
  v5 = v4;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayDidDismissNotification"), 0, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10045E8E0;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("returnToAutoComplete - suggestions received"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("returnToAutoComplete"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v6, "pptTestDismissTrayAnimated:assertTrayType:", 1, 1);

}

- (void)returnToSearchResults
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10045E9B0;
  v4[3] = &unk_1011AD1C0;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayDidDismissNotification"), 0, v4);
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("returnToSearchResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestDismissTrayAnimated:assertTrayType:", 1, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
