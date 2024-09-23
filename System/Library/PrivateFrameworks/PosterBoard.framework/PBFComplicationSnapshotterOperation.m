@implementation PBFComplicationSnapshotterOperation

- (PBFComplicationSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  PBFComplicationSnapshotterOperation *v11;
  PBFComplicationSnapshotterOperation *v12;
  dispatch_group_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id location;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("PBFComplicationSnapshotRequest"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA37E10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFComplicationSnapshotRequestClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:].cold.4();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA37E74);
  }

  v10 = v8;
  NSClassFromString(CFSTR("PBFComplicationSnapshotter"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA37ED8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFComplicationSnapshotterClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:].cold.3();
    goto LABEL_19;
  }

  v25.receiver = self;
  v25.super_class = (Class)PBFComplicationSnapshotterOperation;
  v11 = -[NSBlockOperation init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock = 0;
    objc_storeStrong((id *)&v11->_request, a3);
    objc_storeStrong((id *)&v12->_snapshotter, a4);
    -[PBFComplicationSnapshotter addObserver:](v12->_snapshotter, "addObserver:", v12);
    v13 = dispatch_group_create();
    objc_storeStrong((id *)&v12->_lock_group, v13);
    objc_initWeak(&location, v12);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__PBFComplicationSnapshotterOperation_initWithRequest_snapshotter___block_invoke;
    v19[3] = &unk_1E86F3EE8;
    objc_copyWeak(&v23, &location);
    v14 = v13;
    v20 = v14;
    v21 = v10;
    v22 = v9;
    -[NSBlockOperation addExecutionBlock:](v12, "addExecutionBlock:", v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __67__PBFComplicationSnapshotterOperation_initWithRequest_snapshotter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v3, "isFinished") & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "start");
    objc_msgSend(v3, "_snapshotterDidStart");
    v4 = *(NSObject **)(a1 + 32);
    v5 = dispatch_time(0, (uint64_t)(60.0 * 1000000000.0));
    if (dispatch_group_wait(v4, v5))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ComplicationSnapshotter timedout waiting for request: %@"), *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelWithReason:", v7);

    }
    else
    {
      PBFLogSnapshotter();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v11 = v9;
        v12 = 2114;
        v13 = v3;
        _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "ComplicationSnapshotterOperation finished successfully %{public}@/%{public}@", buf, 0x16u);
      }

    }
  }

}

- (void)dealloc
{
  PBFComplicationSnapshotter *snapshotter;
  objc_super v4;

  -[PBFComplicationSnapshotter removeObserver:](self->_snapshotter, "removeObserver:", self);
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFComplicationSnapshotterOperation;
  -[NSBlockOperation dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[PBFComplicationSnapshotterOperation snapshotter](self, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelWithReason:", CFSTR("NSOperation was cancelled"));

  v4.receiver = self;
  v4.super_class = (Class)PBFComplicationSnapshotterOperation;
  -[PBFComplicationSnapshotterOperation cancel](&v4, sel_cancel);
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
  -[PBFComplicationSnapshotter elapsedTime](self->_snapshotter, "elapsedTime");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("elapsedTime"));
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFComplicationSnapshotterOperation attempt](self, "attempt"), CFSTR("attempt"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_snapshotterDidStart
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lock_snapshotterDidStart = 1;
  os_unfair_recursive_lock_unlock();
}

- (void)_leaveMainGroup
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "Snapshotter did not start: %{public}@", a5, a6, a7, a8, 2u);
}

- (PBFComplicationSnapshotRequest)request
{
  return self->_request;
}

- (PBFComplicationSnapshotter)snapshotter
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
  OUTLINED_FUNCTION_4_1();
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
  OUTLINED_FUNCTION_5_0();
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
  OUTLINED_FUNCTION_5_0();
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
