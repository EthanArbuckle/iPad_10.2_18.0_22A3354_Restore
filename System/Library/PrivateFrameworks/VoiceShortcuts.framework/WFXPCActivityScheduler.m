@implementation WFXPCActivityScheduler

- (WFXPCActivityScheduler)initWithActivityIdentifier:(id)a3
{
  id v5;
  WFXPCActivityScheduler *v6;
  WFXPCActivityScheduler *v7;
  uint64_t v8;
  NSString *activityIdentifier;
  WFXPCActivityScheduler *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFXPCActivityScheduler.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityIdentifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFXPCActivityScheduler;
  v6 = -[WFXPCActivityScheduler init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(v5, "copy");
    activityIdentifier = v7->_activityIdentifier;
    v7->_activityIdentifier = (NSString *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[WFXPCActivityScheduler removeEligibilityChangedHandlerIfNeeded](self, "removeEligibilityChangedHandlerIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)WFXPCActivityScheduler;
  -[WFXPCActivityScheduler dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  -[WFXPCActivityScheduler removeEligibilityChangedHandlerIfNeeded](self, "removeEligibilityChangedHandlerIfNeeded");
  -[WFXPCActivityScheduler activityIdentifier](self, "activityIdentifier");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v3, "UTF8String"));

}

- (void)scheduleWithCheckInHandler:(id)a3 runHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WFXPCActivityScheduler *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[WFXPCActivityScheduler activityIdentifier](self, "activityIdentifier");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = (void *)*MEMORY[0x1E0C80748];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke;
  v14[3] = &unk_1E7AA7E48;
  v15 = v8;
  v16 = self;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  xpc_activity_register(v9, v10, v14);

}

- (void)scheduleWithRunHandler:(id)a3
{
  -[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:](self, "scheduleWithCheckInHandler:runHandler:", 0, a3);
}

- (void)addEligibilityChangedHandler:(id)a3 toActivity:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__WFXPCActivityScheduler_addEligibilityChangedHandler_toActivity___block_invoke;
  aBlock[3] = &unk_1E7AA8300;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFXPCActivityScheduler activityIdentifier](self, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFXPCActivityScheduler lock_eligibilityChangedHandler](self, "lock_eligibilityChangedHandler"))
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFXPCActivityScheduler addEligibilityChangedHandler:toActivity:]";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_FAULT, "%s Eligibility changed handler already set for activity %@", buf, 0x16u);
    }

  }
  else
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFXPCActivityScheduler addEligibilityChangedHandler:toActivity:]";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_INFO, "%s Setting up eligibility changed handler for activity %@", buf, 0x16u);
    }

    -[WFXPCActivityScheduler setLock_eligibilityChangedHandler:](self, "setLock_eligibilityChangedHandler:", xpc_activity_add_eligibility_changed_handler());
  }

  v8[2](v8);
}

- (void)removeEligibilityChangedHandlerIfNeeded
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__WFXPCActivityScheduler_removeEligibilityChangedHandlerIfNeeded__block_invoke;
  aBlock[3] = &unk_1E7AA8300;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[WFXPCActivityScheduler lock_eligibilityChangedHandler](self, "lock_eligibilityChangedHandler"))
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[WFXPCActivityScheduler activityIdentifier](self, "activityIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFXPCActivityScheduler removeEligibilityChangedHandlerIfNeeded]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Removing eligibility changed handler for activity: %@", buf, 0x16u);

    }
    xpc_activity_remove_eligibility_changed_handler();
    -[WFXPCActivityScheduler setLock_eligibilityChangedHandler:](self, "setLock_eligibilityChangedHandler:", 0);
  }
  v4[2](v4);

}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (_xpc_activity_eligibility_changed_handler_s)lock_eligibilityChangedHandler
{
  return self->_lock_eligibilityChangedHandler;
}

- (void)setLock_eligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  self->_lock_eligibilityChangedHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

void __65__WFXPCActivityScheduler_removeEligibilityChangedHandlerIfNeeded__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __66__WFXPCActivityScheduler_addEligibilityChangedHandler_toActivity___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  void *(*v5)(uint64_t, uint64_t);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id location;
  _BYTE buf[24];
  void *(*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v5 = (void *(*)(uint64_t, uint64_t))state;
    if (!state)
    {
      getWFGeneralLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Checkin for XPC activity %@", buf, 0x16u);
      }

      v8 = *(_QWORD *)(a1 + 48);
      if (v8)
        (*(void (**)(uint64_t, _xpc_activity_s *))(v8 + 16))(v8, v3);
      goto LABEL_19;
    }
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      v25 = v5;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Unexpected state of %@ XPC activity: %ld", buf, 0x20u);
    }
LABEL_18:

    goto LABEL_19;
  }
  getWFGeneralLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s Starting to run XPC activity %@", buf, 0x16u);
  }

  if (!xpc_activity_set_state(v3, 4))
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "activityIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to set %@ XPC activity state to continue", buf, 0x16u);

    }
    goto LABEL_18;
  }
  objc_initWeak(&location, v3);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__6381;
  v26 = __Block_byref_object_dispose__6382;
  v11 = *(_QWORD *)(a1 + 56);
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_7;
  v20[3] = &unk_1E7AA7DF8;
  v20[4] = *(_QWORD *)(a1 + 40);
  v20[1] = 3221225472;
  objc_copyWeak(&v22, &location);
  v21 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _xpc_activity_s *, _QWORD *))(v11 + 16))(v11, v3, v20);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (xpc_activity_get_state(v3) != 5)
  {
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_9;
    v17[3] = &unk_1E7AA7E20;
    v13 = *(void **)(a1 + 40);
    v18 = *(id *)(a1 + 32);
    v19 = buf;
    objc_msgSend(v13, "addEligibilityChangedHandler:toActivity:", v17, v3);

  }
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_19:

}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_7(uint64_t a1)
{
  _xpc_activity_s *WeakRetained;
  _xpc_activity_s *v3;
  _BOOL4 should_defer;
  NSObject *v5;
  uint64_t v6;
  xpc_activity_state_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  xpc_activity_state_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeEligibilityChangedHandlerIfNeeded");
  WeakRetained = (_xpc_activity_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      v10 = "%s xpcActivity is nil in completion handler, the activity has likely been deferred";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 12;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  should_defer = xpc_activity_should_defer(WeakRetained);
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 136315650;
    v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
    v16 = 2112;
    v17 = v6;
    v18 = 1024;
    LODWORD(v19) = should_defer;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s XPC activity %@ finished, shouldDefer = %d", (uint8_t *)&v14, 0x1Cu);
  }

  if (should_defer)
    v7 = 3;
  else
    v7 = 5;
  if (!xpc_activity_set_state(v3, v7))
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 136315650;
      v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      v18 = 2048;
      v19 = v7;
      v10 = "%s Failed to set %@ XPC activity state to %ld";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_12:
      _os_log_impl(&dword_1C146A000, v11, v12, v10, (uint8_t *)&v14, v13);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_9(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s XPC activity %@ should defer", (uint8_t *)&v12, 0x16u);
    }

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      getWFGeneralLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v12 = 136315394;
        v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Calling should defer handler for XPC activity %@", (uint8_t *)&v12, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
    if (xpc_activity_get_state(v3) != 3 && !xpc_activity_set_state(v3, 3))
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = 136315394;
        v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set %@ XPC activity state to deferred", (uint8_t *)&v12, 0x16u);
      }

    }
  }

}

+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 checkInHandler:(id)a4 runHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActivityIdentifier:", v10);

  objc_msgSend(v11, "scheduleWithCheckInHandler:runHandler:", v9, v8);
  return v11;
}

+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 runHandler:(id)a4
{
  return (id)objc_msgSend(a1, "activatedSchedulerWithActivityIdentifier:checkInHandler:runHandler:", a3, 0, a4);
}

@end
