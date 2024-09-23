@implementation _OSIntervalHistory

+ (id)sharedInstance
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass"), "+[_OSIntervalHistory sharedInstance]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v2, 0));

  objc_exception_throw(v3);
}

- (_OSIntervalHistory)init
{
  _OSIntervalHistory *v2;
  _OSIntervalHistory *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_OSIntervalHistory;
  v2 = -[_OSIntervalHistory init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
    v7 = os_log_create("com.apple.osintelligence", (const char *)objc_msgSend(v6, "UTF8String"));
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    -[_OSIntervalHistory loadHistoryFromUnderlyingDataSource](v3, "loadHistoryFromUnderlyingDataSource");
  }
  return v3;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  OS_os_log *log;

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
    sub_10003F13C((os_log_t)log);
}

- (id)newestIntervalInHistory
{
  return -[NSArray lastObject](self->_allIntervalsSortByStartAsc, "lastObject");
}

- (id)oldestIntervalInHistory
{
  return -[NSArray firstObject](self->_allIntervalsSortByStartAsc, "firstObject");
}

- (BOOL)refreshCacheIfStaleWithQueryDate:(id)a3
{
  NSDate *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  OS_os_log *log;
  NSDate *lastRefreshDate;
  NSDate *lastQueryDate;
  int v14;
  NSDate *v15;
  __int16 v16;
  NSDate *v17;

  v5 = (NSDate *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earlierDate:", v5));

  if (self->_lastRefreshDate && (objc_msgSend(v7, "timeIntervalSinceDate:"), v8 < 900.0))
  {
    v9 = 0;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      lastRefreshDate = self->_lastRefreshDate;
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = lastRefreshDate;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Refreshing history because input date = %@ and last refreshed at %@", (uint8_t *)&v14, 0x16u);
    }
    -[_OSIntervalHistory loadHistoryFromUnderlyingDataSource](self, "loadHistoryFromUnderlyingDataSource");
    v9 = 1;
  }
  lastQueryDate = self->_lastQueryDate;
  if (!lastQueryDate || lastQueryDate != v5)
  {
    -[_OSIntervalHistory updateStratasWithQueryDate:](self, "updateStratasWithQueryDate:", v5);
    objc_storeStrong((id *)&self->_lastQueryDate, a3);
  }

  return v9;
}

- (void)updateStratasWithQueryDate:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass"), "-[_OSIntervalHistory updateStratasWithQueryDate:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (void)setLastRefreshDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRefreshDate, a3);
}

- (NSDate)lastQueryDate
{
  return self->_lastQueryDate;
}

- (void)setLastQueryDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryDate, a3);
}

- (NSArray)allIntervalsSortByStartAsc
{
  return self->_allIntervalsSortByStartAsc;
}

- (void)setAllIntervalsSortByStartAsc:(id)a3
{
  objc_storeStrong((id *)&self->_allIntervalsSortByStartAsc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIntervalsSortByStartAsc, 0);
  objc_storeStrong((id *)&self->_lastQueryDate, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
