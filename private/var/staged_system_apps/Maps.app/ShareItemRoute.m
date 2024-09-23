@implementation ShareItemRoute

- (ShareItemRoute)initWithRoute:(id)a3 includeRoutingApps:(BOOL)a4
{
  id v7;
  ShareItemRoute *v8;
  ShareItemRoute *v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MKMapItem *v16;
  MKMapItem *origin;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  MKMapItem *v24;
  MKMapItem *destination;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  VKPolylineOverlay *v30;
  VKPolylineOverlay *polyline;
  objc_super v33;

  v7 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ShareItemRoute;
  v8 = -[ShareItemRoute init](&v33, "init");
  if (v8 && (objc_msgSend(v7, "isMultipointRoute") & 1) == 0)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v8->_includeRoutingApps = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin"));
    v11 = objc_msgSend(v10, "isCurrentLocation");

    if (v11)
    {
      v12 = objc_alloc((Class)MKMapItem);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "origin"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geoMapItem"));
      v16 = (MKMapItem *)objc_msgSend(v12, "initWithGeoMapItemAsCurrentLocation:", v15);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "origin"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geoMapItem"));
      v16 = (MKMapItem *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v15));
    }
    origin = v8->_origin;
    v8->_origin = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
    v19 = objc_msgSend(v18, "isCurrentLocation");

    if (v19)
    {
      v20 = objc_alloc((Class)MKMapItem);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "destination"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geoMapItem"));
      v24 = (MKMapItem *)objc_msgSend(v20, "initWithGeoMapItemAsCurrentLocation:", v23);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "destination"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geoMapItem"));
      v24 = (MKMapItem *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v23));
    }
    destination = v8->_destination;
    v8->_destination = v24;

    v26 = objc_alloc((Class)VKPolylineOverlay);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](v8, "route"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "traffic"));
    v30 = (VKPolylineOverlay *)objc_msgSend(v26, "initWithComposedRoute:traffic:", v27, v29);
    polyline = v8->_polyline;
    v8->_polyline = v30;

    -[VKPolylineOverlay setSelected:](v8->_polyline, "setSelected:", 1);
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)activityProviders
{
  NSArray *activityProviders;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[3];

  activityProviders = self->_activityProviders;
  if (!activityProviders)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
    v5 = objc_msgSend(v4, "transportType");
    if (v5 > 5)
      v6 = 1;
    else
      v6 = qword_100E3CAA8[v5];

    v7 = objc_alloc((Class)MURouteTextActivityProvider);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute origin](self, "origin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute destination](self, "destination"));
    v10 = objc_msgSend(v7, "initWithSource:destination:", v8, v9);

    objc_msgSend(v10, "setTransportType:", v6);
    v11 = objc_alloc((Class)MURouteURLActivityProvider);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute origin](self, "origin"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute destination](self, "destination"));
    v14 = objc_msgSend(v11, "initWithSource:destination:", v12, v13);

    objc_msgSend(v14, "setTransportType:", v6);
    v15 = objc_alloc((Class)MURouteLinkPresentationActivityProvider);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute origin](self, "origin"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute destination](self, "destination"));
    v18 = objc_msgSend(v15, "initWithSource:destination:composedRoute:", v16, v17, self->_route);

    v22[0] = v10;
    v22[1] = v14;
    v22[2] = v18;
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
    v20 = self->_activityProviders;
    self->_activityProviders = v19;

    activityProviders = self->_activityProviders;
  }
  return activityProviders;
}

- (NSArray)applicationActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  PushToDeviceActivity *v14;
  MapsPrintActivity *v15;
  SendToRoutingAppActivity *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v4, "userInterfaceIdiom") == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 > 2)
      goto LABEL_13;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute pushSubmissionData](self, "pushSubmissionData"));
    if (v4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPushManager defaultManager](MapsPushManager, "defaultManager", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devices"));

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = -[PushToDeviceActivity initWithDevice:place:]([PushToDeviceActivity alloc], "initWithDevice:place:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13), self);
            objc_msgSend(v3, "addObject:", v14);

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
  }

LABEL_13:
  v15 = objc_alloc_init(MapsPrintActivity);
  objc_msgSend(v3, "addObject:", v15);

  if (-[ShareItemRoute includeRoutingApps](self, "includeRoutingApps"))
  {
    v16 = objc_alloc_init(SendToRoutingAppActivity);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = objc_msgSend(v3, "copy");

  return (NSArray *)v17;
}

- (NSArray)includedActivityTypes
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = UIActivityTypePrint;
  v7[1] = UIActivityTypeAirDrop;
  v7[2] = UIActivityTypeOpenInIBooks;
  v7[3] = UIActivityTypeAssignToContact;
  v7[4] = UIActivityTypeSaveToCameraRoll;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 5));
  if (-[ShareItemRoute includeRoutingApps](self, "includeRoutingApps"))
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", CFSTR("com.apple.Maps.RoutingAppsActivity")));
  else
    v4 = v3;
  v5 = v4;

  return (NSArray *)v5;
}

- (void)setActivityProviderDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute activityProviders](self, "activityProviders", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setDelegate:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)excludedActivityTypes
{
  return 0;
}

- (void)_selectCustomFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (self->_customFeatureStore && self->_endCustomFeature)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_labelMarkerForCustomFeatureAnnotation:"));
    if (v5)
      objc_msgSend(v6, "_selectLabelMarker:animated:", v5, 0);

    v4 = v6;
  }

}

- (void)_setupCustomFeatureStore
{
  _MKCustomFeatureStore *v3;
  _MKCustomFeatureStore *customFeatureStore;

  v3 = (_MKCustomFeatureStore *)objc_msgSend(objc_alloc((Class)_MKCustomFeatureStore), "initWithClustering:", 0);
  customFeatureStore = self->_customFeatureStore;
  self->_customFeatureStore = v3;

}

- (void)_setupCustomFeatureForMapItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _ShareCustomFeature *v11;
  _ShareCustomFeature *startCustomFeature;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _ShareCustomFeature *v21;
  _ShareCustomFeature *endCustomFeature;
  id v23;

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "origin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));

  if (v5)
  {
    v6 = objc_alloc((Class)MKMapItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
    v10 = objc_msgSend(v6, "initWithGeoMapItem:isPlaceHolderPlace:", v9, 0);

    v11 = (_ShareCustomFeature *)objc_claimAutoreleasedReturnValue(+[_ShareCustomFeature customFeatureForMapItem:](_ShareCustomFeature, "customFeatureForMapItem:", v10));
    startCustomFeature = self->_startCustomFeature;
    self->_startCustomFeature = v11;

    objc_msgSend(v23, "addObject:", self->_startCustomFeature);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destination"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geoMapItem"));

  if (v15)
  {
    v16 = objc_alloc((Class)MKMapItem);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemRoute route](self, "route"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "destination"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geoMapItem"));
    v20 = objc_msgSend(v16, "initWithGeoMapItem:isPlaceHolderPlace:", v19, 0);

    v21 = (_ShareCustomFeature *)objc_claimAutoreleasedReturnValue(+[_ShareCustomFeature customFeatureForMapItem:](_ShareCustomFeature, "customFeatureForMapItem:", v20));
    endCustomFeature = self->_endCustomFeature;
    self->_endCustomFeature = v21;

    objc_msgSend(v23, "addObject:", self->_endCustomFeature);
  }
  -[_MKCustomFeatureStore addAnnotations:](self->_customFeatureStore, "addAnnotations:", v23);

}

- (SearchResult)searchResult
{
  return 0;
}

- (NSData)pushSubmissionData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute bookmarkRepresentation](self->_route, "bookmarkRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return (NSData *)v3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)includeRoutingApps
{
  return self->_includeRoutingApps;
}

- (MKMapItem)origin
{
  return self->_origin;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (VKPolylineOverlay)polyline
{
  return self->_polyline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_activityProviders, 0);
  objc_storeStrong((id *)&self->_endCustomFeature, 0);
  objc_storeStrong((id *)&self->_startCustomFeature, 0);
  objc_storeStrong((id *)&self->_customFeatureStore, 0);
}

@end
