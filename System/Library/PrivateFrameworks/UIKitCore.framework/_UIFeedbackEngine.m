@implementation _UIFeedbackEngine

- (_UIFeedbackEngine)init
{
  _UIFeedbackEngine *v2;
  uint64_t v3;
  NSMapTable *playerDequeueBlocks;
  void *v5;
  uint64_t v6;
  char **v7;
  const NSNotificationName *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_UIFeedbackEngine;
  v2 = -[_UIFeedbackEngine init](&v15, sel_init);
  v2->_enabled = 1;
  v2->_backgroundTaskIdentifier = 0;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  playerDequeueBlocks = v2->_playerDequeueBlocks;
  v2->_playerDequeueBlocks = (NSMapTable *)v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_UIApplicationIsExtension() & 1) != 0 || _UIApplicationMayVendViews())
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__hostDidEnterBackground_, 0x1E1784A40, 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__hostWillEnterForeground_, 0x1E1784A60, 0);
    v6 = 0;
    v7 = &selRef__remoteViewControllerWillDisconnect_;
    v8 = (const NSNotificationName *)&_UIViewServiceRemoteViewControllerWillDisconnectNotificationName;
  }
  else
  {
    if ((objc_msgSend((id)UIApp, "isSuspended") & 1) != 0
      || objc_msgSend((id)UIApp, "isSuspendedEventsOnly"))
    {
      if (qword_1ECD7B8C0 != -1)
        dispatch_once(&qword_1ECD7B8C0, &__block_literal_global_255_0);
      if (!byte_1ECD7B841)
      {
        v2->_suspended = 1;
        v2->_suspensionState = 0;
        if (!_UIFeedbackLoggingDisabled)
        {
          v9 = qword_1ECD7B858;
          if (!qword_1ECD7B858)
          {
            v9 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&qword_1ECD7B858);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v10;
            _UIDescriptionBuilderLightDescription(v2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v17 = v12;
            _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "creating engine while app suspended %@", buf, 0xCu);

          }
        }
      }
    }
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationWillSuspend_, CFSTR("UIApplicationSuspendedNotification"), UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationWillSuspend_, CFSTR("UIApplicationSuspendedEventsOnlyNotification"), UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationDidResume_, CFSTR("UIApplicationResumedNotification"), UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationDidResume_, CFSTR("UIApplicationResumedEventsOnlyNotification"), UIApp);
    v6 = UIApp;
    v7 = &selRef__applicationDidBecomeActive_;
    v8 = &UIApplicationDidBecomeActiveNotification;
  }
  objc_msgSend(v5, "addObserver:selector:name:object:", v2, *v7, *v8, v6);
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_EnableFeedbackEngineStateVisualization, (uint64_t)CFSTR("EnableFeedbackEngineStateVisualization")) & 1) == 0&& byte_1ECD761AC)
  {
    +[_UIFeedbackVisualizer sharedVisualizer](_UIFeedbackVisualizer, "sharedVisualizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addEngine:", v2);

  }
  return v2;
}

- (void)_internal_serviceBlocksForState:(int64_t)a3 withSuccess:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_completionBlocks, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_completionBlocks, "removeObjectForKey:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_applicationDidBecomeActive:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _applicationDidBecomeActive____s_category;
    if (!_applicationDidBecomeActive____s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_applicationDidBecomeActive____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "app did become active for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 0);
}

- (void)_applicationDidResume:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _applicationDidResume____s_category;
    if (!_applicationDidResume____s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_applicationDidResume____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "app did resume for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 0);
}

- (void)_startWarmingFeedbacks:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44___UIFeedbackEngine__startWarmingFeedbacks___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v4;
  v6 = v5;
  if (!v5)
  {
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

- (void)_internal_startWarmingFeedbacks:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

}

- (void)_internal_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  unint64_t v7;
  NSObject *v8;
  void *v9;
  _UIFeedbackEngine *v10;
  NSObject *v11;
  void *v12;
  int64_t prewarmCount;
  _UIFeedbackEngine *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (v4)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v7 = _internal_prewarm_andPerformWhenPrewarmed____s_category;
      if (!_internal_prewarm_andPerformWhenPrewarmed____s_category)
      {
        v7 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_internal_prewarm_andPerformWhenPrewarmed____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        v11 = v8;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v10), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        prewarmCount = v10->_prewarmCount;
        *(_DWORD *)buf = 138412802;
        v17 = v12;
        v18 = 2048;
        v19 = prewarmCount;
        v20 = 2048;
        v21 = prewarmCount + 1;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "prewarm engine %@, prewarmCount: %ld -> %ld", buf, 0x20u);

      }
    }
    ++self->_prewarmCount;
    if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
    {
      if (!self->_suspensionState)
        self->_suspensionState = 2;
      goto LABEL_14;
    }
  }
  else if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
  {
LABEL_14:
    if (v6)
      v6[2](v6, 1);
    goto LABEL_19;
  }
  switch(-[_UIFeedbackEngine _state](self, "_state"))
  {
    case 0:
    case 5:
      -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 2, v6);
      if (v4)
        -[_UIFeedbackEngine _internal_prewarmEngine](self, "_internal_prewarmEngine");
      break;
    case 1:
      v14 = self;
      v15 = 2;
      goto LABEL_18;
    case 2:
    case 4:
      goto LABEL_14;
    case 3:
      v14 = self;
      v15 = 4;
LABEL_18:
      -[_UIFeedbackEngine _internal_performAtState:block:](v14, "_internal_performAtState:block:", v15, v6);
      break;
    default:
      break;
  }
LABEL_19:

}

- (void)_internal_activate:(BOOL)a3 andPerformWhenRunning:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  unint64_t v7;
  NSObject *v8;
  void *v9;
  _UIFeedbackEngine *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void (**v14)(id, uint64_t);
  _UIFeedbackEngine *v15;
  uint64_t v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (v4)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v7 = _internal_activate_andPerformWhenRunning____s_category;
      if (!_internal_activate_andPerformWhenRunning____s_category)
      {
        v7 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_internal_activate_andPerformWhenRunning____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        v11 = v8;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v10), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v12;
        *(_DWORD *)buf = 138412802;
        v19 = v12;
        v20 = 2048;
        v21 = -[_UIFeedbackEngine numberOfClients](v10, "numberOfClients");
        v22 = 2048;
        v23 = -[_UIFeedbackEngine numberOfClients](v10, "numberOfClients") + 1;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "activate engine %@, clientCount: %ld -> %ld", buf, 0x20u);

      }
    }
    ++self->_numberOfClients;
    if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
    {
      self->_suspensionState = 4;
      goto LABEL_20;
    }
  }
  else if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
  {
LABEL_20:
    if (v6)
      v6[2](v6, 1);
    goto LABEL_22;
  }
  switch(-[_UIFeedbackEngine _state](self, "_state"))
  {
    case 0:
    case 2:
      goto LABEL_11;
    case 1:
      -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 4, v6);
      if (!v4)
        break;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __62___UIFeedbackEngine__internal_activate_andPerformWhenRunning___block_invoke;
      v17[3] = &unk_1E16B3FD8;
      v17[4] = self;
      v14 = (void (**)(id, uint64_t))v17;
      v15 = self;
      v16 = 2;
LABEL_16:
      -[_UIFeedbackEngine _internal_performAtState:block:](v15, "_internal_performAtState:block:", v16, v14);
      break;
    case 3:
      v15 = self;
      v16 = 4;
      v14 = v6;
      goto LABEL_16;
    case 4:
      goto LABEL_20;
    case 5:
      if (objc_msgSend((id)objc_opt_class(), "_supportsAbortingDeactivation") && v4)
      {
        -[_UIFeedbackEngine _setState:](self, "_setState:", 4);
        goto LABEL_20;
      }
LABEL_11:
      -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 4, v6);
      if (v4)
        -[_UIFeedbackEngine _internal_activateEngine](self, "_internal_activateEngine");
      break;
    default:
      break;
  }
LABEL_22:

}

- (int64_t)_state
{
  return self->_state;
}

- (void)_internal_deactivate
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _internal_deactivate___s_category;
    if (!_internal_deactivate___s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_internal_deactivate___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v9;
      *(_DWORD *)buf = 138412802;
      v16 = v9;
      v17 = 2048;
      v18 = -[_UIFeedbackEngine numberOfClients](v7, "numberOfClients");
      v19 = 2048;
      v20 = -[_UIFeedbackEngine numberOfClients](v7, "numberOfClients") - 1;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "deactivate engine %@, clientCount: %ld -> %ld", buf, 0x20u);

    }
  }
  if (!-[_UIFeedbackEngine numberOfClients](self, "numberOfClients"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFeedbackEngine.m"), 609, CFSTR("ERROR: -[%@ %@] called more times than the feedback engine was activated"), v13, v14);

  }
  --self->_numberOfClients;
  if (!-[_UIFeedbackEngine numberOfClients](self, "numberOfClients"))
  {
    if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
    {
      if (self->_suspensionState == 4)
      {
        if (-[_UIFeedbackEngine prewarmCount](self, "prewarmCount") < 1)
          self->_suspensionState = 0;
        else
          self->_suspensionState = 2;
      }
    }
    else
    {
      -[_UIFeedbackEngine _internal_deactivateEngineIfPossible](self, "_internal_deactivateEngineIfPossible");
    }
  }
}

- (unint64_t)numberOfClients
{
  return self->_numberOfClients;
}

- (int64_t)prewarmCount
{
  return self->_prewarmCount;
}

- (void)_internal_setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  _UIFeedbackEngine *v10;
  NSObject *v11;
  __CFString *v12;
  int suspended;
  int v14;
  int v15;
  unint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  _UIFeedbackEngine *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!v3)
    goto LABEL_10;
  if (qword_1ECD7B8C0 != -1)
    dispatch_once(&qword_1ECD7B8C0, &__block_literal_global_255_0);
  if (byte_1ECD7B841)
  {
    if (_UIFeedbackLoggingDisabled)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    v5 = qword_1ECD7B860;
    if (!qword_1ECD7B860)
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD7B860);
    }
    v6 = *(NSObject **)(v5 + 8);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    v8 = 0;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = self;
      v11 = v6;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v10), v10);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "ignoring request to suspend due to background feedback entitlement for engine %@", buf, 0xCu);

      goto LABEL_10;
    }
  }
  else
  {
    v8 = 1;
  }
LABEL_11:
  suspended = self->_suspended;
  self->_suspended = v8;
  v14 = -[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended");
  if (suspended != v14)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v15 = v14;
      v16 = qword_1ECD7B868;
      if (!qword_1ECD7B868)
      {
        v16 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7B868);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (suspended)
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        if (v15)
          v19 = CFSTR("YES");
        else
          v19 = CFSTR("NO");
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = self;
        v22 = v17;
        objc_msgSend(v20, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v21), v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412802;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v23;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "suspended changed from: %@ --> %@ for engine %@", buf, 0x20u);

      }
    }
    -[_UIFeedbackEngine _internal_updateSuspension](self, "_internal_updateSuspension");
  }
}

- (BOOL)_internal_isSuspended
{
  return self->_suspended;
}

- (void)_setSuspended:(BOOL)a3
{
  NSTimer *suspensionTimer;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[16];

  if (pthread_main_np() == 1)
  {
    -[NSTimer invalidate](self->_suspensionTimer, "invalidate");
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = 0;

    objc_msgSend((id)objc_opt_class(), "_internalQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35___UIFeedbackEngine__setSuspended___block_invoke;
    v12[3] = &unk_1E16B1B78;
    v12[4] = self;
    v13 = a3;
    v7 = v6;
    if (!v6)
    {
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
    }
    v9 = v6;
    dispatch_async(v7, v12);

  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v10 = _setSuspended____s_category;
    if (!_setSuspended____s_category)
    {
      v10 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_setSuspended____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "trying to suspend the feedback engine from a non-main thread, this is unsupported.", buf, 2u);
    }
  }
}

- (void)_internal_updateSuspension
{
  unint64_t v3;
  int64_t suspensionState;
  _QWORD v5[5];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
  {
    -[_UIFeedbackEngine _internal_teardownBackgroundTask](self, "_internal_teardownBackgroundTask");
    suspensionState = self->_suspensionState;
    if (suspensionState == 4)
    {
      if (-[_UIFeedbackEngine prewarmCount](self, "prewarmCount") < 1)
      {
        -[_UIFeedbackEngine _internal_activateEngine](self, "_internal_activateEngine");
        goto LABEL_13;
      }
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __47___UIFeedbackEngine__internal_updateSuspension__block_invoke;
      v5[3] = &unk_1E16B3FD8;
      v5[4] = self;
      -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 2, v5);
    }
    else if (suspensionState != 2)
    {
      goto LABEL_13;
    }
    -[_UIFeedbackEngine _internal_prewarmEngine](self, "_internal_prewarmEngine");
LABEL_13:
    self->_suspensionState = 0;
    return;
  }
  v3 = -[_UIFeedbackEngine _state](self, "_state");
  if (v3 <= 5)
    self->_suspensionState = qword_18667B268[v3];
  -[_UIFeedbackEngine _internal_deactivateEngineIfPossible](self, "_internal_deactivateEngineIfPossible");
  -[_UIFeedbackEngine _internal_cooldownEngineIfPossible](self, "_internal_cooldownEngineIfPossible");
  if ((-[_UIFeedbackEngine _state](self, "_state") & 0xFFFFFFFFFFFFFFFELL) == 4)
    -[_UIFeedbackEngine _internal_setupBackgroundTask](self, "_internal_setupBackgroundTask");
}

- (void)_internal_teardownBackgroundTask
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackEngine *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3 = -[_UIFeedbackEngine _backgroundTaskIdentifier](self, "_backgroundTaskIdentifier");
  if (v3)
  {
    v4 = v3;
    if (!_UIFeedbackLoggingDisabled)
    {
      v5 = _internal_teardownBackgroundTask___s_category;
      if (!_internal_teardownBackgroundTask___s_category)
      {
        v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_internal_teardownBackgroundTask___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = self;
        v9 = v6;
        objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 134218242;
        v12 = v4;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "ended background task with ID %ld for engine %@", buf, 0x16u);

      }
    }
    -[_UIFeedbackEngine _setBackgroundTaskIdentifier:](self, "_setBackgroundTaskIdentifier:", 0);
    objc_msgSend((id)UIApp, "endBackgroundTask:", v4);
  }
}

- (unint64_t)_backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)_internal_deactivateEngineIfPossible
{
  void *v3;
  _UIFeedbackEngine *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _UIFeedbackEngine *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = self;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v4), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_UIFeedbackLoggingDisabled)
  {
    v6 = _internal_deactivateEngineIfPossible___s_category;
    if (!_internal_deactivateEngineIfPossible___s_category)
    {
      v6 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_internal_deactivateEngineIfPossible___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 138412802;
      v14 = v5;
      v15 = 2048;
      v16 = -[_UIFeedbackEngine numberOfClients](v4, "numberOfClients");
      v17 = 2048;
      v18 = -[_UIFeedbackEngine _internal_isSuspended](v4, "_internal_isSuspended");
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "_internal_deactivateEngineIfPossible %@, clientCount: %ld, suspended: %ld", buf, 0x20u);

    }
  }
  if (-[_UIFeedbackEngine _state](v4, "_state") == 3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke;
    v12[3] = &unk_1E16B3FD8;
    v12[4] = v4;
    -[_UIFeedbackEngine _internal_performAtState:block:](v4, "_internal_performAtState:block:", 4, v12);
  }
  else if (!-[_UIFeedbackEngine numberOfClients](v4, "numberOfClients")
         || -[_UIFeedbackEngine _internal_isSuspended](v4, "_internal_isSuspended"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke_2;
    v9[3] = &unk_1E16B2218;
    v10 = v5;
    v11 = v4;
    -[_UIFeedbackEngine _internal_teardownUnderlyingPlayerIfPossibleWithCompletion:](v4, "_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:", v9);

  }
}

- (void)_setState:(int64_t)a3
{
  unint64_t state;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  _UIFeedbackEngine *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSTimer *v16;
  NSTimer *springBoardTimer;
  _QWORD block[7];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  state = self->_state;
  self->_state = a3;
  if (state != a3)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v6 = _setState____s_category_0;
      if (!_setState____s_category_0)
      {
        v6 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&_setState____s_category_0);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = self;
        v10 = v7;
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v9), v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v11;
        stringForFeedbackEngineState(state);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        stringForFeedbackEngineState(a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = v11;
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "engine %@ state changed: %@ -> %@", buf, 0x20u);

      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31___UIFeedbackEngine__setState___block_invoke;
    block[3] = &unk_1E16B4E70;
    block[4] = self;
    block[5] = state;
    block[6] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (os_variant_has_internal_diagnostics())
    {
      if (_UIApplicationProcessIsSpringBoard())
      {
        if (!state)
        {
          objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sb_stuckInNonInactiveState, 0, 0, 60.0);
          v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          springBoardTimer = self->_springBoardTimer;
          self->_springBoardTimer = v16;

          objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addTimer:forMode:", self->_springBoardTimer, *MEMORY[0x1E0C99860]);
          goto LABEL_14;
        }
        if (!a3)
        {
          -[NSTimer invalidate](self->_springBoardTimer, "invalidate");
          v15 = self->_springBoardTimer;
          self->_springBoardTimer = 0;
LABEL_14:

        }
      }
    }
  }
}

- (void)_internal_prewarmEngine
{
  int has_internal_diagnostics;
  int64_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  _UIFeedbackEngine *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = -[_UIFeedbackEngine _state](self, "_state");
  if (has_internal_diagnostics)
  {
    if (v4 == 1)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Attempt to prewarm a prewarming engine (%@)", buf, 0xCu);
      }

    }
  }
  else if (v4 == 1)
  {
    v6 = _internal_prewarmEngine___s_category;
    if (!_internal_prewarmEngine___s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_internal_prewarmEngine___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Attempt to prewarm a prewarming engine (%@)", buf, 0xCu);
    }
  }
  if (-[_UIFeedbackEngine prewarmCount](self, "prewarmCount"))
  {
    if (!-[_UIFeedbackEngine _state](self, "_state"))
      -[_UIFeedbackEngine _setState:](self, "_setState:", 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44___UIFeedbackEngine__internal_prewarmEngine__block_invoke;
    v8[3] = &unk_1E16B3FD8;
    v8[4] = self;
    -[_UIFeedbackEngine _internal_prewarmUnderlyingPlayerWithCompletion:](self, "_internal_prewarmUnderlyingPlayerWithCompletion:", v8);
  }
}

- (void)_internal_performAtState:(int64_t)a3 block:(id)a4
{
  void *v6;
  NSMutableDictionary *completionBlocks;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id aBlock;

  aBlock = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v6 = aBlock;
  if (aBlock)
  {
    completionBlocks = self->_completionBlocks;
    if (!completionBlocks)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_completionBlocks;
      self->_completionBlocks = v8;

      completionBlocks = self->_completionBlocks;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](completionBlocks, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_completionBlocks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    v14 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v14);

    v6 = aBlock;
  }

}

- (void)_internal_activateEngine
{
  int has_internal_diagnostics;
  int64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackEngine *v8;
  NSObject *v9;
  _UIFeedbackEngine *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  _UIFeedbackEngine *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = -[_UIFeedbackEngine _state](self, "_state");
  if (has_internal_diagnostics)
  {
    if (v4 == 3)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Attempt to activate an activating engine (%@)", buf, 0xCu);
      }

    }
  }
  else if (v4 == 3)
  {
    v12 = qword_1ECD7B870;
    if (!qword_1ECD7B870)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD7B870);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Attempt to activate an activating engine (%@)", buf, 0xCu);
    }
  }
  if (-[_UIFeedbackEngine numberOfClients](self, "numberOfClients"))
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v5 = qword_1ECD7B878;
      if (!qword_1ECD7B878)
      {
        v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD7B878);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = self;
        v9 = v6;
        objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
        v10 = (_UIFeedbackEngine *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "activating engine %@", buf, 0xCu);

      }
    }
    -[_UIFeedbackEngine _setState:](self, "_setState:", 3);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45___UIFeedbackEngine__internal_activateEngine__block_invoke;
    v14[3] = &unk_1E16B3FD8;
    v14[4] = self;
    -[_UIFeedbackEngine _internal_activateUnderlyingPlayerWithCompletion:](self, "_internal_activateUnderlyingPlayerWithCompletion:", v14);
  }
}

- (void)_stats_stateDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4 == 2)
  {
    -[_UIFeedbackEngine _prewarmCountStatistics](self, "_prewarmCountStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementValueBy:", 1);

    -[_UIFeedbackEngine _prewarmDurationStatistics](self, "_prewarmDurationStatistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 4)
      goto LABEL_6;
    -[_UIFeedbackEngine _activationCountStatistics](self, "_activationCountStatistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementValueBy:", 1);

    -[_UIFeedbackEngine _activationDurationStatistics](self, "_activationDurationStatistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  objc_msgSend(v7, "startTimingForObject:", self);

LABEL_6:
  if (a3 == 2)
  {
    -[_UIFeedbackEngine _prewarmDurationStatistics](self, "_prewarmDurationStatistics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 4)
      return;
    -[_UIFeedbackEngine _activationDurationStatistics](self, "_activationDurationStatistics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "recordTimingForObject:", self);

}

- (id)_activationDurationStatistics
{
  void *v2;
  void *v3;

  -[_UIFeedbackEngine _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackEngineActivationDurationWithSuffix:](_UIStatistics, "feedbackEngineActivationDurationWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activationCountStatistics
{
  void *v2;
  void *v3;

  -[_UIFeedbackEngine _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackEngineActivationCountWithSuffix:](_UIStatistics, "feedbackEngineActivationCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_prewarmDurationStatistics
{
  void *v2;
  void *v3;

  -[_UIFeedbackEngine _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackEnginePrewarmDurationWithSuffix:](_UIStatistics, "feedbackEnginePrewarmDurationWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_prewarmCountStatistics
{
  void *v2;
  void *v3;

  -[_UIFeedbackEngine _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackEnginePrewarmCountWithSuffix:](_UIStatistics, "feedbackEnginePrewarmCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_deactivate
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___UIFeedbackEngine__deactivate__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }
  v6 = v3;
  dispatch_async(v4, block);

}

- (void)_activate:(BOOL)a3 andPerformWhenRunning:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  _QWORD aBlock[4];
  id v19;

  v6 = a4;
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke;
    aBlock[3] = &unk_1E16B1BA0;
    v19 = v6;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_3;
  v15[3] = &unk_1E16BAFE8;
  v17 = a3;
  v15[4] = self;
  v16 = v9;
  v11 = v10;
  if (!v10)
  {
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

+ (id)engineForFeedback:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ECD7B850 != -1)
    dispatch_once(&qword_1ECD7B850, &__block_literal_global_193);
  objc_msgSend(v3, "_individualFeedbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)qword_1ECD7B848;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((_engineClassSupportsAllIndividualFeedbacks(v9, v4) & 1) != 0)
        {
          objc_msgSend(v9, "sharedEngine", (_QWORD)v11);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_playFeedback:(id)a3 atTime:(double)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  uint64_t v27;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "_effectiveFeedbackData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "_effectiveEnabledFeedbackTypes");
  objc_msgSend(v8, "_player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke;
  block[3] = &unk_1E16C5D30;
  block[4] = self;
  v22 = v10;
  v26 = a4;
  v27 = v11;
  v23 = v8;
  v24 = v12;
  v14 = v13;
  v25 = v9;
  if (!v13)
  {
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
  }
  v16 = v13;
  v17 = v9;
  v18 = v12;
  v19 = v8;
  v20 = v10;
  dispatch_async(v14, block);

}

- (void)_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  _QWORD aBlock[4];
  id v19;

  v6 = a4;
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke;
    aBlock[3] = &unk_1E16B1BA0;
    v19 = v6;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_3;
  v15[3] = &unk_1E16BAFE8;
  v17 = a3;
  v15[4] = self;
  v16 = v9;
  v11 = v10;
  if (!v10)
  {
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_internal_playFeedbackData:(id)a3 atTime:(double)a4 feedback:(id)a5 effectiveFeedbackType:(unint64_t)a6 existingPlayer:(id)a7 withCompletionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _UIFeedbackEngine *v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  id v43;
  double v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (-[_UIFeedbackEngine isEnabled](self, "isEnabled"))
  {
    if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
    {
      (*((void (**)(id, _QWORD, _QWORD, const __CFString *))v17 + 2))(v17, 0, 0, CFSTR("suspended"));
    }
    else if (-[_UIFeedbackEngine _state](self, "_state") == 4 || -[_UIFeedbackEngine _state](self, "_state") == 3)
    {
      if (a6)
      {
        v18 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke;
        aBlock[3] = &unk_1E16C5D58;
        v41 = v14;
        v19 = v15;
        v42 = v19;
        v44 = a4;
        v43 = v17;
        v20 = _Block_copy(aBlock);
        v21 = v20;
        if (v16)
        {
          (*((void (**)(void *, id))v20 + 2))(v20, v16);
        }
        else
        {
          -[NSMapTable objectForKey:](self->_playerDequeueBlocks, "objectForKey:", v19);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (id)v22;
            if (!_UIFeedbackLoggingDisabled)
            {
              v24 = qword_1ECD7B888;
              if (!qword_1ECD7B888)
              {
                v24 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v24, (unint64_t *)&qword_1ECD7B888);
              }
              v25 = *(NSObject **)(v24 + 8);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = v25;
                _UIDescriptionBuilderLightDescription(v19);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "player dequeue needed - existing request for feedback %@", buf, 0xCu);

              }
            }
            v28 = _Block_copy(v21);
            objc_msgSend(v23, "addObject:", v28);
          }
          else
          {
            if (!_UIFeedbackLoggingDisabled)
            {
              v29 = qword_1ECD7B880;
              if (!qword_1ECD7B880)
              {
                v29 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v29, (unint64_t *)&qword_1ECD7B880);
              }
              v30 = *(NSObject **)(v29 + 8);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = v30;
                _UIDescriptionBuilderLightDescription(v19);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v32;
                _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "player dequeue needed - initial request for feedback %@", buf, 0xCu);

              }
            }
            v33 = (void *)MEMORY[0x1E0C99DE8];
            v34 = _Block_copy(v21);
            objc_msgSend(v33, "arrayWithObject:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMapTable setObject:forKey:](self->_playerDequeueBlocks, "setObject:forKey:", v35, v19);
            v36[0] = v18;
            v36[1] = 3221225472;
            v36[2] = __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke_87;
            v36[3] = &unk_1E16C5D80;
            v37 = v19;
            v38 = self;
            v23 = v35;
            v39 = v23;
            -[_UIFeedbackEngine _internal_dequeueReusableFeedbackPlayerWithCompletionBlock:](self, "_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:", v36);

            v28 = v37;
          }

        }
      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD, const __CFString *))v17 + 2))(v17, 0, 0, CFSTR("has no effective enabled types"));
      }
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, const __CFString *))v17 + 2))(v17, 0, 0, CFSTR("engine not running or activating"));
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, const __CFString *))v17 + 2))(v17, 0, 0, CFSTR("not enabled"));
  }

}

- (void)_internal_willPlayFeedback:(id)a3 atTime:(double)a4
{
  id v6;
  _QWORD block[5];
  id v8;
  double v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_906, (uint64_t)CFSTR("EnableFeedbackVisualization")) & 1) == 0
    && byte_1ECD761B4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___UIFeedbackEngine__internal_willPlayFeedback_atTime___block_invoke;
    block[3] = &unk_1E16B1C28;
    v9 = a4;
    block[4] = self;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (id)_outOfChannelsCountStatistics
{
  void *v2;
  void *v3;

  -[_UIFeedbackEngine _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackEngineOutOfChannelsCountWithSuffix:](_UIStatistics, "feedbackEngineOutOfChannelsCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_stats_outOfChannels
{
  id v2;

  -[_UIFeedbackEngine _outOfChannelsCountStatistics](self, "_outOfChannelsCountStatistics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementValueBy:", 1);

}

+ (OS_dispatch_queue)_internalQueue
{
  return 0;
}

+ (id)sharedEngine
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFeedbackEngine.m"), 175, CFSTR("Should use one of the subclasses"));

  return 0;
}

+ (BOOL)_supportsPlayingFeedback:(id)a3
{
  void *v4;

  objc_msgSend(a3, "_individualFeedbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = _engineClassSupportsAllIndividualFeedbacks(a1, v4);

  return (char)a1;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  return 0;
}

+ (BOOL)_supportsPlayingFeedbackPatternsDirectly
{
  return 0;
}

+ (BOOL)_supportsAbortingDeactivation
{
  return 1;
}

- (id)description
{
  UIDescriptionBuilder *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[UIDescriptionBuilder initWithObject:]([UIDescriptionBuilder alloc], "initWithObject:", self);
  NSStringFromSelector(sel_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", v4, self->_state);

  NSStringFromSelector(sel_numberOfClients);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  NSStringFromSelector(sel_prewarmCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  NSStringFromSelector(sel__internal_isSuspended);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIDescriptionBuilder appendKeys:](v3, "appendKeys:", v9, v13, v14);

  -[UIDescriptionBuilder string](v3, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3[2](v3, 1);
}

- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3[2](v3, 1);
}

- (void)_stopWarmingFeedbacks:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43___UIFeedbackEngine__stopWarmingFeedbacks___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v4;
  v6 = v5;
  if (!v5)
  {
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

- (void)_internal_stopWarmingFeedbacks:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

}

- (void)_cooldown
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30___UIFeedbackEngine__cooldown__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }
  v6 = v3;
  dispatch_async(v4, block);

}

- (void)_internal_cooldown
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  int64_t prewarmCount;
  int64_t v11;
  int64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _internal_cooldown___s_category;
    if (!_internal_cooldown___s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_internal_cooldown___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      prewarmCount = v7->_prewarmCount;
      *(_DWORD *)buf = 138412802;
      v18 = v9;
      v19 = 2048;
      v20 = prewarmCount;
      v21 = 2048;
      v22 = prewarmCount - 1;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "cooldown engine %@, prewarmCount: %ld -> %ld", buf, 0x20u);

    }
  }
  v11 = self->_prewarmCount;
  if (v11 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFeedbackEngine.m"), 801, CFSTR("ERROR: -[%@ %@] called more times than the feedback engine was pre-warmed"), v15, v16);

    v11 = self->_prewarmCount;
  }
  v12 = v11 - 1;
  self->_prewarmCount = v12;
  if (!v12)
  {
    if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
    {
      if (self->_suspensionState == 2)
        self->_suspensionState = 0;
    }
    else
    {
      -[_UIFeedbackEngine _internal_cooldownEngineIfPossible](self, "_internal_cooldownEngineIfPossible");
    }
  }
}

- (void)_internal_cooldownEngineIfPossible
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIFeedbackEngine *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v3 = _internal_cooldownEngineIfPossible___s_category;
    if (!_internal_cooldownEngineIfPossible___s_category)
    {
      v3 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_internal_cooldownEngineIfPossible___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self;
      v7 = v4;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v6), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "_internal_cooldownEngineIfPossible %@", buf, 0xCu);

    }
  }
  if (-[_UIFeedbackEngine _state](self, "_state") == 1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke;
    v10[3] = &unk_1E16B3FD8;
    v10[4] = self;
    -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 2, v10);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke_2;
    v9[3] = &unk_1E16B3FD8;
    v9[4] = self;
    -[_UIFeedbackEngine _internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:](self, "_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:", v9);
  }
}

- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3[2](v3, 1);
}

- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3[2](v3, 1);
}

- (void)_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E16B1D18;
  v10[4] = self;
  v11 = v4;
  v6 = v5;
  if (!v5)
  {
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v3[2](v3, 0);
}

- (void)_internal_willCancelFeedback:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_906, (uint64_t)CFSTR("EnableFeedbackVisualization")) & 1) == 0
    && byte_1ECD761B4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___UIFeedbackEngine__internal_willCancelFeedback___block_invoke;
    block[3] = &unk_1E16B1B28;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_sb_stuckInNonInactiveState
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[16];

  if (self->_state)
  {
    dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, &__block_literal_global_93_0);

  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v2 = _sb_stuckInNonInactiveState___s_category;
    if (!_sb_stuckInNonInactiveState___s_category)
    {
      v2 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_sb_stuckInNonInactiveState___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Springboard ultimately returned to inactive state. Not reporting.", buf, 2u);
    }
  }
}

- (void)runWhenReady:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34___UIFeedbackEngine_runWhenReady___block_invoke;
  v6[3] = &unk_1E16C5E00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_UIFeedbackEngine _activate:andPerformWhenRunning:](self, "_activate:andPerformWhenRunning:", 1, v6);

}

- (void)_applicationWillResignActive:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackEngine *v8;
  NSObject *v9;
  void *v10;
  NSTimer *v11;
  NSTimer *suspensionTimer;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_UIFeedbackLoggingDisabled)
  {
    v5 = _applicationWillResignActive____s_category;
    if (!_applicationWillResignActive____s_category)
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_applicationWillResignActive____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "app will resign active for engine %@", buf, 0xCu);

    }
  }
  if (!self->_suspensionTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__suspendEngineNow, 0, 0, 1.0);
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = v11;

  }
}

- (void)_suspendEngineNow
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIFeedbackEngine *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v3 = _suspendEngineNow___s_category;
    if (!_suspendEngineNow___s_category)
    {
      v3 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_suspendEngineNow___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self;
      v7 = v4;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v6), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "_suspendEngineNow for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 1);
}

- (void)_applicationWillSuspend:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _applicationWillSuspend____s_category;
    if (!_applicationWillSuspend____s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_applicationWillSuspend____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "app will suspend for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 1);
}

- (void)_hostDidEnterBackground:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackEngine *v8;
  NSObject *v9;
  void *v10;
  NSTimer *v11;
  NSTimer *suspensionTimer;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_UIFeedbackLoggingDisabled)
  {
    v5 = _hostDidEnterBackground____s_category;
    if (!_hostDidEnterBackground____s_category)
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_hostDidEnterBackground____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "host did enter background for engine %@", buf, 0xCu);

    }
  }
  if (!self->_suspensionTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__suspendEngineNow, 0, 0, 1.0);
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = v11;

  }
}

- (void)_hostWillEnterForeground:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _hostWillEnterForeground____s_category;
    if (!_hostWillEnterForeground____s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_hostWillEnterForeground____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "host will enter foreground for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 0);
}

- (void)_remoteViewControllerWillDisconnect:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFeedbackEngine *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _remoteViewControllerWillDisconnect____s_category;
    if (!_remoteViewControllerWillDisconnect____s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_remoteViewControllerWillDisconnect____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "remote view controller will disconnect for engine %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackEngine _setSuspended:](self, "_setSuspended:", 0);
}

- (void)_internal_setupBackgroundTask
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  _UIFeedbackEngine *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!-[_UIFeedbackEngine _backgroundTaskIdentifier](self, "_backgroundTaskIdentifier"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Shutdown"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke;
    v14[3] = &unk_1E16B1B28;
    v14[4] = self;
    -[_UIFeedbackEngine _setBackgroundTaskIdentifier:](self, "_setBackgroundTaskIdentifier:", objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", v6, v14));
    if (!_UIFeedbackLoggingDisabled)
    {
      v7 = _internal_setupBackgroundTask___s_category;
      if (!_internal_setupBackgroundTask___s_category)
      {
        v7 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_internal_setupBackgroundTask___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = -[_UIFeedbackEngine _backgroundTaskIdentifier](self, "_backgroundTaskIdentifier");
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = self;
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v12), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 134218242;
        v16 = v10;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "began background task with ID %ld for engine %@", buf, 0x16u);

      }
    }

  }
}

- (NSString)_stats_key
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setPrewarmCount:(int64_t)a3
{
  self->_prewarmCount = a3;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMapTable)_playerDequeueBlocks
{
  return self->_playerDequeueBlocks;
}

- (void)_setPlayerDequeueBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_playerDequeueBlocks, a3);
}

- (void)_setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (int64_t)_suspensionState
{
  return self->_suspensionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerDequeueBlocks, 0);
  objc_storeStrong((id *)&self->_springBoardTimer, 0);
  objc_storeStrong((id *)&self->_suspensionTimer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end
