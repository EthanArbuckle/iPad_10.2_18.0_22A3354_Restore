@implementation DTMFeatureDiscoverySource

- (DTMFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6;
  DTMFeatureDiscoverySource *v7;
  DTMFeatureDiscoverySource *v8;
  uint64_t v9;
  NSDate *recentsCutoffDate;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DTMFeatureDiscoverySource;
  v7 = -[DTMFeatureDiscoverySource init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    recentsCutoffDate = v8->_recentsCutoffDate;
    v8->_recentsCutoffDate = (NSDate *)v9;

    v8->_repeatedTransportType = -[DTMFeatureDiscoverySource _fetchRepeatedRecentTransportType](v8, "_fetchRepeatedRecentTransportType");
  }

  return v8;
}

- (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DTMFeatureDiscoverySource model](self, "model"));
  v3 = v2 != 0;

  return v3;
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  os_unfair_lock_s *p_lock;
  int64_t transportType;
  NSDate *recentsCutoffDate;
  NSDate *v9;
  NSDate *v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  const __CFString *v14;
  NSDate *v15;
  id v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  NSDate *v21;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transportType = self->_transportType;
  if (transportType == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (transportType)
    {
      if (!a3)
      {
        recentsCutoffDate = self->_recentsCutoffDate;
        self->_recentsCutoffDate = 0;

        self->_repeatedTransportType = 0;
      }
    }
    else
    {
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v10 = self->_recentsCutoffDate;
      self->_recentsCutoffDate = v9;

      self->_repeatedTransportType = -[DTMFeatureDiscoverySource _fetchRepeatedRecentTransportType](self, "_fetchRepeatedRecentTransportType");
      v11 = sub_1004321BC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = self->_repeatedTransportType - 1;
        if (v13 > 4)
          v14 = CFSTR("Undefined");
        else
          v14 = *(&off_1011B72F8 + v13);
        v15 = self->_recentsCutoffDate;
        v18 = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Fetched repeated type %@ given cut-off date %@", (uint8_t *)&v18, 0x16u);
      }

      if (GEOConfigGetBOOL(MapsConfig_DTMFeatureDiscoveryAllowRepeatPresentationPerLaunch, off_1014B3888))
      {
        v16 = sub_1004321BC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Will allow DTM suggestion to reappear for next route planning session", (uint8_t *)&v18, 2u);
        }

        self->_dismissed = 0;
      }
    }
    self->_transportType = a3;
    os_unfair_lock_unlock(p_lock);
    -[DTMFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
  }
}

- (int64_t)_fetchRepeatedRecentTransportType
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  void *i;
  id v11;
  __objc2_prot *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  DTMFeatureDiscoverySource *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t UInteger;
  NSObject *obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orderedRecents"));

  UInteger = GEOConfigGetUInteger(MapsConfig_DTMSuggestionMinimumNumberOfPreviousRoutes, off_1014B3898);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    obj = v5;
    v35 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
        v13 = objc_opt_class(HistoryEntryRecentsItem);
        v14 = v11;
        if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          v17 = self;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry"));
          v19 = objc_msgSend(v18, "conformsToProtocol:", v12);

          if (v19)
            v20 = v14;
          else
            v20 = 0;
          self = v17;
        }
        else
        {
          v20 = 0;
        }

        if (v20)
        {
          if (!self->_recentsCutoffDate
            || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "historyEntry")),
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "usageDate")),
                objc_msgSend(v22, "timeIntervalSinceDate:", self->_recentsCutoffDate),
                v24 = v23,
                v22,
                v21,
                v24 < 0.0))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "historyEntry"));
            v26 = objc_msgSend(v25, "transportType");

            if (v9)
            {
              if ((id)v9 != v26)
              {

                v9 = 0;
                v5 = obj;
                goto LABEL_30;
              }
            }
            else
            {
              v9 = (int64_t)v26;
            }
            if (++v8 == UInteger)
            {
              v27 = sub_1004321BC();
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                v41 = UInteger;
                v42 = 2048;
                v43 = v9;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "User has consistently (x%lu) requested routes of type: %ld", buf, 0x16u);
              }

              v5 = obj;
              v29 = obj;
              goto LABEL_33;
            }
          }
        }

      }
      v5 = obj;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
LABEL_30:

  v30 = sub_1004321BC();
  v29 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v31 = -[NSObject count](v5, "count");
    *(_DWORD *)buf = 134218496;
    v41 = v8;
    v42 = 2048;
    v43 = v9;
    v44 = 2048;
    v45 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "No clear pattern. hits: %lu repeatedTransportType: %ld numberOfRecents: %lu", buf, 0x20u);
  }
  v9 = 0;
LABEL_33:

  return v9;
}

- (FeatureDiscoveryModel)model
{
  os_unfair_lock_s *p_lock;
  FeatureDiscoveryModel *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_model;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    v5 = sub_1004321BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will create model on demand", v8, 2u);
    }

    v4 = (FeatureDiscoveryModel *)objc_claimAutoreleasedReturnValue(-[DTMFeatureDiscoverySource _bestModelForCurrentState](self, "_bestModelForCurrentState"));
    os_unfair_lock_lock(p_lock);
    objc_storeStrong((id *)&self->_model, v4);
    os_unfair_lock_unlock(p_lock);
  }
  return v4;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (id)_bestModelForCurrentState
{
  os_unfair_lock_s *p_lock;
  _BOOL4 dismissed;
  int64_t transportType;
  int64_t repeatedTransportType;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  _UNKNOWN **v14;
  id v15;
  FeatureDiscoveryModel *v16;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BOOL8 v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  int64_t v51;
  const __CFString *v52;
  FeatureDiscoveryModel *v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59[2];
  _QWORD v60[4];
  id v61[2];
  uint8_t buf[4];
  int64_t v63;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dismissed = self->_dismissed;
  transportType = self->_transportType;
  repeatedTransportType = self->_repeatedTransportType;
  os_unfair_lock_unlock(p_lock);
  if ((unint64_t)(transportType - 1) >= 5)
  {
    v10 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v63 = transportType;
      v9 = "Will not suggest DTM change: current transport type %lu is not applicable.";
LABEL_7:
      v11 = v8;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (dismissed)
  {
    v7 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Will not suggest DTM change: it was dismissed by user since app launch.";
LABEL_11:
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
LABEL_12:
      v13 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v9, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v14 = off_1011B72D0[transportType - 1];
  if (GEOConfigGetBOOL(MapsConfig_DTMForceHideFeatureDiscovery, off_1014B3878))
  {
    v15 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Will force hide DTM change suggestion.";
      goto LABEL_11;
    }
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("DTMFeatureDiscoveryAllowForTests"));

  if ((v19 & 1) == 0
    && +[MapsAppDelegate mapsIsLaunchedForTesting](MapsAppDelegate, "mapsIsLaunchedForTesting"))
  {
    v20 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "Will force hide DTM change suggestion: app was launched for testing.";
    goto LABEL_11;
  }
  v21 = objc_msgSend(v14, "integerValue");
  if (GEOConfigGetBOOL(MapsConfig_DTMForceShowFeatureDiscovery, off_1014B3868))
  {
    v22 = sub_1004321BC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Will force show DTM change suggestion.", buf, 2u);
    }

    goto LABEL_24;
  }
  v29 = -[DTMFeatureDiscoverySource _userPreviouslyDismissedTransportType:](self, "_userPreviouslyDismissedTransportType:", transportType);
  if (v29)
  {
    v30 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "Will not suggest DTM change: it was previously dismissed by user for this transport type.";
    goto LABEL_53;
  }
  if (!repeatedTransportType)
  {
    v32 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "Will not suggest DTM change: no pattern in recents.";
    goto LABEL_53;
  }
  if (repeatedTransportType != transportType)
  {
    v54 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v54);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "Will not suggest DTM change: pattern does not match current transport type.";
LABEL_53:
    v11 = v8;
    v12 = OS_LOG_TYPE_DEBUG;
    goto LABEL_12;
  }
  if (v21 == (id)GEOGetUserTransportTypePreference(v29))
  {
    v31 = sub_1004321BC();
    v8 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "Will not suggest DTM change: current matches preferred.";
    goto LABEL_53;
  }
LABEL_24:
  switch(-[DTMFeatureDiscoverySource transportType](self, "transportType"))
  {
    case 1:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Prefer Driving [Title, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Prefer Driving [Subtitle, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Prefer Driving [Action, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));
      break;
    case 2:
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Prefer Walking [Title, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Prefer Walking [Subtitle, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Prefer Walking [Action, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));
      break;
    case 3:
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Prefer Transit [Title, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Prefer Transit [Subtitle, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Prefer Transit [Action, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));
      break;
    case 4:
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Prefer Ride-Sharing [Title, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Prefer Ride-Sharing [Subtitle, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Prefer Ride-Sharing [Action, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));
      break;
    case 5:
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Prefer Cycling [Title, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Prefer Cycling [Subtitle, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Prefer Cycling [Action, Route Planning, Feature Discovery, DTM]"), CFSTR("localized string not found"), 0));
      break;
    default:
      v33 = sub_1004321BC();
      v8 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      v34 = -[DTMFeatureDiscoverySource transportType](self, "transportType");
      if ((unint64_t)(v34 - 1) > 4)
        v35 = CFSTR("Undefined");
      else
        v35 = *(&off_1011B72F8 + v34 - 1);
      *(_DWORD *)buf = 138412290;
      v63 = (int64_t)v35;
      v9 = "Will not suggest DTM change: unknown transport type %@";
      goto LABEL_7;
  }
  v44 = (void *)v28;

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v46 = objc_msgSend(v45, "userInterfaceIdiom") == (id)5;

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Change [Action, Route Planning, Feature Discovery, DTM"), CFSTR("localized string not found"), 0));

    v44 = (void *)v48;
  }
  v49 = sub_1004321BC();
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = -[DTMFeatureDiscoverySource transportType](self, "transportType");
    if ((unint64_t)(v51 - 1) > 4)
      v52 = CFSTR("Undefined");
    else
      v52 = *(&off_1011B72F8 + v51 - 1);
    *(_DWORD *)buf = 138412290;
    v63 = (int64_t)v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Will suggest DTM change to %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v53 = [FeatureDiscoveryModel alloc];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10044E700;
  v60[3] = &unk_1011B72B0;
  objc_copyWeak(v61, (id *)buf);
  v61[1] = v21;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10044E73C;
  v58[3] = &unk_1011B72B0;
  objc_copyWeak(v59, (id *)buf);
  v59[1] = v21;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10044E778;
  v56[3] = &unk_1011AD260;
  objc_copyWeak(&v57, (id *)buf);
  LOBYTE(v55) = 0;
  v16 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v53, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", 0, v8, v26, v44, v60, 0, v58, v56, v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(v59);
  objc_destroyWeak(v61);
  objc_destroyWeak((id *)buf);

LABEL_15:
  return v16;
}

- (void)_reloadAvailability
{
  void *v3;
  FeatureDiscoveryModel *model;
  id v5;
  FeatureDiscoveryModel *v6;
  unsigned int v7;
  FeatureDiscoveryModel *v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  id WeakRetained;
  int v16;
  __CFString *v17;
  __int16 v18;
  __CFString *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DTMFeatureDiscoverySource _bestModelForCurrentState](self, "_bestModelForCurrentState"));
  os_unfair_lock_lock(&self->_lock);
  model = self->_model;
  v5 = v3;
  v6 = (FeatureDiscoveryModel *)v5;
  if ((unint64_t)v5 | (unint64_t)model)
    v7 = objc_msgSend(v5, "isEqual:", model) ^ 1;
  else
    v7 = 0;

  v8 = self->_model;
  self->_model = v6;

  os_unfair_lock_unlock(&self->_lock);
  if ((v6 != 0) != (model != 0) || v7)
  {
    v9 = sub_1004321BC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      if (v7)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = v13;
      v16 = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Did update availability of DTM source to: %@, new model: %@", (uint8_t *)&v16, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "source:didUpdateAvailability:", self, v6 != 0);

  }
}

- (void)_didDisplayModelForPreference:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = sub_1004321BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Suggestion was displayed to change DTM", v11, 2u);
  }

  switch(a3)
  {
    case 0:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 64;
      goto LABEL_9;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 66;
      goto LABEL_9;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 65;
      goto LABEL_9;
    case 3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 71;
      goto LABEL_9;
    case 4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 2175;
LABEL_9:
      objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v10, v8, 0);

      break;
    default:
      return;
  }
}

- (void)_performDTMActionWithPreference:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int64_t v12;

  v5 = sub_1004321BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User accepted suggestion, changing DTM to %ld", (uint8_t *)&v11, 0xCu);
  }

  switch(a3)
  {
    case 0:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 68;
      goto LABEL_9;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 70;
      goto LABEL_9;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 69;
      goto LABEL_9;
    case 3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 72;
      goto LABEL_9;
    case 4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v8 = -[DTMFeatureDiscoverySource _targetForTransportType:](self, "_targetForTransportType:", self->_transportType);
      v9 = v7;
      v10 = 2180;
LABEL_9:
      objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v10, v8, 0);

      break;
    default:
      break;
  }
  GEOSetUserTransportTypePreference(a3);
  -[DTMFeatureDiscoverySource _performRemovalForTransportType](self, "_performRemovalForTransportType");
}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1004321BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User dismissed suggestion to change DTM", v5, 2u);
  }

  -[DTMFeatureDiscoverySource _recordDismissalForTransportType:](self, "_recordDismissalForTransportType:", -[DTMFeatureDiscoverySource _performRemovalForTransportType](self, "_performRemovalForTransportType"));
}

- (int64_t)_performRemovalForTransportType
{
  os_unfair_lock_s *p_lock;
  int64_t transportType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_dismissed = 1;
  transportType = self->_transportType;
  os_unfair_lock_unlock(p_lock);
  -[DTMFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
  return transportType;
}

- (BOOL)_userPreviouslyDismissedTransportType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PreferDTMDismissedTransportTypes")));

  if ((unint64_t)(a3 - 1) > 4)
  {
    v6 = 4;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v6 = dword_100E37358[a3 - 1];
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  v8 = objc_msgSend(v5, "containsObject:", v7);

LABEL_6:
  return v8;
}

- (void)_recordDismissalForTransportType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  int v17;
  const __CFString *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PreferDTMDismissedTransportTypes")));

  if (v5)
    v6 = (void *)v5;
  else
    v6 = &__NSArray0__struct;
  v7 = objc_msgSend(v6, "mutableCopy");
  if ((unint64_t)(a3 - 1) >= 5)
  {
    v12 = sub_1004321BC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = CFSTR("Bicycle");
      if (!a3)
        v14 = CFSTR("Undefined");
      v17 = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Will not record dimissal, transport type resolved to UNKNOWN (%@)", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v8 = dword_100E37358[a3 - 1];
    v9 = sub_1004321BC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 2) > 3)
        v11 = CFSTR("Drive");
      else
        v11 = *(&off_1011B7320 + a3 - 2);
      v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Recording user dismissal for DTM switch (%@)", (uint8_t *)&v17, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    objc_msgSend(v7, "addObject:", v15);

    v13 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = objc_msgSend(v7, "copy");
    -[NSObject setObject:forKey:](v13, "setObject:forKey:", v16, CFSTR("PreferDTMDismissedTransportTypes"));

  }
}

+ (void)resetAllPreviousDismissals
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_1004321BC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Resetting user dismissals for DTM switch", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("PreferDTMDismissedTransportTypes"));

}

- (int)_targetForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5)
    return 0;
  else
    return a3 + 300;
}

- (FeatureDiscoverySourceDelegate)delegate
{
  return (FeatureDiscoverySourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (int64_t)repeatedTransportType
{
  return self->_repeatedTransportType;
}

- (void)setRepeatedTransportType:(int64_t)a3
{
  self->_repeatedTransportType = a3;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentsCutoffDate, 0);
}

@end
