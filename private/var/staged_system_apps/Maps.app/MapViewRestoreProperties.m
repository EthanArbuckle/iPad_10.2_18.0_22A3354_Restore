@implementation MapViewRestoreProperties

- (id)initFromMapView:(id)a3
{
  id v4;
  MapViewRestoreProperties *v5;
  void *v6;
  MKMapConfiguration *v7;
  MKMapConfiguration *preferredConfiguration;
  void *v9;
  MKMapCamera *v10;
  MKMapCamera *camera;
  void *v12;
  MKMapCameraZoomRange *v13;
  MKMapCameraZoomRange *cameraZoomRange;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapViewRestoreProperties;
  v5 = -[MapViewRestoreProperties init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredConfiguration"));
    v7 = (MKMapConfiguration *)objc_msgSend(v6, "copy");
    preferredConfiguration = v5->_preferredConfiguration;
    v5->_preferredConfiguration = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "camera"));
    v10 = (MKMapCamera *)objc_msgSend(v9, "copy");
    camera = v5->_camera;
    v5->_camera = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraZoomRange"));
    v13 = (MKMapCameraZoomRange *)objc_msgSend(v12, "copy");
    cameraZoomRange = v5->_cameraZoomRange;
    v5->_cameraZoomRange = v13;

    v5->_zoomEnabled = objc_msgSend(v4, "isZoomEnabled");
    v5->_scrollEnabled = objc_msgSend(v4, "isScrollEnabled");
    v5->_rotateEnabled = objc_msgSend(v4, "isRotateEnabled");
    v5->_pitchEnabled = objc_msgSend(v4, "isPitchEnabled");
    v5->_showsCompass = objc_msgSend(v4, "showsCompass");
    v5->_showsScale = objc_msgSend(v4, "showsScale");
    v5->_userTrackingMode = (int64_t)objc_msgSend(v4, "userTrackingMode");
    v5->_offlineRegionVisibility = (int64_t)objc_msgSend(v4, "_offlineRegionVisibility");
    v5->_applicationState = objc_msgSend(v4, "_applicationState");
  }

  return v5;
}

- (void)applyToMapView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewRestoreProperties preferredConfiguration](self, "preferredConfiguration"));
  objc_msgSend(v9, "setPreferredConfiguration:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewRestoreProperties cameraZoomRange](self, "cameraZoomRange"));
  objc_msgSend(v9, "setCameraZoomRange:animated:", v7, v4);

  objc_msgSend(v9, "setZoomEnabled:", -[MapViewRestoreProperties isZoomEnabled](self, "isZoomEnabled"));
  objc_msgSend(v9, "setScrollEnabled:", -[MapViewRestoreProperties isScrollEnabled](self, "isScrollEnabled"));
  objc_msgSend(v9, "setRotateEnabled:", -[MapViewRestoreProperties isRotateEnabled](self, "isRotateEnabled"));
  objc_msgSend(v9, "setPitchEnabled:", -[MapViewRestoreProperties isPitchEnabled](self, "isPitchEnabled"));
  objc_msgSend(v9, "setShowsCompass:", -[MapViewRestoreProperties showsCompass](self, "showsCompass"));
  objc_msgSend(v9, "setShowsScale:", -[MapViewRestoreProperties showsScale](self, "showsScale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewRestoreProperties camera](self, "camera"));
  objc_msgSend(v9, "setCamera:animated:", v8, v4);

  objc_msgSend(v9, "setUserTrackingMode:animated:", -[MapViewRestoreProperties userTrackingMode](self, "userTrackingMode"), v4);
  objc_msgSend(v9, "_setOfflineRegionVisibility:", -[MapViewRestoreProperties offlineRegionVisibility](self, "offlineRegionVisibility"));
  objc_msgSend(v9, "_setApplicationState:", self->_applicationState);

}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (MKMapCameraZoomRange)cameraZoomRange
{
  return self->_cameraZoomRange;
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)isRotateEnabled
{
  return self->_rotateEnabled;
}

- (BOOL)isPitchEnabled
{
  return self->_pitchEnabled;
}

- (BOOL)showsCompass
{
  return self->_showsCompass;
}

- (BOOL)showsScale
{
  return self->_showsScale;
}

- (int64_t)userTrackingMode
{
  return self->_userTrackingMode;
}

- (int64_t)offlineRegionVisibility
{
  return self->_offlineRegionVisibility;
}

- (int)applicationState
{
  return self->_applicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraZoomRange, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
}

@end
