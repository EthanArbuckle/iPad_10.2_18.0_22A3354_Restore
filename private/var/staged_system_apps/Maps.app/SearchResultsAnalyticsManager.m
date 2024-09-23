@implementation SearchResultsAnalyticsManager

+ (void)didTapOnAddStopForSearchResultWithMapItem:(id)a3 indexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  GEOPlaceActionDetails *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
  v8 = +[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v7, objc_msgSend(v5, "row"), CFAbsoluteTimeGetCurrent());
  v11 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "captureUserAction:onTarget:placeActionDetails:mapItem:resultIndex:", 6097, 58, v11, v6, v10);
}

+ (void)userGeneratedGuideUnitTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 198, 101, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_USER_GENERATED_GUIDES"));

}

+ (void)curatedGuidesUnitTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 198, 101, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CURATED_GUIDES"));

}

+ (void)containmentParentUnitTappedWithMuid:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  objc_msgSend(v5, "setBusinessID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:placeActionDetails:", 198, 101, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CONTAINMENT"), v5);

}

+ (void)tappableEntryUnitTappedWithMuid:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  objc_msgSend(v5, "setBusinessID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:placeActionDetails:", 198, 101, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_STRING"), v5);

}

+ (void)accessoryEntityTappedWithMuid:(unint64_t)a3 eventValue:(id)a4
{
  id v5;
  SearchSessionAnalytics *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = objc_alloc_init((Class)GEOPlaceActionDetails);
  objc_msgSend(v9, "setBusinessID:", a3);
  v6 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setAction:](v6, "setAction:", 2031);
  -[SearchSessionAnalytics setTarget:](v6, "setTarget:", 101);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v7, "collectSearchSessionAnalytics:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:placeActionDetails:", -[SearchSessionAnalytics action](v6, "action"), -[SearchSessionAnalytics target](v6, "target"), v5, v9);

}

+ (void)directionsButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
  _objc_msgSend(a1, "accessoryEntityTappedWithMuid:eventValue:", a3, CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS"));
}

+ (void)lookAroundButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
  _objc_msgSend(a1, "accessoryEntityTappedWithMuid:eventValue:", a3, CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND"));
}

+ (void)callButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
  _objc_msgSend(a1, "accessoryEntityTappedWithMuid:eventValue:", a3, CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL"));
}

+ (void)websiteButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
  _objc_msgSend(a1, "accessoryEntityTappedWithMuid:eventValue:", a3, CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE"));
}

+ (void)flyoverButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
  _objc_msgSend(a1, "accessoryEntityTappedWithMuid:eventValue:", a3, CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER"));
}

+ (void)didScrollPhotoCarouselToLeft
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 6048, 101, 0);

}

+ (void)didScrollPhotoCarouselToRight
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 6049, 101, 0);

}

+ (void)didTapPhotoCarouselPhoto:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 6006, 101, v4);

}

+ (void)didScrollPhotoCarouselToEnd
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 459, 101, 0);

}

+ (void)didShowSearchResultsWithDataSource:(id)a3 target:(int)a4 query:(id)a5 impressionsSessionIdentifier:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v9 = a3;
  v25 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resultIdsWithDataSource:", v9));
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  if ((uint64_t)objc_msgSend(v11, "numberOfSections") >= 1)
  {
    v14 = 0;
    do
    {
      if ((uint64_t)objc_msgSend(v11, "numberOfRowsInSection:", v14) >= 1)
      {
        v15 = 0;
        do
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v15, v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeSummaryTemplateAtIndexPath:", v16));

          if (v17)
            objc_msgSend(v13, "addObject:", v17);

          ++v15;
        }
        while (v15 < (uint64_t)objc_msgSend(v11, "numberOfRowsInSection:", v14));
      }
      ++v14;
    }
    while (v14 < (uint64_t)objc_msgSend(v11, "numberOfSections"));
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100559950;
  v30[3] = &unk_1011BB1A8;
  v32 = &v33;
  v19 = v11;
  v31 = v19;
  objc_msgSend(v18, "populateSearchResultsForQuery:searchResultSpecifierBlock:", v25, v30);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v20, "populateImpressionObjectId:", v10);

  v34[3] = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100559A78;
  v26[3] = &unk_1011BB1D0;
  v29 = &v33;
  v21 = v19;
  v27 = v21;
  v22 = v13;
  v28 = v22;
  +[GEOAPPortal capturePlaceSummaryUserAction:target:value:placeSummarySpecifierBlock:](GEOAPPortal, "capturePlaceSummaryUserAction:target:value:placeSummarySpecifierBlock:", 2015, a4, v12, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v23, "populateImpressionObjectId:", 0);

  _Block_object_dispose(&v33, 8);
}

+ (void)logNoSearchResults:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 418, v3, 0);

}

+ (void)logCloseSearchResults
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 2002, 101, 0);

}

+ (void)addAPlaceTappedWithNumberOfResults:(unint64_t)a3 target:(int)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 222, v4, v6);

}

+ (void)didShowClusterWithDataSource:(id)a3 impressionsSessionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v8, "populateImpressionObjectId:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resultIdsWithDataSource:", v7));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2015, 105, v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v10, "populateImpressionObjectId:", 0);

}

+ (void)didCloseCluster
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 105, 0);
}

+ (id)resultIdsWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objects"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc((Class)NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objects"));
    v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objects", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "mapItem"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "_muid")));
          objc_msgSend(v8, "addObject:", v15);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
  }

  return v5;
}

@end
