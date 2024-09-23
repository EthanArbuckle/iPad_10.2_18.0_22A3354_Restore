@implementation UICanvasUserActivityManager

void __61___UICanvasUserActivityManager__updatePersistedSceneSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _queue_ensureExistenceOfKnownSceneSessionMap();
    v3 = (void *)qword_1ECD7F328;
    objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = _UIStateRestorationDebugLogEnabled();
    if (v5)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%s: Updating SceneSession for persistent identifier %@, SceneSession = %@"), "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", v7, *(_QWORD *)(a1 + 32));
LABEL_10:

      }
    }
    else if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Adding SceneSession for persistent identifier %@, SceneSession = %@"), "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", v7, *(_QWORD *)(a1 + 32));
      goto LABEL_10;
    }
    v8 = *(id *)(a1 + 32);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    v10 = (void *)objc_msgSend(v8, "_copyWithoutUserInfo");
    objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("CanvasRestorationCanvasDefinitionKey"));

    objc_msgSend(v9, "finishEncoding");
    objc_msgSend(v9, "encodedData");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: SceneSession data for session is %@"), "NSData *_encodeSceneSession(UISceneSession *__strong)", v13);

    if (v13)
    {
      v11 = (void *)qword_1ECD7F328;
      objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, v12);

      _queue_scheduleUpdateAndSaveForPersistedSceneSessions();
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(CFSTR("%s: Could not encode SceneSession, skipping"), "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke");
    }

    return;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Asked to update persisted SceneSession but persistent identifier is nil. SceneSession: %@"), "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", *(_QWORD *)(a1 + 32));
}

void __53___UICanvasUserActivityManager__knownSceneSessionMap__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _queue_ensureExistenceOfKnownSceneSessionMap();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)qword_1ECD7F328;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)qword_1ECD7F328, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _decodeSceneSession(v8, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v7);
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(CFSTR("%s: Could not decode SceneSession for identifier %@, skipping"), "+[_UICanvasUserActivityManager _knownSceneSessionMap]_block_invoke", v7);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    NSLog(CFSTR("Constructed known Scene Session map in %f"), v11);

  }
  if (_UIStateRestorationDebugLogEnabled())
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
      v13 = &stru_1E16EDF20;
    else
      v13 = CFSTR("s");
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Returning known Scene definitions for %lu identifier%@ %@"), "+[_UICanvasUserActivityManager _knownSceneSessionMap]_block_invoke", v12, v13, v14, (_QWORD)v15);

  }
}

void __78___UICanvasUserActivityManager__deleteSceneSessionsWithPersistentIdentifiers___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
        _queue_persistentIdentifiersForDeletion();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _queue_ensureExistenceOfKnownSceneSessionMap();
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Removing definition for persistent identifier %@"), "+[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:]_block_invoke", v6, (_QWORD)v8);
        objc_msgSend((id)qword_1ECD7F328, "removeObjectForKey:", v6);
        objc_msgSend(v7, "addObject:", v6);
        _queue_scheduleUpdateAndSaveForPersistedSceneSessions();

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

uint64_t __62___UICanvasUserActivityManager__initializeUserActivityManager__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive")) ^ 1;

  return v3;
}

void __82___UICanvasUserActivityManager__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(WeakRetained, "_windows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isHidden") & 1) == 0 && (!v5 || objc_msgSend(v8, "_isApplicationKeyWindow")))
      {
        objc_msgSend(v8, "rootViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_activityContinuationSuitableToBecomeCurrent");
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (objc_msgSend(v8, "_isApplicationKeyWindow"))
          {

            v5 = (void *)v10;
            goto LABEL_18;
          }
          v5 = (void *)v10;
        }
        else
        {
          v5 = 0;
        }
      }
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          goto LABEL_3;

        if (!v5)
          goto LABEL_22;
LABEL_18:
        if (_UIStateRestorationDebugLogEnabled())
        {
          objc_msgSend(v5, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%s: Found activity to become current: %@, title = %@, identifier = %@"), "-[_UICanvasUserActivityManager _checkActivityContinuationAndBecomeCurrentIfNeeded]_block_invoke", v5, v11, v12);

        }
        objc_msgSend(v5, "becomeCurrent");
        goto LABEL_23;
      }
    }
  }

LABEL_22:
  objc_msgSend((id)UIApp, "_checkActivityContinuationAndBecomeCurrentIfNeeded");
  v5 = 0;
LABEL_23:

}

uint64_t __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89___UICanvasUserActivityManager_activityContinuationManager_hideProgressUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75___UICanvasUserActivityManager__fetchSceneSessionWithPersistentIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _queue_ensureExistenceOfKnownSceneSessionMap();
  objc_msgSend((id)qword_1ECD7F328, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_scheduleDataSaveForSceneSession:saveRestorationActivity:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (_MergedGlobals_1161)
    {
      if (objc_msgSend(WeakRetained, "_stateRestorationActivityIsDirty"))
      {
        objc_msgSend(v8, "scene");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Saving stateRestorationActivity for scene %@"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v3);
        v4 = *(void **)(a1 + 40);
        objc_msgSend(v8, "scene");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_saveRestorationStateForScene:", v5);

      }
      else if (_UIStateRestorationDebugLogEnabled())
      {
        NSLog(CFSTR("%s: Scene Session stateRestorationActivity was already saved. Skipping save of stateRestorationActivity for scene session %@"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
      }
      _MergedGlobals_1161 = 0;
      WeakRetained = v8;
    }
    v6 = objc_msgSend(WeakRetained, "_userInfoIsDirty");
    v7 = _UIStateRestorationDebugLogEnabled();
    if (v6)
    {
      if (v7)
        NSLog(CFSTR("%s: Saving userInfo for scene session %@"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
      _saveSceneSessionUserInfo(v8);
    }
    else if (v7)
    {
      NSLog(CFSTR("%s: Scene Session userInfo was already saved. Skipping save of userInfo for scene session %@"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Scene session is gone. Skipping data save for scene session %@"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", 0);
  }
  byte_1ECD7F321 = 0;

}

void __57___UICanvasUserActivityManager__performCanvasRestoration__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v4, "_canvas:willContinueUserActivityWithType:", v5, v6);

  if ((_DWORD)v5)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_canvas:continueUserActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Finished direct calls to restore Scene state with user activity: %@"), "-[_UICanvasUserActivityManager _performCanvasRestoration]_block_invoke", *(_QWORD *)(a1 + 40));
}

@end
