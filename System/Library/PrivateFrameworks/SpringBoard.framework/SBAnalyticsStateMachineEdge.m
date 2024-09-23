@implementation SBAnalyticsStateMachineEdge

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transition, 0);
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5 andDo:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;

  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__SBAnalyticsStateMachineEdge_SBSystemGestureAnalytics__edgeFromState_toState_uponGestureState_andDo___block_invoke;
  v14[3] = &unk_1E8EB8F90;
  v15 = v10;
  v16 = a3;
  v17 = a5;
  v18 = a4;
  v11 = v10;
  objc_msgSend(a1, "edgeFromState:transition:", a3, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)edgeFromState:(unint64_t)a3 transition:(id)a4
{
  id v5;
  SBAnalyticsStateMachineEdge *v6;

  v5 = a4;
  v6 = -[SBAnalyticsStateMachineEdge initWithFromState:transition:]([SBAnalyticsStateMachineEdge alloc], "initWithFromState:transition:", a3, v5);

  return v6;
}

- (SBAnalyticsStateMachineEdge)initWithFromState:(unint64_t)a3 transition:(id)a4
{
  id v6;
  SBAnalyticsStateMachineEdge *v7;
  SBAnalyticsStateMachineEdge *v8;
  uint64_t v9;
  id transition;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAnalyticsStateMachineEdge;
  v7 = -[SBAnalyticsStateMachineEdge init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_fromState = a3;
    v9 = objc_msgSend(v6, "copy");
    transition = v8->_transition;
    v8->_transition = (id)v9;

  }
  return v8;
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5
{
  return (id)objc_msgSend(a1, "edgeFromState:toState:uponGestureState:andDo:", a3, a4, a5, 0);
}

- (unint64_t)fromState
{
  return self->_fromState;
}

- (unint64_t)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  uint64_t v5;
  NSObject *v6;

  v5 = (*((uint64_t (**)(void))self->_transition + 2))();
  SBLogAnalytics();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBAnalyticsStateMachineEdge handleEvent:withContext:].cold.1((uint64_t)self, v5, v6);

  return v5;
}

uint64_t __102__SBAnalyticsStateMachineEdge_SBSystemGestureAnalytics__edgeFromState_toState_uponGestureState_andDo___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1[5];
  if (a2 == 12)
  {
    objc_msgSend(a3, "eventPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if (v7 == a1[6])
    {
      v8 = a1[4];
      if (v8)
        (*(void (**)(void))(v8 + 16))();
      v3 = a1[7];
    }

  }
  return v3;
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponEvent:(unint64_t)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBAnalyticsStateMachineEdge_edgeFromState_toState_uponEvent___block_invoke;
  v6[3] = &__block_descriptor_40_e55_Q24__0Q8___SBFAnalyticsBackendEventContextProviding__16l;
  v6[4] = a4;
  objc_msgSend(a1, "edgeFromState:transition:", a3, v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__SBAnalyticsStateMachineEdge_edgeFromState_toState_uponEvent___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (NSString)debugDescription
{
  return (NSString *)-[SBAnalyticsStateMachineEdge descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAnalyticsStateMachineEdge descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v8;
  _QWORD v10[4];
  id v11;
  SBAnalyticsStateMachineEdge *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__SBAnalyticsStateMachineEdge_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __69__SBAnalyticsStateMachineEdge_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("fromState"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAnalyticsStateMachineEdge succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_fromState, CFSTR("fromState"));
  return v3;
}

- (void)handleEvent:(os_log_t)log withContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "edge transitioned from: %lu; to: %lu",
    (uint8_t *)&v4,
    0x16u);
}

@end
