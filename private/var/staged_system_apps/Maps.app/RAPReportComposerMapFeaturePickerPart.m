@implementation RAPReportComposerMapFeaturePickerPart

- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  RAPReportComposerMapPickerSection *v13;
  RAPReportComposerMapFeaturePickerPart *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[RAPReportComposerMapPickerSection initWithFeatureKind:camera:delegate:markerViewAttributes:]([RAPReportComposerMapPickerSection alloc], "initWithFeatureKind:camera:delegate:markerViewAttributes:", a3, v12, v11, v10);

  v14 = -[RAPReportComposerMapFeaturePickerPart initWithMapPickerSection:](self, "initWithMapPickerSection:", v13);
  return v14;
}

- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  double longitude;
  double latitude;
  id v11;
  id v12;
  RAPReportComposerMapPickerSection *v13;
  RAPReportComposerMapFeaturePickerPart *v14;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a6;
  v12 = a5;
  v13 = -[RAPReportComposerMapPickerSection initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:]([RAPReportComposerMapPickerSection alloc], "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", a3, v12, v11, latitude, longitude);

  v14 = -[RAPReportComposerMapFeaturePickerPart initWithMapPickerSection:](self, "initWithMapPickerSection:", v13);
  return v14;
}

- (RAPReportComposerMapFeaturePickerPart)initWithMapPickerSection:(id)a3
{
  id v5;
  void *v6;
  RAPReportComposerMapFeaturePickerPart *v7;
  objc_super v9;
  id v10;

  v5 = a3;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerMapFeaturePickerPart;
  v7 = -[RAPTablePart initWithSections:](&v9, "initWithSections:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_mapCoordinatePickerSection, a3);
    -[RAPTablePartSection setHeaderTitle:](v7->_mapCoordinatePickerSection, "setHeaderTitle:", CFSTR("Test"));
  }

  return v7;
}

- (void)updateCoordinate:(CLLocationCoordinate2D)a3
{
  -[RAPReportComposerMapPickerSection updateCoordinate:](self->_mapCoordinatePickerSection, "updateCoordinate:", a3.latitude, a3.longitude);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapCoordinatePickerSection, 0);
}

@end
