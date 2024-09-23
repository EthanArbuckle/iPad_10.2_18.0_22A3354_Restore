@implementation GEOComposedWaypointRequest

- (GEOComposedWaypointRequest)initWithComposedWaypoint:(id)a3
{
  id v4;
  GEOComposedWaypointRequest *v5;
  GEOComposedWaypoint *v6;
  GEOComposedWaypoint *waypoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedWaypointRequest;
  v5 = -[GEOComposedWaypointRequest init](&v9, "init");
  if (v5)
  {
    v6 = (GEOComposedWaypoint *)objc_msgSend(v4, "copy");
    waypoint = v5->_waypoint;
    v5->_waypoint = v6;

  }
  return v5;
}

- (GEOComposedWaypointRequest)init
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("-[%@ %@] not implemented"), v6, v8);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithComposedWaypoint:", self->_waypoint);
}

- (NSString)description
{
  GEOComposedWaypointRequest *v2;
  id v3;
  void ***v4;
  GEOComposedWaypointRequest *v5;
  GEOComposedWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10089D284;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[GEOComposedWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  GEOComposedWaypointRequest *v2;
  id v3;
  void ***v4;
  GEOComposedWaypointRequest *v5;
  GEOComposedWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10089D404;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[GEOComposedWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  GEOComposedWaypoint *waypoint;
  id v5;
  id v6;

  waypoint = self->_waypoint;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint shortDescription](waypoint, "shortDescription"));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, CFSTR("waypoint"), v6);

}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  GEOComposedWaypoint *waypoint;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_waypoint, "latLng"));

  waypoint = self->_waypoint;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](waypoint, "latLng"));
    objc_msgSend(v5, "lat");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_waypoint, "latLng"));
    objc_msgSend(v8, "lng");
    v10 = CLLocationCoordinate2DMake(v7, v9);
    latitude = v10.latitude;
    longitude = v10.longitude;

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](waypoint, "geoMapItem"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_waypoint, "geoMapItem"));
      objc_msgSend(v14, "coordinate");
      latitude = v15;
      longitude = v16;

    }
    else
    {
      latitude = kCLLocationCoordinate2DInvalid.latitude;
      longitude = kCLLocationCoordinate2DInvalid.longitude;
    }
  }
  v17 = latitude;
  v18 = longitude;
  result.longitude = v18;
  result.latitude = v17;
  return result;
}

- (BOOL)isCurrentLocation
{
  return -[GEOComposedWaypoint isCurrentLocation](self->_waypoint, "isCurrentLocation");
}

- (BOOL)hasCachedResult
{
  return 1;
}

- (MKMapItem)mapItemForLocationComparison
{
  void *v3;
  id v4;
  void *v5;
  MKMapItem *v6;
  MKMapItem *mapItem;

  if (!self->_mapItem)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_waypoint, "geoMapItem"));

    if (v3)
    {
      v4 = objc_alloc((Class)MKMapItem);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_waypoint, "geoMapItem"));
      v6 = (MKMapItem *)objc_msgSend(v4, "initWithGeoMapItem:isPlaceHolderPlace:", v5, 0);
      mapItem = self->_mapItem;
      self->_mapItem = v6;

    }
  }
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mkMapItem](self->_waypoint, "mkMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v4, 2, 0, a3));

  return v5;
}

- (NSString)waypointName
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint name](self->_waypoint, "name"));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = MKLocalizedStringForUnknownLocation();
    v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = v4;

  return (NSString *)v6;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char IsEqualToMapItemForPurpose;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (id *)v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[2], "_geoMapItem"));
    v9 = (void *)v8;
    IsEqualToMapItemForPurpose = 0;
    if (v7 && v8)
      IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v7, v8, 1);

  }
  else
  {
    IsEqualToMapItemForPurpose = 0;
  }

  return IsEqualToMapItemForPurpose;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  GEOComposedWaypoint *waypoint;
  id v8;
  void *v9;

  if (a5)
  {
    waypoint = self->_waypoint;
    v8 = a5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", waypoint));
    (*((void (**)(id, void *))a5 + 2))(v8, v9);

  }
  return 0;
}

- (void)recordRAPInformation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self->_waypoint, "geoMapItem"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:forUseType:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:forUseType:", v4, 0));
    objc_msgSend(v7, "setPlaceMapItemStorage:", v5);

  }
  if ((-[GEOComposedWaypoint isCurrentLocation](self->_waypoint, "isCurrentLocation") & 1) != 0)
  {
    v6 = 2;
LABEL_7:
    objc_msgSend(v7, "setOrigin:", v6);
    goto LABEL_8;
  }
  if (-[GEOComposedWaypoint isLocationWaypointType](self->_waypoint, "isLocationWaypointType"))
  {
    v6 = 3;
    goto LABEL_7;
  }
LABEL_8:

}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
}

@end
