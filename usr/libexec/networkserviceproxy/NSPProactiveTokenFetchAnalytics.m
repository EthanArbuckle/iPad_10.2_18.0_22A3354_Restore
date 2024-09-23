@implementation NSPProactiveTokenFetchAnalytics

- (id)eventName
{
  return CFSTR("com.apple.nsp.proactiveTokenFetch");
}

- (id)analyticsDict
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  const char *v27;

  v3 = objc_alloc_init((Class)NSDateFormatter);
  v6 = v3;
  if (!v3)
  {
    v23 = nplog_obj(0, v4, v5);
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v26 = 136315138;
      v27 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null dateFormatter", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_13;
  }
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
  objc_msgSend(v6, "setTimeZone:", v7);

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v8)
  {
    v24 = nplog_obj(0, v9, v10);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = 136315138;
      v27 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v26, 0xCu);
    }

    v20 = 0;
LABEL_13:
    v21 = 0;
    goto LABEL_7;
  }
  v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics vendor](self, "vendor"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Vendor"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics type](self, "type"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Type"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics stats](self, "stats"));
  objc_msgSend(v11, "addEntriesFromDictionary:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics fromDate](self, "fromDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v15));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("FromDate"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics toDate](self, "toDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v17));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("ToDate"));

  if (-[NSPProactiveTokenFetchAnalytics tokenFetchTriggered](self, "tokenFetchTriggered"))
    v19 = CFSTR("Yes");
  else
    v19 = CFSTR("No");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("TokenFetchTriggered"));
  v20 = v11;
  v21 = v20;
LABEL_7:

  return v21;
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  self->_stats = (NSDictionary *)a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  self->_fromDate = (NSDate *)a3;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  self->_toDate = (NSDate *)a3;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  self->_vendor = (NSString *)a3;
}

- (BOOL)tokenFetchTriggered
{
  return self->_tokenFetchTriggered;
}

- (void)setTokenFetchTriggered:(BOOL)a3
{
  self->_tokenFetchTriggered = a3;
}

@end
