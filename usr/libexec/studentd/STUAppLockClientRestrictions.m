@implementation STUAppLockClientRestrictions

- (STUAppLockClientRestrictions)init
{
  return -[STUAppLockClientRestrictions initWithBundleIdentifiers:](self, "initWithBundleIdentifiers:", 0);
}

- (STUAppLockClientRestrictions)initWithBundleIdentifiers:(id)a3
{
  id v4;
  STUAppLockClientRestrictions *v5;
  NSArray *v6;
  NSArray *mBundleIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUAppLockClientRestrictions;
  v5 = -[STUAppLockClientRestrictions init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    mBundleIdentifiers = v5->mBundleIdentifiers;
    v5->mBundleIdentifiers = v6;

  }
  return v5;
}

- (BOOL)applyWithError:(id *)a3
{
  if (-[NSArray count](self->mBundleIdentifiers, "count"))
    return -[STUAppLockClientRestrictions applyRestrictionsWithError:](self, "applyRestrictionsWithError:", a3);
  else
    return -[STUAppLockClientRestrictions clearRestrictionsWithError:](self, "clearRestrictionsWithError:", a3);
}

- (BOOL)clearRestrictionsWithError:(id *)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = objc_msgSend(v4, "applyRestrictionDictionary:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", 0, 0, CRKRestrictionClientIdentifier, CRKRestrictionClientAppLockIdentifier, 0, 0, 0, 0, a3);

  if (v5)
    notify_post((const char *)objc_msgSend(MCProfileListChangedNotification, "UTF8String"));
  return v5;
}

- (BOOL)applyRestrictionsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL result;
  uint64_t v10;
  id v11;
  char v12;

  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions restrictionDictionary](self, "restrictionDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions appsAndOptions](self, "appsAndOptions"));
  v8 = objc_msgSend(v5, "applyRestrictionDictionary:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v6, v7, CRKRestrictionClientIdentifier, CRKRestrictionClientAppLockIdentifier, 0, 0, 0, &v12, a3);

  result = 0;
  if (v8)
  {
    if (v12)
    {
      notify_post((const char *)objc_msgSend(MCProfileListChangedNotification, "UTF8String"));
      return 1;
    }
    else if (a3)
    {
      v10 = CATErrorWithCodeAndUserInfo(1, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      result = 0;
      *a3 = v11;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)restrictionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  if (!-[NSArray count](self->mBundleIdentifiers, "count"))
    return 0;
  v7[0] = MCIntersectionKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions intersections](self, "intersections"));
  v8[0] = v3;
  v7[1] = MCRestrictedBoolKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions restrictedBools](self, "restrictedBools"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  return v5;
}

- (id)intersections
{
  NSArray *mBundleIdentifiers;
  void *v3;
  void *v4;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  void *v9;

  v8 = MCFeatureAppLockBundleIDs;
  mBundleIdentifiers = self->mBundleIdentifiers;
  v6 = MCIntersectionValuesKey;
  v7 = mBundleIdentifiers;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  return v4;
}

- (id)restrictedBools
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = MCRestrictedBoolValueKey;
  v5 = MCRestrictedBoolPreferenceKey;
  v12[0] = MCRestrictedBoolValueKey;
  v12[1] = MCRestrictedBoolPreferenceKey;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("SpringBoardShouldConsiderAppAllowlistAsTransient"));

  if ((id)-[NSArray count](self->mBundleIdentifiers, "count") == (id)1)
  {
    v10[0] = v4;
    v10[1] = v5;
    v11[0] = &__kCFBooleanFalse;
    v11[1] = &__kCFBooleanFalse;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, MCFeatureAppLockMultipleAppsAllowed);

  }
  v8 = -[NSMutableDictionary copy](v3, "copy");

  return v8;
}

- (id)appsAndOptions
{
  void *v3;
  NSArray *mBundleIdentifiers;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  if (!-[NSArray count](self->mBundleIdentifiers, "count"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions userEnabledOptions](self, "userEnabledOptions"));
  mBundleIdentifiers = self->mBundleIdentifiers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E7EC;
  v8[3] = &unk_1000CA140;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray crk_mapUsingBlock:](mBundleIdentifiers, "crk_mapUsingBlock:", v8));

  return v6;
}

- (id)userEnabledOptions
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockClientRestrictions userEnabledOptionKeys](self, "userEnabledOptionKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = -[NSMutableDictionary copy](v3, "copy");
  return v9;
}

- (id)userEnabledOptionKeys
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_whitelistUserEnabledOptionKeysEnabledInSettings"));
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_allWhitelistUserEnabledOptionKeys"));
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBundleIdentifiers, 0);
}

@end
