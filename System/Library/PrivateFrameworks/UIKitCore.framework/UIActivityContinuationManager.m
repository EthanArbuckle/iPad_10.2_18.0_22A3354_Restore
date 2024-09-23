@implementation UIActivityContinuationManager

- (UIActivityContinuationManager)initWithApplicationContext:(id)a3
{
  id v4;
  UIActivityContinuationManager *v5;
  UIActivityContinuationManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityContinuationManager;
  v5 = -[UIActivityContinuationManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_context, v4);

  return v6;
}

- (BOOL)activityContinuationsAreBeingTracked
{
  return objc_msgSend((id)_activityContinuationMap, "count") != 0;
}

- (void)userActivityWillSave:(id)a3
{
  id v4;
  _QWORD block[5];
  id v6;

  v4 = a3;
  if (pthread_main_np() == 1)
  {
    -[UIActivityContinuationManager _userActivityWillSave:](self, "_userActivityWillSave:", v4);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__UIActivityContinuationManager_userActivityWillSave___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v6 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_userActivityWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)_activityContinuationMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dyld_program_sdk_at_least();
    if (v14)
    {
      if (!objc_msgSend(v13, "count") && !v11)
      {
LABEL_21:

        goto LABEL_22;
      }
      v22 = v12;
      v24 = v10;
      objc_msgSend(v4, "_beginUserInfoUpdate:", 0);
    }
    else
    {
      v22 = v12;
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUserInfo:", v15);

    }
    v23 = v11;
    objc_msgSend(v11, "updateUserActivityState:", v4);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "updateUserActivityState:", v4);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v18);
    }

    if (v14)
      objc_msgSend(v4, "_finishUserInfoUpdate");
    v11 = v23;
    v10 = v24;
    v12 = v22;
    goto LABEL_21;
  }
LABEL_23:
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "activityContinuationManager:didUpdateUserActivity:", self, v4);

}

- (void)addResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_19:

      goto LABEL_20;
    }
    if (v8)
    {
      objc_msgSend(v11, "_frameworkDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(v11, "_setFrameworkDelegate:", self);
    }
    v15 = (void *)_activityContinuationMap;
    if (!_activityContinuationMap)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = (void *)_activityContinuationMap;
      _activityContinuationMap = (uint64_t)v16;

      v15 = (void *)_activityContinuationMap;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v8)
        goto LABEL_10;
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 4);
      v23[0] = v11;
      v23[1] = v21;
      v23[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_activityContinuationMap, "setObject:forKeyedSubscript:", v18, v13);

      if (v8)
      {
LABEL_10:
        objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "containsObject:", v8) & 1) == 0)
          objc_msgSend(v19, "addObject:", v8);
        if (v9)
          goto LABEL_13;
        goto LABEL_17;
      }
    }
    v19 = 0;
    if (v9)
    {
LABEL_13:
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "count"))
        objc_msgSend(v20, "addObject:", v9);
      goto LABEL_18;
    }
LABEL_17:
    v20 = v19;
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:

}

uint64_t __54__UIActivityContinuationManager_userActivityWillSave___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userActivityWillSave:", *(_QWORD *)(a1 + 40));
}

- (UIActivityContinuationManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActivityContinuationManager.m"), 64, CFSTR("Use initWithApplication:"));

  return 0;
}

- (void)_displayCurrentActivityContinuationProgressUI
{
  NSString *v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSString *v7;
  void *v8;
  id v9;
  _QWORD aBlock[5];
  NSString *v11;
  id v12;

  v3 = self->_currentActivityContinuationType;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "activityContinuationManagerUserCancelledError:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__UIActivityContinuationManager__displayCurrentActivityContinuationProgressUI__block_invoke;
  aBlock[3] = &unk_1E16B47A8;
  aBlock[4] = self;
  v11 = v3;
  v12 = v5;
  v6 = v5;
  v7 = v3;
  v8 = _Block_copy(aBlock);
  v9 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v9, "activityContinuationManager:displayProgressUI:dismissalHandler:", self, 0, v8);

}

uint64_t __78__UIActivityContinuationManager__displayCurrentActivityContinuationProgressUI__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearCurrentActivityContinuationCancelingProgress:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_didFailToContinueUserActivityWithType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_hideCurrentActivityContinuationProgressUI
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "activityContinuationManager:hideProgressUIWithCompletion:", self, 0);

}

- (void)_endCurrentActivityContinuationAndDisplayError:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[UIActivityContinuationManager _clearCurrentActivityContinuationCancelingProgress:](self, "_clearCurrentActivityContinuationCancelingProgress:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "activityContinuationManager:configureProgressUIWithError:", self, v4);

}

- (void)_endCurrentActivityContinuationWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[UIActivityContinuationManager _clearCurrentActivityContinuationCancelingProgress:](self, "_clearCurrentActivityContinuationCancelingProgress:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "activityContinuationManager:hideProgressUIWithCompletion:", self, v4);

}

- (BOOL)_continueUserActivity:(id)a3
{
  UIActivityContinuationManager *v3;
  UIActivityContinuationManagerApplicationContext **p_context;
  id v5;
  id WeakRetained;

  v3 = self;
  p_context = &self->_context;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "activityContinuationManager:continueUserActivity:", v3, v5);

  return (char)v3;
}

- (void)_didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  UIActivityContinuationManagerApplicationContext **p_context;
  id v7;
  id v8;
  id WeakRetained;

  if (a4)
  {
    p_context = &self->_context;
    v7 = a4;
    v8 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_context);
    objc_msgSend(WeakRetained, "activityContinuationManager:didFailToContinueUserActivityWithType:error:", self, v8, v7);

  }
}

- (BOOL)_delegateHandledContinueActivityWithType:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  int v7;
  BOOL v8;
  BOOL v9;
  char v10;
  int v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v6 = objc_msgSend(WeakRetained, "activityContinuationManager:willContinueUserActivityWithType:", self, v4);

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v7 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v12 = _UIInternalPreference_ActivityContinuationProgressWindowSuppressed,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ActivityContinuationProgressWindowSuppressed))
  {
    v8 = 0;
  }
  else
  {
    do
    {
      v8 = v7 < v12;
      if (v7 < v12)
        break;
      _UIInternalPreferenceSync(v7, &_UIInternalPreference_ActivityContinuationProgressWindowSuppressed, (uint64_t)CFSTR("ActivityContinuationProgressWindowSuppressed"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v12 = _UIInternalPreference_ActivityContinuationProgressWindowSuppressed;
    }
    while (v7 != _UIInternalPreference_ActivityContinuationProgressWindowSuppressed);
  }
  if (byte_1EDDA836C)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9 | v6;

  return v10;
}

- (id)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationLaunchOptionsUserActivityKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_payloadForIdentifier:", CFSTR("UAINAppIntentPayload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v11 = (void *)_MergedGlobals_1269;
      v24 = _MergedGlobals_1269;
      v12 = MEMORY[0x1E0C809B0];
      if (!_MergedGlobals_1269)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __getLNUserActivityHelperClass_block_invoke;
        v20[3] = &unk_1E16B14C0;
        v20[4] = &v21;
        __getLNUserActivityHelperClass_block_invoke((uint64_t)v20);
        v11 = (void *)v22[3];
      }
      v13 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v21, 8);
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __78__UIActivityContinuationManager__fetchUserActivityWithUUID_completionHandler___block_invoke;
      v17[3] = &unk_1E16B2F48;
      v19 = v6;
      v18 = v8;
      objc_msgSend(v13, "associateAppIntentWithUserActivity:completionHandler:", v18, v17);

    }
    else
    {
      (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v8, 0);
    }
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationLaunchOptionsUserActivityIdentifierKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
    objc_msgSend(MEMORY[0x1E0CB3B10], "_fetchUserActivityWithUUID:completionHandler:", v15, v6);

  }
  return 0;
}

uint64_t __78__UIActivityContinuationManager__fetchUserActivityWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_clearCurrentActivityContinuationCancelingProgress:(BOOL)a3
{
  _BOOL4 v3;
  NSProgress *v5;

  v3 = a3;
  v5 = self->_currentActivityContinuationProgress;
  -[UIActivityContinuationManager _setCurrentActivityContinuationType:](self, "_setCurrentActivityContinuationType:", 0);
  -[UIActivityContinuationManager _setCurrentActivityContinuationUUIDString:](self, "_setCurrentActivityContinuationUUIDString:", 0);
  -[UIActivityContinuationManager _setCurrentActivityContinuationProgress:](self, "_setCurrentActivityContinuationProgress:", 0);
  if (v3)
    -[NSProgress cancel](v5, "cancel");

}

- (void)handleActivityContinuation:(id)a3 isSuspended:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("UIApplicationLaunchOptionsUserActivityTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("UIApplicationLaunchOptionsUserActivityIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UINSUserActivitySourceApplicationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    NSLog(CFSTR("%s: No activity UUID in activity dictionary, ignoring: %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
    goto LABEL_22;
  }
  if (!v7)
  {
    NSLog(CFSTR("%s: No activity type in activity dictionary, ignoring: %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
    goto LABEL_22;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Called with activity continuation dictionary %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
  if (self->_currentActivityContinuationUUIDString)
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: New activity came in while waiting for activity, previous type/UUID = %@/%@, new type/UUID = %@/%@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", self->_currentActivityContinuationType, self->_currentActivityContinuationUUIDString, v7, v8);
    if (-[NSString isEqualToString:](self->_currentActivityContinuationType, "isEqualToString:", v7))
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Skipping call to didFail and willContinue for new activity since type is same as the activity we were already waiting for"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]");
      -[UIActivityContinuationManager _setCurrentActivityContinuationType:](self, "_setCurrentActivityContinuationType:", v7);
      -[UIActivityContinuationManager _setCurrentActivityContinuationUUIDString:](self, "_setCurrentActivityContinuationUUIDString:", v8);
      goto LABEL_19;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB28A8];
    v22 = *MEMORY[0x1E0CB2D50];
    _UINSLocalizedStringWithDefaultValue(CFSTR("User selected another activity, the previous activity is no longer available"), CFSTR("User selected another activity, the previous activity is no longer available"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3072, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_currentActivityContinuationType;
    -[UIActivityContinuationManager _clearCurrentActivityContinuationCancelingProgress:](self, "_clearCurrentActivityContinuationCancelingProgress:", 1);
    -[UIActivityContinuationManager _didFailToContinueUserActivityWithType:error:](self, "_didFailToContinueUserActivityWithType:error:", v15, v14);

  }
  -[UIActivityContinuationManager _setCurrentActivityContinuationType:](self, "_setCurrentActivityContinuationType:", v7);
  -[UIActivityContinuationManager _setCurrentActivityContinuationUUIDString:](self, "_setCurrentActivityContinuationUUIDString:", v8);
  if (-[UIActivityContinuationManager _delegateHandledContinueActivityWithType:](self, "_delegateHandledContinueActivityWithType:", v7))
  {
    -[UIActivityContinuationManager _hideCurrentActivityContinuationProgressUI](self, "_hideCurrentActivityContinuationProgressUI");
  }
  else
  {
    -[UIActivityContinuationManager _displayCurrentActivityContinuationProgressUI](self, "_displayCurrentActivityContinuationProgressUI");
  }
LABEL_19:
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Looking asynchronously for NSUserActivity for UUID %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v8);
  kdebug_trace();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke;
  v17[3] = &unk_1E16E7AD8;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v7;
  v21 = a4;
  -[UIActivityContinuationManager _fetchUserActivityWithUUID:completionHandler:](self, "_fetchUserActivityWithUUID:completionHandler:", v6, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContinuationManager _setCurrentActivityContinuationProgress:](self, "_setCurrentActivityContinuationProgress:", v16);

LABEL_22:
}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  int v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_2;
  aBlock[3] = &unk_1E16C7000;
  v7 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v18 = v5;
  v19 = *(id *)(a1 + 48);
  v20 = v6;
  v21 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = pthread_main_np();
  if (_UIStateRestorationDebugLogEnabled())
  {
    v12 = CFSTR("YES");
    if (*(_BYTE *)(a1 + 64))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    if (v11 != 1)
      v12 = CFSTR("NO");
    NSLog(CFSTR("%s: About to call activity handler, isSuspended = %@, isMainThread = %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke", v13, v12);
  }
  v14 = *(unsigned __int8 *)(a1 + 64);
  v15 = _UIStateRestorationDebugLogEnabled();
  if (v14 && v11 == 1)
  {
    if (v15)
      NSLog(CFSTR("%s: calling activity handler directly"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke");
    v10[2](v10);
  }
  else
  {
    if (v15)
      NSLog(CFSTR("%s: calling activity handler via dispatch_async"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke");
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  }

}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        objc_msgSend(v2, "_setSourceApplication:");
        v2 = *(void **)(a1 + 48);
      }
      v3 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_3;
      v17[3] = &unk_1E16B1B50;
      v4 = v2;
      v5 = *(_QWORD *)(a1 + 32);
      v18 = v4;
      v19 = v5;
      objc_msgSend(v3, "_endCurrentActivityContinuationWithCompletion:", v17);

    }
    else
    {
      v6 = *(id *)(a1 + 64);
      if (!v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v20 = *MEMORY[0x1E0CB2D50];
        _UINSLocalizedStringWithDefaultValue(CFSTR("Unknown Handoff error"), CFSTR("Unknown Handoff error"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4608, v10);
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Could not get user activity for UUID %@, error is %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_2", *(_QWORD *)(a1 + 40), v6);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      v12 = objc_msgSend(WeakRetained, "activityContinuationManagerHandleErrorsByConfiguringProgressUI:", *(_QWORD *)(a1 + 32));

      v13 = *(void **)(a1 + 32);
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_endCurrentActivityContinuationAndDisplayError:", v6);
      }
      else
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_4;
        v14[3] = &unk_1E16B47A8;
        v14[4] = v13;
        v15 = *(id *)(a1 + 72);
        v16 = v6;
        objc_msgSend(v13, "_endCurrentActivityContinuationWithCompletion:", v14);

      }
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Another user activity was passed to launch/resume while asynchronously fetching activity with UUID %@ and type %@, new Activity UUID is %@ with type %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_2", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  }
}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_3(uint64_t a1)
{
  int v2;
  const __CFString *v3;

  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Calling application:continueUserActivity:restorationHandler: on context for activity %@"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_3", *(_QWORD *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 40), "_continueUserActivity:", *(_QWORD *)(a1 + 32));
  if (_UIStateRestorationDebugLogEnabled())
  {
    v3 = CFSTR("No");
    if (v2)
      v3 = CFSTR("Yes");
    NSLog(CFSTR("%s: Delegate returned %@ from application:continueUserActivity:restorationHandler:"), "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_3", v3);
  }
}

uint64_t __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFailToContinueUserActivityWithType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[7];
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Called with Activity action %@"), "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v8);
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userActivityData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "_initWithUserActivityData:", v13);
      objc_msgSend(v14, "_uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "activityType");
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
      v11 = (void *)v16;
    }
    else
    {
      v14 = 0;
    }
    v18 = 0;
    if (v11 && v12)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        NSLog(CFSTR("%s: Checking for activity with UUID %@ and type %@, delegate is %@"), "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v11, v12, WeakRetained);

      }
      if (v14)
      {
        if (v9)
          objc_msgSend(v14, "_setSourceApplication:", v9);
        if (v10)
          objc_msgSend(v14, "_setOriginatingProcess:", v10);
        v30[0] = CFSTR("UIApplicationLaunchOptionsUserActivityIdentifierKey");
        v30[1] = CFSTR("UICanvasConnectionOptionsUserActivityKey");
        v31[0] = v11;
        v31[1] = v14;
        v30[2] = CFSTR("_UISceneConnectionOptionsUserActivityKey");
        v30[3] = CFSTR("UIApplicationLaunchOptionsUserActivityKey");
        v31[2] = v14;
        v31[3] = v14;
        v30[4] = CFSTR("UICanvasConnectionOptionsUserActivityTypeKey");
        v30[5] = CFSTR("_UISceneConnectionOptionsUserActivityTypeKey");
        v31[4] = v12;
        v31[5] = v12;
        v30[6] = CFSTR("UIApplicationLaunchOptionsUserActivityTypeKey");
        v31[6] = v12;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v31;
        v22 = v30;
        v23 = 7;
      }
      else
      {
        v28[0] = CFSTR("UIApplicationLaunchOptionsUserActivityIdentifierKey");
        v28[1] = CFSTR("UICanvasConnectionOptionsUserActivityTypeKey");
        v29[0] = v11;
        v29[1] = v12;
        v28[2] = CFSTR("_UISceneConnectionOptionsUserActivityTypeKey");
        v28[3] = CFSTR("UIApplicationLaunchOptionsUserActivityTypeKey");
        v29[2] = v12;
        v29[3] = v12;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v29;
        v22 = v28;
        v23 = 4;
      }
      objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v24;
      if (v9)
      {
        v25 = (void *)objc_msgSend(v24, "mutableCopy");
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, CFSTR("UINSUserActivitySourceApplicationKey"));
        v26 = objc_msgSend(v25, "copy");

        v18 = (void *)v26;
      }
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Created activity continuation dictionary for activity identifier %@, activity type %@:\n%@"), "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v11, v18, v12);
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Returning activityContinuationDictionary: %@"), "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v18);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_cleanupUserActivity:(id)a3 activityIdentifier:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  v5 = a3;
  objc_msgSend(v5, "_setFrameworkDelegate:", 0);
  objc_msgSend(v5, "invalidate");

  objc_msgSend((id)_activityContinuationMap, "removeObjectForKey:", v6);
}

- (void)removeResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5
{
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend((id)_activityContinuationMap, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if (objc_msgSend(v16, "containsObject:", v25))
            objc_msgSend(v16, "removeObject:", v25);
          objc_msgSend(v16, "allObjects");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (!v18)
          {
            objc_msgSend(v15, "allObjects");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            if (!v20)
            {
              if (_UIStateRestorationDebugLogEnabled())
              {
                objc_msgSend(v10, "title");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("%s: After removing responder mapping, no document and no more responders with activity %@ (title = %@, identifier = %@), so cleaning up and invalidating"), "-[UIActivityContinuationManager removeResponder:document:forUserActivity:]", v10, v21, v12);

              }
              -[UIActivityContinuationManager _cleanupUserActivity:activityIdentifier:](self, "_cleanupUserActivity:activityIdentifier:", v10, v12);
            }
          }
        }
        if (v8)
        {
          if (objc_msgSend(v15, "containsObject:", v8))
          {
            objc_msgSend(v15, "removeObject:", v8);
            objc_msgSend(v16, "allObjects");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (!v23)
            {
              if (_UIStateRestorationDebugLogEnabled())
              {
                objc_msgSend(v10, "title");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("%s: After removing document mapping, no more responders with activity %@ (title = %@, identifier = %@), so cleaning up and invalidating"), "-[UIActivityContinuationManager removeResponder:document:forUserActivity:]", v10, v24, v12);

              }
              -[UIActivityContinuationManager _cleanupUserActivity:activityIdentifier:](self, "_cleanupUserActivity:activityIdentifier:", v10, v12);
            }
          }
        }

      }
    }

  }
}

- (NSString)_currentActivityContinuationType
{
  return self->_currentActivityContinuationType;
}

- (void)_setCurrentActivityContinuationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)_currentActivityContinuationUUIDString
{
  return self->_currentActivityContinuationUUIDString;
}

- (void)_setCurrentActivityContinuationUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSProgress)_currentActivityContinuationProgress
{
  return self->_currentActivityContinuationProgress;
}

- (void)_setCurrentActivityContinuationProgress:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivityContinuationProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivityContinuationProgress, 0);
  objc_storeStrong((id *)&self->_currentActivityContinuationUUIDString, 0);
  objc_storeStrong((id *)&self->_currentActivityContinuationType, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
