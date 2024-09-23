@implementation GEOComposedTransitTripRouteSegment

- (NSArray)alternateRouteItemsForTransitInfoLabel
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedTransitTripRouteSegment clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:](self, "clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:", 1));
  v3 = sub_10039DCD4(v2, &stru_1011BEE80);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Stepping_Transit_Other_Options"), CFSTR("localized string not found"), 0));
    objc_msgSend(v5, "insertObject:atIndex:", v7, 0);

  }
  v8 = objc_msgSend(v5, "copy");

  return (NSArray *)v8;
}

- (NSArray)clusteredRouteVehicleInfoItems
{
  return (NSArray *)-[GEOComposedTransitTripRouteSegment clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:](self, "clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:", 0);
}

- (id)clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  char *v6;
  TransitClusteredVehicleInfoItem *v7;
  id v8;

  v3 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[GEOComposedTransitTripRouteSegment rideOptionsCount](self, "rideOptionsCount"));
  if (-[GEOComposedTransitTripRouteSegment rideOptionsCount](self, "rideOptionsCount"))
  {
    v6 = 0;
    do
    {
      if (!v3 || v6 != -[GEOComposedTransitTripRouteSegment selectedRideOptionIndex](self, "selectedRideOptionIndex"))
      {
        v7 = -[TransitClusteredVehicleInfoItem initWithSegment:rideOptionIndex:]([TransitClusteredVehicleInfoItem alloc], "initWithSegment:rideOptionIndex:", self, v6);
        objc_msgSend(v5, "addObject:", v7);

      }
      ++v6;
    }
    while (v6 < -[GEOComposedTransitTripRouteSegment rideOptionsCount](self, "rideOptionsCount"));
  }
  v8 = objc_msgSend(v5, "copy");

  return v8;
}

@end
