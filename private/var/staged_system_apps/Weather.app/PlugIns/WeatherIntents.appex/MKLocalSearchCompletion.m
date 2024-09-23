@implementation MKLocalSearchCompletion

- (MKMapItem)wi_mapItem
{
  return (MKMapItem *)-[MKLocalSearchCompletion mapItem](self, "mapItem");
}

- (NSString)wi_calloutTitle
{
  return (NSString *)-[MKLocalSearchCompletion calloutTitle](self, "calloutTitle");
}

- (BOOL)wi_getCoordinate:(CLLocationCoordinate2D *)a3
{
  return -[MKLocalSearchCompletion getCoordinate:](self, "getCoordinate:", a3);
}

@end
