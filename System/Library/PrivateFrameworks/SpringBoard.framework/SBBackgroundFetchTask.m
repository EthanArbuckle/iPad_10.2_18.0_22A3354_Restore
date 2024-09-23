@implementation SBBackgroundFetchTask

- (id)initForAppInfo:(void *)a3 withCompletion:
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBBackgroundFetchTask;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 0;
      v9 = objc_msgSend(v7, "copy");
      v10 = a1[5];
      a1[5] = (id)v9;

      objc_storeStrong(a1 + 2, a2);
      *((_DWORD *)a1 + 6) = +[SBBackgroundFetchTask _nextSequenceNumber](SBBackgroundFetchTask, "_nextSequenceNumber");
    }
  }

  return a1;
}

- (void)execute
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RBSAssertion *v14;
  RBSAssertion *lock_assertion;
  RBSAssertion *v16;
  uint64_t v17;
  RBSAssertion *v18;
  NSObject *v19;
  RBSAssertion *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  RBSAssertion *v26;
  SBBackgroundFetchTask *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[7];
  uint8_t buf[4];
  SBBackgroundFetchTask *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_finished && !self->_lock_assertion)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = self;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Executing %{public}@", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E0D87DF8];
    -[FBSApplicationInfo processIdentity](self->_appInfo, "processIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetWithProcessIdentity:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Background Content Fetching (%d)"), self->_sequenceNumber);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0D87C98]);
    objc_msgSend(MEMORY[0x1E0D87DE8], "withReason:", 10006);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    objc_msgSend(MEMORY[0x1E0D87CB0], "grantUserInitiated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v7;
    objc_msgSend(MEMORY[0x1E0D87CF8], "grant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v8;
    objc_msgSend(MEMORY[0x1E0D87D30], "grant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v9;
    objc_msgSend(MEMORY[0x1E0D87D08], "grantWithBackgroundPriority");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v10;
    objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[5] = v11;
    objc_msgSend(MEMORY[0x1E0D87CE0], "terminateAfterInterval:", 30.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[6] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (RBSAssertion *)objc_msgSend(v21, "initWithExplanation:target:attributes:", v22, v23, v13);
    lock_assertion = self->_lock_assertion;
    self->_lock_assertion = v14;

    objc_initWeak((id *)buf, self);
    v16 = self->_lock_assertion;
    v17 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __32__SBBackgroundFetchTask_execute__block_invoke;
    v28[3] = &unk_1E8EC0C48;
    objc_copyWeak(&v29, (id *)buf);
    -[RBSAssertion setInvalidationHandler:](v16, "setInvalidationHandler:", v28);
    v18 = self->_lock_assertion;
    dispatch_get_global_queue(25, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __32__SBBackgroundFetchTask_execute__block_invoke_13;
    block[3] = &unk_1E8E9E820;
    v26 = v18;
    v27 = self;
    v20 = v18;
    dispatch_async(v19, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
  os_unfair_lock_unlock(p_lock);
}

void __32__SBBackgroundFetchTask_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__SBBackgroundFetchTask_execute__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v4, v6);

    -[SBBackgroundFetchTask finishWithResult:]((uint64_t)WeakRetained, 3uLL);
  }

}

- (void)finishWithResult:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_BYTE *)(a1 + 48))
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      SBLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown - %lu)"), a2);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = off_1E8EC0CB0[a2];
        }
        *(_DWORD *)buf = 138543618;
        v11 = a1;
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ with result: %{public}@", buf, 0x16u);

      }
      *(_BYTE *)(a1 + 48) = 1;
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](*(_QWORD *)(a1 + 40));
      v9 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      os_unfair_lock_unlock(v4);
      if (v8)
      {
        v8[2](v8, a1, a2);

      }
    }
  }
}

void __32__SBBackgroundFetchTask_execute__block_invoke_13(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "acquireWithError:", &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __32__SBBackgroundFetchTask_execute__block_invoke_13_cold_1(a1, (uint64_t)v4, v5);

    -[SBBackgroundFetchTask finishWithResult:](*(_QWORD *)(a1 + 40), 3uLL);
  }

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_lock_finished)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBackgroundMultitaskingManager.m"), 135, CFSTR("deallocated without being finished: %@"), self);

  }
  -[RBSAssertion invalidate](self->_lock_assertion, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SBBackgroundFetchTask;
  -[SBBackgroundFetchTask dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FBSApplicationInfo processIdentity](self->_appInfo, "processIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@; seq: %d>"), v4, v5, self->_sequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int)_nextSequenceNumber
{
  unsigned int v2;

  do
    v2 = __ldxr((unsigned int *)&_nextSequenceNumber_sequenceNumber);
  while (__stxr(v2 + 1, (unsigned int *)&_nextSequenceNumber_sequenceNumber));
  return _nextSequenceNumber_sequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completionHandler, 0);
  objc_storeStrong((id *)&self->_lock_assertion, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

void __32__SBBackgroundFetchTask_execute__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, a2, a3, "Assertion for %{public}@ was invalidated: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

void __32__SBBackgroundFetchTask_execute__block_invoke_13_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, a2, a3, "Error acquiring assertion for %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

@end
