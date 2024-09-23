@implementation RestaurantReservationRequester

- (RestaurantReservationRequester)initWithExtension:(id)a3 mapItem:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  RestaurantReservationRequester *v12;
  RestaurantReservationRequester *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RestaurantReservationRequester;
  v12 = -[RestaurantReservationRequester init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extension, a3);
    objc_storeStrong((id *)&v13->_mapItem, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)requestGuest
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;

  -[RestaurantReservationRequester resetGuestState](self, "resetGuestState");
  v3 = objc_alloc_init((Class)INGetRestaurantGuestIntent);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  v5 = objc_msgSend(v4, "canSupportIntent:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = -[RestaurantReservationRequester currentGuestRequestNumber](self, "currentGuestRequestNumber");
    objc_initWeak(&location, self);
    v7 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RestaurantReservationRequester");
    v9 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2080;
      v23 = "requestGuest";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v11 = GEOFindOrCreateLog(v7, "RestaurantReservationRequester");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestGuest", ", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
    v14 = objc_opt_class(INGetRestaurantGuestIntentResponse);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100AA4B24;
    v17[3] = &unk_1011E15F0;
    objc_copyWeak(v18, &location);
    v18[1] = v6;
    v15 = objc_msgSend(v13, "handleIntent:expectResponseClass:withCompletion:", v3, v14, v17);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extensionDoesNotSupportIntentError](self, "extensionDoesNotSupportIntentError"));
    -[RestaurantReservationRequester setGuestRequestError:](self, "setGuestRequestError:", v16);

    -[RestaurantReservationRequester setGuestRequestPending:](self, "setGuestRequestPending:", 0);
  }

}

- (void)resetGuestState
{
  -[RestaurantReservationRequester setCurrentGuestRequestNumber:](self, "setCurrentGuestRequestNumber:", (char *)-[RestaurantReservationRequester currentGuestRequestNumber](self, "currentGuestRequestNumber") + 1);
  -[RestaurantReservationRequester setGuestRequestPending:](self, "setGuestRequestPending:", 1);
  -[RestaurantReservationRequester setGuestUserActivity:](self, "setGuestUserActivity:", 0);
  -[RestaurantReservationRequester setGuestResponse:](self, "setGuestResponse:", 0);
  -[RestaurantReservationRequester setGuestRequestError:](self, "setGuestRequestError:", 0);
}

- (void)setGuestRequestPending:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (((!self->_guestRequestPending ^ a3) & 1) == 0)
  {
    self->_guestRequestPending = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester guestRequestError](self, "guestRequestError"));

      v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
      v6 = (void *)v5;
      if (v4)
      {
        v7 = objc_opt_respondsToSelector(v5, "requester:guestRequestDidFailWithError:");

        if ((v7 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester guestRequestError](self, "guestRequestError"));
        objc_msgSend(v10, "requester:guestRequestDidFailWithError:", self, v8);

      }
      else
      {
        v9 = objc_opt_respondsToSelector(v5, "requesterGuestRequestDidComplete:");

        if ((v9 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        objc_msgSend(v10, "requesterGuestRequestDidComplete:", self);
      }

    }
  }
}

- (void)requestReservationDefaults
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t Log;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19[2];
  id location;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;

  -[RestaurantReservationRequester resetReservationDefaultsState](self, "resetReservationDefaultsState");
  v3 = objc_alloc_init((Class)INGetAvailableRestaurantReservationBookingDefaultsIntent);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_intentsRestaurant"));
  objc_msgSend(v3, "setRestaurant:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  LOBYTE(v5) = objc_msgSend(v6, "canSupportIntent:", v3);

  if ((v5 & 1) != 0)
  {
    v7 = -[RestaurantReservationRequester currentReservationDefaultsNumber](self, "currentReservationDefaultsNumber");
    objc_initWeak(&location, self);
    v8 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RestaurantReservationRequester");
    v10 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v22 = v11;
      v23 = 2080;
      v24 = "requestReservationDefaults";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v12 = GEOFindOrCreateLog(v8, "RestaurantReservationRequester");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestReservationDefaults", ", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
    v15 = objc_opt_class(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100AA546C;
    v18[3] = &unk_1011E15F0;
    objc_copyWeak(v19, &location);
    v19[1] = v7;
    v16 = objc_msgSend(v14, "handleIntent:expectResponseClass:withCompletion:", v3, v15, v18);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extensionDoesNotSupportIntentError](self, "extensionDoesNotSupportIntentError"));
    -[RestaurantReservationRequester setReservationDefaultsRequestError:](self, "setReservationDefaultsRequestError:", v17);

    -[RestaurantReservationRequester setReservationDefaultsRequestPending:](self, "setReservationDefaultsRequestPending:", 0);
  }

}

- (void)resetReservationDefaultsState
{
  -[RestaurantReservationRequester setCurrentReservationDefaultsNumber:](self, "setCurrentReservationDefaultsNumber:", (char *)-[RestaurantReservationRequester currentReservationDefaultsNumber](self, "currentReservationDefaultsNumber")+ 1);
  -[RestaurantReservationRequester setReservationDefaultsRequestPending:](self, "setReservationDefaultsRequestPending:", 1);
  -[RestaurantReservationRequester setReservationDefaultsUserActivity:](self, "setReservationDefaultsUserActivity:", 0);
  -[RestaurantReservationRequester setReservationDefaultsResponse:](self, "setReservationDefaultsResponse:", 0);
  -[RestaurantReservationRequester setReservationDefaultsRequestError:](self, "setReservationDefaultsRequestError:", 0);
}

- (void)setReservationDefaultsRequestPending:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (((!self->_reservationDefaultsRequestPending ^ a3) & 1) == 0)
  {
    self->_reservationDefaultsRequestPending = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester reservationDefaultsRequestError](self, "reservationDefaultsRequestError"));

      v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
      v6 = (void *)v5;
      if (v4)
      {
        v7 = objc_opt_respondsToSelector(v5, "requester:reservationDefaultsRequestDidFailWithError:");

        if ((v7 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester reservationDefaultsRequestError](self, "reservationDefaultsRequestError"));
        objc_msgSend(v10, "requester:reservationDefaultsRequestDidFailWithError:", self, v8);

      }
      else
      {
        v9 = objc_opt_respondsToSelector(v5, "requesterReservationDefaultsRequestDidComplete:");

        if ((v9 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        objc_msgSend(v10, "requesterReservationDefaultsRequestDidComplete:", self);
      }

    }
  }
}

- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3
{
  -[RestaurantReservationRequester requestUserCurrentBookingWithRelevanceWindow:reservationIdentifier:](self, "requestUserCurrentBookingWithRelevanceWindow:reservationIdentifier:", 0, a3);
}

- (void)requestUserCurrentBookingWithReservationIdentifier:(id)a3
{
  -[RestaurantReservationRequester requestUserCurrentBookingWithRelevanceWindow:reservationIdentifier:](self, "requestUserCurrentBookingWithRelevanceWindow:reservationIdentifier:", a3, 0.0);
}

- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3 reservationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t Log;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24[2];
  id location;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;

  v6 = a4;
  -[RestaurantReservationRequester resetUserCurrentBookingState](self, "resetUserCurrentBookingState");
  v7 = objc_alloc_init((Class)INGetUserCurrentRestaurantReservationBookingsIntent);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_intentsRestaurant"));
  objc_msgSend(v7, "setRestaurant:", v9);

  objc_msgSend(v7, "setMaximumNumberOfResults:", &off_1012704E0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  objc_msgSend(v7, "setEarliestBookingDateForResults:", v10);

  objc_msgSend(v7, "setReservationIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  LOBYTE(v9) = objc_msgSend(v11, "canSupportIntent:", v7);

  if ((v9 & 1) != 0)
  {
    v12 = -[RestaurantReservationRequester currentUserBookingNumber](self, "currentUserBookingNumber");
    objc_initWeak(&location, self);
    v13 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RestaurantReservationRequester");
    v15 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      v28 = 2080;
      v29 = "requestUserCurrentBooking";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v17 = GEOFindOrCreateLog(v13, "RestaurantReservationRequester");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestUserCurrentBooking", ", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
    v20 = objc_opt_class(INGetUserCurrentRestaurantReservationBookingsIntentResponse);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100AA5E2C;
    v23[3] = &unk_1011E15F0;
    objc_copyWeak(v24, &location);
    v24[1] = v12;
    v21 = objc_msgSend(v19, "handleIntent:expectResponseClass:withCompletion:", v7, v20, v23);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extensionDoesNotSupportIntentError](self, "extensionDoesNotSupportIntentError"));
    -[RestaurantReservationRequester setUserCurrentBookingRequestError:](self, "setUserCurrentBookingRequestError:", v22);

    -[RestaurantReservationRequester setUserCurrentBookingRequestPending:](self, "setUserCurrentBookingRequestPending:", 0);
  }

}

- (void)resetUserCurrentBookingState
{
  -[RestaurantReservationRequester setCurrentUserBookingNumber:](self, "setCurrentUserBookingNumber:", (char *)-[RestaurantReservationRequester currentUserBookingNumber](self, "currentUserBookingNumber") + 1);
  -[RestaurantReservationRequester setUserCurrentBookingRequestPending:](self, "setUserCurrentBookingRequestPending:", 1);
  -[RestaurantReservationRequester setUserCurrentBookingUserActivity:](self, "setUserCurrentBookingUserActivity:", 0);
  -[RestaurantReservationRequester setUserCurrentBookingResponse:](self, "setUserCurrentBookingResponse:", 0);
  -[RestaurantReservationRequester setUserCurrentBookingRequestError:](self, "setUserCurrentBookingRequestError:", 0);
}

- (void)setUserCurrentBookingRequestPending:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (((!self->_userCurrentBookingRequestPending ^ a3) & 1) == 0)
  {
    self->_userCurrentBookingRequestPending = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester userCurrentBookingRequestError](self, "userCurrentBookingRequestError"));

      v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
      v6 = (void *)v5;
      if (v4)
      {
        v7 = objc_opt_respondsToSelector(v5, "requester:userCurrentBookingRequestDidFailWithError:");

        if ((v7 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester userCurrentBookingRequestError](self, "userCurrentBookingRequestError"));
        objc_msgSend(v10, "requester:userCurrentBookingRequestDidFailWithError:", self, v8);

      }
      else
      {
        v9 = objc_opt_respondsToSelector(v5, "requesterUserCurrentBookingRequestDidComplete:");

        if ((v9 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        objc_msgSend(v10, "requesterUserCurrentBookingRequestDidComplete:", self);
      }

    }
  }
}

- (void)requestAvailableBookingsForPreferredTime:(id)a3 partySize:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t Log;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33[2];
  id location;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;

  v6 = a3;
  -[RestaurantReservationRequester resetAvailableBookingsState](self, "resetAvailableBookingsState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = objc_alloc_init((Class)INGetAvailableRestaurantReservationBookingsIntent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_intentsRestaurant"));
  objc_msgSend(v8, "setRestaurant:", v10);

  objc_msgSend(v8, "setPartySize:", a4);
  objc_msgSend(v8, "setPreferredBookingDate:", v6);
  if ((objc_opt_respondsToSelector(v8, "setPreferredBookingDateComponents:") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
    v13 = v12;
    if (!v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsInTimeZone:fromDate:", v13, v6));
    objc_msgSend(v8, "setPreferredBookingDateComponents:", v14);

    if (!v12)
  }
  objc_msgSend(v8, "setMaximumNumberOfResults:", &off_1012704F8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "setEarliestBookingDateForResults:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeZone"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_nextDayAtHour:timeZone:", 0, v17));
  objc_msgSend(v8, "setLatestBookingDateForResults:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  LOBYTE(v17) = objc_msgSend(v19, "canSupportIntent:", v8);

  if ((v17 & 1) != 0)
  {
    -[RestaurantReservationRequester setAvailableBookingsRequest:](self, "setAvailableBookingsRequest:", v8);
    v20 = -[RestaurantReservationRequester currentAvailableBookingNumber](self, "currentAvailableBookingNumber");
    objc_initWeak(&location, self);
    v21 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RestaurantReservationRequester");
    v23 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v36 = v24;
      v37 = 2080;
      v38 = "requestAvailableBookings";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v25 = GEOFindOrCreateLog(v21, "RestaurantReservationRequester");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestAvailableBookings", ", buf, 2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
    v28 = objc_opt_class(INGetAvailableRestaurantReservationBookingsIntentResponse);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100AA68F0;
    v31[3] = &unk_1011E1618;
    objc_copyWeak(v33, &location);
    v32 = v8;
    v33[1] = v20;
    v29 = objc_msgSend(v27, "handleIntent:expectResponseClass:withCompletion:", v32, v28, v31);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extensionDoesNotSupportIntentError](self, "extensionDoesNotSupportIntentError"));
    -[RestaurantReservationRequester setAvailableBookingsRequestError:](self, "setAvailableBookingsRequestError:", v30);

    -[RestaurantReservationRequester setAvailableBookingsRequestPending:](self, "setAvailableBookingsRequestPending:", 0);
  }

}

- (void)resetAvailableBookingsState
{
  -[RestaurantReservationRequester setCurrentAvailableBookingNumber:](self, "setCurrentAvailableBookingNumber:", (char *)-[RestaurantReservationRequester currentAvailableBookingNumber](self, "currentAvailableBookingNumber") + 1);
  -[RestaurantReservationRequester setAvailableBookingsRequestPending:](self, "setAvailableBookingsRequestPending:", 1);
  -[RestaurantReservationRequester setAvailableBookingsUserActivity:](self, "setAvailableBookingsUserActivity:", 0);
  -[RestaurantReservationRequester setAvailableBookingsResponse:](self, "setAvailableBookingsResponse:", 0);
  -[RestaurantReservationRequester setAvailableBookingsRequestError:](self, "setAvailableBookingsRequestError:", 0);
  -[RestaurantReservationRequester setAvailableBookingsRequest:](self, "setAvailableBookingsRequest:", 0);
}

- (void)setAvailableBookingsRequestPending:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (((!self->_availableBookingsRequestPending ^ a3) & 1) == 0)
  {
    self->_availableBookingsRequestPending = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester availableBookingsRequestError](self, "availableBookingsRequestError"));

      v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
      v6 = (void *)v5;
      if (v4)
      {
        v7 = objc_opt_respondsToSelector(v5, "requester:availableBookingsRequestDidFailWithError:");

        if ((v7 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester availableBookingsRequestError](self, "availableBookingsRequestError"));
        objc_msgSend(v10, "requester:availableBookingsRequestDidFailWithError:", self, v8);

      }
      else
      {
        v9 = objc_opt_respondsToSelector(v5, "requesterAvailableBookingsRequestDidComplete:");

        if ((v9 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        objc_msgSend(v10, "requesterAvailableBookingsRequestDidComplete:", self);
      }

    }
  }
}

- (void)bookRestaurantReservation:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t Log;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40[2];
  id location;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;

  v10 = a3;
  v37 = a4;
  v38 = a5;
  v11 = a6;
  -[RestaurantReservationRequester resetBookRestaurantReservationState](self, "resetBookRestaurantReservationState");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = objc_alloc_init((Class)INBookRestaurantReservationIntent);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_intentsRestaurant"));
  objc_msgSend(v12, "setRestaurant:", v14);

  objc_msgSend(v12, "setPartySize:", objc_msgSend(v10, "partySize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookingDate"));
  objc_msgSend(v12, "setBookingDate:", v15);

  if ((objc_opt_respondsToSelector(v12, "setBookingDateComponents:") & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester mapItem](self, "mapItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeZone"));
    v18 = v17;
    if (!v17)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookingDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "componentsInTimeZone:fromDate:", v18, v19));
    objc_msgSend(v12, "setBookingDateComponents:", v20);

    if (!v17)
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookingIdentifier", v35));
  objc_msgSend(v12, "setBookingIdentifier:", v21);

  objc_msgSend(v12, "setGuest:", v37);
  objc_msgSend(v12, "setSelectedOffer:", v38);
  objc_msgSend(v12, "setGuestProvidedSpecialRequestText:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  v23 = objc_msgSend(v22, "canSupportIntent:", v12);

  if ((v23 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extensionDoesNotSupportIntentError](self, "extensionDoesNotSupportIntentError"));
    -[RestaurantReservationRequester setBookReservationRequestError:](self, "setBookReservationRequestError:", v24);

    -[RestaurantReservationRequester setBookReservationRequestPending:](self, "setBookReservationRequestPending:", 0);
  }
  v25 = -[RestaurantReservationRequester currentBookReservationNumber](self, "currentBookReservationNumber");
  objc_initWeak(&location, self);
  v26 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RestaurantReservationRequester");
  v28 = (id)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester uniqueName](self, "uniqueName"));
    *(_DWORD *)buf = 138412546;
    v43 = v29;
    v44 = 2080;
    v45 = "bookRestaurantReservation";
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  v30 = GEOFindOrCreateLog(v26, "RestaurantReservationRequester");
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "bookRestaurantReservation", ", buf, 2u);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester extension](self, "extension"));
  v33 = objc_opt_class(INBookRestaurantReservationIntentResponse);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100AA73FC;
  v39[3] = &unk_1011E15F0;
  objc_copyWeak(v40, &location);
  v40[1] = v25;
  v34 = objc_msgSend(v32, "handleIntent:expectResponseClass:withCompletion:", v12, v33, v39);

  objc_destroyWeak(v40);
  objc_destroyWeak(&location);

}

- (void)resetBookRestaurantReservationState
{
  -[RestaurantReservationRequester setCurrentBookReservationNumber:](self, "setCurrentBookReservationNumber:", (char *)-[RestaurantReservationRequester currentBookReservationNumber](self, "currentBookReservationNumber") + 1);
  -[RestaurantReservationRequester setBookReservationRequestPending:](self, "setBookReservationRequestPending:", 1);
  -[RestaurantReservationRequester setBookReservationUserActivity:](self, "setBookReservationUserActivity:", 0);
  -[RestaurantReservationRequester setBookReservationResponse:](self, "setBookReservationResponse:", 0);
  -[RestaurantReservationRequester setBookReservationRequestError:](self, "setBookReservationRequestError:", 0);
}

- (void)setBookReservationRequestPending:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (((!self->_bookReservationRequestPending ^ a3) & 1) == 0)
  {
    self->_bookReservationRequestPending = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester bookReservationRequestError](self, "bookReservationRequestError"));

      v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
      v6 = (void *)v5;
      if (v4)
      {
        v7 = objc_opt_respondsToSelector(v5, "requester:bookRestaurantReservationRequestDidFailWithError:");

        if ((v7 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester bookReservationRequestError](self, "bookReservationRequestError"));
        objc_msgSend(v10, "requester:bookRestaurantReservationRequestDidFailWithError:", self, v8);

      }
      else
      {
        v9 = objc_opt_respondsToSelector(v5, "requesterBookRestaurantReservationRequestDidComplete:");

        if ((v9 & 1) == 0)
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationRequester delegate](self, "delegate"));
        objc_msgSend(v10, "requesterBookRestaurantReservationRequestDidComplete:", self);
      }

    }
  }
}

- (id)extensionDoesNotSupportIntentError
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _MXExtensionServiceErrorDomain, 8, 0);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (RestaurantReservationRequesterDelegate)delegate
{
  return (RestaurantReservationRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (BOOL)guestRequestPending
{
  return self->_guestRequestPending;
}

- (BOOL)reservationDefaultsRequestPending
{
  return self->_reservationDefaultsRequestPending;
}

- (BOOL)userCurrentBookingRequestPending
{
  return self->_userCurrentBookingRequestPending;
}

- (BOOL)availableBookingsRequestPending
{
  return self->_availableBookingsRequestPending;
}

- (BOOL)bookReservationRequestPending
{
  return self->_bookReservationRequestPending;
}

- (INGetAvailableRestaurantReservationBookingsIntent)availableBookingsRequest
{
  return self->_availableBookingsRequest;
}

- (void)setAvailableBookingsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_availableBookingsRequest, a3);
}

- (INGetRestaurantGuestIntentResponse)guestResponse
{
  return self->_guestResponse;
}

- (void)setGuestResponse:(id)a3
{
  objc_storeStrong((id *)&self->_guestResponse, a3);
}

- (NSUserActivity)guestUserActivity
{
  return self->_guestUserActivity;
}

- (void)setGuestUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_guestUserActivity, a3);
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)reservationDefaultsResponse
{
  return self->_reservationDefaultsResponse;
}

- (void)setReservationDefaultsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_reservationDefaultsResponse, a3);
}

- (NSUserActivity)reservationDefaultsUserActivity
{
  return self->_reservationDefaultsUserActivity;
}

- (void)setReservationDefaultsUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_reservationDefaultsUserActivity, a3);
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)userCurrentBookingResponse
{
  return self->_userCurrentBookingResponse;
}

- (void)setUserCurrentBookingResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userCurrentBookingResponse, a3);
}

- (NSUserActivity)userCurrentBookingUserActivity
{
  return self->_userCurrentBookingUserActivity;
}

- (void)setUserCurrentBookingUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userCurrentBookingUserActivity, a3);
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)availableBookingsResponse
{
  return self->_availableBookingsResponse;
}

- (void)setAvailableBookingsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_availableBookingsResponse, a3);
}

- (NSUserActivity)availableBookingsUserActivity
{
  return self->_availableBookingsUserActivity;
}

- (void)setAvailableBookingsUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_availableBookingsUserActivity, a3);
}

- (INBookRestaurantReservationIntentResponse)bookReservationResponse
{
  return self->_bookReservationResponse;
}

- (void)setBookReservationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_bookReservationResponse, a3);
}

- (NSUserActivity)bookReservationUserActivity
{
  return self->_bookReservationUserActivity;
}

- (void)setBookReservationUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_bookReservationUserActivity, a3);
}

- (int64_t)currentGuestRequestNumber
{
  return self->_currentGuestRequestNumber;
}

- (void)setCurrentGuestRequestNumber:(int64_t)a3
{
  self->_currentGuestRequestNumber = a3;
}

- (NSError)guestRequestError
{
  return self->_guestRequestError;
}

- (void)setGuestRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_guestRequestError, a3);
}

- (int64_t)currentReservationDefaultsNumber
{
  return self->_currentReservationDefaultsNumber;
}

- (void)setCurrentReservationDefaultsNumber:(int64_t)a3
{
  self->_currentReservationDefaultsNumber = a3;
}

- (NSError)reservationDefaultsRequestError
{
  return self->_reservationDefaultsRequestError;
}

- (void)setReservationDefaultsRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_reservationDefaultsRequestError, a3);
}

- (int64_t)currentUserBookingNumber
{
  return self->_currentUserBookingNumber;
}

- (void)setCurrentUserBookingNumber:(int64_t)a3
{
  self->_currentUserBookingNumber = a3;
}

- (NSError)userCurrentBookingRequestError
{
  return self->_userCurrentBookingRequestError;
}

- (void)setUserCurrentBookingRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_userCurrentBookingRequestError, a3);
}

- (int64_t)currentAvailableBookingNumber
{
  return self->_currentAvailableBookingNumber;
}

- (void)setCurrentAvailableBookingNumber:(int64_t)a3
{
  self->_currentAvailableBookingNumber = a3;
}

- (NSError)availableBookingsRequestError
{
  return self->_availableBookingsRequestError;
}

- (void)setAvailableBookingsRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_availableBookingsRequestError, a3);
}

- (int64_t)currentBookReservationNumber
{
  return self->_currentBookReservationNumber;
}

- (void)setCurrentBookReservationNumber:(int64_t)a3
{
  self->_currentBookReservationNumber = a3;
}

- (NSError)bookReservationRequestError
{
  return self->_bookReservationRequestError;
}

- (void)setBookReservationRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_bookReservationRequestError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookReservationRequestError, 0);
  objc_storeStrong((id *)&self->_availableBookingsRequestError, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingRequestError, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsRequestError, 0);
  objc_storeStrong((id *)&self->_guestRequestError, 0);
  objc_storeStrong((id *)&self->_bookReservationUserActivity, 0);
  objc_storeStrong((id *)&self->_bookReservationResponse, 0);
  objc_storeStrong((id *)&self->_availableBookingsUserActivity, 0);
  objc_storeStrong((id *)&self->_availableBookingsResponse, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingUserActivity, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingResponse, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsUserActivity, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsResponse, 0);
  objc_storeStrong((id *)&self->_guestUserActivity, 0);
  objc_storeStrong((id *)&self->_guestResponse, 0);
  objc_storeStrong((id *)&self->_availableBookingsRequest, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
