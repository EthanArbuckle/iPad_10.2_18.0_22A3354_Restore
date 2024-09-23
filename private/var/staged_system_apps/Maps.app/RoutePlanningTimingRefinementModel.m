@implementation RoutePlanningTimingRefinementModel

- (id)titleText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTimingFormatter textForTiming:](RoutePlanningTimingFormatter, "textForTiming:", v2));

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_msgSend(v2, "isDepartNow") ^ 1;

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int)buttonPressUsageAction
{
  return 3034;
}

- (void)_assertValidValue
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(RoutePlanningTiming);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) == 0)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrong type")));
      v11 = 136316162;
      v12 = "-[RoutePlanningTimingRefinementModel _assertValidValue]";
      v13 = 2080;
      v14 = "RoutePlanningTimingRefinementModel.m";
      v15 = 1024;
      v16 = 39;
      v17 = 2080;
      v18 = "[self.value isKindOfClass:[RoutePlanningTiming class]]";
      v19 = 2112;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v11, 0x30u);

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
  }
}

@end
