@implementation RoutePlanningRefinementModel

- (RoutePlanningRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  RoutePlanningRefinementModel *v8;
  RoutePlanningRefinementModel *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningRefinementModel;
  v8 = -[RoutePlanningRefinementModel init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong(&v9->_value, a4);
    -[RoutePlanningRefinementModel _assertValidValue](v9, "_assertValidValue");
  }

  return v9;
}

- (void)setValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_value != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_value, a3);
    -[RoutePlanningRefinementModel _assertValidValue](self, "_assertValidValue");
    v5 = v6;
  }

}

- (id)iconImage
{
  return 0;
}

- (id)titleText
{
  return 0;
}

- (BOOL)shouldShowHighlighted
{
  return 0;
}

- (BOOL)shouldShowChevron
{
  return 0;
}

- (id)menu
{
  return 0;
}

- (id)menuProvider
{
  return 0;
}

- (int)menuPressUsageAction
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[RoutePlanningRefinementModel menuPressUsageAction]";
    v10 = 2080;
    v11 = "RoutePlanningRefinementModel.m";
    v12 = 1024;
    v13 = 72;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v8, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);

    }
  }
  return 0;
}

- (int)buttonPressUsageAction
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[RoutePlanningRefinementModel buttonPressUsageAction]";
    v10 = 2080;
    v11 = "RoutePlanningRefinementModel.m";
    v12 = 1024;
    v13 = 78;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v8, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);

    }
  }
  return 0;
}

- (void)_resetForMenuPresentation
{
  self->_lastUpdateUsageAction = 0;
}

- (int)lastUpdateUsageAction
{
  return self->_lastUpdateUsageAction;
}

- (RoutePlanningRefinementDelegate)delegate
{
  return (RoutePlanningRefinementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_value, 0);
}

@end
