@implementation TraceWaypointRequest

- (TraceWaypointRequest)initWithWaypoint:(id)a3
{
  id v4;
  TraceWaypointRequest *v5;
  uint64_t v6;
  Result *waypointResult;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TraceWaypointRequest;
  v5 = -[TraceWaypointRequest init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v4));
    waypointResult = v5->_waypointResult;
    v5->_waypointResult = (Result *)v6;

  }
  return v5;
}

- (NSString)description
{
  TraceWaypointRequest *v2;
  id v3;
  void ***v4;
  TraceWaypointRequest *v5;
  TraceWaypointRequest *v6;
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
  v18 = sub_1006B46F0;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[TraceWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  TraceWaypointRequest *v2;
  id v3;
  void ***v4;
  TraceWaypointRequest *v5;
  TraceWaypointRequest *v6;
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
  v18 = sub_1006B4870;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[TraceWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, CFSTR("waypointResult"), v6);

}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v14;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v5, "lat");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "latLng"));
    objc_msgSend(v9, "lng");
    v11 = v10;

  }
  else
  {
    v7 = 0.0;
    v11 = 0.0;
  }
  v14 = CLLocationCoordinate2DMake(v7, v11);
  longitude = v14.longitude;
  latitude = v14.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypointResult](self, "waypointResult"));
  v3 = v2 != 0;

  return v3;
}

- (MKMapItem)mapItemForLocationComparison
{
  return 0;
}

- (id)waypointIconWithScale:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_styleAttributes"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v8, 2, 0, a3));

  return v11;
}

- (NSString)waypointName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypoint](self, "waypoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  -[TraceWaypointRequest setCompletionHandler:](self, "setCompletionHandler:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypointResult](self, "waypointResult"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest completionHandler](self, "completionHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypointResult](self, "waypointResult"));
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
  return 0;
}

- (GEOComposedWaypoint)waypoint
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006B45C8;
  v10 = sub_1006B45D8;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest waypointResult](self, "waypointResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006B45E0;
  v5[3] = &unk_1011C02D8;
  v5[4] = &v6;
  objc_msgSend(v2, "withValue:orError:", v5, &stru_1011C02F8);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOComposedWaypoint *)v3;
}

- (void)setWaypointResult:(id)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_waypointResult, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest completionHandler](self, "completionHandler"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[TraceWaypointRequest completionHandler](self, "completionHandler"));
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (Result)waypointResult
{
  return self->_waypointResult;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (Result)routesResult
{
  return self->_routesResult;
}

- (void)setRoutesResult:(id)a3
{
  objc_storeStrong((id *)&self->_routesResult, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routesResult, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_waypointResult, 0);
}

@end
