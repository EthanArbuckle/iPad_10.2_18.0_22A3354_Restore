@implementation MPMediaItem

- (id)tvun_expirationDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyRentalPlaybackStartTime));
  if ((objc_msgSend(v3, "isEqualToNumber:", &off_1001003F8) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  v5 = objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyRentalPlaybackDuration));
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    if ((objc_msgSend(v3, "isEqualToNumber:", &off_1001003F8) & 1) != 0
      || (objc_msgSend(v6, "isEqualToNumber:", &off_1001003F8) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = objc_alloc((Class)NSDate);
      objc_msgSend(v6, "doubleValue");
      v7 = objc_msgSend(v8, "initWithTimeInterval:sinceDate:", v4);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyRentalStartTime));
  if ((objc_msgSend(v9, "isEqualToNumber:", &off_1001003F8) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "doubleValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  v11 = objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyRentalDuration));
  v12 = (void *)v11;
  if (v9)
    v13 = v11 == 0;
  else
    v13 = 1;
  v14 = v13 || v10 == 0;
  if (!v14
    && (objc_msgSend(v9, "isEqualToNumber:", &off_1001003F8) & 1) == 0
    && !objc_msgSend(v12, "isEqualToNumber:", &off_1001003F8))
  {
    v19 = objc_alloc((Class)NSDate);
    objc_msgSend(v12, "doubleValue");
    v20 = objc_msgSend(v19, "initWithTimeInterval:sinceDate:", v10);
    v15 = v20;
    if (v7 && v20)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "earlierDate:", v20));
      goto LABEL_24;
    }
    if (!v7)
    {
      if (!v20)
      {
        v16 = 0;
        goto LABEL_25;
      }
      v17 = v20;
      v15 = v17;
      goto LABEL_24;
    }
LABEL_23:
    v17 = v7;
LABEL_24:
    v16 = v17;
    goto LABEL_25;
  }
  v15 = 0;
  v16 = 0;
  if (v7)
    goto LABEL_23;
LABEL_25:

  return v16;
}

- (BOOL)tvun_isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem tvun_expirationDate](self, "tvun_expirationDate"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v4 = objc_msgSend(v2, "compare:", v3) != (id)1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)tvun_expirationString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem tvun_expirationDate](self, "tvun_expirationDate"));
  v3 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:toDate:options:", 112, v4, v2, 0));

  v6 = (uint64_t)objc_msgSend(v5, "day");
  v7 = (uint64_t)objc_msgSend(v5, "hour");
  v8 = (uint64_t)objc_msgSend(v5, "minute");
  if (v6 < 2)
  {
    if (v6 != 1 && v7 < 1)
    {
      if (v8 < 0)
      {
        v16 = 0;
        goto LABEL_15;
      }
      if (v8 <= 1)
        v13 = 1;
      else
        v13 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v14;
      v15 = CFSTR("COUNT_MINUTES");
    }
    else
    {
      v13 = v7 + 24 * v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v14;
      v15 = CFSTR("COUNT_HOURS");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1000FFDC8, 0));
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v13);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("COUNT_DAYS"), &stru_1000FFDC8, 0));
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v6);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(v11);

LABEL_15:
  return v16;
}

@end
