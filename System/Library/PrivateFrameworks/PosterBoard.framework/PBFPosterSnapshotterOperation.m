@implementation PBFPosterSnapshotterOperation

- (PBFPosterSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  PBFPosterSnapshotterOperation *v11;
  PBFPosterSnapshotterOperation *v12;
  dispatch_group_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id location;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("PBFPosterSnapshotRequest"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA66B18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:].cold.4();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA66B7CLL);
  }

  v10 = v8;
  NSClassFromString(CFSTR("PBFPosterSnapshotter"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA66BE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotterClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:].cold.3();
    goto LABEL_19;
  }

  v25.receiver = self;
  v25.super_class = (Class)PBFPosterSnapshotterOperation;
  v11 = -[NSBlockOperation init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = dispatch_group_create();
    objc_storeStrong((id *)&v12->_lock_group, v13);
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v12->_snapshotter, a4);
    -[PBFPosterSnapshotter addObserver:](v12->_snapshotter, "addObserver:", v12);
    objc_initWeak(&location, v12);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke;
    v19[3] = &unk_1E86F3EE8;
    objc_copyWeak(&v23, &location);
    v20 = v10;
    v14 = v13;
    v21 = v14;
    v22 = v9;
    -[NSBlockOperation addExecutionBlock:](v12, "addExecutionBlock:", v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    v5 = (id *)(a1 + 32);
    if (!objc_msgSend(*(id *)(a1 + 32), "start") || (objc_msgSend(*v5, "isFinished") & 1) != 0)
    {
      objc_msgSend(*v5, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      PBFLogSnapshotter();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke_cold_1(v5, v2, v8);
        goto LABEL_16;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *v5;
        v10 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        v18 = v9;
        v19 = 2114;
        v20 = v10;
        v11 = "SnapshotterOperation finished %{public}@/%{public}@";
LABEL_15:
        _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    objc_msgSend(v4, "_snapshotterDidStart");
    v12 = *(NSObject **)(a1 + 40);
    v13 = dispatch_time(0, (uint64_t)(20.0 * 1000000000.0));
    if (!dispatch_group_wait(v12, v13))
    {
      PBFLogSnapshotter();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v5;
        v10 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        v18 = v16;
        v19 = 2114;
        v20 = v10;
        v11 = "SnapshotterOperation finished successfully %{public}@/%{public}@";
        goto LABEL_15;
      }
LABEL_16:

      goto LABEL_17;
    }
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Snapshotter timedout waiting for request: %@"), *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelWithReason:", v15);

  }
LABEL_17:

}

- (void)dealloc
{
  PBFPosterSnapshotter *snapshotter;
  objc_super v4;

  -[PBFPosterSnapshotter removeObserver:](self->_snapshotter, "removeObserver:", self);
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSnapshotterOperation;
  -[NSBlockOperation dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[PBFPosterSnapshotterOperation snapshotter](self, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelWithReason:", CFSTR("NSOperation was cancelled"));

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSnapshotterOperation;
  -[PBFPosterSnapshotterOperation cancel](&v4, sel_cancel);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_request, CFSTR("request"));
  -[PBFPosterSnapshotter elapsedTime](self->_snapshotter, "elapsedTime");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("elapsedTime"));
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation attempt](self, "attempt"), CFSTR("attempt"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  -[PBFPosterSnapshotRequest path](self->_request, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("path"));

  -[PBFPosterSnapshotRequest definitions](self->_request, "definitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("definitions"));

  -[PBFPosterSnapshotter elapsedTime](self->_snapshotter, "elapsedTime");
  v9 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("elapsedTime"));
  v10 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation attempt](self, "attempt"), CFSTR("attempt"));
  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation queuePriority](self, "queuePriority"), CFSTR("queuePriority"));
  v12 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation advisoryQueuePriority](self, "advisoryQueuePriority"), CFSTR("advisoryQueuePriority"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)_snapshotterDidStart
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_snapshotterDidStart = 1;
  dispatch_group_enter((dispatch_group_t)self->_lock_group);
  os_unfair_lock_unlock(p_lock);
}

- (void)_leaveMainGroup
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "Snapshotter did not start: %{public}@", a5, a6, a7, a8, 2u);
}

- (unint64_t)advisoryQueuePriority
{
  return self->_advisoryQueuePriority;
}

- (void)setAdvisoryQueuePriority:(unint64_t)a3
{
  self->_advisoryQueuePriority = a3;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (PBFPosterSnapshotter)snapshotter
{
  return self->_snapshotter;
}

- (int64_t)attempt
{
  return self->_attempt;
}

- (void)setAttempt:(int64_t)a3
{
  self->_attempt = a3;
}

- (int64_t)maxNumberOfAttempts
{
  return self->_maxNumberOfAttempts;
}

- (void)setMaxNumberOfAttempts:(int64_t)a3
{
  self->_maxNumberOfAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
}

- (void)initWithRequest:snapshotter:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRequest:snapshotter:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRequest:snapshotter:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRequest:snapshotter:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke_cold_1(id *a1, id *location, NSObject *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(*a1, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = WeakRetained;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1CB9FA000, a3, OS_LOG_TYPE_ERROR, "SnapshotterOperation failed %{public}@/%{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
