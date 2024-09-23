@implementation SBFShamMobileKeyBag

+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4
{
  _BOOL8 v4;
  id v5;
  SBFShamMobileKeyBag *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[SBFShamMobileKeyBag initWithRecoveryRequired:correctPasscode:]([SBFShamMobileKeyBag alloc], "initWithRecoveryRequired:correctPasscode:", v4, v5);

  return v6;
}

+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  SBFShamMobileKeyBag *v10;
  double v11;
  SBFShamMobileKeyBag *v12;

  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = [SBFShamMobileKeyBag alloc];
  *(float *)&v11 = a5;
  v12 = -[SBFShamMobileKeyBag initWithRecoveryRequired:recoveryPossible:timeScaleFactor:correctPasscode:](v10, "initWithRecoveryRequired:recoveryPossible:timeScaleFactor:correctPasscode:", v8, v7, v9, v11);

  return v12;
}

- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  return -[SBFShamMobileKeyBag initWithRecoveryRequired:recoveryPossible:timeScaleFactor:correctPasscode:](self, "initWithRecoveryRequired:recoveryPossible:timeScaleFactor:correctPasscode:", a3, 1, a4, v4);
}

- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  SBFShamMobileKeyBag *v11;
  SBFShamMobileKeyBag *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSData *queue_correctPasscode;
  SBFMutableMobileKeyBagState *v17;
  SBFMutableMobileKeyBagState *queue_state;
  objc_super v20;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBFShamMobileKeyBag;
  v11 = -[SBFShamMobileKeyBag init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_timeScaleFactor = a5;
    v13 = dispatch_queue_create("com.apple.springboardfoundation.shamkeybag", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v10, "copy");
    queue_correctPasscode = v12->_queue_correctPasscode;
    v12->_queue_correctPasscode = (NSData *)v15;

    v17 = objc_alloc_init(SBFMutableMobileKeyBagState);
    queue_state = v12->_queue_state;
    v12->_queue_state = v17;

    -[SBFMutableMobileKeyBagState setLockState:](v12->_queue_state, "setLockState:", 2);
    -[SBFMutableMobileKeyBagState setBackOffTime:](v12->_queue_state, "setBackOffTime:", 0.0);
    -[SBFMutableMobileKeyBagState setFailedAttemptCount:](v12->_queue_state, "setFailedAttemptCount:", 0);
    -[SBFMutableMobileKeyBagState setPermanentlyBlocked:](v12->_queue_state, "setPermanentlyBlocked:", 0);
    -[SBFMutableMobileKeyBagState setShouldWipe:](v12->_queue_state, "setShouldWipe:", 0);
    -[SBFMutableMobileKeyBagState setRecoveryEnabled:](v12->_queue_state, "setRecoveryEnabled:", 1);
    -[SBFMutableMobileKeyBagState setRecoveryRequired:](v12->_queue_state, "setRecoveryRequired:", v8);
    -[SBFMutableMobileKeyBagState setRecoveryPossible:](v12->_queue_state, "setRecoveryPossible:", v7);
    -[SBFMutableMobileKeyBagState setEscrowCount:](v12->_queue_state, "setEscrowCount:", 0);
  }

  return v12;
}

- (void)lock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SBFShamMobileKeyBag_lock__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__SBFShamMobileKeyBag_lock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLockState:", 2);
}

- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5
{
  -[SBFShamMobileKeyBag createStashBag:skipSEKeepUserDataOperation:completion:completionQueue:](self, "createStashBag:skipSEKeepUserDataOperation:completion:completionQueue:", a3, a4, a5, MEMORY[0x1E0C80D38]);
}

- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5 completionQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__SBFShamMobileKeyBag_createStashBag_skipSEKeepUserDataOperation_completion_completionQueue___block_invoke;
  v16[3] = &unk_1E200FA78;
  v16[4] = self;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(queue, v16);

}

void __93__SBFShamMobileKeyBag_createStashBag_skipSEKeepUserDataOperation_completion_completionQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lockState"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lockState");
      v6 = 134217984;
      v7 = v2;
      _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failing because state %ld is not unlocked", (uint8_t *)&v6, 0xCu);
    }
    v3 = *(void **)(a1 + 56);
    if (v3)
      dispatch_async(*(dispatch_queue_t *)(a1 + 40), v3);
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_18AB69000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failing because passcodes do not match", (uint8_t *)&v6, 2u);
    }
    v4 = *(void **)(a1 + 56);
    if (v4)
      dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
}

- (BOOL)beginRecovery:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SBFShamMobileKeyBag_beginRecovery_error___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

uint64_t __43__SBFShamMobileKeyBag_beginRecovery_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_initializeSecretChangeMachine:", *(_QWORD *)(a1 + 40));
}

- (void)waitForUnlockWithTimeout:(float)a3
{
  void *v5;
  uint64_t v6;

  -[SBFShamMobileKeyBag state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockState");

  if (v6)
    usleep((float)((float)(a3 * 1000000.0) / self->_timeScaleFactor));
}

- (id)state
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFShamMobileKeyBag extendedState](self, "extendedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setLockState:", -[SBFShamMobileKeyBag _simplifiedLockStateForLockState:](self, "_simplifiedLockStateForLockState:", objc_msgSend(v4, "lockState")));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)extendedState
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SBFShamMobileKeyBag_extendedState__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__SBFShamMobileKeyBag_extendedState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_stepSecretChangeMachine");
}

- (void)_queue_initializeSecretChangeMachine:(id)a3
{
  NSData *v4;
  NSData *queue_trialPasscode;

  self->_queue_escrowState = 1;
  v4 = (NSData *)objc_msgSend(a3, "copy");
  queue_trialPasscode = self->_queue_trialPasscode;
  self->_queue_trialPasscode = v4;

  self->_queue_escrowCountTotal = 1000000.0;
  self->_queue_escrowCountDelta = self->_timeScaleFactor * 1667.0;
  -[SBFMutableMobileKeyBagState setEscrowCount:](self->_queue_state, "setEscrowCount:", 1000000);
}

- (void)_queue_stepSecretChangeMachine
{
  float v3;
  unint64_t v4;

  if (self->_queue_escrowState == 1)
  {
    v3 = self->_queue_escrowCountTotal - self->_queue_escrowCountDelta;
    self->_queue_escrowCountTotal = v3;
    if (v3 <= 0.0)
    {
      self->_queue_escrowCountTotal = 0.0;
      if (!-[SBFMobileKeyBagState permanentlyBlocked](self->_queue_state, "permanentlyBlocked")
        && -[SBFMobileKeyBagState recoveryPossible](self->_queue_state, "recoveryPossible")
        && -[NSData isEqualToData:](self->_queue_trialPasscode, "isEqualToData:", self->_queue_correctPasscode))
      {
        -[SBFMutableMobileKeyBagState setLockState:](self->_queue_state, "setLockState:", 0);
        -[SBFMutableMobileKeyBagState setBackOffTime:](self->_queue_state, "setBackOffTime:", 0.0);
        -[SBFMutableMobileKeyBagState setFailedAttemptCount:](self->_queue_state, "setFailedAttemptCount:", 0);
        -[SBFMutableMobileKeyBagState setShouldWipe:](self->_queue_state, "setShouldWipe:", 0);
        -[SBFMutableMobileKeyBagState setRecoveryRequired:](self->_queue_state, "setRecoveryRequired:", 0);
        v4 = 2;
      }
      else
      {
        if (!-[SBFMobileKeyBagState permanentlyBlocked](self->_queue_state, "permanentlyBlocked")
          && -[SBFMobileKeyBagState recoveryPossible](self->_queue_state, "recoveryPossible"))
        {
          -[SBFMutableMobileKeyBagState setFailedAttemptCount:](self->_queue_state, "setFailedAttemptCount:", -[SBFMobileKeyBagState failedAttemptCount](self->_queue_state, "failedAttemptCount") + 1);
          if (-[SBFMobileKeyBagState failedAttemptCount](self->_queue_state, "failedAttemptCount") >= 5)
            -[SBFMutableMobileKeyBagState setRecoveryPossible:](self->_queue_state, "setRecoveryPossible:", 0);
        }
        v4 = 3;
      }
      self->_queue_escrowState = v4;
    }
    -[SBFMutableMobileKeyBagState setEscrowCount:](self->_queue_state, "setEscrowCount:", (uint64_t)self->_queue_escrowCountTotal);
  }
}

- (int64_t)_simplifiedLockStateForLockState:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)(a3 - 4) <= 3)
    return qword_18AC179B0[a3 - 4];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_trialPasscode, 0);
  objc_storeStrong((id *)&self->_queue_state, 0);
  objc_storeStrong((id *)&self->_queue_correctPasscode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
