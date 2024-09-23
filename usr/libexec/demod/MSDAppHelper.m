@implementation MSDAppHelper

+ (id)sharedInstance
{
  if (qword_100175428 != -1)
    dispatch_once(&qword_100175428, &stru_10013F090);
  return (id)qword_100175420;
}

- (id)installedApps
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allApplications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationType", (_QWORD)v14));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("User")))
        {
          v12 = objc_msgSend(v10, "isPlaceholder");

          if ((v12 & 1) != 0)
            continue;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)visibleApps
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  v3 = objc_alloc_init((Class)SBSHomeScreenService);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allHomeScreenApplicationBundleIdentifiers"));
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v2));
  return v5;
}

- (id)runningApps:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingProcessTypeApplication](RBSProcessPredicate, "predicateMatchingProcessTypeApplication"));
  v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  objc_msgSend(v5, "setValues:", 1);
  v7 = FBSSceneVisibilityEndowmentNamespace;
  v42 = FBSSceneVisibilityEndowmentNamespace;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  objc_msgSend(v5, "setEndowmentNamespaces:", v8);

  v38 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessState statesForPredicate:withDescriptor:error:](RBSProcessState, "statesForPredicate:withDescriptor:error:", v6, v5, &v38));
  v10 = v38;
  v11 = v10;
  if (v9)
  {
    v28 = v10;
    v30 = v6;
    v31 = v5;
    v33 = objc_claimAutoreleasedReturnValue(-[MSDAppHelper visibleApps](self, "visibleApps"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = v9;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (!v13)
      goto LABEL_22;
    v14 = v13;
    v15 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v18 = objc_msgSend(v17, "taskState");
        if (v3)
        {
          if ((_DWORD)v18 != 2 && objc_msgSend(v17, "taskState") != 4)
            goto LABEL_19;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endowmentNamespaces"));
          v20 = objc_msgSend(v19, "containsObject:", v7);

          if ((v20 & 1) == 0)
            goto LABEL_19;
        }
        else if (!RBSTaskStateIsRunning(v18))
        {
          goto LABEL_19;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "process"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundle"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

        if (!v23)
        {
          v24 = sub_1000604F0();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to extract app bundle ID from process state: %{public}@", buf, 0xCu);
          }

LABEL_19:
          v23 = 0;
          goto LABEL_20;
        }
        if (-[NSObject containsObject:](v33, "containsObject:", v23))
          objc_msgSend(v32, "addObject:", v23);
LABEL_20:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (!v14)
      {
LABEL_22:

        v6 = v30;
        v5 = v31;
        v11 = v28;
        v9 = v29;
        goto LABEL_23;
      }
    }
  }
  v27 = sub_1000604F0();
  v33 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    sub_1000C2774(v11);
LABEL_23:

  return v32;
}

- (id)runningApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  id v24;
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
  uint64_t v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingProcessTypeApplication](RBSProcessPredicate, "predicateMatchingProcessTypeApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  objc_msgSend(v3, "setValues:", 1);
  v36 = FBSSceneVisibilityEndowmentNamespace;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  objc_msgSend(v3, "setEndowmentNamespaces:", v6);

  v32 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessState statesForPredicate:withDescriptor:error:](RBSProcessState, "statesForPredicate:withDescriptor:error:", v4, v3, &v32));
  v8 = v32;
  v9 = v8;
  if (v7)
  {
    v24 = v8;
    v26 = v4;
    v27 = v3;
    v10 = objc_claimAutoreleasedReturnValue(-[MSDAppHelper visibleApps](self, "visibleApps"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (!v12)
      goto LABEL_17;
    v13 = v12;
    v14 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (!RBSTaskStateIsRunning(objc_msgSend(v16, "taskState")))
          goto LABEL_14;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "process"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

        if (!v19)
        {
          v20 = sub_1000604F0();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to extract app bundle ID from process state: %{public}@", buf, 0xCu);
          }

LABEL_14:
          v19 = 0;
          goto LABEL_15;
        }
        if (-[NSObject containsObject:](v10, "containsObject:", v19))
          objc_msgSend(v5, "addObject:", v19);
LABEL_15:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (!v13)
      {
LABEL_17:

        v4 = v26;
        v3 = v27;
        v9 = v24;
        v7 = v25;
        goto LABEL_18;
      }
    }
  }
  v23 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1000C2774(v9);
LABEL_18:

  return v5;
}

- (id)bundleLocalizedNameForInstalledApp:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C27EC((uint64_t)v3, v5);

    v6 = 0;
  }

  return v6;
}

- (id)bundlePathForInstalledApp:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  return v5;
}

- (BOOL)stopAllAppsExcept:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v4 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allApplications"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
        v12 = objc_msgSend(v4, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppHelper acquireAppTerminationAssertionForApp:](self, "acquireAppTerminationAssertionForApp:", v13));

          if (v14)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
            -[MSDAppHelper releaseAppTerminationAssertion:forApp:](self, "releaseAppTerminationAssertion:forApp:", v14, v15);
          }
          else
          {
            v16 = sub_1000604F0();
            v15 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationIdentifier"));
              *(_DWORD *)buf = 138543362;
              v25 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to acquire termination assertion for app:  %{public}@", buf, 0xCu);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  return 1;
}

- (id)acquireAppTerminationAssertionForApp:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000C29C0();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v3));
  v7 = objc_alloc((Class)RBSTerminateContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Installing application %@"), "stringByAppendingString:", v3));
  v9 = objc_msgSend(v7, "initWithExplanation:", v8);

  objc_msgSend(v9, "setMaximumTerminationResistance:", 50);
  v10 = objc_msgSend(objc_alloc((Class)RBSTerminationAssertion), "initWithPredicate:context:", v6, v9);
  if (v10)
  {
    v11 = v10;
    v19 = 0;
    v12 = -[NSObject acquireWithError:](v10, "acquireWithError:", &v19);
    v13 = v19;
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_1000C28DC();
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000C293C((uint64_t)v3, v13);

      v16 = v11;
      v11 = 0;
    }
  }
  else
  {
    v18 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C2870();
    v11 = 0;
    v13 = 0;
  }

  return v11;
}

- (void)releaseAppTerminationAssertion:(id)a3 forApp:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000C2B04();

  if (v5)
  {
    v10 = objc_opt_class(RBSTerminationAssertion, v9);
    if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
    {
      v16 = 0;
      v11 = objc_msgSend(v5, "invalidateWithError:", &v16);
      v12 = v16;
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          sub_1000C2A20();
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_1000C2A80((uint64_t)v6, v12);
      }

    }
  }

}

@end
