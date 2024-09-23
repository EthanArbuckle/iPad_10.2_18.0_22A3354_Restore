@implementation TransitDirectionsListClusteredVehicleItem

- (TransitDirectionsListClusteredVehicleItem)initWithClusteredRouteSegment:(id)a3
{
  id v5;
  TransitDirectionsListClusteredVehicleItem *v6;
  TransitDirectionsListClusteredVehicleItem *v7;
  TransitDirectionsListClusteredVehicleItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsListClusteredVehicleItem;
  v6 = -[TransitDirectionsListItem initWithInstructions:](&v10, "initWithInstructions:", 0);
  v7 = v6;
  if (v6)
  {
    -[TransitDirectionsListItem setType:](v6, "setType:", 4);
    objc_storeStrong((id *)&v7->_clusteredSegment, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOComposedTransitTripRouteSegment)clusteredSegment
{
  return self->_clusteredSegment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteredSegment, 0);
}

@end
