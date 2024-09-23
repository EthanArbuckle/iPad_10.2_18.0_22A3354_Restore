@implementation RPStringUtility

+ (id)numberFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSNumberFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFromString:", v3));

  return v5;
}

+ (unint64_t)rotatingDeviceUniqueID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kSCDeviceUniqueID")));
    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("kSCDeviceUniqueID"));
      objc_msgSend(v3, "synchronize");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 8196, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%lu%lu"), v4, objc_msgSend(v8, "yearForWeekOfYear"), objc_msgSend(v8, "weekOfYear")));
    v10 = objc_msgSend(v9, "hash");

  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050F70();
    v10 = 0;
  }

  return (unint64_t)v10;
}

+ (BOOL)isInvalidBundleId:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("(null)"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Unknown")))
  {
    v4 = 0;
  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051004((uint64_t)v3);
    v4 = 1;
  }

  return v4;
}

@end
