@implementation SBFAuthenticationAssertionManager

- (SBFAuthenticationAssertionManager)init
{
  SBFAuthenticationAssertionManager *v2;
  SBFPasscodeLockTrackerForPreventLockAssertions *v3;
  SBFAuthenticationAssertionTracker *preventLockTracker;
  SBFPasscodeLockTrackerForTransientAssertions *v5;
  SBFAuthenticationAssertionTracker *transientTracker;
  id v7;
  uint64_t v8;
  BSInvalidatable *stateCaptureToken;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFAuthenticationAssertionManager;
  v2 = -[SBFAuthenticationAssertionManager init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBFPasscodeLockTrackerForPreventLockAssertions);
    preventLockTracker = v2->_preventLockTracker;
    v2->_preventLockTracker = &v3->super;

    v5 = objc_alloc_init(SBFPasscodeLockTrackerForTransientAssertions);
    transientTracker = v2->_transientTracker;
    v2->_transientTracker = &v5->super;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v11, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v8 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v2->_stateCaptureToken;
    v2->_stateCaptureToken = (BSInvalidatable *)v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __41__SBFAuthenticationAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFAuthenticationAssertionManager;
  -[SBFAuthenticationAssertionManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBFAuthenticationAssertionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFAuthenticationAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFAuthenticationAssertionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFAuthenticationAssertionManager *v11;

  v4 = a3;
  -[SBFAuthenticationAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBFAuthenticationAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __75__SBFAuthenticationAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("preventLockTracker"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("transientTracker"));
}

- (void)addAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAuthenticationAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "Adding authentication assertion %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = objc_msgSend(v4, "type");
  if (v7 == 1)
  {
    v8 = 8;
    goto LABEL_7;
  }
  if (v7 == 2)
  {
    v8 = 16;
LABEL_7:
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "addAssertion:", v4);
  }

}

- (void)removeAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAuthenticationAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "Removed authentication assertion %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = objc_msgSend(v4, "type");
  if (v7 == 1)
  {
    v8 = 8;
    goto LABEL_7;
  }
  if (v7 == 2)
  {
    v8 = 16;
LABEL_7:
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "removeAssertion:", v4);
  }

}

- (BOOL)hasActiveAssertions
{
  return -[SBFAuthenticationAssertionTracker hasActiveAssertions](self->_preventLockTracker, "hasActiveAssertions")
      || -[SBFAuthenticationAssertionTracker hasActiveAssertions](self->_transientTracker, "hasActiveAssertions");
}

- (BOOL)isAssertionValid:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 1)
  {
    v6 = 8;
  }
  else
  {
    if (v5 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = 16;
  }
  v7 = objc_msgSend(*(id *)((char *)&self->super.isa + v6), "isAssertionValid:", v4);
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_transientTracker, 0);
  objc_storeStrong((id *)&self->_preventLockTracker, 0);
}

@end
