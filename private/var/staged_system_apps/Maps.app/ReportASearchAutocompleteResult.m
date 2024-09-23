@implementation ReportASearchAutocompleteResult

+ (id)identifier
{
  return CFSTR("ReportASearchAutocompleteResult");
}

- (ReportASearchAutocompleteResult)initWithTitle:(id)a3
{
  id v5;
  ReportASearchAutocompleteResult *v6;
  ReportASearchAutocompleteResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ReportASearchAutocompleteResult;
  v6 = -[ReportASearchAutocompleteResult init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userVisibleTitle, a3);

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = kCLLocationCoordinate2DInvalid.latitude;
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (int64_t)source
{
  return 7;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEORPPlaceInfo)placeInfo
{
  return self->_placeInfo;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (NSString)userVisibleTitle
{
  return self->_userVisibleTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleTitle, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
