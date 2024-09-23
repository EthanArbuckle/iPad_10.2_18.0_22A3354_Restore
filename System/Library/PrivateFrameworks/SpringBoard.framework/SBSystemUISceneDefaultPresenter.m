@implementation SBSystemUISceneDefaultPresenter

- (void)scene:(id)a3 hasVisibleContent:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v4 = a4;
  v7 = a3;
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v7 = 0;
  }
  objc_msgSend(v7, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v8);

    if (v11)
    {
      -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
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

      objc_msgSend(v16, "setSceneContentVisible:", v4);
    }
  }

}

- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  objc_msgSend(v7, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_currentParticipantDelegate, v8);
  objc_msgSend(v8, "participant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v9);

      if (v15)
      {
        objc_initWeak(&location, self);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __76__SBSystemUISceneDefaultPresenter_scene_didChangeTraitsParticipantDelegate___block_invoke;
        v25[3] = &unk_1E8EA8D78;
        objc_copyWeak(&v27, &location);
        v16 = v9;
        v26 = v16;
        objc_msgSend(v8, "setActuateZOrderAlongsideBlock:", v25);
        -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentZOrderLevel");
        objc_msgSend(v17, "setWindowLevel:");
        -[SBSystemUISceneDefaultPresenter _updateDisplayLayoutElementWindowLevelForScene:](self, "_updateDisplayLayoutElementWindowLevelForScene:", v7);
        v18 = objc_opt_class();
        v19 = v17;
        if (v18)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v21 = v20;

        objc_msgSend(v21, "rootViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setContainerParticipant:", 0);

        objc_msgSend(v21, "rootViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateOrientationIfNeeded");

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }
  if (self->_preferredWindowLevel)
  {
    objc_msgSend(v8, "setPreferredSceneLevel:");
    objc_msgSend(v10, "setNeedsUpdatePreferencesWithReason:", CFSTR("level"));
    objc_msgSend(v10, "updatePreferencesIfNeeded");
  }

}

- (UIWindowScene)targetWindowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_targetWindowScene);
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  return (FBSDisplayConfiguration *)objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
}

void __73__SBSystemUISceneDefaultPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(WeakRetained, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v5, CFSTR("targetWindowScene scene identifier"));

  v6 = *(void **)(a1 + 32);
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 104));
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("targetDisplayConfiguration"));

  v9 = *(void **)(a1 + 32);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("bindingProvider"));

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("presentedScenes"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("sceneToWindowMap"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v14 + 40) + 48), "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v25, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v17);
  }

  v26 = (id)objc_msgSend(*(id *)(v14 + 32), "appendObject:withName:", v45, CFSTR("sceneToPresentationBinderMap"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v14 + 40) + 56), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(v14 + 40) + 56), "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identity");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v39, v31, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "setObject:forKey:", v36, v41);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v28);
  }

  v42 = (id)objc_msgSend(*(id *)(v14 + 32), "appendObject:withName:", v44, CFSTR("displayConfigurationToPresentationBinderMap"));
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)setPreferredWindowLevel:(id)a3
{
  NSNumber *v4;
  NSNumber *preferredWindowLevel;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_preferredWindowLevel, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v8, "copy");
    preferredWindowLevel = self->_preferredWindowLevel;
    self->_preferredWindowLevel = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_currentParticipantDelegate);
    objc_msgSend(WeakRetained, "setPreferredSceneLevel:", v8);
    objc_msgSend(WeakRetained, "participant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsUpdatePreferencesWithReason:", CFSTR("level changed"));

  }
}

- (void)sceneDidChangeDisplayIdentity:(id)a3
{
  id v5;
  void *v6;
  void *WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v17 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v5 = 0;
  }
  objc_msgSend(v5, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
    goto LABEL_4;
  v8 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);

  if (!v8 && -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v6))
  {
    -[NSMutableDictionary objectForKey:](self->_sceneToPresentationBinderMap, "objectForKey:", v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sb_displayConfigurationForSceneManagers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_sceneToPresentationBinderMap, "removeObjectForKey:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_sceneToWindowMap, "removeObjectForKey:", v6);
      objc_msgSend(WeakRetained, "removeScene:", v17);
      objc_msgSend(WeakRetained, "scenes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
      {
        objc_msgSend(WeakRetained, "displayConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemUISceneDefaultPresenter _invalidatePresentationBinderForDisplayConfiguration:](self, "_invalidatePresentationBinderForDisplayConfiguration:", v15);

      }
      -[SBSystemUISceneDefaultPresenter _addSceneToPresentationBinder:](self, "_addSceneToPresentationBinder:", v17);
    }
LABEL_4:

  }
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  NSMutableArray *presentedScenes;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SBTraitsSingleSceneWindow *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  SBWallpaperEffectView *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v9)
      goto LABEL_3;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewControllerBuilderBlock"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_39;
LABEL_3:
  objc_msgSend(v7, "identityToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  presentedScenes = self->_presentedScenes;
  if (presentedScenes && -[NSMutableArray containsObject:](presentedScenes, "containsObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 206, CFSTR("Scene[%@] already presented by[%p]."), v7, self);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (!WeakRetained)
  {
    v17 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    objc_msgSend(v17, "identity");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
    }
    else
    {
      objc_msgSend(v7, "settings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sb_displayConfigurationForSceneManagers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 238, CFSTR("targetDisplayIdentity not found for scene[%@]"), v7);
    }

LABEL_23:
    v30 = objc_loadWeakRetained((id *)&self->_bindingProvider);
    v31 = v30;
    if (v30)
      objc_msgSend(v30, "addSystemUISceneToPresentationBinder:forDisplayIdentity:", v7, v19);
    else
      -[SBSystemUISceneDefaultPresenter _addSceneToPresentationBinder:](self, "_addSceneToPresentationBinder:", v7);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sceneManagerForDisplayIdentity:", v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "startTrackingSystemUISceneForInterfaceStyleUpdatePurposes:", v7);
    goto LABEL_35;
  }
  -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v20 = v16;

  if (!v20)
  {
    v20 = -[SBTraitsSingleSceneWindow initWithWindowScene:]([SBTraitsSingleSceneWindow alloc], "initWithWindowScene:", WeakRetained);
    -[NSMutableDictionary setObject:forKey:](self->_sceneToWindowMap, "setObject:forKey:", v20, v10);
  }
  -[SBTraitsSingleSceneWindow rootViewController](v20, "rootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v9[2](v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "traitsOrientedViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clientSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    v26 = v24;
    if (v25)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v34 = v27;

    if (v34)
    {
      objc_msgSend(v34, "backgroundStyle");
      v35 = _WallpaperStyleForBackgroundStyle();
      if (v35 != 1)
      {
        v36 = v35;
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v37, "isUILocked") ^ 1;

        v38 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", v48);
        -[PBUIWallpaperEffectViewBase setWallpaperStyle:](v38, "setWallpaperStyle:", v36);
        objc_msgSend(v23, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setBackgroundView:", v38);

      }
    }
    -[SBTraitsSingleSceneWindow setRootViewController:](v20, "setRootViewController:", v23);
    objc_msgSend(v23, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSingleSceneWindow bounds](v20, "bounds");
    objc_msgSend(v40, "setFrame:");

    -[SBTraitsSingleSceneWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](v20, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", 1, 1, 0, 0.0);
  }
  -[SBFWindow setHidden:](v20, "setHidden:", 0);
  -[SBSystemUISceneDefaultPresenter _setDisplayLayoutElementActive:scene:](self, "_setDisplayLayoutElementActive:scene:", 1, v7);
  SBLogCommon();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v42;
    v51 = 2112;
    v52 = WeakRetained;
    _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] window was shown on windowScene: %@.", buf, 0x16u);

  }
LABEL_35:
  -[NSMutableArray addObject:](self->_presentedScenes, "addObject:", v10);
  v43 = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v43, "scenePresenter:didPresentScene:", self, v7);

  return 0;
}

- (NSString)description
{
  return (NSString *)-[SBSystemUISceneDefaultPresenter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemUISceneDefaultPresenter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSystemUISceneDefaultPresenter *v11;

  v4 = a3;
  -[SBSystemUISceneDefaultPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBSystemUISceneDefaultPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (void)_updateDisplayLayoutElementWindowLevelForScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 568, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v5 = 0;
  }
  if (self->_shouldPublishAsDisplayLayoutElement)
  {
    v13 = v5;
    objc_msgSend(v5, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_sceneToDisplayLayoutAssertionMap, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "_sbWindowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayLayoutPublisher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "transitionAssertionWithReason:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSystemUISceneDefaultPresenter _setDisplayLayoutElementActive:scene:](self, "_setDisplayLayoutElementActive:scene:", 0, v13);
        -[SBSystemUISceneDefaultPresenter _setDisplayLayoutElementActive:scene:](self, "_setDisplayLayoutElementActive:scene:", 1, v13);
        objc_msgSend(v11, "invalidate");

      }
    }

    v5 = v13;
  }

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 scene:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v7 = 0;
  }
  if (self->_shouldPublishAsDisplayLayoutElement)
  {
    v20 = v7;
    objc_msgSend(v7, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_14:

      v7 = v20;
      goto LABEL_15;
    }
    -[NSMutableDictionary objectForKey:](self->_sceneToDisplayLayoutAssertionMap, "objectForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = !v4;
    if (!v4 || v10)
    {
      if (!v10)
        v12 = 0;
      if (v12 != 1)
        goto LABEL_13;
      -[NSMutableDictionary removeObjectForKey:](self->_sceneToDisplayLayoutAssertionMap, "removeObjectForKey:", v8);
      objc_msgSend(v11, "invalidate");
      v18 = 0;
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0DAAE30]);
      -[SBSystemUISceneDefaultPresenter _serviceBundleIdentifierForScene:](self, "_serviceBundleIdentifierForScene:", v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithIdentifier:", v14);

      objc_msgSend(v9, "level");
      objc_msgSend(v11, "setLevel:", (uint64_t)v15);
      objc_msgSend(v11, "setFillsDisplayBounds:", 1);
      objc_msgSend(v11, "setLayoutRole:", 3);
      objc_msgSend(v9, "_sbWindowScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayLayoutPublisher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addElement:", v11);
      v18 = objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKey:](self->_sceneToDisplayLayoutAssertionMap, "setObject:forKey:", v18, v8);
    }

    v11 = (void *)v18;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[NSMutableArray count](self->_presentedScenes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 64, CFSTR("SBSystemUISceneDefaultPresenter was dealloc-ed while it is still presenting scenes."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSystemUISceneDefaultPresenter;
  -[SBSystemUISceneDefaultPresenter dealloc](&v5, sel_dealloc);
}

- (SBSystemUISceneDefaultPresenter)init
{
  SBSystemUISceneDefaultPresenter *v2;
  uint64_t v3;
  NSMutableArray *presentedScenes;
  uint64_t v5;
  NSMutableDictionary *sceneToWindowMap;
  uint64_t v7;
  NSMutableDictionary *sceneToDisplayLayoutAssertionMap;
  uint64_t v9;
  NSMutableDictionary *sceneToPresentationBinderMap;
  uint64_t v11;
  NSMutableDictionary *displayConfigurationToPresentationBinderMap;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSystemUISceneDefaultPresenter;
  v2 = -[SBSystemUISceneDefaultPresenter init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    presentedScenes = v2->_presentedScenes;
    v2->_presentedScenes = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sceneToWindowMap = v2->_sceneToWindowMap;
    v2->_sceneToWindowMap = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    sceneToDisplayLayoutAssertionMap = v2->_sceneToDisplayLayoutAssertionMap;
    v2->_sceneToDisplayLayoutAssertionMap = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    sceneToPresentationBinderMap = v2->_sceneToPresentationBinderMap;
    v2->_sceneToPresentationBinderMap = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    displayConfigurationToPresentationBinderMap = v2->_displayConfigurationToPresentationBinderMap;
    v2->_displayConfigurationToPresentationBinderMap = (NSMutableDictionary *)v11;

  }
  return v2;
}

- (SBSystemUISceneDefaultPresenter)initWithWindowHostingPresentationOnWindowScene:(id)a3
{
  id v4;
  SBSystemUISceneDefaultPresenter *v5;
  SBSystemUISceneDefaultPresenter *v6;

  v4 = a3;
  v5 = -[SBSystemUISceneDefaultPresenter init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_targetWindowScene, v4);

  return v6;
}

- (SBSystemUISceneDefaultPresenter)initWithTargetDisplayConfiguration:(id)a3
{
  return (SBSystemUISceneDefaultPresenter *)-[SBSystemUISceneDefaultPresenter _initWithPresentationBinderProvider:targetDisplayConfiguration:](self, "_initWithPresentationBinderProvider:targetDisplayConfiguration:", 0, a3);
}

- (SBSystemUISceneDefaultPresenter)initWithPresentationBinderProvider:(id)a3
{
  return (SBSystemUISceneDefaultPresenter *)-[SBSystemUISceneDefaultPresenter _initWithPresentationBinderProvider:targetDisplayConfiguration:](self, "_initWithPresentationBinderProvider:targetDisplayConfiguration:", a3, 0);
}

- (id)_initWithPresentationBinderProvider:(id)a3 targetDisplayConfiguration:(id)a4
{
  id v6;
  id v7;
  SBSystemUISceneDefaultPresenter *v8;
  id *p_isa;

  v6 = a3;
  v7 = a4;
  v8 = -[SBSystemUISceneDefaultPresenter init](self, "init");
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_bindingProvider, v6);
    objc_storeWeak(p_isa + 13, v7);
  }

  return p_isa;
}

- (id)hostingWindowForScene:(id)a3
{
  id v5;
  NSMutableDictionary *sceneToWindowMap;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  sceneToWindowMap = self->_sceneToWindowMap;
  objc_msgSend(v5, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sceneToWindowMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hostingBinderForScene:(id)a3
{
  id v5;
  NSMutableDictionary *sceneToPresentationBinderMap;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  sceneToPresentationBinderMap = self->_sceneToPresentationBinderMap;
  objc_msgSend(v5, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sceneToPresentationBinderMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_addSceneToPresentationBinder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableDictionary *sceneToWindowMap;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] was added to the presentation binder.", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v4, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
  }
  else
  {
    objc_msgSend(v4, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sb_displayConfigurationForSceneManagers");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SBSystemUISceneDefaultPresenter _presentationBinderForDisplayConfiguration:](self, "_presentationBinderForDisplayConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addScene:", v4);
  sceneToWindowMap = self->_sceneToWindowMap;
  objc_msgSend(v12, "rootWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sceneToWindowMap, "setObject:forKey:", v14, v7);

  -[NSMutableDictionary setObject:forKey:](self->_sceneToPresentationBinderMap, "setObject:forKey:", v12, v7);
}

- (void)_removeSceneFromPresentationBinder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] was removed from the presentation binder.", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v4, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
  }
  else
  {
    objc_msgSend(v4, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sb_displayConfigurationForSceneManagers");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SBSystemUISceneDefaultPresenter _presentationBinderForDisplayConfiguration:](self, "_presentationBinderForDisplayConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_sceneToPresentationBinderMap, "removeObjectForKey:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->_sceneToWindowMap, "removeObjectForKey:", v7);
  objc_msgSend(v12, "removeScene:", v4);
  objc_msgSend(v12, "scenes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
    -[SBSystemUISceneDefaultPresenter _invalidatePresentationBinderForDisplayConfiguration:](self, "_invalidatePresentationBinderForDisplayConfiguration:", v10);

}

- (id)_presentationBinderForDisplayConfiguration:(id)a3
{
  id v4;
  SBRootWindowScenePresentationBinder *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_displayConfigurationToPresentationBinderMap, "objectForKey:", v4);
  v5 = (SBRootWindowScenePresentationBinder *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("UIRootSceneWindow-%@-%p"), v8, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA908]), "initWithDisplayConfiguration:", v4);
    objc_msgSend(v10, "setBackgroundColor:", 0);
    v5 = -[SBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]([SBRootWindowScenePresentationBinder alloc], "initWithIdentifier:priority:appearanceStyle:rootWindow:", v9, 0, 0, v10);
    -[NSMutableDictionary setObject:forKey:](self->_displayConfigurationToPresentationBinderMap, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (void)_invalidatePresentationBinderForDisplayConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_displayConfigurationToPresentationBinderMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_displayConfigurationToPresentationBinderMap, "removeObjectForKey:", v6);
  }

}

- (void)_disableIdleTimer:(BOOL)a3 sceneIdentityToken:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *scenesDisablingIdleTimer;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  BSInvalidatable *idleTimerDisableAssertion;
  void *v12;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  NSObject *v15;
  NSMutableSet *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  BSInvalidatable *v20;
  int v21;
  NSMutableSet *v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  scenesDisablingIdleTimer = self->_scenesDisablingIdleTimer;
  if (v4)
  {
    if (!scenesDisablingIdleTimer)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v9 = self->_scenesDisablingIdleTimer;
      self->_scenesDisablingIdleTimer = v8;

      scenesDisablingIdleTimer = self->_scenesDisablingIdleTimer;
    }
    -[NSMutableSet addObject:](scenesDisablingIdleTimer, "addObject:", v6);
  }
  else if (-[NSMutableSet containsObject:](scenesDisablingIdleTimer, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_scenesDisablingIdleTimer, "removeObject:", v6);
  }
  v10 = -[NSMutableSet count](self->_scenesDisablingIdleTimer, "count");
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  if (v10)
  {
    if (!idleTimerDisableAssertion)
    {
      +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "acquireIdleTimerDisableAssertionForReason:", CFSTR("SystemUI Scene Presentation"));
      v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v14 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = v13;

    }
    SBLogSystemUIScene();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_scenesDisablingIdleTimer;
      v21 = 138543362;
      v22 = v16;
      v17 = "Idle timer is disabled for scenes:%{public}@";
      v18 = v15;
      v19 = 12;
LABEL_14:
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
    }
  }
  else
  {
    -[BSInvalidatable invalidate](idleTimerDisableAssertion, "invalidate");
    v20 = self->_idleTimerDisableAssertion;
    self->_idleTimerDisableAssertion = 0;

    SBLogSystemUIScene();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v17 = "Reenable idle timer";
      v18 = v15;
      v19 = 2;
      goto LABEL_14;
    }
  }

}

- (id)dismissScene:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  objc_msgSend(v5, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "scenePresenter:willDismissScene:", self, v5);
    v8 = objc_loadWeakRetained((id *)&self->_targetWindowScene);
    if (v8)
    {
      -[SBSystemUISceneDefaultPresenter _disableIdleTimer:sceneIdentityToken:](self, "_disableIdleTimer:sceneIdentityToken:", 0, v6);
      -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);
      -[SBSystemUISceneDefaultPresenter _setDisplayLayoutElementActive:scene:](self, "_setDisplayLayoutElementActive:scene:", 0, v5);
      objc_msgSend(v9, "rootViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      v12 = v10;
      if (v11)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v17 = v13;

      if (v17)
      {
        objc_msgSend(v17, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBackgroundView:", 0);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "scenePresenter:updateHomeAffordance:forScene:", self, 0, v5);
      }
      objc_msgSend(v9, "setRootViewController:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_sceneToWindowMap, "removeObjectForKey:", v6);
      SBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        v31 = 2112;
        v32 = v8;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] window was hidden on windowScene: %@.", buf, 0x16u);

      }
      goto LABEL_26;
    }
    v14 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    objc_msgSend(v14, "identity");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
    }
    else
    {
      objc_msgSend(v5, "settings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sb_displayConfigurationForSceneManagers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneDefaultPresenter.m"), 288, CFSTR("targetDisplayIdentity not found for scene[%@]"), v5);
    }

LABEL_22:
    v23 = objc_loadWeakRetained((id *)&self->_bindingProvider);
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "removeSystemUISceneFromPresentationBinder:forDisplayIdentity:", v5, v16);
    else
      -[SBSystemUISceneDefaultPresenter _removeSceneFromPresentationBinder:](self, "_removeSceneFromPresentationBinder:", v5);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sceneManagerForDisplayIdentity:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stopTrackingSystemUISceneForInterfaceStyleUpdatePurposes:", v5);
LABEL_26:
    -[NSMutableArray removeObject:](self->_presentedScenes, "removeObject:", v6);

  }
  return 0;
}

void __76__SBSystemUISceneDefaultPresenter_scene_didChangeTraitsParticipantDelegate___block_invoke(uint64_t a1, double a2)
{
  id *WeakRetained;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[4], "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWindowLevel:", a2);

    WeakRetained = v6;
  }

}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSystemUISceneDefaultPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)statusBarForDisplayConfiguration:(id)a3 statusBarSceneHostComponent:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)SBApp;
  v5 = a3;
  objc_msgSend(v4, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)statusBarSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  char v30;
  UIStatusBar *statusBar;
  UIStatusBar *v32;
  UIStatusBar *v33;
  void *v34;
  id v35;

  v5 = a3;
  objc_msgSend(v5, "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v35 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hostScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "clientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v35);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_26:

      goto LABEL_27;
    }
    v12 = (void *)v11;
    v13 = -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v35);

    if (v13)
    {
      -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v35);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v10 = v14;
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v10;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;

      objc_msgSend(v17, "_sbWindowScene");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v20 = v18;
      if (v19)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v22 = v21;

      objc_msgSend(v22, "statusBarManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "reusePool");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "rootViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_class();
      v27 = v25;
      if (v26)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      v29 = v28;

      v30 = objc_msgSend(v8, "statusBarHidden");
      statusBar = self->_statusBar;
      if ((v30 & 1) != 0)
      {
        if (statusBar)
        {
          -[UIStatusBar removeFromSuperview](statusBar, "removeFromSuperview");
          objc_msgSend(v24, "recycleStatusBar:", self->_statusBar);
        }
      }
      else
      {
        if (!statusBar)
        {
          objc_msgSend(v24, "getReusableStatusBarWithReason:", CFSTR("SystemUI Scene Presentation"));
          v32 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
          v33 = self->_statusBar;
          self->_statusBar = v32;

        }
        objc_msgSend(v29, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addOverlayView:", self->_statusBar);

      }
      goto LABEL_26;
    }
  }
LABEL_27:

}

- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v8, "shouldDisableReachability"))
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ignoreWindowForReachability:", v6);

  }
}

- (void)featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  id v12;

  objc_msgSend(a3, "hostScene");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    v8 = (void *)v7;
    v9 = -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v4);

    if (v9)
    {
      objc_msgSend(v12, "clientSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "allowsMenuButtonDismissal"))
        v10 = SBHomeGestureEnabled();
      else
        v10 = 0;
      v11 = objc_loadWeakRetained((id *)&self->_presentingDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "scenePresenter:updateHomeAffordance:forScene:", self, v10, v12);

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityToken");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    -[NSMutableDictionary objectForKey:](self->_sceneToWindowMap, "objectForKey:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[NSMutableArray containsObject:](self->_presentedScenes, "containsObject:", v13);

      if (v12)
        -[SBSystemUISceneDefaultPresenter _disableIdleTimer:sceneIdentityToken:](self, "_disableIdleTimer:sceneIdentityToken:", objc_msgSend(v7, "idleTimerDisabled"), v13);
    }
    else
    {

    }
  }

}

- (id)_serviceBundleIdentifierForScene:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  objc_msgSend(a3, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasConsistentLaunchdJob"))
  {
    objc_msgSend(v4, "consistentJobLabel");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isDaemon"))
  {
    objc_msgSend(v4, "daemonJobLabel");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isApplication"))
  {
    objc_msgSend(v4, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (SBSystemUISceneBindingProviding)bindingProvider
{
  return (SBSystemUISceneBindingProviding *)objc_loadWeakRetained((id *)&self->_bindingProvider);
}

- (NSNumber)preferredWindowLevel
{
  return self->_preferredWindowLevel;
}

- (BOOL)shouldPublishAsDisplayLayoutElement
{
  return self->_shouldPublishAsDisplayLayoutElement;
}

- (void)setShouldPublishAsDisplayLayoutElement:(BOOL)a3
{
  self->_shouldPublishAsDisplayLayoutElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredWindowLevel, 0);
  objc_destroyWeak((id *)&self->_bindingProvider);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_destroyWeak((id *)&self->_targetWindowScene);
  objc_storeStrong((id *)&self->_scenesDisablingIdleTimer, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_displayConfigurationToPresentationBinderMap, 0);
  objc_storeStrong((id *)&self->_sceneToPresentationBinderMap, 0);
  objc_storeStrong((id *)&self->_sceneToDisplayLayoutAssertionMap, 0);
  objc_storeStrong((id *)&self->_sceneToWindowMap, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_currentParticipantDelegate);
  objc_storeStrong((id *)&self->_presentedScenes, 0);
}

@end
