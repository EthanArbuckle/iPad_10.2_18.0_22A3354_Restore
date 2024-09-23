@implementation PedestrianARSessionUsageTracker

+ (PedestrianARSessionUsageTracker)sharedInstance
{
  if (qword_1014D4538 != -1)
    dispatch_once(&qword_1014D4538, &stru_1011E9980);
  return (PedestrianARSessionUsageTracker *)(id)qword_1014D4530;
}

- (PedestrianARSessionUsageTracker)init
{
  PedestrianARSessionUsageTracker *v2;
  uint64_t v3;
  NSMutableDictionary *enteredEntryPointToRouteIDs;
  uint64_t v5;
  NSMutableSet *localizedRouteIDs;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PedestrianARSessionUsageTracker;
  v2 = -[PedestrianARSessionUsageTracker init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    enteredEntryPointToRouteIDs = v2->_enteredEntryPointToRouteIDs;
    v2->_enteredEntryPointToRouteIDs = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    localizedRouteIDs = v2->_localizedRouteIDs;
    v2->_localizedRouteIDs = (NSMutableSet *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("kPedestrianARSessionUsageLocalizationSuccessKey"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("kPedestrianARSessionUsageLocalizationSuccessKey"));

      -[PedestrianARSessionUsageTracker setNumberOfTimesARLocalized:](v2, "setNumberOfTimesARLocalized:", (char *)-[PedestrianARSessionUsageTracker numberOfTimesARLocalized](v2, "numberOfTimesARLocalized") + 1);
    }
  }
  return v2;
}

- (BOOL)hasUserEnteredAR
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kPedestrianARSessionUsageARWasEnteredKey")));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAREverLocalized
{
  return -[PedestrianARSessionUsageTracker numberOfTimesARLocalized](self, "numberOfTimesARLocalized") > 0;
}

- (int64_t)numberOfTimesARLocalized
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("kPedestrianARSessionUsageLocalizationSuccessCountKey"));

  return (int64_t)v3;
}

- (void)setNumberOfTimesARLocalized:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("kPedestrianARSessionUsageLocalizationSuccessCountKey"));

}

- (BOOL)hasARElementRendered
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPedestrianARSessionUsageARElementRenderedKey"));

  return v3;
}

- (void)registerUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PedestrianARSessionUsageTracker *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  int v24;
  id v25;

  v6 = a3;
  v7 = sub_100C3B508();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Registering user entered AR for route: %@", (uint8_t *)&v24, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v9, "enteredEntryPointToRouteIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = v14;

  objc_msgSend(v15, "addObject:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v9, "enteredEntryPointToRouteIDs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v16, "setObject:forKey:", v15, v17);

  objc_sync_exit(v9);
  v18 = NSStringFromSelector("hasUserEnteredAR");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](v9, "willChangeValueForKey:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("kPedestrianARSessionUsageARWasEnteredKey"));

  v22 = NSStringFromSelector("hasUserEnteredAR");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](v9, "didChangeValueForKey:", v23);

}

- (BOOL)hasUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4
{
  id v6;
  PedestrianARSessionUsageTracker *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v7, "enteredEntryPointToRouteIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
  v11 = objc_msgSend(v10, "containsObject:", v6);

  objc_sync_exit(v7);
  return v11;
}

- (void)registerLocalizationSuccessForRoute:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  PedestrianARSessionUsageTracker *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = sub_100C3B508();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering localization success for route: %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = NSStringFromSelector("numberOfTimesARLocalized");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v8);

  v9 = self;
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker localizedRouteIDs](v9, "localizedRouteIDs"));
  objc_msgSend(v10, "addObject:", v4);

  -[PedestrianARSessionUsageTracker setNumberOfTimesARLocalized:](v9, "setNumberOfTimesARLocalized:", (char *)-[PedestrianARSessionUsageTracker numberOfTimesARLocalized](v9, "numberOfTimesARLocalized") + 1);
  objc_sync_exit(v9);

  v11 = NSStringFromSelector("numberOfTimesARLocalized");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](v9, "didChangeValueForKey:", v12);

}

- (BOOL)hasAREverLocalizedForRoute:(id)a3
{
  id v4;
  PedestrianARSessionUsageTracker *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker localizedRouteIDs](v5, "localizedRouteIDs"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  objc_sync_exit(v5);
  return v7;
}

- (void)registerARElementRendered
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100C3B508();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Registering AR element rendered", v10, 2u);
  }

  v5 = NSStringFromSelector("hasARElementRendered");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setBool:forKey:", 1, CFSTR("kPedestrianARSessionUsageARElementRenderedKey"));

  v8 = NSStringFromSelector("hasARElementRendered");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)migrateUsageFromRoute:(id)a3 toRoute:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  PedestrianARSessionUsageTracker *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = sub_100C3B508();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v30 = 138412546;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Migrating usage flags from %@ to %@", (uint8_t *)&v30, 0x16u);
  }

  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker localizedRouteIDs](v10, "localizedRouteIDs"));
  v12 = objc_msgSend(v11, "containsObject:", v6);

  if (v12)
  {
    v13 = sub_100C3B508();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Migrating localized flag", (uint8_t *)&v30, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker localizedRouteIDs](v10, "localizedRouteIDs"));
    objc_msgSend(v15, "addObject:", v7);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v10, "enteredEntryPointToRouteIDs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", &off_1012712F0));
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if (v18)
  {
    v19 = sub_100C3B508();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Migrating route planning entry flag", (uint8_t *)&v30, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v10, "enteredEntryPointToRouteIDs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", &off_1012712F0));
    objc_msgSend(v22, "addObject:", v7);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v10, "enteredEntryPointToRouteIDs"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", &off_101271308));
  v25 = objc_msgSend(v24, "containsObject:", v6);

  if (v25)
  {
    v26 = sub_100C3B508();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Migrating navigation entry flag", (uint8_t *)&v30, 2u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v10, "enteredEntryPointToRouteIDs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", &off_101271308));
    objc_msgSend(v29, "addObject:", v7);

  }
  objc_sync_exit(v10);

}

- (void)clearAll
{
  -[PedestrianARSessionUsageTracker clearUserEnteredARFlag](self, "clearUserEnteredARFlag");
  -[PedestrianARSessionUsageTracker clearARLocalizationsFlag](self, "clearARLocalizationsFlag");
  -[PedestrianARSessionUsageTracker clearARElementRenderedFlag](self, "clearARElementRenderedFlag");
}

- (void)clearUserEnteredARFlag
{
  id v3;
  NSObject *v4;
  PedestrianARSessionUsageTracker *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint8_t v12[16];

  v3 = sub_100C3B508();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing user entered AR flag", v12, 2u);
  }

  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker enteredEntryPointToRouteIDs](v5, "enteredEntryPointToRouteIDs"));
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v5);
  v7 = NSStringFromSelector("hasUserEnteredAR");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](v5, "willChangeValueForKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("kPedestrianARSessionUsageARWasEnteredKey"));

  v10 = NSStringFromSelector("hasUserEnteredAR");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](v5, "didChangeValueForKey:", v11);

}

- (void)clearARLocalizationsFlag
{
  id v3;
  NSObject *v4;
  PedestrianARSessionUsageTracker *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint8_t v12[16];

  v3 = sub_100C3B508();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing AR localizations flag", v12, 2u);
  }

  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionUsageTracker localizedRouteIDs](v5, "localizedRouteIDs"));
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v5);
  v7 = NSStringFromSelector("hasAREverLocalized");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](v5, "willChangeValueForKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("kPedestrianARSessionUsageLocalizationSuccessCountKey"));

  v10 = NSStringFromSelector("hasAREverLocalized");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](v5, "didChangeValueForKey:", v11);

}

- (void)clearARElementRenderedFlag
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100C3B508();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing user entered VLF flag", v10, 2u);
  }

  v5 = NSStringFromSelector("hasARElementRendered");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PedestrianARSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kPedestrianARSessionUsageARElementRenderedKey"));

  v8 = NSStringFromSelector("hasARElementRendered");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[PedestrianARSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  unsigned __int8 v9;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  NSString *v14;
  void *v15;
  unsigned __int8 v16;
  objc_super v17;

  v4 = a3;
  v5 = NSStringFromSelector("hasUserEnteredAR");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (objc_msgSend(v4, "isEqualToString:", v6))
    goto LABEL_4;
  v7 = NSStringFromSelector("numberOfTimesARLocalized");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(v4, "isEqualToString:", v8))
  {

LABEL_4:
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v11 = NSStringFromSelector("hasARElementRendered");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v4, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_5;
  v14 = NSStringFromSelector("hasAREverLocalized");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v4, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___PedestrianARSessionUsageTracker;
    v9 = objc_msgSendSuper2(&v17, "automaticallyNotifiesObserversForKey:", v4);
  }
LABEL_6:

  return v9;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  unsigned int v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v5 = NSStringFromSelector("hasAREverLocalized");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = NSStringFromSelector("numberOfTimesARLocalized");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));

  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___PedestrianARSessionUsageTracker;
    v11 = objc_msgSendSuper2(&v13, "keyPathsForValuesAffectingValueForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

- (NSMutableDictionary)enteredEntryPointToRouteIDs
{
  return self->_enteredEntryPointToRouteIDs;
}

- (void)setEnteredEntryPointToRouteIDs:(id)a3
{
  objc_storeStrong((id *)&self->_enteredEntryPointToRouteIDs, a3);
}

- (NSMutableSet)localizedRouteIDs
{
  return self->_localizedRouteIDs;
}

- (void)setLocalizedRouteIDs:(id)a3
{
  objc_storeStrong((id *)&self->_localizedRouteIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedRouteIDs, 0);
  objc_storeStrong((id *)&self->_enteredEntryPointToRouteIDs, 0);
}

@end
