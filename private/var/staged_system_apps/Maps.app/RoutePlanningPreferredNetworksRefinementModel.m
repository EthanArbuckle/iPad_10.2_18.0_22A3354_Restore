@implementation RoutePlanningPreferredNetworksRefinementModel

- (RoutePlanningPreferredNetworksRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  RoutePlanningPreferredNetworksRefinementModel *v4;
  RoutePlanningPreferredNetworksRefinementModel *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningPreferredNetworksRefinementModel;
  v4 = -[RoutePlanningRefinementModel initWithDelegate:value:](&v8, "initWithDelegate:value:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningPreferredNetworksRefinementModel vehicle](v4, "vehicle"));
    v5->_shouldUsePreferredNetworks = objc_msgSend(v6, "usesPreferredNetworksForRouting");

  }
  return v5;
}

- (id)titleText
{
  void *v2;

  if (self->_shouldUsePreferredNetworks)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningPreferredNetworksRefinementModel _titleForPreferredNetworks](self, "_titleForPreferredNetworks"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningPreferredNetworksRefinementModel _titleForAllNetworks](self, "_titleForAllNetworks"));
  return v2;
}

- (id)_titleForAllNetworks
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Preferred Networks Picker] All Networks"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_titleForPreferredNetworks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningPreferredNetworksRefinementModel vehicle](self, "vehicle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredChargingNetworks"));

  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Preferred Networks Picker] %lu Networks"), CFSTR("localized string not found"), 0));
      v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, objc_msgSend(v3, "count")));
    }
    v14 = (void *)v6;

  }
  else
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[RoutePlanningPreferredNetworksRefinementModel _titleForPreferredNetworks]";
      v18 = 2080;
      v19 = "RoutePlanningPreferredNetworksRefinementModel.m";
      v20 = 1024;
      v21 = 52;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v12 = sub_10043214C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "[Options] RoutePlanningPreferredNetworksRefinementModel was made without any networks", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldShowHighlighted
{
  return self->_shouldUsePreferredNetworks;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (void)_assertValidValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  char *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;

  v3 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
    v6 = objc_opt_class(VGVehicle);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
        v11 = (objc_class *)objc_opt_class(v10);
        v12 = NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrong type: %@"), v13));
        *(_DWORD *)buf = 136316162;
        v19 = "-[RoutePlanningPreferredNetworksRefinementModel _assertValidValue]";
        v20 = 2080;
        v21 = "RoutePlanningPreferredNetworksRefinementModel.m";
        v22 = 1024;
        v23 = 76;
        v24 = 2080;
        v25 = "!self.value || [self.value isKindOfClass:VGVehicle.class]";
        v26 = 2112;
        v27 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
}

- (void)setShouldUsePreferredNetworks:(BOOL)a3
{
  int v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  __CFString *v11;

  if (self->_shouldUsePreferredNetworks != a3)
  {
    self->_shouldUsePreferredNetworks = a3;
    if (a3)
      v4 = 450;
    else
      v4 = 444;
    self->super._lastUpdateUsageAction = v4;
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_shouldUsePreferredNetworks)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] shouldUsePreferredNetworks changed to: %@", (uint8_t *)&v10, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel delegate](self, "delegate"));
    objc_msgSend(v9, "updatedRefinementModel:", self);

  }
}

- (id)vehicle
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(VGVehicle);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int shouldUsePreferredNetworks;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  UIMenu *cachedMenu;
  void *v17;
  id obj;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v5 = objc_opt_class(VGVehicle);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  obj = v6;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningPreferredNetworksRefinementModel vehicle](self, "vehicle"));
  shouldUsePreferredNetworks = self->_shouldUsePreferredNetworks;
  v10 = objc_msgSend(v7, "usesPreferredNetworksForRouting");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredChargingNetworks"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredChargingNetworks"));
  v13 = objc_msgSend(v11, "isEqualToSet:", v12);

  if (shouldUsePreferredNetworks != v10 || (v13 & 1) == 0)
  {
    v14 = sub_10043214C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[Options] Using updated vehicle for networks picker: %@", buf, 0xCu);
    }

    objc_storeStrong(&self->super._value, obj);
    self->_shouldUsePreferredNetworks = objc_msgSend(v7, "usesPreferredNetworksForRouting");
    cachedMenu = self->_cachedMenu;
    self->_cachedMenu = 0;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel delegate](self, "delegate"));
    objc_msgSend(v17, "updatedRefinementModel:", self);

  }
}

- (id)menuProvider
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006B140C;
  v5[3] = &unk_1011BECE8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (int)menuPressUsageAction
{
  return 454;
}

- (BOOL)shouldUsePreferredNetworks
{
  return self->_shouldUsePreferredNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMenu, 0);
}

@end
