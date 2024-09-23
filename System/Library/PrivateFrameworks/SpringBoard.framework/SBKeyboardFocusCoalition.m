@implementation SBKeyboardFocusCoalition

- (SBKeyboardFocusCoalition)init
{
  return (SBKeyboardFocusCoalition *)-[SBKeyboardFocusCoalition _initWithDebugName:](self, "_initWithDebugName:", CFSTR("SBKeyboardFocusCoalition"));
}

- (id)_initWithDebugName:(id)a3
{
  id v5;
  void *v6;
  SBKeyboardFocusCoalition *v7;
  NSMutableArray *v8;
  NSMutableArray *internalMembers;
  uint64_t v10;
  NSString *debugName;
  id v12;
  void *v13;
  uint64_t v14;
  BSInvalidatable *stateCaptureHandle;
  id result;
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v20.receiver = self;
    v20.super_class = (Class)SBKeyboardFocusCoalition;
    v7 = -[SBKeyboardFocusCoalition init](&v20, sel_init);
    if (v7)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      internalMembers = v7->_internalMembers;
      v7->_internalMembers = v8;

      v10 = objc_msgSend(v6, "copy");
      debugName = v7->_debugName;
      v7->_debugName = (NSString *)v10;

      objc_initWeak(&location, v7);
      v12 = MEMORY[0x1E0C80D38];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - KeyboardFocus - Coalition - %@"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v18, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v14 = objc_claimAutoreleasedReturnValue();
      stateCaptureHandle = v7->_stateCaptureHandle;
      v7->_stateCaptureHandle = (BSInvalidatable *)v14;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("debugName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoalition _initWithDebugName:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

id __47__SBKeyboardFocusCoalition__initWithDebugName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)suppressKeyboardFocusEvaluationForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *suppressKeyboardFocusEvaluationAssertion;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  BSCompoundAssertion *v10;
  BSCompoundAssertion *v11;
  BSCompoundAssertion *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  NSString *v17;
  id v18;
  id location;

  v4 = a3;
  suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  if (!suppressKeyboardFocusEvaluationAssertion)
  {
    v6 = self->_debugName;
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]-keyboardFocusEvaluationSuppression"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__SBKeyboardFocusCoalition_suppressKeyboardFocusEvaluationForReason___block_invoke;
    v16[3] = &unk_1E8EBE260;
    v9 = v6;
    v17 = v9;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v7, "assertionWithIdentifier:stateDidChangeHandler:", v8, v16);
    v10 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v11 = self->_suppressKeyboardFocusEvaluationAssertion;
    self->_suppressKeyboardFocusEvaluationAssertion = v10;

    v12 = self->_suppressKeyboardFocusEvaluationAssertion;
    SBLogKeyboardFocus();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v12, "setLog:", v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    suppressKeyboardFocusEvaluationAssertion = self->_suppressKeyboardFocusEvaluationAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](suppressKeyboardFocusEvaluationAssertion, "acquireForReason:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __69__SBKeyboardFocusCoalition_suppressKeyboardFocusEvaluationForReason___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isActive") & 1) == 0)
  {
    SBLogKeyboardFocus();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished suppressing keyboard focus evaluation, time to re-evaluate", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason keyboardFocusEvaluationSuppression](SBKeyboardFocusArbitrationReason, "keyboardFocusEvaluationSuppression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotatedWithSourceName:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestArbitrationForReason:", v8);

  }
}

- (BOOL)isKeyboardFocusEvaluationSuppressed
{
  return -[BSCompoundAssertion isActive](self->_suppressKeyboardFocusEvaluationAssertion, "isActive");
}

- (NSSet)keyboardFocusEvaluationSupressionReasons
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[BSCompoundAssertion reasons](self->_suppressKeyboardFocusEvaluationAssertion, "reasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (NSArray)members
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_internalMembers, "copy");
}

- (id)acquireMemberForWindowScene:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SBKeyboardFocusCoalitionMember *v8;
  void *v9;
  void *v10;
  SBKeyboardFocusCoalitionMember *v11;

  v6 = a4;
  v7 = a3;
  v8 = [SBKeyboardFocusCoalitionMember alloc];
  objc_msgSend(v7, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBKeyboardFocusCoalitionMember initWithUniqueIdentifier:windowScene:delegate:coalition:](v8, "initWithUniqueIdentifier:windowScene:delegate:coalition:", v10, v7, v6, self);

  -[SBKeyboardFocusCoalition _registerMember:](self, "_registerMember:", v11);
  return v11;
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_registerMember:(id)a3
{
  NSMutableArray *internalMembers;
  id v5;

  internalMembers = self->_internalMembers;
  v5 = a3;
  -[NSMutableArray addObject:](internalMembers, "addObject:", v5);
  -[NSMutableArray sortUsingComparator:](self->_internalMembers, "sortUsingComparator:", &__block_literal_global_364);
  -[SBKeyboardFocusCoalition addedMember:](self, "addedMember:", v5);

}

BOOL __44__SBKeyboardFocusCoalition__registerMember___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 < v6;
}

- (void)_unregisterMember:(id)a3
{
  NSMutableArray *internalMembers;
  id v5;
  void *v6;
  void *v7;
  id v8;

  internalMembers = self->_internalMembers;
  v5 = a3;
  -[NSMutableArray removeObject:](internalMembers, "removeObject:", v5);
  -[SBKeyboardFocusCoalition removedMember:](self, "removedMember:", v5);

  -[SBKeyboardFocusCoalition delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason removedCoalitionMember](SBKeyboardFocusArbitrationReason, "removedCoalitionMember");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "annotatedWithSourceName:", self->_debugName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestArbitrationForReason:", v7);

}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *debugName;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogKeyboardFocus();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = debugName;
    v13 = 2114;
    v14 = v10;
    v15 = 2114;
    v16 = v7;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] member %{public}@ requests update for reason: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)setNeedsArbitrationForReason:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:].cold.1(a2);
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0CBA36CLL);
  }
  v6 = v5;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v13)
      v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v14, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:].cold.1(a2);
    goto LABEL_13;
  }

  SBLogKeyboardFocus();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:].cold.2((uint64_t)self, (uint64_t)v6, v7);

}

- (void)addedMember:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBKeyboardFocusCoalition addedMember:].cold.1((uint64_t)self, v4, v5);

}

- (void)removedMember:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBKeyboardFocusCoalition removedMember:].cold.1((uint64_t)self, v4, v5);

}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[SBKeyboardFocusCoalition members](self, "members", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[SBKeyboardFocusCoalition _unregisterMember:](self, "_unregisterMember:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
    -[SBKeyboardFocusPolicyEnforcer invalidate](self->_policyEnforcer, "invalidate");
    -[BSCompoundAssertion invalidate](self->_suppressKeyboardFocusEvaluationAssertion, "invalidate");
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;
  SBKeyboardFocusCoalition *v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendProem:block:", self, v9);
  if ((objc_msgSend(v6, "hasSuccinctStyle") & 1) == 0)
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E8E9E820;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v8, "appendBodySectionWithName:block:", 0, v7);

  }
}

id __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("invalid"));
  return result;
}

void __54__SBKeyboardFocusCoalition_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isKeyboardFocusEvaluationSuppressed"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "keyboardFocusEvaluationSupressionReasons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("keyboardFocusEvaluationSupressionReasons"));

  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "enforcedPolicy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("enforcedPolicy"));

}

- (SBKeyboardFocusPolicyEnforcer)policyEnforcer
{
  return self->_policyEnforcer;
}

- (void)setPolicyEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_policyEnforcer, a3);
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SBKeyboardFocusCoalitionDelegate)delegate
{
  return (SBKeyboardFocusCoalitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedPolicy, a3);
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, a3);
}

- (NSMutableArray)internalMembers
{
  return self->_internalMembers;
}

- (void)setInternalMembers:(id)a3
{
  objc_storeStrong((id *)&self->_internalMembers, a3);
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, a3);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_internalMembers, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
}

- (void)_initWithDebugName:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)setNeedsArbitrationForReason:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setNeedsArbitrationForReason:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, (uint64_t)a3, "[%{public}@] needs arbitration for reason: %{public}@", (uint8_t *)&v4);
}

- (void)addedMember:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v5, "[%{public}@] added member: %{public}@", v6);

  OUTLINED_FUNCTION_20();
}

- (void)removedMember:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v5, "[%{public}@] removed member: %{public}@", v6);

  OUTLINED_FUNCTION_20();
}

@end
