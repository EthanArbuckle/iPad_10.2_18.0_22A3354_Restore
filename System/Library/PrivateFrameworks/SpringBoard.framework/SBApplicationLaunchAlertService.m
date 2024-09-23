@implementation SBApplicationLaunchAlertService

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;

  objc_msgSend(a4, "scene", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBApplicationLaunchAlertService _sceneWillBecomeForeground:](self, "_sceneWillBecomeForeground:", v5);

}

- (void)_sceneWillBecomeForeground:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    if (objc_msgSend(v6, "contentState") == 2)
    {
      -[SBApplicationLaunchAlertService _sceneDidBecomeForeground:](self, "_sceneDidBecomeForeground:", v6);
    }
    else
    {
      objc_msgSend(v6, "addObserver:", self);
      -[NSMutableSet addObject:](self->_foregroundingScenes, "addObject:", v6);
    }
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_foregroundingScenes, "containsObject:")
    && objc_msgSend(v4, "contentState") == 2)
  {
    -[SBApplicationLaunchAlertService _sceneDidBecomeForeground:](self, "_sceneDidBecomeForeground:", v4);
  }

}

- (void)_sceneDidBecomeForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "removeObserver:", self);
  -[NSMutableSet removeObject:](self->_foregroundingScenes, "removeObject:", v11);
  objc_msgSend(v11, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_mapBundleIDToLaunchAlertInfo, "objectForKey:", v6);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (v7 = -[_SBApplicationLaunchAlertInfo initWithBundleID:]([_SBApplicationLaunchAlertInfo alloc], v6), -[NSMutableDictionary setObject:forKey:](self->_mapBundleIDToLaunchAlertInfo, "setObject:forKey:", v7, v6), v7))
    {
      v8 = (void *)v7[2];
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "addObject:", v11);
    if (!v10)
      -[SBApplicationLaunchAlertService _tryShowLaunchAlertsForLaunchAlertInfo:](self, "_tryShowLaunchAlertsForLaunchAlertInfo:", v7);

  }
}

- (void)_tryShowLaunchAlertsForLaunchAlertInfo:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = v4[1];
  else
    v5 = 0;
  -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_launchAlertEvaluators;
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v7);
          v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "shouldShowLaunchAlertForApplication:", v6, (_QWORD)v13);
        }
        v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);

      if (v10)
        -[SBApplicationLaunchAlertService _reallyShowLaunchAlertOfType:withLaunchAlertInfo:application:](self, "_reallyShowLaunchAlertOfType:withLaunchAlertInfo:application:", v10, v4, v6);
    }
    else
    {

    }
  }

}

- (SBApplicationLaunchAlertService)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 77, CFSTR("Init is unavailable."));

  return 0;
}

- (id)initObservingSceneManagers:(id)a3 launchAlertEvaluators:(id)a4 applicationController:(id)a5 alertItemsController:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBApplicationLaunchAlertService *v16;
  SBApplicationLaunchAlertService *v17;
  NSMutableSet *v18;
  NSMutableSet *foregroundingScenes;
  NSMutableDictionary *v20;
  NSMutableDictionary *mapBundleIDToLaunchAlertInfo;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneManagers"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

      if (v15)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objb = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objb, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchAlertEvaluators"));

  if (!v14)
    goto LABEL_24;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objd = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objd, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItemsController"));

LABEL_5:
  v51.receiver = self;
  v51.super_class = (Class)SBApplicationLaunchAlertService;
  v16 = -[SBApplicationLaunchAlertService init](&v51, sel_init);
  v17 = v16;
  if (v16)
  {
    v34 = v15;
    v35 = v14;
    v36 = v13;
    objc_storeStrong((id *)&v16->_applicationController, a5);
    objc_storeStrong((id *)&v17->_alertItemsController, a6);
    objc_storeStrong((id *)&v17->_launchAlertEvaluators, a4);
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundingScenes = v17->_foregroundingScenes;
    v17->_foregroundingScenes = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapBundleIDToLaunchAlertInfo = v17->_mapBundleIDToLaunchAlertInfo;
    v17->_mapBundleIDToLaunchAlertInfo = v20;

    objc_storeStrong((id *)&v17->_sceneManagers, a3);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = v12;
    obj = v12;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v25);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v26, "externalForegroundApplicationSceneHandles");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v44;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v44 != v30)
                  objc_enumerationMutation(v27);
                objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v31), "scene");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBApplicationLaunchAlertService _sceneWillBecomeForeground:](v17, "_sceneWillBecomeForeground:", v32);

                ++v31;
              }
              while (v29 != v31);
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v29);
          }

          objc_msgSend(v26, "addObserver:", v17);
          ++v25;
        }
        while (v25 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v23);
    }

    v13 = v36;
    v12 = v37;
    v15 = v34;
    v14 = v35;
  }

  return v17;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 109, CFSTR("Must be invalidated before deallocating."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationLaunchAlertService;
  -[SBApplicationLaunchAlertService dealloc](&v5, sel_dealloc);
}

- (void)showLaunchAlertOfType:(unint64_t)a3 forApplication:(id)a4
{
  void *v7;
  NSMutableDictionary *mapBundleIDToLaunchAlertInfo;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  BSDispatchQueueAssertMain();
  v7 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

    v7 = 0;
  }
  mapBundleIDToLaunchAlertInfo = self->_mapBundleIDToLaunchAlertInfo;
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapBundleIDToLaunchAlertInfo, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && !self->_invalidated && v10)
    -[SBApplicationLaunchAlertService _reallyShowLaunchAlertOfType:withLaunchAlertInfo:application:](self, "_reallyShowLaunchAlertOfType:withLaunchAlertInfo:application:", a3, v10, v12);

}

- (NSString)description
{
  return (NSString *)-[SBApplicationLaunchAlertService descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableSet *foregroundingScenes;
  NSMutableDictionary *mapBundleIDToLaunchAlertInfo;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = (void *)-[NSMutableDictionary copy](self->_mapBundleIDToLaunchAlertInfo, "copy");
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        -[SBApplicationLaunchAlertService _invalidateAndDismissLaunchAlertsForLaunchAlertInfo:](self, "_invalidateAndDismissLaunchAlertsForLaunchAlertInfo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_foregroundingScenes;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13++), "removeObserver:", self);
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_sceneManagers;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "removeObserver:", self, (_QWORD)v21);
      }
      while (v16 != v18);
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v16);
  }

  foregroundingScenes = self->_foregroundingScenes;
  self->_foregroundingScenes = 0;

  mapBundleIDToLaunchAlertInfo = self->_mapBundleIDToLaunchAlertInfo;
  self->_mapBundleIDToLaunchAlertInfo = 0;

  self->_invalidated = 1;
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;

  objc_msgSend(a4, "scene", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBApplicationLaunchAlertService _sceneDidResignForeground:](self, "_sceneDidResignForeground:", v5);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBApplicationLaunchAlertService succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplicationLaunchAlertService descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SBApplicationLaunchAlertService succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_mapBundleIDToLaunchAlertInfo, CFSTR("bundleIDsToLaunchAlertInfo"), 1);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_foregroundingScenes, CFSTR("foregroundingScenes"), 1);
  return v4;
}

- (void)_sceneDidResignForeground:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    objc_msgSend(v13, "removeObserver:", self);
    -[NSMutableSet removeObject:](self->_foregroundingScenes, "removeObject:", v13);
    objc_msgSend(v13, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_mapBundleIDToLaunchAlertInfo, "objectForKey:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        v10 = *(id *)(v8 + 16);
        objc_msgSend(v10, "removeObject:", v13);
        v11 = objc_msgSend(v10, "count");

        if (!v11)
          -[SBApplicationLaunchAlertService _invalidateAndDismissLaunchAlertsForLaunchAlertInfo:](self, "_invalidateAndDismissLaunchAlertsForLaunchAlertInfo:", v9);
      }

    }
  }

}

- (void)_reallyShowLaunchAlertOfType:(unint64_t)a3 withLaunchAlertInfo:(id)a4 application:(id)a5
{
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  uint8x8_t v12;
  int v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  void (*v28)(_QWORD *);
  void *v29;
  SBApplicationLaunchAlertService *v30;
  uint64_t *v31;
  uint64_t *v32;
  SEL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  char v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__33;
  v44 = __Block_byref_object_dispose__33;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__33;
  v38 = __Block_byref_object_dispose__33;
  v39 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = (void (*)(_QWORD *))__96__SBApplicationLaunchAlertService__reallyShowLaunchAlertOfType_withLaunchAlertInfo_application___block_invoke;
  v29 = &unk_1E8EAA6A8;
  v30 = self;
  v31 = &v34;
  v32 = &v40;
  v33 = a2;
  v11 = v27;
  if (a3)
  {
    v46 = 0;
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.i32[0];
    if (v12.i32[0])
    {
      v14 = 0;
      do
      {
        if (((1 << v14) & a3) != 0)
        {
          v28(v11);
          if (v46)
            break;
          --v13;
        }
        if (v14 > 0x3E)
          break;
        ++v14;
      }
      while (v13 > 0);
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = (id)v41[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v47, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v15);
        if (v9)
          v19 = (void *)v9[3];
        else
          v19 = 0;
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
        v21 = v19;
        objc_msgSend(v21, "addObject:", v20, (_QWORD)v23);

        -[SBAlertItemsController activateAlertItem:](self->_alertItemsController, "activateAlertItem:", v35[5]);
        objc_msgSend(v10, "setHasDisplayedLaunchAlert:forType:", 1, a3);
        ++v18;
      }
      while (v16 != v18);
      v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v47, 16);
      v16 = v22;
    }
    while (v22);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

}

void __96__SBApplicationLaunchAlertService__reallyShowLaunchAlertOfType_withLaunchAlertInfo_application___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  switch(a2)
  {
    case -1:
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("SBApplicationLaunchAlertService.m"), 291, CFSTR("Cannot show an application launch alert for All or None."));
      goto LABEL_7;
    case 1:
      v7 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_6;
    case 2:
      v7 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
      goto LABEL_6;
    case 4:
      v7 = SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem;
LABEL_6:
      v8 = objc_alloc_init(v7);
      v9 = *(_QWORD *)(a1[5] + 8);
      v6 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
LABEL_7:

      break;
    default:
      break;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v10)
  {
    v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    }
    objc_msgSend(v11, "addObject:", v10);
  }
}

- (void)_invalidateAndDismissLaunchAlertsForLaunchAlertInfo:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)v5[3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLaunchAlertService.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchAlertInfo"));

    v7 = 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
  }
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[SBAlertItemsController deactivateAlertItem:](self->_alertItemsController, "deactivateAlertItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (v6)
    v13 = v6[1];
  else
    v13 = 0;
  -[NSMutableDictionary removeObjectForKey:](self->_mapBundleIDToLaunchAlertInfo, "removeObjectForKey:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapBundleIDToLaunchAlertInfo, 0);
  objc_storeStrong((id *)&self->_foregroundingScenes, 0);
  objc_storeStrong((id *)&self->_sceneManagers, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_launchAlertEvaluators, 0);
}

@end
