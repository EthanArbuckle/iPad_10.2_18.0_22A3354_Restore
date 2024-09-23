@implementation CKKSOperationDependencies

- (CKKSOperationDependencies)initWithViewStates:(id)a3 contextID:(id)a4 activeAccount:(id)a5 ckdatabase:(id)a6 cloudKitClassDependencies:(id)a7 ckoperationGroup:(id)a8 flagHandler:(id)a9 overallLaunch:(id)a10 accountStateTracker:(id)a11 lockStateTracker:(id)a12 reachabilityTracker:(id)a13 peerProviders:(id)a14 databaseProvider:(id)a15 savedTLKNotifier:(id)a16 personaAdapter:(id)a17 sendMetric:(BOOL)a18
{
  id v22;
  id v23;
  CKKSOperationDependencies *v24;
  CKKSOperationDependencies *v25;
  CKOperationGroup *currentOutgoingQueueOperationGroup;
  CKKSNearFutureScheduler *requestPolicyCheck;
  uint64_t v28;
  NSHashTable *keysetProviderOperations;
  uint64_t v30;
  NSMutableSet *currentFetchReasons;
  CKKSNearFutureScheduler *v32;
  CKKSNearFutureScheduler *cloudkitRetryAfter;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v52;

  v50 = a3;
  v49 = a4;
  v48 = a5;
  v47 = a6;
  v36 = a7;
  v46 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v41 = a12;
  v40 = a13;
  v39 = a14;
  v38 = a15;
  v22 = a16;
  v23 = a17;
  v52.receiver = self;
  v52.super_class = (Class)CKKSOperationDependencies;
  v24 = -[CKKSOperationDependencies init](&v52, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_allViews, a3);
    objc_storeStrong((id *)&v25->_ckdatabase, a6);
    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, v36);
    objc_storeStrong((id *)&v25->_ckoperationGroup, a8);
    objc_storeStrong((id *)&v25->_flagHandler, a9);
    objc_storeStrong((id *)&v25->_overallLaunch, a10);
    objc_storeStrong((id *)&v25->_accountStateTracker, a11);
    objc_storeStrong((id *)&v25->_lockStateTracker, a12);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a13);
    objc_storeStrong((id *)&v25->_peerProviders, a14);
    objc_storeStrong((id *)&v25->_databaseProvider, a15);
    objc_storeStrong((id *)&v25->_savedTLKNotifier, a16);
    objc_storeStrong((id *)&v25->_contextID, a4);
    objc_storeStrong((id *)&v25->_activeAccount, a5);
    currentOutgoingQueueOperationGroup = v25->_currentOutgoingQueueOperationGroup;
    v25->_currentOutgoingQueueOperationGroup = 0;

    requestPolicyCheck = v25->_requestPolicyCheck;
    v25->_requestPolicyCheck = 0;

    v28 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    keysetProviderOperations = v25->_keysetProviderOperations;
    v25->_keysetProviderOperations = (NSHashTable *)v28;

    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    currentFetchReasons = v25->_currentFetchReasons;
    v25->_currentFetchReasons = (NSMutableSet *)v30;

    v25->_limitOperationToPriorityViewsSet = 0;
    objc_storeStrong((id *)&v25->_personaAdapter, a17);
    v25->_sendMetric = a18;
    v32 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:]([CKKSNearFutureScheduler alloc], "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:", CFSTR("zonemodifier-ckretryafter"), 100000000, 100000000, 0, 1005, 25, 1.0, &stru_1002DC840);
    cloudkitRetryAfter = v25->_cloudkitRetryAfter;
    v25->_cloudkitRetryAfter = v32;

  }
  return v25;
}

- (NSSet)views
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies viewsOverride](self, "viewsOverride"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies viewsOverride](self, "viewsOverride"));
  }
  else if (-[CKKSOperationDependencies limitOperationToPriorityViewsSet](self, "limitOperationToPriorityViewsSet"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allPriorityViews](self, "allPriorityViews"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews"));
  }
  return (NSSet *)v4;
}

- (NSSet)activeManagedViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "ckksManagedView"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allCKKSManagedViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "ckksManagedView"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allExternalManagedViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "ckksManagedView") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setStateForActiveZones:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setViewKeyHierarchyState:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setStateForActiveCKKSManagedViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "ckksManagedView"))
          objc_msgSend(v10, "setViewKeyHierarchyState:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setStateForActiveExternallyManagedViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "ckksManagedView") & 1) == 0)
          objc_msgSend(v10, "setViewKeyHierarchyState:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setStateForAllViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setViewKeyHierarchyState:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)operateOnSelectViews:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  -[CKKSOperationDependencies setViewsOverride:](self, "setViewsOverride:", v4);
  v5 = sub_10000BDF4(CFSTR("ckksviews"), 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Limited view operation to %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)operateOnAllViews
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  -[CKKSOperationDependencies setViewsOverride:](self, "setViewsOverride:", 0);
  -[CKKSOperationDependencies setLimitOperationToPriorityViewsSet:](self, "setLimitOperationToPriorityViewsSet:", 0);
  v3 = sub_10000BDF4(CFSTR("ckksviews"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Expanded view operation to %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)limitOperationToPriorityViews
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  -[CKKSOperationDependencies setLimitOperationToPriorityViewsSet:](self, "setLimitOperationToPriorityViewsSet:", 1);
  v3 = sub_10000BDF4(CFSTR("ckksviews"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Limited view operation to priority views %@", (uint8_t *)&v6, 0xCu);

  }
}

- (id)viewsInState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewKeyHierarchyState"));
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)viewStatesByNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        v14 = objc_msgSend(v4, "containsObject:", v13);

        if (v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)viewStateForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)readyAndSyncingViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CKKSOperationDependencies *v14;
  void *v15;
  id v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "ckksManagedView"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
          if ((objc_msgSend(v9, "isSyncingEnabledForView:", v11) & 1) != 0)
          {
            v12 = v6;
            v13 = v3;
            v14 = self;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewKeyHierarchyState"));
            v18 = objc_msgSend(v15, "isEqualToString:", CFSTR("ready"));

            self = v14;
            v3 = v13;
            v6 = v12;

            if (v18)
              objc_msgSend(v17, "addObject:", v8);
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  return v17;
}

- (void)applyNewSyncingPolicy:(id)a3 viewStates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  CKKSOperationDependencies *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v18 = self;
  -[CKKSOperationDependencies setSyncingPolicy:](self, "setSyncingPolicy:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "priorityViews"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
        v17 = objc_msgSend(v15, "containsObject:", v16);

        if (v17)
          objc_msgSend(v8, "addObject:", v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  -[CKKSOperationDependencies setAllPriorityViews:](v18, "setAllPriorityViews:", v8);
  -[CKKSOperationDependencies setAllViews:](v18, "setAllViews:", v9);
  -[CKKSOperationDependencies setViewsOverride:](v18, "setViewsOverride:", 0);

}

- (id)currentTrustStates
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies peerProviders](self, "peerProviders"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = sub_10000BDF4(CFSTR("ckks"), 0);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching account keys for provider %@", buf, 0xCu);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentState"));
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)considerSelfTrusted:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend(v11, "essential", (_QWORD)v18))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSelfPeersError"));
          v13 = v12;
          if (v12)
            v14 = v12;
          else
            v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentTrustedPeersError"));
          v7 = v14;

          if (objc_msgSend(v11, "essential"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSelfPeersError"));
            if (v15)
            {

            }
            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentTrustedPeersError"));

              if (!v16)
              {

                LOBYTE(v6) = 1;
                goto LABEL_23;
              }
            }
          }

          v10 = v7;
        }
        else
        {
          v7 = v10;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }

    if (a4 && v7)
    {
      v10 = objc_retainAutorelease(v7);
      LOBYTE(v6) = 0;
      *a4 = v10;
    }
    else
    {
      v10 = v7;
    }
  }
  else
  {

    v10 = 0;
  }
LABEL_23:

  return (char)v6;
}

- (void)provideKeySets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];

  v3 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v12 = sub_10000BDF4(CFSTR("ckkskey"), v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Providing keyset (%@) to listeners", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v6);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies keysetProviderOperations](self, "keysetProviderOperations"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), "provideKeySets:", v3);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

}

- (BOOL)intransactionCKRecordChanged:(id)a3 resync:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  BOOL v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  int v45;
  void *v46;
  unsigned __int8 v47;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  NSObject *v62;
  __int16 v63;
  NSObject *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;

  v4 = a4;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v6, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckksfetch"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v14)
      goto LABEL_7;
    v15 = objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
    v16 = objc_claimAutoreleasedReturnValue(-[NSObject recordID](v6, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordChangeTag](v6, "recordChangeTag"));
    *(_DWORD *)buf = 138413058;
    v62 = v15;
    v63 = 2112;
    v64 = v16;
    v65 = 2112;
    v66 = v17;
    v67 = 2112;
    v68 = v8;
    v18 = "Processing record modification(%@): %@ changeTag: %@ parentKeyRef: %@";
    v19 = v13;
    v20 = 42;
  }
  else
  {
    if (!v14)
      goto LABEL_7;
    v15 = objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
    v16 = objc_claimAutoreleasedReturnValue(-[NSObject recordID](v6, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordChangeTag](v6, "recordChangeTag"));
    *(_DWORD *)buf = 138412802;
    v62 = v15;
    v63 = 2112;
    v64 = v16;
    v65 = 2112;
    v66 = v17;
    v18 = "Processing record modification(%@): %@ changeTag: %@";
    v19 = v13;
    v20 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

LABEL_7:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v22 = objc_msgSend(v21, "isEqual:", CFSTR("item"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v60 = 0;
    +[CKKSItem intransactionRecordChanged:contextID:resync:error:](CKKSItem, "intransactionRecordChanged:contextID:resync:error:", v6, v23, v4, &v60);
    v24 = v60;
LABEL_11:
    v27 = v24;
    goto LABEL_12;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v26 = objc_msgSend(v25, "isEqual:", CFSTR("currentitem"));

  if (v26)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v59 = 0;
    +[CKKSCurrentItemPointer intransactionRecordChanged:contextID:resync:error:](CKKSCurrentItemPointer, "intransactionRecordChanged:contextID:resync:error:", v6, v23, v4, &v59);
    v24 = v59;
    goto LABEL_11;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v36 = objc_msgSend(v35, "isEqual:", CFSTR("synckey"));

  if (v36)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    v58 = 0;
    +[CKKSKey intransactionRecordChanged:contextID:resync:flagHandler:error:](CKKSKey, "intransactionRecordChanged:contextID:resync:flagHandler:error:", v6, v23, v4, v37, &v58);
    v38 = v58;
LABEL_23:
    v27 = v38;

LABEL_12:
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v6, "recordID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckksfetch"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
        *(_DWORD *)buf = 138412546;
        v62 = v33;
        v63 = 2112;
        v64 = v27;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Record modification(%@) failed:: %@", buf, 0x16u);

      }
      goto LABEL_15;
    }
LABEL_26:
    v34 = 1;
    goto LABEL_27;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v40 = objc_msgSend(v39, "isEqual:", CFSTR("tlkshare"));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v57 = 0;
    +[CKKSTLKShareRecord intransactionRecordChanged:contextID:resync:error:](CKKSTLKShareRecord, "intransactionRecordChanged:contextID:resync:error:", v6, v41, v4, &v57);
    v27 = v57;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    objc_msgSend(v23, "_onqueueHandleFlag:", CFSTR("key_process_requested"));
    goto LABEL_12;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("currentkey"));

  if (v43)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    v56 = 0;
    +[CKKSCurrentKeyPointer intransactionRecordChanged:contextID:resync:flagHandler:error:](CKKSCurrentKeyPointer, "intransactionRecordChanged:contextID:resync:flagHandler:error:", v6, v23, v4, v37, &v56);
    v38 = v56;
    goto LABEL_23;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("manifest"));

  if ((v45 & 1) != 0)
    goto LABEL_26;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("manifest_leaf"));

  if ((v47 & 1) != 0)
    goto LABEL_26;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("devicestate"));

  if (v50)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v55 = 0;
    +[CKKSDeviceStateEntry intransactionRecordChanged:contextID:resync:error:](CKKSDeviceStateEntry, "intransactionRecordChanged:contextID:resync:error:", v6, v23, v4, &v55);
    v24 = v55;
    goto LABEL_11;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v6, "recordID"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "zoneID"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "zoneName"));
  v54 = sub_10000BDF4(CFSTR("ckksfetch"), v53);
  v27 = objc_claimAutoreleasedReturnValue(v54);

  if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    goto LABEL_16;
  v32 = objc_claimAutoreleasedReturnValue(-[NSObject recordType](v6, "recordType"));
  *(_DWORD *)buf = 138412546;
  v62 = v32;
  v63 = 2112;
  v64 = v6;
  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "unknown record type: %@ %@", buf, 0x16u);
LABEL_15:

LABEL_16:
  v34 = 0;
LABEL_27:

  objc_autoreleasePoolPop(v7);
  return v34;
}

- (BOOL)intransactionCKRecordDeleted:(id)a3 recordType:(id)a4 resync:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __objc2_class *v15;
  void *v16;
  id *v17;
  uint64_t *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  NSObject *v36;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckksfetch"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[NSObject recordName](v8, "recordName"));
    *(_DWORD *)buf = 138412546;
    v34 = v9;
    v35 = 2112;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Processing record deletion(%@): %@", buf, 0x16u);

  }
  if (-[NSObject isEqual:](v9, "isEqual:", CFSTR("item")))
  {
    v15 = CKKSItem;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v32 = 0;
    v17 = (id *)&v32;
    v18 = &v32;
    goto LABEL_13;
  }
  if (-[NSObject isEqual:](v9, "isEqual:", CFSTR("currentitem")))
  {
    v15 = CKKSCurrentItemPointer;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v31 = 0;
    v17 = (id *)&v31;
    v18 = &v31;
    goto LABEL_13;
  }
  if ((-[NSObject isEqual:](v9, "isEqual:", CFSTR("synckey")) & 1) != 0)
    goto LABEL_19;
  if (-[NSObject isEqual:](v9, "isEqual:", CFSTR("tlkshare")))
  {
    v15 = CKKSTLKShareRecord;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v30 = 0;
    v17 = (id *)&v30;
    v18 = &v30;
    goto LABEL_13;
  }
  if ((-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("currentkey")) & 1) != 0)
  {
LABEL_19:
    v24 = 1;
    goto LABEL_20;
  }
  if (!-[NSObject isEqual:](v9, "isEqual:", CFSTR("devicestate")))
  {
    if ((-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("manifest")) & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v8, "zoneID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "zoneName"));
      v28 = sub_10000BDF4(CFSTR("ckksfetch"), v27);
      v19 = objc_claimAutoreleasedReturnValue(v28);

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v9;
        v35 = 2112;
        v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "unknown record type: %@ %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  v15 = CKKSDeviceStateEntry;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
  v29 = 0;
  v17 = (id *)&v29;
  v18 = &v29;
LABEL_13:
  -[__objc2_class intransactionRecordDeleted:contextID:resync:error:](v15, "intransactionRecordDeleted:contextID:resync:error:", v8, v16, v5, v18, v29, v30, v31, v32);
  v19 = *v17;

  if (!v19)
    goto LABEL_19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v8, "zoneID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
  v22 = sub_10000BDF4(CFSTR("ckksfetch"), v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    v35 = 2112;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Record deletion(%@) failed:: %@", buf, 0x16u);
  }

LABEL_17:
  v24 = 0;
LABEL_20:

  return v24;
}

- (BOOL)intransactionCKWriteFailed:(id)a3 attemptedRecordsChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  unsigned int v70;
  id v71;
  id v72;
  uint64_t v73;
  id obj;
  id obja;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];

  v5 = a3;
  v72 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v8, "isEqual:", CKErrorDomain) || objc_msgSend(v5, "code") != (id)2)
  {

    goto LABEL_23;
  }

  if (!v7)
  {
LABEL_23:
    v19 = 0;
    goto LABEL_24;
  }
  v69 = v5;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
  v80 = v7;
  if (!v10)
  {

    goto LABEL_26;
  }
  v11 = v10;
  v12 = *(_QWORD *)v90;
  v13 = 1;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v90 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
      if (!objc_msgSend(v16, "isEqual:", CKErrorDomain))
      {

LABEL_14:
        v13 = 0;
        goto LABEL_15;
      }
      if (objc_msgSend(v15, "code") == (id)22 || objc_msgSend(v15, "code") == (id)14)
      {

        goto LABEL_15;
      }
      v17 = objc_msgSend(v15, "code");

      if (v17 != (id)11)
        goto LABEL_14;
LABEL_15:
      v14 = (char *)v14 + 1;
    }
    while (v11 != v14);
    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    v11 = v18;
  }
  while (v18);

  if ((v13 & 1) == 0)
    goto LABEL_50;
LABEL_26:
  v21 = sub_10000BDF4(CFSTR("ckks"), 0);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received a ServerRecordChanged error, attempting to update new records and delete unknown ones", buf, 2u);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v78 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
  if (!v78)
  {

    goto LABEL_50;
  }
  v24 = 0;
  v25 = *(id *)v86;
  obj = *(id *)v86;
  while (2)
  {
    v26 = 0;
    while (2)
    {
      if (*(id *)v86 != v25)
        objc_enumerationMutation(v23);
      v27 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "domain"));
      if (objc_msgSend(v29, "isEqual:", CKErrorDomain))
      {
        v30 = objc_msgSend(v28, "code");

        if (v30 == (id)14)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneName"));
          v35 = sub_10000BDF4(CFSTR("ckks"), v34);
          v36 = objc_claimAutoreleasedReturnValue(v35);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v32;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "On error: updating our idea of: %@", buf, 0xCu);
          }

          v24 |= -[CKKSOperationDependencies intransactionCKRecordChanged:resync:](self, "intransactionCKRecordChanged:resync:", v32, 1);
          goto LABEL_44;
        }
      }
      else
      {

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "domain"));
      if (!objc_msgSend(v32, "isEqual:", CKErrorDomain))
        goto LABEL_44;
      v37 = objc_msgSend(v28, "code");

      if (v37 == (id)11)
      {
        v38 = v23;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v27));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "zoneName"));
        v41 = sub_10000BDF4(CFSTR("ckks"), v40);
        v42 = objc_claimAutoreleasedReturnValue(v41);

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v94 = v27;
          v95 = 2112;
          v96 = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "On error: handling an unexpected delete of: %@ %@", buf, 0x16u);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "recordType"));
        v24 |= -[CKKSOperationDependencies intransactionCKRecordDeleted:recordType:resync:](self, "intransactionCKRecordDeleted:recordType:resync:", v27, v43, 1);

        v23 = v38;
        v25 = obj;
LABEL_44:

      }
      v26 = (char *)v26 + 1;
      v7 = v80;
      if (v78 != v26)
        continue;
      break;
    }
    v78 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
    if (v78)
      continue;
    break;
  }

  if ((v24 & 1) != 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    objc_msgSend(v44, "_onqueueHandleFlag:", CFSTR("process_incoming_queue"));

    v19 = 1;
    goto LABEL_79;
  }
LABEL_50:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
  if (!v79)
    goto LABEL_78;
  v77 = *(_QWORD *)v82;
  v73 = CKUnderlyingErrorDomain;
  while (2)
  {
    v45 = 0;
    while (2)
    {
      if (*(_QWORD *)v82 != v77)
        objc_enumerationMutation(obja);
      v46 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v46));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "userInfo"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "userInfo"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "zoneID"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "zoneName"));
      v54 = sub_10000BDF4(CFSTR("ckks"), v53);
      v55 = objc_claimAutoreleasedReturnValue(v54);

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v94 = v47;
        v95 = 2112;
        v96 = v49;
        v97 = 2112;
        v98 = v51;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Examining 'write failed' error: %@ %@ %@", buf, 0x20u);
      }

      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "domain"));
      if (!-[NSObject isEqualToString:](v56, "isEqualToString:", CKErrorDomain)
        || objc_msgSend(v47, "code") != (id)15
        || !v49)
      {
        goto LABEL_68;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "domain"));
      if (!objc_msgSend(v57, "isEqualToString:", v73) || objc_msgSend(v49, "code") != (id)6000 || !v51)
      {

        goto LABEL_68;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "domain"));
      v70 = objc_msgSend(v58, "isEqualToString:", CFSTR("CloudkitKeychainService"));

      if (v70)
      {
        if (objc_msgSend(v51, "code") == (id)9)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "zoneID"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "zoneName"));
          v61 = sub_10000BDF4(CFSTR("ckks"), v60);
          v56 = objc_claimAutoreleasedReturnValue(v61);

          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
LABEL_73:
            *(_DWORD *)buf = 138412546;
            v94 = v51;
            v95 = 2112;
            v96 = v46;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "CKKS Server extension has told us about %@ for record %@; requesting refetch and reprocess of key hierarchy",
              buf,
              0x16u);
          }
LABEL_74:

          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies currentFetchReasons](self, "currentFetchReasons"));
          objc_msgSend(v66, "addObject:", CFSTR("keyhierarchy"));

          v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies currentFetchReasons](self, "currentFetchReasons"));
          objc_msgSend(v67, "addObject:", CFSTR("conflict"));

          v56 = objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
          -[NSObject _onqueueHandleFlag:](v56, "_onqueueHandleFlag:", CFSTR("fetch_requested"));
        }
        else
        {
          v71 = objc_msgSend(v51, "code");
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "zoneID"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "zoneName"));
          v64 = sub_10000BDF4(CFSTR("ckks"), v63);
          v56 = objc_claimAutoreleasedReturnValue(v64);

          v65 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
          if (v71 == (id)2)
          {
            if (v65)
              goto LABEL_73;
            goto LABEL_74;
          }
          if (v65)
          {
            *(_DWORD *)buf = 138412546;
            v94 = v51;
            v95 = 2112;
            v96 = v46;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "CKKS Server extension has told us about %@ for record %@, but we don't currently handle this error", buf, 0x16u);
          }
        }
LABEL_68:

      }
      v45 = (char *)v45 + 1;
      v7 = v80;
      if (v79 != v45)
        continue;
      break;
    }
    v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
    v79 = v68;
    if (v68)
      continue;
    break;
  }
LABEL_78:

  v19 = 0;
LABEL_79:
  v5 = v69;
LABEL_24:

  return v19;
}

- (id)viewNameForItem:(SecDbItem *)a3
{
  __CFDictionary *v5;
  __CFDictionary *v6;
  id v7;
  NSObject *v8;
  CFTypeRef v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v19;
  __int16 v20;
  SecDbItem *v21;

  cf = 0;
  v5 = sub_10001904C(a3, 0x10000, 0, (__CFString **)&cf);
  v6 = v5;
  if (cf)
  {
    v7 = sub_10000BDF4(CFSTR("ckks"), 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = cf;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't fetch attributes from item: %@", buf, 0xCu);
    }

    v9 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v9);
    }
    v10 = 0;
  }
  else
  {
    -[__CFDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", a3->var1->var0, kSecClass);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapDictionaryToView:", v6));

    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v13 = sub_10000BDF4(CFSTR("ckks"), 0);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
        *(_DWORD *)buf = 138412547;
        v19 = v15;
        v20 = 2113;
        v21 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No view returned from policy (%@): %{private}@", buf, 0x16u);

      }
    }

  }
  return v10;
}

- (id)keychainMusrForCurrentAccount
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "personaUniqueString"));

  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v3);
    v5 = v4;
    if (v4)
    {
      v9[0] = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend(v4, "getUUIDBytes:", v9);
      v6 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9, 16));
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    }
    v7 = (void *)v6;

  }
  else
  {
    if (qword_100341188 != -1)
      dispatch_once(&qword_100341188, &stru_1002DED08);
    v7 = (void *)CFRetain((CFTypeRef)qword_100341190);
  }

  return v7;
}

- (void)inspectErrorForRetryAfter:(id)a3
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = CKRetryAfterSecondsForError();
  if (v5 != 0.0)
  {
    v6 = v5;
    v7 = 1000000000 * (unint64_t)v5;
    v8 = sub_10000BDF4(CFSTR("ckkszonemodifier"), 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CK operation failed with rate-limit, scheduling delay for %.1f seconds: %@", (uint8_t *)&v11, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies cloudkitRetryAfter](self, "cloudkitRetryAfter"));
    objc_msgSend(v10, "waitUntil:", v7);

  }
}

- (NSSet)allPriorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllPriorityViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)allViews
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkoperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKDatabase)ckdatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCkdatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CKOperationGroup)currentOutgoingQueueOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentOutgoingQueueOperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OctagonStateFlagHandler)flagHandler
{
  return (OctagonStateFlagHandler *)objc_getProperty(self, a2, 96, 1);
}

- (SecLaunchSequence)overallLaunch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 104, 1);
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 112, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 120, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)peerProviders
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPeerProviders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSyncingPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKKSDatabaseProviderProtocol)databaseProvider
{
  return (CKKSDatabaseProviderProtocol *)objc_getProperty(self, a2, 152, 1);
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (CKKSNearFutureScheduler)requestPolicyCheck
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRequestPolicyCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSHashTable)keysetProviderOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 176, 1);
}

- (void)setKeysetProviderOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (CKKSNearFutureScheduler)cloudkitRetryAfter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 184, 1);
}

- (NSSet)viewsOverride
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (void)setViewsOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (BOOL)limitOperationToPriorityViewsSet
{
  return self->_limitOperationToPriorityViewsSet;
}

- (void)setLimitOperationToPriorityViewsSet:(BOOL)a3
{
  self->_limitOperationToPriorityViewsSet = a3;
}

- (BOOL)zoneModifierHalted
{
  return self->_zoneModifierHalted;
}

- (void)setZoneModifierHalted:(BOOL)a3
{
  self->_zoneModifierHalted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsOverride, 0);
  objc_storeStrong((id *)&self->_cloudkitRetryAfter, 0);
  objc_storeStrong((id *)&self->_keysetProviderOperations, 0);
  objc_storeStrong((id *)&self->_requestPolicyCheck, 0);
  objc_storeStrong((id *)&self->_savedTLKNotifier, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_syncingPolicy, 0);
  objc_storeStrong((id *)&self->_peerProviders, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_overallLaunch, 0);
  objc_storeStrong((id *)&self->_flagHandler, 0);
  objc_storeStrong((id *)&self->_currentOutgoingQueueOperationGroup, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_ckdatabase, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_currentFetchReasons, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_allPriorityViews, 0);
}

@end
