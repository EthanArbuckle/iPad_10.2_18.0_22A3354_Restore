@implementation CorrectedLocationMapItemWaypointRequest

- (CorrectedLocationMapItemWaypointRequest)initWithCorrectedCoordinate:(CLLocationCoordinate2D)a3 mapItem:(id)a4
{
  CLLocationDegrees latitude;
  CorrectedLocationMapItemWaypointRequest *v5;
  CLLocationDegrees longitude;
  CorrectedLocationMapItemWaypointRequest *v7;
  objc_super v9;

  latitude = a3.latitude;
  v5 = 0;
  if (a3.longitude >= -180.0)
  {
    longitude = a3.longitude;
    if (a3.longitude <= 180.0 && a3.latitude >= -90.0 && a3.latitude <= 90.0)
    {
      v9.receiver = self;
      v9.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
      v7 = -[MapItemWaypointRequest initWithMapItem:](&v9, "initWithMapItem:", a4);
      if (v7)
      {
        v7->_coordinate.latitude = latitude;
        v7->_coordinate.longitude = longitude;
      }
      self = v7;
      v5 = self;
    }
  }

  return v5;
}

- (CorrectedLocationMapItemWaypointRequest)initWithMapItem:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("-[%@ %@] not implemented"), v7, v9);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithCorrectedCoordinate:mapItem:", self->super._mapItem, self->_coordinate.latitude, self->_coordinate.longitude);
}

- (id)description
{
  CorrectedLocationMapItemWaypointRequest *v2;
  id v3;
  void ***v4;
  CorrectedLocationMapItemWaypointRequest *v5;
  CorrectedLocationMapItemWaypointRequest *v6;
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
  v18 = sub_100BA6B44;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[CorrectedLocationMapItemWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CorrectedLocationMapItemWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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

  return v14;
}

- (id)debugDescription
{
  CorrectedLocationMapItemWaypointRequest *v2;
  id v3;
  void ***v4;
  CorrectedLocationMapItemWaypointRequest *v5;
  CorrectedLocationMapItemWaypointRequest *v6;
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
  v18 = sub_100BA6CC4;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[CorrectedLocationMapItemWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CorrectedLocationMapItemWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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

  return v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (**v4)(id, const __CFString *, void *);
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
  v4 = (void (**)(id, const __CFString *, void *))a3;
  -[MapItemWaypointRequest _maps_buildDescriptionWithBlock:](&v6, "_maps_buildDescriptionWithBlock:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%lf, %lf)"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude, v6.receiver, v6.super_class));
  v4[2](v4, CFSTR("coordinate"), v5);

}

- (id)mapItemForLocationComparison
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc((Class)GEOLocation);
  -[CorrectedLocationMapItemWaypointRequest coordinate](self, "coordinate");
  v13 = objc_msgSend(v12, "initWithGEOCoordinate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->super._mapItem, "_geoMapItem"));
  v15 = sub_10089D054(v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v13, v14, v11, v16, v9));
  return v17;
}

- (void)recordRAPInformation:(id)a3
{
  double *v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = (double *)self;
  v6.receiver = self;
  v6.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
  v4 = a3;
  -[MapItemWaypointRequest recordRAPInformation:](&v6, "recordRAPInformation:", v4);
  v5 = objc_alloc_init((Class)GEOLatLng);
  v3 += 2;
  objc_msgSend(v5, "setLat:", *v3, v6.receiver, v6.super_class);
  objc_msgSend(v5, "setLng:", v3[1]);
  objc_msgSend(v4, "setCoordinate:", v5);

}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

@end
