@implementation RestaurantReservationRouter

- (RestaurantReservationRouter)initWithExtension:(id)a3 appStoreApp:(id)a4 mapItem:(id)a5 presenter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RestaurantReservationRouter *v15;
  RestaurantReservationRouter *v16;
  RestaurantReservationRequester *v17;
  RestaurantReservationRequester *restaurantReservationRequester;
  RestaurantReservationAnalyticsBookingSession *v19;
  RestaurantReservationAnalyticsBookingSession *activeBookingSession;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RestaurantReservationRouter;
  v15 = -[RestaurantReservationRouter init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_presenter, v14);
    objc_storeStrong((id *)&v16->_extension, a3);
    v17 = -[RestaurantReservationRequester initWithExtension:mapItem:delegate:]([RestaurantReservationRequester alloc], "initWithExtension:mapItem:delegate:", v11, v13, v16);
    restaurantReservationRequester = v16->_restaurantReservationRequester;
    v16->_restaurantReservationRequester = v17;

    v19 = objc_alloc_init(RestaurantReservationAnalyticsBookingSession);
    activeBookingSession = v16->_activeBookingSession;
    v16->_activeBookingSession = v19;

    objc_storeStrong((id *)&v16->_appStoreApp, a4);
  }

  return v16;
}

- (void)resolve
{
  _MXExtension *extension;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;

  extension = self->_extension;
  if (!extension
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MXExtension _containingAppIdentifer](extension, "_containingAppIdentifer")),
        v5 = isExtensionHidden(),
        v4,
        v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "presentAppStoreApp:", self->_appStoreApp);
LABEL_4:

    return;
  }
  if ((-[_MXExtension isEnabled](self->_extension, "isEnabled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter alertControllerForExtensionPermission](self, "alertControllerForExtensionPermission"));
    objc_msgSend(WeakRetained, "presentPermissionsController:", v12);

    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MXExtension _containingAppIdentifer](self->_extension, "_containingAppIdentifer"));
  v7 = isExtensionLocked();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_presenter);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter alertControllerForLockedExtension](self, "alertControllerForLockedExtension"));
    objc_msgSend(v8, "presentPermissionsController:", v9);

    v10 = sub_100B3A5D4();
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oneAppGuardian"));
    objc_msgSend(v11, "registerAppTracker:", self);

    goto LABEL_4;
  }
  -[RestaurantReservationRouter discoverActiveReservationEvents](self, "discoverActiveReservationEvents");
}

- (void)discoverDefaults
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  objc_msgSend(v2, "requestReservationDefaults");

}

- (void)requesterReservationDefaultsRequestDidComplete:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reservationDefaultsResponse"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reservationDefaultsResponse"));
    v7 = objc_msgSend(v6, "code");

    if (!v7)
    {
      -[RestaurantReservationRouter discoverAvailableBookings](self, "discoverAvailableBookings");
      -[RestaurantReservationRouter discoverGuest](self, "discoverGuest");
    }
  }

}

- (void)discoverAvailableBookings
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reservationDefaultsResponse"));
  if (!v4)
  {
    v9 = 2;
LABEL_6:

    goto LABEL_7;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reservationDefaultsResponse"));
  v8 = objc_msgSend(v7, "code");

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reservationDefaultsResponse"));
    v9 = (uint64_t)objc_msgSend(v11, "defaultPartySize");

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reservationDefaultsResponse"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultBookingDate"));

    v15 = (id)v13;
    goto LABEL_6;
  }
  v9 = 2;
LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  objc_msgSend(v14, "requestAvailableBookingsForPreferredTime:partySize:", v15, v9);

}

- (void)discoverGuest
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  objc_msgSend(v2, "requestGuest");

}

- (void)discoverActiveReservationEvents
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter extension](self, "extension"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
    objc_msgSend(v4, "requestUserCurrentBookingWithRelevanceWindow:", 1800.0);

  }
}

- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RestaurantReservationRouter *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100BF0648;
  v7[3] = &unk_1011AC8B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)requester:(id)a3 userCurrentBookingRequestDidFailWithError:(id)a4
{
  void *v5;
  _QWORD v6[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3, a4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BF07FC;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

}

- (id)alertControllerForLockedExtension
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("reservation_book_with_app_title"), CFSTR("localized string not found"), 0));

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter extension](self, "extension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v8 = objc_msgSend(v5, "initWithFormat:", v4, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("reservations_extension_locked_alert_key"), CFSTR("localized string not found"), 0));

  v11 = objc_alloc((Class)NSString);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter extension](self, "extension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
  v14 = objc_msgSend(v11, "initWithFormat:", v10, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ReservationErrorAlertController alertControllerWithTitle:message:preferredStyle:](ReservationErrorAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v14, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
  -[RestaurantReservationRouter updateSessionAsInstallCompletedIfNeeded:](self, "updateSessionAsInstallCompletedIfNeeded:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
  objc_msgSend(v15, "setBookingSession:", v17);

  objc_msgSend(v15, "setDisplayView:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK [Alert dismissal]"), CFSTR("localized string not found"), 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100BF0AC0;
  v22[3] = &unk_1011AD938;
  v22[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, v22));
  objc_msgSend(v15, "addAction:", v20);

  return v15;
}

- (id)alertControllerForExtensionPermission
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("reservation_book_with_app_title"), CFSTR("localized string not found"), 0));

  v4 = objc_alloc((Class)NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter extension](self, "extension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  v22 = objc_msgSend(v4, "initWithFormat:", v24, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("reservations_agree_to_terms_alert_key"), CFSTR("localized string not found"), 0));

  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter extension](self, "extension"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
  v11 = objc_msgSend(v8, "initWithFormat:", v23, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("reservation_enable_extension_button_title_key"), CFSTR("localized string not found"), 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ReservationErrorAlertController alertControllerWithTitle:message:preferredStyle:](ReservationErrorAlertController, "alertControllerWithTitle:message:preferredStyle:", v22, v11, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
  -[RestaurantReservationRouter updateSessionAsInstallCompletedIfNeeded:](self, "updateSessionAsInstallCompletedIfNeeded:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
  objc_msgSend(v14, "setBookingSession:", v16);

  objc_msgSend(v14, "setDisplayView:", 2);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100BF0E1C;
  v26[3] = &unk_1011AD938;
  v26[4] = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v26));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100BF0E94;
  v25[3] = &unk_1011AD938;
  v25[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, v25));

  objc_msgSend(v14, "addAction:", v17);
  objc_msgSend(v14, "addAction:", v20);

  return v14;
}

- (id)reservationExtensionFlowViewController
{
  RestaurantReservationExtensionFlowViewController *v3;
  void *v4;
  RestaurantReservationExtensionFlowViewController *v5;
  void *v6;
  void *v7;

  v3 = [RestaurantReservationExtensionFlowViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter restaurantReservationRequester](self, "restaurantReservationRequester"));
  v5 = -[RestaurantReservationExtensionFlowViewController initWithRestaurantReservationRequester:](v3, "initWithRestaurantReservationRequester:", v4);

  if (!-[RestaurantReservationRouter hasActiveRestaurantUserBooking](self, "hasActiveRestaurantUserBooking"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
    -[RestaurantReservationRouter updateSessionAsInstallCompletedIfNeeded:](self, "updateSessionAsInstallCompletedIfNeeded:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
    -[RestaurantReservationExtensionFlowViewController setBookingSession:](v5, "setBookingSession:", v7);

  }
  return v5;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  _MXExtension *extension;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  extension = self->_extension;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MXExtension identifier](extension, "identifier"));
  v7 = objc_msgSend(v6, "containsString:", v5);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRouter activeBookingSession](self, "activeBookingSession"));
    objc_msgSend(v8, "endSessionWithState:", 2);

    v9 = sub_100B3A5D4();
    v11 = (id)objc_claimAutoreleasedReturnValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oneAppGuardian"));
    objc_msgSend(v10, "unregisterAppTracker:", self);

  }
}

- (RestaurantReservationRequester)restaurantReservationRequester
{
  return self->_restaurantReservationRequester;
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (RestaurantReservationAnalyticsBookingSession)activeBookingSession
{
  return self->_activeBookingSession;
}

- (void)setActiveBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeBookingSession, a3);
}

- (BOOL)hasActiveRestaurantUserBooking
{
  return self->_hasActiveRestaurantUserBooking;
}

- (void)setHasActiveRestaurantUserBooking:(BOOL)a3
{
  self->_hasActiveRestaurantUserBooking = a3;
}

- (BOOL)activeEventDiscoveryCompleted
{
  return self->_activeEventDiscoveryCompleted;
}

- (void)setActiveEventDiscoveryCompleted:(BOOL)a3
{
  self->_activeEventDiscoveryCompleted = a3;
}

- (INRestaurantReservationUserBooking)activeRestaurantUserBooking
{
  return self->_activeRestaurantUserBooking;
}

- (void)setActiveRestaurantUserBooking:(id)a3
{
  objc_storeStrong((id *)&self->_activeRestaurantUserBooking, a3);
}

- (NSUserActivity)activeRestaurantUserBookingActivity
{
  return self->_activeRestaurantUserBookingActivity;
}

- (void)setActiveRestaurantUserBookingActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activeRestaurantUserBookingActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRestaurantUserBookingActivity, 0);
  objc_storeStrong((id *)&self->_activeRestaurantUserBooking, 0);
  objc_storeStrong((id *)&self->_activeBookingSession, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_restaurantReservationRequester, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
