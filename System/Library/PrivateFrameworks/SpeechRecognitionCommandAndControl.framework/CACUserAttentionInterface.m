@implementation CACUserAttentionInterface

+ (id)sharedManager
{
  if (sharedManager_sSingletonInit != -1)
    dispatch_once(&sharedManager_sSingletonInit, &__block_literal_global_33);
  return (id)sharedManager_sSharedCACUserAttentionInterface;
}

void __42__CACUserAttentionInterface_sharedManager__block_invoke()
{
  CACUserAttentionInterface *v0;
  void *v1;

  v0 = objc_alloc_init(CACUserAttentionInterface);
  v1 = (void *)sharedManager_sSharedCACUserAttentionInterface;
  sharedManager_sSharedCACUserAttentionInterface = (uint64_t)v0;

}

- (void)startUserAttentionControllerIfNeeded
{
  -[CACUserAttentionInterface startUserAttentionControllerIfNeededForTypes:](self, "startUserAttentionControllerIfNeededForTypes:", 7);
}

- (void)startUserAttentionControllerIfNeededForTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9[2];
  id buf[2];

  CACLogAttentionAware();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_229A40000, v5, OS_LOG_TYPE_INFO, "Starting Attention Aware Client ...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = (void *)MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC9B8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke;
  v8[3] = &unk_24F2ACE20;
  objc_copyWeak(v9, buf);
  v9[1] = (id)a3;
  CACGetDeviceSupportsUserAttentionDetection(v6, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(buf);
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  void *v8;
  CACUserAttentionController *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_userAttentionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = -[CACUserAttentionController initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:]([CACUserAttentionController alloc], "initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:", a2, a3, 2.0, 4.0);
      -[CACUserAttentionController setDelegate:](v9, "setDelegate:", v7);
      objc_msgSend(v7, "_setUserAttentionController:", v9);

    }
    objc_msgSend(v7, "_userAttentionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2;
    v13[3] = &unk_24F2AB760;
    v14 = v7;
    objc_msgSend(v10, "startIfNeededForTypes:completionQueue:completion:", v11, MEMORY[0x24BDAC9B8], v13);

    v12 = v14;
  }
  else
  {
    CACLogAttentionAware();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_cold_1(v12);
  }

}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    CACLogAttentionAware();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)stopUserAttentionControllerIfNeeded
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_0_5(&dword_229A40000, a3, (uint64_t)a3, "Failed to stop user attention controller: %{public}@, error: %{public}@", (uint8_t *)&v4);
}

- (void)stopUserAttentionControllerIfNeededAfterDelay:(double)a3
{
  -[CACUserAttentionInterface cancelDelayedUserAttentionControllerStop](self, "cancelDelayedUserAttentionControllerStop");
  -[CACUserAttentionInterface performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_stopUserAttentionControllerIfNeeded, 0, a3);
}

- (void)cancelDelayedUserAttentionControllerStop
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopUserAttentionControllerIfNeeded, 0);
}

- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CACLogAttentionAware();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_229A40000, v6, OS_LOG_TYPE_INFO, "Attention was lost with event=%zd", (uint8_t *)&v8, 0xCu);
  }

  if (-[CACUserAttentionInterface isAttentionAwarenessInterrupted](self, "isAttentionAwarenessInterrupted"))
  {
    CACLogAttentionAware();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_229A40000, v7, OS_LOG_TYPE_INFO, "Attention awareness was interrupted. Ignoring event.", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) > 1)
      return;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject attentionAwareLost](v7, "attentionAwareLost");
  }

}

- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CACLogAttentionAware();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_229A40000, v6, OS_LOG_TYPE_INFO, "Attention was gained with event=%zd", (uint8_t *)&v8, 0xCu);
  }

  if (-[CACUserAttentionInterface isAttentionAwarenessInterrupted](self, "isAttentionAwarenessInterrupted"))
  {
    CACLogAttentionAware();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_229A40000, v7, OS_LOG_TYPE_INFO, "Attention awareness was interrupted. Ignoring event.", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) > 3)
      return;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject attentionAwareGained](v7, "attentionAwareGained");
  }

}

- (void)userAttentionControllerAttentionAwarenessInterrupted:(id)a3
{
  void *v4;

  if (!-[CACUserAttentionInterface isAttentionAwarenessInterrupted](self, "isAttentionAwarenessInterrupted", a3))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attentionAwareInterrupted");

  }
  -[CACUserAttentionInterface setIsAttentionAwarenessInterrupted:](self, "setIsAttentionAwarenessInterrupted:", 1);
}

- (void)userAttentionControllerAttentionAwarenessInterruptionEnded:(id)a3
{
  void *v4;

  if (-[CACUserAttentionInterface isAttentionAwarenessInterrupted](self, "isAttentionAwarenessInterrupted", a3))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attentionAwareInterruptionEnded");

  }
  -[CACUserAttentionInterface setIsAttentionAwarenessInterrupted:](self, "setIsAttentionAwarenessInterrupted:", 0);
}

- (CACUserAttentionController)_userAttentionController
{
  return self->_userAttentionController;
}

- (void)_setUserAttentionController:(id)a3
{
  objc_storeStrong((id *)&self->_userAttentionController, a3);
}

- (BOOL)isAttentionAwarenessInterrupted
{
  return self->_isAttentionAwarenessInterrupted;
}

- (void)setIsAttentionAwarenessInterrupted:(BOOL)a3
{
  self->_isAttentionAwarenessInterrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAttentionController, 0);
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "Failed to start user attention controller as CACUserAttentionInterface was released", v1, 2u);
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_userAttentionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = a2;
  OUTLINED_FUNCTION_0_5(&dword_229A40000, a3, v6, "Failed to start user attention controller: %{public}@, error: %{public}@", (uint8_t *)&v7);

}

@end
