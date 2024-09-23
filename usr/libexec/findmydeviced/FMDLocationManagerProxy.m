@implementation FMDLocationManagerProxy

- (FMDLocationManagerProxy)initWithLocationManager:(id)a3
{
  id v4;
  FMDLocationManagerProxy *v5;
  FMDLocationManagerProxy *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDLocationManagerProxy;
  v5 = -[FMDLocationManagerProxy init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDLocationManagerProxy setLocationManager:](v5, "setLocationManager:", v4);
    v7 = objc_msgSend(objc_alloc((Class)FMWeakWrapper), "initWithObject:", v4);
    -[FMDLocationManagerProxy setLocationManagerWeakWrapper:](v6, "setLocationManagerWeakWrapper:", v7);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy proxyDeallocationBlock](self, "proxyDeallocationBlock"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy proxyDeallocationBlock](self, "proxyDeallocationBlock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManagerWeakWrapper](self, "locationManagerWeakWrapper"));
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)FMDLocationManagerProxy;
  -[FMDLocationManagerProxy dealloc](&v6, "dealloc");
}

- (void)startUpdatingLocation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "startUpdatingLocation");

}

- (void)stopUpdatingLocation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "stopUpdatingLocation");

}

- (void)startMonitoringSignificantLocationChanges
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "startMonitoringSignificantLocationChanges");

}

- (void)stopMonitoringSignificantLocationChanges
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "stopMonitoringSignificantLocationChanges");

}

- (double)desiredAccuracy
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "desiredAccuracy");
  v4 = v3;

  return v4;
}

- (double)distanceFilter
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v2, "distanceFilter");
  v4 = v3;

  return v4;
}

- (void)setDistanceFilter:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v4, "setDistanceFilter:", a3);

}

- (void)setDesiredAccuracy:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v4, "setDesiredAccuracy:", a3);

}

- (CLLocationManagerDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (CLLocationManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationManagerProxy locationManager](self, "locationManager"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)proxyDeallocationBlock
{
  return self->_proxyDeallocationBlock;
}

- (void)setProxyDeallocationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FMDLocationManaging)locationManager
{
  return (FMDLocationManaging *)objc_loadWeakRetained((id *)&self->_locationManager);
}

- (void)setLocationManager:(id)a3
{
  objc_storeWeak((id *)&self->_locationManager, a3);
}

- (FMWeakWrapper)locationManagerWeakWrapper
{
  return self->_locationManagerWeakWrapper;
}

- (void)setLocationManagerWeakWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_locationManagerWeakWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagerWeakWrapper, 0);
  objc_destroyWeak((id *)&self->_locationManager);
  objc_storeStrong(&self->_proxyDeallocationBlock, 0);
}

@end
