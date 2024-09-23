@implementation RAPInlineMapViewModel

- (id)initForPickingFeatureOfKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 markerViewAttributes:(id)a5 accessPointsEnabled:(BOOL)a6 delegate:(id)a7
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v13;
  id v14;
  RAPInlineMapViewModel *v15;
  RAPInlineMapViewModel *v16;
  RAPMarkerViewAttributes *v17;
  RAPMarkerViewAttributes *markerViewAttributes;
  objc_super v20;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v13 = a5;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RAPInlineMapViewModel;
  v15 = -[RAPInlineMapViewModel init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_kind = a3;
    v16->_selectedViewMode = 0;
    v16->_originalCoordinate.latitude = latitude;
    v16->_originalCoordinate.longitude = longitude;
    v16->_selectedCoordinate.latitude = latitude;
    v16->_selectedCoordinate.longitude = longitude;
    v17 = (RAPMarkerViewAttributes *)objc_msgSend(v13, "copy");
    markerViewAttributes = v16->_markerViewAttributes;
    v16->_markerViewAttributes = v17;

    v16->_accessPointsEnabled = a6;
    -[RAPInlineMapViewModel _initMapView](v16, "_initMapView");
  }

  return v16;
}

- (void)setMapView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mapView, obj);
    -[RAPInlineMapViewModel _initMapView](self, "_initMapView");
    v5 = obj;
  }

}

- (void)_initMapView
{
  MKMapView **p_mapView;
  id WeakRetained;
  double latitude;
  double longitude;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  _BOOL8 v17;
  id v18;
  _BOOL8 v19;
  id v20;
  _BOOL8 v21;
  id v22;
  _BOOL8 v23;
  id v24;
  _BOOL8 v25;
  id v26;
  int64_t kind;
  id v28;
  id v29;
  id v30;
  void *v31;
  MKPointAnnotation *v32;
  MKPointAnnotation *centerPointAnnotation;
  id v34;

  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained)
  {
    latitude = self->_selectedCoordinate.latitude;
    longitude = self->_selectedCoordinate.longitude;
    v7 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v7, "setCenterCoordinate:", latitude, longitude);

    v8 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v8, "setDelegate:", self);

    v9 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v9, "setShowsUserLocation:", 0);

    v10 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v10, "setShowsAttribution:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKPointOfInterestFilter filterIncludingAllCategories](MKPointOfInterestFilter, "filterIncludingAllCategories"));
    v12 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v12, "setPointOfInterestFilter:", v11);

    v13 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v13, "_setShowsVenues:", 1);

    v14 = self->_selectedViewMode - 1;
    if (v14 > 6)
      v15 = 0;
    else
      v15 = qword_100E3CE60[v14];
    v16 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v16, "setMapType:", v15);

    v17 = -[RAPInlineMapViewModel allowsEditing](self, "allowsEditing");
    v18 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v18, "setZoomEnabled:", v17);

    v19 = -[RAPInlineMapViewModel allowsEditing](self, "allowsEditing");
    v20 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v20, "setScrollEnabled:", v19);

    v21 = -[RAPInlineMapViewModel allowsEditing](self, "allowsEditing");
    v22 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v22, "setPitchEnabled:", v21);

    v23 = -[RAPInlineMapViewModel allowsEditing](self, "allowsEditing");
    v24 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v24, "setRotateEnabled:", v23);

    v25 = -[RAPInlineMapViewModel allowsEditing](self, "allowsEditing");
    v26 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v26, "setUserInteractionEnabled:", v25);

    kind = self->_kind;
    if (kind)
    {
      if (kind != 1)
        goto LABEL_10;
      v28 = (id)objc_claimAutoreleasedReturnValue(+[MKPointOfInterestFilter filterIncludingAllCategories](MKPointOfInterestFilter, "filterIncludingAllCategories"));
      v29 = objc_loadWeakRetained((id *)p_mapView);
      objc_msgSend(v29, "setPointOfInterestFilter:", v28);

    }
    else
    {
      v28 = objc_loadWeakRetained((id *)p_mapView);
      objc_msgSend(v28, "_setCanSelectAllLabels:", 1);
    }

LABEL_10:
    if (CLLocationCoordinate2DIsValid(self->_selectedCoordinate))
    {
      v30 = objc_alloc((Class)MKPointAnnotation);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMarkerViewAttributes title](self->_markerViewAttributes, "title"));
      v32 = (MKPointAnnotation *)objc_msgSend(v30, "initWithCoordinate:title:subtitle:", v31, 0, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
      centerPointAnnotation = self->_centerPointAnnotation;
      self->_centerPointAnnotation = v32;

      v34 = objc_loadWeakRetained((id *)p_mapView);
      objc_msgSend(v34, "addAnnotation:", self->_centerPointAnnotation);

    }
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4;
  void *v6;
  double v7;

  if (self->_centerPointAnnotation == a4)
  {
    v4 = objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", self->_centerPointAnnotation, CFSTR("CenterPointAnnotationView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMarkerViewAttributes styleAttributes](self->_markerViewAttributes, "styleAttributes"));
    objc_msgSend(v4, "_setStyleAttributes:", v6);

    objc_msgSend(v4, "setSelected:", 1);
    LODWORD(v7) = 1148846080;
    objc_msgSend(v4, "setDisplayPriority:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)instructionalText
{
  void *v3;
  id v4;
  int64_t kind;
  void *v6;
  const __CFString *v7;
  _BOOL4 accessPointsEnabled;
  __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  kind = self->_kind;
  switch(kind)
  {
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v4 == (id)5)
        v7 = CFSTR("Click map to edit entrance. [Report an Issue]");
      else
        v7 = CFSTR("Tap map to edit entrance. [Report an Issue]");
      goto LABEL_18;
    case 1:
      accessPointsEnabled = self->_accessPointsEnabled;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (accessPointsEnabled)
      {
        if (v4 == (id)5)
          v7 = CFSTR("Click map to edit location and entrances [Report an Issue]");
        else
          v7 = CFSTR("Tap map to edit location and entrances [Report an Issue]");
      }
      else if (v4 == (id)5)
      {
        v7 = CFSTR("Click map to edit location [Report an Issue]");
      }
      else
      {
        v7 = CFSTR("Tap map to edit location [Report an Issue]");
      }
      goto LABEL_18;
    case 0:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v4 == (id)5)
        v7 = CFSTR("Click map to select a label [Report an Issue]");
      else
        v7 = CFSTR("Tap map to select a label [Report an Issue]");
LABEL_18:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      return (NSString *)v9;
  }
  v9 = &stru_1011EB268;
  return (NSString *)v9;
}

- (void)updateMapPickingKind:(int64_t)a3
{
  void *v4;
  id WeakRetained;
  void (**viewAttributeObserver)(id, RAPInlineMapViewModel *);

  if (self->_kind != a3)
  {
    self->_kind = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInlineMapViewModel instructionalText](self, "instructionalText"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "setAccessibilityLabel:", v4);

    viewAttributeObserver = (void (**)(id, RAPInlineMapViewModel *))self->_viewAttributeObserver;
    if (viewAttributeObserver)
      viewAttributeObserver[2](viewAttributeObserver, self);
  }
}

- (void)updateCenterCoordinate:(CLLocationCoordinate2D)a3
{
  MKMapView **p_mapView;
  int64_t kind;
  id WeakRetained;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  VKLabelMarker *v14;
  VKLabelMarker *selectedLabelMarker;
  id v16;
  id v17;

  if (a3.longitude >= -180.0 && a3.longitude <= 180.0 && a3.latitude >= -90.0 && a3.latitude <= 90.0)
  {
    self->_selectedCoordinate = a3;
    p_mapView = &self->_mapView;
    kind = self->_kind;
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    v7 = WeakRetained;
    if (!kind)
    {
      v8 = WeakRetained;
      objc_msgSend(v8, "convertCoordinate:toPointToView:", v8, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
      v10 = v9;
      v12 = v11;

      v13 = objc_loadWeakRetained((id *)p_mapView);
      v14 = (VKLabelMarker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_labelMarkerAtPoint:", v10, v12));
      selectedLabelMarker = self->_selectedLabelMarker;
      self->_selectedLabelMarker = v14;

      v7 = objc_loadWeakRetained((id *)p_mapView);
    }
    objc_msgSend(v7, "setCenterCoordinate:animated:", 0, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);

    v16 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v16, "removeAnnotation:", self->_centerPointAnnotation);

    -[MKPointAnnotation setCoordinate:](self->_centerPointAnnotation, "setCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
    v17 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v17, "addAnnotation:", self->_centerPointAnnotation);

  }
}

- (BOOL)allowsEditing
{
  return (self->_kind < 9uLL) & (0x1F4u >> self->_kind);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  CLLocationDegrees v5;
  CLLocationDegrees v6;

  objc_msgSend(a3, "centerCoordinate");
  self->_selectedCoordinate.latitude = v5;
  self->_selectedCoordinate.longitude = v6;
}

- (void)setSelectedViewMode:(int64_t)a3
{
  id WeakRetained;
  unint64_t v5;
  uint64_t v6;
  id v7;

  if (self->_selectedViewMode != a3)
  {
    self->_selectedViewMode = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    v5 = self->_selectedViewMode - 1;
    if (v5 > 6)
      v6 = 0;
    else
      v6 = qword_100E3CE60[v5];
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setMapType:", v6);

  }
}

- (int64_t)kind
{
  return self->_kind;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (int64_t)selectedViewMode
{
  return self->_selectedViewMode;
}

- (id)viewAttributeObserver
{
  return self->_viewAttributeObserver;
}

- (void)setViewAttributeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_originalCoordinate.latitude;
  longitude = self->_originalCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)accessPointsEnabled
{
  return self->_accessPointsEnabled;
}

- (void)setAccessPointsEnabled:(BOOL)a3
{
  self->_accessPointsEnabled = a3;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- (void)setSelectedLabelMarker:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLabelMarker, a3);
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_selectedCoordinate.latitude;
  longitude = self->_selectedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (RAPInlineMapViewModelDelegate)delegate
{
  return (RAPInlineMapViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong(&self->_viewAttributeObserver, 0);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_centerPointAnnotation, 0);
  objc_storeStrong((id *)&self->_markerViewAttributes, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
