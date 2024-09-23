@implementation SBLayoutStateSceneIdentityProvider

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, a4, 0, 1, 0, 1, 0, 0, *MEMORY[0x1E0CEBE48], 0);
}

- (id)_sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 allowCanMatches:(BOOL)a6 preferNewScene:(BOOL)a7 allowSceneCreation:(BOOL)a8 visibleIdentifiers:(id)a9 excludingIdentifiers:(id)a10 sceneSessionRole:(id)a11 preferredDisplay:(id)a12
{
  _BOOL4 v12;
  _BOOL8 v13;
  id v17;
  id v18;
  SBLayoutStateSceneIdentityProvider *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id WeakRetained;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  const char *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v74;
  id v75;
  void *v76;
  id v77;
  SBLayoutStateSceneIdentityProvider *v78;
  _BOOL4 v79;
  _BOOL4 v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id obj;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v80 = a8;
  v12 = a7;
  v13 = a6;
  v111 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v92 = a5;
  v98 = a9;
  v97 = a10;
  v90 = a11;
  v19 = self;
  v20 = a12;
  -[SBLayoutStateSceneIdentityProvider _identifierForApplication:](self, "_identifierForApplication:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_87;
    goto LABEL_89;
  }
  v81 = v12;
  objc_msgSend(v17, "info");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "supportsMultiwindow");

  if (!v24)
  {
    v22 = 0;
    v18 = 0;
    goto LABEL_87;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "layoutStateManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "defaultSceneIdentifierForBundleIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:visibleSceneIdentifiers:excludingSceneIdentifiers:sceneSessionRole:preferredDisplay:", v21, v92, v13, v12, v98, v97, v90, v20);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v27)
    goto LABEL_85;
  objc_msgSend(v17, "_dataStore");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "externalApplicationSceneHandles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "transientApplicationSceneHandlesForApplication:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v28;
  if (v29)
  {
    v30 = v29;
    objc_msgSend(v29, "setByAddingObjectsFromSet:", v28);
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = v28;
  }
  v75 = WeakRetained;
  v76 = v21;
  v77 = v20;
  v78 = v19;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v31;
  v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
  if (!v95)
  {
    v94 = 0;
    v32 = 0;
    v96 = 0;
    v27 = 0;
    goto LABEL_84;
  }
  v94 = 0;
  v32 = 0;
  v96 = 0;
  v27 = 0;
  v79 = !v13;
  v93 = *(_QWORD *)v101;
  v86 = v17;
  while (2)
  {
    for (i = 0; i != v95; ++i)
    {
      v34 = v27;
      if (*(_QWORD *)v101 != v93)
        objc_enumerationMutation(obj);
      v35 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
      objc_msgSend(v35, "sceneIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v97, "containsObject:", v36);
      v38 = objc_msgSend(v98, "containsObject:", v36);
      objc_msgSend(v35, "application");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqual:", v17);

      if (!v40)
        goto LABEL_75;
      if (!__sb__runningInSpringBoard())
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "userInterfaceIdiom");

        if (v43 != 1 || !v92)
          goto LABEL_25;
LABEL_22:
        objc_msgSend(v35, "sceneIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "sceneStoreForIdentifier:creatingIfNecessary:", v44, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "objectForKey:", CFSTR("sceneSessionRole"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v46, "isEqual:", v90))
        {
LABEL_73:

LABEL_74:
          goto LABEL_75;
        }
        v83 = v45;
        v84 = v46;
        objc_msgSend(v45, "objectForKey:", CFSTR("activationConditions"));
        v82 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v82, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v47;
        if (v47)
          v48 = v47;
        else
          v48 = objc_alloc_init(MEMORY[0x1E0CEA920]);
        v89 = v48;
        v50 = v92;
        +[SBFocusAppConfigurationContextMonitor sharedInstance](SBFocusAppConfigurationContextMonitor, "sharedInstance");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "bundleIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "targetContentIdentifierPrefixForBundleIdentifier:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v88 = v53;
        if (v53)
        {
          SBLogCommon();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v105 = 0;
            v106 = 2114;
            v107 = v53;
            _os_log_impl(&dword_1D0540000, v54, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for scene evaluation %{public}@:%{public}@", buf, 0x16u);
          }

          objc_msgSend(v53, "stringByAppendingString:", v50);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v55 = v50;
        }
        v99 = 0;
        v56 = objc_msgSend(v89, "_suitabilityForTargetContentIdentifier:errorString:", v55, &v99);
        v57 = v99;
        v58 = v57;
        v59 = v85;
        if (v56 != 2)
        {
          if (v56 != 1)
          {
            if (v56)
            {
              v17 = v86;
              v61 = (void *)v82;
              if (v57)
              {
LABEL_68:
                SBLogCommon();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v17, "bundleIdentifier");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543619;
                  v105 = v72;
                  v106 = 2113;
                  v107 = v58;
                  _os_log_error_impl(&dword_1D0540000, v70, OS_LOG_TYPE_ERROR, "error evaluating UISceneActivationConditions for %{public}@: %{private}@", buf, 0x16u);

                  v59 = v85;
                }

              }
LABEL_71:

              if (v32)
              {

                v27 = v34;
                goto LABEL_84;
              }
              v45 = v83;
              v46 = v84;
              goto LABEL_73;
            }
            SBLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = (void *)v82;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v105 = 0;
              v106 = 2114;
              v107 = v85;
              v108 = 2114;
              v109 = v55;
              _os_log_impl(&dword_1D0540000, v60, OS_LOG_TYPE_DEFAULT, "Scene is not suitable for activationConditions %{public}@:%{public}@ %{public}@", buf, 0x20u);
            }
            v17 = v86;
LABEL_67:

            if (v58)
              goto LABEL_68;
            goto LABEL_71;
          }
          if (((v37 | v38 | v79) & 1) == 0)
          {
            if (v96)
              v62 = v96;
            else
              v62 = v36;
            v63 = v62;

            v96 = v63;
            v59 = v85;
          }
          v17 = v86;
          SBLogCommon();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v82;
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            goto LABEL_67;
          *(_DWORD *)buf = 138543874;
          v105 = 0;
          v106 = 2114;
          v107 = v59;
          v108 = 2114;
          v109 = v55;
          v64 = v60;
          v65 = "Scene is suitable for activationConditions %{public}@:%{public}@ %{public}@";
LABEL_66:
          _os_log_impl(&dword_1D0540000, v64, OS_LOG_TYPE_DEFAULT, v65, buf, 0x20u);
          goto LABEL_67;
        }
        if (((v37 | v38) & 1) != 0)
        {
          v17 = v86;
          if (((v37 | v38 ^ 1) & 1) != 0)
          {
            v61 = (void *)v82;
LABEL_64:
            SBLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              goto LABEL_67;
            *(_DWORD *)buf = 138543874;
            v105 = 0;
            v106 = 2114;
            v107 = v59;
            v108 = 2114;
            v109 = v55;
            v64 = v60;
            v65 = "Scene is preferred for activationConditions %{public}@:%{public}@ %{public}@";
            goto LABEL_66;
          }
          v66 = v85;
          v68 = v94;
          if (v94)
            v67 = v94;
          else
            v67 = v36;
          v94 = v67;
        }
        else
        {
          v66 = v85;
          if (v32)
            v67 = v32;
          else
            v67 = v36;
          v68 = v32;
          v32 = v67;
          v17 = v86;
        }
        v61 = (void *)v82;
        v69 = v67;

        v59 = v66;
        goto LABEL_64;
      }
      v41 = SBFEffectiveDeviceClass();
      if (v92 && v41 == 2)
        goto LABEL_22;
LABEL_25:
      if (((v37 | v38) & 1) == 0 && !v81)
      {
        if (v32)
          v49 = v32;
        else
          v49 = v36;
        v45 = v32;
        v32 = v49;
        goto LABEL_74;
      }
LABEL_75:
      v71 = v96;
      if (!v96)
        v71 = v94;
      if (v32)
        v71 = v32;
      v27 = v71;

    }
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (v95)
      continue;
    break;
  }
LABEL_84:

  v20 = v77;
  v19 = v78;
  WeakRetained = v75;
  v21 = v76;
  if (v27)
  {
LABEL_85:
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v27);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  v18 = 0;

  if (!v22)
  {
LABEL_87:
    if (v80)
      v22 = -[SBLayoutStateSceneIdentityProvider newSceneIdentityForApplication:](v19, "newSceneIdentityForApplication:", v17);
  }
LABEL_89:

  return v22;
}

- (id)_identifierForApplication:(id)a3
{
  return (id)objc_msgSend(a3, "bundleIdentifier");
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v4, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(WeakRetained, "newSceneIdentifierForBundleIdentifier:supportsMultiwindow:", v5, objc_msgSend(v7, "supportsMultiwindow"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.LoginUI")))
    v9 = CFSTR("LoginWorkspace");
  else
    v9 = 0;
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:workspaceIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[SBLayoutStateSceneIdentityProvider _identifierForApplication:](self, "_identifierForApplication:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutStateSceneIdentityProvider dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentLayoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "unlockedEnvironmentMode") == 3)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__SBLayoutStateSceneIdentityProvider_sceneIdentityForApplication_createPrimaryIfRequired_sceneSessionRole___block_invoke;
    v24[3] = &unk_1E8E9DF50;
    v25 = v8;
    objc_msgSend(v13, "latestItemPassingTest:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v8, "info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsMultiwindow");

  if (v19 && v6)
  {
    objc_msgSend(v11, "layoutStateManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "primarySceneIdentifierForBundleIdentifier:sceneSessionRole:displayIdentity:", v10, v9, self->_displayIdentity);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = -[SBLayoutStateSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", v8);
    }
    v17 = v22;

  }
  else
  {
    -[SBLayoutStateSceneIdentityProvider sceneIdentityForApplication:](self, "sceneIdentityForApplication:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v17;
}

- (id)sceneIdentityForApplication:(id)a3
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, 0, 0, 1, 0, 1, 0, 0, *MEMORY[0x1E0CEBE48], 0);
}

- (SBLayoutStateSceneIdentityProviderDataSource)dataSource
{
  return (SBLayoutStateSceneIdentityProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, a4, a5, 1, 0, 1, 0, 0, *MEMORY[0x1E0CEBE48], 0);
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, 0, a4, a5, a6, a7, a8, 0, *MEMORY[0x1E0CEBE48], a9);
}

- (SBLayoutStateSceneIdentityProvider)initWithDisplayIdentity:(id)a3
{
  id v5;
  SBLayoutStateSceneIdentityProvider *v6;
  SBLayoutStateSceneIdentityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLayoutStateSceneIdentityProvider;
  v6 = -[SBLayoutStateSceneIdentityProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_displayIdentity, a3);

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, 0, 0, 1, 0, 1, 0, a4, *MEMORY[0x1E0CEBE48], 0);
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, 0, a4, 1, 0, 1, 0, 0, *MEMORY[0x1E0CEBE48], 0);
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, 0, a4, a5, a6, 1, a7, 0, *MEMORY[0x1E0CEBE48], 0);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6
{
  return -[SBLayoutStateSceneIdentityProvider _sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:](self, "_sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:excludingIdentifiers:sceneSessionRole:preferredDisplay:", a3, a4, a5, 1, 0, 1, 0, 0, a6, 0);
}

uint64_t __107__SBLayoutStateSceneIdentityProvider_sceneIdentityForApplication_createPrimaryIfRequired_sceneSessionRole___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
