@implementation SBCaptureButtonInternalRestrictionGlue

- (SBCaptureButtonInternalRestrictionGlue)initWithCoordinator:(id)a3
{
  id v5;
  SBCaptureButtonInternalRestrictionGlue *v6;
  id v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBCaptureButtonInternalRestrictionGlue;
  v6 = -[SBCaptureButtonInternalRestrictionGlue init](&v19, sel_init);
  if (v6)
  {
    v7 = v5;
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_storeStrong((id *)&v6->_coordinator, a3);
        goto LABEL_5;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_msgSend(v8, "classForCoder");
      if (!v15)
        v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("coordinator"), v16, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:].cold.1();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("coordinator"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0665F40);
  }
LABEL_5:

  return v6;
}

- (void)dealloc
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)invalidate
{
  SBCaptureButtonRestrictionCoordinator *coordinator;
  BSInvalidatable *captureButtonInhibitionAssertion;

  coordinator = self->_coordinator;
  if (coordinator)
  {
    self->_coordinator = 0;

    -[BSInvalidatable invalidate](self->_captureButtonInhibitionAssertion, "invalidate");
    captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
    self->_captureButtonInhibitionAssertion = 0;

  }
}

- (void)acquireRestriction:(id)a3
{
  id v4;
  SBCaptureButtonRestrictionCoordinator *coordinator;
  BSInvalidatable *v6;
  BSInvalidatable *captureButtonInhibitionAssertion;
  void *v8;
  id v9;

  v4 = a3;
  coordinator = self->_coordinator;
  if (coordinator)
  {
    if (!self->_captureButtonInhibitionAssertion)
    {
      v9 = v4;
      -[SBCaptureButtonRestrictionCoordinator inhibitCaptureButtonActionAssertionWithReason:](coordinator, "inhibitCaptureButtonActionAssertionWithReason:", v4);
      v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
      self->_captureButtonInhibitionAssertion = v6;

      v4 = v9;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tried to acquire invalidated restriction(%@)"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBCaptureButtonInternalRestrictionGlue acquireRestriction:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)relinquishRestriction
{
  BSInvalidatable *captureButtonInhibitionAssertion;
  BSInvalidatable *v4;

  captureButtonInhibitionAssertion = self->_captureButtonInhibitionAssertion;
  if (captureButtonInhibitionAssertion)
  {
    -[BSInvalidatable invalidate](captureButtonInhibitionAssertion, "invalidate");
    v4 = self->_captureButtonInhibitionAssertion;
    self->_captureButtonInhibitionAssertion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureButtonInhibitionAssertion, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)initWithCoordinator:.cold.1()
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
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireRestriction:.cold.1()
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
