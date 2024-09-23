@implementation DMDPolicyPersistence

- (void)addRegistration:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMDPolicyPersistence *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003D28;
  v9[3] = &unk_1000BBB18;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v6;
  v8 = v12;
  -[DMDPolicyPersistence _performRegistrationBackgroundTask:](self, "_performRegistrationBackgroundTask:", v9);

}

- (void)_performRegistrationBackgroundTask:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = 0;
  v5 = -[DMDPolicyPersistence _loadPersistentStoreIfNeeded:](self, "_loadPersistentStoreIfNeeded:", &v11);
  v6 = v11;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005418;
    v8[3] = &unk_1000BB380;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence registrationContext](self, "registrationContext"));
    v10 = v4;
    v7 = v9;
    objc_msgSend(v7, "performBlock:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

- (void)requestPoliciesForTypes:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMDPolicyPersistence *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004494;
  v9[3] = &unk_1000BBB18;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v6;
  v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);

}

- (BOOL)_loadPersistentStoreIfNeeded:(id *)a3
{
  id v5;
  BOOL v6;
  char v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10005AD6C;
  v16 = sub_10005AD7C;
  v17 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence persistentContainer](self, "persistentContainer"));
  objc_sync_enter(v5);
  if (!-[DMDPolicyPersistence isPersistentContainerLoaded](self, "isPersistentContainerLoaded"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005AD84;
    v9[3] = &unk_1000BBAF0;
    v11 = &v12;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v10, "loadPersistentStoresWithCompletionHandler:", v9);

  }
  v6 = -[DMDPolicyPersistence isPersistentContainerLoaded](self, "isPersistentContainerLoaded");
  objc_sync_exit(v5);

  if (a3)
    v7 = v6;
  else
    v7 = 1;
  if ((v7 & 1) == 0)
    *a3 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)isPersistentContainerLoaded
{
  return self->_isPersistentContainerLoaded;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)_performBackgroundTask:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  NSMapTable *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v15 = 0;
  v5 = -[DMDPolicyPersistence _loadPersistentStoreIfNeeded:](self, "_loadPersistentStoreIfNeeded:", &v15);
  v6 = v15;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    if (v7)
    {
      v8 = self->_contextsByXPCConnection;
      objc_sync_enter(v8);
      v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_contextsByXPCConnection, "objectForKey:", v7));
      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence persistentContainer](self, "persistentContainer"));
        v9 = objc_msgSend(v10, "newBackgroundContext");

        -[NSMapTable setObject:forKey:](self->_contextsByXPCConnection, "setObject:forKey:", v9, v7);
      }
      objc_sync_exit(v8);

    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence internalContext](self, "internalContext"));
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005194;
    v12[3] = &unk_1000BB380;
    v13 = v9;
    v14 = v4;
    v11 = v9;
    objc_msgSend(v11, "performBlock:", v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

- (id)_effectiveCategoryPoliciesForCategoryShieldPolicy:(id)a3 type:(id)a4 excludedIdentifiersKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(NSMutableArray);
  v12 = objc_msgSend(v8, "policy");
  if (v12 == (id)2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "excludedContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", v10));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMFEffectivePolicy downtimeCategoryIdentifiers](DMFEffectivePolicy, "downtimeCategoryIdentifiers"));
      v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v24)
      {
        v25 = v24;
        v31 = v14;
        v32 = v10;
        v26 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v16);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence _effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:](self, "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), v9, v15));
            -[NSMutableArray addObject:](v11, "addObject:", v28);

          }
          v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v25);
        goto LABEL_20;
      }
LABEL_21:

    }
LABEL_22:

    goto LABEL_23;
  }
  if (v12 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "excludedContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v10));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "specificCategories"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v17)
      {
        v18 = v17;
        v31 = v14;
        v32 = v10;
        v30 = v8;
        v19 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "identifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence _effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:](self, "_effectivePolicyForManagedSettingsIdentifier:type:excludedIdentifiers:", v21, v9, v15));
            -[NSMutableArray addObject:](v11, "addObject:", v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v18);
        v8 = v30;
LABEL_20:
        v14 = v31;
        v10 = v32;
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

- (NSManagedObjectContext)registrationContext
{
  return self->_registrationContext;
}

- (NSManagedObjectContext)internalContext
{
  return self->_internalContext;
}

- (void)emergencyModeStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051A8;
  block[3] = &unk_1000BB4A8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)emergencyModeQueue
{
  return self->_emergencyModeQueue;
}

- (DMDPolicyPersistence)init
{
  void *v3;
  NSPersistentStoreDescription *v4;
  void *v5;
  DMDPolicyPersistence *v6;
  NSPersistentStoreDescription *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager dmd_userEffectivePoliciesDatabaseURL](NSFileManager, "dmd_userEffectivePoliciesDatabaseURL"));
  v4 = objc_opt_new(NSPersistentStoreDescription);
  -[NSPersistentStoreDescription setURL:](v4, "setURL:", v3);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = -[DMDPolicyPersistence initWithPersistentStoreDescriptions:](self, "initWithPersistentStoreDescriptions:", v5);

  return v6;
}

- (DMDPolicyPersistence)initWithPersistentStoreDescriptions:(id)a3
{
  id v4;
  DMDPolicyPersistence *v5;
  NSBundle *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSPersistentContainer *v10;
  NSPersistentContainer *persistentContainer;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSMapTable *v18;
  NSMapTable *contextsByXPCConnection;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *emergencyModeQueue;
  MOEffectiveSettingsStore *v26;
  MOEffectiveSettingsStore *effectiveSettingsStore;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DMDPolicyPersistence;
  v5 = -[DMDPolicyPersistence init](&v34, "init");
  if (v5)
  {
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFPolicyRegistration));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("DMDEffectivePolicies"), CFSTR("momd")));

    v29 = (void *)v8;
    v9 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v8);
    v10 = (NSPersistentContainer *)objc_msgSend(objc_alloc((Class)NSPersistentContainer), "initWithName:managedObjectModel:", CFSTR("EffectivePolicies"), v9);
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = v10;

    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = objc_msgSend(v4, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "setShouldAddStoreAsynchronously:", 0);
          objc_msgSend(v17, "setOption:forKey:", NSFileProtectionNone, NSPersistentStoreFileProtectionKey);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v14);
    }

    -[NSPersistentContainer setPersistentStoreDescriptions:](v5->_persistentContainer, "setPersistentStoreDescriptions:", v12);
    v18 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    contextsByXPCConnection = v5->_contextsByXPCConnection;
    v5->_contextsByXPCConnection = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_UTILITY, 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);

    v24 = dispatch_queue_create("com.apple.dmd.policy.emergency-mode", v23);
    emergencyModeQueue = v5->_emergencyModeQueue;
    v5->_emergencyModeQueue = (OS_dispatch_queue *)v24;

    v26 = objc_opt_new(MOEffectiveSettingsStore);
    effectiveSettingsStore = v5->_effectiveSettingsStore;
    v5->_effectiveSettingsStore = v26;

  }
  return v5;
}

- (BOOL)isInLegacyDowntimeWithPolicies:(id)a3 priorities:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[DMFEffectivePolicy downtimeCategoryIdentifiers](DMFEffectivePolicy, "downtimeCategoryIdentifiers"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
        v14 = objc_msgSend(v12, "integerValue");
        v15 = objc_msgSend(v13, "integerValue");
        v16 = (id)DMFHighestPolicyPriority;

        if (v14)
          v17 = 1;
        else
          v17 = v15 == v16;
        if (!v17)
        {
          v18 = 0;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  v18 = 1;
LABEL_14:

  return v18;
}

- (BOOL)isInManagedSettingsDowntime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  if (_os_feature_enabled_impl("ScreenTime", "screentime_api"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence effectiveSettingsStore](self, "effectiveSettingsStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categoryShieldPolicies"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOCategory all](MOCategory, "all"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

      if (v7)
        v8 = objc_msgSend(MOScreenTimeShieldPolicyNone, "isEqualToString:", v7) ^ 1;
      else
        LOBYTE(v8) = 0;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_effectivePolicyForManagedSettingsIdentifier:(id)a3 type:(id)a4 excludedIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  DMDManagedSettingsEffectivePolicy *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_new(DMDManagedSettingsEffectivePolicy);
  -[DMDManagedSettingsEffectivePolicy setType:](v10, "setType:", v8);

  -[DMDManagedSettingsEffectivePolicy setIdentifier:](v10, "setIdentifier:", v9);
  -[DMDManagedSettingsEffectivePolicy setOrganizationIdentifier:](v10, "setOrganizationIdentifier:", CFSTR("com.apple.ManagedSettings"));
  -[DMDManagedSettingsEffectivePolicy setDeclarationIdentifier:](v10, "setDeclarationIdentifier:", CFSTR("com.apple.ManagedSettings.declaration-identifier"));
  -[DMDManagedSettingsEffectivePolicy setPolicy:](v10, "setPolicy:", 5);
  -[DMDManagedSettingsEffectivePolicy setPriority:](v10, "setPriority:", DMFLowestPolicyPriority);
  -[DMDManagedSettingsEffectivePolicy setExcludedIdentifiers:](v10, "setExcludedIdentifiers:", v7);

  return v10;
}

- (void)setEffectivePolicy:(int64_t)a3 forType:(id)a4 identifiers:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  DMDPolicyPersistence *v25;
  id v26;
  id v27;
  int64_t v28;
  unint64_t v29;

  v15 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005B4D0;
  v21[3] = &unk_1000BBB40;
  v22 = a5;
  v23 = a7;
  v24 = a8;
  v25 = self;
  v26 = v15;
  v27 = a9;
  v28 = a3;
  v29 = a6;
  v16 = v15;
  v17 = v24;
  v18 = v23;
  v19 = v22;
  v20 = v27;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v21);

}

- (BOOL)_upsertPolicy:(int64_t)a3 forType:(id)a4 identifier:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 policyToUpdate:(id)a9 managedObjectContext:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  DMDEffectivePolicy *v19;
  id v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  DMDEffectivePolicy *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (DMDEffectivePolicy *)a9;
  v20 = a10;
  if (v19)
  {
    v21 = -[DMDEffectivePolicy policy](v19, "policy") != (id)a3;
    v22 = -[DMDEffectivePolicy setPolicy:](v19, "setPolicy:", a3);
    v25 = DMFPolicyLog(v22, v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138543874;
      v33 = v19;
      v34 = 2114;
      v35 = v15;
      v36 = 2114;
      v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updating existing policy %{public}@ of type %{public}@ identifier %{public}@", (uint8_t *)&v32, 0x20u);
    }
  }
  else
  {
    v19 = -[DMDEffectivePolicy initWithContext:]([DMDEffectivePolicy alloc], "initWithContext:", v20);
    -[DMDEffectivePolicy setType:](v19, "setType:", v15);
    -[DMDEffectivePolicy setIdentifier:](v19, "setIdentifier:", v16);
    -[DMDEffectivePolicy setOrganizationIdentifier:](v19, "setOrganizationIdentifier:", v17);
    -[DMDEffectivePolicy setDeclarationIdentifier:](v19, "setDeclarationIdentifier:", v18);
    -[DMDEffectivePolicy setPriority:](v19, "setPriority:", a6);
    v27 = -[DMDEffectivePolicy setPolicy:](v19, "setPolicy:", a3);
    v30 = DMFPolicyLog(v27, v28, v29);
    v26 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138543618;
      v33 = v19;
      v34 = 2114;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Adding new policy %{public}@ of type %{public}@", (uint8_t *)&v32, 0x16u);
    }
    v21 = 1;
  }

  return v21;
}

- (void)removeEffectivePolicyFromOrganizationIdentifier:(id)a3 declarationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  DMDPolicyPersistence *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005BD1C;
  v11[3] = &unk_1000BBB68;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v13;
  v9 = v12;
  v10 = v15;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v11);

}

- (void)removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMDPolicyPersistence *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C29C;
  v9[3] = &unk_1000BBB18;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v6;
  v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);

}

- (void)removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMDPolicyPersistence *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C40C;
  v9[3] = &unk_1000BBB18;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v6;
  v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);

}

- (void)_removeOrphanedPoliciesFromFetchRequest:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  DMDPolicyPersistence *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *j;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void (**v60)(id, _QWORD);
  void *v61;
  DMDPolicyPersistence *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v72 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "execute:", &v72));
  v11 = v72;
  v14 = v11;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      v61 = v14;
      v62 = self;
      v60 = v9;
      v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
      v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v10, "count"));
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v59 = v10;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      v19 = v8;
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v69 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "type", v59));
            objc_msgSend(v16, "addObject:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "declarationIdentifier"));
            objc_msgSend(v15, "addObject:", v25);
            v26 = objc_msgSend(v8, "deleteObject:", v23);
            v29 = DMFPolicyLog(v26, v27, v28);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "organizationIdentifier"));
              *(_DWORD *)buf = 138543618;
              v74 = v25;
              v75 = 2114;
              v76 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Removing orphaned policy %{public}@ in organization %{public}@", buf, 0x16u);

            }
            v8 = v19;
          }
          v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
        }
        while (v20);
      }

      if (objc_msgSend(v8, "hasChanges"))
      {
        v67 = v61;
        v32 = objc_msgSend(v8, "save:", &v67);
        v14 = v67;

        v36 = v62;
        if (!v32)
        {
          v37 = DMFPolicyLog(v33, v34, v35);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          v39 = v15;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "componentsJoinedByString:", CFSTR(",")));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "componentsJoinedByString:", CFSTR(",")));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "verboseDescription"));
            *(_DWORD *)buf = 138543874;
            v74 = v56;
            v75 = 2114;
            v76 = v57;
            v77 = 2114;
            v78 = v58;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Could not remove orphaned policies types %{public}@ for declarations %{public}@: %{public}@", buf, 0x20u);

          }
          v40 = 0;
          v9 = v60;
LABEL_34:
          v10 = v59;

          ((void (**)(id, void *))v9)[2](v9, v40);
          v8 = v19;
          goto LABEL_35;
        }
      }
      else
      {
        v14 = v61;
        v36 = v62;
      }
      v39 = v15;
      v43 = objc_msgSend(v17, "count", v59);
      v9 = v60;
      if (v43)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v46 = v16;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v48; j = (char *)j + 1)
            {
              if (*(_QWORD *)v64 != v49)
                objc_enumerationMutation(v46);
              -[DMDPolicyPersistence _notifyClientsRegisteredForPolicyType:](v36, "_notifyClientsRegisteredForPolicyType:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j));
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
          }
          while (v48);
        }

      }
      v51 = DMFPolicyLog(v43, v44, v45);
      v38 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsJoinedByString:", CFSTR(",")));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "componentsJoinedByString:", CFSTR(",")));
        *(_DWORD *)buf = 138543618;
        v74 = v53;
        v75 = 2114;
        v76 = v54;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Successfully removed orphaned policy types %{public}@ for declarations %{public}@", buf, 0x16u);

      }
      v40 = v39;
      goto LABEL_34;
    }
    ((void (**)(id, void *))v9)[2](v9, &__NSArray0__struct);
  }
  else
  {
    v41 = DMFPolicyLog(v11, v12, v13);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_100078CBC(v14);

    v9[2](v9, 0);
  }
LABEL_35:

}

- (void)_notifyClientsRegisteredForPolicyType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPolicyRegistration fetchRequest](DMDPolicyRegistration, "fetchRequest"));
  v32 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "execute:", &v32));
  v6 = v32;
  v9 = v6;
  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v5;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v11)
    {
      v12 = v11;
      v25 = v9;
      v26 = v5;
      v27 = v4;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyTypes"));
          v17 = objc_msgSend(v16, "containsObject:", v3);

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            v21 = DMFPolicyLog(v18, v19, v20);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v34 = v18;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Posting notification for registration %{public}@", buf, 0xCu);
            }

            v23 = objc_retainAutorelease(v18);
            notify_post((const char *)objc_msgSend(v23, "UTF8String"));

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v12);
      v5 = v26;
      v4 = v27;
      v9 = v25;
    }
  }
  else
  {
    v24 = DMFPolicyLog(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100078D34(v9);
  }

}

- (void)enableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CDC4;
  block[3] = &unk_1000BA7F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)enableEmergencyModeForDuration:(double)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CEF8;
  block[3] = &unk_1000BBBB8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)_enableEmergencyModeUntilDate:(id)a3 referenceDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  id v18;
  double v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  dispatch_assert_queue_V2(v11);

  if (!v8 || (v12 = objc_msgSend(v9, "compare:", v8), v12 != (id)-1))
  {
    v13 = DMFEmergencyModeLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100078DAC();
LABEL_5:

    v15 = DMFErrorWithCodeAndUserInfo(3903, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (xpc_object_t)v16;
    goto LABEL_6;
  }
  v18 = objc_msgSend(v8, "timeIntervalSince1970");
  v20 = (uint64_t)(v19 * 1000000000.0);
  if (v20 <= 0)
  {
    v24 = DMFEmergencyModeLog(v18);
    v14 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100078E10();
    goto LABEL_5;
  }
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v17, (const char *)objc_msgSend(CFSTR("ShouldWake"), "UTF8String"), 0);
  xpc_dictionary_set_date(v17, (const char *)objc_msgSend(CFSTR("Date"), "UTF8String"), v20);
  xpc_set_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), objc_msgSend(CFSTR("com.apple.dmd.emergency-mode.alarm"), "UTF8String"), v17);
  v21 = notify_post((const char *)objc_msgSend(DMFEmergencyModeChangedNotification, "UTF8String"));
  v22 = DMFEmergencyModeLog(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138543362;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enabling Emergency Mode until: %{public}@", (uint8_t *)&v25, 0xCu);
  }

  v16 = 0;
LABEL_6:
  v10[2](v10, v16);

}

- (void)disableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D230;
  block[3] = &unk_1000BB4A8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  return (NSArray *)&off_1000C2EB0;
}

- (NSArray)distributedNotificationNames
{
  _QWORD v3[2];

  v3[0] = CTCategoriesDidChangeNotification;
  v3[1] = CFSTR("com.apple.LaunchServices.applicationRegistered");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (NSArray)managedSettingsGroups
{
  _QWORD v3[3];

  v3[0] = MOEffectiveSettingsGroupAccount;
  v3[1] = MOEffectiveSettingsGroupScreenTime;
  v3[2] = MOEffectiveSettingsGroupShield;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v3 = a3;
  v6 = DMFPolicyLog(v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling alarm with identifier: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.dmd.emergency-mode.alarm")))
    notify_post((const char *)objc_msgSend(DMFEmergencyModeChangedNotification, "UTF8String"));

}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v7 = DMFPolicyLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling notify matching notification with name: %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobile.keybagd.first_unlock")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005D5D0;
    v9[3] = &unk_1000BBBE0;
    v9[4] = self;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);
  }

}

- (void)handleDistributedNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v10 = DMFPolicyLog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling distributed notification with name: %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "isEqualToString:", CTCategoriesDidChangeNotification))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005D778;
    v15[3] = &unk_1000BBBE0;
    v15[4] = self;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v15);
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationRegistered")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isPlaceholder")));
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005D78C;
      v14[3] = &unk_1000BBBE0;
      v14[4] = self;
      -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v14);
    }

  }
}

- (void)handleManagedEffectiveSettingsChangeInGroup:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id (*v9)(uint64_t);
  void ***v10;
  void **v11;
  void **v12;
  void **v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v7 = DMFPolicyLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling managed settings group change: %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "isEqualToString:", MOEffectiveSettingsGroupShield))
  {
    v13 = _NSConcreteStackBlock;
    v9 = sub_10005D928;
    v10 = &v13;
LABEL_10:
    v10[1] = (void **)3221225472;
    v10[2] = (void **)v9;
    v10[3] = (void **)&unk_1000BBBE0;
    v10[4] = (void **)&self->super.isa;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", MOEffectiveSettingsGroupAccount))
  {
    v12 = _NSConcreteStackBlock;
    v9 = sub_10005D93C;
    v10 = &v12;
    goto LABEL_10;
  }
  if (_os_feature_enabled_impl("ScreenTime", "screentime_api")
    && objc_msgSend(v4, "isEqualToString:", MOEffectiveSettingsGroupScreenTime))
  {
    v11 = _NSConcreteStackBlock;
    v9 = sub_10005D950;
    v10 = &v11;
    goto LABEL_10;
  }
LABEL_11:

}

- (MOEffectiveSettingsStore)effectiveSettingsStore
{
  return self->_effectiveSettingsStore;
}

- (void)setIsPersistentContainerLoaded:(BOOL)a3
{
  self->_isPersistentContainerLoaded = a3;
}

- (void)setInternalContext:(id)a3
{
  objc_storeStrong((id *)&self->_internalContext, a3);
}

- (void)setRegistrationContext:(id)a3
{
  objc_storeStrong((id *)&self->_registrationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyModeQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_registrationContext, 0);
  objc_storeStrong((id *)&self->_internalContext, 0);
  objc_storeStrong((id *)&self->_effectiveSettingsStore, 0);
  objc_storeStrong((id *)&self->_contextsByXPCConnection, 0);
}

@end
