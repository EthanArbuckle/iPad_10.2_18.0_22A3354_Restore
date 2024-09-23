@implementation SDScreenTimeMonitor

- (SDScreenTimeMonitor)initWithPoliciesChangedHandler:(id)a3
{
  id v4;
  SDScreenTimeMonitor *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *bundleIdentifierByActivityType;
  NSMutableDictionary *v8;
  NSMutableDictionary *policiesByBundleIdentifier;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  id v14;
  DMFApplicationPolicyMonitor *v15;
  DMFApplicationPolicyMonitor *screenTimeMonitor;
  id v17;
  id policiesChangedHandler;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SDScreenTimeMonitor;
  v5 = -[SDScreenTimeMonitor init](&v26, "init");
  if (v5)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    bundleIdentifierByActivityType = v5->_bundleIdentifierByActivityType;
    v5->_bundleIdentifierByActivityType = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    policiesByBundleIdentifier = v5->_policiesByBundleIdentifier;
    v5->_policiesByBundleIdentifier = v8;

    location = 0;
    objc_initWeak(&location, v5);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.sharing.screenTimeUpdateQueue", v11);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc((Class)DMFApplicationPolicyMonitor);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_1000F42EC;
    v23 = &unk_1007145D0;
    objc_copyWeak(&v24, &location);
    v15 = (DMFApplicationPolicyMonitor *)objc_msgSend(v14, "initWithPolicyChangeHandler:", &v20);
    screenTimeMonitor = v5->_screenTimeMonitor;
    v5->_screenTimeMonitor = v15;

    v17 = objc_msgSend(v4, "copy", v20, v21, v22, v23);
    policiesChangedHandler = v5->_policiesChangedHandler;
    v5->_policiesChangedHandler = v17;

    atomic_store(0, (unsigned __int8 *)&v5->_isCacheReady);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_handlePolicyChange
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4370;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F440C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)isCacheReady
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCacheReady);
  return v2 & 1;
}

- (void)setCacheReady:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_isCacheReady);
}

- (int64_t)cachedPolicyForBundleID:(id)a3
{
  id v4;
  NSObject *workQueue;
  int64_t v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SDScreenTimeMonitor isCacheReady](self, "isCacheReady"))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F4544;
    block[3] = &unk_100717808;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(workQueue, block);

  }
  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)updateWithActivities:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F460C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)requestPoliciesForActivities:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SDScreenTimeMonitor *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4764;
  block[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

- (int64_t)cachedPolicyForActivityType:(id)a3
{
  id v4;
  NSObject *workQueue;
  int64_t v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SDScreenTimeMonitor isCacheReady](self, "isCacheReady"))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F4A54;
    block[3] = &unk_100717830;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(workQueue, block);

  }
  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_bundleIDForActivity:(id)a3
{
  id v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  unsigned __int8 v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  unsigned __int8 v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  v4 = (NSString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v5 = UIActivityTypeMessage;
  if (v4 == v5)
  {

    goto LABEL_6;
  }
  v6 = v5;
  if ((v4 == 0) == (v5 != 0))
  {

    goto LABEL_8;
  }
  v7 = -[NSString isEqual:](v4, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
LABEL_6:
    v8 = CFSTR("com.apple.MobileSMS");
    goto LABEL_30;
  }
LABEL_8:
  v9 = (NSString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v10 = UIActivityTypeMail;
  if (v9 == v10)
  {

    goto LABEL_13;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_15;
  }
  v12 = -[NSString isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_13:
    v8 = CFSTR("com.apple.mobilemail");
    goto LABEL_30;
  }
LABEL_15:
  v13 = (NSString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v14 = UIActivityTypeSharePlay;
  if (v13 == v14)
  {

    goto LABEL_20;
  }
  v15 = v14;
  if ((v13 == 0) != (v14 != 0))
  {
    v16 = -[NSString isEqual:](v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_22;
LABEL_20:
    v8 = CFSTR("com.apple.telephonyutilities.callservicesd");
    goto LABEL_30;
  }

LABEL_22:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationExtension"));
  if (v18)
  {
    v19 = objc_opt_class(UIApplicationExtensionActivity, v17);
    if ((objc_opt_isKindOfClass(v3, v19) & 1) != 0)
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containingAppBundleIdentifier"));
    }
    else
    {
      v20 = share_sheet_log();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        sub_1000F5478();

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_plugIn"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "containingBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleIdentifier"));

    }
  }
  else
  {
    v8 = 0;
  }

LABEL_30:
  return v8;
}

- (void)_updateBundleIdentifierMappings
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSMutableDictionary *bundleIdentifierByActivityType;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_activities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        bundleIdentifierByActivityType = self->_bundleIdentifierByActivityType;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bundleIdentifierByActivityType, "objectForKeyedSubscript:", v10));

        if (!v11)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDScreenTimeMonitor _bundleIDForActivity:](self, "_bundleIDForActivity:", v8));
          if (!v11)
            continue;
        }
        v12 = self->_bundleIdentifierByActivityType;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_retrieveMissingPolicies
{
  NSMutableArray *v3;
  NSMutableDictionary *bundleIdentifierByActivityType;
  NSMutableArray *v5;
  _QWORD v6[5];
  NSMutableArray *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = objc_opt_new(NSMutableArray);
  bundleIdentifierByActivityType = self->_bundleIdentifierByActivityType;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000F4FA0;
  v6[3] = &unk_100717858;
  v6[4] = self;
  v5 = v3;
  v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bundleIdentifierByActivityType, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (-[NSMutableArray count](v5, "count"))
    -[SDScreenTimeMonitor _retrievePoliciesForBundleIdentifiers:](self, "_retrievePoliciesForBundleIdentifiers:", v5);

}

- (void)_handleUpdateForPoliciesByBundleIdentifier:(id)a3
{
  void *v4;
  NSMutableDictionary *policiesByBundleIdentifier;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[NSMutableDictionary addEntriesFromDictionary:](self->_policiesByBundleIdentifier, "addEntriesFromDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableDictionary count](self->_policiesByBundleIdentifier, "count")));
  policiesByBundleIdentifier = self->_policiesByBundleIdentifier;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F5104;
  v10[3] = &unk_100717880;
  v10[4] = self;
  v9 = v4;
  v11 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](policiesByBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[SDScreenTimeMonitor setRestrictedActivityTypes:](self, "setRestrictedActivityTypes:", v9);
  -[SDScreenTimeMonitor setCacheReady:](self, "setCacheReady:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDScreenTimeMonitor policiesChangedHandler](self, "policiesChangedHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDScreenTimeMonitor policiesChangedHandler](self, "policiesChangedHandler"));
    v8 = objc_msgSend(v9, "copy");
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)_retrievePoliciesForBundleIdentifiers:(id)a3
{
  id v4;
  DMFApplicationPolicyMonitor *screenTimeMonitor;
  id v6;
  _QWORD v7[4];
  id v8;
  SDScreenTimeMonitor *v9;
  id v10;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  screenTimeMonitor = self->_screenTimeMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F5264;
  v7[3] = &unk_1007178A8;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_copyWeak(&v10, &location);
  -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:completionHandler:](screenTimeMonitor, "requestPoliciesForBundleIdentifiers:completionHandler:", v6, v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (id)policiesChangedHandler
{
  return self->_policiesChangedHandler;
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong(&self->_policiesChangedHandler, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierByActivityType, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_screenTimeMonitor, 0);
}

@end
