@implementation TransitClusteredVehicleInfoItem

- (TransitClusteredVehicleInfoItem)initWithSegment:(id)a3 rideOptionIndex:(unint64_t)a4
{
  GEOComposedTransitTripRouteSegment *v6;
  TransitClusteredVehicleInfoItem *v7;
  GEOComposedTransitTripRouteSegment *segment;
  objc_super v10;

  v6 = (GEOComposedTransitTripRouteSegment *)a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitClusteredVehicleInfoItem;
  v7 = -[TransitClusteredVehicleInfoItem init](&v10, "init");
  segment = v7->_segment;
  v7->_segment = v6;
  v7->_rideOption = a4;

  return v7;
}

- (NSArray)actionSheetArtworks
{
  return (NSArray *)-[GEOComposedTransitTripRouteSegment actionSheetArtworkForRideOption:](self->_segment, "actionSheetArtworkForRideOption:", self->_rideOption);
}

- (NSArray)routeDetailArtworks
{
  return (NSArray *)-[GEOComposedTransitTripRouteSegment routeDetailsPrimaryArtworkForRideOption:](self->_segment, "routeDetailsPrimaryArtworkForRideOption:", self->_rideOption);
}

- (NSString)actionSheetTitle
{
  void *v3;
  unsigned int v4;
  GEOComposedTransitTripRouteSegment *segment;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedTransitTripRouteSegment composedRoute](self->_segment, "composedRoute"));
  v4 = objc_msgSend(v3, "supportsRideClusters");

  segment = self->_segment;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedTransitTripRouteSegment actionSheetDescriptionForRideOption:](segment, "actionSheetDescriptionForRideOption:", self->_rideOption));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedTransitTripRouteSegment boardStep](segment, "boardStep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitLine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  }
  return (NSString *)v6;
}

- (GEOComposedTransitTripRouteSegment)segment
{
  return self->_segment;
}

- (unint64_t)rideOptionIndex
{
  return self->_rideOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
}

@end
