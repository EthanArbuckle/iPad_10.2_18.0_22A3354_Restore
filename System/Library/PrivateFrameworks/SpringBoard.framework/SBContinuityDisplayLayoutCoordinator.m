@implementation SBContinuityDisplayLayoutCoordinator

- (SBContinuityDisplayLayoutCoordinator)initWithRootPublisher:(id)a3
{
  id v6;
  void *v7;
  SBContinuityDisplayLayoutCoordinator *v8;
  SBContinuityDisplayLayoutCoordinator *v9;
  SBContinuityDisplayLayoutCoordinator *result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)SBContinuityDisplayLayoutCoordinator;
    v8 = -[SBContinuityDisplayLayoutCoordinator init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_rootPublisher, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("rootPublisher"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBContinuityDisplayLayoutCoordinator initWithRootPublisher:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (SBContinuityDisplayLayoutCoordinator *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)start
{
  BSInvalidatable *v3;
  BSInvalidatable *suppression;

  BSDispatchQueueAssertMain();
  if (!self->_currentPublisher)
  {
    -[FBSDisplayLayoutPublisher suppressLayoutForReason:](self->_rootPublisher, "suppressLayoutForReason:", CFSTR("startListener"));
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    suppression = self->_suppression;
    self->_suppression = v3;

  }
}

- (void)invalidate
{
  FBSDisplayLayoutPublisher *rootPublisher;
  BSInvalidatable *suppression;

  BSDispatchQueueAssertMain();
  rootPublisher = self->_rootPublisher;
  self->_rootPublisher = 0;

  -[BSInvalidatable invalidate](self->_suppression, "invalidate");
  suppression = self->_suppression;
  self->_suppression = 0;

}

- (id)activateForPublisher:(id)a3
{
  id v5;
  void *v6;
  BSZeroingWeakReference *v7;
  BSZeroingWeakReference *currentPublisher;
  BSInvalidatable *suppression;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("publisher"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBContinuityDisplayLayoutCoordinator activateForPublisher:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0813630);
  }
  v6 = v5;
  BSDispatchQueueAssertMain();
  if (self->_currentPublisher)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayLayoutCoordinator.m"), 55, CFSTR("<SBContinuityDisplayLayoutCoordinator:%p> cannot remove suppression for %@ because it is already tracking %@"), self, v6, self->_currentPublisher);

  }
  objc_msgSend(MEMORY[0x1E0D018B0], "referenceWithObject:", v6);
  v7 = (BSZeroingWeakReference *)objc_claimAutoreleasedReturnValue();
  currentPublisher = self->_currentPublisher;
  self->_currentPublisher = v7;

  -[BSInvalidatable invalidate](self->_suppression, "invalidate");
  suppression = self->_suppression;
  self->_suppression = 0;

  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SBContinuityDisplayLayoutCoordinator:%p>"), self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__SBContinuityDisplayLayoutCoordinator_activateForPublisher___block_invoke;
  v17[3] = &unk_1E8E9E468;
  objc_copyWeak(&v18, &location);
  v13 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v11, v12, v17);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v13;
}

void __61__SBContinuityDisplayLayoutCoordinator_activateForPublisher___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  id v5;
  id *v6;

  BSDispatchQueueAssertMain();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    WeakRetained[3] = 0;
    v6 = WeakRetained;

    objc_msgSend(v6[1], "suppressLayoutForReason:", CFSTR("invalidated session"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v6[2];
    v6[2] = (id)v4;

    WeakRetained = v6;
  }

}

- (FBSDisplayLayoutPublisher)rootPublisher
{
  return self->_rootPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPublisher, 0);
  objc_storeStrong((id *)&self->_suppression, 0);
  objc_storeStrong((id *)&self->_rootPublisher, 0);
}

- (void)initWithRootPublisher:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)activateForPublisher:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
