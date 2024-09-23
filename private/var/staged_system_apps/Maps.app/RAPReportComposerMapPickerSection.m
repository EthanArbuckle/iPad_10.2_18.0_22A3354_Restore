@implementation RAPReportComposerMapPickerSection

- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  id v11;
  id v12;
  id v13;
  RAPReportComposerMapPickerSection *v14;

  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v11, "centerCoordinate");
  v14 = -[RAPReportComposerMapPickerSection initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:](self, "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", a3, v13, v12);

  if (v14)
    objc_storeStrong((id *)&v14->_camera, a4);

  return v14;
}

- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  double longitude;
  double latitude;
  id v11;
  RAPMarkerViewAttributes *v12;
  RAPReportComposerMapPickerSection *v13;
  RAPMarkerViewAttributes *v14;
  void *v15;
  RAPInlineMapViewModel *v16;
  RAPInlineMapViewModel *mapViewModel;
  objc_super v19;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a5;
  v12 = (RAPMarkerViewAttributes *)a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPReportComposerMapPickerSection;
  v13 = -[RAPTablePartSection init](&v19, "init");
  if (v13)
  {
    if (!v12)
    {
      v14 = [RAPMarkerViewAttributes alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addressMarkerStyleAttributes](GEOFeatureStyleAttributes, "addressMarkerStyleAttributes"));
      v12 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:](v14, "initWithTitle:styleAttributes:", 0, v15);

    }
    v16 = -[RAPInlineMapViewModel initForPickingFeatureOfKind:centerCoordinate:markerViewAttributes:accessPointsEnabled:delegate:]([RAPInlineMapViewModel alloc], "initForPickingFeatureOfKind:centerCoordinate:markerViewAttributes:accessPointsEnabled:delegate:", a3, v12, 0, v11, latitude, longitude);
    mapViewModel = v13->_mapViewModel;
    v13->_mapViewModel = v16;

    v13->_kind = a3;
  }

  return v13;
}

- (void)updateCoordinate:(CLLocationCoordinate2D)a3
{
  -[RAPInlineMapViewModel updateCenterCoordinate:](self->_mapViewModel, "updateCenterCoordinate:", a3.latitude, a3.longitude);
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  RAPMapViewTableViewCell *mapViewCell;
  RAPMapViewTableViewCell *v5;
  RAPMapViewTableViewCell *v6;

  mapViewCell = self->_mapViewCell;
  if (!mapViewCell)
  {
    v5 = -[RAPMapViewTableViewCell initWithStyle:reuseIdentifier:viewModel:]([RAPMapViewTableViewCell alloc], "initWithStyle:reuseIdentifier:viewModel:", 0, CFSTR("MapViewTableViewCell"), self->_mapViewModel);
    v6 = self->_mapViewCell;
    self->_mapViewCell = v5;

    mapViewCell = self->_mapViewCell;
  }
  return mapViewCell;
}

- (id)headerTitle
{
  int64_t kind;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  kind = self->_kind;
  if (kind == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Entrance [Report a Problem]");
  }
  else if (kind)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Location [Add Location Section]");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Label [Report a Problem]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPInlineMapViewModel delegate](self->_mapViewModel, "delegate", a3, a4));
  objc_msgSend(v5, "inlineMapViewModelRequestsDisplayPowerActions:", self->_mapViewModel);

}

- (void)registerReuseIdentifiersForCells
{
  -[RAPTablePartSection registerClass:forNamespacedReuseIdentifier:](self, "registerClass:forNamespacedReuseIdentifier:", objc_opt_class(RAPMapViewTableViewCell), CFSTR("MapViewTableViewCell"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);
  objc_storeStrong((id *)&self->_mapViewModel, 0);
}

@end
