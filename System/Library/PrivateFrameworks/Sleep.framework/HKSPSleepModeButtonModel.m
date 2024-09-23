@implementation HKSPSleepModeButtonModel

- (HKSPSleepModeButtonModel)initWithDelegate:(id)a3
{
  id v4;
  HKSPSleepStore *v5;
  void *v6;
  HKSPSleepStore *v7;
  void *v8;
  HKSPSleepModeButtonModel *v9;

  v4 = a3;
  v5 = [HKSPSleepStore alloc];
  HKSPGenerateSleepStoreIdentifier(CFSTR("sleepModeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKSPSleepStore initWithIdentifier:](v5, "initWithIdentifier:", v6);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKSPSleepModeButtonModel initWithSleepStore:delegate:behavior:](self, "initWithSleepStore:delegate:behavior:", v7, v4, v8);

  return v9;
}

- (HKSPSleepModeButtonModel)initWithSleepStore:(id)a3 delegate:(id)a4 behavior:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSPSleepModeButtonModel *v12;
  HKSPSleepModeButtonModel *v13;
  HKSPSleepModeButtonModel *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPSleepModeButtonModel;
  v12 = -[HKSPSleepModeButtonModel init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sleepStore, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_behavior, a5);
    -[HKSPSleepStore addObserver:](v13->_sleepStore, "addObserver:", v13);
    -[HKSPSleepModeButtonModel _checkSleepModeState](v13, "_checkSleepModeState");
    v14 = v13;
  }

  return v13;
}

- (void)_checkSleepModeState
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[HKSPSleepStore sleepModeFuture](self->_sleepStore, "sleepModeFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__HKSPSleepModeButtonModel__checkSleepModeState__block_invoke;
  v5[3] = &unk_1E4E3ACE0;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

uint64_t __48__HKSPSleepModeButtonModel__checkSleepModeState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateWithSleepMode:", objc_msgSend(a2, "integerValue"));
}

- (BOOL)isSelected
{
  int v3;
  int64_t sleepMode;
  BOOL v5;
  BOOL v6;

  v3 = -[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch");
  sleepMode = self->_sleepMode;
  v5 = sleepMode == 2;
  v6 = sleepMode != 0;
  if (v3)
    return v5;
  else
    return v6;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  HKSPSleepStore *sleepStore;
  _QWORD v9[5];
  void (**v10)(_QWORD);
  _QWORD v11[5];
  BOOL v12;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke;
  v11[3] = &unk_1E4E3AD30;
  v11[4] = self;
  v12 = a3;
  v6 = (void (**)(_QWORD))MEMORY[0x1A85ABD18](v11, a2);
  v7 = v6;
  if (v3)
  {
    sleepStore = self->_sleepStore;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_191;
    v9[3] = &unk_1E4E3AD80;
    v9[4] = self;
    v10 = v6;
    -[HKSPSleepStore currentSleepEventRecordWithCompletion:](sleepStore, "currentSleepEventRecordWithCompletion:", v9);

  }
  else
  {
    v6[2](v6);
  }

}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, char, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2;
  v7 = &unk_1E4E3AD08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "setSleepModeOn:completion:", v3, &v4);
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateStateWithSleepMode:", 2 * *(unsigned __int8 *)(a1 + 40), v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    HKSPLogForCategory(7uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v5;
      v8 = v10;
      _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set sleep mode: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(WeakRetained, "_checkSleepModeState");
  }

}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2_192;
  v11[3] = &unk_1E4E3AD58;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2_192(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isAppleWatch");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = objc_msgSend(v4, "isAnySleepTrackingOnboardingCompleted");

      if ((v5 & 1) == 0)
      {
LABEL_4:
        HKSPLogForCategory(7uLL);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543362;
          v14 = (id)objc_opt_class();
          v7 = v14;
          _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] onboarding not completed", (uint8_t *)&v13, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 40), "_launchAppForOnboarding");
        return;
      }
    }
    else
    {
      v9 = objc_msgSend(v4, "isAnySleepCoachingOnboardingCompleted");

      if (!v9)
        goto LABEL_4;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  HKSPLogForCategory(7uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_opt_class();
    v11 = *(_QWORD *)(a1 + 48);
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v12 = v10;
    _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get onboarding version: %{public}@", (uint8_t *)&v13, 0x16u);

  }
}

- (void)_launchAppForOnboarding
{
  void *v3;
  id v4;

  HKSPSleepURLWithOptionsFromSource(CFSTR("onboardSleepCoaching"), 0, CFSTR("SleepModeButton"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepModeButtonModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepModeButtonModel:launchURL:", self, v4);

}

- (void)_updateStateWithSleepMode:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__HKSPSleepModeButtonModel__updateStateWithSleepMode___block_invoke;
  v3[3] = &unk_1E4E3ADA8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __54__HKSPSleepModeButtonModel__updateStateWithSleepMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateStateWithSleepMode:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_updateStateWithSleepMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    NSStringFromHKSPSleepMode(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating sleep mode state: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  self->_sleepMode = a3;
  -[HKSPSleepModeButtonModel delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sleepModeButtonModelChanged:", self);

}

- (HKSPSleepModeButtonModelDelegate)delegate
{
  return (HKSPSleepModeButtonModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (int64_t)sleepMode
{
  return self->_sleepMode;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
