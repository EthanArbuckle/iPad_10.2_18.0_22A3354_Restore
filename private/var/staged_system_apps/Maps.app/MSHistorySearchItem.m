@implementation MSHistorySearchItem

- (NSString)locationDisplayString
{
  return (NSString *)-[MSHistorySearchItem locationDisplay](self, "locationDisplay");
}

- (GEOMapRegion)mapRegion
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)GEOMapRegion);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistorySearchItem geoMapRegion](self, "geoMapRegion"));
  v5 = objc_msgSend(v3, "initWithData:", v4);

  return (GEOMapRegion *)v5;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a3)
    (*((void (**)(id, MSHistorySearchItem *))a3 + 2))(a3, self);
}

@end
