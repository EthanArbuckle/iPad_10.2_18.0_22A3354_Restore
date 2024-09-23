@implementation SBAttentionAwarenessClient

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBAttentionAwarenessClient_setConfiguration_shouldReset___block_invoke;
  block[3] = &unk_1E8E9EE00;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)setConfiguration:(id)a3
{
  -[SBAttentionAwarenessClient setConfiguration:shouldReset:](self, "setConfiguration:shouldReset:", a3, 0);
}

- (SBAttentionAwarenessClient)init
{
  id v2;
  id v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBAttentionAwarenessClient;
  v2 = -[SBAttentionAwarenessClient init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CFEC00]);
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    v5 = dispatch_queue_create("com.apple.springboard.AttentionAwareQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v7 = (void *)*((_QWORD *)v2 + 4);
    v8 = *((_QWORD *)v2 + 5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__SBAttentionAwarenessClient_init__block_invoke;
    v10[3] = &unk_1E8EA36F8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "setEventHandlerWithQueue:block:", v8, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return (SBAttentionAwarenessClient *)v2;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

uint64_t __59__SBAttentionAwarenessClient_setConfiguration_shouldReset___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_atomic_copy(v2, v3, v4, 48);

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setConfiguration:shouldReset:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __34__SBAttentionAwarenessClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SBAttentionAwarenessClient_init__block_invoke_2;
  v5[3] = &unk_1E8E9F280;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __34__SBAttentionAwarenessClient_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAttentionAwarenessEvent:", *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBAttentionAwarenessClient_invalidate__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __40__SBAttentionAwarenessClient_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "attention client INVALIDATE %{public}@", buf, 0xCu);
  }

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "invalidateWithError:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__SBAttentionAwarenessClient_invalidate__block_invoke_cold_1();

  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
      -[SBAttentionAwarenessClient _resume](self, "_resume");
    else
      -[SBAttentionAwarenessClient _suspend](self, "_suspend");
  }
}

- (AWAttentionAwarenessConfiguration)configuration
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__78;
  v10 = __Block_byref_object_dispose__78;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBAttentionAwarenessClient_configuration__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

void __43__SBAttentionAwarenessClient_configuration__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setIdentifier:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 48);
}

- (void)_resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBAttentionAwarenessClient__resume__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__SBAttentionAwarenessClient__resume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "attention client RESUME %{public}@", buf, 0xCu);
  }

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "resumeWithError:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __37__SBAttentionAwarenessClient__resume__block_invoke_cold_1();

  }
}

- (void)_suspend
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBAttentionAwarenessClient__suspend__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__SBAttentionAwarenessClient__suspend__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "attention client SUSPEND %{public}@", buf, 0xCu);
  }

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "suspendWithError:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __38__SBAttentionAwarenessClient__suspend__block_invoke_cold_1();

  }
}

- (void)_resetAttentionLostTimeout
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "attention client RESET %{public}@", buf, 0xCu);
  }

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "resetAttentionLostTimeoutWithError:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke_cold_1();

  }
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(v4, "eventMask") & 1) != 0)
  {
    v7 = objc_opt_class();
    v8 = v4;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (v10)
    {
      objc_msgSend(v10, "attentionLostTimeout");
      v12 = v11;
      objc_msgSend(v10, "tag");
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
      v17 = v16;

      if (v17)
      {
        v18 = -[NSObject unsignedIntegerValue](v17, "unsignedIntegerValue");
      }
      else
      {
        SBLogIdleTimer();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.3(v10, v19);

        v18 = 0;
      }
      objc_msgSend(v10, "associatedObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:", self, v18, v20, v12);

    }
    else
    {
      SBLogIdleTimer();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.2();
    }

  }
  else
  {
    SBLogIdleTimer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.1();

    objc_msgSend(WeakRetained, "clientDidResetForUserAttention:withEvent:", self, v4);
  }

}

- (id)identifier
{
  if (result)
    return objc_getProperty(result, a2, 48, 1);
  return result;
}

- (SBAttentionAwarenessClientDelegate)delegate
{
  return (SBAttentionAwarenessClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

void __40__SBAttentionAwarenessClient_invalidate__block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend((id)OUTLINED_FUNCTION_3_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "attention client %{public}@ cannot invalidate; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_20();
}

void __37__SBAttentionAwarenessClient__resume__block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend((id)OUTLINED_FUNCTION_3_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "attention client %{public}@ cannot resume; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_20();
}

void __38__SBAttentionAwarenessClient__suspend__block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend((id)OUTLINED_FUNCTION_3_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "attention client %{public}@ cannot suspend; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_20();
}

void __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend((id)OUTLINED_FUNCTION_3_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "attention client %{public}@ cannot reset; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_20();
}

- (void)_handleAttentionAwarenessEvent:.cold.1()
{
  NSObject *v0;
  id v1;
  const char *v2;
  id v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_20_0();
  v5 = *MEMORY[0x1E0C80C00];
  if (v1)
    v1 = OUTLINED_FUNCTION_7_3(v1, v2);
  v3 = OUTLINED_FUNCTION_5_7(v1);
  _os_log_debug_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEBUG, "attention event [%{public}@]: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleAttentionAwarenessEvent:.cold.2()
{
  id v0;
  const char *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20_0();
  if (v0)
    v0 = OUTLINED_FUNCTION_7_3(v0, v1);
  v2 = OUTLINED_FUNCTION_5_7(v0);
  OUTLINED_FUNCTION_15(&dword_1D0540000, v3, v4, "attention event [%{public}@]: expected AWAttentionLostEvent instead of %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleAttentionAwarenessEvent:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "attention client lost event tag is not a number: %{public}@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

@end
