@implementation WeatherMapPanningCoordinator

- (WeatherMapPanningCoordinator)initWithWeatherLocationDataProvider:(id)a3
{
  id v5;
  WeatherMapPanningCoordinator *v6;
  WeatherMapPanningCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WeatherMapPanningCoordinator;
  v6 = -[WeatherMapPanningCoordinator init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    v7->_lastCenterCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_100E3A668;
  }

  return v7;
}

- (void)handleMapViewRegionDidChange:(id)a3
{
  -[WeatherMapPanningCoordinator handleMapViewRegionDidChange:forceUpdate:](self, "handleMapViewRegionDidChange:forceUpdate:", a3, 0);
}

- (void)handleMapViewRegionDidChange:(id)a3 forceUpdate:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  id v23;
  CLLocationCoordinate2D v24;

  v23 = a3;
  -[WeatherMapPanningCoordinator minZoomLevelThreshold](self, "minZoomLevelThreshold");
  if (v6 == 0.0
    || (v24.latitude = CLLocationCoordinate2DFromGEOLocationCoordinate2D(-[WeatherMapPanningCoordinator lastCenterCoordinate](self, "lastCenterCoordinate")),
        !CLLocationCoordinate2DIsValid(v24)))
  {
    objc_msgSend(v23, "centerCoordinate");
    -[WeatherMapPanningCoordinator setLastCenterCoordinate:](self, "setLastCenterCoordinate:", GEOLocationCoordinate2DFromCLLocationCoordinate2D(v7, v8));
    objc_msgSend(v23, "_zoomLevel");
    -[WeatherMapPanningCoordinator setLastZoomLevel:](self, "setLastZoomLevel:");
    objc_msgSend(v23, "_minimumZoomLevel");
    v10 = v9;
    objc_msgSend(v23, "_maximumZoomLevel");
    -[WeatherMapPanningCoordinator setMinZoomLevelThreshold:](self, "setMinZoomLevelThreshold:", v10 + (v11 - v10) / 2.25);
    a4 = 1;
  }
  objc_msgSend(v23, "centerCoordinate");
  v14 = GEOLocationCoordinate2DFromCLLocationCoordinate2D(v12, v13);
  v16 = v15;
  objc_msgSend(v23, "_zoomLevel");
  v18 = v17;
  if (a4
    || (-[WeatherMapPanningCoordinator lastZoomLevel](self, "lastZoomLevel"), vabdd_f64(v18, v19) > 0.00000011920929)
    || (v20 = -[WeatherMapPanningCoordinator lastCenterCoordinate](self, "lastCenterCoordinate"),
        GEOCalculateDistance(v20, v21, v22, v14, v16) >= 5000.0))
  {
    -[WeatherMapPanningCoordinator setLastCenterCoordinate:](self, "setLastCenterCoordinate:", v14, v16);
    -[WeatherMapPanningCoordinator setLastZoomLevel:](self, "setLastZoomLevel:", v18);
    -[WeatherMapPanningCoordinator _updateWeatherConditions](self, "_updateWeatherConditions");
  }

}

- (void)_updateWeatherConditions
{
  double v3;
  double v4;
  double v5;
  double latitude;
  double v7;
  double longitude;
  id v9;

  -[WeatherMapPanningCoordinator lastZoomLevel](self, "lastZoomLevel");
  v4 = v3;
  -[WeatherMapPanningCoordinator minZoomLevelThreshold](self, "minZoomLevelThreshold");
  if (v4 <= v5)
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  else
  {
    latitude = CLLocationCoordinate2DFromGEOLocationCoordinate2D(-[WeatherMapPanningCoordinator lastCenterCoordinate](self, "lastCenterCoordinate"));
    longitude = v7;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[WeatherMapPanningCoordinator weatherLocationDataProvider](self, "weatherLocationDataProvider"));
  objc_msgSend(v9, "setCoordinate:", latitude, longitude);

}

- (WeatherLocationDataProvider)weatherLocationDataProvider
{
  return self->_weatherLocationDataProvider;
}

- (void)setWeatherLocationDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCenterCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_lastCenterCoordinate.latitude;
  longitude = self->_lastCenterCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLastCenterCoordinate:(id)a3
{
  self->_lastCenterCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (double)lastZoomLevel
{
  return self->_lastZoomLevel;
}

- (void)setLastZoomLevel:(double)a3
{
  self->_lastZoomLevel = a3;
}

- (double)minZoomLevelThreshold
{
  return self->_minZoomLevelThreshold;
}

- (void)setMinZoomLevelThreshold:(double)a3
{
  self->_minZoomLevelThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);
}

@end
