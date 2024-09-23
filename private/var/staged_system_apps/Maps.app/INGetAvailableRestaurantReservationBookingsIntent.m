@implementation INGetAvailableRestaurantReservationBookingsIntent

- (id)_maps_preferredBookingDateWithTimeZone:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent preferredBookingDateComponents](self, "preferredBookingDateComponents"));
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v9 = objc_msgSend(v8, "copy");

    objc_msgSend(v9, "setTimeZone:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v6));

  }
  return v7;
}

- (id)_maps_sanitizedResponseForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _BYTE *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableBookings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableBookings", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if (-[INGetAvailableRestaurantReservationBookingsIntent _bookingIsValid:](self, "_bookingIsValid:", v12))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v6, "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    if (v15 > v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
      v19 = objc_msgSend(v18, "unsignedIntegerValue");
      v20 = objc_msgSend(v6, "count");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
      objc_msgSend(v6, "removeObjectsInRange:", v19, v20 - (_BYTE *)objc_msgSend(v21, "unsignedIntegerValue"));

    }
  }
  v22 = objc_alloc((Class)INGetAvailableRestaurantReservationBookingsIntentResponse);
  v23 = objc_msgSend(v4, "code");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivity"));
  v25 = objc_msgSend(v22, "initWithAvailableBookings:code:userActivity:", v6, v23, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedRestaurantDescriptionText"));
  objc_msgSend(v25, "setLocalizedRestaurantDescriptionText:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedBookingAdvisementText"));
  objc_msgSend(v25, "setLocalizedBookingAdvisementText:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "termsAndConditions"));
  objc_msgSend(v25, "setTermsAndConditions:", v28);

  if (-[INGetAvailableRestaurantReservationBookingsIntent _maps_responseIsValid:](self, "_maps_responseIsValid:", v25))
    v29 = v25;
  else
    v29 = 0;

  return v29;
}

- (BOOL)_maps_responseIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  BOOL v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableBookings")),
        v7 = objc_msgSend(v6, "count"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults")), v9 = objc_msgSend(v8, "unsignedIntegerValue"), v8, v6, v7 > v9))
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableBookings"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      while (2)
      {
        v17 = 0;
        v18 = (void *)v11;
        v19 = (void *)v12;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v17);
          if (!-[INGetAvailableRestaurantReservationBookingsIntent _bookingIsValid:](self, "_bookingIsValid:", v20))
          {

            v10 = 0;
            goto LABEL_16;
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bookingDate"));
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "earlierDate:", v21));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bookingDate"));
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "laterDate:", v22));

          v17 = (char *)v17 + 1;
          v18 = (void *)v11;
          v19 = (void *)v12;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v15)
          continue;
        break;
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults"));
    if (v23
      && (v24 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults")), v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "earlierDate:", v11)), v26 = objc_msgSend(v25, "isEqualToDate:", v11), v25, v24, (v26 & 1) != 0))
    {
      v10 = 0;
      v19 = (void *)v12;
      v18 = (void *)v11;
LABEL_16:
      v4 = v38;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults"));

      v4 = v38;
      if (v27
        && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults")), v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "laterDate:", v12)), v30 = objc_msgSend(v29, "isEqualToDate:", v12), v29, v28, (v30 & 1) != 0))
      {
        v10 = 0;
      }
      else
      {
        v31 = objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
        if (v31)
        {
          v32 = (void *)v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "availableBookings"));
          v34 = objc_msgSend(v33, "count");
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent maximumNumberOfResults](self, "maximumNumberOfResults"));
          v36 = v34 > objc_msgSend(v35, "unsignedIntegerValue");

          v10 = !v36;
        }
        else
        {
          v10 = 1;
        }
      }
      v19 = (void *)v12;
      v18 = (void *)v11;
    }

  }
  return v10 & 1;
}

- (BOOL)_bookingIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  char v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restaurant"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "restaurantIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent restaurant](self, "restaurant"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "restaurantIdentifier"));
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (!v9)
    goto LABEL_6;
  v10 = objc_msgSend(v4, "partySize");
  if (v10 != (id)-[INGetAvailableRestaurantReservationBookingsIntent partySize](self, "partySize"))
    goto LABEL_6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
  v15 = objc_msgSend(v13, "isEqualToDate:", v14);

  if ((v15 & 1) != 0)
    goto LABEL_6;
  v16 = objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults"));
  if (!v16)
    goto LABEL_8;
  v17 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "earlierDate:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
  v22 = objc_msgSend(v20, "isEqualToDate:", v21);

  if ((v22 & 1) != 0)
  {
LABEL_6:
    v23 = 0;
  }
  else
  {
LABEL_8:
    v25 = objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults"));
    if (v25)
    {
      v26 = (void *)v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "laterDate:", v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookingDate"));
      v31 = objc_msgSend(v29, "isEqualToDate:", v30);

      v23 = v31 ^ 1;
    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

@end
