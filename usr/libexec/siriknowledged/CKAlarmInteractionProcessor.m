@implementation CKAlarmInteractionProcessor

- (BOOL)supportsSiriDonations
{
  return 0;
}

- (id)bundleIdPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("com.apple.*"));
}

- (id)supportedTypes
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000194E0);
}

- (BOOL)processInteraction:(id)a3 bundleId:(id)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;

  v5 = (__CFString *)a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "intent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parametersByName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("repeat")));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v11 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]";
      v12 = "%s Ignoring non-Recurring events";
      goto LABEL_14;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Delete")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("Disable")))
  {
    v11 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]";
      v12 = "%s Ignoring Alarm Delete or Disable events";
LABEL_14:
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v12, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@#%@%@"), CFSTR("RecurringAlarm"), CFSTR("RecurringAlarmApp"), v7));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v5)
    v17 = v5;
  else
    v17 = &stru_100019050;
  v20 = CFSTR("bundleId");
  v21 = v17;
  v13 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
  objc_msgSend(v19, "recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:", v15, v16, v16, v18, CFSTR("synched"), &stru_100018660);

LABEL_8:
  return v13;
}

@end
