@implementation BATelemetrySender

+ (BOOL)shouldReportBundleIDInTelemetry:(id)a3 date:(id)a4 deviceIdentifier:(unsigned __int8)a5[16]
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  unsigned int v11;
  const char *v12;
  CC_LONG v13;
  CC_SHA256_CTX v15;
  unsigned int data;
  unsigned __int8 md[2];

  v7 = a3;
  v8 = a4;
  if (v7 && (objc_msgSend(v7, "isEqualToString:", &stru_100059EF8) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    v11 = objc_msgSend(v10, "ordinalityOfUnit:inUnit:forDate:", 16, 4, v8);
    data = v11 + 366 * objc_msgSend(v10, "component:fromDate:", 4, v8);
    memset(&v15, 0, sizeof(v15));
    CC_SHA256_Init(&v15);
    CC_SHA256_Update(&v15, a5, 0x10u);
    CC_SHA256_Update(&v15, &data, 4u);
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v13 = strlen(v12);
    CC_SHA256_Update(&v15, v12, v13);
    CC_SHA256_Final(md, &v15);
    v9 = *(unsigned __int16 *)md < 0x290u;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)sendContentRequestTelemetryEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v3 = a3;
  if (qword_100065520 != -1)
    dispatch_once(&qword_100065520, &stru_100058BB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("BundleIdentifier")));
  if ((os_variant_has_internal_diagnostics("com.apple.BackgroundAssets") & 1) != 0)
  {
    AnalyticsSendEvent(v4, v6);
    v8 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BATelemetrySender: sent %@ event, payload: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = +[BATelemetrySender shouldReportBundleIDInTelemetry:date:deviceIdentifier:](BATelemetrySender, "shouldReportBundleIDInTelemetry:date:deviceIdentifier:", v7, v10, &unk_100065510);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("BundleIdentifier"));

    }
    AnalyticsSendEvent(v4, v6);
  }

}

@end
