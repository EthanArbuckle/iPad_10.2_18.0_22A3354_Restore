@implementation OfflineRegionSelectorContext

- (OfflineRegionSelectorContext)initWithRegion:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  OfflineRegionSelectorContext *v9;
  OfflineRegionSelectorContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OfflineRegionSelectorContext;
  v9 = -[OfflineRegionSelectorContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapRegion, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
    -[OfflineRegionSelectorContext _commonInit](v10, "_commonInit");
  }

  return v10;
}

- (OfflineRegionSelectorContext)initWithSubscriptionInfo:(id)a3
{
  id v5;
  OfflineRegionSelectorContext *v6;
  OfflineRegionSelectorContext *v7;
  void *v8;
  uint64_t v9;
  GEOMapRegion *mapRegion;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OfflineRegionSelectorContext;
  v6 = -[OfflineRegionSelectorContext init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscription"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "region"));
    mapRegion = v7->_mapRegion;
    v7->_mapRegion = (GEOMapRegion *)v9;

    -[OfflineRegionSelectorContext _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)_commonInit
{
  OfflineRegionSelectorViewController *v3;
  OfflineRegionSelectorViewController *offlineRegionSelectorViewController;
  OfflineRegionSelectorOverlay *v5;
  OfflineRegionSelectorOverlay *overlay;

  v3 = objc_alloc_init(OfflineRegionSelectorViewController);
  offlineRegionSelectorViewController = self->_offlineRegionSelectorViewController;
  self->_offlineRegionSelectorViewController = v3;

  -[OfflineRegionSelectorViewController setDelegate:](self->_offlineRegionSelectorViewController, "setDelegate:", self);
  v5 = -[OfflineRegionSelectorOverlay initWithRegion:]([OfflineRegionSelectorOverlay alloc], "initWithRegion:", self->_mapRegion);
  overlay = self->_overlay;
  self->_overlay = v5;

  -[OfflineRegionSelectorOverlay setRegionSelectorDelegate:](self->_overlay, "setRegionSelectorDelegate:", self);
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10065AEA0;
  v10[3] = &unk_1011AD260;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "addPreparation:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10065AED0;
  v8[3] = &unk_1011AD4F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "addCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  GEOCancellable *currentSizeEstimationRequest;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextTopContext"));
  v9 = objc_opt_class(BaseModeController);
  self->_aboutToBecomeBaseMode = objc_opt_isKindOfClass(v8, v9) & 1;
  -[GEOCancellable cancel](self->_currentSizeEstimationRequest, "cancel");
  currentSizeEstimationRequest = self->_currentSizeEstimationRequest;
  self->_currentSizeEstimationRequest = 0;

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10065B058;
  v12[3] = &unk_1011AD260;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "addPreparation:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10065B0C4;
  v11[3] = &unk_1011AE8F8;
  v11[4] = self;
  objc_msgSend(v7, "addCompletion:", v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)setChromeViewController:(id)a3
{
  ChromeViewController **p_chromeViewController;
  id v5;
  id v6;

  p_chromeViewController = &self->_chromeViewController;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_chromeViewController, v6);
  -[OfflineRegionSelectorOverlay setMapViewProvider:](self->_overlay, "setMapViewProvider:", v6);

}

- (id)desiredCards
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_offlineRegionSelectorViewController)
    objc_msgSend(v3, "addObject:");
  return v4;
}

- (BOOL)shouldResetStateAfterResigning
{
  return self->_didDownloadRegion && !self->_aboutToBecomeBaseMode;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  BOOL changedRegion;
  id v5;

  changedRegion = self->_changedRegion;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay currentMapRegion](self->_overlay, "currentMapRegion", a3));
  -[OfflineRegionSelectorContext _setMapRegion:animated:](self, "_setMapRegion:animated:", v5, 0);
  -[OfflineRegionSelectorOverlay setMapRegion:](self->_overlay, "setMapRegion:", v5);
  -[OfflineRegionSelectorContext _updateZoomRange](self, "_updateZoomRange");
  self->_changedRegion = changedRegion;

}

- (BOOL)wantsRouteAnnotationsControl
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext route](self, "route"));
  v3 = v2 != 0;

  return v3;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  void *v3;
  RouteAnnotationsMutableConfiguration *v4;
  void *v5;
  RouteAnnotationsMutableConfiguration *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext route](self, "route"));

  if (v3)
  {
    v4 = [RouteAnnotationsMutableConfiguration alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext route](self, "route"));
    v6 = -[RouteAnnotationsConfiguration initWithRoute:](v4, "initWithRoute:", v5);

    -[RouteAnnotationsConfiguration setRouteTrafficFeaturesActive:](v6, "setRouteTrafficFeaturesActive:", 0);
    v7 = -[RouteAnnotationsMutableConfiguration copy](v6, "copy");

  }
  else
  {
    v7 = 0;
  }
  return (RouteAnnotationsConfiguration *)v7;
}

- (void)dismiss
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  GEOMapRegion *downloadedMapRegion;
  void *v9;
  void *v10;
  GEOMapRegion *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  _QWORD v14[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  v4 = objc_msgSend(v3, "isCurrentContext:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  v6 = v5;
  if (v4)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10065B480;
    v14[3] = &unk_1011AC860;
    v14[4] = self;
    objc_msgSend(v5, "popContextAnimated:completion:", 1, v14);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext dismissalBlock](self, "dismissalBlock"));
    if (v7)
    {
      if (self->_didDownloadRegion)
        downloadedMapRegion = self->_downloadedMapRegion;
      else
        downloadedMapRegion = 0;
      v11 = downloadedMapRegion;
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext dismissalBlock](self, "dismissalBlock"));
      ((void (**)(_QWORD, GEOMapRegion *))v12)[2](v12, v11);

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contexts"));
    v13 = objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v13, "removeObject:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
    objc_msgSend(v10, "setContexts:animated:completion:", v13, 0, 0);

  }
}

- (void)_saveMapViewConfiguration
{
  void *v3;
  MapViewRestoreProperties *v4;
  MapViewRestoreProperties *savedMapViewProperties;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  v4 = -[MapViewRestoreProperties initFromMapView:]([MapViewRestoreProperties alloc], "initFromMapView:", v7);
  savedMapViewProperties = self->_savedMapViewProperties;
  self->_savedMapViewProperties = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  self->_savedViewMode = (int64_t)objc_msgSend(v6, "displayedViewMode");

}

- (void)_setupMapView
{
  void *v3;
  void *v4;
  void *v5;
  id offlineMapPreviewModernMapToken;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  OfflineRegionSelectorOverlay *overlay;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "acquireModernMapTokenForReason:", 4));
  offlineMapPreviewModernMapToken = self->_offlineMapPreviewModernMapToken;
  self->_offlineMapPreviewModernMapToken = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  if (!objc_msgSend(v7, "displayedViewMode"))
    goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  v9 = objc_msgSend(v8, "displayedViewMode");

  if (v9 != (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
    objc_msgSend(v7, "updateViewMode:animated:", 0, 0);
LABEL_4:

  }
  objc_msgSend(v16, "setRotateEnabled:", 0);
  objc_msgSend(v16, "setPitchEnabled:", 0);
  objc_msgSend(v16, "_setOfflineRegionVisibility:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_mapLayer"));
  objc_msgSend(v10, "setOfflineRegionSelector:", 1);

  -[OfflineRegionSelectorContext _updateZoomRange](self, "_updateZoomRange");
  -[OfflineRegionSelectorContext _setMapRegion:animated:](self, "_setMapRegion:animated:", self->_mapRegion, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "overlayController"));
  overlay = self->_overlay;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewportLayoutGuide"));
  objc_msgSend(v12, "addOverlay:inLayoutGuide:", overlay, v15);

}

- (void)_updateZoomRange
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Double;
  CLLocationCoordinate2D v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  objc_msgSend(v19, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v19, "_edgeInsets");
  v11 = 3052640.66;
  if (v4 - (v9 + v10) > 0.0
    && v6 - (v7 + v8) > 0.0
    && GEOConfigGetBOOL(MapsConfig_OfflineRegionSelectorEnforceMaxGeographicSize, off_1014B5068))
  {
    Double = GEOConfigGetDouble(MapsConfig_OfflineRegionSelectorMaxSize, off_1014B5078);
    v13 = CLLocationCoordinate2DMake(0.0, 0.0);
    v14 = MKMapRectMakeWithRadialDistance(v13.latitude, v13.longitude, Double * 0.5);
    _MKMapRectThatFits(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:"));
    objc_msgSend(v15, "centerCoordinateDistance");
    v11 = 95394.9663;
    if (v16 > 95394.9663)
    {
      objc_msgSend(v15, "centerCoordinateDistance");
      v11 = v17;
    }

  }
  v18 = objc_msgSend(objc_alloc((Class)MKMapCameraZoomRange), "initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:", 95394.9663, v11);
  objc_msgSend(v18, "_setBouncesZoom:", 1);
  objc_msgSend(v19, "setCameraZoomRange:", v18);

}

- (void)_setMapRegion:(id)a3 animated:(BOOL)a4
{
  -[OfflineRegionSelectorContext _setMapRegion:animated:completion:](self, "_setMapRegion:animated:completion:", a3, a4, 0);
}

- (void)_setMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));

  objc_msgSend(v10, "mapRectThatFits:edgePadding:", GEOMapRectForMapRegion(v12, v11));
  objc_msgSend(v10, "_setVisibleMapRect:animated:completionHandler:", v6, v8);

}

- (void)_restoreMapView
{
  id offlineMapPreviewModernMapToken;
  void *v4;
  id v5;
  int64_t savedViewMode;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  offlineMapPreviewModernMapToken = self->_offlineMapPreviewModernMapToken;
  self->_offlineMapPreviewModernMapToken = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
  v5 = objc_msgSend(v4, "displayedViewMode");
  savedViewMode = self->_savedViewMode;

  if (v5 != (id)savedViewMode)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext iosChromeViewController](self, "iosChromeViewController"));
    objc_msgSend(v7, "updateViewMode:animated:", self->_savedViewMode, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapLayer"));
  objc_msgSend(v9, "setOfflineRegionSelector:", 0);

  -[MapViewRestoreProperties applyToMapView:animated:](self->_savedMapViewProperties, "applyToMapView:animated:", v10, 0);
}

- (BOOL)downloadSelectedOfflineRegion
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int64_t estimatedSizeInBytes;
  void *v16;
  id v17;
  NSObject *v18;
  GCDTimer *updateRegionSizeTimeoutTimer;
  GCDTimer *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  BOOL v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  GEOMapRegion *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double width;
  double height;
  id v49;
  NSObject *v50;
  double v51;
  double v52;
  double Double;
  double v54;
  id v55;
  NSString *displayName;
  NSString *v57;
  void *v58;
  void *v59;
  NSString *v60;
  uint64_t v61;
  id v62;
  double rect1;
  id *v65;
  _QWORD v66[4];
  NSString *v67;
  id v68;
  _QWORD *v69;
  BOOL v70;
  uint8_t v71[16];
  _QWORD v72[5];
  id v73;
  __int128 *v74;
  _QWORD v75[5];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 *p_buf;
  id v81;
  id location;
  __int128 buf;
  uint64_t v84;
  char v85;
  MKMapRect v86;
  MKMapRect v87;
  MKMapRect v88;

  v3 = -[OfflineRegionSelectorContext shouldUseSessionlessAnalytics](self, "shouldUseSessionlessAnalytics");
  if (v3)
    v4 = 368;
  else
    v4 = 372;
  if (MapsFeature_IsEnabled_StandaloneWatchOffline(v3)
    && GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled[0], GeoOfflineConfig_SyncToWatchEnabled[1])
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getActivePairedDeviceExcludingAltAccount")),
        v5,
        v6))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"));
    v8 = objc_msgSend(v6, "supportsCapability:", v7);

    if (v8)
      v9 = CFSTR("watch pending");
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, 89, v9);
  if (self->_determinedSupportForCurrentRegion)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alertControllerForInsufficientDiskSpaceForDownloadSize:", self->_estimatedSizeInBytes));

    v12 = v11 == 0;
    if (v11)
    {
      v13 = sub_100431D5C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        estimatedSizeInBytes = self->_estimatedSizeInBytes;
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = estimatedSizeInBytes;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Displaying insufficient disk space alert for attempted download of %{bytes}llu", (uint8_t *)&buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext chromeViewController](self, "chromeViewController"));
      objc_msgSend(v16, "_maps_topMostPresentViewController:animated:completion:", v11, 1, 0);

      goto LABEL_45;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v84 = 0x2020000000;
    v85 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay currentMapRegion](self->_overlay, "currentMapRegion"));
    objc_initWeak(&location, self);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10065C100;
    v78[3] = &unk_1011BF0B0;
    v65 = &v81;
    objc_copyWeak(&v81, &location);
    p_buf = &buf;
    v22 = v21;
    v79 = v22;
    v23 = objc_retainBlock(v78);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10065C254;
    v75[3] = &unk_1011BF100;
    v75[4] = self;
    v24 = v22;
    v76 = v24;
    v25 = v23;
    v77 = v25;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10065C3D4;
    v72[3] = &unk_1011BF150;
    v72[4] = self;
    v26 = objc_retainBlock(v75);
    v73 = v26;
    v74 = &buf;
    v27 = objc_retainBlock(v72);
    if (self->_subscriptionInfo)
    {
      ((void (*)(_QWORD *, NSString *))v26[2])(v26, self->_displayName);
LABEL_44:

      objc_destroyWeak(v65);
      objc_destroyWeak(&location);

      _Block_object_dispose(&buf, 8);
LABEL_45:

      return v12;
    }
    v28 = -[NSString length](self->_displayName, "length") != 0;
    if (self->_changedRegion)
    {
      v29 = v24;
      v31 = GEOMapRectForMapRegion(v29, v30);
      rect1 = v32;
      v33 = v31;
      v35 = v34;
      v37 = v36;

      v38 = self->_mapRegion;
      v40 = GEOMapRectForMapRegion(v38, v39);
      v42 = v41;
      v44 = v43;
      v46 = v45;

      v86.origin.x = v33;
      v86.origin.y = v35;
      v86.size.width = rect1;
      v86.size.height = v37;
      v88.origin.x = v40;
      v88.origin.y = v42;
      v88.size.width = v44;
      v88.size.height = v46;
      v87 = MKMapRectIntersection(v86, v88);
      width = v87.size.width;
      height = v87.size.height;
      if (v87.origin.x == MKMapRectNull.origin.x && v87.origin.y == MKMapRectNull.origin.y)
      {
LABEL_27:
        v49 = sub_100431D5C();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v71 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Region changed significantly. Attempting to fetch a new suggested region name", v71, 2u);
        }
        v28 = 0;
        goto LABEL_40;
      }
      v28 = 0;
      v51 = rect1 * v37;
      if (v51 > 0.0)
      {
        v52 = v44 * v46;
        if (v52 > 0.0)
        {
          Double = GEOConfigGetDouble(MapsConfig_OfflineRegionPreserveNameChangeThreshold, off_1014B4FF8);
          v54 = width * height / v52;
          if (width * height / v51 < v54)
            v54 = width * height / v51;
          if (v54 < 1.0 - Double)
            goto LABEL_27;
          v28 = 0;
        }
      }
    }
    if (-[NSString length](self->_displayName, "length", *(_QWORD *)&rect1, &v81))
    {
      ((void (*)(_QWORD *, NSString *))v27[2])(v27, self->_displayName);
      goto LABEL_44;
    }
    v55 = sub_100431D5C();
    v50 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Region had no original display name. Attempting to fetch a suggested region name", v71, 2u);
    }
LABEL_40:

    if (-[NSString length](self->_displayName, "length"))
      displayName = self->_displayName;
    else
      displayName = 0;
    v57 = displayName;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "ticketForOfflineRegionNameSuggestionWithRegion:traits:", v24, 0));

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10065C554;
    v66[3] = &unk_1011BF178;
    v70 = v28;
    v60 = v57;
    v67 = v60;
    v68 = v24;
    v69 = v27;
    v61 = (uint64_t)GEOConfigGetDouble(MapsConfig_OfflineMapsRegionNameLookupTimeout, off_1014B4EF8);
    v62 = &_dispatch_main_q;
    objc_msgSend(v59, "submitWithHandler:timeout:networkActivity:queue:", v66, v61, 0, &_dispatch_main_q);

    goto LABEL_44;
  }
  v17 = sub_100431D5C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Can not download region until size/support has been determined", (uint8_t *)&buf, 2u);
  }

  if ((id)-[OfflineRegionSelectorViewController state](self->_offlineRegionSelectorViewController, "state") == (id)1)
  {
    updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
    if (updateRegionSizeTimeoutTimer)
    {
      -[GCDTimer invalidate](updateRegionSizeTimeoutTimer, "invalidate");
      v20 = self->_updateRegionSizeTimeoutTimer;
      self->_updateRegionSizeTimeoutTimer = 0;

      -[OfflineRegionSelectorViewController setState:](self->_offlineRegionSelectorViewController, "setState:", 0);
    }
  }
  return 0;
}

- (void)willAdjustSelectedRegion
{
  GCDTimer *updateRegionSizeTimeoutTimer;

  *(_WORD *)&self->_changedRegion = 1;
  -[GCDTimer invalidate](self->_updateRegionSizeTimeoutTimer, "invalidate");
  updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
  self->_updateRegionSizeTimeoutTimer = 0;

}

- (void)didAdjustSelectedRegion
{
  GEOMapRegion *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  GEOCancellable *v8;
  GEOCancellable *currentSizeEstimationRequest;
  double Double;
  id v11;
  GCDTimer *v12;
  GCDTimer *updateRegionSizeTimeoutTimer;
  _QWORD v14[4];
  id v15[3];
  _QWORD v16[5];
  id v17[2];
  id location;

  v3 = self->_mapRegion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay host](self->_overlay, "host"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay currentMapRegion](self->_overlay, "currentMapRegion"));

    v3 = (GEOMapRegion *)v5;
  }
  v6 = (void *)(self->_regionSizeCheckGeneration + 1);
  self->_regionSizeCheckGeneration = (unint64_t)v6;
  -[GEOCancellable cancel](self->_currentSizeEstimationRequest, "cancel");
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10065C9D8;
  v16[3] = &unk_1011BF1A0;
  objc_copyWeak(v17, &location);
  v17[1] = v6;
  v16[4] = self;
  v8 = (GEOCancellable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "determineEstimatedSizeForSubscriptionWithRegion:completionHandler:", v3, v16));
  currentSizeEstimationRequest = self->_currentSizeEstimationRequest;
  self->_currentSizeEstimationRequest = v8;

  Double = GEOConfigGetDouble(MapsConfig_OfflineRegionSelectorCalculatingDisplayTimeout, off_1014B4FA8);
  if (Double > 0.0)
  {
    v11 = &_dispatch_main_q;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10065CAE8;
    v14[3] = &unk_1011BF1C8;
    objc_copyWeak(v15, &location);
    v15[1] = v6;
    v15[2] = *(id *)&Double;
    v12 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v14, Double));
    updateRegionSizeTimeoutTimer = self->_updateRegionSizeTimeoutTimer;
    self->_updateRegionSizeTimeoutTimer = v12;

    objc_destroyWeak(v15);
  }
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

- (void)didAdjustSelectorCropHandle
{
  const __CFString *v2;

  if (-[OfflineRegionSelectorViewController downloadable](self->_offlineRegionSelectorViewController, "downloadable"))
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 386, 89, v2);
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  unsigned int v9;
  uint64_t v10;
  const __CFString *v11;

  v9 = -[OfflineRegionSelectorViewController downloadable](self->_offlineRegionSelectorViewController, "downloadable", a3, a4, a5, a6, a7, a8);
  if (a4)
  {
    if (a4 != 1)
      return;
    v10 = 386;
  }
  else
  {
    v10 = 377;
  }
  if (v9)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v10, 89, v11);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (AutocompletePOIMapDownloadHandler)downloadDelegate
{
  return (AutocompletePOIMapDownloadHandler *)objc_loadWeakRetained((id *)&self->_downloadDelegate);
}

- (void)setDownloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_downloadDelegate, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)postDismissalBlock
{
  return self->_postDismissalBlock;
}

- (void)setPostDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)shouldUseSessionlessAnalytics
{
  return self->_shouldUseSessionlessAnalytics;
}

- (void)setShouldUseSessionlessAnalytics:(BOOL)a3
{
  self->_shouldUseSessionlessAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postDismissalBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_downloadDelegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_currentSizeEstimationRequest, 0);
  objc_storeStrong(&self->_offlineMapPreviewModernMapToken, 0);
  objc_storeStrong((id *)&self->_savedMapViewProperties, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_updateRegionSizeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_downloadedMapRegion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_offlineRegionSelectorViewController, 0);
}

@end
