@implementation SARAnalytics

+ (void)captureAddStopAnalyticsForTransportType:(int)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a3 == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v5 = v3;
    v4 = 404;
  }
  else
  {
    if (a3)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v5 = v3;
    v4 = 401;
  }
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 6097, v4, 0);

}

+ (void)captureSelectCategory:(id)a3 fromDisplayedCategories:(id)a4 isAddStopTray:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  if (v5)
    v9 = 742;
  else
    v9 = 401;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayString"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:categoriesDisplayed:categorySelected:", 3005, v9, v10, v7, v8);

}

+ (void)captureShowSearchResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v5 = v3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_opt_new(NSMutableArray);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "_muid", (_QWORD)v14)));
          -[NSMutableArray addObject:](v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", CFSTR(", ")));
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2015, 104, v13);
}

+ (void)captureCancelSearchResults
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 18, 104, 0);

}

+ (void)captureListScrollUp
{
  void *v2;
  void *v3;
  SearchSessionAnalytics *v4;

  v4 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setAction:](v4, "setAction:", 7);
  -[SearchSessionAnalytics setTarget:](v4, "setTarget:", 104);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v2, "collectSearchSessionAnalytics:", v4);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", -[SearchSessionAnalytics action](v4, "action"), -[SearchSessionAnalytics target](v4, "target"), 0);

}

+ (void)captureListScrollDown
{
  void *v2;
  void *v3;
  SearchSessionAnalytics *v4;

  v4 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setAction:](v4, "setAction:", 8);
  -[SearchSessionAnalytics setTarget:](v4, "setTarget:", 104);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v2, "collectSearchSessionAnalytics:", v4);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", -[SearchSessionAnalytics action](v4, "action"), -[SearchSessionAnalytics target](v4, "target"), 0);

}

+ (void)captureListTapToShowTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 1039, 104, 0);

}

+ (void)captureListTapToHideTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 1038, 104, 0);

}

+ (void)captureMapSelectMapItem:(id)a3
{
  void *v3;
  SearchSessionAnalytics *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_geoMapItem"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v3, 0xFFFFFFFFLL, 0.0));

  v4 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setAction:](v4, "setAction:", 1017);
  -[SearchSessionAnalytics setTarget:](v4, "setTarget:", 506);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v5, "collectSearchSessionAnalytics:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:placeActionDetails:", -[SearchSessionAnalytics action](v4, "action"), -[SearchSessionAnalytics target](v4, "target"), 0, v7);

}

+ (void)captureMapTapToHideTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 1038, 506, 0);

}

+ (void)captureListStartDetourToMapItem:(id)a3 index:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char IsEnabled_Maps182;
  char v11;
  uint64_t v12;
  int IsEnabled_DrivingMultiWaypointRoutes;
  void *v14;
  id v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v6, a4, 0.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = objc_msgSend(v7, "navigationTransportType");
  switch((int)v8)
  {
    case 1:
    case 6:

      goto LABEL_8;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v8);
      goto LABEL_5;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v8);
LABEL_5:
      v11 = IsEnabled_Maps182;

      if ((v11 & 1) != 0)
        goto LABEL_6;
      goto LABEL_8;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v8, v9);

      if (IsEnabled_DrivingMultiWaypointRoutes)
LABEL_6:
        v12 = 6097;
      else
LABEL_8:
        v12 = 3001;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v14, "captureUserAction:onTarget:placeActionDetails:mapItem:resultIndex:", v12, 104, v15, v5, a4);

      return;
  }
}

+ (void)captureResumePreviousNavigation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3058, 616, 0);

}

@end
