@implementation SUCorePower

+ (id)sharedPowerManager
{
  if (sharedPowerManager_powerManagerOnce != -1)
    dispatch_once(&sharedPowerManager_powerManagerOnce, &__block_literal_global_6);
  return (id)sharedPowerManager_powerManager;
}

void __33__SUCorePower_sharedPowerManager__block_invoke()
{
  SUCorePower *v0;
  void *v1;

  v0 = objc_alloc_init(SUCorePower);
  v1 = (void *)sharedPowerManager_powerManager;
  sharedPowerManager_powerManager = (uint64_t)v0;

}

- (SUCorePower)init
{
  SUCorePower *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *assertionQueue;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *activePowerAssertions;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SUCorePower;
  v2 = -[SUCorePower init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%@"), v5, CFSTR("core.power.assertion"));

    v7 = objc_retainAutorelease(v6);
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    assertionQueue = v2->_assertionQueue;
    v2->_assertionQueue = (OS_dispatch_queue *)v10;

    if (v2->_assertionQueue)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v7;
        _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POWER_ASSERTION] DISPATCH: created dispatch queue domain(%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create dispatch queue domain(%@)"), v7);
      -[NSObject trackError:forReason:withResult:withError:](v13, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v14, 8100, 0);

    }
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activePowerAssertions = v2->_activePowerAssertions;
    v2->_activePowerAssertions = v15;

  }
  return v2;
}

+ (void)setPowerAssertion:(BOOL)a3 forIdentifierDomain:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  BOOL v17;

  v4 = a3;
  v13 = a4;
  +[SUCorePower sharedPowerManager](SUCorePower, "sharedPowerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedSUCoreDomainAppending:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v7);

    objc_msgSend(v5, "assertionQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke;
    block[3] = &unk_1EA879668;
    v17 = v4;
    v15 = v5;
    v16 = v6;
    v9 = v6;
    dispatch_sync(v8, block);

    v10 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = CFSTR("disable");
    if (v4)
      v12 = CFSTR("enable");
    v10 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("no shared power manager - unable to %@ power assertion for domain(%@)"), v12, v13);
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v10, 8101, 0);
  }

}

uint64_t __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    return +[SUCorePower _enablePowerAssertion:forAppendedDomain:](SUCorePower, "_enablePowerAssertion:forAppendedDomain:", v1, v2);
  else
    return +[SUCorePower _disablePowerAssertion:forAppendedDomain:](SUCorePower, "_disablePowerAssertion:forAppendedDomain:", v1, v2);
}

+ (int)getPowerAssertionCountForIdentifierDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v3 = a3;
  +[SUCorePower sharedPowerManager](SUCorePower, "sharedPowerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedSUCoreDomainAppending:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    objc_msgSend(v4, "assertionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke;
    block[3] = &unk_1EA878C48;
    v13 = v4;
    v14 = v5;
    v15 = &v16;
    v8 = v5;
    dispatch_sync(v7, block);

    v9 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no shared power manager - unable to get power assertion count for domain(%@)"), v3);
    objc_msgSend(v8, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v9, 8101, 0);
  }

  v10 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activePowerAssertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofClass:", *(_QWORD *)(a1 + 40), objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "activeAssertionCount");
    v3 = v4;
  }

}

+ (void)_enablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  SUCorePowerAssertion *v13;
  IOReturn v14;
  IOReturn v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "assertionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "activePowerAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeObjectForKey:ofClass:", v6, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v13 = objc_alloc_init(SUCorePowerAssertion);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create SUCorePowerAssertion object for domain(%@)"), v6);
      objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v11, 8100, 0);
      goto LABEL_11;
    }
    v9 = v13;
    AssertionID = -1;
    v14 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, v6, &AssertionID);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v11 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create IOKit Power Assertion for domain(%@)"), v6);
      -[NSObject trackError:forReason:withResult:withError:](v11, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v16, v15, 0);

      goto LABEL_11;
    }
    objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
    objc_msgSend(v9, "setAssertionID:", AssertionID);
    objc_msgSend(v5, "activePowerAssertions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSafeObject:forKey:", v9, v6);

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v19 = objc_msgSend(v9, "activeAssertionCount");
    *(_DWORD *)buf = 67109378;
    v22 = v19;
    v23 = 2114;
    v24 = v6;
    v12 = "[POWER_ASSERTION] ENABLED(count=%d) for domain(%{public}@)";
    goto LABEL_4;
  }
  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v22 = objc_msgSend(v9, "activeAssertionCount");
    v23 = 2114;
    v24 = v6;
    v12 = "[POWER_ASSERTION] INCREASED(count=%d) for domain(%{public}@)";
LABEL_4:
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
  }
LABEL_11:

}

+ (void)_disablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  IOReturn v14;
  IOReturn v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "assertionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "activePowerAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeObjectForKey:ofClass:", v6, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("disabling power assertion when no assertion is active for domain(%@)"), v6);
    -[NSObject trackError:forReason:withResult:withError:](v11, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v13, 8101, 0);

    goto LABEL_7;
  }
  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") - 1);
  if ((int)objc_msgSend(v9, "activeAssertionCount") <= 0)
  {
    v14 = IOPMAssertionRelease(objc_msgSend(v9, "assertionID"));
    if (v14)
    {
      v15 = v14;
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to release IOKit Power Assertion for domain(%@)"), v6);
      objc_msgSend(v16, "trackError:forReason:withResult:withError:", CFSTR("[POWER_ASSERTION]"), v17, v15, 0);

      goto LABEL_8;
    }
    objc_msgSend(v5, "activePowerAssertions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v6);

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v21 = objc_msgSend(v9, "activeAssertionCount");
      v22 = 2114;
      v23 = v6;
      v12 = "[POWER_ASSERTION] DISABLED(count=%d) for domain(%{public}@)";
      goto LABEL_5;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v21 = objc_msgSend(v9, "activeAssertionCount");
      v22 = 2114;
      v23 = v6;
      v12 = "[POWER_ASSERTION] DECREASED(count=%d) for domain(%{public}@)";
LABEL_5:
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
    }
  }
LABEL_7:

LABEL_8:
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (NSMutableDictionary)activePowerAssertions
{
  return self->_activePowerAssertions;
}

- (void)setActivePowerAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_activePowerAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePowerAssertions, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
}

@end
