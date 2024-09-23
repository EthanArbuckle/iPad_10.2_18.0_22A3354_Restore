@implementation RoutePlanningTransportTypeRefinementModel

- (id)iconImage
{
  return sub_1008EC474(-[RoutePlanningTransportTypeRefinementModel _resolvedTransportType](self, "_resolvedTransportType"));
}

- (id)titleText
{
  return sub_1008EC5D4(-[RoutePlanningTransportTypeRefinementModel _resolvedTransportType](self, "_resolvedTransportType"));
}

- (BOOL)shouldShowHighlighted
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_msgSend(v2, "integerValue") != 0;

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int64_t)_resolvedTransportType
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_msgSend(v2, "integerValue");

  if (!v3)
  {
    v5 = GEOGetUserTransportTypePreference(v4);
    if ((unint64_t)(v5 - 1) < 4)
      return v5 + 1;
    else
      return 1;
  }
  return (int64_t)v3;
}

- (id)menu
{
  id v3;
  _BOOL4 v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id obj;
  NSMutableArray *v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id location;
  _BYTE v32[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_10126FAA8, &off_10126FAC0, &off_10126FAD8, &off_10126FAF0, 0);
  v4 = sub_10048286C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = objc_msgSend(v5, "isUsingOfflineMaps");

  if ((v4 & ~v6) == 1)
    objc_msgSend(v3, "addObject:", &off_10126FB08);
  v24 = objc_opt_new(NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v8 = objc_msgSend(v7, "integerValue");

  objc_initWeak(&location, self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "integerValue");
        v14 = sub_1008EC5D4((uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = sub_1008EC474((uint64_t)v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1008ECAD0;
        v25[3] = &unk_1011ACEC0;
        objc_copyWeak(&v26, &location);
        v25[4] = v12;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v15, v17, 0, v25));

        objc_msgSend(v18, "setState:", v8 == v13);
        v19 = CFSTR("Drive");
        if ((unint64_t)v13 <= 5)
          v19 = *(&off_1011DB648 + (_QWORD)v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RefinementButtonType"), "stringByAppendingString:", v19));
        objc_msgSend(v18, "setAccessibilityIdentifier:", v20);

        -[NSMutableArray addObject:](v24, "addObject:", v18);
        objc_destroyWeak(&v26);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 32, v24));
  objc_destroyWeak(&location);

  return v21;
}

- (int)menuPressUsageAction
{
  return 314;
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
  v3 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) == 0)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrong type")));
      v11 = 136316162;
      v12 = "-[RoutePlanningTransportTypeRefinementModel _assertValidValue]";
      v13 = 2080;
      v14 = "RoutePlanningTransportTypeRefinementModel.m";
      v15 = 1024;
      v16 = 153;
      v17 = 2080;
      v18 = "[self.value isKindOfClass:[NSNumber class]]";
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
