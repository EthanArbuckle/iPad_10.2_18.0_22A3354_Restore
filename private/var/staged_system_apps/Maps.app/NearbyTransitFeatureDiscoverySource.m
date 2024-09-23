@implementation NearbyTransitFeatureDiscoverySource

- (NearbyTransitFeatureDiscoverySource)init
{
  NearbyTransitFeatureDiscoveryDataStore *v3;
  NearbyTransitFeatureDiscoverySource *v4;

  v3 = objc_alloc_init(NearbyTransitFeatureDiscoveryDataStore);
  v4 = -[NearbyTransitFeatureDiscoverySource initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (NearbyTransitFeatureDiscoverySource)initWithDataStore:(id)a3
{
  id v5;
  NearbyTransitFeatureDiscoverySource *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *mapsSuggestionsHomeFeatureDiscoveryQueue;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NearbyTransitFeatureDiscoverySource;
  v6 = -[NearbyTransitFeatureDiscoverySource init](&v14, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.Maps.home.mapsSuggestions", v8);
    mapsSuggestionsHomeFeatureDiscoveryQueue = v6->_mapsSuggestionsHomeFeatureDiscoveryQueue;
    v6->_mapsSuggestionsHomeFeatureDiscoveryQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_dataStore, a3);
    v6->_addedFavorite = -[NearbyTransitFeatureDiscoveryDataStore hasUserEverAddedFavorite](v6->_dataStore, "hasUserEverAddedFavorite");
    v6->_showFeature = 0;
    v6->_hasInitialData = -[NearbyTransitFeatureDiscoveryDataStore hasUserEverAddedFavorite](v6->_dataStore, "hasUserEverAddedFavorite");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    LODWORD(v8) = objc_msgSend(v11, "isInternalInstall");

    if ((_DWORD)v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v6->_shouldForceTransitUser = objc_msgSend(v12, "BOOLForKey:", CFSTR("__internal__NearbyTransitDebugForceTransitUser"));

    }
    else
    {
      v6->_shouldForceTransitUser = 0;
    }
  }

  return v6;
}

- (BOOL)_isUserEligibleForNotification
{
  _BOOL4 v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  const char *v13;
  id v14;
  void *v15;
  NSString *v16;
  id v17;
  void *v18;
  NSString *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = -[NearbyTransitFeatureDiscoverySource hasInitialData](self, "hasInitialData");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
    v6 = objc_msgSend(v5, "hasUserEverAddedFavorite");

    if (v6)
    {
      v7 = sub_100431CEC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_opt_class(self);
        v10 = v9;
        v11 = NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v21 = 138412546;
        v22 = v9;
        v23 = 2112;
        v24 = v12;
        v13 = "%@ %@: _isUserEligibleForNotification: user either currently has or previously had the favorite";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 0x16u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (-[NearbyTransitFeatureDiscoverySource hasDismissedNotificationRecently](self, "hasDismissedNotificationRecently"))
    {
      v14 = sub_100431CEC();
      v8 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_opt_class(self);
        v10 = v15;
        v16 = NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v21 = 138412546;
        v22 = v15;
        v23 = 2112;
        v24 = v12;
        v13 = "%@ %@: _isUserEligibleForNotification: tip was dismissed too recently";
        goto LABEL_11;
      }
LABEL_12:

      LOBYTE(v4) = 0;
      return v4;
    }
    if (-[NearbyTransitFeatureDiscoverySource hasUserIgnoredTipTooMuch](self, "hasUserIgnoredTipTooMuch"))
    {
      v17 = sub_100431CEC();
      v8 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v18 = (void *)objc_opt_class(self);
        v10 = v18;
        v19 = NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = 138412546;
        v22 = v18;
        v23 = 2112;
        v24 = v12;
        v13 = "%@ %@: _isUserEligibleForNotification: tip has been displayed too much with no user activity";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active && a3)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (void)_updateShouldShowFeature
{
  -[NearbyTransitFeatureDiscoverySource setShowFeature:](self, "setShowFeature:", -[NearbyTransitFeatureDiscoverySource _shouldShowNearbyTransitBanner](self, "_shouldShowNearbyTransitBanner"));
}

- (void)setShowFeature:(BOOL)a3
{
  if (self->_showFeature != a3)
  {
    self->_showFeature = a3;
    -[NearbyTransitFeatureDiscoverySource _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setAddedFavorite:(BOOL)a3
{
  if (self->_addedFavorite != a3)
  {
    self->_addedFavorite = a3;
    if (a3)
      -[NearbyTransitFeatureDiscoveryDataStore setUserEverAddedFavorite:](self->_dataStore, "setUserEverAddedFavorite:", 1);
    -[NearbyTransitFeatureDiscoverySource _updateShouldShowFeature](self, "_updateShouldShowFeature");
  }
}

- (void)setTransitUserHere:(BOOL)a3
{
  if (self->_transitUserHere != a3)
  {
    self->_transitUserHere = a3;
    -[NearbyTransitFeatureDiscoverySource _updateShouldShowFeature](self, "_updateShouldShowFeature");
  }
}

- (void)setHasInitialData:(BOOL)a3
{
  if (self->_hasInitialData != a3)
  {
    self->_hasInitialData = a3;
    -[NearbyTransitFeatureDiscoverySource _updateShouldShowFeature](self, "_updateShouldShowFeature");
    -[NearbyTransitFeatureDiscoverySource updateFeatureAvailabilityIfNecessary](self, "updateFeatureAvailabilityIfNecessary");
    -[NearbyTransitFeatureDiscoverySource _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    -[NearbyTransitFeatureDiscoverySource updateFeatureAvailabilityIfNecessary](self, "updateFeatureAvailabilityIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:", self);

      -[NearbyTransitFeatureDiscoverySource _checkForExistingNearbyTransitFavorite](self, "_checkForExistingNearbyTransitFavorite");
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);

    }
  }
}

- (void)updateFeatureAvailabilityIfNecessary
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  if (self->_active)
  {
    if (-[NearbyTransitFeatureDiscoverySource _isUserEligibleForNotification](self, "_isUserEligibleForNotification"))
      -[NearbyTransitFeatureDiscoverySource _updateIsTransitUserHere](self, "_updateIsTransitUserHere");
  }
  else
  {
    v4 = sub_100431CEC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_opt_class(self);
      v7 = v6;
      v8 = NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@: Exiting early since the source is inactive", (uint8_t *)&v10, 0x16u);

    }
  }
}

- (BOOL)_shouldShowNearbyTransitBanner
{
  _BOOL4 v3;

  v3 = -[NearbyTransitFeatureDiscoverySource _isUserEligibleForNotification](self, "_isUserEligibleForNotification");
  if (v3)
  {
    if (-[NearbyTransitFeatureDiscoverySource isTransitUserHere](self, "isTransitUserHere"))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = -[NearbyTransitFeatureDiscoverySource shouldForceTransitUser](self, "shouldForceTransitUser");
  }
  return v3;
}

- (void)_checkForExistingNearbyTransitFavorite
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v4 = objc_msgSend(v3, "hasUserEverAddedFavorite");

  if (v4)
  {
    -[NearbyTransitFeatureDiscoverySource setAddedFavorite:](self, "setAddedFavorite:", 1);
    -[NearbyTransitFeatureDiscoverySource setHasInitialData:](self, "setHasInitialData:", 1);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meCard"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortcutsForAll"));
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100333A6C;
      v8[3] = &unk_1011B2138;
      v8[4] = &v9;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
      -[NearbyTransitFeatureDiscoverySource setAddedFavorite:](self, "setAddedFavorite:", *((unsigned __int8 *)v10 + 24));
      -[NearbyTransitFeatureDiscoverySource setHasInitialData:](self, "setHasInitialData:", 1);
      _Block_object_dispose(&v9, 8);

    }
  }
}

- (void)_updateIsTransitUserHere
{
  NSObject *mapsSuggestionsHomeFeatureDiscoveryQueue;
  _QWORD v5[5];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  mapsSuggestionsHomeFeatureDiscoveryQueue = self->_mapsSuggestionsHomeFeatureDiscoveryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100333B94;
  v5[3] = &unk_1011B2160;
  v5[4] = self;
  v6[1] = (id)a2;
  objc_copyWeak(v6, &location);
  dispatch_async(mapsSuggestionsHomeFeatureDiscoveryQueue, v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (BOOL)hasUserIgnoredTipTooMuch
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  unint64_t UInteger;
  void *v12;
  void *v13;
  unint64_t v14;

  if (-[NearbyTransitFeatureDiscoverySource hasRecordedSession](self, "hasRecordedSession"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v4 = objc_msgSend(v3, "hasUserEverAddedFavorite");

  if ((v4 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v7 = objc_msgSend(v6, "numberOfTimesDismissed");

  if (v7)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v10 = objc_msgSend(v9, "numberOfSessionsShown");

  UInteger = GEOConfigGetUInteger(MapsConfig_NearbyTransitTipMinInactiveSessionCount, off_1014B40C8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "initialTipDisplayDate"));

  if (v13)
  {
    v14 = -[NearbyTransitFeatureDiscoverySource _daysSinceDate:](self, "_daysSinceDate:", v13);
    v5 = v14 > GEOConfigGetUInteger(MapsConfig_NearbyTransitTipInactiveDaysToShow, off_1014B40B8)
      && (unint64_t)v10 > UInteger;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_daysSinceDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v3, v5, 0));

  v7 = (uint64_t)objc_msgSend(v6, "day");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;

  return v8;
}

- (BOOL)hasDismissedNotificationRecently
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v4 = objc_msgSend(v3, "numberOfTimesDismissed");

  if (!v4)
    return 0;
  if ((unint64_t)v4 >= GEOConfigGetUInteger(MapsConfig_NearbyTransitTipMaxDismissalCount, off_1014B40A8))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastDismissedDate"));

  if (v6)
  {
    v7 = -[NearbyTransitFeatureDiscoverySource _daysSinceDate:](self, "_daysSinceDate:", v6);
    v8 = v7 < GEOConfigGetUInteger(MapsConfig_NearbyTransitDaysToResetTipDismissal, off_1014B4098);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dismissedTipNotification
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoverySource dataStore](self, "dataStore"));
  objc_msgSend(v3, "userDismissedTip");

  -[NearbyTransitFeatureDiscoverySource _updateShouldShowFeature](self, "_updateShouldShowFeature");
}

- (id)discoveryModelWithActionHandler:(id)a3 displayHandler:(id)a4 cancelHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  FeatureDiscoveryModel *v25;
  id v26;
  id v27;
  id v28;
  FeatureDiscoveryModel *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  SEL v36;
  _QWORD v37[5];
  id v38;
  SEL v39;
  _QWORD v40[5];
  id v41;
  SEL v42;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Feature Discoverability] Nearby Transit title"), CFSTR("localized string not found"), 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Feature Discoverability]  Nearby Transit  description"), CFSTR("localized string not found"), 0));

  LODWORD(v13) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = v14;
  if ((_DWORD)v13)
    v16 = CFSTR("[Feature Discoverability] Nearby Transit action - pin");
  else
    v16 = CFSTR("[Feature Discoverability] Nearby Transit action - add to favorites");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes nearbyTransitStyleAttributes](GEOFeatureStyleAttributes, "nearbyTransitStyleAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "scale");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "traitCollection"));
  v23 = objc_msgSend(v22, "userInterfaceStyle") == (id)2;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v18, 4, 0, v23, v21));
  v25 = [FeatureDiscoveryModel alloc];
  v39 = a2;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100334344;
  v40[3] = &unk_1011B2188;
  v41 = v9;
  v42 = a2;
  v40[4] = self;
  v36 = a2;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100334440;
  v37[3] = &unk_1011B2188;
  v37[4] = self;
  v38 = v10;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10033456C;
  v34[3] = &unk_1011B2188;
  v34[4] = self;
  v35 = v11;
  v26 = v11;
  v27 = v10;
  v28 = v9;
  LOBYTE(v31) = 0;
  v29 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v25, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v24, v33, v32, v17, v40, 0, v37, v34, v31);

  return v29;
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
  -[NearbyTransitFeatureDiscoverySource _checkForExistingNearbyTransitFavorite](self, "_checkForExistingNearbyTransitFavorite", a3);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)shouldShowFeature
{
  return self->_showFeature;
}

- (BOOL)hasAddedFavorite
{
  return self->_addedFavorite;
}

- (BOOL)hasRecordedSession
{
  return self->_recordedSession;
}

- (void)setRecordedSession:(BOOL)a3
{
  self->_recordedSession = a3;
}

- (NearbyTransitFeatureDiscoveryDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (BOOL)isTransitUserHere
{
  return self->_transitUserHere;
}

- (BOOL)shouldForceTransitUser
{
  return self->_shouldForceTransitUser;
}

- (void)setShouldForceTransitUser:(BOOL)a3
{
  self->_shouldForceTransitUser = a3;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsHomeFeatureDiscoveryQueue, 0);
}

@end
