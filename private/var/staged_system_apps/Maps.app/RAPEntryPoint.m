@implementation RAPEntryPoint

- (RAPEntryPoint)initWithAccessPoint:(id)a3
{
  id v5;
  RAPEntryPoint *v6;
  RAPEntryPoint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPEntryPoint;
  v6 = -[RAPEntryPoint init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessPoint, a3);

  return v7;
}

- (RAPEntryPoint)initWithAccessPoint:(id)a3 type:(int64_t)a4
{
  RAPEntryPoint *v5;
  RAPEntryPoint *v6;

  v5 = -[RAPEntryPoint initWithAccessPoint:](self, "initWithAccessPoint:", a3);
  v6 = v5;
  if (v5)
    -[RAPEntryPoint _setType:](v5, "_setType:", a4);
  return v6;
}

- (NSString)subtitle
{
  return (NSString *)-[RAPEntryPoint markerText](self, "markerText");
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Entrance [Report a Problem]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  id v7;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = objc_alloc_init((Class)GEOLatLng);
  objc_msgSend(v7, "setLat:", latitude);
  objc_msgSend(v7, "setLng:", longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  objc_msgSend(v6, "setLocation:", v7);

}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  void *v7;
  void *v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
  objc_msgSend(v4, "lat");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
  objc_msgSend(v8, "lng");
  v10 = CLLocationCoordinate2DMake(v6, v9);

  latitude = v10.latitude;
  longitude = v10.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (id)markerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Drive [RAP][Entry Points]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Walk [RAP][Entry Points]"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Drive / Walk [RAP][Entry Points]"), CFSTR("localized string not found"), 0));

  v9 = -[RAPEntryPoint entryPointType](self, "entryPointType");
  v10 = v6;
  if (v9 != 1)
  {
    if (v9 == 3)
    {
      v10 = v8;
    }
    else
    {
      v11 = 0;
      v10 = v4;
      if (v9 != 2)
        goto LABEL_7;
    }
  }
  v11 = v10;
LABEL_7:
  v12 = v11;

  return v12;
}

- (int64_t)entryPointType
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  if ((objc_msgSend(v3, "hasWalkingDirection") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
    v5 = objc_msgSend(v4, "hasDrivingDirection");

    if ((v5 & 1) != 0)
      return 3;
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  LODWORD(v8) = objc_msgSend(v7, "hasWalkingDirection");

  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v11 = objc_msgSend(v10, "hasDrivingDirection");

  v12 = 1;
  if ((_DWORD)v8)
    v12 = 2;
  if (v11)
    v8 = v12;
  else
    v8 = v8;
  if (v11)
    v13 = 2;
  else
    v13 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v15 = objc_msgSend(v14, "hasTransitDirection");

  v16 = 4;
  if (!v15)
    v16 = v13;
  if (v8 + (unint64_t)v15 <= 1)
    return v16;
  else
    return 5;
}

- (void)_setType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  switch(a3)
  {
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v4, "setDrivingDirection:", 0);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v5, "setWalkingDirection:", 3);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v6, "setTransitDirection:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v7, "setHasDrivingDirection:", 0);
      goto LABEL_5;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v8, "setDrivingDirection:", 3);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v9, "setWalkingDirection:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v10, "setTransitDirection:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v7, "setHasWalkingDirection:", 0);
      goto LABEL_5;
    case 3:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v11, "setDrivingDirection:", 3);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v12, "setWalkingDirection:", 3);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v7, "setTransitDirection:", 0);
LABEL_5:

      v19 = (id)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v19, "setHasTransitDirection:", 0);
      goto LABEL_8;
    case 4:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v13, "setDrivingDirection:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v14, "setWalkingDirection:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v15, "setTransitDirection:", 3);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v16, "setHasWalkingDirection:", 0);

      v19 = (id)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v19, "setHasDrivingDirection:", 0);
      goto LABEL_8;
    case 5:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v17, "setDrivingDirection:", 3);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v18, "setWalkingDirection:", 3);

      v19 = (id)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
      objc_msgSend(v19, "setTransitDirection:", 3);
LABEL_8:

      break;
    default:
      return;
  }
}

- (BOOL)isDestinationEntryPoint
{
  void *v3;
  unsigned int v4;
  void *v5;
  BOOL v6;
  void *v7;
  unsigned int v8;
  void *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  void *v13;
  BOOL v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v4 = objc_msgSend(v3, "hasWalkingDirection");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
    v6 = objc_msgSend(v5, "walkingDirection") == 4;

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v8 = objc_msgSend(v7, "hasDrivingDirection");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
    v10 = objc_msgSend(v9, "drivingDirection") == 4;

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
  v12 = objc_msgSend(v11, "hasTransitDirection");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEntryPoint accessPoint](self, "accessPoint"));
    v14 = objc_msgSend(v13, "transitDirection") == 4;

  }
  else
  {
    v14 = 0;
  }
  return v6 || v10 || v14;
}

+ (id)entryPointStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 5, 3, 6, 197, 10, 5, 0);
}

- (GEORoadAccessPoint)accessPoint
{
  return self->_accessPoint;
}

- (void)setAccessPoint:(id)a3
{
  objc_storeStrong((id *)&self->_accessPoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoint, 0);
}

@end
