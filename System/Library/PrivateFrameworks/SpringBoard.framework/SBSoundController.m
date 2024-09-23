@implementation SBSoundController

+ (SBSoundController)sharedInstance
{
  if (sharedInstance_pred_0 != -1)
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_223);
  return (SBSoundController *)(id)sharedInstance___sharedInstance_16;
}

uint64_t __35__SBSoundController_sharedInstance__block_invoke()
{
  SBSoundController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBSoundController);
  v1 = (void *)sharedInstance___sharedInstance_16;
  sharedInstance___sharedInstance_16 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBSoundController)init
{
  SBSoundController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *soundsBySystemSoundIDs;
  uint64_t v5;
  NSMapTable *toneAlertsBySounds;
  uint64_t v7;
  NSMapTable *soundsByToneAlerts;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *pendedCallbacks;
  NSMutableSet *v12;
  NSMutableSet *usedNotificationTypes;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSoundController;
  v2 = -[SBSoundController init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    soundsBySystemSoundIDs = v2->_soundsBySystemSoundIDs;
    v2->_soundsBySystemSoundIDs = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    toneAlertsBySounds = v2->_toneAlertsBySounds;
    v2->_toneAlertsBySounds = (NSMapTable *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    soundsByToneAlerts = v2->_soundsByToneAlerts;
    v2->_soundsByToneAlerts = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__ringerStateChanged_, CFSTR("SBRingerChangedNotification"), 0);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendedCallbacks = v2->_pendedCallbacks;
    v2->_pendedCallbacks = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    usedNotificationTypes = v2->_usedNotificationTypes;
    v2->_usedNotificationTypes = v12;

  }
  return v2;
}

- (BOOL)isPlayingAnySound
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController isPlayingAnySound].cold.1();
  return -[NSMutableDictionary count](self->_soundsBySystemSoundIDs, "count")
      || -[NSMapTable count](self->_toneAlertsBySounds, "count") != 0;
}

- (BOOL)isPlaying:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController isPlaying:].cold.1();
  v5 = objc_msgSend(v4, "soundType");
  if (v5 == 3)
  {
    -[NSMapTable objectForKey:](self->_toneAlertsBySounds, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 != 0;
  }
  else
  {
    if (v5)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "_resolvedSystemSoundID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_soundsBySystemSoundIDs, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

  }
LABEL_8:

  return v8;
}

- (id)activateSound:(id)a3 forReason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController activateSound:forReason:].cold.3();
  if (!v7)
    goto LABEL_13;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSoundController activateSound:forReason:].cold.1(a2, (uint64_t)self, (uint64_t)v14);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A80D00);
  }
  SBLogSound();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Activating sound: %{public}@ for reason: %{public}@", buf, 0x16u);
  }

  v10 = objc_msgSend(v7, "soundType");
  v11 = 0;
  if (v10 && v10 != 3)
  {
    if (v10 == 5)
    {
      -[SBSoundController _activateFeedback:forReason:](self, "_activateFeedback:forReason:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBSoundController activateSound:forReason:].cold.2();

LABEL_13:
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (BOOL)playSoundWithDefaultEnvironment:(id)a3
{
  return -[SBSoundController playSound:environments:completion:](self, "playSound:environments:completion:", a3, 1, 0);
}

- (BOOL)playSound:(id)a3 environments:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  BOOL v20;
  int v22;
  _BYTE v23[10];
  _BYTE v24[14];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
LABEL_28:
    v20 = 0;
    goto LABEL_29;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController playSound:environments:completion:].cold.2();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isCarDestinationActive"))
    v11 = 2;
  else
    v11 = 1;

  SBLogSound();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & a4) == 0)
  {
    if (v13)
    {
      v22 = 67109634;
      *(_DWORD *)v23 = a4;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v11;
      *(_WORD *)v24 = 2114;
      *(_QWORD *)&v24[2] = v8;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "SBSoundController: not playing sound - environments=%i allowed=%i -> %{public}@", (uint8_t *)&v22, 0x18u);
    }

    goto LABEL_28;
  }
  if (v13)
  {
    v22 = 138543362;
    *(_QWORD *)v23 = v8;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Play sound: %{public}@", (uint8_t *)&v22, 0xCu);
  }

  -[SBSoundController stopSound:](self, "stopSound:", v8);
  v14 = objc_msgSend(v8, "soundType");
  switch(v14)
  {
    case 5:
      v15 = -[SBSoundController _playFeedback:](self, "_playFeedback:", v8);
      goto LABEL_18;
    case 3:
      v15 = -[SBSoundController _playToneAlert:](self, "_playToneAlert:", v8);
      goto LABEL_18;
    case 0:
      v15 = -[SBSoundController _playSystemSound:](self, "_playSystemSound:", v8);
LABEL_18:
      v16 = v15;
      goto LABEL_22;
  }
  SBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBSoundController playSound:environments:completion:].cold.1();

  v16 = 0;
LABEL_22:
  SBLogSound();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("failed to play");
    v22 = 138543874;
    if (v16)
      v19 = CFSTR("played");
    *(_QWORD *)v23 = v19;
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)v24 = a4;
    *(_WORD *)&v24[4] = 2114;
    *(_QWORD *)&v24[6] = v8;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBSoundController: %{public}@ sound - environments=%i -> %{public}@", (uint8_t *)&v22, 0x1Cu);
  }

  if (!v16)
    goto LABEL_28;
  objc_msgSend(v8, "_setCompletionBlock:", v9);
  -[SBSoundController _soundDidStartPlaying:](self, "_soundDidStartPlaying:", v8);
  v20 = 1;
LABEL_29:

  return v20;
}

- (BOOL)stopSound:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController stopSound:].cold.2();
  v5 = -[SBSoundController isPlaying:](self, "isPlaying:", v4);
  if (v5)
  {
    SBLogSound();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "SBSoundController: stopping sound -> %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = objc_msgSend(v4, "soundType");
    if (v7 != 5)
    {
      if (v7 == 3)
      {
        -[SBSoundController _cleanupToneAlertForSound:andKill:](self, "_cleanupToneAlertForSound:andKill:", v4, 1);
      }
      else if (v7)
      {
        SBLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SBSoundController stopSound:].cold.1();

      }
      else
      {
        -[SBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", objc_msgSend(v4, "_resolvedSystemSoundID"), 1);
      }
    }
  }

  return v5;
}

- (BOOL)stopAllSounds
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  int v16;
  NSObject *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController stopAllSounds].cold.1();
  SBLogSound();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBSoundController: stopping all sounds", buf, 2u);
  }

  if (-[NSMutableDictionary count](self->_soundsBySystemSoundIDs, "count"))
    v5 = 1;
  else
    v5 = -[NSMapTable count](self->_toneAlertsBySounds, "count") != 0;
  -[SBSoundController _beginPendingCallbacksBlock](self, "_beginPendingCallbacksBlock");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_soundsBySystemSoundIDs, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        -[SBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntValue"), 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)-[NSMapTable copy](self->_toneAlertsBySounds, "copy");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        -[SBSoundController _cleanupToneAlertForSound:andKill:](self, "_cleanupToneAlertForSound:andKill:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v13);
  }

  v16 = objc_msgSend(MEMORY[0x1E0DBF730], "_stopAllAlerts") | v5;
  if (-[NSMutableDictionary count](self->_soundsBySystemSoundIDs, "count")
    || -[NSMapTable count](self->_soundsByToneAlerts, "count")
    || -[NSMapTable count](self->_toneAlertsBySounds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSoundController.m"), 246, CFSTR("systemSounds=%@ : tones=%@ (alerts=%@)"), self->_soundsBySystemSoundIDs, self->_soundsByToneAlerts, self->_toneAlertsBySounds);

    if (!v16)
      goto LABEL_28;
  }
  else if (!v16)
  {
    goto LABEL_28;
  }
  SBLogSound();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "SBSoundController: stopped all sounds", buf, 2u);
  }

LABEL_28:
  -[SBSoundController _endPendingCallbacksBlock](self, "_endPendingCallbacksBlock");
  return v16;
}

- (void)addObserver:(id)a3
{
  void *v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController addObserver:].cold.1();
  v4 = v9;
  if (v9)
  {
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v9);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController removeObserver:].cold.1();
  v4 = v5;
  if (v5)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
    v4 = v5;
  }

}

- (BOOL)handleVolumeButtonDownEvent
{
  NSObject *v3;
  uint8_t v5[16];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController handleVolumeButtonDownEvent].cold.1();
  SBLogSound();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Volume button down", v5, 2u);
  }

  return -[SBSoundController stopAllSounds](self, "stopAllSounds");
}

- (void)_cleanupSystemSound:(unsigned int)a3 andKill:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    -[SBSoundController _cleanupSystemSound:andKill:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  AudioServicesRemoveSystemSoundCompletion(v5);
  if (v4)
    AudioServicesStopSystemSound();
  -[NSMutableDictionary objectForKey:](self->_soundsBySystemSoundIDs, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_soundsBySystemSoundIDs, "removeObjectForKey:", v8);
    -[SBSoundController _soundDidFinishPlaying:](self, "_soundDidFinishPlaying:", v7);
  }

}

- (void)_cleanupToneAlertForSound:(id)a3 andKill:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[NSMapTable objectForKey:](self->_toneAlertsBySounds, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (v4)
      objc_msgSend(v6, "stop");
    -[NSMapTable removeObjectForKey:](self->_toneAlertsBySounds, "removeObjectForKey:", v8);
    -[NSMapTable removeObjectForKey:](self->_soundsByToneAlerts, "removeObjectForKey:", v7);
    -[SBSoundController _soundDidFinishPlaying:](self, "_soundDidFinishPlaying:", v8);
  }

}

- (BOOL)_playSystemSound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFRunLoop *Current;
  OSStatus v13;
  NSObject *v14;
  NSObject *v15;
  SystemSoundID v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = objc_msgSend(v4, "systemSoundID");
  objc_msgSend(v4, "songPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    strlen((const char *)objc_msgSend(v7, "UTF8String"));
    if (AudioServicesCreateSystemSoundIDWithPath())
    {
      SBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBSoundController _playSystemSound:].cold.1((uint64_t)v7, v8);

    }
  }
  objc_msgSend(v4, "vibrationPattern");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v17 && v9)
    v17 = 4095;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "soundBehavior");
  -[SBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", v17, 1);
  Current = CFRunLoopGetCurrent();
  v13 = AudioServicesAddSystemSoundCompletion(v17, Current, (CFStringRef)*MEMORY[0x1E0C9B270], (AudioServicesSystemSoundCompletionProc)SystemSoundCompleted, 0);
  if (v13)
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Failed to register a completion handler for sound: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v4, "_setResolvedSoundID:", v17);
    -[NSMutableDictionary setObject:forKey:](self->_soundsBySystemSoundIDs, "setObject:forKey:", v4, v11);
    SBLogSound();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v17;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Play SystemSoundID: %ul", buf, 8u);
    }

    AudioServicesPlaySystemSoundWithVibration();
  }

  return v13 == 0;
}

- (BOOL)_playToneAlert:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  SBSoundController *v13;

  v4 = a3;
  objc_msgSend(v4, "toneAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __36__SBSoundController__playToneAlert___block_invoke;
    v11 = &unk_1E8EB3600;
    v6 = v4;
    v12 = v6;
    v13 = self;
    objc_msgSend(v5, "playWithCompletionHandler:", &v8);
    -[NSMapTable setObject:forKey:](self->_toneAlertsBySounds, "setObject:forKey:", v5, v6, v8, v9, v10, v11);
    -[NSMapTable setObject:forKey:](self->_soundsByToneAlerts, "setObject:forKey:", v6, v5);

  }
  return v5 != 0;
}

void __36__SBSoundController__playToneAlert___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SBSoundController__playToneAlert___block_invoke_2;
  v7[3] = &unk_1E8EA0AC8;
  v11 = a2;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __36__SBSoundController__playToneAlert___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 56) == 5)
  {
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __36__SBSoundController__playToneAlert___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  }
  return objc_msgSend(*(id *)(a1 + 48), "_cleanupToneAlertForSound:andKill:", *(_QWORD *)(a1 + 32), 0);
}

- (id)_activateFeedback:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  UINotificationFeedbackGenerator *v8;
  id v9;
  UINotificationFeedbackGenerator *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  UINotificationFeedbackGenerator *v18;

  v6 = a3;
  v7 = a4;
  -[SBSoundController _configureWithFeedbackType:](self, "_configureWithFeedbackType:", objc_msgSend(v6, "eventType"));
  v8 = self->_hapticFeedbackGenerator;
  -[UINotificationFeedbackGenerator activateWithCompletionBlock:](v8, "activateWithCompletionBlock:", 0);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__SBSoundController__activateFeedback_forReason___block_invoke;
  v15[3] = &unk_1E8EB3628;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSoundController-Activation"), v11, v15);

  return v13;
}

uint64_t __49__SBSoundController__activateFeedback_forReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogSound();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Deactivating feedback: %{public}@ (activated for reason: %{public}@)", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "deactivate");
}

- (void)_configureWithFeedbackType:(int64_t)a3
{
  NSMutableSet *usedNotificationTypes;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;
  UINotificationFeedbackGenerator *v10;
  UINotificationFeedbackGenerator *hapticFeedbackGenerator;
  id v12;

  usedNotificationTypes = self->_usedNotificationTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(usedNotificationTypes) = -[NSMutableSet containsObject:](usedNotificationTypes, "containsObject:", v6);

  if ((usedNotificationTypes & 1) == 0)
  {
    v7 = self->_usedNotificationTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v7, "addObject:", v8);

    v9 = objc_alloc(MEMORY[0x1E0CEA7D0]);
    objc_msgSend(MEMORY[0x1E0CEAE28], "privateConfigurationForTypes:", self->_usedNotificationTypes);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (UINotificationFeedbackGenerator *)objc_msgSend(v9, "initWithConfiguration:", v12);
    hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
    self->_hapticFeedbackGenerator = v10;

  }
}

- (BOOL)_playFeedback:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "eventType");
  -[SBSoundController _configureWithFeedbackType:](self, "_configureWithFeedbackType:", v4);
  -[UINotificationFeedbackGenerator _privateNotificationOccurred:](self->_hapticFeedbackGenerator, "_privateNotificationOccurred:", v4);
  return 1;
}

- (void)_ringerStateChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBRingerChangedRingerMutedUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    SBLogSound();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Ringer was muted.", v8, 2u);
    }

    -[SBSoundController stopAllSounds](self, "stopAllSounds");
  }
}

- (void)_soundDidStartPlaying:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SBSoundController__soundDidStartPlaying___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBSoundController _enqueueCallback:](self, "_enqueueCallback:", v6);

}

void __43__SBSoundController__soundDidStartPlaying___block_invoke(uint64_t a1)
{
  void *v2;
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
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "soundDidBeginPlaying:", *(_QWORD *)(a1 + 40));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_soundDidFinishPlaying:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "_completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBSoundController _enqueueCallback:](self, "_enqueueCallback:", v5);
    objc_msgSend(v4, "_setCompletionBlock:", 0);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBSoundController__soundDidFinishPlaying___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SBSoundController _enqueueCallback:](self, "_enqueueCallback:", v7);

}

void __44__SBSoundController__soundDidFinishPlaying___block_invoke(uint64_t a1)
{
  void *v2;
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
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "soundDidFinishPlaying:", *(_QWORD *)(a1 + 40));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_beginPendingCallbacksBlock
{
  ++self->_pendingCallbacks;
}

- (void)_endPendingCallbacksBlock
{
  unint64_t pendingCallbacks;
  unint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  pendingCallbacks = self->_pendingCallbacks;
  if (!pendingCallbacks)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSoundController.m"), 458, CFSTR("unbalanced begin/end for pending callbacks"));

    pendingCallbacks = self->_pendingCallbacks;
  }
  v4 = pendingCallbacks - 1;
  self->_pendingCallbacks = v4;
  if (!v4)
  {
    v5 = (void *)-[NSMutableArray copy](self->_pendedCallbacks, "copy");
    -[NSMutableArray removeAllObjects](self->_pendedCallbacks, "removeAllObjects");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_enqueueCallback:(id)a3
{
  NSMutableArray *pendedCallbacks;
  void *v4;
  id v5;

  if (self->_pendingCallbacks)
  {
    pendedCallbacks = self->_pendedCallbacks;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = (void *)MEMORY[0x1D17E5550]();
    -[NSMutableArray addObject:](pendedCallbacks, "addObject:", v4);

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendedCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_soundsByToneAlerts, 0);
  objc_storeStrong((id *)&self->_toneAlertsBySounds, 0);
  objc_storeStrong((id *)&self->_hapticFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_usedNotificationTypes, 0);
  objc_storeStrong((id *)&self->_soundsBySystemSoundIDs, 0);
}

- (void)isPlayingAnySound
{
  __assert_rtn("-[SBSoundController isPlayingAnySound]", "SBSoundController.m", 99, "[NSThread isMainThread]");
}

- (void)isPlaying:.cold.1()
{
  __assert_rtn("-[SBSoundController isPlaying:]", "SBSoundController.m", 104, "[NSThread isMainThread]");
}

- (void)activateSound:(uint64_t)a3 forReason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSoundController.m");
  v16 = 1024;
  v17 = 125;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)activateSound:forReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_15(&dword_1D0540000, v0, v1, "%s doesn't know how to activate this sound type: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)activateSound:forReason:.cold.3()
{
  __assert_rtn("-[SBSoundController activateSound:forReason:]", "SBSoundController.m", 121, "[NSThread isMainThread]");
}

- (void)playSound:environments:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_15(&dword_1D0540000, v0, v1, "%s doesn't know how to play this sound type: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)playSound:environments:completion:.cold.2()
{
  __assert_rtn("-[SBSoundController playSound:environments:completion:]", "SBSoundController.m", 156, "[NSThread isMainThread]");
}

- (void)stopSound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_15(&dword_1D0540000, v0, v1, "%s doesn't know how to kill this sound type: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)stopSound:.cold.2()
{
  __assert_rtn("-[SBSoundController stopSound:]", "SBSoundController.m", 194, "[NSThread isMainThread]");
}

- (void)stopAllSounds
{
  __assert_rtn("-[SBSoundController stopAllSounds]", "SBSoundController.m", 221, "[NSThread isMainThread]");
}

- (void)addObserver:.cold.1()
{
  __assert_rtn("-[SBSoundController addObserver:]", "SBSoundController.m", 258, "[NSThread isMainThread]");
}

- (void)removeObserver:.cold.1()
{
  __assert_rtn("-[SBSoundController removeObserver:]", "SBSoundController.m", 268, "[NSThread isMainThread]");
}

- (void)handleVolumeButtonDownEvent
{
  __assert_rtn("-[SBSoundController handleVolumeButtonDownEvent]", "SBSoundController.m", 275, "[NSThread isMainThread]");
}

- (void)_cleanupSystemSound:andKill:.cold.1()
{
  __assert_rtn("-[SBSoundController _cleanupSystemSound:andKill:]", "SBSoundController.m", 290, "[NSThread isMainThread]");
}

- (void)_playSystemSound:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "No alert sound found at path '%{public}@'", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __36__SBSoundController__playToneAlert___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_15(&dword_1D0540000, a2, a3, "Failed to play alert with -[TLAlert playWithCompletionHandler:] for sound: %{public}@ error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
