@implementation SBAttentionAwarenessStreamerClient

- (SBAttentionAwarenessStreamerClient)init
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBAttentionAwarenessStreamerClient;
  v2 = -[SBAttentionAwarenessStreamerClient init](&v15, sel_init);
  if (v2)
  {
    +[SBScreenLongevityDomain rootSettings](SBScreenLongevityDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0CFEC00]);
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    v7 = dispatch_queue_create("com.apple.springboard.AttentionAwareStreamerQueue", 0);
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v9 = (void *)*((_QWORD *)v2 + 4);
    v10 = *((_QWORD *)v2 + 5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__SBAttentionAwarenessStreamerClient_init__block_invoke;
    v12[3] = &unk_1E8EA36F8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "setEventStreamerWithQueue:block:", v10, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (SBAttentionAwarenessStreamerClient *)v2;
}

void __42__SBAttentionAwarenessStreamerClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBAttentionAwarenessStreamerClient_init__block_invoke_2;
  v5[3] = &unk_1E8E9F280;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __42__SBAttentionAwarenessStreamerClient_init__block_invoke_2(uint64_t a1)
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
  block[2] = __48__SBAttentionAwarenessStreamerClient_invalidate__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __48__SBAttentionAwarenessStreamerClient_invalidate__block_invoke(uint64_t a1)
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
  v5[2] = __51__SBAttentionAwarenessStreamerClient_configuration__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

void __51__SBAttentionAwarenessStreamerClient_configuration__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setConfiguration:(id)a3
{
  -[SBAttentionAwarenessStreamerClient setConfiguration:shouldReset:](self, "setConfiguration:shouldReset:", a3, 0);
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
  block[2] = __67__SBAttentionAwarenessStreamerClient_setConfiguration_shouldReset___block_invoke;
  block[3] = &unk_1E8E9EE00;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

uint64_t __67__SBAttentionAwarenessStreamerClient_setConfiguration_shouldReset___block_invoke(uint64_t a1)
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

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBAttentionAwarenessStreamerClient_resume__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__SBAttentionAwarenessStreamerClient_resume__block_invoke(uint64_t a1)
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

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "eventMask") & 0x80) != 0)
  {
    v4 = objc_opt_class();
    v5 = v16;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "attentionScore");
      v9 = v8;
      objc_msgSend(v7, "faceDetectionScore");
      v11 = v10;
      if (SBFIsIRDCResetAvailable())
      {
        -[SBScreenLongevitySettings attentionScoreThreshold](self->_settings, "attentionScoreThreshold");
        if (v12 >= v9)
          CARenderServerFlushIRDC();
      }
      -[SBScreenLongevitySettings faceDetectionScoreThreshold](self->_settings, "faceDetectionScoreThreshold");
      if (v13 <= v11)
      {
        -[SBScreenLongevitySettings attentionScoreThreshold](self->_settings, "attentionScoreThreshold");
        if (v14 <= v9)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "streamerClientDidResetForUserAttention:", self);

        }
      }
    }

  }
}

- (SBAttentionAwarenessStreamerClientDelegate)delegate
{
  return (SBAttentionAwarenessStreamerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

@end
