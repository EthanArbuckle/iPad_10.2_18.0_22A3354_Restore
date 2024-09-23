@implementation LookAroundPIPAnalyticsController

- (LookAroundPIPAnalyticsController)initWithDataCoordinator:(id)a3
{
  id v4;
  LookAroundPIPAnalyticsController *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LookAroundPIPAnalyticsController;
  v5 = -[LookAroundPIPAnalyticsController init](&v7, "init");
  if (v5)
  {
    objc_msgSend(v4, "addObserver:", v5);
    -[LookAroundPIPAnalyticsController setDataCoordinator:](v5, "setDataCoordinator:", v4);
  }

  return v5;
}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6058, 0, 0);
}

- (void)lookAroundPIPDataCoordinatorDidRotateMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1004, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidPinchZoomInMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1043, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidPinchZoomOutMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1044, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomInMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1047, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidSingleFingerZoomOutMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1048, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomInMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1045, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidDoubleTapZoomOutMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1046, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidSelectMapItem:(id)a3
{
  LookAroundPIPDataCoordinator **p_dataCoordinator;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  p_dataCoordinator = &self->_dataCoordinator;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataCoordinator);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_selectedLabelMarker"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styleAttributes"));
  LODWORD(v7) = objc_msgSend(v8, "isLandmarkPOI");

  if ((_DWORD)v7)
    v9 = 6071;
  else
    v9 = 1010;
  v10 = -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", v5);

  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", v9, v10, 0);
}

- (void)lookAroundPIPDataCoordinatorDidEndRotatingMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1004, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  -[LookAroundPIPAnalyticsController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 1001, -[LookAroundPIPAnalyticsController _targetForLookAroundPIPDataCoordinator:](self, "_targetForLookAroundPIPDataCoordinator:", a3), 0);
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  LookAroundPIPDataCoordinator **p_dataCoordinator;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  uint64_t v24;
  id v25;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v25 = a5;
  p_dataCoordinator = &self->_dataCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));

  v11 = objc_loadWeakRetained((id *)p_dataCoordinator);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lookAroundView"));

  objc_msgSend(v10, "centerCoordinate");
  v15 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "camera"));
  objc_msgSend(v16, "heading");
  v18 = v17;
  objc_msgSend(v10, "_zoomLevel");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "visiblePlaceMUIDs"));
  v22 = objc_msgSend(v21, "count");
  if ((objc_msgSend(v12, "showsRoadLabels") & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(v12, "showsPointLabels");
  LOBYTE(v24) = v23;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v6, v5, v25, v15, v18, v22, v20, v24);

}

- (int)_targetForLookAroundPIPDataCoordinator:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapView"));
  v4 = (unint64_t)objc_msgSend(v3, "_lookAroundAvailability");

  if (v4 > 2)
    return 0;
  else
    return dword_100E3EA44[v4];
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  return (LookAroundPIPDataCoordinator *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCoordinator);
}

@end
