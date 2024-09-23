@implementation MCAppEnforcedRestrictions

+ (id)restrictionEnforcingApps
{
  if (qword_1000FD9F0 != -1)
    dispatch_once(&qword_1000FD9F0, &stru_1000E43D0);
  return (id)qword_1000FD9E8;
}

+ (id)enforcedRestrictionsForBundleID:(id)a3
{
  return +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:countryCode:](MCAppEnforcedRestrictions, "enforcedRestrictionsForBundleID:countryCode:", a3, 0);
}

+ (id)enforcedRestrictionsForBundleID:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "restrictionEnforcingApps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("MCRestrictions.plist")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictionUtilities enforcedRestrictionsForBundleID:restrictionPlistURL:countryCodes:](MCAppEnforcedRestrictionUtilities, "enforcedRestrictionsForBundleID:restrictionPlistURL:countryCodes:", v6, v12, v8));
    }
    else
    {
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v17 = 138543362;
        v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find restriction plist for app “%{public}@”", (uint8_t *)&v17, 0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Attempted to enforce restrictions for unhandled app “%{public}@”", (uint8_t *)&v17, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)setOfActiveRestrictionUUIDs
{
  return +[MCAppEnforcedRestrictions setOfActiveRestrictionUUIDsForCountryCode:](MCAppEnforcedRestrictions, "setOfActiveRestrictionUUIDsForCountryCode:", 0);
}

+ (id)setOfActiveRestrictionUUIDsForCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictions restrictionEnforcingApps](MCAppEnforcedRestrictions, "restrictionEnforcingApps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:countryCode:](MCAppEnforcedRestrictions, "enforcedRestrictionsForBundleID:countryCode:", v10, v3));
        if (objc_msgSend(v11, "count"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:](MCAppEnforcedRestrictionUtilities, "clientUUIDForBundleID:", v10));
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
