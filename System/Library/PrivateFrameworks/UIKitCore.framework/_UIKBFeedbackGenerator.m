@implementation _UIKBFeedbackGenerator

- (_UIKBFeedbackGenerator)init
{
  _UIKBFeedbackGenerator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSUserDefaults *soundsDefaults;
  id v8;
  void *v9;
  uint64_t v10;
  __CFString **v11;
  uint64_t v12;
  NSDictionary *systemSounds;
  _QWORD handler[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UIKBFeedbackGenerator;
  v2 = -[_UIKBFeedbackGenerator init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.UIKit.UIKBFeedbackGenerator", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
    soundsDefaults = v2->_soundsDefaults;
    v2->_soundsDefaults = (NSUserDefaults *)v6;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_soundsDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("keyboard-audio"), 1, &kKVOContext);
    v2->_ringerStateNotifyToken = -1;
    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30___UIKBFeedbackGenerator_init__block_invoke;
    handler[3] = &unk_1E16C2E38;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.springboard.ringerstate", &v2->_ringerStateNotifyToken, MEMORY[0x1E0C80D38], handler);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__keyboardPreferencesDidUpdateNotification_, CFSTR("UIKeyboardPreferencesDidUpdateNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__dictationDidBeginNotification_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__dictationDidEndNotification_, CFSTR("UIDictationControllerDictationDidFinish"), 0);
    if (_UIApplicationIsExtension())
    {
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__stopEngineForApplicationNotification_, 0x1E1784A40, 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__stopEngineForApplicationNotification_, 0x1E1784A60, 0);
      v10 = 0;
      v11 = &_UIViewServiceRemoteViewControllerWillDisconnectNotificationName;
    }
    else
    {
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__stopEngineForApplicationNotification_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__stopEngineForApplicationNotification_, CFSTR("UIApplicationSuspendedNotification"), UIApp);
      v10 = UIApp;
      v11 = UIApplicationSuspendedEventsOnlyNotification;
    }
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__stopEngineForApplicationNotification_, *v11, v10);
    -[_UIKBFeedbackGenerator _updateMode]((uint64_t)v2);
    v19[0] = &unk_1E1A97590;
    v19[1] = &unk_1E1A975C0;
    v20[0] = &unk_1E1A975A8;
    v20[1] = &unk_1E1A975D8;
    v19[2] = &unk_1E1A975F0;
    v19[3] = &unk_1E1A97620;
    v20[2] = &unk_1E1A97608;
    v20[3] = &unk_1E1A97608;
    v19[4] = &unk_1E1A97638;
    v19[5] = &unk_1E1A97650;
    v20[4] = &unk_1E1A97608;
    v20[5] = &unk_1E1A975D8;
    v19[6] = &unk_1E1A97668;
    v19[7] = &unk_1E1A97680;
    v20[6] = &unk_1E1A975A8;
    v20[7] = &unk_1E1A975D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
    v12 = objc_claimAutoreleasedReturnValue();
    systemSounds = v2->_systemSounds;
    v2->_systemSounds = (NSDictionary *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (uint64_t)_updateMode
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  _BOOL4 isRingerSwitch;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const __CFString *v20;
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_feedbackSupportLevel");

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visceral");

  v7 = v3 != 2 || v6 == 0;
  v8 = !v7;
  isRingerSwitch = -[_UIKBFeedbackGenerator _isRingerSwitchOn](a1);
  v10 = -[_UIKBFeedbackGenerator _areKeyClicksEnabled](*(void **)(a1 + 16));
  v11 = v8 ^ 1;
  if ((v10 & isRingerSwitch & 1) != 0 || v11)
  {
    v13 = v10 & isRingerSwitch ^ 1;
    v7 = (v11 | v13) == 0;
    v14 = 3;
    if (!v7)
      v14 = 0;
    if ((v8 | v13) == 1)
      v12 = v14;
    else
      v12 = 1;
  }
  else
  {
    v12 = 2;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __37___UIKBFeedbackGenerator__updateMode__block_invoke;
  v22[3] = &__block_descriptor_40_e32_v16__0___UIKBFeedbackGenerator_8l;
  v22[4] = v12;
  -[_UIKBFeedbackGenerator _performOnQueue:]((_QWORD *)a1, v22);
  _UIKBFeedbackLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "unsupported";
    if (v3 == 2)
      v16 = "supported";
    v17 = "disabled";
    if (v6)
      v18 = "enabled";
    else
      v18 = "disabled";
    v19 = "off";
    if (isRingerSwitch)
      v19 = "on";
    if (v10)
      v17 = "enabled";
    if ((unint64_t)(v12 - 1) > 2)
      v20 = CFSTR("none");
    else
      v20 = off_1E16C3110[v12 - 1];
    *(_DWORD *)buf = 138413570;
    v24 = a1;
    v25 = 2080;
    v26 = v16;
    v27 = 2080;
    v28 = v18;
    v29 = 2080;
    v30 = v19;
    v31 = 2080;
    v32 = v17;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "%@: Updating mode. Haptics: %s. Haptics: %s. Ringer: %s. Sound: %s. Mode: %@", buf, 0x3Eu);
  }

  *(_QWORD *)(a1 + 120) = v12;
  return v12;
}

- (void)_performOnQueue:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = a1[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42___UIKBFeedbackGenerator__performOnQueue___block_invoke;
    block[3] = &unk_1E16C14D0;
    objc_copyWeak(&v7, &location);
    v6 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (BOOL)_isRingerSwitchOn
{
  int v2;
  NSObject *v4;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 24);
  if (v2 == -1)
  {
    _UIKBFeedbackLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v5 = 138412290;
      *(_QWORD *)&v5[4] = a1;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%@: Error, attempting to read ringer state with an invalid token.", v5, 0xCu);
    }

    return 0;
  }
  else
  {
    *(_QWORD *)v5 = 0;
    notify_get_state(v2, (uint64_t *)v5);
    return *(_QWORD *)v5 != 0;
  }
}

- (uint64_t)_areKeyClicksEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("keyboard-audio"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int64_t mode;
  NSObject *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  int64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[4];
  id v24;
  uint8_t buf[4];
  _UIKBFeedbackGenerator *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E16B1BA0;
  v6 = v4;
  v24 = v6;
  v7 = _Block_copy(aBlock);
  _UIKBFeedbackLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIKBFeedbackGenerator activateWithCompletionBlock:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  if (!self->_isActive)
  {
    mode = self->__mode;
    if (mode)
    {
      if ((_UIApplicationIsExtension() & 1) != 0
        || (_UIApplicationMayVendViews() & 1) != 0
        || !objc_msgSend((id)UIApp, "isSuspended"))
      {
        if (mode == 1)
        {
          if (!+[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]())
          {
            _UIKBFeedbackLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = self;
              _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "%@: Preheating System Sounds.", buf, 0xCu);
            }

            +[UIDevice currentDevice](UIDevice, "currentDevice");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_registerForSystemSounds:", self);

            self->_isActive = 1;
            goto LABEL_7;
          }
          v20[0] = v5;
          v20[1] = 3221225472;
          v20[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_110;
          v20[3] = &unk_1E16C3058;
          v22 = 1;
          v20[4] = self;
          v21 = v7;
          -[_UIKBFeedbackGenerator _performOnQueue:](self, v20);
          v14 = v21;
        }
        else
        {
          v17[0] = v5;
          v17[1] = 3221225472;
          v17[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_4;
          v17[3] = &unk_1E16C30A8;
          v19 = mode;
          v18 = v7;
          -[_UIKBFeedbackGenerator _performOnQueue:](self, v17);
          v14 = v18;
        }

        goto LABEL_21;
      }
      _UIKBFeedbackLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        v13 = "%@: Cannot activate engine while suspended.";
LABEL_19:
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else
    {
      _UIKBFeedbackLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        v13 = "%@: Nothing to activate. Keyboard feedback is disabled.";
        goto LABEL_19;
      }
    }

    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
    goto LABEL_21;
  }
  _UIKBFeedbackLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%@: Skipping activation. Already activated.", buf, 0xCu);
  }

LABEL_7:
  (*((void (**)(void *, uint64_t))v7 + 2))(v7, 1);
LABEL_21:

}

- (BOOL)isActive
{
  return self->_isActive;
}

+ (uint64_t)_usesCoreHapticsForAudioOnly
{
  objc_opt_self();
  if (qword_1ECD7D5D8 != -1)
    dispatch_once(&qword_1ECD7D5D8, &__block_literal_global_149);
  return _MergedGlobals_1009;
}

- (void)_stopEngineForApplicationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  _UIKBFeedbackGenerator *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self && (self->__mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    _UIKBFeedbackLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@: Request engine stop for application notification: %@", (uint8_t *)&v7, 0x16u);

    }
    -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_107);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopEngineDueToIdle, 0);
  }

}

- (void)dealloc
{
  CHHapticEngine *engine;
  CHHapticEngine *v4;
  NSDictionary *players;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_time_t v9;
  NSObject *queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  NSDictionary *v23;
  _QWORD v24[11];
  uint8_t buf[4];
  _UIKBFeedbackGenerator *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  CHHapticEngine *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[_UIKBFeedbackGenerator _sendAnalyticsEvent]((uint64_t)self);
  engine = self->_engine;
  if (*(_OWORD *)&self->_engine != 0)
  {
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__64;
    v34 = __Block_byref_object_dispose__64;
    v35 = engine;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__64;
    v22 = __Block_byref_object_dispose__64;
    v23 = self->_players;
    v4 = self->_engine;
    self->_engine = 0;

    players = self->_players;
    self->_players = 0;

    _UIKBFeedbackLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 40);
      v8 = v19[5];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      v27 = 2048;
      v28 = v7;
      v29 = 2048;
      v30 = v8;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%@: Engine %p or players %p exist during dealloc, releasing them from our worker queue.", buf, 0x20u);
    }

    v9 = dispatch_time(0, 1000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33___UIKBFeedbackGenerator_dealloc__block_invoke;
    block[3] = &unk_1E16C2E60;
    block[4] = &v31;
    block[5] = &v18;
    dispatch_after(v9, queue, block);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v31, 8);
  }
  _UIKBFeedbackLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v31) = 138412290;
    *(_QWORD *)((char *)&v31 + 4) = self;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "%@: Stopping engine: dealloc", (uint8_t *)&v31, 0xCu);
  }

  notify_cancel(self->_ringerStateNotifyToken);
  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_soundsDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("keyboard-audio"), kKVOContext);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("UIKeyboardPreferencesDidUpdateNotification");
  v24[1] = 0x1E1784A40;
  v24[2] = 0x1E1784A60;
  v24[3] = CFSTR("_UIViewServiceRemoteViewControllerWillDisconnectNotification");
  v24[4] = CFSTR("UIApplicationWillResignActiveNotification");
  v24[5] = CFSTR("UIApplicationSuspendedNotification");
  v24[6] = CFSTR("UIApplicationSuspendedEventsOnlyNotification");
  v24[7] = CFSTR("UIKeyboardDidBeginDictationNotification");
  v24[8] = CFSTR("UIDictationControllerDictationDidFinish");
  getAVSystemController_EffectiveVolumeDidChangeNotification();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  getAVSystemController_ServerConnectionDiedNotification();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v12, self, v15);

  v16.receiver = self;
  v16.super_class = (Class)_UIKBFeedbackGenerator;
  -[_UIKBFeedbackGenerator dealloc](&v16, sel_dealloc);
}

- (void)_sendAnalyticsEvent
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
      *(double *)(a1 + 40) = v3 + *(double *)(a1 + 40);

      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[UIKBAnalyticsDispatcher hapticEventEngineDuration:startCount:actionCount:](UIKBAnalyticsDispatcher, "hapticEventEngineDuration:startCount:actionCount:", v5, *(_QWORD *)(a1 + 56), *(double *)(a1 + 40));
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)kKVOContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("keyboard-audio"), a4, a5))
      -[_UIKBFeedbackGenerator _resetWithReason:](self, CFSTR("audio keyboard feedback setting was changed"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKBFeedbackGenerator;
    -[_UIKBFeedbackGenerator observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_resetWithReason:(void *)a1
{
  id v3;
  int v4;
  NSObject *v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "isActive");
    _UIKBFeedbackLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "no";
      *(_DWORD *)buf = 138412802;
      v12 = a1;
      if (v4)
        v6 = "yes";
      v13 = 2080;
      v14 = v6;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@: Calling deactivate (was active: %s) for reason: %@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, a1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43___UIKBFeedbackGenerator__resetWithReason___block_invoke;
    v7[3] = &unk_1E16C2F48;
    objc_copyWeak(&v9, (id *)buf);
    v10 = v4;
    v8 = v3;
    -[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]((uint64_t)a1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_performOnMain:(void *)a1
{
  void (**v3)(id, void *);
  _QWORD block[4];
  void (**v5)(id, void *);
  id v6;
  id location;

  v3 = a2;
  if (a1)
  {
    if (pthread_main_np() == 1)
    {
      v3[2](v3, a1);
    }
    else
    {
      objc_initWeak(&location, a1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41___UIKBFeedbackGenerator__performOnMain___block_invoke;
      block[3] = &unk_1E16C14D0;
      objc_copyWeak(&v6, &location);
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_setIsEngineRunning:(uint64_t)a1
{
  _QWORD v4[5];
  char v5;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(unsigned __int8 *)(a1 + 112) != a2)
    {
      *(_BYTE *)(a1 + 112) = a2;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __46___UIKBFeedbackGenerator__setIsEngineRunning___block_invoke;
      v4[3] = &unk_1E16C2F20;
      v5 = a2;
      v4[4] = a1;
      -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, v4);
    }
  }
}

- (void)_recreateEngineAndPlayersOnQueueWithMode:(void *)a3 reason:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  id *v9;
  void *v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void **v72;
  _QWORD v73[8];
  _BYTE buf[24];
  uint64_t v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void **v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v60 = *(unsigned __int8 *)(a1 + 112);
  -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue](a1);
  _UIKBFeedbackLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%@: Recreating engine with reason %@.", buf, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(_BYTE *)(a1 + 76))
  {
    _UIKBFeedbackLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a1;
    v8 = "%@: Feedback is disabled; skipping CoreHaptics engine and player creation.";
    goto LABEL_6;
  }
  if (!*(_BYTE *)(a1 + 77) || *(_BYTE *)(a1 + 78))
  {
    v73[0] = &unk_1E1A97590;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v9 = (id *)qword_1ECD7D5F0;
    v75 = qword_1ECD7D5F0;
    if (!qword_1ECD7D5F0)
    {
      v10 = CoreHapticsLibrary();
      v9 = (id *)dlsym(v10, "CHHapticPatternLibraryKeyKeyboardInputText");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
      qword_1ECD7D5F0 = (uint64_t)v9;
    }
    _Block_object_dispose(buf, 8);
    if (v9)
    {
      v59 = *v9;
      *(_QWORD *)buf = v59;
      v73[1] = &unk_1E1A975C0;
      v61 = 0;
      v62 = (uint64_t)&v61;
      v63 = 0x2020000000;
      v11 = (id *)qword_1ECD7D5F8;
      v64 = (void *)qword_1ECD7D5F8;
      if (!qword_1ECD7D5F8)
      {
        v12 = CoreHapticsLibrary();
        v11 = (id *)dlsym(v12, "CHHapticPatternLibraryKeyKeyboardInputSeparator");
        *(_QWORD *)(v62 + 24) = v11;
        qword_1ECD7D5F8 = (uint64_t)v11;
      }
      _Block_object_dispose(&v61, 8);
      if (v11)
      {
        v58 = *v11;
        *(_QWORD *)&buf[8] = v58;
        v73[2] = &unk_1E1A975F0;
        v61 = 0;
        v62 = (uint64_t)&v61;
        v63 = 0x2020000000;
        v13 = (id *)qword_1ECD7D600;
        v64 = (void *)qword_1ECD7D600;
        if (!qword_1ECD7D600)
        {
          v14 = CoreHapticsLibrary();
          v13 = (id *)dlsym(v14, "CHHapticPatternLibraryKeyKeyboardDeletion");
          *(_QWORD *)(v62 + 24) = v13;
          qword_1ECD7D600 = (uint64_t)v13;
        }
        _Block_object_dispose(&v61, 8);
        if (v13)
        {
          v15 = *v13;
          *(_QWORD *)&buf[16] = v15;
          v73[3] = &unk_1E1A97620;
          v61 = 0;
          v62 = (uint64_t)&v61;
          v63 = 0x2020000000;
          v16 = (id *)qword_1ECD7D608;
          v64 = (void *)qword_1ECD7D608;
          if (!qword_1ECD7D608)
          {
            v17 = CoreHapticsLibrary();
            v16 = (id *)dlsym(v17, "CHHapticPatternLibraryKeyKeyboardDeletionRepeat");
            *(_QWORD *)(v62 + 24) = v16;
            qword_1ECD7D608 = (uint64_t)v16;
          }
          _Block_object_dispose(&v61, 8);
          if (v16)
          {
            v18 = *v16;
            v75 = (uint64_t)v18;
            v73[4] = &unk_1E1A97638;
            v61 = 0;
            v62 = (uint64_t)&v61;
            v63 = 0x2020000000;
            v19 = (id *)qword_1ECD7D610;
            v64 = (void *)qword_1ECD7D610;
            if (!qword_1ECD7D610)
            {
              v20 = CoreHapticsLibrary();
              v19 = (id *)dlsym(v20, "CHHapticPatternLibraryKeyKeyboardDeletionRapid");
              *(_QWORD *)(v62 + 24) = v19;
              qword_1ECD7D610 = (uint64_t)v19;
            }
            _Block_object_dispose(&v61, 8);
            if (v19)
            {
              v21 = *v19;
              v76 = v21;
              v73[5] = &unk_1E1A97650;
              getCHHapticPatternLibraryKeyKeyboardOther();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v22;
              v73[6] = &unk_1E1A97668;
              v61 = 0;
              v62 = (uint64_t)&v61;
              v63 = 0x2020000000;
              v23 = (id *)qword_1ECD7D618;
              v64 = (void *)qword_1ECD7D618;
              if (!qword_1ECD7D618)
              {
                v24 = CoreHapticsLibrary();
                v23 = (id *)dlsym(v24, "CHHapticPatternLibraryKeyKeyboardInputCandidate");
                *(_QWORD *)(v62 + 24) = v23;
                qword_1ECD7D618 = (uint64_t)v23;
              }
              _Block_object_dispose(&v61, 8);
              if (v23)
              {
                v78 = *v23;
                v73[7] = &unk_1E1A97680;
                v25 = v78;
                getCHHapticPatternLibraryKeyKeyboardOther();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = v26;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v73, 8);
                v7 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = MEMORY[0x1E0C809B0];
                v61 = MEMORY[0x1E0C809B0];
                v62 = 3221225472;
                v63 = (uint64_t)__65___UIKBFeedbackGenerator__createEngineAndPlayersOnQueueWithMode___block_invoke;
                v64 = &unk_1E16C2E88;
                v65 = a1;
                v67 = a2;
                v29 = v27;
                v66 = v29;
                -[NSObject enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &v61);
                objc_storeStrong((id *)(a1 + 88), v27);
                v30 = *(void **)(a1 + 64);
                *(_QWORD *)(a1 + 64) = 0;

                if (a2 != 3)
                {
                  v31 = +[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]() ^ 1;
                  if (a2 != 1)
                    LOBYTE(v31) = 1;
                  if ((v31 & 1) != 0)
                    goto LABEL_37;
                }
                v80 = 0;
                v81 = &v80;
                v82 = 0x2050000000;
                v32 = (void *)qword_1ECD7D628;
                v83 = qword_1ECD7D628;
                if (!qword_1ECD7D628)
                {
                  v68 = v28;
                  v69 = 3221225472;
                  v70 = (uint64_t)__getAVSystemControllerClass_block_invoke;
                  v71 = &unk_1E16B14C0;
                  v72 = &v80;
                  __getAVSystemControllerClass_block_invoke((uint64_t)&v68);
                  v32 = v81[3];
                }
                v33 = objc_retainAutorelease(v32);
                _Block_object_dispose(&v80, 8);
                objc_msgSend(v33, "sharedAVSystemController");
                v34 = objc_claimAutoreleasedReturnValue();
                v35 = *(void **)(a1 + 64);
                *(_QWORD *)(a1 + 64) = v34;

                getAVSystemController_EffectiveVolumeDidChangeNotification();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = *(void **)(a1 + 64);
                v68 = 0;
                v69 = (uint64_t)&v68;
                v70 = 0x2020000000;
                v39 = (_QWORD *)qword_1ECD7D630;
                v71 = (void *)qword_1ECD7D630;
                if (!qword_1ECD7D630)
                {
                  v40 = MediaExperienceLibrary();
                  v39 = dlsym(v40, "AVSystemController_SubscribeToNotificationsAttribute");
                  *(_QWORD *)(v69 + 24) = v39;
                  qword_1ECD7D630 = (uint64_t)v39;
                }
                _Block_object_dispose(&v68, 8);
                if (v39)
                {
                  objc_msgSend(v38, "setAttribute:forKey:error:", v37, *v39, 0);
                  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  getAVSystemController_EffectiveVolumeDidChangeNotification();
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "addObserver:selector:name:object:", a1, sel__effectiveVolumeDidChangeNotification_, v42, *(_QWORD *)(a1 + 64));

                  getAVSystemController_ServerConnectionDiedNotification();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "addObserver:selector:name:object:", a1, sel__serverConnectionDiedNotification_, v43, 0);

                  objc_msgSend(*(id *)(a1 + 64), "getVolume:forCategory:", a1 + 72, CFSTR("Ringtone"));
LABEL_37:

                  goto LABEL_39;
                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_SubscribeToNotificationsAttribute(void)");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("_UIKBFeedbackGenerator.m"), 51, CFSTR("%s"), dlerror());

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputCandidate(void)");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 90, CFSTR("%s"), dlerror(), v58, v59);

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletionRapid(void)");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 88, CFSTR("%s"), dlerror(), v58, v59);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletionRepeat(void)");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 87, CFSTR("%s"), dlerror(), v58, v59);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletion(void)");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 86, CFSTR("%s"), dlerror(), v58, v59);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputSeparator(void)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 85, CFSTR("%s"), dlerror());

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputText(void)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 84, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  _UIKBFeedbackLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a1;
    v8 = "%@: Audio-only mode; skipping CoreHaptics engine and player creation.";
LABEL_6:
    _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
  }
LABEL_39:

  if (v60)
    -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:](a1, v5, 0);
  else
    -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, &__block_literal_global_86);

}

- (void)_deactivateWithCompletionBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD aBlock[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_1E16B1BF8;
    v6 = v3;
    v18 = v6;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = *(_QWORD *)(a1 + 120);
    if (v8 == 1)
    {
      if (+[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]())
      {
        v15[0] = v5;
        v15[1] = 3221225472;
        v15[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_2;
        v15[3] = &unk_1E16C2FE0;
        v16 = v7;
        -[_UIKBFeedbackGenerator _performOnQueue:]((_QWORD *)a1, v15);
        v9 = v16;
LABEL_9:

LABEL_14:
        goto LABEL_15;
      }
      _UIKBFeedbackLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = a1;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "%@: Cooling System Sounds.", buf, 0xCu);
      }

      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_unregisterForSystemSounds:", a1);

      *(_BYTE *)(a1 + 28) = 0;
    }
    else if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      _UIKBFeedbackLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = a1;
        v21 = 2080;
        v22 = "-[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]";
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%@: Request engine to stop for: %s", buf, 0x16u);
      }

      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_111;
      v13[3] = &unk_1E16C2FE0;
      v14 = v6;
      -[_UIKBFeedbackGenerator _performOnQueue:]((_QWORD *)a1, v13);
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__stopEngineDueToIdle, 0);
      v9 = v14;
      goto LABEL_9;
    }
    v7[2](v7);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)_recreateEngineAndPlayersIfNecessaryOnQueueWithMode:(void *)a3 reason:
{
  id v5;
  id v6;

  v5 = a3;
  if (a1 && !*(_QWORD *)(a1 + 80))
  {
    v6 = v5;
    -[_UIKBFeedbackGenerator _recreateEngineAndPlayersOnQueueWithMode:reason:](a1, a2, v5);
    v5 = v6;
  }

}

- (void)_releaseEngineAndPlayersOnQueue
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    _UIKBFeedbackLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "%@: Releasing engine and players.", (uint8_t *)&v5, 0xCu);
    }

    -[_UIKBFeedbackGenerator _setIsEngineRunning:](a1, 0);
    v3 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v4 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

  }
}

- (void)_startEngineIfNecessaryOnQueueWithReason:(void *)a3 completionBlock:
{
  id v5;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  void (**v8)(id, uint64_t);
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char v14;
  id v15;
  _BYTE buf[24];
  void *v17;
  void (**v18)(id, uint64_t);
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_BYTE *)(a1 + 112))
    {
      if (v6)
        v6[2](v6, 1);
    }
    else
    {
      _UIKBFeedbackLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%@: Requesting engine start for reason: %@", buf, 0x16u);
      }

      v8 = v6;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      v9 = *(void **)(a1 + 80);
      if (v9)
      {
        v15 = 0;
        objc_msgSend(v9, "startAndReturnError:", &v15);
        v10 = v15;
        _UIKBFeedbackLog();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v10;
            _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Error starting CHHapticEngine: %@", buf, 0x16u);
          }

        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = a1;
            _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%@: Engine started (or it was already running).", buf, 0xCu);
          }

          -[_UIKBFeedbackGenerator _setIsEngineRunning:](a1, 1);
        }
        v14 = *(_BYTE *)(a1 + 112);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __65___UIKBFeedbackGenerator__startEngineOnQueueWithCompletionBlock___block_invoke;
        v17 = &unk_1E16C2FB8;
        v19 = v14;
        v18 = v8;
        -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, buf);

      }
      else
      {
        _UIKBFeedbackLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = a1;
          _os_log_error_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@: Error: Cannot start engine because it does not exist.", buf, 0xCu);
        }

        if (v8)
          v8[2](v8, 0);
      }

    }
  }

}

- (void)_stopEngineIfNecessaryOnQueueAndReleaseResources:(void *)a3 completionBlock:
{
  void (**v5)(_QWORD);
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  id v10;
  char v11;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_BYTE *)(a1 + 112))
    {
      objc_initWeak(location, (id)a1);
      v6 = *(void **)(a1 + 80);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke;
      v8[3] = &unk_1E16C3008;
      objc_copyWeak(&v10, location);
      v9 = v5;
      v11 = a2;
      objc_msgSend(v6, "stopWithCompletionHandler:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(location);
    }
    else
    {
      _UIKBFeedbackLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = (id)a1;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%@: Engine is not running.", (uint8_t *)location, 0xCu);
      }

      if (a2)
        -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue](a1);
      if (v5)
        v5[2](v5);
    }
  }

}

- (void)_resetIdleTimer
{
  void *v2;
  double v3;
  id v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__stopEngineDueToIdle, 0);
    if (a1[15] != 1)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("KeyboardFeedbackIdleTimeout"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "doubleValue");
        if (v3 <= 0.0)
          goto LABEL_9;
      }
      else
      {
        v3 = 5.0;
      }
      objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel__stopEngineDueToIdle, 0, v3);
LABEL_9:

    }
  }
}

- (void)_stopEngineDueToIdle
{
  NSObject *v3;
  int v4;
  _UIKBFeedbackGenerator *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _UIKBFeedbackLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%@: Requesting engine stop for idle.", (uint8_t *)&v4, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_102);
  if (self)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopEngineDueToIdle, 0);
}

- (void)_dictationDidBeginNotification:(id)a3
{
  NSObject *v4;
  int v5;
  _UIKBFeedbackGenerator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIKBFeedbackLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Dictation did begin.", (uint8_t *)&v5, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_103_0);
}

- (void)_dictationDidEndNotification:(id)a3
{
  NSObject *v4;
  int v5;
  _UIKBFeedbackGenerator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIKBFeedbackLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Dictation did end.", (uint8_t *)&v5, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_104);
}

- (void)_keyboardPreferencesDidUpdateNotification:(id)a3
{
  -[_UIKBFeedbackGenerator _resetWithReason:](self, CFSTR("keyboard preferences changed"));
}

- (void)_effectiveVolumeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = (id *)getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr;
  v17 = getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr;
  if (!getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr)
  {
    v7 = MediaExperienceLibrary();
    v6 = (id *)dlsym(v7, "AVSystemController_EffectiveVolumeNotificationParameter_Category");
    v15[3] = (uint64_t)v6;
    getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v8 = *v6;
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Ringtone")))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64___UIKBFeedbackGenerator__effectiveVolumeDidChangeNotification___block_invoke;
      v12[3] = &unk_1E16C3030;
      v13 = v9;
      -[_UIKBFeedbackGenerator _performOnQueue:](self, v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_EffectiveVolumeNotificationParameter_Category(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_UIKBFeedbackGenerator.m"), 54, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)_serverConnectionDiedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _UIKBFeedbackGenerator *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIKBFeedbackLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%@: AVSystemController error notification: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)deactivate
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36___UIKBFeedbackGenerator_deactivate__block_invoke;
  v3[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, &location);
  -[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]((uint64_t)self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)actionOccurred:(int64_t)a3
{
  -[_UIKBFeedbackGenerator actionOccurred:atLocation:](self, "actionOccurred:atLocation:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _UIKBFeedbackGenerator *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self && self->__mode)
  {
    if (!-[_UIKBFeedbackGenerator isActive](self, "isActive", a4.x, a4.y))
    {
      _UIKBFeedbackLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v9 = self;
        v10 = 2080;
        v11 = "-[_UIKBFeedbackGenerator actionOccurred:atLocation:]";
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%@: Activating for %s", buf, 0x16u);
      }

      -[_UIKBFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52___UIKBFeedbackGenerator_actionOccurred_atLocation___block_invoke;
    v7[3] = &__block_descriptor_40_e32_v16__0___UIKBFeedbackGenerator_8l;
    v7[4] = a3;
    -[_UIKBFeedbackGenerator _performOnQueue:](self, v7);
    -[_UIKBFeedbackGenerator _resetIdleTimer](self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSounds, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_engineStartDate, 0);
  objc_storeStrong((id *)&self->_soundsDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
