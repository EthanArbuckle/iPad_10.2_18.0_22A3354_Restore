@implementation RestaurantReservationRequestController

- (RestaurantReservationRequestController)initWithFlowController:(id)a3 reservationRequester:(id)a4
{
  id v6;
  id v7;
  RestaurantReservationRequestController *v8;
  RestaurantReservationRequestController *v9;
  void *v10;
  void *v11;
  void *v12;
  ReservationAnalyticsCaptor *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  MapsSuggestionsAppGuardian *appGuardian;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RestaurantReservationRequestController;
  v8 = -[RestaurantReservationRequestController init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    -[RestaurantReservationRequestController setFlowViewController:](v8, "setFlowViewController:", v6);
    -[RestaurantReservationRequestController setReservationRequester:](v9, "setReservationRequester:", v7);
    objc_msgSend(v7, "setDelegate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    -[RestaurantReservationRequestController setMapItem:](v9, "setMapItem:", v10);

    -[RestaurantReservationRequestController configureHeaderForBranding:](v9, "configureHeaderForBranding:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](v9, "flowViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
    objc_msgSend(v12, "setDelegate:", v9);

    v13 = objc_opt_new(ReservationAnalyticsCaptor);
    -[RestaurantReservationRequestController setAnalyticsCaptor:](v9, "setAnalyticsCaptor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](v9, "mapItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](v9, "analyticsCaptor"));
    objc_msgSend(v15, "setMapItem:", v14);

    v16 = sub_100B3A5D4();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "oneAppGuardian"));
    appGuardian = v9->_appGuardian;
    v9->_appGuardian = (MapsSuggestionsAppGuardian *)v18;

    -[MapsSuggestionsAppGuardian registerAppTracker:](v9->_appGuardian, "registerAppTracker:", v9);
  }

  return v9;
}

- (void)present
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController activeReservation](self, "activeReservation"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v5, "_muid"), 1));
    objc_msgSend(v6, "setViewedDetailsFromPlacecard:", 1);

    -[RestaurantReservationRequestController pushSuccessScreen](self, "pushSuccessScreen");
  }
  else
  {
    -[RestaurantReservationRequestController kickoffRequests](self, "kickoffRequests");
    -[RestaurantReservationRequestController pushRestaurantReservationController](self, "pushRestaurantReservationController");
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession", a3));
  objc_msgSend(v4, "endSession");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v6, "_muid"), 0));
  objc_msgSend(v5, "endSession");

}

- (void)setupAnalyticsBookingSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v2, "setCurrentState:", 2);

}

- (id)setupAnalyticsBookedSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v4, "_muid"), 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "extension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v5, "setAppID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  objc_msgSend(v5, "setMuid:", objc_msgSend(v10, "_muid"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extension"));
  objc_msgSend(v5, "setHasAppsInstalled:", v12 != 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "extension"));
  objc_msgSend(v5, "setHasAppsEnabled:", objc_msgSend(v14, "isEnabled"));

  return v5;
}

- (void)pushRestaurantReservationController
{
  void *v3;
  RestaurantReservationTableViewController *v4;
  void *v5;
  void *v6;
  RestaurantReservationTableViewController *v7;
  void *v8;
  void *v9;
  id v10;

  -[RestaurantReservationRequestController setupAnalyticsBookingSession](self, "setupAnalyticsBookingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));

  if (!v3)
  {
    v4 = [RestaurantReservationTableViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](self, "analyticsCaptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
    v7 = -[RestaurantReservationTableViewController initWithAnalyticsCaptor:analyticsBookingSession:](v4, "initWithAnalyticsCaptor:analyticsBookingSession:", v5, v6);
    -[RestaurantReservationRequestController setReservationTableViewController:](self, "setReservationTableViewController:", v7);

  }
  -[RestaurantReservationRequestController updateReservationTableViewController](self, "updateReservationTableViewController");
  -[RestaurantReservationRequestController configureHeaderForBranding:](self, "configureHeaderForBranding:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v8, "setCurrentView:", 5);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v10, "pushViewController:", v9);

}

- (id)defaultDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "availableBookingsRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_preferredBookingDateWithTimeZone:", v6));

  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    if (objc_msgSend(v9, "reservationDefaultsRequestPending"))
    {

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reservationDefaultsResponse"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reservationDefaultsResponse"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultBookingDate"));
LABEL_8:
        v8 = (id)v14;

        goto LABEL_9;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 124, v15));

    objc_msgSend(v13, "setHour:", (char *)objc_msgSend(v13, "hour") + 1);
    objc_msgSend(v13, "setMinute:", 0);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromComponents:", v13));
    goto LABEL_8;
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)defaultPartySize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "availableBookingsRequest"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "availableBookingsRequest"));
    v8 = objc_msgSend(v7, "partySize");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "availableBookingsRequest"));
      v11 = objc_msgSend(v10, "partySize");
      goto LABEL_10;
    }
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  if ((objc_msgSend(v9, "reservationDefaultsRequestPending") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reservationDefaultsResponse"));
    if (!v13)
    {
      v12 = 2;
      goto LABEL_11;
    }
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reservationDefaultsResponse"));
    v17 = objc_msgSend(v16, "defaultPartySize");

    if (!v17)
      return 2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reservationDefaultsResponse"));
    v11 = objc_msgSend(v10, "defaultPartySize");
LABEL_10:
    v12 = (unint64_t)v11;
LABEL_11:

    goto LABEL_12;
  }
  v12 = 2;
LABEL_12:

  return v12;
}

- (INRestaurantReservationUserBooking)activeReservation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookReservationResponse"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookReservationResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userBooking"));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userCurrentBookingResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userCurrentBookings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    if (objc_msgSend(v11, "_maps_shouldBeDisplayed"))
    {
      v6 = v11;
      v8 = v6;
    }
    else
    {
      v8 = 0;
      v6 = v11;
    }
  }

  return (INRestaurantReservationUserBooking *)v8;
}

- (id)appName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));

  return v4;
}

- (id)appIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_iconWithFormat:", 1));

  return v4;
}

- (id)defaultGuestDisplayPreferences
{
  id v2;

  v2 = objc_alloc_init((Class)INRestaurantGuestDisplayPreferences);
  objc_msgSend(v2, "setPhoneNumberFieldShouldBeDisplayed:", 1);
  objc_msgSend(v2, "setNameFieldShouldBeDisplayed:", 1);
  objc_msgSend(v2, "setEmailAddressFieldShouldBeDisplayed:", 1);
  return v2;
}

- (void)pushReservationRefinementController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  ReservationRequestRefinementViewController *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ReservationRequestRefinementViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reservationDefaultsResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minimumPartySize"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reservationDefaultsResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minimumPartySize"));
    v9 = (uint64_t)objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v9 = 1;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reservationDefaultsResponse"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "maximumPartySize"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reservationDefaultsResponse"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "maximumPartySize"));
    v16 = (uint64_t)objc_msgSend(v15, "unsignedIntegerValue");

  }
  else
  {
    v16 = 6;
  }

  v17 = [ReservationRequestRefinementViewController alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultDate](self, "defaultDate"));
  v19 = -[RestaurantReservationRequestController defaultPartySize](self, "defaultPartySize");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](self, "analyticsCaptor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  v24 = -[ReservationRequestRefinementViewController initWithDate:partySize:minimumPartySize:maximumPartySize:analyticsCaptor:timeZone:analyticsBookingSession:](v17, "initWithDate:partySize:minimumPartySize:maximumPartySize:analyticsCaptor:timeZone:analyticsBookingSession:", v18, v19, v9, v16, v20, v22, v23);
  -[RestaurantReservationRequestController setReservationRequestRefinementViewController:](self, "setReservationRequestRefinementViewController:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequestRefinementViewController](self, "reservationRequestRefinementViewController"));
  objc_msgSend(v25, "setRefinementDelegate:", self);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v26, "setCurrentView:", 3);

  v28 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequestRefinementViewController](self, "reservationRequestRefinementViewController"));
  objc_msgSend(v28, "pushViewController:", v27);

}

- (void)pushSuccessScreen
{
  id v3;
  RestaurantReservationConfirmationViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RestaurantReservationConfirmationViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = -[RestaurantReservationRequestController setupAnalyticsBookedSession](self, "setupAnalyticsBookedSession");
  v4 = [RestaurantReservationConfirmationViewController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController activeReservation](self, "activeReservation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController appName](self, "appName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](self, "analyticsCaptor"));
  v9 = -[RestaurantReservationConfirmationViewController initWithUserBooking:mapItem:appName:analyticsCaptor:](v4, "initWithUserBooking:mapItem:appName:analyticsCaptor:", v5, v6, v7, v8);
  -[RestaurantReservationRequestController setReservationSuccessViewController:](self, "setReservationSuccessViewController:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationSuccessViewController](self, "reservationSuccessViewController"));
  objc_msgSend(v10, "setReservationDelegate:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
  objc_msgSend(v12, "setDismissButtonType:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v13, "setCurrentView:", 7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v14, "setCurrentState:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationSuccessViewController](self, "reservationSuccessViewController"));
  objc_msgSend(v15, "pushViewController:", v16);

  -[RestaurantReservationRequestController configureHeaderForBranding:](self, "configureHeaderForBranding:", 1);
}

- (void)configureHeaderForBranding:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_iconWithFormat:", 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerView"));
  objc_msgSend(v9, "setIconImage:", v7);

  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "extension"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerView"));
    objc_msgSend(v14, "setTitleText:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headerView"));
    objc_msgSend(v16, "setDetailText:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headerView"));
    objc_msgSend(v18, "setDismissButtonType:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reservationDefaultsResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "providerImage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_identifier"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "extension"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10087E25C;
      v37[3] = &unk_1011BAA70;
      v37[4] = self;
      +[_MXExtensionManager imageForKey:extension:completion:](_MXExtensionManager, "imageForKey:extension:completion:", v22, v24, v37);

    }
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Book a Table"), CFSTR("localized string not found"), 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "headerView"));
    objc_msgSend(v28, "setTitleText:", v26);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("reservation_at_restaurant_key"), CFSTR("localized string not found"), 0));

    v30 = objc_alloc((Class)NSString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
    v33 = objc_msgSend(v30, "initWithFormat:", v36, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "headerView"));
    objc_msgSend(v35, "setDetailText:", v33);

  }
}

- (void)extensionTextInputViewControllerDidComplete:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v4, "setSpecialRequestText:", v5);

}

- (void)userInfoCellSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ReservationContactInfoViewController *v19;
  ReservationContactInfoViewController *v20;

  v19 = [ReservationContactInfoViewController alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "guest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nameComponents"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "guest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emailAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guestResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guestDisplayPreferences"));
  v9 = v8;
  if (!v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultGuestDisplayPreferences](self, "defaultGuestDisplayPreferences"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inferredContactRequirements"));
  v20 = -[ReservationContactInfoViewController initWithNameComponents:emailAddress:phoneNumber:guestDisplayPreferences:requirements:](v19, "initWithNameComponents:emailAddress:phoneNumber:guestDisplayPreferences:requirements:", v18, v17, v5, v9, v11);

  if (!v8)
  -[ReservationContactInfoViewController setContactDelegate:](v20, "setContactDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  objc_msgSend(v12, "pushViewController:", v20);

}

- (void)specialRequestCellSelected
{
  void *v3;
  void *v4;
  void *v5;
  ExtensionTextInputViewController *v6;
  void *v7;
  void *v8;
  ExtensionTextInputViewController *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("reservation_special_request_key"), CFSTR("localized string not found"), 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("reservation_special_request_placeholder_key"), CFSTR("localized string not found"), 0));

  v6 = [ExtensionTextInputViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "specialRequestText"));
  v9 = -[ExtensionTextInputViewController initWithTitle:placeholderText:text:](v6, "initWithTitle:placeholderText:text:", v11, v5, v8);

  -[ExtensionTextInputViewController setInputDelegate:](v9, "setInputDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  objc_msgSend(v10, "pushViewController:", v9);

}

- (void)headerCellSelected
{
  ExtensionLabelViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ExtensionLabelViewController *v9;

  v3 = [ExtensionLabelViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "restaurantDescriptionText"));
  v9 = -[ExtensionLabelViewController initWithTitle:advertisementText:](v3, "initWithTitle:advertisementText:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  objc_msgSend(v8, "pushViewController:", v9);

}

- (void)reservationContactInfoViewControllerDidSelectDone:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)INRestaurantGuest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nameComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAddress"));

  v10 = objc_msgSend(v5, "initWithNameComponents:phoneNumber:emailAddress:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v9, "setGuest:", v10);

  -[MapsSuggestionsAppGuardian unregisterAppTracker:](self->_appGuardian, "unregisterAppTracker:", self);
}

- (void)reservationRequestRefinementViewControllerDidRefine:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "partySize"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
    objc_msgSend(v5, "setDate:", v4);

    v6 = objc_msgSend(v9, "partySize");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
    objc_msgSend(v7, "setPartySize:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    -[RestaurantReservationRequestController requestAvailableBookingsWithDate:partySize:](self, "requestAvailableBookingsWithDate:partySize:", v8, objc_msgSend(v9, "partySize"));

  }
}

- (void)bookingSelectionViewController:(id)a3 didSelectBooking:(id)a4 offer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController setupAnalyticsBookedSession](self, "setupAnalyticsBookedSession"));
  objc_msgSend(v14, "setBookedUsingMaps:", 1);
  -[RestaurantReservationRequestController setSelectedBooking:](self, "setSelectedBooking:", v9);

  -[RestaurantReservationRequestController setContentLikelyChanged:](self, "setContentLikelyChanged:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController selectedBooking](self, "selectedBooking"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "specialRequestText"));

  -[RestaurantReservationRequestController confirmBooking:guest:selectedOffer:specialRequest:](self, "confirmBooking:guest:selectedOffer:specialRequest:", v11, v12, v8, v13);
}

- (void)bookingSelectionViewControllerDidUpdatePartySize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequestRefinementViewController](self, "reservationRequestRefinementViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultDate](self, "defaultDate"));
  -[RestaurantReservationRequestController requestAvailableBookingsWithDate:partySize:](self, "requestAvailableBookingsWithDate:partySize:", v6, objc_msgSend(v7, "partySize"));
  if (!v5)

}

- (void)bookingSelectionViewControllerDidSelectDateRefinement:(id)a3
{
  -[RestaurantReservationRequestController pushReservationRefinementController](self, "pushReservationRefinementController", a3);
}

- (void)bookingSelectionViewControllerDidSelectOpenInApp:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "availableBookingsUserActivity"));
  -[RestaurantReservationRequestController openAppWithActivity:](self, "openAppWithActivity:", v4);

}

- (void)restaurantReservationConfirmationViewControllerRequestStatusUpdateForUserBooking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userBooking"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookingIdentifier"));
  objc_msgSend(v7, "requestUserCurrentBookingWithReservationIdentifier:", v6);

}

- (void)restaurantReservationConfirmationViewControllerDidSelectEditReservation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v4, "_muid"), 1));
  objc_msgSend(v5, "setTappedChangeReservation:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookReservationUserActivity"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v9 = v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookReservationUserActivity"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userCurrentBookingUserActivity"));
  v11 = (id)v10;

  -[RestaurantReservationRequestController openAppWithActivity:](self, "openAppWithActivity:", v11);
}

- (void)openAppWithActivity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc((Class)LSApplicationRecord);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "extension"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_containingAppIdentifer"));
    v9 = objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "endSessionWithState:", 4);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10087EE60;
      v25[3] = &unk_1011ACF90;
      v25[4] = self;
      objc_msgSend(v12, "openUserActivity:withApplicationRecord:requireOptionKeyPromptUnlockDevice:completionHandler:", v4, v9, 0, v25);

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "extension"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_containingAppIdentifer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not find the LaunchServices app information for application '%@'"), v20));
      objc_msgSend(v11, "addErrorMessage:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "extension"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_containingAppIdentifer"));
      NSLog(CFSTR("Could not find the LaunchServices app information for application '%@'"), v24);

    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
    objc_msgSend(v13, "endSessionWithState:", 4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extension"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_containingAppIdentifer"));
    objc_msgSend(v14, "openApplicationWithBundleID:", v17);

    -[MapsSuggestionsAppGuardian registerAppTracker:](self->_appGuardian, "registerAppTracker:", self);
  }

}

- (void)kickoffRequests
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  if ((objc_msgSend(v3, "reservationDefaultsRequestPending") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reservationDefaultsResponse"));
    v4 = v6 == 0;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  if ((objc_msgSend(v7, "availableBookingsRequestPending") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reservationDefaultsResponse"));
    v8 = v10 != 0;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  if ((objc_msgSend(v11, "availableBookingsRequestPending") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "availableBookingsResponse"));
    v12 = v14 != 0;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  if ((objc_msgSend(v15, "guestRequestPending") & 1) != 0)
  {
LABEL_15:

    if (v4)
      goto LABEL_13;
    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "guestResponse"));

  if (!v17)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    objc_msgSend(v15, "requestGuest");
    goto LABEL_15;
  }
  if (v4)
  {
LABEL_13:
    v18 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    objc_msgSend(v18, "requestReservationDefaults");
LABEL_21:

    return;
  }
LABEL_16:
  if (v8)
  {
    if (v12)
    {
      -[RestaurantReservationRequestController handleRequestedTimeCompletion](self, "handleRequestedTimeCompletion");
      return;
    }
    v18 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultDate](self, "defaultDate"));
    -[RestaurantReservationRequestController requestAvailableBookingsWithDate:partySize:](self, "requestAvailableBookingsWithDate:partySize:", v18, -[RestaurantReservationRequestController defaultPartySize](self, "defaultPartySize"));
    goto LABEL_21;
  }
}

- (void)requesterReservationDefaultsRequestDidComplete:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10087F1A4;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)requester:(id)a3 reservationDefaultsRequestDidFailWithError:(id)a4
{
  void *v5;
  _QWORD v6[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3, a4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10087F274;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

}

- (void)requesterGuestRequestDidComplete:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10087F2F0;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)requester:(id)a3 guestRequestDidFailWithError:(id)a4
{
  void *v5;
  _QWORD v6[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3, a4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10087F36C;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

}

- (void)requestAvailableBookingsWithDate:(id)a3 partySize:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  objc_msgSend(v7, "requestAvailableBookingsForPreferredTime:partySize:", v6, a4);

  -[RestaurantReservationRequestController updateReservationTableViewController](self, "updateReservationTableViewController");
}

- (void)requesterAvailableBookingsRequestDidComplete:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10087F440;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)handleRequestedTimeCompletion
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "availableBookingsResponse"));
  v5 = +[RestaurantReservationErrorController shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:](RestaurantReservationErrorController, "shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:", objc_msgSend(v4, "code"));

  -[RestaurantReservationRequestController updateReservationTableViewController](self, "updateReservationTableViewController");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController errorController](self, "errorController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "availableBookingsResponse"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertControllerForAvailableBookingsResponse:error:", v8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "message"));
    objc_msgSend(v9, "addErrorMessage:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
    objc_msgSend(v11, "setCurrentState:", 5);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
    objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)requester:(id)a3 availableBookingsRequestDidFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10087F658;
  v11[3] = &unk_1011AD238;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

- (void)requesterBookRestaurantReservationRequestDidComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10087F7D8;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)requester:(id)a3 bookRestaurantReservationRequestDidFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10087FCA0;
  v11[3] = &unk_1011AD238;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

- (void)confirmBooking:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v14, "setCurrentView:", 6);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  objc_msgSend(v15, "bookRestaurantReservation:guest:selectedOffer:specialRequest:", v13, v12, v11, v10);

  -[RestaurantReservationRequestController updateReservationTableViewController](self, "updateReservationTableViewController");
}

- (void)updateReservationTableViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned __int8 v58;
  _BOOL8 v59;
  void *v60;
  id v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v5, "setRestaurantName:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v8, "setRestaurantTimeZone:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController appName](self, "appName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v10, "setAppName:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequestRefinementViewController](self, "reservationRequestRefinementViewController"));
  v13 = objc_msgSend(v12, "partySize");

  if (!v13)
    v13 = -[RestaurantReservationRequestController defaultPartySize](self, "defaultPartySize");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v14, "setPartySize:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequestRefinementViewController](self, "reservationRequestRefinementViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
  v17 = v16;
  if (!v16)
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultDate](self, "defaultDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v18, "setDate:", v17);

  if (!v16)
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "availableBookingsResponse"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedBookingAdvisementText"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v22, "setRestaurantAdvisementText:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "availableBookingsResponse"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedRestaurantDescriptionText"));
  if (objc_msgSend(v25, "length"))
  {

LABEL_10:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
    objc_msgSend(v28, "setUseTruncatedAdvisement:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "availableBookingsResponse"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedRestaurantDescriptionText"));
    objc_msgSend(v29, "setRestaurantDescriptionText:keepExisting:", v32, 1);

    goto LABEL_12;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v27 = objc_msgSend(v26, "availableBookingsRequestPending");

  if ((v27 & 1) != 0)
    goto LABEL_10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v33, "setUseTruncatedAdvisement:", 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_addressFormattedAsMultilineAddress"));
  objc_msgSend(v29, "setRestaurantDescriptionText:keepExisting:", v31, 1);
LABEL_12:

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "availableBookingsResponse"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "availableBookings"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v37, "setAvailableBookings:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "guest"));
  v40 = v39;
  if (!v39)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "guestResponse"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "guest"));
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v41, "setGuest:", v40);

  if (!v39)
  {

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "guestResponse"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "guestDisplayPreferences"));
  v45 = v44;
  if (!v44)
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController defaultGuestDisplayPreferences](self, "defaultGuestDisplayPreferences"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v46, "setGuestDisplayPreferences:", v45);

  if (!v44)
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "availableBookingsResponse"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "termsAndConditions"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v50, "setTermsAndConditions:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v52 = objc_msgSend(v51, "bookReservationRequestPending");
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v53, "setBookingPending:", v52);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v55 = (uint64_t)objc_msgSend(v54, "availableBookingsRequestPending");
  if ((v55 & 1) != 0)
  {
    v56 = 1;
  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v56 = (uint64_t)objc_msgSend(v53, "reservationDefaultsRequestPending");
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v57, "setBookingsLoading:", v56);

  if ((v55 & 1) == 0)
  v61 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
  v58 = objc_msgSend(v61, "guestRequestPending");
  if ((v58 & 1) != 0)
  {
    v59 = 1;
  }
  else
  {
    v55 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v55, "guestResponse"));
    v59 = v53 == 0;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationTableViewController](self, "reservationTableViewController"));
  objc_msgSend(v60, "setGuestLoading:", v59);

  if ((v58 & 1) == 0)
  {

  }
}

- (void)extensionFlowHeaderViewDidTapDismiss:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));
  v6 = objc_opt_class(RestaurantReservationConfirmationViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v8, "captureBookedCancel");
LABEL_5:

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController flowViewController](self, "flowViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
  v11 = objc_opt_class(RestaurantReservationTableViewController);
  v12 = objc_opt_isKindOfClass(v10, v11);

  if ((v12 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v8, "captureSelectTimeCancel");
    goto LABEL_5;
  }
LABEL_6:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController delegate](self, "delegate"));
  objc_msgSend(v13, "restaurantReservationRequestControllerDidComplete:contentRefresh:", self, -[RestaurantReservationRequestController contentLikelyChanged](self, "contentLikelyChanged"));

  -[MapsSuggestionsAppGuardian unregisterAppTracker:](self->_appGuardian, "unregisterAppTracker:", self);
}

- (RestaurantReservationErrorController)errorController
{
  RestaurantReservationErrorController *errorController;
  RestaurantReservationErrorController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RestaurantReservationErrorController *v10;
  RestaurantReservationErrorController *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  errorController = self->_errorController;
  if (!errorController)
  {
    objc_initWeak(&location, self);
    v4 = [RestaurantReservationErrorController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController reservationRequester](self, "reservationRequester"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extension"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequestController mapItem](self, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1008806C0;
    v15[3] = &unk_1011AD260;
    objc_copyWeak(&v16, &location);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100880718;
    v13[3] = &unk_1011D9C80;
    objc_copyWeak(&v14, &location);
    v10 = -[RestaurantReservationErrorController initWithAppName:restaurantName:cancelAction:activityAction:](v4, "initWithAppName:restaurantName:cancelAction:activityAction:", v7, v9, v15, v13);
    v11 = self->_errorController;
    self->_errorController = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    errorController = self->_errorController;
  }
  return errorController;
}

- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RestaurantReservationRequestController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10088083C;
  v7[3] = &unk_1011AC8B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self->_reservationRequester, "extension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v6, "containsString:", v4);

  if (v7
    && +[MapsSuggestionsAppGuardian protectionStatusForBundleID:](MapsSuggestionsAppGuardian, "protectionStatusForBundleID:", v4) == (id)3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008809F4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (ExtensionFlowViewController)flowViewController
{
  return (ExtensionFlowViewController *)objc_loadWeakRetained((id *)&self->_flowViewController);
}

- (void)setFlowViewController:(id)a3
{
  objc_storeWeak((id *)&self->_flowViewController, a3);
}

- (INGetRestaurantGuestIntentResponse)guestResponse
{
  return self->_guestResponse;
}

- (void)setGuestResponse:(id)a3
{
  objc_storeStrong((id *)&self->_guestResponse, a3);
}

- (RestaurantReservationRequestControllerDelegate)delegate
{
  return (RestaurantReservationRequestControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, a3);
}

- (RestaurantReservationTableViewController)reservationTableViewController
{
  return self->_reservationTableViewController;
}

- (void)setReservationTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reservationTableViewController, a3);
}

- (ReservationRequestRefinementViewController)reservationRequestRefinementViewController
{
  return self->_reservationRequestRefinementViewController;
}

- (void)setReservationRequestRefinementViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reservationRequestRefinementViewController, a3);
}

- (RestaurantReservationConfirmationViewController)reservationSuccessViewController
{
  return self->_reservationSuccessViewController;
}

- (void)setReservationSuccessViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reservationSuccessViewController, a3);
}

- (RestaurantReservationRequester)reservationRequester
{
  return self->_reservationRequester;
}

- (void)setReservationRequester:(id)a3
{
  objc_storeStrong((id *)&self->_reservationRequester, a3);
}

- (INRestaurantReservationBooking)selectedBooking
{
  return self->_selectedBooking;
}

- (void)setSelectedBooking:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBooking, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void)setErrorController:(id)a3
{
  objc_storeStrong((id *)&self->_errorController, a3);
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCaptor, a3);
}

- (BOOL)contentLikelyChanged
{
  return self->_contentLikelyChanged;
}

- (void)setContentLikelyChanged:(BOOL)a3
{
  self->_contentLikelyChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_selectedBooking, 0);
  objc_storeStrong((id *)&self->_reservationRequester, 0);
  objc_storeStrong((id *)&self->_reservationSuccessViewController, 0);
  objc_storeStrong((id *)&self->_reservationRequestRefinementViewController, 0);
  objc_storeStrong((id *)&self->_reservationTableViewController, 0);
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_guestResponse, 0);
  objc_destroyWeak((id *)&self->_flowViewController);
  objc_storeStrong((id *)&self->_appGuardian, 0);
}

@end
