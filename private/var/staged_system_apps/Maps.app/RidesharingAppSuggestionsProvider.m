@implementation RidesharingAppSuggestionsProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5BCC8;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3D30 != -1)
    dispatch_once(&qword_1014D3D30, block);
  return (id)qword_1014D3D28;
}

- (void)fetchSuggestedAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A5BDF0;
  v12[3] = &unk_1011E0B08;
  v11 = v10;
  v13 = v11;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  -[RidesharingAppSuggestionsProvider _fetchAppIDsForSource:destination:withCompletion:](self, "_fetchAppIDsForSource:destination:withCompletion:", v12, v8, v7, latitude, longitude);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)_fetchAppIDsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 withCompletion:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f"), *(_QWORD *)&v8, *(_QWORD *)&v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f,%f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude));
  v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v13, "setTimeoutInterval:", 15.0);
  objc_msgSend(v13, "setAllowedRetryCount:", 0);
  objc_msgSend(v13, "setURLBagKey:", CFSTR("map-apps-search"));
  objc_msgSend(v13, "setValue:forRequestParameter:", CFSTR("ridesharing"), CFSTR("term"));
  objc_msgSend(v13, "setValue:forRequestParameter:", CFSTR("INRequestRideIntent,INListRideOptionsIntent,INGetRideStatusIntent"), CFSTR("intent"));
  objc_msgSend(v13, "setValue:forRequestParameter:", v11, CFSTR("loc1"));
  objc_msgSend(v13, "setValue:forRequestParameter:", v12, CFSTR("loc2"));
  objc_msgSend(v13, "setValue:forRequestParameter:", CFSTR("com.apple.Maps"), CFSTR("caller"));
  objc_msgSend(v13, "setValue:forRequestParameter:", CFSTR("1"), CFSTR("version"));
  v14 = objc_msgSend(objc_alloc((Class)SSURLConnectionRequest), "initWithRequestProperties:", v13);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A5C0E8;
  v16[3] = &unk_1011E0B30;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "startWithConnectionResponseBlock:", v16);

}

- (void)_fetchAppDataForAppIDs:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppleMediaServices sharedInstance](MKAppleMediaServices, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v10 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A5C548;
  v12[3] = &unk_1011AE268;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v7, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v6, 1, 5, v12, 62.0, 62.0, v10);

}

- (id)_searchErrorWithUserInfo:(id)a3
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RideSharingAppsStoreSuggestions.Search"), 100, a3);
}

- (id)_applicationsAfterFilteringOutInstalledApplicationsFromApplications:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isAppInstalled", (_QWORD)v13) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v4, "copy");
  return v11;
}

- (id)partitionedApplicationSuggestionsFromSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  RidesharingPartitionedAppSuggestions *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppSuggestionsProvider _applicationsAfterFilteringOutInstalledApplicationsFromApplications:](self, "_applicationsAfterFilteringOutInstalledApplicationsFromApplications:", v4));
  v6 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "removeObjectsInArray:", v5);
  v7 = -[RidesharingPartitionedAppSuggestions initWithInstalledSuggestions:notInstalledSuggestions:]([RidesharingPartitionedAppSuggestions alloc], "initWithInstalledSuggestions:notInstalledSuggestions:", v6, v5);

  return v7;
}

@end
