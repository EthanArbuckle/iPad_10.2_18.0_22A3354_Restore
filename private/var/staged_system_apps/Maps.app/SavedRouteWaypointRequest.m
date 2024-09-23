@implementation SavedRouteWaypointRequest

- (SavedRouteWaypointRequest)initWithSavedRouteData:(id)a3
{
  id v5;
  SavedRouteWaypointRequest *v6;
  SavedRouteWaypointRequest *v7;
  id v8;
  uint64_t v9;
  GEOComposedRoute *route;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SavedRouteWaypointRequest;
  v6 = -[SavedRouteWaypointRequest init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routeData, a3);
    v8 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v5);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buildRoute"));
    route = v7->_route;
    v7->_route = (GEOComposedRoute *)v9;

  }
  return v7;
}

- (SavedRouteWaypointRequest)initWithSavedRoute:(id)a3
{
  id v5;
  SavedRouteWaypointRequest *v6;
  uint64_t v7;
  GEOComposedGeometryRoutePersistentData *routeData;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SavedRouteWaypointRequest;
  v6 = -[SavedRouteWaypointRequest init](&v10, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentData"));
    routeData = v6->_routeData;
    v6->_routeData = (GEOComposedGeometryRoutePersistentData *)v7;

    objc_storeStrong((id *)&v6->_route, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_routeData);
  objc_storeStrong(v4 + 2, self->_route);
  return v4;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  void *v3;
  double v4;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  CLLocationCoordinate2D v7;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  double v10;
  double v11;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self->_route, "origin"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "coordinate");
    v5 = v4;
    objc_msgSend(v3, "coordinate");
    v7 = CLLocationCoordinate2DMake(v5, v6);
    latitude = v7.latitude;
    longitude = v7.longitude;
  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  v10 = latitude;
  v11 = longitude;
  result.longitude = v11;
  result.latitude = v10;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return 0;
}

- (id)waypointIconWithScale:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes customSavedRouteStyleAttributes](GEOFeatureStyleAttributes, "customSavedRouteStyleAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v4, 0, 0, a3));

  return v5;
}

- (NSString)waypointName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute userProvidedName](self->_route, "userProvidedName"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](self->_route, "name"));
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = (id *)a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4[1], "isEqual:", self->_routeData);
  else
    v6 = 0;

  return v6;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v8;
  GEOComposedRoute *route;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1005E1854;
  v24 = sub_1005E1864;
  v25 = 0;
  route = self->_route;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005E186C;
  v18[3] = &unk_1011BD390;
  v19 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005E1944;
  v15[3] = &unk_1011BD3B8;
  v16 = v19;
  v17 = &v20;
  v10 = v19;
  v11 = objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:](route, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", a3, v18, v15));
  v12 = (void *)v21[5];
  v21[5] = v11;

  v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
}

@end
