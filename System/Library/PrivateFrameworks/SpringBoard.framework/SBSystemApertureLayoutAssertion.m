@implementation SBSystemApertureLayoutAssertion

- (void)invalidateWithReason:(id)a3
{
  id v5;
  SBSystemApertureLayoutAssertion *v6;
  void (**v7)(_QWORD, _QWORD);
  id invalidationHandler;
  NSObject *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  SBSystemApertureLayoutAssertion *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureLayoutAssertion.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  if (!-[SBSystemApertureLayoutAssertion isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureLayoutAssertion.m"), 71, CFSTR("Attempt to invalidate invalid layout assertion: %@"), self);

  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v6->_invalidationHandler);
  invalidationHandler = v6->_invalidationHandler;
  v6->_invalidationHandler = 0;

  SBLogSystemApertureController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Invalidated layout assertion: %{public}@; reason: %{public}@",
      buf,
      0x16u);
  }

  ((void (**)(_QWORD, SBSystemApertureLayoutAssertion *))v7)[2](v7, v6);
  v10 = v6;
  objc_sync_enter(v10);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10[2];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v15 = v10[2];
  v10[2] = 0;

  objc_sync_exit(v10);
  objc_sync_exit(v10);

}

- (int64_t)maximumPermittedLayoutMode
{
  return self->_maximumPermittedLayoutMode;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBSystemApertureLayoutAssertion)initWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5
{
  id v9;
  id v10;
  SBSystemApertureLayoutAssertion *v11;
  SBSystemApertureLayoutAssertion *v12;
  uint64_t v13;
  NSString *reason;
  uint64_t v15;
  id invalidationHandler;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  SBSystemApertureLayoutAssertion *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFALL)
  {
    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureLayoutAssertion.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v10)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureLayoutAssertion.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(SAUIElementViewLayoutModeRemoved <= maxLayoutMode) && (maxLayoutMode <= SAUIElementViewLayoutModeCustom)"));

  if (!v9)
    goto LABEL_10;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureLayoutAssertion.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)SBSystemApertureLayoutAssertion;
  v11 = -[SBSystemApertureLayoutAssertion init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_maximumPermittedLayoutMode = a3;
    v13 = objc_msgSend(v9, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    invalidationHandler = v12->_invalidationHandler;
    v12->_invalidationHandler = (id)v15;

    SBLogSystemApertureController();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Created layout assertion: %{public}@", buf, 0xCu);
    }

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SBSystemApertureLayoutAssertion isValid](self, "isValid"))
    -[SBSystemApertureLayoutAssertion invalidateWithReason:](self, "invalidateWithReason:", CFSTR("deallocation"));
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureLayoutAssertion;
  -[SBSystemApertureLayoutAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *reason;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  SAUIStringFromElementViewLayoutMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  -[SBSystemApertureLayoutAssertion isValid](self, "isValid");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; max layout mode: %@; reason: %@; isValid: %@"),
    v4,
    self,
    v5,
    reason,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isValid
{
  SBSystemApertureLayoutAssertion *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_invalidationHandler != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (void)addInvalidationBlock:(id)a3
{
  id v4;
  SBSystemApertureLayoutAssertion *v5;
  NSMutableSet *invalidationBlocks;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    v9 = (void *)MEMORY[0x1D17E5550](v10);
    -[NSMutableSet addObject:](invalidationBlocks, "addObject:", v9);

    objc_sync_exit(v5);
    v4 = v10;
  }

}

@end
