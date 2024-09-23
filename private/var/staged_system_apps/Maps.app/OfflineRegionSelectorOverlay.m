@implementation OfflineRegionSelectorOverlay

- (OfflineRegionSelectorOverlay)initWithRegion:(id)a3
{
  id v5;
  OfflineRegionSelectorOverlay *v6;
  OfflineRegionSelectorOverlay *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OfflineRegionSelectorOverlay;
  v6 = -[OfflineRegionSelectorOverlay init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapRegion, a3);

  return v7;
}

- (void)setRegionSelectorDelegate:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  id v8;
  id obj;

  v4 = a3;
  v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    obj = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      v8 = objc_storeWeak((id *)&self->_regionSelectorDelegate, obj);
      -[OfflineRegionSelectorOverlayView setRegionSelectorDelegate:](self->_overlayView, "setRegionSelectorDelegate:", obj);

      v6 = (unint64_t)obj;
    }
  }

}

- (void)setMapViewProvider:(id)a3
{
  id v4;
  MapViewProviding **p_mapViewProvider;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id obj;

  v4 = a3;
  p_mapViewProvider = &self->_mapViewProvider;
  v6 = (unint64_t)objc_loadWeakRetained((id *)p_mapViewProvider);
  v7 = (unint64_t)v4;
  if (v7 | v6)
  {
    obj = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)obj;
    if ((v8 & 1) == 0)
    {
      objc_storeWeak((id *)p_mapViewProvider, obj);
      v7 = (unint64_t)obj;
    }
  }

}

- (void)_setInitialMapRegion
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  MKMapPoint v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  GEOMapRegion *mapRegion;
  int v35;
  double v36;
  __int16 v37;
  double v38;
  CLLocationCoordinate2D v39;

  v3 = GEOMapRectForMapRegion(self->_mapRegion, a2);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView viewportLayoutGuide](self->_overlayView, "viewportLayoutGuide", v3));
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay mapViewProvider](self, "mapViewProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));
  objc_msgSend(v16, "centerCoordinate");
  v17 = MKMapPointForCoordinate(v39);
  MKMapRectMakeWithZoomLevel(v18, v17.x, v17.y, 12.0, v12, v14);
  v20 = v19;

  if (v5 >= v20)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay mapViewProvider](self, "mapViewProvider"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapView"));
    objc_msgSend(v27, "convertMapRect:toRectToView:", self->_overlayView, GEOMapRectForMapRegion(self->_mapRegion, v28));
    v8 = v29;
    v10 = v30;
    v12 = v31;
    v14 = v32;

    v33 = sub_100431D5C();
    v22 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      mapRegion = self->_mapRegion;
      v35 = 138412290;
      v36 = *(double *)&mapRegion;
      v23 = "Using map region for initial region selector framing: %@";
      v24 = v22;
      v25 = 12;
      goto LABEL_6;
    }
  }
  else
  {
    v21 = sub_100431D5C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v35 = 134218240;
      v36 = v5;
      v37 = 2048;
      v38 = v20;
      v23 = "Using viewport frame for initial region selector framing: mapRect width (%f) is below minimum width (%f)";
      v24 = v22;
      v25 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v35, v25);
    }
  }

  -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self->_overlayView, "setInitialSelectedRect:animated:", 1, v8, v10, v12, v14);
}

- (void)setMapRegion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay mapViewProvider](self, "mapViewProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  objc_msgSend(v5, "convertMapRect:toRectToView:", self->_overlayView, GEOMapRectForMapRegion(v15, v6));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[OfflineRegionSelectorOverlayView setInitialSelectedRect:animated:](self->_overlayView, "setInitialSelectedRect:animated:", 0, v8, v10, v12, v14);
}

- (GEOMapRegion)currentMapRegion
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay mapViewProvider](self, "mapViewProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  -[OfflineRegionSelectorOverlayView selectedRectFrame](self->_overlayView, "selectedRectFrame");
  objc_msgSend(v4, "convertRect:toMapRectFromView:", self->_overlayView);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  return (GEOMapRegion *)objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v6, v8, v10, v12);
}

- (void)animateForDownloadWithCompletion:(id)a3
{
  -[OfflineRegionSelectorOverlayView animateForDownloadWithCompletion:](self->_overlayView, "animateForDownloadWithCompletion:", a3);
}

- (void)setHost:(id)a3
{
  id WeakRetained;
  void *v5;
  OfflineRegionSelectorOverlayView *overlayView;
  OfflineRegionSelectorOverlayView *v7;
  OfflineRegionSelectorOverlayView *v8;
  void *v9;
  void *v10;
  void *v11;
  OfflineRegionSelectorOverlayView *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    overlayView = self->_overlayView;
    if (overlayView)
      -[OfflineRegionSelectorOverlayView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      if (!self->_overlayView)
      {
        v7 = -[OfflineRegionSelectorOverlayView initWithFrame:]([OfflineRegionSelectorOverlayView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v8 = self->_overlayView;
        self->_overlayView = v7;

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlay regionSelectorDelegate](self, "regionSelectorDelegate"));
        -[OfflineRegionSelectorOverlayView setRegionSelectorDelegate:](self->_overlayView, "setRegionSelectorDelegate:", v9);

        -[OfflineRegionSelectorOverlayView setTranslatesAutoresizingMaskIntoConstraints:](self->_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[OfflineRegionSelectorOverlayView setAccessibilityIdentifier:](self->_overlayView, "setAccessibilityIdentifier:", CFSTR("OfflineRegionSelector"));
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "viewportLayoutGuide"));
      -[OfflineRegionSelectorOverlayView setViewportLayoutGuide:](self->_overlayView, "setViewportLayoutGuide:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      objc_msgSend(v11, "addSubview:", self->_overlayView);

      v12 = self->_overlayView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      LODWORD(v14) = 1148846080;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorOverlayView _maps_constraintsEqualToEdgesOfView:insets:priority:](v12, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      objc_msgSend(v17, "layoutIfNeeded");

      -[OfflineRegionSelectorOverlay _setInitialMapRegion](self, "_setInitialMapRegion");
      v5 = obj;
    }
  }

}

- (BOOL)isHidden
{
  return -[OfflineRegionSelectorOverlayView isHidden](self->_overlayView, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  -[OfflineRegionSelectorOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[OfflineRegionSelectorOverlayView setHidden:](self->_overlayView, "setHidden:", a3, a4);
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (OfflineRegionSelectorActionCoordination)regionSelectorDelegate
{
  return (OfflineRegionSelectorActionCoordination *)objc_loadWeakRetained((id *)&self->_regionSelectorDelegate);
}

- (MapViewProviding)mapViewProvider
{
  return (MapViewProviding *)objc_loadWeakRetained((id *)&self->_mapViewProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_regionSelectorDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
