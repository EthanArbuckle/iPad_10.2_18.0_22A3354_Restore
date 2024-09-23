@implementation WebGeolocationCoreLocationProvider

- (void)createLocationManager
{
  void *v3;
  void *m_ptr;

  v3 = (void *)objc_msgSend(objc_alloc((Class)getCLLocationManagerClass()), "init");
  m_ptr = self->_locationManager.m_ptr;
  self->_locationManager.m_ptr = v3;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_lastAuthorizationStatus = objc_msgSend((id)getCLLocationManagerClass(), "authorizationStatus");
  objc_msgSend(self->_locationManager.m_ptr, "setDelegate:", self);
}

- (WebGeolocationCoreLocationProvider)initWithListener:(id)a3
{
  WebGeolocationCoreLocationProvider *v4;
  WebGeolocationCoreLocationProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebGeolocationCoreLocationProvider;
  v4 = -[WebGeolocationCoreLocationProvider init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_positionListener = (WebGeolocationCoreLocationUpdateListener *)a3;
    -[WebGeolocationCoreLocationProvider createLocationManager](v4, "createLocationManager");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_locationManager.m_ptr, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebGeolocationCoreLocationProvider;
  -[WebGeolocationCoreLocationProvider dealloc](&v3, sel_dealloc);
}

- (void)requestGeolocationAuthorization
{
  int v3;

  if ((objc_msgSend((id)getCLLocationManagerClass(), "locationServicesEnabled") & 1) != 0
    && (v3 = objc_msgSend((id)getCLLocationManagerClass(), "authorizationStatus"), (v3 - 1) >= 2))
  {
    if ((v3 - 3) >= 2)
    {
      if (!v3 && !self->_isWaitingForAuthorization)
      {
        self->_isWaitingForAuthorization = 1;
        objc_msgSend(self->_locationManager.m_ptr, "requestWhenInUseAuthorization");
      }
    }
    else
    {
      -[WebGeolocationCoreLocationUpdateListener geolocationAuthorizationGranted](self->_positionListener, "geolocationAuthorizationGranted");
    }
  }
  else
  {
    -[WebGeolocationCoreLocationUpdateListener geolocationAuthorizationDenied](self->_positionListener, "geolocationAuthorizationDenied");
  }
}

- (void)start
{
  if (objc_msgSend((id)getCLLocationManagerClass(), "locationServicesEnabled")
    && objc_msgSend((id)getCLLocationManagerClass(), "authorizationStatus") - 3 < 2)
  {
    objc_msgSend(self->_locationManager.m_ptr, "startUpdatingLocation");
  }
  else
  {
    objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation");
    -[WebGeolocationCoreLocationUpdateListener resetGeolocation](self->_positionListener, "resetGeolocation");
  }
}

- (void)stop
{
  objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation");
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (self->_isWaitingForAuthorization)
  {
    if ((a4 - 3) >= 2)
    {
      if ((a4 - 1) <= 1)
      {
        self->_isWaitingForAuthorization = 0;
        -[WebGeolocationCoreLocationUpdateListener geolocationAuthorizationDenied](self->_positionListener, "geolocationAuthorizationDenied", a3);
      }
      goto LABEL_5;
    }
    self->_isWaitingForAuthorization = 0;
    -[WebGeolocationCoreLocationUpdateListener geolocationAuthorizationGranted](self->_positionListener, "geolocationAuthorizationGranted", a3);
    self->_lastAuthorizationStatus = a4;
  }
  else
  {
    if (((self->_lastAuthorizationStatus - 3) | (a4 - 3)) < 2)
    {
LABEL_5:
      self->_lastAuthorizationStatus = a4;
      return;
    }
    objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation", a3);
    -[WebGeolocationCoreLocationUpdateListener resetGeolocation](self->_positionListener, "resetGeolocation");
    self->_lastAuthorizationStatus = a4;
  }
}

- (void)sendLocation:(id)a3
{
  WebGeolocationCoreLocationUpdateListener *positionListener;
  _BYTE v4[112];

  positionListener = self->_positionListener;
  MEMORY[0x1D82A5DF8](v4, a3);
  -[WebGeolocationCoreLocationUpdateListener positionChanged:](positionListener, "positionChanged:", v4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a4);
        -[WebGeolocationCoreLocationProvider sendLocation:](self, "sendLocation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) != 1)
    -[WebGeolocationCoreLocationUpdateListener errorOccurred:](self->_positionListener, "errorOccurred:", objc_msgSend(a4, "localizedDescription"));
}

- (void)setEnableHighAccuracy:(BOOL)a3
{
  void *m_ptr;
  uint64_t *v4;

  m_ptr = self->_locationManager.m_ptr;
  v4 = &_MergedGlobals_5;
  if (!a3)
    v4 = &qword_1ECEC9758;
  ((void (*)(void))*v4)();
  objc_msgSend(m_ptr, "setDesiredAccuracy:");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_locationManager.m_ptr;
  self->_locationManager.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
