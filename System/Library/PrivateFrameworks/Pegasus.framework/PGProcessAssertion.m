@implementation PGProcessAssertion

+ (id)pipVisibleDomainAttribute
{
  return (id)objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.pictureinpicture"), CFSTR("PIPVisible"));
}

+ (id)pipVisibleLegacyDomainAttribute
{
  return (id)objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.pictureinpicture"), CFSTR("PIPVisibleLegacy"));
}

+ (id)transientTaskDomainAttribute
{
  return (id)objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.pictureinpicture"), CFSTR("TransientTask"));
}

+ (id)transientTaskAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(a1, "transientTaskDomainAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assertionWithDomainAttribute:forProcessWithIdentifier:explanation:", v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pipVisibleAssertionForProcessWithIdentifier:(int)a3 explanation:(id)a4 legacy:(BOOL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (a5)
    objc_msgSend(a1, "pipVisibleLegacyDomainAttribute");
  else
    objc_msgSend(a1, "pipVisibleDomainAttribute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assertionWithDomainAttribute:forProcessWithIdentifier:explanation:", v9, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)assertionWithDomainAttribute:(id)a3 forProcessWithIdentifier:(int)a4 explanation:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  PGProcessAssertion *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  PGProcessAssertion *v15;
  uint64_t v16;

  v6 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = -[PGProcessAssertion initWithExplanation:]([PGProcessAssertion alloc], "initWithExplanation:", v8);

  if ((int)v6 < 1)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "+[PGProcessAssertion assertionWithDomainAttribute:forProcessWithIdentifier:explanation:]";
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, "%s Will ignore %{public}@ because there wasn't a valid pid", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    -[PGProcessAssertion acquireWithTarget:domainAttribute:](v9, "acquireWithTarget:domainAttribute:", v10, v7);
  }

  return v9;
}

- (PGProcessAssertion)initWithExplanation:(id)a3
{
  id v4;
  PGProcessAssertion *v5;
  uint64_t v6;
  NSString *explanation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGProcessAssertion;
  v5 = -[PGProcessAssertion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGProcessAssertion;
  -[PGProcessAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, self->_explanation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)acquireWithTarget:(id)a3 domainAttribute:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  PGProcessAssertion *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  BSDispatchQueueAssertMain();
  if (self->_assertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGProcessAssertion.m"), 72, CFSTR("Trying to acquire assertion when we already have one"));

  }
  if (-[PGProcessAssertion _isInvalidated](self, "_isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGProcessAssertion.m"), 73, CFSTR("Initially invalidated, which should not be possible"));

  }
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.pegasus.assertions", v9);
  queue = self->_queue;
  self->_queue = v10;

  PGLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]";
    v24 = 2114;
    v25 = self;
    v26 = 2114;
    v27 = v7;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_1B0CD6000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@ target: %{public}@ domain: %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v13 = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke;
  v18[3] = &unk_1E622F688;
  v18[4] = self;
  v19 = v7;
  v20 = v8;
  v14 = v8;
  v15 = v7;
  objc_copyWeak(&v21, (id *)buf);
  dispatch_async(v13, v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

void __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInvalidated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x1E0D87C98]);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v18[0] = *(_QWORD *)(a1 + 48);
    v18[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "initWithExplanation:target:attributes:", v5, v4, v6);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v7;

    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%s Acquiring %{public}@", buf, 0x16u);
    }

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke_25;
    v12[3] = &unk_1E622F660;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    objc_msgSend(v11, "acquireWithInvalidationHandler:", v12);
    if (objc_msgSend(*(id *)(a1 + 32), "_isInvalidated"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
    objc_destroyWeak(&v13);

  }
}

void __56__PGProcessAssertion_acquireWithTarget_domainAttribute___block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v9 = 136315394;
      v10 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
      v11 = 2114;
      v12 = WeakRetained;
      v8 = "%s Failed to acquire %{public}@";
LABEL_6:
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);

    }
  }
  else if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = 136315394;
    v10 = "-[PGProcessAssertion acquireWithTarget:domainAttribute:]_block_invoke";
    v11 = 2114;
    v12 = WeakRetained;
    v8 = "%s %{public}@ invalidated";
    goto LABEL_6;
  }

}

- (BOOL)_isInvalidated
{
  PGProcessAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setInvalidated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!-[PGProcessAssertion _isInvalidated](self, "_isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGProcessAssertion.m"), 111, CFSTR("Released %@ without invalidating first."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)PGProcessAssertion;
  -[PGProcessAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  PGProcessAssertion *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PGProcessAssertion _setInvalidated:](self, "_setInvalidated:", 1);
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[RBSAssertion isValid](self->_assertion, "isValid");
    v5 = 136315650;
    v6 = "-[PGProcessAssertion invalidate]";
    v7 = 2114;
    v8 = self;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidating %{public}@. was valid: %{BOOL}u", (uint8_t *)&v5, 0x1Cu);
  }

  -[RBSAssertion invalidate](self->_assertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
