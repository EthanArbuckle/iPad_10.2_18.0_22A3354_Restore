@implementation MapItemWaypointRequest

- (MapItemWaypointRequest)initWithMapItem:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  MapItemWaypointRequest *v11;
  MapItemWaypointRequest *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;

  v5 = a3;
  if (-[MapItemWaypointRequest isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(MapItemWaypointRequest))&& objc_msgSend(v5, "_hasCorrectedHomeWorkCoordinate"))
  {
    v6 = sub_1004328BC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class(CorrectedLocationMapItemWaypointRequest);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "This map item has corrected coordinates. Should \"%@\" have been used instead?", buf, 0xCu);

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MapItemWaypointRequest;
  v11 = -[MapItemWaypointRequest init](&v14, "init");
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_mapItem, a3);

  return v12;
}

- (MapItemWaypointRequest)init
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
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithMapItem:", self->_mapItem);
}

- (NSString)description
{
  MapItemWaypointRequest *v2;
  id v3;
  void ***v4;
  MapItemWaypointRequest *v5;
  MapItemWaypointRequest *v6;
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
  v18 = sub_1009BEC10;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapItemWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  MapItemWaypointRequest *v2;
  id v3;
  void ***v4;
  MapItemWaypointRequest *v5;
  MapItemWaypointRequest *v6;
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
  v18 = sub_1009BED90;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapItemWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  void (*v5)(void);
  id v6;
  id v7;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MKMapItem needsAdditionalNavData](self->_mapItem, "needsAdditionalNavData")));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v6, CFSTR("needsAdditionalNavData"), v7);

}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)isCurrentLocation
{
  return -[MKMapItem isCurrentLocation](self->_mapItem, "isCurrentLocation");
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  return +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", self->_mapItem, 2, 0, a3);
}

- (NSString)waypointName
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
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
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[1], "_geoMapItem"));
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
  MKMapItem *mapItem;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint8_t v26[16];
  uint8_t buf[16];

  mapItem = self->_mapItem;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](mapItem, "_geoMapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_clientAttributes"));

  v15 = -[MKMapItem needsAdditionalNavData](self->_mapItem, "needsAdditionalNavData");
  v16 = sub_1004328BC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Map item needs additional information.", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v20 = sub_10089D054(v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v22 = objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForIncompleteMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForIncompleteMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v19, v12, v14, v21, v10));
  }
  else
  {
    if (v18)
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Map item has all the necessary information.", v26, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v23 = sub_10089D054(v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v22 = objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v19, v12, v14, v21, v10));
  }
  v24 = (void *)v22;

  return v24;
}

- (void)recordRAPInformation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MKMapItem isCurrentLocation](self->_mapItem, "isCurrentLocation"))
    objc_msgSend(v5, "setOrigin:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItemStorageForPersistence](self->_mapItem, "_geoMapItemStorageForPersistence"));
  objc_msgSend(v5, "setPlaceMapItemStorage:", v4);

}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
