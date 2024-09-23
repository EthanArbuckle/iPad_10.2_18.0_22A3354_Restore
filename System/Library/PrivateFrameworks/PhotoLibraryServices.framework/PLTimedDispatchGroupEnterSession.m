@implementation PLTimedDispatchGroupEnterSession

- (PLTimedDispatchGroupEnterSession)initWithGroup:(id)a3 queue:(id)a4 timeout:(double)a5 name:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLTimedDispatchGroupEnterSession *v14;
  PLTimedDispatchGroupEnterSession *v15;
  uint64_t v16;
  NSString *name;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLTimedDispatchGroupEnterSession;
  v14 = -[PLTimedDispatchGroupEnterSession init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_group, a3);
    objc_storeStrong((id *)&v15->_queue, a4);
    v15->_timeout = a5;
    v15->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend(v13, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

  }
  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_lock_leaveIfPossible
{
  _BOOL4 lock_didLeave;

  os_unfair_lock_assert_owner(&self->_lock);
  lock_didLeave = self->_lock_didLeave;
  if (!self->_lock_didLeave)
  {
    self->_lock_didLeave = 1;
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  return !lock_didLeave;
}

- (void)_handleTimeoutCallback
{
  NSObject *v2;
  uint8_t buf[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Timed dispatch group session timed out waiting for group leave", buf, 2u);
  }

  PLSafeRunWithUnfairLock();
}

- (void)enter
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  dispatch_group_enter((dispatch_group_t)self->_group);
  if (self->_timeout != 0.0)
  {
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    queue = self->_queue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__PLTimedDispatchGroupEnterSession_enter__block_invoke;
    v5[3] = &unk_1E3677D48;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, queue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "failureWithError:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimedDispatchGroupEnterSession leaveWithResult:](self, "leaveWithResult:", v4);

}

- (BOOL)wasCancelled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PLTimedDispatchGroupEnterSession result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "code") == 3072;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)leave
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "successWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PLTimedDispatchGroupEnterSession leaveWithResult:](self, "leaveWithResult:", v5);
  return (char)self;
}

- (BOOL)leaveWithResult:(id)a3
{
  id v3;
  char v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = PLBoolResultWithUnfairLock();

  return v4;
}

- (id)result
{
  PLSafeResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)didTimeout
{
  void *v2;
  void *v3;
  char v4;

  -[PLTimedDispatchGroupEnterSession result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isFailure"))
  {
    objc_msgSend(v2, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PLIsErrorEqualToCode();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

id __42__PLTimedDispatchGroupEnterSession_result__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __52__PLTimedDispatchGroupEnterSession_leaveWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_leaveIfPossible");
  if ((_DWORD)v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return v2;
}

void __41__PLTimedDispatchGroupEnterSession_enter__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimeoutCallback");

}

void __58__PLTimedDispatchGroupEnterSession__handleTimeoutCallback__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_lock_leaveIfPossible"))
  {
    v2 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46512, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "failureWithError:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
