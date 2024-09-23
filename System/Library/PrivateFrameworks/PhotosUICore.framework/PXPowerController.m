@implementation PXPowerController

- (PXPowerController)init
{
  PXPowerController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assertionReasonsByIdentifier;
  BKSProcessAssertion *backgroundProcessAssertion;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *powerControllerQueue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPowerController;
  v2 = -[PXPowerController init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionReasonsByIdentifier = v2->_assertionReasonsByIdentifier;
    v2->_assertionReasonsByIdentifier = v3;

    backgroundProcessAssertion = v2->_backgroundProcessAssertion;
    v2->_backgroundProcessAssertion = 0;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.photos.power-controller.assertions", v6);
    powerControllerQueue = v2->_powerControllerQueue;
    v2->_powerControllerQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4868], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXPowerController;
  -[PXPowerController dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXPowerController assertionReasonsByIdentifier](self, "assertionReasonsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        NSStringFromPXPowerAssertionReasonBitfield(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@ backgroundProcessAssertion:%@ assertions:%@>"), v15, v16, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unsigned)generateAssertionIdentifier
{
  unsigned int *p_assertionIdentifierGenerator;
  unsigned int v3;
  unsigned int result;

  p_assertionIdentifierGenerator = &self->_assertionIdentifierGenerator;
  do
  {
    v3 = __ldaxr(p_assertionIdentifierGenerator);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, p_assertionIdentifierGenerator));
  return result;
}

- (void)addPowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[PXPowerController powerControllerQueue](self, "powerControllerQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  pl_dispatch_async();

}

- (void)removePowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[PXPowerController powerControllerQueue](self, "powerControllerQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  pl_dispatch_async();

}

- (void)takePowerAssertionIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "-[PXPowerController takePowerAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[PXPowerController assertionReasonsByIdentifier](self, "assertionReasonsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[PXPowerController hasPowerAssertion](self, "hasPowerAssertion");
  v7 = v6;
  if (!v5 || v6)
  {
    _powerControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v7)
        v9 = CFSTR("YES");
      v10 = v9;
      v11 = 134349314;
      v12 = (const char *)v5;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "Not taking power assertion because either: numActiveAssertionIdentifiers=%{public}ld, or already has power assertion: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    -[PXPowerController takePowerAssertion](self, "takePowerAssertion");
    -[PXPowerController acquireBackgroundAssertionIfNeeded](self, "acquireBackgroundAssertionIfNeeded");
  }
}

- (void)releasePowerAssertionIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "-[PXPowerController releasePowerAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[PXPowerController assertionReasonsByIdentifier](self, "assertionReasonsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[PXPowerController hasPowerAssertion](self, "hasPowerAssertion");
  v7 = v6;
  if (v5 || !v6)
  {
    _powerControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("YES");
      if (v7)
        v9 = CFSTR("NO");
      v10 = v9;
      v11 = 134349314;
      v12 = (const char *)v5;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "Not releasing power assertion because either: numActiveAssertionIdentifiers=%{public}ld, or power assert doesn't exist: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    -[PXPowerController releasePowerAssertion](self, "releasePowerAssertion");
    -[PXPowerController invalidateBackgroundAssertionIfNeeded](self, "invalidateBackgroundAssertionIfNeeded");
  }
}

- (void)takePowerAssertion
{
  NSObject *v3;
  uint8_t buf[16];

  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "⚡️✅ Taking power assertion", buf, 2u);
  }

  if (IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("Photos Import/Export activity"), CFSTR("com.apple.Photos.importExport"), CFSTR("Ensure user-initiated import or export activity does not get interrupted."), 0, 3600.0, CFSTR("TimeoutActionTurnOff"), &self->_assertionID))
  {
    _PFAssertContinueHandler();
  }
  -[PXPowerController setPowerAssertionStartTime:](self, "setPowerAssertionStartTime:", CFAbsoluteTimeGetCurrent());
}

- (void)releasePowerAssertion
{
  NSObject *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[16];

  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "⚡️❌ Releasing power assertion", buf, 2u);
  }

  -[PXPowerController powerAssertionStartTime](self, "powerAssertionStartTime");
  if (v4 != 0.0)
  {
    v5 = IOPMAssertionRelease(self->_assertionID);
    if ((_DWORD)v5)
    {
      v6 = v5;
      _PFAssertContinueHandler();
    }
    -[PXPowerController setPowerAssertionStartTime:](self, "setPowerAssertionStartTime:", 0.0, v6);
  }
}

- (BOOL)hasPowerAssertion
{
  double v2;

  -[PXPowerController powerAssertionStartTime](self, "powerAssertionStartTime");
  return v2 != 0.0;
}

- (void)handleEnteringForeground
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXPowerController handleEnteringForeground]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[PXPowerController powerControllerQueue](self, "powerControllerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_sync();

}

- (void)handleEnteringBackground
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXPowerController handleEnteringBackground]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[PXPowerController powerControllerQueue](self, "powerControllerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_sync();

}

- (void)invalidateBackgroundAssertionIfNeeded
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[PXPowerController invalidateBackgroundAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  v4 = -[PXPowerController hasPowerAssertion](self, "hasPowerAssertion");
  v5 = -[PXPowerController isBackgrounded](self, "isBackgrounded");
  v6 = -[PXPowerController hasBackgroundAssertion](self, "hasBackgroundAssertion");
  if (!v6 || v4 && v5)
  {
    _powerControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (v4)
        v8 = CFSTR("NO");
      else
        v8 = CFSTR("YES");
      v9 = v8;
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = v10;
      v12 = v9;
      v13 = 138543618;
      v14 = (const char *)v9;
      v15 = 2114;
      v16 = v11;
      _os_log_debug_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "No background assertion to invalidate because either we don't have a power assertion: %{public}@, or background assertion already exists: %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    -[PXPowerController invalidateBackgroundAssertion](self, "invalidateBackgroundAssertion");
  }
}

- (void)acquireBackgroundAssertionIfNeeded
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "-[PXPowerController acquireBackgroundAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v17, 0xCu);
  }

  v4 = -[PXPowerController hasPowerAssertion](self, "hasPowerAssertion");
  v5 = -[PXPowerController isBackgrounded](self, "isBackgrounded");
  v6 = -[PXPowerController hasBackgroundAssertion](self, "hasBackgroundAssertion");
  v7 = v6;
  if (v5 && v4 && !v6)
  {
    -[PXPowerController acquireBackgroundAssertion](self, "acquireBackgroundAssertion");
  }
  else
  {
    _powerControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
        v9 = CFSTR("NO");
      else
        v9 = CFSTR("YES");
      v10 = v9;
      if (v4)
        v11 = CFSTR("NO");
      else
        v11 = CFSTR("YES");
      v12 = v11;
      v13 = v10;
      if (v7)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      v16 = v12;
      v17 = 138543874;
      v18 = (const char *)v10;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v15;
      _os_log_debug_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "Not creating background assertion because either we are not backgrounded: %{public}@, or we don't have a power assertion: %{public}@, or background assertion is already active: %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }
}

- (void)invalidateBackgroundAssertion
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "📴❌ Invalidating background assertion: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PXPowerController setBackgroundProcessAssertion:](self, "setBackgroundProcessAssertion:", 0);
}

- (void)acquireBackgroundAssertion
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "📴✅ Acquiring background assertion", buf, 2u);
  }

  -[PXPowerController assertionReasonsByIdentifier](self, "assertionReasonsByIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)location = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", location, buf, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        v10 = *((_QWORD *)location[1] + i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromPXPowerAssertionReasonBitfield(objc_msgSend(v11, "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", location, buf, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v14 = objc_alloc(MEMORY[0x1E0CFE308]);
  v15 = getpid();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __47__PXPowerController_acquireBackgroundAssertion__block_invoke;
  v25[3] = &unk_1E5147388;
  objc_copyWeak(&v27, location);
  v17 = v5;
  v26 = v17;
  v18 = (void *)objc_msgSend(v14, "initWithPID:flags:reason:name:withHandler:", v15, 1, 10004, v13, v25);
  -[PXPowerController setBackgroundProcessAssertion:](self, "setBackgroundProcessAssertion:", v18);

  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __47__PXPowerController_acquireBackgroundAssertion__block_invoke_33;
  v23[3] = &unk_1E5149198;
  v19 = v17;
  v24 = v19;
  -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v20, "setInvalidationHandler:", v23);

  -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = objc_msgSend(v21, "acquire");

  if ((v20 & 1) == 0)
  {
    _powerControllerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Unable to acquire background assertion for acive power assertions: %{public}@", buf, 0xCu);
    }

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

}

- (BOOL)hasBackgroundAssertion
{
  void *v2;
  char v3;

  -[PXPowerController backgroundProcessAssertion](self, "backgroundProcessAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "valid");

  return v3;
}

- (NSMutableDictionary)assertionReasonsByIdentifier
{
  return self->_assertionReasonsByIdentifier;
}

- (OS_dispatch_queue)powerControllerQueue
{
  return self->_powerControllerQueue;
}

- (BKSProcessAssertion)backgroundProcessAssertion
{
  return self->_backgroundProcessAssertion;
}

- (void)setBackgroundProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, a3);
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (double)powerAssertionStartTime
{
  return self->_powerAssertionStartTime;
}

- (void)setPowerAssertionStartTime:(double)a3
{
  self->_powerAssertionStartTime = a3;
}

- (BOOL)isBackgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, 0);
  objc_storeStrong((id *)&self->_powerControllerQueue, 0);
  objc_storeStrong((id *)&self->_assertionReasonsByIdentifier, 0);
}

void __47__PXPowerController_acquireBackgroundAssertion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "backgroundProcessAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_INFO, "Started background assertion: %@ for active assertions: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __47__PXPowerController_acquireBackgroundAssertion__block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _powerControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[PXPowerController acquireBackgroundAssertion]_block_invoke";
    v6 = 2114;
    v7 = v3;
    _os_log_error_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "%s: A background assertion was invalidated without finishing! Assertions active: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __45__PXPowerController_handleEnteringBackground__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgrounded:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "acquireBackgroundAssertionIfNeeded");
}

uint64_t __45__PXPowerController_handleEnteringForeground__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgrounded:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "invalidateBackgroundAssertionIfNeeded");
}

void __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  int v12;
  unsigned int v13;
  const __CFString *v14;
  int v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  const __CFString *v22;
  void *v23;
  const char *v24;
  _QWORD aBlock[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_2;
  aBlock[3] = &unk_1E5148A40;
  v26 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _powerControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_15;
    }
    v12 = *(_DWORD *)(a1 + 48);
    v13 = *(_DWORD *)(a1 + 52) - 2;
    if (v13 > 6)
      v14 = CFSTR("PXPowerAssertionReasonImportAssets");
    else
      v14 = off_1E511E208[v13];
    objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    v29 = 1024;
    *(_DWORD *)v30 = v12;
    *(_WORD *)&v30[4] = 2114;
    *(_QWORD *)&v30[6] = v14;
    v31 = 2114;
    v32 = v23;
    v24 = "%s: Power assertion %d not found, cannot remove reason %{public}@; existing assertion reasons: %{public}@";
LABEL_22:
    _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, v24, buf, 0x26u);

    goto LABEL_10;
  }
  v6 = objc_msgSend(v5, "intValue");
  v7 = *(_DWORD *)(a1 + 52) & v6;
  _powerControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v20 = *(_DWORD *)(a1 + 48);
    v21 = *(_DWORD *)(a1 + 52) - 2;
    if (v21 > 6)
      v22 = CFSTR("PXPowerAssertionReasonImportAssets");
    else
      v22 = off_1E511E208[v21];
    NSStringFromPXPowerAssertionReasonBitfield(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    v29 = 1024;
    *(_DWORD *)v30 = v20;
    *(_WORD *)&v30[4] = 2114;
    *(_QWORD *)&v30[6] = v22;
    v31 = 2114;
    v32 = v23;
    v24 = "%s: Power assertion %d was not asserted with reason %{public}@; existing assertion reasons: %{public}@";
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = *(_DWORD *)(a1 + 52) - 2;
    if (v10 > 6)
      v11 = CFSTR("PXPowerAssertionReasonImportAssets");
    else
      v11 = off_1E511E208[v10];
    v15 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    v29 = 2114;
    *(_QWORD *)v30 = v11;
    *(_WORD *)&v30[8] = 1026;
    *(_DWORD *)&v30[10] = v15;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "%s: Removing power assertion %{public}@ for identifier: %{public}d", buf, 0x1Cu);
  }

  v16 = v6 & ~*(_DWORD *)(a1 + 52);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v3);

  if (!v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v3);

    objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertionIfNeeded");
  }
LABEL_15:
  v2[2](v2);

}

void __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_3;
    block[3] = &unk_1E5148A40;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  const __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  int v16;
  _QWORD aBlock[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_2;
  aBlock[3] = &unk_1E5148A40;
  v18 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  LODWORD(v5) = *(_DWORD *)(a1 + 52) & v6;
  _powerControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_DWORD *)(a1 + 52) - 2;
      if (v14 > 6)
        v15 = CFSTR("PXPowerAssertionReasonImportAssets");
      else
        v15 = off_1E511E208[v14];
      v16 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v20 = "-[PXPowerController addPowerAssertionForIdentifier:withReason:completion:]_block_invoke";
      v21 = 2114;
      v22 = v15;
      v23 = 1024;
      v24 = v16;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%s: Power assertion %{public}@ already exists for identifier: %d", buf, 0x1Cu);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(_DWORD *)(a1 + 52) - 2;
      if (v9 > 6)
        v10 = CFSTR("PXPowerAssertionReasonImportAssets");
      else
        v10 = off_1E511E208[v9];
      v11 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v20 = "-[PXPowerController addPowerAssertionForIdentifier:withReason:completion:]_block_invoke";
      v21 = 2114;
      v22 = v10;
      v23 = 1026;
      v24 = v11;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "%s: Adding power assertion %{public}@ for identifier: %{public}d", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_DWORD *)(a1 + 52) | v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assertionReasonsByIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v3);

    objc_msgSend(*(id *)(a1 + 32), "takePowerAssertionIfNeeded");
  }
  v2[2](v2);

}

void __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_3;
    block[3] = &unk_1E5148A40;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (PXPowerController)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_3_55302);
  return (PXPowerController *)(id)sharedController_powerController;
}

void __37__PXPowerController_sharedController__block_invoke()
{
  PXPowerController *v0;
  void *v1;

  v0 = objc_alloc_init(PXPowerController);
  v1 = (void *)sharedController_powerController;
  sharedController_powerController = (uint64_t)v0;

}

@end
