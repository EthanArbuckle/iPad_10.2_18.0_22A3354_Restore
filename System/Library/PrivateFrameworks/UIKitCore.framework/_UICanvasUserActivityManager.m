@implementation _UICanvasUserActivityManager

- (_UICanvasUserActivityManager)initWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UICanvasUserActivityManager *v7;
  _UICanvasUserActivityManager *v8;
  UIActivityContinuationManager *v9;
  UIActivityContinuationManager *activityContinuationManager;
  objc_super v12;

  v4 = a3;
  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(v4, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: called for scene %@"), "-[_UICanvasUserActivityManager initWithScene:]", v6);

  }
  v12.receiver = self;
  v12.super_class = (Class)_UICanvasUserActivityManager;
  v7 = -[_UICanvasUserActivityManager init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_weakScene, v4);
    v9 = -[UIActivityContinuationManager initWithApplicationContext:]([UIActivityContinuationManager alloc], "initWithApplicationContext:", v8);
    activityContinuationManager = v8->_activityContinuationManager;
    v8->_activityContinuationManager = v9;

    if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
      -[_UICanvasUserActivityManager _setupCanvasRestorationState](v8, "_setupCanvasRestorationState");
  }

  return v8;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_weakScene, a3);
}

- (void)_scene:(id)a3 didTransitionFromActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  if (!self->_initialRestorationIsFinished)
  {
    v14 = v7;
    v8 = objc_msgSend(v7, "activationState");
    if (_UIStateRestorationDebugLogEnabled())
    {
      _NSStringFromUISceneActivationState(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringFromUISceneActivationState(objc_msgSend(v14, "activationState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Invoked for Scene %@ with state %@, transitioning from state %@"), "-[_UICanvasUserActivityManager _scene:didTransitionFromActivationState:withReasonsMask:]", v14, v9, v10);

    }
    if (v8 > 1 || a4 != 2 && a4 != -1)
      goto LABEL_15;
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Offering restoration opportunity to scene"), "-[_UICanvasUserActivityManager _scene:didTransitionFromActivationState:withReasonsMask:]");
    objc_msgSend(v14, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "_willRestoreInteractionStateForUserActivityManager:", self);
      kdebug_trace();
      objc_msgSend(v14, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stateRestorationActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scene:restoreInteractionStateWithUserActivity:", v14, v13);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_14:

LABEL_15:
        self->_initialRestorationIsFinished = 1;
        v7 = v14;
        goto LABEL_16;
      }
      objc_msgSend(v14, "_willRestoreInteractionStateForUserActivityManager:", self);
      kdebug_trace();
      objc_msgSend(v14, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stateRestorationActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_scene:restoreInteractionStateWithUserActivity:", v14, v13);
    }

    kdebug_trace();
    goto LABEL_14;
  }
LABEL_16:

}

+ (id)_userActivityManagerForScene:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: called, looking for component with key %@"), "+[_UICanvasUserActivityManager _userActivityManagerForScene:]", CFSTR("UIUserActivitySceneComponentKey"));
  objc_msgSend(v3, "_sceneComponentForKey:", CFSTR("UIUserActivitySceneComponentKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = objc_msgSend(v10, "activationState");
  if (_UIStateRestorationDebugLogEnabled())
  {
    _NSStringFromUISceneActivationState(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromUISceneActivationState(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Invoked for Scene %@ with state %@, transitioning from state %@"), "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]", v10, v8, v9);

  }
  if (a4)
  {
    if (a4 == 2 && v7 != 2)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Saving Scene State from background"), "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]");
      -[_UICanvasUserActivityManager _saveSceneRestorationState](self, "_saveSceneRestorationState");
    }
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Checking for activity to make current"), "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]");
    -[_UICanvasUserActivityManager _checkActivityContinuationAndBecomeCurrentIfNeeded](self, "_checkActivityContinuationAndBecomeCurrentIfNeeded");
  }

}

+ (BOOL)_restorationUserActivityAvailableForSceneIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  int v15;
  id v17;

  v3 = a3;
  _restorationPath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Checking availability of saved UIScene definition/restoration state for scene with identifier %@, url %@, path %@"), "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]", v3, v4, v5);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if (v8)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v4, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v11 = v10;
    if (v9)
    {
      v12 = 1;
      if (!v10)
      {
LABEL_19:
        objc_msgSend(v9, "closeAndReturnError:", 0);

        v13 = v12 != 0;
        goto LABEL_20;
      }
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Can't create file handle for archived UIScene state: returned fileHandle is nil"), "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]");
      v12 = 0;
      if (!v11)
        goto LABEL_19;
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Error trying to create file handle for archived UIScene state: %@"), "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]", v11);
    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v15 && (objc_msgSend(v11, "code") == 257 || objc_msgSend(v11, "code") == 513))
      v12 = 0;
    goto LABEL_19;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Restoration file does not exist"), "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]");
  v13 = 1;
LABEL_20:

  return v13;
}

+ (id)_getRestorationUserActivityForPersistentIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *exc_buf;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43[2];

  v5 = a3;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Checking for saved scene definition/restoration state for scene with identifier %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "launchedToTest"))
    v7 = objc_msgSend((id)objc_opt_class(), "_restorationUserActivityAvailableForSceneIdentifier:", CFSTR("TestApplicationState"));
  else
    v7 = 0;
  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v6);
    NSLog(CFSTR("%s: Checking for test restoration directory took %f"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _restorationPath(CFSTR("TestApplicationState"));
    v11 = objc_claimAutoreleasedReturnValue();
    v43[0] = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v11, v43);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v43[0];
    v14 = (void *)v11;
    if (v12)
      goto LABEL_18;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  _restorationPath(v5);
  v15 = objc_claimAutoreleasedReturnValue();

  v42 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v15, &v42);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v42;

  if (!v12 || v16)
  {
    v13 = v16;
    v14 = (void *)v15;
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Read file with scene state, updating last restoration dictionary"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]");
    v13 = 0;
    v14 = (void *)v15;
    _updateLastRestorationDictionaryForPersistentIdentifier(v12, v5);
  }
LABEL_18:
  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v10);
    NSLog(CFSTR("%s: Opening restoration file took %f"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v18);

  }
  if (!v13)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("CanvasRestorationUserActivityUserInfoKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("CanvasRestorationUserActivityTypeKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("CanvasRestorationUserActivityTitleKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (!_UIStateRestorationDebugLogEnabled())
      {
        v13 = 0;
LABEL_45:
        if (v23)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", v23);
          v21 = v25;
          if (v40)
            objc_msgSend(v25, "setTitle:", v40);
          objc_msgSend(v21, "setUserInfo:", v22);
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Created user activity to restore canvas state: type = %@, title = %@, userInfo = %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v23, v40, v22);
          goto LABEL_52;
        }
LABEL_50:
        v21 = 0;
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: No user activity to restore canvas state for canvas with identifier %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
LABEL_52:

        goto LABEL_53;
      }
      v13 = 0;
      NSLog(CFSTR("%s: Encoded user info is a property list, using dictionary directly: %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v22);
LABEL_42:
      if (!v22)
        goto LABEL_50;
      goto LABEL_45;
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Encoded user info is not a property list, securely decoding"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]");
    objc_msgSend(v12, "objectForKey:", CFSTR("CanvasRestorationUserActivityUserInfoDataKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v24, &v41);
    v13 = v41;
    if (v13)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Couldn't create an NSKeyedUnarchiver to unarchive restoration activity user info from data for canvas with identifier %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
    }
    else
    {
      objc_msgSend(v39, "setRequiresSecureCoding:", 1);
      objc_msgSend(v39, "setDecodingFailurePolicy:", 0);
      v38 = v24;
      v27 = (void *)MEMORY[0x1E0C99E60];
      exc_buf = (void *)objc_opt_class();
      v36 = objc_opt_class();
      v35 = objc_opt_class();
      v34 = objc_opt_class();
      v33 = objc_opt_class();
      v32 = objc_opt_class();
      v28 = objc_opt_class();
      v29 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", exc_buf, v36, v35, v34, v33, v32, v28, v29, objc_opt_class(), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "decodeObjectOfClasses:forKey:", v30, CFSTR("CanvasRestorationUserActivityUserInfoKey"));
      v31 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v31;
      objc_msgSend(v39, "finishDecoding");
      if (v31)
      {
        v24 = v38;
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Decoded canvas restoration activity user info: %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v31);
        goto LABEL_41;
      }
      v24 = v38;
      if (_UIStateRestorationDebugLogEnabled())
      {
        NSLog(CFSTR("%s: Couldn't decode restoration activity user info for canvas with identifier %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
        v22 = 0;
        goto LABEL_41;
      }
    }
    v22 = 0;
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(v13, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (!v20)
    goto LABEL_31;
  if (objc_msgSend(v13, "code") != 260 && _UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Error reading archived canvas state: %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v13);
  if (objc_msgSend(v13, "code") != 257 && objc_msgSend(v13, "code") != 513)
    goto LABEL_31;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Error reading archived canvas state: %@"), "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v13);
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v21 = 0;
    *a4 = v13;
  }
  else
  {
LABEL_31:
    v21 = 0;
  }
LABEL_53:

  return v21;
}

+ (id)_getUserInfoForPersistentIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v16;

  v5 = a3;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Checking for saved userInfo for Scene Session with persistentIdentifier %@"), "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v5);
  _restorationDirectory(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("userInfo.data"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v12)
    {
      if (objc_msgSend(v10, "code") != 260 && _UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Error reading archived Scene Session userInfo: %@"), "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v10);
      if (objc_msgSend(v10, "code") == 257 || objc_msgSend(v10, "code") == 513)
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Error reading archived SceneSession userInfo: %@"), "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v10);
        if (a4)
          *a4 = objc_retainAutorelease(v10);
      }
    }
  }

  if (v8)
    v13 = v8;
  else
    v13 = (void *)MEMORY[0x1E0C9AA70];
  v14 = v13;

  return v14;
}

+ (void)_deleteSavedSceneSessionDirectoryWithPersistentIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  _restorationDirectory(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Deleting Scene Session Data directory with userInfo and restoration state for Scene at path %@"), "+[_UICanvasUserActivityManager _deleteSavedSceneSessionDirectoryWithPersistentIdentifier:]", v3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v10);
  v6 = v10;

  if (v6 || (v5 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 == (void *)*MEMORY[0x1E0CB28A8])
      {
        v9 = objc_msgSend(v6, "code");

        if (v9 == 4)
          goto LABEL_11;
      }
      else
      {

      }
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Warning: Unable to delete SceneSession data directory: %@, error = %@"), "+[_UICanvasUserActivityManager _deleteSavedSceneSessionDirectoryWithPersistentIdentifier:]", v3, v6);
  }
LABEL_11:

}

+ (void)_scheduleDataSaveForSceneSession:(id)a3 saveRestorationActivity:(BOOL)a4
{
  id v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9[2];
  id location;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;

  v6 = a3;
  if (pthread_main_np() == 1)
  {
    _MergedGlobals_1161 |= a4;
    if ((byte_1ECD7F321 & 1) == 0)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Scheduling save for userInfo/stateRestorationActivity"), "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]");
      objc_initWeak(&location, v6);
      byte_1ECD7F321 = 1;
      v7 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke_2;
      block[3] = &unk_1E16C0530;
      objc_copyWeak(v9, &location);
      v9[1] = a1;
      dispatch_after(v7, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke;
    v11[3] = &unk_1E16BFE60;
    v13 = a1;
    v12 = v6;
    v14 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded
{
  _QWORD block[5];

  if (-[UIActivityContinuationManager activityContinuationsAreBeingTracked](self->_activityContinuationManager, "activityContinuationsAreBeingTracked"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___UICanvasUserActivityManager__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

+ (void)_deleteSceneSessionsWithPersistentIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Scene %@ is being deleted, clearing cached last restoration activity"), "+[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:]", v8);
        _updateLastRestorationDictionaryForPersistentIdentifier(0, v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  _persistenceQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___UICanvasUserActivityManager__deleteSceneSessionsWithPersistentIdentifiers___block_invoke;
  block[3] = &unk_1E16B1B28;
  v12 = v3;
  v10 = v3;
  dispatch_sync(v9, block);

}

+ (void)_initializeUserActivityManager
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (_UIStateRestorationDebugLogEnabled())
  {
    v2 = objc_opt_class();
    NSLog(CFSTR("%s: Registering component provider class %@"), "+[_UICanvasUserActivityManager _initializeUserActivityManager]", v2);
  }
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_397);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _registerSceneComponentClass:withKey:predicate:](UIWindowScene, "_registerSceneComponentClass:withKey:predicate:", v3, CFSTR("UIUserActivitySceneComponentKey"), v4);

}

+ (void)_saveRestorationStateForScene:(id)a3
{
  id v3;

  if (a3)
  {
    objc_msgSend(a1, "_userActivityManagerForScene:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_saveSceneRestorationState");

  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Called with nil scene, skipping save"), "+[_UICanvasUserActivityManager _saveRestorationStateForScene:]");
  }
}

- (void)_saveSceneRestorationState
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  v47 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: No persistent identifier for UIScene, not saving UIScene state. UIScene = %@"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v47);
      goto LABEL_58;
    }
    objc_msgSend(v47, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isPersistable"))
    {
      objc_msgSend(v47, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_userInfoIsDirty"))
      {

      }
      else
      {
        objc_msgSend(v47, "session");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_configurationIsDirty");

        if (!v9)
          goto LABEL_13;
      }
      objc_msgSend(v47, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UICanvasUserActivityManager _updatePersistedSceneSession:](_UICanvasUserActivityManager, "_updatePersistedSceneSession:", v6);
    }

LABEL_13:
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Checking for user activity to save UIScene state for scene with identifier %@"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v5);
    objc_msgSend(v47, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    objc_msgSend(v47, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stateRestorationActivity");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setStateRestorationActivityIsDirty:", 0);

    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Using UIScene stateRestorationActivity by default unless overridden by Scene delegate, activity = %@"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v13);
    if ((v11 & 1) != 0)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Calling stateRestorationActivityForScene:"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
      objc_msgSend(v47, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stateRestorationActivityForScene:", v47);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v16;
      if (!v16)
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: UIScene delegate stateRestorationActivityForScene: returned nil for activity"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
LABEL_29:
        v13 = 0;
LABEL_39:
        v33 = 0;
LABEL_57:
        -[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:](self, "_saveOrClearRestorationDictionary:forScene:", v33, v47);

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      objc_msgSend(v47, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      v19 = _UIStateRestorationDebugLogEnabled();
      if ((v18 & 1) != 0)
      {
        if (v19)
          NSLog(CFSTR("%s: Calling _activityToSaveStateForCanvas:"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
        objc_msgSend(v47, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_activityToSaveStateForCanvas:", v47);
        v21 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v21;
        if (!v21)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: UIScene delegate _activityToSaveStateForCanvas: returned nil for activity"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
          goto LABEL_29;
        }
      }
      else
      {
        if (v19)
          NSLog(CFSTR("%s: UIScene delegate does not respond to stateRestorationActivityForScene: or _activityToSaveStateForCanvas:"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
        if (!v13)
          goto LABEL_39;
      }
    }
    if (_UIStateRestorationDebugLogEnabled())
    {
      objc_msgSend(v13, "activityType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Found activity to save UIScene state, type = %@, title = %@, userInfo = %@"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v22, v23, v24);

    }
    v25 = v13;
    objc_msgSend((id)UIApp, "_getActivityContinuationManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userActivityWillSave:", v25);
    objc_msgSend(v25, "delegate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(v25, "delegate");
      v29 = objc_claimAutoreleasedReturnValue();
      if ((void *)v29 == v26)
      {

      }
      else
      {
        v30 = (void *)v29;
        objc_msgSend(v25, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) == 0)
          goto LABEL_42;
        objc_msgSend(v25, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "userActivityWillSave:", v25);
      }

    }
LABEL_42:

    objc_msgSend(v47, "session");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_resetStateRestorationToActivity:", v25);

    v13 = v25;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    if (_UIStateRestorationDebugLogEnabled())
    {
      objc_msgSend(v13, "activityType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Creating user activity dictionary for UIScene state: %@, type = %@, title = %@"), "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v13, v35, v36);

    }
    objc_msgSend(v13, "activityType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v37, CFSTR("CanvasRestorationUserActivityTypeKey"));

    objc_msgSend(v13, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v13, "title");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v39, CFSTR("CanvasRestorationUserActivityTitleKey"));

    }
    objc_msgSend(v13, "userInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = _UIStateRestorationDebugLogEnabled();
    if (v40)
    {
      if (v41)
        NSLog(CFSTR("%s: Securely coding restoration activity into an NSData"), "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)");
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v13, "userInfo");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "encodeObject:forKey:", v43, CFSTR("CanvasRestorationUserActivityUserInfoKey"));

      objc_msgSend(v42, "finishEncoding");
      if (_UIStateRestorationDebugLogEnabled())
      {
        objc_msgSend(v42, "encodedData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%s: Encoded user Info saved UIScene state is %@"), "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v44);

      }
      objc_msgSend(v42, "encodedData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v42, "encodedData");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v46, CFSTR("CanvasRestorationUserActivityUserInfoDataKey"));

      }
    }
    else
    {
      if (!v41)
      {
LABEL_56:

        goto LABEL_57;
      }
      objc_msgSend(v13, "userInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: No user activity userInfo, or userInfo is not valid plist to save: %@"), "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v42);
    }

    goto LABEL_56;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Associated UIScene no longer exists, skipping canvas restoration"), "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
LABEL_59:

}

- (void)_setupCanvasRestorationState
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSUserActivity *v7;
  id v8;
  NSUserActivity *restorationActivity;
  NSUserActivity *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *connectionOptionsRestorationActivityDictionary;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v14 = 0;
      +[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:](_UICanvasUserActivityManager, "_getRestorationUserActivityForPersistentIdentifier:error:", v6, &v14);
      v7 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      restorationActivity = self->_restorationActivity;
      self->_restorationActivity = v7;

      v10 = self->_restorationActivity;
      if (!v10 || v8)
        goto LABEL_11;
      v15[0] = CFSTR("UICanvasConnectionOptionsUserActivityTypeKey");
      -[NSUserActivity activityType](v10, "activityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = CFSTR("UICanvasConnectionOptionsUserActivityKey");
      v16[0] = v11;
      v16[1] = self->_restorationActivity;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      connectionOptionsRestorationActivityDictionary = self->_connectionOptionsRestorationActivityDictionary;
      self->_connectionOptionsRestorationActivityDictionary = v12;

    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(CFSTR("%s: Scene has no identifier, skipping restoration. Scene: %@"), "-[_UICanvasUserActivityManager _setupCanvasRestorationState]", v4);
    }
    v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Scene does not exist, skipping restoration"), "-[_UICanvasUserActivityManager _setupCanvasRestorationState]");
LABEL_12:

}

+ (void)_updatePersistedSceneSession:(id)a3
{
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "_userInfoIsDirty"))
    _saveSceneSessionUserInfo(v4);
  if (objc_msgSend(v4, "_configurationIsDirty"))
  {
    objc_msgSend(v4, "_setConfigurationIsDirty:", 0);
    _persistenceQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___UICanvasUserActivityManager__updatePersistedSceneSession___block_invoke;
    block[3] = &unk_1E16B1B28;
    v6 = v4;
    dispatch_sync(v3, block);

  }
}

- (void)_saveOrClearRestorationDictionary:(id)a3 forScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _restorationPath(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)_lastRestorationDictionaryMap, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && objc_msgSend(v5, "isEqualToDictionary:", v10))
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Restoration Dictionary is the same as the last one that was saved, skipping save"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]");
      v11 = 0;
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Saving scene state, updating cached last restoration activity"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]");
      _updateLastRestorationDictionaryForPersistentIdentifier(v5, v8);
      _ensureRestorationDirectoryExists(v8);
      v29 = 0;
      objc_msgSend(v5, "writeToURL:error:", v9, &v29);
      v17 = v29;
      if (v17)
      {
        v11 = v17;
        NSLog(CFSTR("%s: Error writing archived restorable state: %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v17);
      }
      else
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Wrote UIScene restoration state into path %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9);
        objc_msgSend(v6, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        v20 = *MEMORY[0x1E0C99938];
        if ((v19 & 1) != 0)
        {
          v21 = *MEMORY[0x1E0C99920];
          v28 = 0;
          objc_msgSend(v9, "setResourceValue:forKey:error:", v21, v20, &v28);
          v22 = v28;
          v23 = v22;
          if (v22)
            NSLog(CFSTR("%s: Error setting protection class for UIScene restoration state: %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v22);
        }
        else
        {
          v23 = 0;
        }
        v26 = 0;
        v27 = 0;
        objc_msgSend(v9, "getResourceValue:forKey:error:", &v27, v20, &v26);
        v25 = v27;
        v11 = v26;

        if (v11)
        {
          NSLog(CFSTR("%s: Error getting protection class for UIScene restoration state: %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v11);
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(CFSTR("%s: File protection class for saved restoration file is %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v25);
        }

      }
    }

    goto LABEL_35;
  }
  _updateLastRestorationDictionaryForPersistentIdentifier(0, v8);
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Nothing to save for UIScene's activity restoration file, deleting existing file if it exists: %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v13 = objc_msgSend(v12, "removeItemAtURL:error:", v9, &v30);
  v14 = v30;

  if (v14 || (v11 = 0, (v13 & 1) == 0))
  {
    if (v14)
    {
      objc_msgSend(v14, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 == (void *)*MEMORY[0x1E0CB28A8])
      {
        v24 = objc_msgSend(v14, "code");

        if (v24 == 4)
        {
LABEL_27:
          v11 = v14;
          goto LABEL_35;
        }
      }
      else
      {

      }
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Warning: Unable to delete UIScene Restoration file: %@, error = %@"), "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9, v14);
    goto LABEL_27;
  }
LABEL_35:

}

+ (id)_knownSceneSessionMap
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v4 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend((id)qword_1ECD7F328, "count"));
  _persistenceQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___UICanvasUserActivityManager__knownSceneSessionMap__block_invoke;
  v11[3] = &unk_1E16B1B50;
  v6 = v4;
  v12 = v6;
  v13 = v2;
  v7 = v2;
  dispatch_sync(v5, v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

+ (void)_showProgressForScene:(id)a3 whenFetchingUserActivityForTypes:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  +[_UICanvasUserActivityManager _userActivityManagerForScene:](_UICanvasUserActivityManager, "_userActivityManagerForScene:", a3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v8, "copy");
    v7 = (void *)v5[5];
    v5[5] = v6;

  }
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_weakScene);
}

- (UIActivityContinuationManager)_activityContinuationManager
{
  return self->_activityContinuationManager;
}

- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff"), CFSTR("Handoff"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Waiting for Handoff to “%@”."), CFSTR("Waiting for Handoff to “%@”."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)UIApp, "_localizedApplicationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIApplicationModalProgressController instanceForScene:](_UIApplicationModalProgressController, "instanceForScene:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UICanvasUserActivityManager _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke;
      v17[3] = &unk_1E16B1BA0;
      v14 = &v18;
      v18 = v6;
      objc_msgSend(v13, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v8, v11, 0, v12, v17);
    }
    else
    {
      -[_UICanvasUserActivityManager _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 1);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2;
      v15[3] = &unk_1E16B1BA0;
      v14 = &v16;
      v16 = v6;
      objc_msgSend(v13, "displayWithTitle:message:progress:buttonTitle:sourceViewController:preDisplayTestBlock:dismissalHandler:", v8, v11, 0, v12, 0, 0, v15);
    }

  }
}

- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[_UICanvasUserActivityManager _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI"))
  {
    +[_UIApplicationModalProgressController instanceForScene:](_UIApplicationModalProgressController, "instanceForScene:", WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICanvasUserActivityManager _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 0);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff"), CFSTR("Handoff"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff Failed"), CFSTR("Handoff Failed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v6, v7, 0, v8, 0);

  }
}

- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[_UICanvasUserActivityManager _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI"))
  {
    +[_UIApplicationModalProgressController instanceForScene:](_UIApplicationModalProgressController, "instanceForScene:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICanvasUserActivityManager _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89___UICanvasUserActivityManager_activityContinuationManager_hideProgressUIWithCompletion___block_invoke;
    v8[3] = &unk_1E16B1BA0;
    v9 = v5;
    objc_msgSend(v7, "hideAfterMinimumUptimeWithDismissalHandler:", v8);

  }
  else if (v5)
  {
    v5[2](v5);
  }

}

- (id)activityContinuationManagerUserCancelledError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB28A8];
  v9 = *MEMORY[0x1E0CB2D50];
  _UINSLocalizedStringWithDefaultValue(CFSTR("User cancelled waiting for the activity"), CFSTR("User cancelled waiting for the activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 3072, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "scene:willContinueUserActivityWithType:", WeakRetained, v5);

    v11 = !-[NSSet containsObject:](self->_activityTypesForDefaultProgressUI, "containsObject:", v5);
  }
  else
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v13, "_canvas:willContinueUserActivityWithType:", WeakRetained, v5);

    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }

  return v11;
}

- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "scene:continueUserActivity:", WeakRetained, v5);
    v11 = 1;
  }
  else
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
      v11 = 1;
      goto LABEL_7;
    }
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_canvas:continueUserActivity:", WeakRetained, v5);
  }

LABEL_7:
  return v11;
}

- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "scene:didFailToContinueUserActivityWithType:error:", WeakRetained, v14, v7);
LABEL_5:

    goto LABEL_6;
  }
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_canvas:didFailToContinueUserActivityWithType:error:", WeakRetained, v14, v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4
{
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "scene:didUpdateUserActivity:", WeakRetained, v11);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_canvas:didUpdateUserActivity:", WeakRetained, v11);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)_fetchSceneSessionWithPersistentIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__142;
  v15 = __Block_byref_object_dispose__142;
  v16 = 0;
  _persistenceQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75___UICanvasUserActivityManager__fetchSceneSessionWithPersistentIdentifier___block_invoke;
  v8[3] = &unk_1E16BACE0;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  dispatch_sync(v4, v8);

  _decodeSceneSession((void *)v12[5], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_performCanvasRestoration
{
  void *v3;
  void *v4;
  NSUserActivity *restorationActivity;
  NSUserActivity *v6;
  NSUserActivity *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  NSUserActivity *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_msgSend(WeakRetained, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained && v4)
  {
    restorationActivity = self->_restorationActivity;
    if (restorationActivity)
    {
      v6 = restorationActivity;
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Restoring canvas state with user activity: %@"), "-[_UICanvasUserActivityManager _performCanvasRestoration]", v6);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57___UICanvasUserActivityManager__performCanvasRestoration__block_invoke;
      v9[3] = &unk_1E16B1B50;
      v10 = WeakRetained;
      v11 = v6;
      v7 = v6;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v9);

    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(CFSTR("%s: No restoration activity for Scene, not restoring state. Canvas = %@"), "-[_UICanvasUserActivityManager _performCanvasRestoration]", WeakRetained);
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: No definition for Scene, not restoring state. Scene = %@"), "-[_UICanvasUserActivityManager _performCanvasRestoration]", WeakRetained);
  }

}

- (void)_performCanvasRestorationIfNecessary
{
  NSUserActivity *restorationActivity;

  if (self->_restorationActivity)
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Restoration Activity found, performing Canvas Restoration"), "-[_UICanvasUserActivityManager _performCanvasRestorationIfNecessary]");
    -[_UICanvasUserActivityManager _performCanvasRestoration](self, "_performCanvasRestoration");
    restorationActivity = self->_restorationActivity;
    self->_restorationActivity = 0;

  }
}

- (id)_updateCanvasConnectionOptionsDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (!self->_connectionOptionsRestorationActivityDictionary)
    goto LABEL_7;
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "objectForKey:", CFSTR("UICanvasConnectionOptionsUserActivityDictionariesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setByAddingObject:", self->_connectionOptionsRestorationActivityDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_connectionOptionsRestorationActivityDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("UICanvasConnectionOptionsUserActivityDictionariesKey"));
  objc_msgSend(v6, "setObject:forKey:", self->_connectionOptionsRestorationActivityDictionary, CFSTR("_UICanvasConnectionOptionsRestorationActivityDictionaryKey"));

  if (v6)
  {
    v10 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
LABEL_7:
    v10 = v5;
  }

  return v10;
}

+ (id)_activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)UIApp;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "_getActivityContinuationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_initialRestorationIsFinished
{
  return self->_initialRestorationIsFinished;
}

- (BOOL)_isDisplayingActivityContinuationUI
{
  return self->_isDisplayingActivityContinuationUI;
}

- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3
{
  self->_isDisplayingActivityContinuationUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypesForDefaultProgressUI, 0);
  objc_storeStrong((id *)&self->_activityContinuationManager, 0);
  objc_storeStrong((id *)&self->_connectionOptionsRestorationActivityDictionary, 0);
  objc_storeStrong((id *)&self->_restorationActivity, 0);
  objc_destroyWeak((id *)&self->_weakScene);
}

@end
