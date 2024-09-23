@implementation MapsActivityViewController

- (MapsActivityViewController)initWithShareItem:(id)a3
{
  id v4;
  MapsActivityViewController *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SearchResult *searchResult;
  uint64_t v13;
  GEOComposedRoute *route;
  objc_super v16;
  uint8_t buf[4];
  MapsActivityViewController *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsActivityViewController;
  v5 = -[MapsActivityViewController initWithShareItem:](&v16, "initWithShareItem:", v4);
  if (v5)
  {
    if (qword_1014D24C8 != -1)
      dispatch_once(&qword_1014D24C8, &stru_1011B5970);
    v6 = (void *)qword_1014D24C0;
    if (os_log_type_enabled((os_log_t)qword_1014D24C0, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
      *(_DWORD *)buf = 134349826;
      v18 = v5;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with share item: %@ search result: %@ route: %@", buf, 0x2Au);

    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));
    searchResult = v5->_searchResult;
    v5->_searchResult = (SearchResult *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v13;

    objc_msgSend(v4, "setActivityProviderDelegate:", v5);
    -[MapsActivityViewController setActivityControllerDelegate:](v5, "setActivityControllerDelegate:", v5);
  }

  return v5;
}

- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD block[5];

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController mapsActivityDelegate](self, "mapsActivityDelegate"));
  v9 = objc_opt_respondsToSelector(v8, "mapsActivityViewController:activityCompleted:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController mapsActivityDelegate](self, "mapsActivityDelegate"));
    objc_msgSend(v10, "mapsActivityViewController:activityCompleted:", self, 1);

  }
  if (objc_msgSend(v7, "isEqualToString:", UIActivityTypePrint))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100418764;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (+[SendToRoutingAppActivity isActivityForType:](SendToRoutingAppActivity, "isActivityForType:", v7))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController mapsActivityDelegate](self, "mapsActivityDelegate"));
    v12 = objc_opt_respondsToSelector(v11, "mapsActivityViewControllerPresentRoutingApps:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController mapsActivityDelegate](self, "mapsActivityDelegate"));
      objc_msgSend(v13, "mapsActivityViewControllerPresentRoutingApps:", self);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v15 = v14;
  if (v5)
    v16 = 17;
  else
    v16 = 4;
  objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", v16, 622, v7);

}

- (id)annotationViewForMapActivity:(id)a3
{
  void *v4;
  unsigned int v5;
  MapsActivityAnnotation *v6;
  void *v7;
  id v8;
  MapsActivityAnnotation *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult", a3));
  v5 = objc_msgSend(v4, "type");

  if (v5 == 4)
  {
    v6 = (MapsActivityAnnotation *)objc_alloc_init((Class)MKUserLocation);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
    objc_msgSend(v7, "coordinate");
    -[MapsActivityAnnotation setCoordinate:](v6, "setCoordinate:");

    v8 = objc_msgSend(objc_alloc((Class)_MKUserLocationView), "initWithAnnotation:reuseIdentifier:", v6, 0);
  }
  else
  {
    v9 = [MapsActivityAnnotation alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
    v6 = -[MapsActivityAnnotation initWithSearchResult:](v9, "initWithSearchResult:", v10);

    v8 = objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", v6, 0);
    objc_msgSend(v8, "setHidden:", 0);
  }

  return v8;
}

- (id)urlForMapActivity:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_class(MUPlaceURLActivityProvider);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(MUPlaceTextActivityProvider), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    || (v7 = objc_opt_class(MUPlaceLinkPresentationActivityProvider),
        (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController mapsActivityDelegate](self, "mapsActivityDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapsActivityMapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapsURLfromMapView:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)titleForMapActivity:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_opt_class(MURouteActivityProvider);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController route](self, "route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));

    v9 = objc_msgSend(v8, "isCurrentLocation");
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navDisplayName"));

    if ((v9 & 1) == 0)
    {
LABEL_3:
      v10 = v10;
      v11 = v10;
      goto LABEL_9;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
    v13 = objc_msgSend(v12, "type");
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));

    if (v13 != 4)
      goto LABEL_3;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "meCard"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v15, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Person_Name_Location_Activity_Controller"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Shared Location"), CFSTR("localized string not found"), 0));
  }

LABEL_9:
  return v11;
}

- (id)airdropURLJSONForMapActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _UNKNOWN **v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    v7 = &off_1012746B0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController searchResult](self, "searchResult"));
    v9 = objc_msgSend(v8, "type");

    if (v9 == 3)
    {
      v7 = &off_1012746D8;
    }
    else
    {
      v12[0] = CFSTR("SFAirDropActivitySubjectMain");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityViewController titleForMapActivity:](self, "titleForMapActivity:", v4));
      v12[1] = CFSTR("SFAirDropActivitySubjectMapsLinkType");
      v13[0] = v10;
      v13[1] = &off_10126D2B8;
      v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

    }
  }

  return v7;
}

- (MapsActivityViewControllerDelegate)mapsActivityDelegate
{
  return (MapsActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_mapsActivityDelegate);
}

- (void)setMapsActivityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapsActivityDelegate, a3);
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_mapsActivityDelegate);
}

@end
