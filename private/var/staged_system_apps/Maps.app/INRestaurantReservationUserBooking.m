@implementation INRestaurantReservationUserBooking

- (BOOL)_maps_shouldBeDisplayed
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[INRestaurantReservationUserBooking dateStatusModified](self, "dateStatusModified"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return !-[INRestaurantReservationUserBooking requiresManualRequest](self, "requiresManualRequest")
      || (id)-[INRestaurantReservationUserBooking status](self, "status") != (id)2
      || v6 < 300.0;
}

- (id)_maps_schemaOrgRepresentationWithGEOMapItem:(id)a3
{
  uint64_t v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *v9;
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

  v4 = qword_1014D4588;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&qword_1014D4588, &stru_1011EA130);
  v6 = objc_opt_new(NSMutableDictionary);
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressDictionary"));

  v9 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("PostalAddress"), CFSTR("@type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubThoroughfare")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Thoroughfare")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v10, v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, CFSTR("streetAddress"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("City")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, CFSTR("addressLocality"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("State")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v14, CFSTR("addressRegion"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ZIP")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, CFSTR("postalCode"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Country")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, CFSTR("addressCountry"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("FoodEstablishment"), CFSTR("@type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[INRestaurantReservationUserBooking restaurant](self, "restaurant"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v18, CFSTR("name"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v19, CFSTR("address"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org"), CFSTR("@context"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", CFSTR("FoodEstablishmentReservation"), CFSTR("@type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[INRestaurantReservationUserBooking bookingIdentifier](self, "bookingIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v20, "integerValue")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v21, CFSTR("reservationNumber"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Confirmed"), CFSTR("reservationStatus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v22, CFSTR("reservationFor"));

  v23 = (void *)qword_1014D4580;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[INRestaurantReservationUserBooking bookingDate](self, "bookingDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringFromDate:", v24));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v25, CFSTR("startTime"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v6));
  return v26;
}

@end
