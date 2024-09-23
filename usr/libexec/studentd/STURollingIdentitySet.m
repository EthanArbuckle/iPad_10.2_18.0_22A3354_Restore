@implementation STURollingIdentitySet

- (STURollingIdentitySet)initWithActiveIdentityPersistentID:(id)a3 stagedIdentityPersistentID:(id)a4
{
  id v6;
  id v7;
  STURollingIdentitySet *v8;
  NSData *v9;
  NSData *activeIdentityPersistentID;
  NSData *v11;
  NSData *stagedIdentityPersistentID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STURollingIdentitySet;
  v8 = -[STURollingIdentitySet init](&v14, "init");
  if (v8)
  {
    v9 = (NSData *)objc_msgSend(v6, "copy");
    activeIdentityPersistentID = v8->_activeIdentityPersistentID;
    v8->_activeIdentityPersistentID = v9;

    v11 = (NSData *)objc_msgSend(v7, "copy");
    stagedIdentityPersistentID = v8->_stagedIdentityPersistentID;
    v8->_stagedIdentityPersistentID = v11;

  }
  return v8;
}

- (STURollingIdentitySet)init
{
  return -[STURollingIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:](self, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:", 0, 0);
}

- (id)dictionaryValue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("activeIdentityPersistentID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("stagedIdentityPersistentID"));

  v6 = -[NSMutableDictionary copy](v3, "copy");
  return v6;
}

- (STURollingIdentitySet)initWithDictionary:(id)a3
{
  id v4;
  STURollingIdentitySet *v5;
  uint64_t v6;
  NSData *activeIdentityPersistentID;
  uint64_t v8;
  NSData *stagedIdentityPersistentID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STURollingIdentitySet;
  v5 = -[STURollingIdentitySet init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeIdentityPersistentID")));
    activeIdentityPersistentID = v5->_activeIdentityPersistentID;
    v5->_activeIdentityPersistentID = (NSData *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stagedIdentityPersistentID")));
    stagedIdentityPersistentID = v5->_stagedIdentityPersistentID;
    v5->_stagedIdentityPersistentID = (NSData *)v8;

  }
  return v5;
}

- (id)commonNamePrefix
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STURollingIdentitySet.m"), 75, CFSTR("commonNamePrefix is an abstract method and should be overridden by subclasses"));

  return 0;
}

- (id)keychainGroup
{
  return CRKClassroomKeychainGroupIdentifier;
}

- (id)identityConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet commonNamePrefix](self, "commonNamePrefix"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v2, v4));

  v6 = objc_msgSend(objc_alloc((Class)CRKIdentityConfiguration), "initWithCommonName:", v5);
  return v6;
}

- (id)generateIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet identityConfiguration](self, "identityConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "makeIdentityWithConfiguration:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychainGroup](self, "keychainGroup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addIdentity:toAccessGroup:", v5, v7));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)testingDefaultIsEqualToString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("CERTIFICATE")));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if (v6 | v7)
    v8 = objc_msgSend((id)v6, "isEqual:", v7);
  else
    v8 = 1;

  return v8;
}

- (BOOL)shouldForceCreateStagedIdentity
{
  return -[STURollingIdentitySet testingDefaultIsEqualToString:](self, "testingDefaultIsEqualToString:", CFSTR("stage"));
}

- (BOOL)shouldForceExpireActiveIdentity
{
  return -[STURollingIdentitySet testingDefaultIsEqualToString:](self, "testingDefaultIsEqualToString:", CFSTR("expire"));
}

- (BOOL)isActiveIdentityValidObeyingOverride:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  if (a3 && -[STURollingIdentitySet shouldForceExpireActiveIdentity](self, "shouldForceExpireActiveIdentity"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identityWithPersistentID:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "validityDateInterval"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crk_dateIntervalByAddingTimeInterval:", -CRKDayInterval));
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "crk_containsCurrentDate");
  else
    v12 = 0;

  return v12;
}

- (BOOL)isTimeToStageIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  if (-[STURollingIdentitySet shouldForceCreateStagedIdentity](self, "shouldForceCreateStagedIdentity")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID")),
        v3,
        !v3))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identityWithPersistentID:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "certificate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "validityDateInterval"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crk_dateIntervalByAddingTimeInterval:", -CRKHalfYearInterval));
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "crk_containsCurrentDate") ^ 1;
    else
      LOBYTE(v11) = 1;

  }
  return v11;
}

- (BOOL)coerceIdentitySetToSteadyState
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 0;
LABEL_3:

    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));

  if (!v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet generateIdentity](self, "generateIdentity"));
    -[STURollingIdentitySet setActiveIdentityPersistentID:](self, "setActiveIdentityPersistentID:", v4);
    v5 = 1;
    goto LABEL_3;
  }
  v5 = 0;
LABEL_6:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));

  if (!v7)
  {
    -[STURollingIdentitySet promoteStagedIdentityToActiveIdentity](self, "promoteStagedIdentityToActiveIdentity");
    return 1;
  }
  return v5;
}

- (void)promoteStagedIdentityToActiveIdentity
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));

  if (v3)
  {
    v4 = sub_100075178();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Promoting staged identity. Removing active identity", v9, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
    objc_msgSend(v6, "removeItemWithPersistentID:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
  -[STURollingIdentitySet setActiveIdentityPersistentID:](self, "setActiveIdentityPersistentID:", v8);

  -[STURollingIdentitySet setStagedIdentityPersistentID:](self, "setStagedIdentityPersistentID:", 0);
}

- (void)createFreshActiveIdentityIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));

  if (!v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet generateIdentity](self, "generateIdentity"));
    -[STURollingIdentitySet setActiveIdentityPersistentID:](self, "setActiveIdentityPersistentID:", v4);

  }
}

- (id)keychain
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keychain"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STURollingIdentitySet *v8;
  STURollingIdentitySet *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  STURollingIdentitySet *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("activeIdentityPersistentID, stagedIdentityPersistentID"), "componentsSeparatedByString:", CFSTR(",")));
  v6 = objc_msgSend(v5, "mutableCopy");

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100075700;
  v28[3] = &unk_1000C9E08;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (STURollingIdentitySet *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[STURollingIdentitySet isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v17 = v9;
          v18 = objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet valueForKey:](v8, "valueForKey:", v16));
          v19 = objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet valueForKey:](v17, "valueForKey:", v16));

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](self, "activeIdentityPersistentID"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)refreshIdentities
{
  BOOL v3;
  uint64_t v4;
  void *v5;

  v3 = -[STURollingIdentitySet coerceIdentitySetToSteadyState](self, "coerceIdentitySetToSteadyState");
  if (!-[STURollingIdentitySet isActiveIdentityValidObeyingOverride:](self, "isActiveIdentityValidObeyingOverride:", 1))
  {
    -[STURollingIdentitySet promoteStagedIdentityToActiveIdentity](self, "promoteStagedIdentityToActiveIdentity");
    if (!-[STURollingIdentitySet isActiveIdentityValidObeyingOverride:](self, "isActiveIdentityValidObeyingOverride:", 0))-[STURollingIdentitySet promoteStagedIdentityToActiveIdentity](self, "promoteStagedIdentityToActiveIdentity");
    -[STURollingIdentitySet createFreshActiveIdentityIfNeeded](self, "createFreshActiveIdentityIfNeeded");
    v3 = 1;
  }
  v4 = objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
  if (v4)
  {
    v5 = (void *)v4;
LABEL_9:

    return v3;
  }
  if (-[STURollingIdentitySet isTimeToStageIdentity](self, "isTimeToStageIdentity"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet generateIdentity](self, "generateIdentity"));
    -[STURollingIdentitySet setStagedIdentityPersistentID:](self, "setStagedIdentityPersistentID:", v5);
    v3 = 1;
    goto LABEL_9;
  }
  return v3;
}

- (void)flushStagedIdentity
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));

  if (v3)
  {
    v4 = sub_100075178();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Flushing staged identity", v8, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet keychain](self, "keychain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](self, "stagedIdentityPersistentID"));
    objc_msgSend(v6, "removeItemWithPersistentID:", v7);

    -[STURollingIdentitySet setStagedIdentityPersistentID:](self, "setStagedIdentityPersistentID:", 0);
  }
}

- (NSData)activeIdentityPersistentID
{
  return self->_activeIdentityPersistentID;
}

- (void)setActiveIdentityPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)stagedIdentityPersistentID
{
  return self->_stagedIdentityPersistentID;
}

- (void)setStagedIdentityPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedIdentityPersistentID, 0);
  objc_storeStrong((id *)&self->_activeIdentityPersistentID, 0);
}

@end
