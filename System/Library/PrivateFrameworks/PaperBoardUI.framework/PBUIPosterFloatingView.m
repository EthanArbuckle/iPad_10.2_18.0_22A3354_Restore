@implementation PBUIPosterFloatingView

- (PBUIPosterFloatingView)initWithFrame:(CGRect)a3
{
  PBUIPosterFloatingView *v3;
  void *v4;
  uint64_t v5;
  BSCompoundAssertion *currentUsers;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PBUIPosterFloatingView;
  v3 = -[PBUIPosterFloatingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E0D01718];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PBUIPosterFloatingView_initWithFrame___block_invoke;
    v8[3] = &unk_1E6B94790;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("FloatingLayer"), v8);
    v5 = objc_claimAutoreleasedReturnValue();
    currentUsers = v3->_currentUsers;
    v3->_currentUsers = (BSCompoundAssertion *)v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__PBUIPosterFloatingView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_0);

    objc_msgSend(WeakRetained, "setFloatingLayerHasStandin:", v5);
  }

}

uint64_t __40__PBUIPosterFloatingView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFloatingLayerStandin");
}

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_currentUsers, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIPosterFloatingView;
  -[PBUIPosterFloatingView dealloc](&v3, sel_dealloc);
}

- (BOOL)floatingLayerHasStandin
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  v3 = objc_msgSend(WeakRetained, "isHidden");

  return v3;
}

- (void)setFloatingLayerHasStandin:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  objc_msgSend(WeakRetained, "setHidden:", v3);

}

- (id)acquireSourceUsageAssertionForView:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  NSClassFromString(CFSTR("PBUIPosterFloatingLayerReplica"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterFloatingView acquireSourceUsageAssertionForView:].cold.1(a2);
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71CBE78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBUIPosterFloatingLayerReplicaClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterFloatingView acquireSourceUsageAssertionForView:].cold.1(a2);
    goto LABEL_9;
  }

  v6 = (void *)MEMORY[0x1E0D01748];
  v7 = v5;
  objc_msgSend(v6, "succinctDescriptionForObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](self->_currentUsers, "acquireForReason:withContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)effectsAreBakedIn
{
  return 0;
}

- (NSString)cacheIdentifier
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[PBUIPosterFloatingView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIPosterFloatingView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIPosterFloatingView floatingLayerHasStandin](self, "floatingLayerHasStandin"), CFSTR("floatingLayerHasStandin"));
  -[PBUIPosterFloatingView cacheIdentifier](self, "cacheIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("cacheIdentifier"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIPosterFloatingView effectsAreBakedIn](self, "effectsAreBakedIn"), CFSTR("effectsAreBakedIn"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", WeakRetained, CFSTR("defaultFloatingLayerStandin"));

  -[BSCompoundAssertion context](self->_currentUsers, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[BSCompoundAssertion context](self->_currentUsers, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v12, CFSTR("currentUsers"), 0);

  }
  else
  {
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", 0, CFSTR("currentUsers"), 0);
  }

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIPosterFloatingView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (UIView)defaultFloatingLayerStandin
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
}

- (void)setDefaultFloatingLayerStandin:(id)a3
{
  objc_storeWeak((id *)&self->_defaultFloatingLayerStandin, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)isFloatingLayerStandin
{
  return self->_floatingLayerHasStandin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_defaultFloatingLayerStandin);
  objc_storeStrong((id *)&self->_currentUsers, 0);
}

- (void)acquireSourceUsageAssertionForView:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
