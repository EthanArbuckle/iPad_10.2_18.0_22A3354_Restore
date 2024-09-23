@implementation CoreLocationUndulationProvider

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B1BB30;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D4008 != -1)
    dispatch_once(&qword_1014D4008, block);
  return (id)qword_1014D4000;
}

- (CoreLocationUndulationProvider)init
{
  CoreLocationUndulationProvider *v2;
  CLLocationManager *v3;
  CLLocationManager *locationManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CoreLocationUndulationProvider;
  v2 = -[CoreLocationUndulationProvider init](&v6, "init");
  if (v2)
  {
    v3 = (CLLocationManager *)objc_alloc_init((Class)CLLocationManager);
    locationManager = v2->_locationManager;
    v2->_locationManager = v3;

    -[CLLocationManager _setGroundAltitudeEnabled:](v2->_locationManager, "_setGroundAltitudeEnabled:", 1);
  }
  return v2;
}

+ (double)undulationAtLocation:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_groundAltitudeAtLocation:", a3));
  objc_msgSend(v3, "undulation");
  v5 = v4;

  return v5;
}

+ (id)_groundAltitudeAtLocation:(id)a3
{
  id v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = sub_100B1BE2C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      ++v5;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Calling _groundAltitudeAtLocation: %d/8 times", buf, 8u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "locationManager"));
      v10 = objc_msgSend(v9, "_groundAltitudeAtLocation:", v4);

    }
    while (v5 != 7);
    v11 = sub_100B1BE2C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Calling _groundAltitudeAtLocation: 8/8 times", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "locationManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_groundAltitudeAtLocation:", v4));

    v16 = sub_100B1BE2C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Got ground altitude: %@", buf, 0xCu);
    }
  }
  else
  {
    v18 = sub_100B1BE2C();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Location cannot be nil; ignoring", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (CoreLocationUndulationProvider)sharedInstance
{
  return self->_sharedInstance;
}

- (CLLocationManager)locationManager
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
  objc_storeStrong((id *)&self->_sharedInstance, 0);
}

@end
