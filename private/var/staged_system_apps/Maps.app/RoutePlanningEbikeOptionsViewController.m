@implementation RoutePlanningEbikeOptionsViewController

+ (Class)_dataSourceClass
{
  return (Class)objc_opt_class(RoutePlanningEbikeOptions, a2);
}

- (id)_titleForTransportType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  if (a3 == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Planning, Cycle] E-Bike options card header"), CFSTR("localized string not found"), 0));

    return v4;
  }
  else
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "-[RoutePlanningEbikeOptionsViewController _titleForTransportType:]";
      v13 = 2080;
      v14 = "RoutePlanningOptionsViewController.m";
      v15 = 1024;
      v16 = 1357;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v11, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
    return 0;
  }
}

@end
