@implementation MapsAppTestETAPin

- (unint64_t)defaultMapType
{
  return 0;
}

- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v5, "pptTestCreateCustomSearchResultForDroppedPinAtPoint:animated:", 1, latitude, longitude);

}

@end
