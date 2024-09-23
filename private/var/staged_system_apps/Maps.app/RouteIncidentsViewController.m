@implementation RouteIncidentsViewController

- (RouteIncidentsViewController)initWithDataCoordination:(id)a3
{
  RouteIncidentsViewController *v3;
  MapsIncidentsViewController *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RouteIncidentsViewController;
  v3 = -[RoutePlanningWrapperViewController initWithDataCoordination:](&v10, "initWithDataCoordination:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(MapsIncidentsViewController);
    -[RoutePlanningWrapperViewController setWrappedViewController:](v3, "setWrappedViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](v3, "wrappedViewController"));
    objc_msgSend(v5, "setDelegate:", v3);

    v6 = sub_1002A8AA0(v3) == 5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v7, "setPresentedModally:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v8, "setTakesAvailableHeight:", 0);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteIncidentsViewController;
  -[RoutePlanningWrapperViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RouteIncidentsView"));

  if (sub_1002A8AA0(self) == 5)
  {
    -[RouteIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 282.0, 282.0);
    self->_didStartObservingTableViewContentSize = 1;
    -[RouteIncidentsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, &unk_1014D38B0);

  }
}

- (void)updateHeaderTitle
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RouteIncidentsViewController;
  -[RoutePlanningWrapperViewController updateHeaderTitle](&v2, "updateHeaderTitle");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_didStartObservingTableViewContentSize)
  {
    self->_didStartObservingTableViewContentSize = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), &unk_1014D38B0);

  }
  v5.receiver = self;
  v5.super_class = (Class)RouteIncidentsViewController;
  -[RouteIncidentsViewController dealloc](&v5, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &unk_1014D38B0)
  {
    -[RouteIncidentsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)RouteIncidentsViewController;
    -[RouteIncidentsViewController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  if (-[RouteIncidentsViewController isViewLoaded](self, "isViewLoaded") && sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController advisory](self, "advisory"));
    if (v3
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController transitIncidents](self, "transitIncidents")),
          objc_msgSend(v3, "count")))
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController advisoriesInfo](self, "advisoriesInfo"));

      if (!v11)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController presentingViewController](self, "presentingViewController"));
        objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, 0);
        goto LABEL_10;
      }
    }
    -[RouteIncidentsViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
    v5 = v4;
    v7 = v6;
    -[RouteIncidentsViewController preferredContentSize](self, "preferredContentSize");
    if (v5 == v9 && v7 == v8)
      return;
    -[RouteIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tableView"));
    objc_msgSend(v10, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);

LABEL_10:
  }
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = -[RouteIncidentsViewController isViewLoaded](self, "isViewLoaded");
  v4 = 282.0;
  if (v3)
  {
    v5 = sub_1002A8AA0(self);
    v4 = 282.0;
    if (v5 == 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController view](self, "view"));
      objc_msgSend(v6, "layoutIfNeeded");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
      objc_msgSend(v8, "contentSize");
      v10 = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v11, "bounds");
      v13 = v12;

      if (v10 >= v13)
        v14 = v13;
      else
        v14 = v10;
      v4 = fmax(v14, 100.0);
    }
  }
  v15 = 282.0;
  result.height = v4;
  result.width = v15;
  return result;
}

- (void)didUpdateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[RouteIncidentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[RouteIncidentsViewController updateHeaderTitle](self, "updateHeaderTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v6, "setTitle:", v5);

    -[RouteIncidentsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (void)setTransitIncidents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitIncidents"));
  if (v5 == v10)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitIncidents"));
    v8 = objc_msgSend(v10, "isEqualToArray:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
      objc_msgSend(v9, "setTransitIncidents:", v10);

      -[RouteIncidentsViewController didUpdateDataSource](self, "didUpdateDataSource");
    }
  }

}

- (NSArray)transitIncidents
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitIncidents"));

  return (NSArray *)v3;
}

- (void)setAdvisoriesInfo:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v12 = a3;
  if (MapsFeature_IsEnabled_FrenchClimateLaw(v12, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advisoriesInfo"));
    v7 = (unint64_t)v12;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
        objc_msgSend(v11, "setAdvisoriesInfo:", v7);

        -[RouteIncidentsViewController didUpdateDataSource](self, "didUpdateDataSource");
      }
    }
    else
    {

    }
  }

}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  void *v3;
  void *v4;

  if (MapsFeature_IsEnabled_FrenchClimateLaw(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisoriesInfo"));

  }
  else
  {
    v4 = 0;
  }
  return (GEOAdvisoriesInfo *)v4;
}

- (void)setAdvisory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advisory"));
  v10 = (unint64_t)v4;
  v7 = v6;
  if (v10 | v7)
  {
    v8 = objc_msgSend((id)v10, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
      objc_msgSend(v9, "setAdvisory:", v10);

      -[RouteIncidentsViewController didUpdateDataSource](self, "didUpdateDataSource");
    }
  }
  else
  {

  }
}

- (GEOComposedRouteAdvisory)advisory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "advisory"));

  return (GEOComposedRouteAdvisory *)v3;
}

- (void)resetForDismiss
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  objc_msgSend(v3, "setTransitIncidents:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  objc_msgSend(v4, "setAdvisory:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  objc_msgSend(v5, "setAdvisoriesInfo:", 0);

}

- (void)handleDismissAction:(id)a3
{
  -[RouteIncidentsViewController _doneTapped:](self, "_doneTapped:", a3);
}

- (void)_doneTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController advisory](self, "advisory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advisoryItems"));
  objc_msgSend(v5, "captureUserAction:onTarget:forAdvisoryItems:", 41, 46, v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  objc_msgSend(v8, "containeeViewControllerGoToPreviousState:withSender:", self, v4);

}

- (void)didTapDownloadForLocation:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = objc_alloc((Class)GEOMapRegion);
  objc_msgSend(v4, "lat");
  v7 = v6;
  objc_msgSend(v4, "lng");
  v9 = objc_msgSend(v5, "initWithLatitude:longitude:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseActionCoordinator"));

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008E24B8;
  v14[3] = &unk_1011DB420;
  objc_copyWeak(&v16, &location);
  v13 = v12;
  v15 = v13;
  objc_msgSend(v13, "viewController:showOfflineMapRegionSelectorForRegion:name:dismissalBlock:", self, v9, 0, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

@end
