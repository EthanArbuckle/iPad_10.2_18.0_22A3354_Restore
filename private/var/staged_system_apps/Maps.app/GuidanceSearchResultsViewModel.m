@implementation GuidanceSearchResultsViewModel

- (GuidanceSearchResultsViewModel)initWithDataProvider:(id)a3 navActionCoordinator:(id)a4 routeInfoProvider:(id)a5 mapItemDisplayer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GuidanceSearchResultsViewModel *v15;
  GuidanceSearchResultsViewModel *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GuidanceSearchResultsViewModel;
  v15 = -[GuidanceSearchResultsViewModel init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataProvider, a3);
    objc_storeStrong((id *)&v16->_navActionCoordinator, a4);
    objc_storeStrong((id *)&v16->_routeInfoProvider, a5);
    objc_storeStrong((id *)&v16->_mapItemDisplayer, a6);
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[GuidanceSearchResultsViewModel clearSelection](self, "clearSelection");
  -[NavigationMapItemDisplaying removeMapItems](self->_mapItemDisplayer, "removeMapItems");
  v3.receiver = self;
  v3.super_class = (Class)GuidanceSearchResultsViewModel;
  -[GuidanceSearchResultsViewModel dealloc](&v3, "dealloc");
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
  v6 = objc_msgSend(v5, "count");

  if (!objc_msgSend(v4, "length") && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NAV_SAR_RESULT_TITLE"), CFSTR("localized string not found"), 0));

    v9 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6));
    v4 = (void *)v9;
  }
  return (NSString *)v4;
}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Results] subtitle"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitle"));
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v6;
  v11 = v10;

  if (objc_msgSend(v11, "containsString:", CFSTR("%[destination]")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordination appCoordinator](self->_navActionCoordinator, "appCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "platformController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentSession"));

    v15 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentDestinationString"));
    if (v18)
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%[destination]"), v18));
    else
      v19 = v6;
    v20 = v19;

  }
  else
  {
    v20 = v11;
  }

  return (NSString *)v20;
}

- (UIImage)headerImage
{
  UIImage *headerImage;
  UIImage *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;

  headerImage = self->_headerImage;
  if (headerImage)
  {
    v3 = headerImage;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));

    if (!v6)
      goto LABEL_5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "nativeScale");
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v8, 4, 1));

    if (!v10)
LABEL_5:
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search")));
    v11 = self->_headerImage;
    self->_headerImage = v10;
    v12 = v10;

    v3 = self->_headerImage;
  }
  return v3;
}

- (void)loadDataIfNeeded
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char IsEnabled_Maps182;
  char v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int IsEnabled_DrivingMultiWaypointRoutes;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[3];

  v27 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
  if (objc_msgSend(v27, "count"))
  {

  }
  else
  {
    v3 = -[GuidanceSearchResultsViewModel isLoading](self, "isLoading");

    if ((v3 & 1) == 0)
    {
      -[GuidanceSearchResultsViewModel setLoading:](self, "setLoading:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel delegate](self, "delegate"));
      v5 = objc_opt_respondsToSelector(v4, "viewModelWillStartLoading:");

      if ((v5 & 1) != 0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel delegate](self, "delegate"));
        objc_msgSend(v6, "viewModelWillStartLoading:", self);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v8 = objc_msgSend(v7, "navigationTransportType");
      switch((int)v8)
      {
        case 1:
        case 6:

          goto LABEL_16;
        case 2:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v8);
          goto LABEL_11;
        case 3:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v8);
LABEL_11:
          v11 = IsEnabled_Maps182;

          if ((v11 & 1) != 0)
            goto LABEL_12;
          goto LABEL_16;
        default:
          IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v8, v9);

          if (IsEnabled_DrivingMultiWaypointRoutes)
          {
LABEL_12:
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
            if ((objc_opt_respondsToSelector(v12, "hasValidSearchResults") & 1) != 0)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
              v14 = objc_msgSend(v13, "hasValidSearchResults");

              if (v14)
              {
                objc_initWeak(location, self);
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel routeInfoProvider](self, "routeInfoProvider"));
                v31[0] = _NSConcreteStackBlock;
                v31[1] = 3221225472;
                v31[2] = sub_100AC5340;
                v31[3] = &unk_1011AD9D0;
                objc_copyWeak(&v32, location);
                objc_msgSend(v15, "loadSearchResultsWithRouteInfo:completion:", v16, v31);

                objc_destroyWeak(&v32);
                objc_destroyWeak(location);
                return;
              }
            }
            else
            {

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
            v21 = objc_opt_respondsToSelector(v20, "error");

            if ((v21 & 1) != 0)
            {
              v28 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "error"));
              -[GuidanceSearchResultsViewModel _handleResults:error:](self, "_handleResults:error:", &__NSArray0__struct, v22);

            }
            else
            {
              v23 = sub_10043222C();
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
                LODWORD(location[0]) = 138412290;
                *(id *)((char *)location + 4) = v25;

              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SAR_Results"), 0, 0));
              -[GuidanceSearchResultsViewModel _handleResults:error:](self, "_handleResults:error:", &__NSArray0__struct, v26);

            }
          }
          else
          {
LABEL_16:
            objc_initWeak(location, self);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel dataProvider](self, "dataProvider"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel routeInfoProvider](self, "routeInfoProvider"));
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100AC53B0;
            v29[3] = &unk_1011AD9D0;
            objc_copyWeak(&v30, location);
            objc_msgSend(v18, "loadSearchResultsWithRouteInfo:completion:", v19, v29);

            objc_destroyWeak(&v30);
            objc_destroyWeak(location);
          }
          break;
      }
    }
  }
}

- (void)clearSelection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v2, "selectMapItem:shouldRemoveResults:", 0, 1);

}

- (void)cancelResultsView
{
  id v3;

  -[GuidanceSearchResultsViewModel clearSelection](self, "clearSelection");
  -[NavigationMapItemDisplaying removeMapItems](self->_mapItemDisplayer, "removeMapItems");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v3, "dismissSearchAlongRoute");

}

- (void)navigateToItemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[GuidanceSearchResultsViewModel loadDataIfNeeded](self, "loadDataIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 > a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

    +[SARAnalytics captureListStartDetourToMapItem:index:](SARAnalytics, "captureListStartDetourToMapItem:index:", v9, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v8, "detourToMapItem:", v9);

    -[NavigationMapItemDisplaying removeMapItems](self->_mapItemDisplayer, "removeMapItems");
  }
}

- (void)selectMapItemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 > a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v8, "selectMapItem:shouldRemoveResults:", v9, 0);

  }
}

- (void)_handleResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  GuidanceSearchResultsViewModel *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_10043222C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v25 = 138412290;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SAR: Error received: %@", (uint8_t *)&v25, 0xCu);
    }

    -[GuidanceSearchResultsViewModel setResults:](self, "setResults:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel delegate](self, "delegate"));
    v11 = v10;
    v12 = self;
    v13 = v7;
    goto LABEL_17;
  }
  if (!-[GuidanceSearchResultsViewModel isLoading](self, "isLoading"))
  {
    v14 = objc_msgSend(v6, "count");
    if (v6 && v14)
    {
      -[GuidanceSearchResultsViewModel setResults:](self, "setResults:", v6);
      if (objc_msgSend(v6, "count") == (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v16 = objc_msgSend(v15, "navigationTransportType");

        if (v16 != 3)
        {
          v22 = sub_10043222C();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel results](self, "results"));
            v25 = 138412290;
            v26 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "SAR: Received only one result, will open placecard directly. Result: %@", (uint8_t *)&v25, 0xCu);

          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel mapItemDisplayer](self, "mapItemDisplayer"));
          objc_msgSend(v11, "displayMapItems:", v6);
          goto LABEL_18;
        }
      }
      v17 = sub_10043222C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v25 = 134217984;
        v26 = objc_msgSend(v6, "count");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "SAR: showing %ld search results", (uint8_t *)&v25, 0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel mapItemDisplayer](self, "mapItemDisplayer"));
      objc_msgSend(v19, "displayMapItems:", v6);

    }
    else
    {
      v20 = sub_10043222C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v25 = 138412290;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "SAR: Empty results received: %@", (uint8_t *)&v25, 0xCu);
      }

      -[GuidanceSearchResultsViewModel setResults:](self, "setResults:", 0);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewModel delegate](self, "delegate"));
    v11 = v10;
    v12 = self;
    v13 = 0;
LABEL_17:
    objc_msgSend(v10, "viewModelDidFinishLoading:error:", v12, v13);
LABEL_18:

  }
}

- (GuidanceSearchResultsViewModelDelegate)delegate
{
  return (GuidanceSearchResultsViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (void)setPlaceSummaryMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryMetadata, a3);
}

- (GuidanceSearchResultsDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (NavActionCoordination)navActionCoordinator
{
  return self->_navActionCoordinator;
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  return self->_routeInfoProvider;
}

- (NavigationMapItemDisplaying)mapItemDisplayer
{
  return self->_mapItemDisplayer;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemDisplayer, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_storeStrong((id *)&self->_navActionCoordinator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
