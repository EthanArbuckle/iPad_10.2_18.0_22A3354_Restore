@implementation MKLocalSearchCompletion

- (MKMapItem)w_mapItem
{
  return (MKMapItem *)-[MKLocalSearchCompletion mapItem](self, "mapItem");
}

- (NSString)w_calloutTitle
{
  return (NSString *)-[MKLocalSearchCompletion calloutTitle](self, "calloutTitle");
}

- (BOOL)w_getCoordinate:(CLLocationCoordinate2D *)a3
{
  return -[MKLocalSearchCompletion getCoordinate:](self, "getCoordinate:", a3);
}

@end
