@implementation CurrentLocationWaypointRequest

- (CurrentLocationWaypointRequest)initWithCurrentLocationTicket:(id)a3
{
  id v5;
  CurrentLocationWaypointRequest *v6;
  id v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  CurrentLocationWaypointRequest *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CurrentLocationWaypointRequest;
  v6 = -[CurrentLocationWaypointRequest init](&v10, "init");
  if (v6)
  {
    v7 = sub_10045561C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v12 = v6;
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Initiailizing with ticket: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v6;
}

- (CurrentLocationWaypointRequest)init
{
  CurrentLocationMapServiceTicket *v3;
  void *v4;
  CurrentLocationMapServiceTicket *v5;
  CurrentLocationWaypointRequest *v6;

  v3 = [CurrentLocationMapServiceTicket alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = -[CurrentLocationMapServiceTicket initWithLocationManager:](v3, "initWithLocationManager:", v4);

  v6 = -[CurrentLocationWaypointRequest initWithCurrentLocationTicket:](self, "initWithCurrentLocationTicket:", v5);
  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  CurrentLocationWaypointRequest *v7;

  v3 = sub_10045561C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)CurrentLocationWaypointRequest;
  -[CurrentLocationWaypointRequest dealloc](&v5, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CurrentLocationMapServiceTicket *v5;
  void *v6;
  void *v7;
  CurrentLocationMapServiceTicket *v8;
  id v9;

  v5 = [CurrentLocationMapServiceTicket alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest ticket](self, "ticket"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationManager"));
  v8 = -[CurrentLocationMapServiceTicket initWithLocationManager:](v5, "initWithLocationManager:", v7);

  v9 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithCurrentLocationTicket:", v8);
  return v9;
}

- (NSString)description
{
  CurrentLocationWaypointRequest *v2;
  id v3;
  void ***v4;
  CurrentLocationWaypointRequest *v5;
  CurrentLocationWaypointRequest *v6;
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
  v18 = sub_100455E14;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[CurrentLocationWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  CurrentLocationWaypointRequest *v2;
  id v3;
  void ***v4;
  CurrentLocationWaypointRequest *v5;
  CurrentLocationWaypointRequest *v6;
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
  v18 = sub_100455F94;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[CurrentLocationWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  (*((void (**)(id, const __CFString *, CurrentLocationMapServiceTicket *))a3 + 2))(a3, CFSTR("ticket"), self->_ticket);
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  void *v3;
  double v4;
  CLLocationDegrees latitude;
  double v6;
  CLLocationDegrees longitude;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest ticket](self, "ticket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentLocation"));

  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    latitude = v4;
    longitude = v6;
  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  v8 = latitude;
  v9 = longitude;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 1;
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
}

- (id)waypointIconWithScale:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes currentLocationStyleAttributes](GEOFeatureStyleAttributes, "currentLocationStyleAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v4, 0, 0, a3));

  return v5;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest ticket](self, "ticket"));
  objc_msgSend(v12, "submitWithTraits:completionHandler:networkActivityHandler:", v11, v10, v9);

  return -[CurrentLocationWaypointRequest ticket](self, "ticket");
}

- (void)recordRAPInformation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "setOrigin:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationWaypointRequest ticket](self, "ticket"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));

  if (v5)
  {
    v6 = objc_alloc((Class)GEOLatLng);
    objc_msgSend(v5, "coordinate");
    v8 = v7;
    objc_msgSend(v5, "coordinate");
    v9 = objc_msgSend(v6, "initWithLatitude:longitude:", v8);
    objc_msgSend(v10, "setCoordinate:", v9);

  }
}

- (CurrentLocationMapServiceTicket)ticket
{
  return self->_ticket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
