@implementation SBAbstractSystemActionExecutor

- (SBAbstractSystemActionExecutor)initWithSystemAction:(id)a3
{
  id v5;
  void *v6;
  SBAbstractSystemActionExecutor *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemAction != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAbstractSystemActionExecutor initWithSystemAction:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_12:
    JUMPOUT(0x1D0B9CFA8);
  }
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)SBAbstractSystemActionExecutor;
  v7 = -[SBAbstractSystemActionExecutor init](&v12, sel_init);
  v8 = (void *)objc_opt_class();
  if (objc_msgSend(v8, "isEqual:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be instantiated concretely; use a subclass."),
      objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAbstractSystemActionExecutor initWithSystemAction:].cold.2();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_12;
  }
  if (v7)
    objc_storeStrong((id *)&v7->_systemAction, a3);

  return v7;
}

- (id)previewWithCoordinator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v8;
  uint8_t buf[4];
  SBAbstractSystemActionExecutor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBAbstractSystemActionExecutor canBeExecuted](self, "canBeExecuted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot preview an inexecutable action"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAbstractSystemActionExecutor previewWithCoordinator:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B9D160);
  }
  -[SBAbstractSystemActionExecutor _previewWithCoordinator:](self, "_previewWithCoordinator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SBLogSystemActionPreviewing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered an error while previewing action: %{public}@", buf, 0x16u);
    }

  }
  return v5;
}

- (void)cancelPreviewing
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (id)executeWithContext:(id)a3 executionHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *executionCompletions;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  SBAbstractSystemActionExecutor *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[SBAbstractSystemActionExecutor canBeExecuted](self, "canBeExecuted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot execute an inexecutable action"), self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAbstractSystemActionExecutor executeWithContext:executionHandler:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B9D410);
  }
  ++self->_executionGeneration;
  executionCompletions = self->_executionCompletions;
  if (!executionCompletions)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_executionCompletions;
    self->_executionCompletions = v12;

    executionCompletions = self->_executionCompletions;
  }
  v14 = (void *)objc_msgSend(v10, "copy");
  v15 = (void *)MEMORY[0x1D17E5550]();
  -[NSMutableArray addObject:](executionCompletions, "addObject:", v15);

  if (self->_executionStartTime == 0.0)
  {
    BSContinuousMachTimeNow();
    self->_executionStartTime = v16;
  }
  v23 = 0;
  -[SBAbstractSystemActionExecutor _beginInteractiveExecutionWithContext:executionHandler:error:](self, "_beginInteractiveExecutionWithContext:executionHandler:error:", v8, v9, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  if (!v17)
  {
    if (-[SBAbstractSystemActionExecutor isExecuting](self, "isExecuting"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed execution of %@ should not be executing"), self);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAbstractSystemActionExecutor executeWithContext:executionHandler:completion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B9D46CLL);
    }
    SBLogSystemActionExecution();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v18;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish executing without beginning due to error: %{public}@", buf, 0x16u);
    }

    -[SBAbstractSystemActionExecutor _finishExecutingWithResult:](self, "_finishExecutingWithResult:", v18);
  }

  return v17;
}

- (void)_finishExecutingWithResult:(id)a3
{
  id v4;
  double v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *executionCompletions;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_executionEndTime == 0.0)
  {
    BSContinuousMachTimeNow();
    self->_executionEndTime = v5;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_executionCompletions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    executionCompletions = self->_executionCompletions;
    self->_executionCompletions = 0;

  }
}

- (SBSystemAction)systemAction
{
  return self->_systemAction;
}

- (unint64_t)executionGeneration
{
  return self->_executionGeneration;
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (double)executionEndTime
{
  return self->_executionEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_executionCompletions, 0);
}

- (BOOL)_canBeExecuted
{
  BOOL result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (BOOL)_isExecuting
{
  BOOL result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  BOOL result;

  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)_previewWithCoordinator:(id)a3
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return 0;
}

- (void)_cancelPreviewing
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5
{
  OUTLINED_FUNCTION_12();
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return 0;
}

- (void)initWithSystemAction:.cold.1()
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSystemAction:.cold.2()
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)previewWithCoordinator:.cold.1()
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)executeWithContext:executionHandler:completion:.cold.1()
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)executeWithContext:executionHandler:completion:.cold.2()
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

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
