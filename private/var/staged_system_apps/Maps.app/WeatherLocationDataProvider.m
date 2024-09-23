@implementation WeatherLocationDataProvider

- (WeatherLocationDataProvider)init
{
  WeatherLocationDataProvider *v2;
  WeatherLocationDataProvider *v3;
  uint64_t v4;
  NSHashTable *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherLocationDataProvider;
  v2 = -[WeatherLocationDataProvider init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_coordinate = kCLLocationCoordinate2DInvalid;
    v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

  }
  return v3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  BOOL v6;
  CLLocationCoordinate2D *p_coordinate;
  double v8;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = CLLocationCoordinate2DIsValid(a3);
  p_coordinate = &self->_coordinate;
  if (v6)
  {
    v8 = p_coordinate->latitude;
    if ((p_coordinate->latitude == latitude || (v8 = self->_coordinate.longitude, v8 == longitude)) && self->_location)
    {
      -[WeatherLocationDataProvider _notifyObserversWeatherLocationDidChange](self, "_notifyObserversWeatherLocationDidChange", v8);
    }
    else
    {
      self->_coordinate.latitude = latitude;
      self->_coordinate.longitude = longitude;
      -[WeatherLocationDataProvider _updateCoordinate:](self, "_updateCoordinate:", latitude);
    }
  }
  else
  {
    *p_coordinate = kCLLocationCoordinate2DInvalid;
    -[WeatherLocationDataProvider _updateLocation:](self, "_updateLocation:", 0);
  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversWeatherLocationDidChange
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8[2];
  id location;

  v4 = -[CLLocation copy](self->_location, "copy");
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100279AF8;
  block[3] = &unk_1011AE810;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a2;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldNotifyObservers
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  if ((objc_msgSend(v2, "shouldShowAirQualityConditions") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "shouldShowWeatherConditions");

  return v3;
}

- (void)_updateCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[WeatherLocationDataProvider _shouldNotifyObservers](self, "_shouldNotifyObservers"))
  {
    v6 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", latitude, longitude);
    -[WeatherLocationDataProvider _updateLocation:](self, "_updateLocation:", v6);

  }
  else
  {
    -[WeatherLocationDataProvider _updateLocation:](self, "_updateLocation:", 0);
  }
}

- (void)_updateLocation:(id)a3
{
  CLLocation *v4;
  CLLocation *location;

  v4 = (CLLocation *)objc_msgSend(a3, "copy");
  location = self->_location;
  self->_location = v4;

  -[WeatherLocationDataProvider _notifyObserversWeatherLocationDidChange](self, "_notifyObserversWeatherLocationDidChange");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
