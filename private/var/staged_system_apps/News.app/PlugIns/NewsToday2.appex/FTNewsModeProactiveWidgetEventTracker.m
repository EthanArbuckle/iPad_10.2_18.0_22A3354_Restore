@implementation FTNewsModeProactiveWidgetEventTracker

- (FTNewsModeProactiveWidgetEventTracker)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTNewsModeProactiveWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTNewsModeProactiveWidgetEventTracker.m";
    v9 = 1024;
    v10 = 19;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTNewsModeProactiveWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

+ (id)widgetEventTrackerWithMaxRowCount:(unint64_t)a3
{
  FTProactiveWidgetEventTracker *v3;
  FTConditionalWidgetEventTracker *v4;

  v3 = -[FTProactiveWidgetEventTracker initWithMaxRowCount:trackedEvents:]([FTProactiveWidgetEventTracker alloc], "initWithMaxRowCount:trackedEvents:", a3, 2);
  v4 = -[FTConditionalWidgetEventTracker initWithWidgetEventTracker:predicate:]([FTConditionalWidgetEventTracker alloc], "initWithWidgetEventTracker:predicate:", v3, &stru_1000C6B70);

  return v4;
}

@end
