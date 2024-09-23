@implementation RideBookingRequestRideStatus

- (UIImage)cardIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconImage"));

  return (UIImage *)v3;
}

- (NSString)cardTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSString)cardSubtitle
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (-[RideBookingRequestRideStatus loadingRequest](self, "loadingRequest"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "detailedDescription"));

    return (NSString *)v4;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passengerChoices"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
          v15 = objc_msgSend(v13, "unsignedIntegerValue");
          if (v15 <= objc_msgSend(v14, "numberOfPassengers"))
            v16 = objc_msgSend(v14, "numberOfPassengers");
          else
            v16 = objc_msgSend(v13, "unsignedIntegerValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));

          v12 = (char *)v12 + 1;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus etaMinutesAtStartWaypoint](self, "etaMinutesAtStartWaypoint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingETA:partySize:](NSString, "_maps_ridesharingETA:partySize:", v17, v10));

    return (NSString *)v18;
  }
}

- (NSString)cardFormattedPriceRange
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "priceRange"));

  return (NSString *)v3;
}

- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "specialPricingBadge"));

  return (RidesharingSpecialPricingBadge *)v3;
}

- (NSString)openInAppCommandTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Open in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

  return (NSString *)v7;
}

- (NSArray)cardFareLineItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intentsRideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingFareLineItem _fareItemsFromRideOption:](RidesharingFareLineItem, "_fareItemsFromRideOption:", v3));

  return (NSArray *)v4;
}

- (NSString)disclaimerMessage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intentsRideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "disclaimerMessage"));

  return (NSString *)v4;
}

- (NSString)appleDisclaimer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Route, fares, and waits are estimates and may vary due to traffic, weather, or other factors."), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)requestCommandTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Request %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

  return (NSString *)v7;
}

- (NSString)expirationAlertTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[ridesharing] expiration alert title"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](self, "rideOption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v6));

  return (NSString *)v7;
}

- (NSString)expirationAlertMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[ridesharing] expiration alert message"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)paymentSelectionTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SavedPaymentMethod"), CFSTR("localized string not found"), 0));

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = objc_msgSend(v5, "initWithFormat:", v4, v7);

  return (NSString *)v8;
}

+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  id v5;
  RideBookingRequestRideStatus *v6;

  v5 = a3;
  v6 = objc_opt_new(RideBookingRequestRideStatus);
  -[RideBookingRequestRideStatus setApplication:](v6, "setApplication:", v5);

  -[RideBookingRequestRideStatus setRequestRideStatusError:](v6, "setRequestRideStatusError:", a4);
  return v6;
}

+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 rideOption:(id)a4 startingWaypointCoordinate:(CLLocationCoordinate2D)a5 origin:(id)a6 destination:(id)a7 loadingRequestRideStatus:(BOOL)a8 etaMinutesAtStartWaypoint:(id)a9
{
  _BOOL8 v9;
  double longitude;
  double latitude;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RideBookingRequestRideStatus *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v9 = a8;
  longitude = a5.longitude;
  latitude = a5.latitude;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  v21 = objc_opt_new(RideBookingRequestRideStatus);
  -[RideBookingRequestRideStatus setApplication:](v21, "setApplication:", v20);

  -[RideBookingRequestRideStatus setStartWaypointCoordinate:](v21, "setStartWaypointCoordinate:", latitude, longitude);
  -[RideBookingRequestRideStatus setOrigin:](v21, "setOrigin:", v18);

  -[RideBookingRequestRideStatus setDestination:](v21, "setDestination:", v17);
  -[RideBookingRequestRideStatus setRideOption:](v21, "setRideOption:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "passengerChoices"));

  -[RideBookingRequestRideStatus setRequiresPassengerSelection:](v21, "setRequiresPassengerSelection:", (unint64_t)objc_msgSend(v22, "count") > 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](v21, "rideOption"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "paymentMethods"));
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideStatus rideOption](v21, "rideOption"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "paymentMethods"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
    -[RideBookingRequestRideStatus setPaymentMethod:](v21, "setPaymentMethod:", v28);

  }
  -[RideBookingRequestRideStatus setLoadingRequest:](v21, "setLoadingRequest:", v9);
  v29 = objc_msgSend(v16, "copy");

  -[RideBookingRequestRideStatus setEtaMinutesAtStartWaypoint:](v21, "setEtaMinutesAtStartWaypoint:", v29);
  return v21;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RideOption: %@\nOrigin: %@\nDestination: %@\nError: %lu"), self->_rideOption, self->_origin, self->_destination, self->_requestRideStatusError);
}

- (CLLocationCoordinate2D)startWaypointCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_startWaypointCoordinate.latitude;
  longitude = self->_startWaypointCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setStartWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  self->_startWaypointCoordinate = a3;
}

- (CLPlacemark)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (CLPlacemark)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (RideBookingApplication)application
{
  return (RideBookingApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (void)setApplication:(id)a3
{
  objc_storeWeak((id *)&self->_application, a3);
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setRideOption:(id)a3
{
  objc_storeStrong((id *)&self->_rideOption, a3);
}

- (RideBookingPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (unint64_t)requestRideStatusError
{
  return self->_requestRideStatusError;
}

- (void)setRequestRideStatusError:(unint64_t)a3
{
  self->_requestRideStatusError = a3;
}

- (BOOL)loadingRequest
{
  return self->_loadingRequest;
}

- (void)setLoadingRequest:(BOOL)a3
{
  self->_loadingRequest = a3;
}

- (BOOL)requiresPassengerSelection
{
  return self->_requiresPassengerSelection;
}

- (void)setRequiresPassengerSelection:(BOOL)a3
{
  self->_requiresPassengerSelection = a3;
}

- (BOOL)requestExpired
{
  return self->_requestExpired;
}

- (void)setRequestExpired:(BOOL)a3
{
  self->_requestExpired = a3;
}

- (NSNumber)etaMinutesAtStartWaypoint
{
  return self->_etaMinutesAtStartWaypoint;
}

- (void)setEtaMinutesAtStartWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_etaMinutesAtStartWaypoint, a3);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_etaMinutesAtStartWaypoint, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
