@implementation HomeAnalyticsHelpers

+ (void)captureDisplayActionForSuggestionsEntry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "type") == (id)9)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsRideBookingRideIDKey")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v3, v4));
    objc_msgSend(v5, "setViewedInProactiveTray:", 1);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "type") == (id)8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MKMapItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v6, "_muid"), 1));

    objc_msgSend(v3, "setViewedInProactiveTray:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MKMapItem"));
    objc_msgSend(v3, "setMuid:", objc_msgSend(v7, "_muid"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MKMapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_restaurantLink_firstProviderIdentifier"));
    objc_msgSend(v3, "setAppID:", v5);
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "type") == (id)20)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2108, 8, 0);
  }
  else
  {
    if (objc_msgSend(v9, "type") == (id)21)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2138, 8, 0);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 339, 8, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "type") != (id)11)
      goto LABEL_7;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:](SearchFieldItem, "searchFieldItemsForRouteInSuggestionsEntry:", v9));
    if ((unint64_t)objc_msgSend(v3, "count") <= 1)
      v8 = 70;
    else
      v8 = 71;
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, v8, 0);
  }
LABEL_6:

LABEL_7:
}

@end
