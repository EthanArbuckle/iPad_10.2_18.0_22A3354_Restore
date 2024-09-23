@implementation PlaceholderWaypointRequest

- (PlaceholderWaypointRequest)initWithName:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  PlaceholderWaypointRequest *v8;
  NSString *v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PlaceholderWaypointRequest;
  v8 = -[PlaceholderWaypointRequest init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = v9;

    objc_storeStrong((id *)&v8->_icon, a4);
  }

  return v8;
}

- (PlaceholderWaypointRequest)initWithCLPlacemark:(id)a3
{
  id v4;
  PlaceholderWaypointRequest *v5;
  void *v6;
  NSString *v7;
  NSString *name;
  id v9;
  MKMapItem *v10;
  MKMapItem *mapItem;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PlaceholderWaypointRequest;
  v5 = -[PlaceholderWaypointRequest init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = (NSString *)objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = v7;

    v9 = objc_msgSend(objc_alloc((Class)MKPlacemark), "initWithPlacemark:", v4);
    v10 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v9);
    mapItem = v5->_mapItem;
    v5->_mapItem = v10;

  }
  return v5;
}

- (NSString)description
{
  PlaceholderWaypointRequest *v2;
  id v3;
  void ***v4;
  PlaceholderWaypointRequest *v5;
  PlaceholderWaypointRequest *v6;
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
  v18 = sub_1002CB308;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[PlaceholderWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceholderWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  PlaceholderWaypointRequest *v2;
  id v3;
  void ***v4;
  PlaceholderWaypointRequest *v5;
  PlaceholderWaypointRequest *v6;
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
  v18 = sub_1002CB488;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[PlaceholderWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceholderWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, UIImage *))a3 + 2))(v6, CFSTR("icon"), self->_icon);
  (*((void (**)(id, const __CFString *, MKMapItem *))a3 + 2))(v6, CFSTR("mapItem"), self->_mapItem);

}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = kCLLocationCoordinate2DInvalid.latitude;
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (id)waypointIconWithScale:(double)a3
{
  MKMapItem *mapItem;
  UIImage *v4;

  mapItem = self->_mapItem;
  if (mapItem)
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", mapItem, 2, 0, a3));
  else
    v4 = self->_icon;
  return v4;
}

- (NSString)waypointName
{
  return self->_name;
}

- (BOOL)isCurrentLocation
{
  MKMapItem *mapItem;
  void *v3;
  unsigned __int8 v4;

  mapItem = self->_mapItem;
  if (!mapItem)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation"));
  v4 = -[MKMapItem isEqual:](mapItem, "isEqual:", v3);

  return v4;
}

- (BOOL)hasCachedResult
{
  return 1;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  MKMapItem *mapItem;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    mapItem = self->_mapItem;
    if (mapItem && v6[2])
    {
      v8 = -[MKMapItem isEqual:](mapItem, "isEqual:");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceholderWaypointRequest waypointName](self, "waypointName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypointName"));
      v8 = objc_msgSend(v9, "isEqualToString:", v10);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
