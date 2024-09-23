@implementation RoutingAppSuggestionProvider

- (void)dealloc
{
  objc_super v3;

  -[RoutingAppSuggestionProvider reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)RoutingAppSuggestionProvider;
  -[RoutingAppSuggestionProvider dealloc](&v3, "dealloc");
}

- (void)requestSuggestionsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  double v6;
  double v7;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v6 = a3.longitude;
  v7 = a3.latitude;
  -[RoutingAppSuggestionProvider reset](self, "reset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("__internal__FakeTransitResponse"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("375380948,304231811,435490305,393428422,322118666,292281611,358345871,380983340,330956157,389770860"), "componentsSeparatedByString:", CFSTR(",")));
    -[RoutingAppSuggestionProvider _requestAppDataForIds:](self, "_requestAppDataForIds:", v11);
LABEL_5:

    goto LABEL_6;
  }
  if (!self->_appInstallationDisallowed)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f"), *(_QWORD *)&v7, *(_QWORD *)&v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude));
    v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    objc_msgSend(v13, "setURLBagKey:", CFSTR("transit-apps-url"));
    objc_msgSend(v13, "setValue:forRequestParameter:", v11, CFSTR("loc1"));
    objc_msgSend(v13, "setValue:forRequestParameter:", v12, CFSTR("loc2"));
    v14 = objc_msgSend(objc_alloc((Class)SSURLConnectionRequest), "initWithRequestProperties:", v13);
    objc_msgSend(v14, "setDelegate:", self);
    -[RoutingAppSuggestionProvider showNetworkActivityIndicator:](self, "showNetworkActivityIndicator:", 1);
    objc_msgSend(v14, "start");

    goto LABEL_5;
  }
LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAppsManager defaultManager](RoutingAppsManager, "defaultManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007A8604;
  v16[3] = &unk_1011C6B00;
  v16[4] = self;
  objc_msgSend(v15, "loadRelevantRoutingAppsForSource:destination:completion:", v16, v7, v6, latitude, longitude);

}

- (void)showNetworkActivityIndicator:(BOOL)a3
{
  LoadingToken *v4;
  LoadingToken *networkActivity;
  LoadingToken *v6;
  LoadingToken *v7;

  if (a3)
  {
    v7 = (LoadingToken *)objc_claimAutoreleasedReturnValue(+[LoadingIndicatorController sharedController](LoadingIndicatorController, "sharedController"));
    v4 = (LoadingToken *)objc_claimAutoreleasedReturnValue(-[LoadingToken beginShowingLoadingIndicator](v7, "beginShowingLoadingIndicator"));
    networkActivity = self->_networkActivity;
    self->_networkActivity = v4;

    v6 = v7;
  }
  else
  {
    v6 = self->_networkActivity;
    self->_networkActivity = 0;
  }

}

- (void)reset
{
  -[RoutingAppSuggestionProvider setAllRoutingApps:](self, "setAllRoutingApps:", 0);
  self->_suggestedStoreApps = 0;
  *(_WORD *)&self->_loadedStoreSuggestions = 0;
  self->_appInstallationDisallowed = sub_100A16940() ^ 1;
}

- (void)_requestAppDataForIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[RoutingAppSuggestionProvider showNetworkActivityIndicator:](self, "showNetworkActivityIndicator:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppleMediaServices sharedInstance](MKAppleMediaServices, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007A8814;
  v10[3] = &unk_1011AE6F0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v9, 2, 7, v10, 62.0, 62.0, v8);

}

- (id)sortedAppsWithIds:(id)a3 appStoreApps:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (_QWORD)v22));
        v15 = objc_msgSend(v5, "indexOfObject:", v14);

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
          objc_msgSend(v7, "setObject:forKey:", v13, v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_1011C6B20));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsForKeys:notFoundMarker:", v18, v19));

  return v20;
}

- (void)_removeInstalledAppsFromStoreSuggestions
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *appStoreApps;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_allRoutingApps, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_allRoutingApps;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8), "bundleIdentifier"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  sub_100A133C4(CFSTR("Filtering the following installed apps from store suggestions: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsPassingTest:](self->_appStoreApps, "indexesOfObjectsPassingTest:", &stru_1011C6B60));
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self->_appStoreApps, "objectsAtIndexes:", v17));
  appStoreApps = self->_appStoreApps;
  self->_appStoreApps = v18;

}

- (void)_suggestFilteredStoreAppsIfReady
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (self->_loadedStoreSuggestions && !self->_suggestedStoreApps && self->_suggestedLocalApps)
  {
    self->_suggestedStoreApps = 1;
    -[RoutingAppSuggestionProvider _removeInstalledAppsFromStoreSuggestions](self, "_removeInstalledAppsFromStoreSuggestions");
    sub_100A133C4(CFSTR("Done loading store suggestions"), v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSuggestionProvider delegate](self, "delegate"));
    objc_msgSend(v11, "routingAppSuggestionProvider:didSuggestStoreApps:", self, self->_appStoreApps);

  }
}

- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  NSErrorUserInfoKey *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v5 = a4;
  -[RoutingAppSuggestionProvider showNetworkActivityIndicator:](self, "showNetworkActivityIndicator:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bodyData"));
  if (v6)
  {
    v35 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v35));
    v8 = v35;
    v16 = v8;
    if (v8)
    {
      v39[0] = NSLocalizedDescriptionKey;
      v39[1] = NSUnderlyingErrorKey;
      v40[0] = CFSTR("Failed to parse response.");
      v40[1] = v8;
      v17 = (const __CFString **)v40;
      v18 = (NSErrorUserInfoKey *)v39;
      v19 = 2;
    }
    else
    {
      sub_100A133C4(CFSTR("Store search response received: %@."), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
      v21 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v21) & 1) != 0)
      {
        v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("results")));
        if (!v22)
        {
LABEL_18:

          goto LABEL_19;
        }
        v30 = v7;
        v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v22, "count"));
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v22 = v22;
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v32 != v26)
                objc_enumerationMutation(v22);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("adamId")));
              objc_msgSend(v23, "addObject:", v28);

            }
            v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          }
          while (v25);
        }

        -[RoutingAppSuggestionProvider _requestAppDataForIds:](self, "_requestAppDataForIds:", v23);
        v7 = v30;
LABEL_17:

        goto LABEL_18;
      }
      v37 = NSLocalizedDescriptionKey;
      v38 = CFSTR("Expected dictionary as root JSON object and didn't get one.");
      v17 = &v38;
      v18 = &v37;
      v19 = 1;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, v19));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError searchErrorWithUserInfo:](NSError, "searchErrorWithUserInfo:", v29));

    v23 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSuggestionProvider delegate](self, "delegate"));
    objc_msgSend(v23, "routingAppSuggestionProvider:didFailToSuggestStoreApps:", self, v22);
    goto LABEL_17;
  }
  v41 = NSLocalizedDescriptionKey;
  v42 = CFSTR("SSURLConnectionRequest response was nil.");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError searchErrorWithUserInfo:](NSError, "searchErrorWithUserInfo:", v20));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSuggestionProvider delegate](self, "delegate"));
  objc_msgSend(v7, "routingAppSuggestionProvider:didFailToSuggestStoreApps:", self, v16);
LABEL_19:

}

- (RoutingAppSuggestionProviderDelegate)delegate
{
  return (RoutingAppSuggestionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)appInstallationDisallowed
{
  return self->_appInstallationDisallowed;
}

- (NSArray)allRoutingApps
{
  return self->_allRoutingApps;
}

- (void)setAllRoutingApps:(id)a3
{
  objc_storeStrong((id *)&self->_allRoutingApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_appStoreApps, 0);
  objc_storeStrong((id *)&self->_allRoutingApps, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
