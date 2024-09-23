@implementation RoutePlanningPreferenceRefinementModel

- (id)titleText
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  char v18;
  unsigned __int8 v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  id v31;
  char *v32;
  unsigned int v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  char *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  NSObject *v48;
  char *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v4 = objc_opt_class(DrivePreferences);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v7 = v6;
  if ((isKindOfClass & 1) == 0)
  {
    v11 = objc_opt_class(CyclePreferences);
    v12 = objc_opt_isKindOfClass(v7, v11);

    v13 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
    v7 = v13;
    if ((v12 & 1) != 0)
    {
      if (-[NSObject avoidHills](v13, "avoidHills")
        && -[NSObject avoidBusyRoads](v7, "avoidBusyRoads"))
      {
        goto LABEL_52;
      }
      if (-[NSObject avoidHills](v7, "avoidHills"))
      {
LABEL_10:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("[Preferences Picker] Avoid Hills");
        goto LABEL_53;
      }
      if (-[NSObject avoidBusyRoads](v7, "avoidBusyRoads"))
      {
LABEL_29:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("[Preferences Picker] Avoid Busy Roads");
        goto LABEL_53;
      }
LABEL_55:

LABEL_56:
      v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("[Preferences Picker] Avoid"), CFSTR("localized string not found"), 0));
      goto LABEL_57;
    }
    v14 = objc_opt_class(WalkPreferences);
    v15 = objc_opt_isKindOfClass(v7, v14);

    v7 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
    if ((v15 & 1) != 0)
    {
      if (sub_100B968A0())
        v16 = -[NSObject avoidHills](v7, "avoidHills");
      else
        v16 = 0;
      if (sub_100B968A0())
        v28 = -[NSObject avoidBusyRoads](v7, "avoidBusyRoads");
      else
        v28 = 0;
      if ((sub_100B968FC() & 1) != 0)
      {
        v33 = -[NSObject avoidStairs](v7, "avoidStairs");
        v34 = v28 ^ 1;
        v35 = v33 ^ 1;
        if (((v16 ^ 1) & 1) == 0 && (v34 & 1) == 0 && (v35 & 1) == 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v8;
          v10 = CFSTR("[Preferences Picker] Avoid 3");
          goto LABEL_53;
        }
        if ((v16 ^ 1 | v34 & v35) == 1 && ((v34 | v35) & 1) != 0)
          goto LABEL_48;
      }
      else if ((v16 & v28 & 1) == 0)
      {
        v33 = 0;
LABEL_48:
        if (v16)
          goto LABEL_10;
        if (v28)
          goto LABEL_29;
        if (v33)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v8;
          v10 = CFSTR("[Preferences Picker] Avoid Stairs");
          goto LABEL_53;
        }
        goto LABEL_55;
      }
LABEL_52:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[Preferences Picker] Avoid 2");
      goto LABEL_53;
    }
    v17 = objc_opt_class(TransitPreferences);
    v18 = objc_opt_isKindOfClass(v7, v17);

    if ((v18 & 1) == 0)
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "-[RoutePlanningPreferenceRefinementModel titleText]";
        v52 = 2080;
        v53 = "RoutePlanningPreferenceRefinementModel.m";
        v54 = 1024;
        v55 = 84;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100A70734())
        goto LABEL_56;
      v31 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v51 = v32;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      goto LABEL_55;
    }
    v7 = objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
    if (!-[NSObject disabledModes](v7, "disabledModes"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[Preferences Picker] Prefer");
      goto LABEL_53;
    }
    v19 = -[NSObject disabledModes](v7, "disabledModes");
    v20 = v19 & 0xF ^ 0xFLL;
    if ((v19 & 0xF) == 0)
    {
      v44 = sub_1004318FC();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ended up with all transit modes preferred, even though we expected some disabled")));
        *(_DWORD *)buf = 136316162;
        v51 = "-[RoutePlanningPreferenceRefinementModel titleText]";
        v52 = 2080;
        v53 = "RoutePlanningPreferenceRefinementModel.m";
        v54 = 1024;
        v55 = 61;
        v56 = 2080;
        v57 = "preferredModes != TransitModeAll";
        v58 = 2112;
        v59 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v47 = sub_1004318FC();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v51 = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v21 = objc_alloc_init((Class)NSMutableArray);
    v22 = v21;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v21, "addObject:", &off_10126DD50);
      if ((v20 & 2) == 0)
      {
LABEL_21:
        if ((v20 & 4) == 0)
        {
LABEL_23:
          if (v20 >= 8)
            objc_msgSend(v22, "addObject:", &off_10126DD98);
          v9 = objc_msgSend(v22, "copy");

          v23 = objc_msgSend(v9, "count");
          if (v23 == (id)1)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
            switch((unint64_t)objc_msgSend(v24, "integerValue"))
            {
              case 1uLL:
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v26 = v25;
                v27 = CFSTR("[Preferences Picker] Bus");
                break;
              case 2uLL:
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v26 = v25;
                v27 = CFSTR("[Preferences Picker] Subway/Light Rail");
                break;
              case 4uLL:
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v26 = v25;
                v27 = CFSTR("[Preferences Picker] Rail");
                break;
              case 8uLL:
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v26 = v25;
                v27 = CFSTR("[Preferences Picker] Ferry");
                break;
              default:
                v39 = sub_1004318FC();
                v40 = objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v51 = "-[RoutePlanningPreferenceRefinementModel titleText]";
                  v52 = 2080;
                  v53 = "RoutePlanningPreferenceRefinementModel.m";
                  v54 = 1024;
                  v55 = 76;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                }

                if (sub_100A70734())
                {
                  v41 = sub_1004318FC();
                  v42 = objc_claimAutoreleasedReturnValue(v41);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    v43 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                    *(_DWORD *)buf = 138412290;
                    v51 = v43;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                  }
                }

                goto LABEL_73;
            }
            v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, CFSTR("localized string not found"), 0));
          }
          else
          {
LABEL_73:
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Preferences Picker] Prefer #"), CFSTR("localized string not found"), 0));
            v38 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v23));
          }
          v36 = (void *)v38;

          goto LABEL_54;
        }
LABEL_22:
        objc_msgSend(v22, "addObject:", &off_10126DD80);
        goto LABEL_23;
      }
    }
    else if ((v20 & 2) == 0)
    {
      goto LABEL_21;
    }
    objc_msgSend(v22, "addObject:", &off_10126DD68);
    if ((v20 & 4) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (-[NSObject avoidTolls](v6, "avoidTolls")
    && -[NSObject avoidHighways](v7, "avoidHighways"))
  {
    goto LABEL_52;
  }
  if (!-[NSObject avoidTolls](v7, "avoidTolls"))
  {
    if (-[NSObject avoidHighways](v7, "avoidHighways"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[Preferences Picker] Avoid Highways");
      goto LABEL_53;
    }
    goto LABEL_55;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  v10 = CFSTR("[Preferences Picker] Avoid Tolls");
LABEL_53:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
LABEL_54:

LABEL_57:
  return v36;
}

- (int)buttonPressUsageAction
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(TransitPreferences);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
    return 311;
  else
    return 313;
}

- (BOOL)shouldShowHighlighted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_msgSend(v2, "hasAnyNonStandardPreferences");

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (void)_assertValidValue
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));
  v3 = objc_opt_class(WatchSyncedPreferences);
  if ((objc_opt_isKindOfClass(v11, v3) & 1) != 0)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementModel value](self, "value"));

    if (v4)
    {
      v5 = sub_1004318FC();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrong type")));
        *(_DWORD *)buf = 136316162;
        v13 = "-[RoutePlanningPreferenceRefinementModel _assertValidValue]";
        v14 = 2080;
        v15 = "RoutePlanningPreferenceRefinementModel.m";
        v16 = 1024;
        v17 = 111;
        v18 = 2080;
        v19 = "[self.value isKindOfClass:[WatchSyncedPreferences class]] || !self.value";
        v20 = 2112;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
}

@end
