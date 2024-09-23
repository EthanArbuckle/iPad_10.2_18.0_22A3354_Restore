@implementation ClientTypeResolverCurrentLocationSource

- (ClientTypeResolverCurrentLocationSource)initWithLocationManager:(id)a3
{
  id v5;
  ClientTypeResolverCurrentLocationSource *v6;
  ClientTypeResolverCurrentLocationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClientTypeResolverCurrentLocationSource;
  v6 = -[ClientTypeResolverCurrentLocationSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locationManager, a3);

  return v7;
}

- (id)knownTypes
{
  return &off_101274340;
}

- (BOOL)hasObjectWithType:(int)a3
{
  void *v4;
  BOOL v5;

  if (!-[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:", *(_QWORD *)&a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverCurrentLocationSource cachedObject](self, "cachedObject"));
  v5 = v4 != 0;

  return v5;
}

- (void)objectWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverCurrentLocationSource cachedObject](self, "cachedObject"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)cachedObject
{
  void *v2;
  void *v3;
  id v4;
  CLLocationCoordinate2D v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverCurrentLocationSource locationManager](self, "locationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastLocation"));

  objc_msgSend(v3, "coordinate");
  if (CLLocationCoordinate2DIsValid(v6))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
