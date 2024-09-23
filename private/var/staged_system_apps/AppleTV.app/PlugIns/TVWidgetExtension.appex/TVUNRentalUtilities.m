@implementation TVUNRentalUtilities

+ (id)fetchRentals
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = sub_100006398();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities - Begin fetchRentals", (uint8_t *)&v19, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (qword_10010C1B0 != -1)
    dispatch_once(&qword_10010C1B0, &stru_1000F6958);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery movieRentalsQuery](MPMediaQuery, "movieRentalsQuery"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v7 = MPMediaItemPropertyRentalExpirationDate;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v6, MPMediaItemPropertyRentalExpirationDate, 101));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &off_100100410, v7, 0));
  v23[0] = v8;
  v23[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAnyPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v10));

  objc_msgSend(v5, "addFilterPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v13 = sub_100006398();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v4);
    v19 = 138412546;
    v20 = v15;
    v21 = 2048;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities- End fetchRentals [%@] elapsed:%.5f", (uint8_t *)&v19, 0x16u);

  }
  return v12;
}

+ (id)validRentalWithIdentifier:(unint64_t)a3 inRentals:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  _BYTE v26[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = MPMediaItemPropertyStoreID;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", v9, (_QWORD)v20));
      v13 = objc_msgSend(v12, "longLongValue");

      if (v13 == (id)a3)
        break;
      if (v7 == (id)++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    v14 = sub_100006398();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities- Found rental: %llu", buf, 0xCu);
    }

    if ((objc_msgSend(v11, "tvun_isExpired") & 1) == 0)
    {
      v18 = v11;
      goto LABEL_18;
    }
    v16 = sub_100006398();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities -Skipping expired rental: %llu", buf, 0xCu);
    }

  }
LABEL_16:
  v18 = 0;
LABEL_18:

  return v18;
}

@end
