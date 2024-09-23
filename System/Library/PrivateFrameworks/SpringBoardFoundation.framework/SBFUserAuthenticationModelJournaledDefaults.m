@implementation SBFUserAuthenticationModelJournaledDefaults

- (SBFUserAuthenticationModelJournaledDefaults)init
{
  void *v3;
  SBSecurityDefaults *v4;
  void *v5;
  SBFUserAuthenticationModelJournaledDefaults *v6;

  objc_msgSend(CFSTR("~/Library/SpringBoard/LockoutStateJournal.plist"), "stringByExpandingTildeInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSecurityDefaults);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBFUserAuthenticationModelJournaledDefaults _initWithJournalPath:securityDefaults:profileConnection:](self, "_initWithJournalPath:securityDefaults:profileConnection:", v3, v4, v5);

  return v6;
}

- (id)_initWithJournalPath:(id)a3 securityDefaults:(id)a4 profileConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBFUserAuthenticationModelJournaledDefaults *v11;
  SBFUserAuthenticationModelJournaledDefaults *v12;
  uint64_t v13;
  NSString *journalPath;
  uint64_t Serial;
  OS_dispatch_queue *persistentStateQueue;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  SBFUserAuthenticationModelJournaledDefaults *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBFUserAuthenticationModelJournaledDefaults;
  v11 = -[SBFUserAuthenticationModelJournaledDefaults init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_securityDefaults, a4);
    objc_storeStrong((id *)&v12->_profileConnection, a5);
    v13 = objc_msgSend(v8, "copy");
    journalPath = v12->_journalPath;
    v12->_journalPath = (NSString *)v13;

    Serial = BSDispatchQueueCreateSerial();
    persistentStateQueue = v12->_persistentStateQueue;
    v12->_persistentStateQueue = (OS_dispatch_queue *)Serial;

    -[SBFUserAuthenticationModelJournaledDefaults _loadLockControllerDefaultsJournalIfNecessary](v12, "_loadLockControllerDefaultsJournalIfNecessary");
    v17 = v12->_persistentStateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SBFUserAuthenticationModelJournaledDefaults__initWithJournalPath_securityDefaults_profileConnection___block_invoke;
    block[3] = &unk_1E200E188;
    v27 = v12;
    dispatch_async(v17, block);
    SBLogAuthenticationModel();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SBFUserAuthenticationModelJournaledDefaults _initWithJournalPath:securityDefaults:profileConnection:].cold.1((uint64_t)&v12->_journalPath, v18, v19, v20, v21, v22, v23, v24);

  }
  return v12;
}

uint64_t __103__SBFUserAuthenticationModelJournaledDefaults__initWithJournalPath_securityDefaults_profileConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_loadLockState");
}

- (void)synchronize
{
  NSObject *v3;

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode synchronize].cold.1();

  -[BSAbstractDefaultDomain synchronizeDefaults](self->_securityDefaults, "synchronizeDefaults");
}

- (void)notePasscodeEntryBegan
{
  NSObject *v3;
  NSObject *persistentStateQueue;
  _QWORD block[5];

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryBegan].cold.1();

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryBegan__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __69__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryBegan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_beginSpeculativeFailureCharge");
}

- (void)notePasscodeEntryCancelled
{
  NSObject *v3;
  NSObject *persistentStateQueue;
  _QWORD block[5];

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryCancelled].cold.1();

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryCancelled__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __73__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_cancelSpeculativeFailureCharge");
}

- (void)notePasscodeUnlockSucceeded
{
  NSObject *v3;
  NSObject *persistentStateQueue;
  _QWORD block[5];

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockSucceeded].cold.1();

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockSucceeded__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
  -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self);
}

uint64_t __74__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockSucceeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockSucceeded");
}

- (void)notePasscodeUnlockFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *persistentStateQueue;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBFUserAuthenticationModelJournaledDefaults *v18;
  id v19;

  v4 = a3;
  SBLogAuthenticationModel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  persistentStateQueue = self->_persistentStateQueue;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockFailedWithError___block_invoke;
  v17 = &unk_1E200E2A0;
  v18 = self;
  v19 = v4;
  v13 = v4;
  dispatch_async(persistentStateQueue, &v14);
  -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self, v14, v15, v16, v17, v18);

}

uint64_t __81__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockFailedWithError:", *(_QWORD *)(a1 + 40));
}

- (void)performPasswordTest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *persistentStateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  SBLogAuthenticationModel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode performPasswordTest:].cold.1();

  persistentStateQueue = self->_persistentStateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SBFUserAuthenticationModelJournaledDefaults_performPasswordTest___block_invoke;
  v8[3] = &unk_1E200EA00;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(persistentStateQueue, v8);

}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults_performPasswordTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)clearBlockedState
{
  NSObject *v3;
  NSObject *persistentStateQueue;
  _QWORD block[5];

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelSEP clearBlockedState].cold.1();

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBFUserAuthenticationModelJournaledDefaults_clearBlockedState__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(persistentStateQueue, block);
  -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self);
}

uint64_t __64__SBFUserAuthenticationModelJournaledDefaults_clearBlockedState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_clearBlockedState");
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (SBFUserAuthenticationModelDelegate *)a3;
    -[SBFUserAuthenticationModelJournaledDefaults _evaluatePendingWipe](self, "_evaluatePendingWipe");
  }
}

- (BOOL)isPermanentlyBlocked
{
  NSObject *persistentStateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBFUserAuthenticationModelJournaledDefaults_isPermanentlyBlocked__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults_isPermanentlyBlocked__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 57);
  return result;
}

- (BOOL)isTemporarilyBlocked
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[SBFUserAuthenticationModelJournaledDefaults timeUntilUnblockedSinceReferenceDate](self, "timeUntilUnblockedSinceReferenceDate");
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  NSObject *persistentStateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__SBFUserAuthenticationModelJournaledDefaults_timeUntilUnblockedSinceReferenceDate__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __83__SBFUserAuthenticationModelJournaledDefaults_timeUntilUnblockedSinceReferenceDate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isUserRequestedEraseEnabled
{
  return 0;
}

- (void)_evaluatePendingWipe
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBFUserAuthenticationModelJournaledDefaults__evaluatePendingWipe__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults__evaluatePendingWipe__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_evaluatePendingWipe");
}

- (BOOL)_isDeviceWipePreferenceEnabled
{
  return -[SBSecurityDefaults isDeviceWipeEnabled](self->_securityDefaults, "isDeviceWipeEnabled");
}

- (void)_persistentStateQueue_beginSpeculativeFailureCharge
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  NSDictionary *v15;
  NSDictionary *originalDefaultsForRollback;
  void *v17;
  _QWORD v18[5];
  int v19;
  int v20;
  char v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 1;
    -[SBSecurityDefaults numberOfFailedPasscodeAttempts](self->_securityDefaults, "numberOfFailedPasscodeAttempts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    v6 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_profileConnection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FE8]);
    -[MCProfileConnection valueRestrictionForFeature:](self->_profileConnection, "valueRestrictionForFeature:", *MEMORY[0x1E0D470B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "intValue");
    else
      v9 = -1;
    if (v9 == -1 && v6 != 2)
    {
      if (-[SBFUserAuthenticationModelJournaledDefaults _isDeviceWipePreferenceEnabled](self, "_isDeviceWipePreferenceEnabled"))
      {
        v9 = 10;
      }
      else
      {
        v9 = -1;
      }
    }
    v10 = 0;
    v11 = v5 + 1;
    v12 = v9 < 0 || v11 < v9;
    v13 = !v12;
    if (v12)
    {
      v14 = v5 - 5;
      if (v5 >= 5)
      {
        if (v14 > 4)
          v10 = -1;
        else
          v10 = dword_18AC179D0[v14];
      }
    }
    if (self->_originalDefaultsForRollback)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFUserAuthenticationModelJournaledDefaults.m"), 214, CFSTR("We should not have rollback values when beginning a speculative failure charge, but we had %@"), self->_originalDefaultsForRollback);

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __98__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_beginSpeculativeFailureCharge__block_invoke;
    v18[3] = &unk_1E200FAA0;
    v18[4] = self;
    v19 = v11;
    v20 = v10;
    v21 = v13;
    -[SBFUserAuthenticationModelJournaledDefaults updateLockControllerDefaultsWithBlock:journaled:](self, "updateLockControllerDefaultsWithBlock:journaled:", v18, 1);
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    originalDefaultsForRollback = self->_originalDefaultsForRollback;
    self->_originalDefaultsForRollback = v15;

    -[BSAbstractDefaultDomain synchronizeDefaults](self->_securityDefaults, "synchronizeDefaults");
  }
}

void __98__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_beginSpeculativeFailureCharge__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumberOfFailedPasscodeAttempts:", v3);

  v4 = *(_DWORD *)(a1 + 44);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    if (v4 == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUnblockTimeFromReferenceDate:", v8);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBlockedForPasscode:", MEMORY[0x1E0C9AAB0]);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "numberWithDouble:", v9 + (double)*(int *)(a1 + 44));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUnblockTimeFromReferenceDate:", v10);

    }
  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setPendingDeviceWipe:", MEMORY[0x1E0C9AAB0]);
}

- (void)_persistentStateQueue_cancelSpeculativeFailureCharge
{
  uint64_t v3;
  id v4;
  NSDictionary *originalDefaultsForRollback;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (self->_speculativePasscodeFailureChargeOutstanding)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_speculativePasscodeFailureChargeOutstanding = 0;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __99__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_cancelSpeculativeFailureCharge__block_invoke;
    v6[3] = &unk_1E200E188;
    v6[4] = self;
    v4 = -[SBFUserAuthenticationModelJournaledDefaults updateLockControllerDefaultsWithBlock:journaled:](self, "updateLockControllerDefaultsWithBlock:journaled:", v6, 0);
    originalDefaultsForRollback = self->_originalDefaultsForRollback;
    self->_originalDefaultsForRollback = 0;

  }
}

uint64_t __99__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_cancelSpeculativeFailureCharge__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadLockControllerDefaults:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_persistentStateQueue_unlockSucceeded
{
  id v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_cancelSpeculativeFailureCharge](self, "_persistentStateQueue_cancelSpeculativeFailureCharge");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_unlockSucceeded__block_invoke;
  v4[3] = &unk_1E200E188;
  v4[4] = self;
  v3 = -[SBFUserAuthenticationModelJournaledDefaults updateLockControllerDefaultsWithBlock:journaled:](self, "updateLockControllerDefaultsWithBlock:journaled:", v4, 0);
}

uint64_t __84__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_unlockSucceeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setNumberOfFailedPasscodeAttempts:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUnblockTimeFromReferenceDate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBlockedForPasscode:", 0);
}

- (void)_persistentStateQueue_unlockFailedWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  NSDictionary *originalDefaultsForRollback;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    SBLogAuthenticationModel();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_18AB69000, v4, OS_LOG_TYPE_INFO, "A passcode attempt failed without a corresponding speculative failure charge. Callstack %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_beginSpeculativeFailureCharge](self, "_persistentStateQueue_beginSpeculativeFailureCharge");
  }
  self->_speculativePasscodeFailureChargeOutstanding = 0;
  originalDefaultsForRollback = self->_originalDefaultsForRollback;
  self->_originalDefaultsForRollback = 0;

  -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
  -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_evaluatePendingWipe](self, "_persistentStateQueue_evaluatePendingWipe");
}

- (void)_persistentStateQueue_loadLockState
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  -[SBSecurityDefaults unblockTimeFromReferenceDate](self->_securityDefaults, "unblockTimeFromReferenceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    self->_unblockTime = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    self->_unblockTime = v6;

  }
  -[SBSecurityDefaults isPendingDeviceWipe](self->_securityDefaults, "isPendingDeviceWipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pendingWipe = objc_msgSend(v7, "BOOLValue");

  -[SBSecurityDefaults isBlockedForPasscode](self->_securityDefaults, "isBlockedForPasscode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_permanentlyBlocked = objc_msgSend(v8, "BOOLValue");

}

- (void)_persistentStateQueue_evaluatePendingWipe
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (self->_pendingWipe)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_evaluatePendingWipe__block_invoke;
    block[3] = &unk_1E200E188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __88__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_evaluatePendingWipe__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AB69000, v2, OS_LOG_TYPE_INFO, "Wiping device", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceLockModelRequestsDeviceWipe:");
}

- (void)_persistentStateQueue_clearBlockedState
{
  id v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_cancelSpeculativeFailureCharge](self, "_persistentStateQueue_cancelSpeculativeFailureCharge");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_clearBlockedState__block_invoke;
  v4[3] = &unk_1E200E188;
  v4[4] = self;
  v3 = -[SBFUserAuthenticationModelJournaledDefaults updateLockControllerDefaultsWithBlock:journaled:](self, "updateLockControllerDefaultsWithBlock:journaled:", v4, 0);
  -[SBFUserAuthenticationModelJournaledDefaults _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
}

uint64_t __86__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_clearBlockedState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setNumberOfFailedPasscodeAttempts:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUnblockTimeFromReferenceDate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBlockedForPasscode:", 0);
}

- (void)test_reloadState
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  -[SBFUserAuthenticationModelJournaledDefaults _loadLockControllerDefaultsJournalIfNecessary](self, "_loadLockControllerDefaultsJournalIfNecessary");
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBFUserAuthenticationModelJournaledDefaults_test_reloadState__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

uint64_t __63__SBFUserAuthenticationModelJournaledDefaults_test_reloadState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_loadLockState");
}

- (id)updateLockControllerDefaultsWithBlock:(id)a3 journaled:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  SBSecurityDefaults *securityDefaults;
  void *v11;

  v4 = a4;
  v6 = (void (**)(_QWORD))a3;
  v7 = -[SBFUserAuthenticationModelJournaledDefaults _copyLockControllerDefaults](self, "_copyLockControllerDefaults");
  -[SBSecurityDefaults blockStateGeneration](self->_securityDefaults, "blockStateGeneration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  v6[2](v6);
  securityDefaults = self->_securityDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSecurityDefaults setBlockStateGeneration:](securityDefaults, "setBlockStateGeneration:", v11);

  if (v4)
    -[SBFUserAuthenticationModelJournaledDefaults _updateLockControllerDefaultsJournal](self, "_updateLockControllerDefaultsJournal");
  return v7;
}

+ (id)_journaledDefaultsAndTypes
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SBDeviceLockBlocked");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("SBDeviceLockFailedAttempts");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("SBFDeviceLockPendingWipe");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("SBDeviceLockBlockTimeIntervalSinceReferenceDate");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("SBDeviceLockBlockStateGeneration");
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_copyLockControllerDefaults
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_journaledDefaultsAndTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SBSecurityDefaults deviceLockDefaultForKey:](self->_securityDefaults, "deviceLockDefaultForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)_updateLockControllerDefaultsJournal
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = -[SBFUserAuthenticationModelJournaledDefaults _copyLockControllerDefaults](self, "_copyLockControllerDefaults");
  objc_msgSend(v3, "writeToFile:atomically:", self->_journalPath, 1);
  sync();
  SBLogAuthenticationModel();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18AB69000, v4, OS_LOG_TYPE_INFO, "Updated journal", v5, 2u);
  }

}

- (void)_loadLockControllerDefaults:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  SBSecurityDefaults *securityDefaults;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_journaledDefaultsAndTypes");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            SBLogAuthenticationModel();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138413058;
              v34 = v10;
              v35 = 2112;
              v36 = v11;
              v37 = 2114;
              v38 = v22;
              v39 = 2114;
              v40 = v12;
              v23 = v22;
              _os_log_impl(&dword_18AB69000, v21, OS_LOG_TYPE_INFO, "Loading journal key %@ found object %@ of type %{public}@ but expected type %{public}@. Aborting journal loading.", buf, 0x2Au);

            }
            goto LABEL_21;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v7)
        continue;
      break;
    }
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        securityDefaults = self->_securityDefaults;
        objc_msgSend(v4, "objectForKeyedSubscript:", v18, (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSecurityDefaults setDeviceLockDefault:forKey:](securityDefaults, "setDeviceLockDefault:forKey:", v20, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }
LABEL_21:

}

- (void)_loadLockControllerDefaultsJournalIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", self->_journalPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("SBDeviceLockBlockStateGeneration"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longLongValue");

    -[SBSecurityDefaults blockStateGeneration](self->_securityDefaults, "blockStateGeneration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (v7 < v5)
    {
      SBLogAuthenticationModel();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 134218240;
        v10 = v5;
        v11 = 2048;
        v12 = v7;
        _os_log_impl(&dword_18AB69000, v8, OS_LOG_TYPE_INFO, "journalGeneration = %lld defaultsGeneration = %lld. Updating defaults from journal", (uint8_t *)&v9, 0x16u);
      }

      -[SBFUserAuthenticationModelJournaledDefaults _loadLockControllerDefaults:](self, "_loadLockControllerDefaults:", v3);
    }
  }

}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDefaultsForRollback, 0);
  objc_storeStrong((id *)&self->_persistentStateQueue, 0);
  objc_storeStrong((id *)&self->_journalPath, 0);
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

- (void)_initWithJournalPath:(uint64_t)a3 securityDefaults:(uint64_t)a4 profileConnection:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "Model using journal @ path: %@", a5, a6, a7, a8, 2u);
}

@end
