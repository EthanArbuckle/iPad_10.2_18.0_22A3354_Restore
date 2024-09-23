@implementation SBSceneManager

- (id)transientApplicationSceneHandlesForApplication:(id)a3
{
  id v4;
  NSMapTable *transientMapSceneIdentityToSceneHandle;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  transientMapSceneIdentityToSceneHandle = self->_transientMapSceneIdentityToSceneHandle;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBSceneManager_transientApplicationSceneHandlesForApplication___block_invoke;
  v9[3] = &unk_1E8EA2AA8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMapTable bs_each:](transientMapSceneIdentityToSceneHandle, "bs_each:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)isValid
{
  return self->_state != 2;
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  -[SBSceneManager windowScene](self, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "medusaHostedKeyboardWindowController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scene:didCompleteUpdateWithContext:error:", v12, v9, v8);

  -[SBSceneManager _noteDidCommitUpdateForScene:](self, "_noteDidCommitUpdateForScene:", v12);
}

- (id)topmostForegroundUIScenesMatching:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  v4 = a3;
  -[SBSceneManager allScenes](self, "allScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SBSceneManager_topmostForegroundUIScenesMatching___block_invoke;
  v12[3] = &unk_1E8EA29A0;
  v7 = v4;
  v14 = v7;
  v15 = v16;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  _Block_object_dispose(v16, 8);
  return v10;
}

- (id)allScenes
{
  return (id)-[BSCopyingCacheSet immutableSet](self->_allScenes, "immutableSet");
}

- (SBLayoutStateTransitionCoordinator)_layoutStateTransitionCoordinator
{
  void *v4;
  void *v5;
  void *v7;

  -[SBSceneManager _sbWindowScene](self, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1473, CFSTR("%@ has no layout state transition coordinator- does your corresponding window scene exist yet?"), self);

  }
  return (SBLayoutStateTransitionCoordinator *)v5;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1392, CFSTR("cannot respond to scene events after invalidation"));

  }
  objc_msgSend(v13, "animationFence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && -[SBSceneManager _shouldFenceTransitionForScene:updatedClientSettingsDiff:oldClientSettings:transitionContext:](self, "_shouldFenceTransitionForScene:updatedClientSettingsDiff:oldClientSettings:transitionContext:", v18, v11, v12, v13))
  {
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", v14);
  }
  -[SBSceneManager _scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](self, "_scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v18, v11, v12, v13);
  -[SBSceneManager windowScene](self, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "medusaHostedKeyboardWindowController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v18, v11, v12, v13);

}

- (id)daemonScenes
{
  return (id)-[BSCopyingCacheSet immutableSet](self->_daemonScenes, "immutableSet");
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  SBAppClientSettingObserverContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v22, "clientProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isApplicationProcess") && (objc_msgSend(v14, "isCurrentProcess") & 1) == 0)
  {
    if ((objc_msgSend(v12, "isUISubclass") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 823, CFSTR("expected oldClientSettings to be a UISubclass"));

    }
    -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(SBAppClientSettingObserverContext);
    -[SBAppClientSettingObserverContext setScene:](v16, "setScene:", v22);
    objc_msgSend(v15, "application");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppClientSettingObserverContext setApp:](v16, "setApp:", v17);

    -[SBAppClientSettingObserverContext setSceneHandle:](v16, "setSceneHandle:", v15);
    objc_msgSend(v22, "uiSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppClientSettingObserverContext setSettings:](v16, "setSettings:", v18);

    -[SBAppClientSettingObserverContext setOldClientSettings:](v16, "setOldClientSettings:", v12);
    objc_msgSend(v22, "uiClientSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppClientSettingObserverContext setUpdatedClientSettings:](v16, "setUpdatedClientSettings:", v19);

    -[SBAppClientSettingObserverContext setTransition:](v16, "setTransition:", v13);
    -[SBSceneManager _appSceneClientSettingsDiffInspector](self, "_appSceneClientSettingsDiffInspector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "evaluateWithInspector:context:", v20, v16);

  }
}

- (id)externalForegroundApplicationSceneHandles
{
  return (id)-[BSCopyingCacheSet immutableSet](self->_reportedExternalForegroundApplicationSceneHandles, "immutableSet");
}

- (id)existingSceneHandleForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager existingSceneHandleForSceneIdentity:](self, "existingSceneHandleForSceneIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingSceneHandleForSceneIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_persistentMapSceneIdentityToSceneHandle, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSMapTable objectForKey:](self->_transientMapSceneIdentityToSceneHandle, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:uniqueIdentifier:](self->_sceneIdentityProvider, "sceneIdentityForApplication:uniqueIdentifier:", a3, a4);
}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  -[SBSceneManager _scene:interceptUpdateWithNewSettings:](self, "_scene:interceptUpdateWithNewSettings:", a4, a5);
}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isForeground");

  if ((v8 & 1) == 0)
  {
    SBLogWorkspace();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Not fencing scene transistion with scene: %@ because it is backgrounded", (uint8_t *)&v11, 0xCu);
    }

  }
  return v8;
}

void __52__SBSceneManager_topmostForegroundUIScenesMatching___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  id *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isForeground")
    && objc_msgSend(v4, "isUISubclass")
    && (*(unsigned int (**)(void))(a1[5] + 16))())
  {
    objc_msgSend(v3, "level");
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(double *)(v6 + 24);
    if (v5 > v7)
    {
      *(double *)(v6 + 24) = v5;
      v9 = (void *)a1[4];
      v8 = (id *)(a1 + 4);
      objc_msgSend(v9, "removeAllObjects");
LABEL_8:
      objc_msgSend(*v8, "addObject:", v10);
      goto LABEL_9;
    }
    if (v5 == v7)
    {
      v8 = (id *)(a1 + 4);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (id)_sbWindowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "embeddedDisplayWindowScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)windowScene
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FBSDisplayIdentity)displayIdentity
{
  return -[SBSceneManagerReference displayIdentity](self->_selfReference, "displayIdentity");
}

- (id)assertBackgroundedStatusForScenes:(id)a3
{
  id v4;
  SBSceneBackgroundedStatusAssertion *v5;
  uint64_t v6;
  SBSceneBackgroundedStatusAssertion *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = [SBSceneBackgroundedStatusAssertion alloc];
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke;
    v10[3] = &unk_1E8EA2A80;
    v10[4] = self;
    v7 = -[SBSceneBackgroundedStatusAssertion initWithScenes:invalidationHandler:](v5, "initWithScenes:invalidationHandler:", v4, v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_52;
    v9[3] = &unk_1E8EA2978;
    v9[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("default");
  }
  -[SBSceneManager sceneIdentifierForBundleIdentifier:uniqueIdentifier:](self, "sceneIdentifierForBundleIdentifier:uniqueIdentifier:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sceneIdentifierForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@-%@"), CFSTR("sceneID"), a3, a4);
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  BSCopyingCacheSet *externalApplicationSceneHandles;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_msgSend(v7, "transitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1407, CFSTR("cannot respond to non-destruction scene events after invalidation"));

  }
  -[SBSceneManager _updateStateForScene:withSettings:](self, "_updateStateForScene:withSettings:", v19, v9);
  -[SBSceneManager _scene:willUpdateWithSettings:transitionContext:](self, "_scene:willUpdateWithSettings:transitionContext:", v19, v9, v8);
  externalApplicationSceneHandles = self->_externalApplicationSceneHandles;
  -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(externalApplicationSceneHandles) = -[BSCopyingCacheSet containsObject:](externalApplicationSceneHandles, "containsObject:", v11);

  if ((_DWORD)externalApplicationSceneHandles)
  {
    -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BSCopyingCacheSet containsObject:](self->_externalApplicationSceneHandles, "containsObject:", v12))
    {
      v13 = objc_opt_class();
      v14 = v12;
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      v17 = objc_msgSend(v16, "shouldAlwaysDisplayLiveContent");
      if ((v17 & 1) == 0)
        -[SBSceneSnapshotRequestor requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:](self->_snapshotRequestor, "requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:", v14, v9, v7);
    }

  }
}

- (void)_updateStateForScene:(id)a3 withSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BSCopyingCacheSet *allScenes;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  unsigned int v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.PosterBoard"));

  if (v7
    && ((-[BSCopyingCacheSet containsObject:](self->_externalApplicationSceneHandles, "containsObject:", v7) ^ 1 | v10) & 1) == 0)
  {
    allScenes = self->_allScenes;
    objc_msgSend(v7, "sceneIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BSCopyingCacheSet containsObject:](allScenes, "containsObject:", v12);

    if ((_DWORD)v13)
    {
      v14 = -[BSCopyingCacheSet containsObject:](self->_reportedExternalForegroundApplicationSceneHandles, "containsObject:", v7) ^ 1;
      v15 = v14;
    }
    else
    {
      v14 = 0;
      v15 = 1;
    }
    if (objc_msgSend(v6, "isForeground"))
    {
      v16 = -[NSCountedSet containsObject:](self->_assertedBackgroundScenes, "containsObject:", v19);
      objc_msgSend(v19, "clientProcess");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isCurrentProcess") & 1) == 0)
      {
        -[BSCopyingCacheSet addObject:](self->_externalForegroundApplicationSceneHandles, "addObject:", v7);
        if (v16)
          -[SBSceneManager _removeReportedForegroundExternalApplicationSceneHandle:](self, "_removeReportedForegroundExternalApplicationSceneHandle:", v7);
        else
          -[SBSceneManager _addReportedForegroundExternalApplicationSceneHandle:](self, "_addReportedForegroundExternalApplicationSceneHandle:", v7);
      }

    }
    else
    {
      -[SBSceneManager _removeReportedForegroundExternalApplicationSceneHandle:](self, "_removeReportedForegroundExternalApplicationSceneHandle:", v7);
      -[BSCopyingCacheSet removeObject:](self->_externalForegroundApplicationSceneHandles, "removeObject:", v7);
    }
    v18 = -[BSCopyingCacheSet containsObject:](self->_reportedExternalForegroundApplicationSceneHandles, "containsObject:", v7);
    if ((v15 | v18) != 1 || (v14 & v18 & 1) != 0 || v13 != 1)
      -[SBSceneManager _noteDidChangeToVisibility:previouslyExisted:forScene:](self, "_noteDidChangeToVisibility:previouslyExisted:forScene:", v18, v13, v19);
  }

}

- (void)_addReportedForegroundExternalApplicationSceneHandle:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if ((-[BSCopyingCacheSet containsObject:](self->_reportedExternalForegroundApplicationSceneHandles, "containsObject:", v4) & 1) == 0)
  {
    -[BSCopyingCacheSet addObject:](self->_reportedExternalForegroundApplicationSceneHandles, "addObject:", v4);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__SBSceneManager__addReportedForegroundExternalApplicationSceneHandle___block_invoke;
    v5[3] = &unk_1E8EA2B90;
    v5[4] = self;
    v6 = v4;
    -[SBSceneManager _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", v5);

  }
}

- (id)externalApplicationSceneHandles
{
  return (id)-[BSCopyingCacheSet immutableSet](self->_externalApplicationSceneHandles, "immutableSet");
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __71__SBSceneManager__addReportedForegroundExternalApplicationSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneManager:didAddExternalForegroundApplicationSceneHandle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1232, CFSTR("Application is required for creating an application scene handle."));

  }
  objc_msgSend(v5, "sceneDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSceneManager existingSceneHandleForSceneIdentity:](self, "existingSceneHandleForSceneIdentity:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_applicationSceneHandleClass");
    objc_msgSend(v5, "existingScene");
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = [v13 alloc];
    if (v11)
    {
      -[SBSceneManager displayIdentity](self, "displayIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "_initWithApplication:scene:displayIdentity:", v6, v11, v15);

      -[NSMapTable setObject:forKey:](self->_persistentMapSceneIdentityToSceneHandle, "setObject:forKey:", v10, v8);
      SBLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v17;
        v25 = 2112;
        v26 = v10;
        v18 = "[%{public}@] Created PERSISTENT sceneHandle: %@";
LABEL_13:
        _os_log_debug_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v23, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v5, "sceneDefinition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneManager displayIdentity](self, "displayIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "_initWithApplication:sceneDefinition:displayIdentity:", v6, v19, v20);

      -[NSMapTable setObject:forKey:](self->_transientMapSceneIdentityToSceneHandle, "setObject:forKey:", v10, v8);
      SBLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v17;
        v25 = 2112;
        v26 = v10;
        v18 = "[%{public}@] Created TRANSIENT sceneHandle: %@";
        goto LABEL_13;
      }
    }

    objc_msgSend(v10, "_setManuallyControlsLifecycle:", 1);
    goto LABEL_11;
  }
  v10 = (void *)v9;
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v12;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Fetched existing sceneHandle: %@", (uint8_t *)&v23, 0x16u);

  }
LABEL_11:

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:createPrimaryIfRequired:sceneSessionRole:](self->_sceneIdentityProvider, "sceneIdentityForApplication:createPrimaryIfRequired:sceneSessionRole:", a3, a4, a5);
}

+ (Class)_applicationSceneHandleClass
{
  return (Class)objc_opt_class();
}

- (id)childTransactionsForTransitionRequest:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_childTransactionProviders;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "childTransactionsForTransitionRequest:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          if (v8)
            objc_msgSend(v8, "unionSet:", v11);
          else
            v8 = (void *)objc_msgSend(v11, "mutableCopy");
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3
{
  return -[SBSceneSnapshotRequestor preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:](self->_snapshotRequestor, "preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:", a3);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:](self->_sceneIdentityProvider, "sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:", a3, a4, a5);
}

- (id)newSceneIdentityForApplication:(id)a3
{
  return (id)-[SBApplicationSceneIdentityProviding newSceneIdentityForApplication:](self->_sceneIdentityProvider, "newSceneIdentityForApplication:", a3);
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  -[SBSceneManager _addScene:](self, "_addScene:", a4);
}

- (void)_addScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BSCopyingCacheSet *workspaceScenes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBApplicationSceneHandleRequest *v13;
  void *v14;
  void *v15;
  SBApplicationSceneHandleRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a3;
  v27 = v5;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1275, CFSTR("cannot respond to non-destruction scene events after invalidation"));

    v5 = v27;
  }
  -[SBSceneManagerReference retainForScene:](self->_selfReference, "retainForScene:", v5);
  if (-[SBSceneManager _shouldAutoHostScene:](self, "_shouldAutoHostScene:", v27))
  {
    -[BSCopyingCacheSet addObject:](self->_boundScenes, "addObject:", v27);
    -[UIScenePresentationBinder addScene:](self->_presentationBinder, "addScene:", v27);
  }
  objc_msgSend(v27, "clientProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "workspaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    workspaceScenes = self->_workspaceScenes;
LABEL_17:
    -[BSCopyingCacheSet addObject:](workspaceScenes, "addObject:", v27);
    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "isApplicationProcess"))
  {
    workspaceScenes = self->_daemonScenes;
    goto LABEL_17;
  }
  if ((objc_msgSend(v6, "isCurrentProcess") & 1) == 0)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "clientProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationWithBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1291, CFSTR("Unable to fetch SBApplication for scene: %@"), v27);

    }
    v13 = [SBApplicationSceneHandleRequest alloc];
    objc_msgSend(v27, "definition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManager displayIdentity](self, "displayIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBApplicationSceneHandleRequest initWithApplication:sceneDefinition:displayIdentity:](v13, "initWithApplication:sceneDefinition:displayIdentity:", v12, v14, v15);

    -[SBApplicationSceneHandleRequest setExistingScene:](v16, "setExistingScene:", v27);
    -[SBSceneManager fetchOrCreateApplicationSceneHandleForRequest:](self, "fetchOrCreateApplicationSceneHandleForRequest:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1295, CFSTR("Unable to fetch or create a scene handle."));

    }
    objc_msgSend(v17, "_definition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_persistentMapSceneIdentityToSceneHandle, "setObject:forKey:", v17, v19);
    -[NSMapTable removeObjectForKey:](self->_transientMapSceneIdentityToSceneHandle, "removeObjectForKey:", v19);
    -[BSCopyingCacheSet addObject:](self->_externalApplicationSceneHandles, "addObject:", v17);
    if (objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.springboard.homeScreenIconStyle")))
    {
      objc_opt_self();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addExtension:", v20);

    }
  }
LABEL_18:
  -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    objc_msgSend(v21, "_noteSceneCreated:", v27);
  objc_msgSend(v27, "settings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager _updateStateForScene:withSettings:](self, "_updateStateForScene:withSettings:", v27, v23);

  -[SBSceneManager _updateIconStyleSettingsOnScene:](self, "_updateIconStyleSettingsOnScene:", v27);
  -[BSCopyingCacheSet addObject:](self->_allScenes, "addObject:", v27);

}

- (void)addObserver:(id)a3
{
  void *v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:preferredDisplay:](self->_sceneIdentityProvider, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:preferredDisplay:", a3, a4, a5, a6, a7, a8);
}

void __65__SBSceneManager_transientApplicationSceneHandlesForApplication___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1383, CFSTR("cannot respond to scene events after invalidation"));

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v21;
    *(_QWORD *)&v11 = 138543618;
    v19 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!-[SBSceneManager _handleAction:forScene:](self, "_handleAction:forScene:", v15, v7, v19, (_QWORD)v20))
        {
          SBLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v17;
            v26 = 2112;
            v27 = v15;
            _os_log_error_impl(&dword_1D0540000, v16, OS_LOG_TYPE_ERROR, "Ignoring unhandled action directed at scene %{public}@: %@", buf, 0x16u);

          }
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }

}

- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return -[SBSceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](self, "initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:", a3, a4, a5, 0);
}

- (SBSceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  SBSceneManager *v16;
  uint64_t v17;
  FBSceneManager *sceneManager;
  SBPolicyAggregator *v19;
  SBPolicyAggregator *policyAggregator;
  uint64_t v21;
  NSMapTable *transientMapSceneIdentityToSceneHandle;
  uint64_t v23;
  NSMapTable *persistentMapSceneIdentityToSceneHandle;
  BSCopyingCacheSet *v25;
  BSCopyingCacheSet *boundScenes;
  BSCopyingCacheSet *v27;
  BSCopyingCacheSet *boundSingleScenes;
  BSCopyingCacheSet *v29;
  BSCopyingCacheSet *boundPointerUIScenes;
  BSCopyingCacheSet *v31;
  BSCopyingCacheSet *allScenes;
  BSCopyingCacheSet *v33;
  BSCopyingCacheSet *externalApplicationSceneHandles;
  BSCopyingCacheSet *v35;
  BSCopyingCacheSet *externalForegroundApplicationSceneHandles;
  BSCopyingCacheSet *v37;
  BSCopyingCacheSet *reportedExternalForegroundApplicationSceneHandles;
  BSCopyingCacheSet *v39;
  BSCopyingCacheSet *daemonScenes;
  BSCopyingCacheSet *v41;
  BSCopyingCacheSet *workspaceScenes;
  NSCountedSet *v43;
  NSCountedSet *assertedBackgroundScenes;
  SBSceneSnapshotRequestor *v45;
  SBSceneSnapshotRequestor *snapshotRequestor;
  void *v47;
  void *v48;
  uint64_t v49;
  SBUserInterfaceStyleProvider *userInterfaceStyleProvider;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reference"));

  }
  objc_msgSend(v12, "displayIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v13)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reference displayIdentity]"));

    if (v13)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentityProvider"));

LABEL_5:
  v56.receiver = self;
  v56.super_class = (Class)SBSceneManager;
  v16 = -[SBSceneManager init](&v56, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    sceneManager = v16->_sceneManager;
    v16->_sceneManager = (FBSceneManager *)v17;

    objc_storeStrong((id *)&v16->_selfReference, a3);
    v19 = objc_alloc_init(SBPolicyAggregator);
    policyAggregator = v16->_policyAggregator;
    v16->_policyAggregator = v19;

    objc_storeStrong((id *)&v16->_presentationBinder, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    transientMapSceneIdentityToSceneHandle = v16->_transientMapSceneIdentityToSceneHandle;
    v16->_transientMapSceneIdentityToSceneHandle = (NSMapTable *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    persistentMapSceneIdentityToSceneHandle = v16->_persistentMapSceneIdentityToSceneHandle;
    v16->_persistentMapSceneIdentityToSceneHandle = (NSMapTable *)v23;

    v25 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    boundScenes = v16->_boundScenes;
    v16->_boundScenes = v25;

    v27 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    boundSingleScenes = v16->_boundSingleScenes;
    v16->_boundSingleScenes = v27;

    v29 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    boundPointerUIScenes = v16->_boundPointerUIScenes;
    v16->_boundPointerUIScenes = v29;

    v31 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    allScenes = v16->_allScenes;
    v16->_allScenes = v31;

    v33 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    externalApplicationSceneHandles = v16->_externalApplicationSceneHandles;
    v16->_externalApplicationSceneHandles = v33;

    v35 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    externalForegroundApplicationSceneHandles = v16->_externalForegroundApplicationSceneHandles;
    v16->_externalForegroundApplicationSceneHandles = v35;

    v37 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    reportedExternalForegroundApplicationSceneHandles = v16->_reportedExternalForegroundApplicationSceneHandles;
    v16->_reportedExternalForegroundApplicationSceneHandles = v37;

    v39 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    daemonScenes = v16->_daemonScenes;
    v16->_daemonScenes = v39;

    v41 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    workspaceScenes = v16->_workspaceScenes;
    v16->_workspaceScenes = v41;

    v43 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    assertedBackgroundScenes = v16->_assertedBackgroundScenes;
    v16->_assertedBackgroundScenes = v43;

    objc_storeStrong((id *)&v16->_sceneIdentityProvider, a4);
    if (a6 == 1)
    {
      v45 = -[SBSceneSnapshotRequestor initWithDelegate:]([SBSceneSnapshotRequestor alloc], "initWithDelegate:", v16);
      snapshotRequestor = v16->_snapshotRequestor;
      v16->_snapshotRequestor = v45;

    }
    v47 = (void *)SBApp;
    objc_msgSend(v12, "displayIdentity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "userInterfaceStyleProviderForDisplay:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    userInterfaceStyleProvider = v16->_userInterfaceStyleProvider;
    v16->_userInterfaceStyleProvider = (SBUserInterfaceStyleProvider *)v49;

    -[SBUserInterfaceStyleProvider addObserver:](v16->_userInterfaceStyleProvider, "addObserver:", v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObserver:selector:name:object:", v16, sel_bootCompleted_, CFSTR("SBBootCompleteNotification"), 0);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  SBSceneManagerReference *v4;
  SBSceneManagerReference *v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBSceneManagerReference *v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIScenePresentationBinder invalidate](self->_presentationBinder, "invalidate");
  -[SBSceneSnapshotRequestor invalidate](self->_snapshotRequestor, "invalidate");
  -[SBUserInterfaceStyleProvider removeObserver:](self->_userInterfaceStyleProvider, "removeObserver:", self);
  v4 = self->_selfReference;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __25__SBSceneManager_dealloc__block_invoke;
  v10 = &unk_1E8E9DED8;
  v11 = v4;
  v5 = v4;
  BSDispatchMain();

  v6.receiver = self;
  v6.super_class = (Class)SBSceneManager;
  -[SBSceneManager dealloc](&v6, sel_dealloc);
}

uint64_t __25__SBSceneManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)invalidate
{
  BSCopyingCacheSet *v3;
  BSCopyingCacheSet *boundScenes;
  UIScenePresentationBinder *presentationBinder;
  SBSceneSnapshotRequestor *snapshotRequestor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBSceneManager *v14;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManager invalidate]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBSceneManager.m"), 245, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_state)
  {
    self->_state = 1;
    v3 = (BSCopyingCacheSet *)objc_alloc_init(MEMORY[0x1E0D01728]);
    boundScenes = self->_boundScenes;
    self->_boundScenes = v3;

    -[UIScenePresentationBinder invalidate](self->_presentationBinder, "invalidate");
    presentationBinder = self->_presentationBinder;
    self->_presentationBinder = 0;

    -[SBSceneSnapshotRequestor invalidate](self->_snapshotRequestor, "invalidate");
    snapshotRequestor = self->_snapshotRequestor;
    self->_snapshotRequestor = 0;

    -[SBUserInterfaceStyleProvider removeObserver:](self->_userInterfaceStyleProvider, "removeObserver:", self);
    -[BSCopyingCacheSet immutableSet](self->_allScenes, "immutableSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D22968];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __28__SBSceneManager_invalidate__block_invoke;
    v12[3] = &unk_1E8E9E820;
    v13 = v7;
    v14 = self;
    v11 = v7;
    objc_msgSend(v8, "synchronizeChanges:", v12);
    self->_state = 2;
    -[SBSceneManagerReference invalidate](self->_selfReference, "invalidate");
    -[SBSceneManager _noteObserversDidInvalidate](self, "_noteObserversDidInvalidate");

  }
}

uint64_t __28__SBSceneManager_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__SBSceneManager_invalidate__block_invoke_2;
  v3[3] = &unk_1E8EA2978;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __28__SBSceneManager_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destroyScene:withTransitionContext:", v3, 0);

}

- (SBPolicyAggregatorCapabilityQuerying)policyAggregator
{
  return (SBPolicyAggregatorCapabilityQuerying *)self->_policyAggregator;
}

- (id)scenesForWorkspaceWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BSCopyingCacheSet immutableSet](self->_workspaceScenes, "immutableSet", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "workspaceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)transferOwnershipOfSceneWithIdentity:(id)a3 toSceneManager:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  SBApplicationSceneHandleRequest *v24;
  void *v25;
  void *v26;
  void *v27;
  SBApplicationSceneHandleRequest *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  _QWORD v40[5];
  id v41;
  NSObject *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  SBSceneManager *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v44 = v10;
    v45 = 2048;
    v46 = self;
    v47 = 2114;
    v48 = v6;
    v49 = 2114;
    v50 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[%@-%p] Transferring ownership of scene %{public}@ to %{public}@", buf, 0x2Au);

  }
  -[SBSceneManager existingSceneHandleForSceneIdentity:](self, "existingSceneHandleForSceneIdentity:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneIfExists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v37 = v6;
    v14 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke;
    v40[3] = &unk_1E8EA29C8;
    v40[4] = self;
    v15 = v12;
    v41 = v15;
    v36 = v7;
    v16 = v7;
    v42 = v16;
    -[SBSceneManager _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", v40);
    -[SBSceneManager _prepareToRemoveScene:withReason:](self, "_prepareToRemoveScene:withReason:", v15, 1);
    -[SBSceneManager _removeScene:withReason:](self, "_removeScene:withReason:", v15, 1);
    -[NSObject _addScene:](v16, "_addScene:", v15);
    -[NSObject displayIdentity](v16, "displayIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isEqual:", v20))
    {
      objc_msgSend(v15, "updateSettingsWithBlock:", &__block_literal_global_30);
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v44 = v23;
        v45 = 2048;
        v46 = self;
        v47 = 2114;
        v48 = v18;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[%@-%p] Clearing displayConfigurationForSceneManagers because the scene's displayConfiguration matches the sceneManager's displayConfiguration: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v38[0] = v14;
      v38[1] = 3221225472;
      v38[2] = __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_47;
      v38[3] = &unk_1E8EA2A30;
      v30 = v18;
      v39 = v30;
      objc_msgSend(v15, "updateSettingsWithBlock:", v38);
      SBLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v44 = v33;
        v45 = 2048;
        v46 = self;
        v47 = 2114;
        v48 = v20;
        v49 = 2114;
        v50 = v30;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "[%@-%p] Setting displayConfigurationForSceneManagers because the scene's displayConfiguration %{public}@ does NOT match the sceneManager's displayConfiguration: %{public}@", buf, 0x2Au);

      }
      v21 = v39;
    }

    -[NSObject existingSceneHandleForScene:](v16, "existingSceneHandleForScene:", v15);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34 && v11 != (void *)v34)
      objc_msgSend(v11, "_noteReplacedWithSceneHandle:", v34);

    v7 = v36;
    v6 = v37;
  }
  else
  {
    -[SBSceneManager _prepareToRemoveSceneHandle:withReason:](self, "_prepareToRemoveSceneHandle:withReason:", v11, 1);
    -[SBSceneManager _removeSceneHandle:withReason:](self, "_removeSceneHandle:withReason:", v11, 1);
    v24 = [SBApplicationSceneHandleRequest alloc];
    objc_msgSend(v11, "application");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_definition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject displayIdentity](v7, "displayIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SBApplicationSceneHandleRequest initWithApplication:sceneDefinition:displayIdentity:](v24, "initWithApplication:sceneDefinition:displayIdentity:", v25, v26, v27);

    v29 = (id)-[NSObject fetchOrCreateApplicationSceneHandleForRequest:](v7, "fetchOrCreateApplicationSceneHandleForRequest:", v28);
  }

}

void __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneManager:willMoveScene:toSceneManager:", a1[4], a1[5], a1[6]);

}

uint64_t __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_setDisplayConfigurationForSceneManagers:", 0);
}

uint64_t __70__SBSceneManager_transferOwnershipOfSceneWithIdentity_toSceneManager___block_invoke_47(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_setDisplayConfigurationForSceneManagers:", *(_QWORD *)(a1 + 32));
}

- (id)existingSceneHandleForPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SBSceneManager_existingSceneHandleForPersistenceIdentifier___block_invoke;
    v9[3] = &unk_1E8EA2A58;
    v10 = v4;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v9);
    ((void (**)(_QWORD, NSMapTable *))v6)[2](v6, self->_persistentMapSceneIdentityToSceneHandle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      ((void (**)(_QWORD, NSMapTable *))v6)[2](v6, self->_transientMapSceneIdentityToSceneHandle);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __62__SBSceneManager_existingSceneHandleForPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  do
  {
    v5 = v4;
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    objc_msgSend(v4, "persistenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  while (!v7);

  return v4;
}

- (id)externalApplicationSceneHandlesForBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SBSceneManager externalApplicationSceneHandles](self, "externalApplicationSceneHandles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "application");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "containsObject:", v13);

        if (v14)
        {
          v15 = objc_opt_class();
          v16 = v11;
          if (v15)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v16;
            else
              v17 = 0;
          }
          else
          {
            v17 = 0;
          }
          v18 = v17;

          objc_msgSend(v5, "addObject:", v18);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

uint64_t __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_2;
  v3[3] = &unk_1E8EA2978;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);
}

void __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogWorkspace();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Background status assertion invalidated for scene: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObject:", v3);
  if (objc_msgSend(v3, "isValid"))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneWithIdentifier:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v3)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v3, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_updateStateForScene:withSettings:", v3, v9);

    }
  }

}

void __52__SBSceneManager_assertBackgroundedStatusForScenes___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogWorkspace();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Asserting background status for scenes: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", v3);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateStateForScene:withSettings:", v3, v6);

}

- (void)addChildTransactionProvider:(id)a3
{
  void *v4;
  NSMutableSet *childTransactionProviders;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  v4 = v8;
  if (v8)
  {
    childTransactionProviders = self->_childTransactionProviders;
    if (!childTransactionProviders)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_childTransactionProviders;
      self->_childTransactionProviders = v6;

      childTransactionProviders = self->_childTransactionProviders;
    }
    -[NSMutableSet addObject:](childTransactionProviders, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeChildTransactionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableSet *childTransactionProviders;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v4 = v7;
  if (v7)
  {
    -[NSMutableSet removeObject:](self->_childTransactionProviders, "removeObject:", v7);
    v5 = -[NSMutableSet count](self->_childTransactionProviders, "count");
    v4 = v7;
    if (!v5)
    {
      childTransactionProviders = self->_childTransactionProviders;
      self->_childTransactionProviders = 0;

      v4 = v7;
    }
  }

}

- (void)removeObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  v4 = v5;
  if (v5)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
    v4 = v5;
  }

}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBSceneManager newSceneIdentifierForBundleIdentifier:supportsMultiwindow:](self, "newSceneIdentifierForBundleIdentifier:supportsMultiwindow:", v4, objc_msgSend(v7, "supportsMultiwindow"));

  return v8;
}

- (void)bootCompleted:(id)a3
{
  SBIconStyleProvider *v4;
  SBIconStyleProvider *iconStyleProvider;
  SBIconStyleProvider *v6;
  id v7;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance", a3);
  v4 = (SBIconStyleProvider *)objc_claimAutoreleasedReturnValue();
  iconStyleProvider = self->_iconStyleProvider;
  self->_iconStyleProvider = v4;

  -[SBIconStyleProvider addIconStyleObserver:](self->_iconStyleProvider, "addIconStyleObserver:", self);
  v6 = self->_iconStyleProvider;
  -[SBIconStyleProvider currentIconStyleConfiguration](v6, "currentIconStyleConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager iconStyleProvider:didUpdateIconStyleConfiguration:](self, "iconStyleProvider:didUpdateIconStyleConfiguration:", v6, v7);

}

- (NSString)debugDescription
{
  return (NSString *)-[SBSceneManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  SBSceneManager *v19;

  v4 = a3;
  -[SBSceneManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v17[3] = &unk_1E8E9E820;
  v7 = v5;
  v18 = v7;
  v19 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v17);

  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v15[3] = &unk_1E8E9E820;
  v15[4] = self;
  v8 = v7;
  v16 = v8;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("TransientScenes"), 0, v15);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v13[3] = &unk_1E8E9E820;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Scenes"), 0, v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayIdentity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("display"));

}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "succinctDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "immutableSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v14[3] = &unk_1E8EA2AD0;
  v15 = v3;
  v16 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "immutableSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *, _QWORD))v6)[2](v6, CFSTR("externalForegroundAppSceneHandles"), v7, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "immutableSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v12[3] = &unk_1E8EA2AF8;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "objectsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *, _QWORD))v6)[2](v6, CFSTR("externalBackgroundAppSceneHandles"), v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "immutableSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, _QWORD, void *))v6)[2](v6, CFSTR("otherWorkspace"), 0, v11);

  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD))v6)[2](v6, CFSTR("assertedBackground"), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
  ((void (**)(_QWORD, const __CFString *, _QWORD, id))v6)[2](v6, CFSTR("uncategorized"), 0, v5);

}

void __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = v13;
      v30 = v9;
      v31 = a1;
      v33 = v8;
      v15 = v7;
      v16 = 0;
      v17 = *(_QWORD *)v39;
      do
      {
        v18 = 0;
        v19 = v16;
        do
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v12);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
          objc_msgSend(v20, "succinctDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v21);

          objc_msgSend(v20, "sceneIfExists");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v11, "addObject:", v16);
          ++v18;
          v19 = v16;
        }
        while (v14 != v18);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v14);

      v7 = v15;
      a1 = v31;
      v8 = v33;
      v9 = v30;
    }

  }
  else if (objc_msgSend(v9, "count"))
  {
    v32 = a1;
    v29 = v7;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v27, "succinctDescription");
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v24);
    }

    v11 = v22;
    v7 = v29;
    a1 = v32;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", v11);
  objc_msgSend(*(id *)(a1 + 40), "appendArraySection:withName:skipIfEmpty:", v10, v7, 1);

}

uint64_t __56__SBSceneManager_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  int64_t state;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  state = self->_state;
  if (state == 1)
  {
    v6 = CFSTR("invalidating");
    goto LABEL_5;
  }
  if (state == 2)
  {
    v6 = CFSTR("invalidated");
LABEL_5:
    objc_msgSend(v3, "appendString:withName:", v6, 0);
  }
  return v4;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
    self->_hidden = a3;
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  return 0;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 0;
}

- (BOOL)_handleAction:(id)a3 forScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v6, "isValid") & 1) != 0)
    {
      -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBSceneSnapshotRequestor handleSnapshotRequestAction:forSceneHandle:](self->_snapshotRequestor, "handleSnapshotRequestAction:forSceneHandle:", v6, v8);
LABEL_17:

      goto LABEL_18;
    }
    XBLogCapture();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[SBSceneManager displayIdentity](self, "displayIdentity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v65 = v31;
      v66 = 2112;
      v67 = v32;
      v68 = 2112;
      v69 = v6;
      _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "[display:%@] [%@] Ignoring invalid snapshot action: %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_opt_class();
    -[SBSceneManager _windowScene](self, "_windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "switcherController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "prepareForIncomingCenterWindowAnimationWithAction:", v6);
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_opt_class();
    -[SBSceneManager _windowScene](self, "_windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "switcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v16, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "cleanUpAfterCompletingCenterWindowAnimationWithAction:", v6);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBSceneManager _windowScene](self, "_windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lockedPointerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
    objc_msgSend(v8, "clientWithSceneIdentifier:suppressPreferredLockStatus:", v21, 1);

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dispatchToHostGestureRecognizer");
  }
  else
  {
    v23 = objc_msgSend(v6, "UIActionType");
    if (v23 == 48)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("SBSceneResizeLayoutDidFinishNotificationSceneIdentifierKey");
      objc_msgSend(v7, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v33;
      v9 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBSceneResizeLayoutDidFinishNotification"), self, v34);

      goto LABEL_17;
    }
    if (v23 != 35)
      goto LABEL_41;
    -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = objc_opt_class();
      __BSSafeCast(v6, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "persistedIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v30 = 1;
      }
      else
      {
        v35 = objc_msgSend(v26, "isUserOriginatedRequest");
        objc_msgSend(v24, "application");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isApplicationRunningAsViewService:", v36);

        v57 = v36;
        objc_msgSend(v36, "bundleIdentifier");
        v39 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v39;
        if (v39)
        {
          v40 = v39;
          +[SBIconController sharedInstance](SBIconController, "sharedInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "model");
          v42 = v35;
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "expectedIconForDisplayIdentifier:", v40);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v43, "isIconVisible:", v44);

          v35 = v42;
          v45 = v40 ^ 1;
        }
        else
        {
          v45 = 1;
        }
        v46 = v35 & (v38 | v45);
        if (v46 == 1)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 3;
        }
        else
        {
          SBApplicationSceneEntityDestructionMakeIntent(objc_msgSend(v26, "preferredAnimationType"), objc_msgSend(v26, "destroySceneSession"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __41__SBSceneManager__handleAction_forScene___block_invoke;
          v58[3] = &unk_1E8EA2B20;
          v59 = v6;
          SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v48, v47, v58);

          v30 = 0;
          v28 = 0;
        }
        v29 = v46 ^ 1;

      }
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = 2;
    }
    if (v28)
    {
      SBLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[SBSceneManager _handleAction:forScene:].cold.1((uint64_t)v28, v49);

      v50 = (void *)MEMORY[0x1E0CB35C8];
      v51 = SBSceneManagerErrorDomain;
      v62 = *MEMORY[0x1E0CB2938];
      v63 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, v30, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA500]), "initWithInfo:error:", 0, v53);
      objc_msgSend(v6, "sendResponse:", v54);

    }
    if ((v29 & 1) == 0)
    {
LABEL_41:
      -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v55, "_handleSceneAction:", v6);

      goto LABEL_18;
    }
  }
LABEL_14:
  v9 = 1;
LABEL_18:

  return v9;
}

void __41__SBSceneManager__handleAction_forScene___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CEA500];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithInfo:error:", 0, v5);

  objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v6);
}

- (SBWindowScene)_windowScene
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v5;
}

- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  SBSceneManager *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "lastSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createLegacySceneFromRemnant:withSettings:transitionContext:", v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      FBSProcessPrettyDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = v15;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[%@-%p] Connected to remnant from %@: %@", (uint8_t *)&v23, 0x2Au);

    }
    objc_msgSend(v12, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isForeground");

    if (v19)
    {
      SBLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v22;
        v25 = 2048;
        v26 = self;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "[%@-%p] Sending foreground scene remnant to the background.", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(v12, "updateSettingsWithBlock:", &__block_literal_global_107);
    }
  }

}

uint64_t __65__SBSceneManager__reconnectSceneRemnant_forProcess_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

- (id)_appSceneClientSettingsDiffInspector
{
  return 0;
}

- (id)debugNameForSceneSnapshotRequestor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationForIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sceneSnapshotRequestContextForSceneSnapshotRequestor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBMutableSceneSnapshotRequestContext *v15;

  objc_msgSend((id)SBApp, "windowSceneManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "windowManagementStyle");
  objc_msgSend(v6, "layoutStateTransitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowSceneForDisplayIdentity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "switcherController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(SBMutableSceneSnapshotRequestContext);
  -[SBSceneSnapshotRequestContext setSceneDisplayReferenceFrameProvider:](v15, "setSceneDisplayReferenceFrameProvider:", v7);
  -[SBSceneSnapshotRequestContext setSceneDisplayWindowManagementStyle:](v15, "setSceneDisplayWindowManagementStyle:", v8);
  -[SBSceneSnapshotRequestContext setSceneDisplayLayoutStateTransitionContext:](v15, "setSceneDisplayLayoutStateTransitionContext:", v10);
  -[SBSceneSnapshotRequestContext setEmbeddedDisplayReferenceFrameProvider:](v15, "setEmbeddedDisplayReferenceFrameProvider:", v14);

  return v15;
}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  void *v6;

  if (self->_snapshotRequestor)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)_updateIconStyleSettingsOnScene:(id)a3
{
  SBIconStyleProvider *iconStyleProvider;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  iconStyleProvider = self->_iconStyleProvider;
  v4 = a3;
  -[SBIconStyleProvider currentIconStyleConfiguration](iconStyleProvider, "currentIconStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SBSceneManager__updateIconStyleSettingsOnScene___block_invoke;
  v7[3] = &unk_1E8EA2B68;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "performUpdate:", v7);

}

void __50__SBSceneManager__updateIconStyleSettingsOnScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFEB4B70))
    objc_msgSend(v3, "setIconStyleConfiguration:", *(_QWORD *)(a1 + 32));

}

- (void)_removeReportedForegroundExternalApplicationSceneHandle:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[BSCopyingCacheSet containsObject:](self->_reportedExternalForegroundApplicationSceneHandles, "containsObject:", v4))
  {
    -[BSCopyingCacheSet removeObject:](self->_reportedExternalForegroundApplicationSceneHandles, "removeObject:", v4);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__SBSceneManager__removeReportedForegroundExternalApplicationSceneHandle___block_invoke;
    v5[3] = &unk_1E8EA2B90;
    v5[4] = self;
    v6 = v4;
    -[SBSceneManager _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", v5);

  }
}

void __74__SBSceneManager__removeReportedForegroundExternalApplicationSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneManager:didRemoveExternalForegroundApplicationSceneHandle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_noteObserversDidInvalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__SBSceneManager__noteObserversDidInvalidate__block_invoke;
  v2[3] = &unk_1E8EA2BB8;
  v2[4] = self;
  -[SBSceneManager _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", v2);
}

void __45__SBSceneManager__noteObserversDidInvalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneManagerDidInvalidate:", *(_QWORD *)(a1 + 32));

}

- (int64_t)userInterfaceStyle
{
  return -[SBUserInterfaceStyleProvider currentStyle](self->_userInterfaceStyleProvider, "currentStyle");
}

- (void)addUserInterfaceStyleObserver:(id)a3
{
  void *v4;
  NSHashTable *userInterfaceStyleObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  v4 = v8;
  if (v8)
  {
    userInterfaceStyleObservers = self->_userInterfaceStyleObservers;
    if (!userInterfaceStyleObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_userInterfaceStyleObservers;
      self->_userInterfaceStyleObservers = v6;

      userInterfaceStyleObservers = self->_userInterfaceStyleObservers;
    }
    -[NSHashTable addObject:](userInterfaceStyleObservers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeUserInterfaceStyleObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  v4 = v5;
  if (v5)
  {
    -[NSHashTable removeObject:](self->_userInterfaceStyleObservers, "removeObject:", v5);
    v4 = v5;
  }

}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SBFStringForUIUserInterfaceStyle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Got a user interface style change, forwarding %{public}@ to scenes", buf, 0xCu);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke;
  v15[3] = &unk_1E8EA10F0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a4;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_2;
  v11[3] = &unk_1E8E9FBF0;
  v3 = a1[4];
  v4 = (void *)a1[5];
  v12 = v2;
  v13 = v3;
  v5 = (void *)MEMORY[0x1E0D229B0];
  v11[1] = 3221225472;
  v6 = v4;
  v8 = (void *)a1[6];
  v7 = a1[7];
  v14 = v6;
  v16 = v7;
  v15 = v8;
  v9 = v2;
  objc_msgSend(v5, "eventWithName:handler:", CFSTR("Forward user interface style change to scenes"), v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeOrAppendEvent:", v10);

}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void (**v27)(void);
  void (**v28)(void);
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  void *v42;
  id v43;
  void (**v44)(void);
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[4];
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[5];
  _QWORD v60[5];
  id v61;
  _QWORD v62[4];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__6;
  v60[4] = __Block_byref_object_dispose__6;
  objc_msgSend(*(id *)(a1 + 32), "acquireLockForReason:", CFSTR("Forward user interface style change to scenes"));
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_3;
  v59[3] = &unk_1E8E9ED40;
  v59[4] = v62;
  v28 = (void (**)(void))MEMORY[0x1D17E5550](v59);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_4;
  v55[3] = &unk_1E8EA2BE0;
  v57 = v62;
  v58 = v60;
  v56 = *(id *)(a1 + 32);
  v27 = (void (**)(void))MEMORY[0x1D17E5550](v55);
  v28[2]();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_5;
  v50[3] = &unk_1E8EA2C08;
  v50[4] = &v51;
  objc_msgSend(v2, "enumerateScenesWithBlock:", v50);

  objc_msgSend(*(id *)(a1 + 40), "allScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") || *((_BYTE *)v52 + 24))
  {

  }
  else
  {
    v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "count") == 0;

    if (v26)
    {
      v5 = 0;
      v4 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 48);
LABEL_5:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "allScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v65, 16);
  if (!v7)
    goto LABEL_18;
  v8 = *(_QWORD *)v47;
  obj = v6;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v47 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_msgSend(v10, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isUISubclass"))
      {
        objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (objc_msgSend(v11, "isForeground"))
          {

          }
          else
          {
            v13 = objc_msgSend(v11, "underLock");

            if (!v13)
              goto LABEL_16;
          }
          v28[2]();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_6;
          v40[3] = &unk_1E8EA2C30;
          v45 = *(_QWORD *)(a1 + 64);
          v41 = v4;
          v42 = v10;
          v43 = v5;
          v44 = v27;
          objc_msgSend(v10, "performUpdate:", v40);

        }
      }
LABEL_16:

    }
    v6 = obj;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v65, 16);
  }
  while (v7);
LABEL_18:

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 40) + 216);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v64, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "sceneManager:didUpdateUserInterfaceStyle:withAnimationSettings:fence:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v5, v4);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v64, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "connectedWindowScenes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v63, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "traitsPipelineManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "userInterfaceStyleDidUpdateWithAnimationSettings:fence:", v5, v4);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v63, 16);
    }
    while (v20);
  }

  if (v4)
  {
    v24 = (void *)MEMORY[0x1E0CD28B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_7;
    v30[3] = &unk_1E8E9E8D0;
    v31 = *(id *)(a1 + 56);
    objc_msgSend(v24, "bs_performAfterSynchronizedCommit:", v30);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
      (*(void (**)(void))(v25 + 16))();
  }
  v27[2]();

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v62, 8);
}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "relinquishLock:");
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v3 = *(void **)(v2 + 40);
      *(_QWORD *)(v2 + 40) = 0;

    }
  }
}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_5(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v12, "setAnimationFence:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityUIServerUISceneController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jobLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "clientHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v10 && (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled()))
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnimationSettings:", v11);

  }
  else
  {
    objc_msgSend(v12, "setAnimationSettings:", *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __98__SBSceneManager_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)iconStyleProvider:(id)a3 didUpdateIconStyleConfiguration:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Got an icon style change, forwarding %{public}@ to scenes", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D229B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_2;
  v8[3] = &unk_1E8E9E270;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v9 = v2;
  v10 = v4;
  v11 = v5;
  v6 = v2;
  objc_msgSend(v3, "eventWithName:handler:", CFSTR("Forward icon style change to scenes"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeOrAppendEvent:", v7);

}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_2(id *a1)
{
  void (**v1)(_QWORD);
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;
  id v17;
  void (**v18)(_QWORD);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__6;
  v31[4] = __Block_byref_object_dispose__6;
  objc_msgSend(a1[4], "acquireLockForReason:", CFSTR("Forward icon style change to scenes"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_3;
  v30[3] = &unk_1E8E9ED40;
  v30[4] = v33;
  v1 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v30);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_4;
  v26[3] = &unk_1E8EA2BE0;
  v28 = v33;
  v29 = v31;
  v27 = a1[4];
  v2 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v26);
  v1[2](v1);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_5;
  v23[3] = &unk_1E8EA2C08;
  v23[4] = v24;
  objc_msgSend(v3, "enumerateScenesWithBlock:", v23);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1[5], "allScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "settings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isUISubclass"))
        {
          objc_msgSend(v9, "sb_displayIdentityForSceneManagers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if (objc_msgSend(v9, "isForeground"))
            {

            }
            else
            {
              v11 = objc_msgSend(v9, "underLock");

              if (!v11)
                goto LABEL_12;
            }
            v1[2](v1);
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_6;
            v13[3] = &unk_1E8EA2C58;
            v14 = a1[6];
            v15 = 0;
            v16 = v8;
            v17 = 0;
            v18 = v2;
            objc_msgSend(v8, "performUpdate:", v13);

          }
        }
LABEL_12:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
    }
    while (v5);
  }

  v2[2](v2);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

uint64_t __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "relinquishLock:");
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v3 = *(void **)(v2 + 40);
      *(_QWORD *)(v2 + 40) = 0;

    }
  }
}

uint64_t __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_5(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __68__SBSceneManager_iconStyleProvider_didUpdateIconStyleConfiguration___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EFEB4B70))
    objc_msgSend(v13, "setIconStyleConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setAnimationFence:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityUIServerUISceneController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jobLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "clientHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  if (v11 && (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled()))
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationSettings:", v12);

  }
  else
  {
    objc_msgSend(v5, "setAnimationSettings:", *(_QWORD *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (id)sceneIdentityForApplication:(id)a3
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:](self->_sceneIdentityProvider, "sceneIdentityForApplication:", a3);
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:targetContentIdentifier:](self->_sceneIdentityProvider, "sceneIdentityForApplication:targetContentIdentifier:", a3, a4);
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:visibleIdentifiers:](self->_sceneIdentityProvider, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:visibleIdentifiers:", a3, a4, a5, a6, a7);
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:excludingIdentifiers:](self->_sceneIdentityProvider, "sceneIdentityForApplication:excludingIdentifiers:", a3, a4);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6
{
  return (id)-[SBApplicationSceneIdentityProviding sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:sceneSessionRole:](self->_sceneIdentityProvider, "sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:sceneSessionRole:", a3, a4, a5, a6);
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  -[SBSceneManager _prepareToRemoveScene:withReason:](self, "_prepareToRemoveScene:withReason:", a4, 0);
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  -[SBSceneManager _removeScene:withReason:](self, "_removeScene:withReason:", a4, 0);
}

- (void)_prepareToRemoveScene:(id)a3 withReason:(int64_t)a4
{
  SBSceneSnapshotRequestor *snapshotRequestor;
  id v7;
  void *v8;
  void *v9;
  id v10;

  snapshotRequestor = self->_snapshotRequestor;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneSnapshotRequestor invalidatePendingSnapshotsForSceneID:](snapshotRequestor, "invalidatePendingSnapshotsForSceneID:", v8);

  -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    -[SBSceneManager _prepareToRemoveSceneHandle:withReason:](self, "_prepareToRemoveSceneHandle:withReason:", v10, a4);
    v9 = v10;
  }

}

- (void)_prepareToRemoveSceneHandle:(id)a3 withReason:(int64_t)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  int64_t v9;

  v6 = a3;
  if (-[BSCopyingCacheSet containsObject:](self->_reportedExternalForegroundApplicationSceneHandles, "containsObject:", v6))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SBSceneManager__prepareToRemoveSceneHandle_withReason___block_invoke;
    v7[3] = &unk_1E8EA2C80;
    v7[4] = self;
    v8 = v6;
    v9 = a4;
    -[SBSceneManager _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", v7);

  }
}

void __57__SBSceneManager__prepareToRemoveSceneHandle_withReason___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneManager:willRemoveExternalForegroundApplicationSceneHandle:withReason:", a1[4], a1[5], a1[6]);

}

- (void)_removeScene:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[BSCopyingCacheSet removeObject:](self->_allScenes, "removeObject:", v7);
  -[BSCopyingCacheSet removeObject:](self->_daemonScenes, "removeObject:", v7);
  -[BSCopyingCacheSet removeObject:](self->_workspaceScenes, "removeObject:", v7);
  -[SBSceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBSceneManager _removeSceneHandle:withReason:](self, "_removeSceneHandle:withReason:", v6, a4);
  -[SBSceneManagerReference releaseForScene:](self->_selfReference, "releaseForScene:", v7);
  -[BSCopyingCacheSet removeObject:](self->_boundScenes, "removeObject:", v7);
  -[UIScenePresentationBinder removeScene:](self->_presentationBinder, "removeScene:", v7);

}

- (void)_removeSceneHandle:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[BSCopyingCacheSet removeObject:](self->_externalApplicationSceneHandles, "removeObject:", v9);
  -[BSCopyingCacheSet removeObject:](self->_externalForegroundApplicationSceneHandles, "removeObject:", v9);
  -[SBSceneManager _removeReportedForegroundExternalApplicationSceneHandle:](self, "_removeReportedForegroundExternalApplicationSceneHandle:", v9);
  objc_msgSend(v9, "_definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    -[NSMapTable removeObjectForKey:](self->_transientMapSceneIdentityToSceneHandle, "removeObjectForKey:", v7);
    -[NSMapTable removeObjectForKey:](self->_persistentMapSceneIdentityToSceneHandle, "removeObjectForKey:", v7);
  }
  else if (!a4)
  {
    -[NSMapTable setObject:forKey:](self->_transientMapSceneIdentityToSceneHandle, "setObject:forKey:", v9, v7);
    -[NSMapTable removeObjectForKey:](self->_persistentMapSceneIdentityToSceneHandle, "removeObjectForKey:", v7);
    objc_msgSend(v9, "sceneIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_noteSceneDestroyed:", v8);

  }
}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1437, CFSTR("cannot answer scene questions after invalidation"));

  }
  objc_msgSend(v8, "clientProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isApplicationProcess") && (objc_msgSend(v9, "isCurrentProcess") & 1) == 0)
  {
    objc_msgSend(v8, "definition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "specification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init((Class)objc_msgSend(v13, "transitionContextClass"));

    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0CEA350]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SBLayoutState)currentLayoutState
{
  return self->_currentLayoutState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_iconStyleProvider, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleObservers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_sceneIdentityProvider, 0);
  objc_storeStrong((id *)&self->_childTransactionProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertedBackgroundScenes, 0);
  objc_storeStrong((id *)&self->_reportedExternalForegroundApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_externalForegroundApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_externalApplicationSceneHandles, 0);
  objc_storeStrong((id *)&self->_workspaceScenes, 0);
  objc_storeStrong((id *)&self->_daemonScenes, 0);
  objc_storeStrong((id *)&self->_allScenes, 0);
  objc_storeStrong((id *)&self->_boundPointerUIScenes, 0);
  objc_storeStrong((id *)&self->_boundSingleScenes, 0);
  objc_storeStrong((id *)&self->_boundScenes, 0);
  objc_storeStrong((id *)&self->_transientMapSceneIdentityToSceneHandle, 0);
  objc_storeStrong((id *)&self->_persistentMapSceneIdentityToSceneHandle, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_snapshotRequestor, 0);
  objc_storeStrong((id *)&self->_presentationBinder, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (NSSet)boundPointerUIScenes
{
  return (NSSet *)-[BSCopyingCacheSet immutableSet](self->_boundPointerUIScenes, "immutableSet");
}

- (void)startTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3
{
  -[BSCopyingCacheSet addObject:](self->_allScenes, "addObject:", a3);
}

- (void)stopTrackingSystemUISceneForInterfaceStyleUpdatePurposes:(id)a3
{
  -[BSCopyingCacheSet removeObject:](self->_allScenes, "removeObject:", a3);
}

- (void)addSystemUISceneToPresentationBinder:(id)a3
{
  BSCopyingCacheSet *boundSingleScenes;
  id v5;

  boundSingleScenes = self->_boundSingleScenes;
  v5 = a3;
  -[SBSceneManager _addSceneToPresentationBinder:trackedCollection:](self, "_addSceneToPresentationBinder:trackedCollection:", v5, boundSingleScenes);
  -[BSCopyingCacheSet removeObject:](self->_allScenes, "removeObject:", v5);

}

- (void)removeSystemUISceneFromPresentationBinder:(id)a3
{
  -[SBSceneManager _removeSceneFromPresentationBinder:trackedCollection:](self, "_removeSceneFromPresentationBinder:trackedCollection:", a3, self->_boundSingleScenes);
}

- (void)addPointerUISceneToPresentationBinder:(id)a3
{
  -[SBSceneManager _addSceneToPresentationBinder:trackedCollection:](self, "_addSceneToPresentationBinder:trackedCollection:", a3, self->_boundPointerUIScenes);
}

- (void)removePointerUISceneFromPresentationBinder:(id)a3
{
  -[SBSceneManager _removeSceneFromPresentationBinder:trackedCollection:](self, "_removeSceneFromPresentationBinder:trackedCollection:", a3, self->_boundPointerUIScenes);
}

- (void)_addSceneToPresentationBinder:(id)a3 trackedCollection:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1509, CFSTR("cannot respond to non-destruction scene events after invalidation"));

  }
  -[BSCopyingCacheSet addObject:](self->_boundScenes, "addObject:", v10);
  -[UIScenePresentationBinder addScene:](self->_presentationBinder, "addScene:", v10);
  objc_msgSend(v7, "addObject:", v10);
  objc_msgSend(v10, "workspaceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[BSCopyingCacheSet addObject:](self->_workspaceScenes, "addObject:", v10);
  -[BSCopyingCacheSet addObject:](self->_allScenes, "addObject:", v10);

}

- (void)_removeSceneFromPresentationBinder:(id)a3 trackedCollection:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1524, CFSTR("cannot respond to non-destruction scene events after invalidation"));

  }
  -[BSCopyingCacheSet removeObject:](self->_boundScenes, "removeObject:", v10);
  -[UIScenePresentationBinder removeScene:](self->_presentationBinder, "removeScene:", v10);
  objc_msgSend(v7, "removeObject:", v10);
  objc_msgSend(v10, "workspaceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[BSCopyingCacheSet removeObject:](self->_workspaceScenes, "removeObject:", v10);
  -[BSCopyingCacheSet removeObject:](self->_allScenes, "removeObject:", v10);

}

- (void)updatePresentationBinder:(id)a3
{
  UIScenePresentationBinder *v5;
  UIScenePresentationBinder *presentationBinder;
  UIScenePresentationBinder **p_presentationBinder;
  UIScenePresentationBinder *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (UIScenePresentationBinder *)a3;
  p_presentationBinder = &self->_presentationBinder;
  presentationBinder = self->_presentationBinder;
  if (presentationBinder != v5)
  {
    v8 = presentationBinder;
    objc_storeStrong((id *)&self->_presentationBinder, a3);
    -[UIScenePresentationBinder invalidate](v8, "invalidate");
    -[BSCopyingCacheSet immutableSet](self->_boundScenes, "immutableSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[UIScenePresentationBinder addScene:](*p_presentationBinder, "addScene:", v14);
          -[UIScenePresentationBinder removeScene:](v8, "removeScene:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)_handleAction:(uint64_t)a1 forScene:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
