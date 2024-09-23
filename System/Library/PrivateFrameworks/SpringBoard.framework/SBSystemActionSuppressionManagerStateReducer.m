@implementation SBSystemActionSuppressionManagerStateReducer

- (id)initWithReduceBlock:(void *)a3 viewObstructionEligibility:(void *)a4 viewObstructionState:(void *)a5 selectedAction:(void *)a6 pocketState:(void *)a7 displayState:(char)a8 isAlwaysOnDisplayEnabled:
{
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void (**v21)(id, void *);
  void *v22;
  void *v24;
  void *v25;
  objc_super v26;

  v15 = a2;
  v16 = a4;
  v17 = a5;
  v18 = v17;
  if (!a1)
    goto LABEL_7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reduceBlock != ((void *)0)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A928E0);
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("viewObstructionState != ((void *)0)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A92948);
  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selectedAction != ((void *)0)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:].cold.3();
    goto LABEL_16;
  }
  v26.receiver = a1;
  v26.super_class = (Class)SBSystemActionSuppressionManagerStateReducer;
  a1 = (id *)objc_msgSendSuper2(&v26, sel_init);
  if (a1)
  {
    v19 = MEMORY[0x1D17E5550](v15);
    v20 = a1[2];
    a1[2] = (id)v19;

    a1[1] = a3;
    objc_storeStrong(a1 + 4, a4);
    objc_storeStrong(a1 + 5, a5);
    a1[6] = a6;
    a1[7] = a7;
    *((_BYTE *)a1 + 24) = a8;
    v21 = (void (**)(id, void *))a1[2];
    objc_msgSend(a1, "_reduceState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v22);

  }
LABEL_7:

  return a1;
}

- (void)setViewObstructionEligibility:(_QWORD *)a1
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    if (a1[1] != a2)
    {
      a1[1] = a2;
      v2 = a1[2];
      objc_msgSend(a1, "_reduceState");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

- (void)setViewObstructionState:(uint64_t)a1
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_5;
  if (v4)
  {
    v10 = v4;
    v6 = BSEqualObjects();
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 32), a2);
      v7 = *(_QWORD *)(a1 + 16);
      objc_msgSend((id)a1, "_reduceState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      v5 = v10;
    }
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("viewObstructionState != ((void *)0)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:].cold.1();
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setSelectedAction:(uint64_t)a1
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_5;
  if (v4)
  {
    v10 = v4;
    v6 = BSEqualObjects();
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 40), a2);
      v7 = *(_QWORD *)(a1 + 16);
      objc_msgSend((id)a1, "_reduceState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      v5 = v10;
    }
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selectedAction != ((void *)0)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionSuppressionManagerStateReducer setSelectedAction:].cold.1();
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setPocketState:(_QWORD *)a1
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    if (a1[6] != a2)
    {
      a1[6] = a2;
      v2 = a1[2];
      objc_msgSend(a1, "_reduceState");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

- (void)setDisplayState:(_QWORD *)a1
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    if (a1[7] != a2)
    {
      a1[7] = a2;
      v2 = a1[2];
      objc_msgSend(a1, "_reduceState");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

- (void)setIsAlwaysOnDisplayEnabled:(uint64_t)a1
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 24) != a2)
    {
      *(_BYTE *)(a1 + 24) = a2;
      v2 = *(_QWORD *)(a1 + 16);
      objc_msgSend((id)a1, "_reduceState");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

- (id)_reduceState
{
  void *v3;
  void *v4;
  int v5;
  int64_t viewObstructionEligibility;
  char v7;
  int v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  SBSystemActionViewObstructionState *viewObstructionState;
  CMSuppressionEvent *v13;
  CMSuppressionEvent *v14;
  SBSystemActionViewObstructionState *v15;
  CMSuppressionEvent *event;
  uint64_t v17;
  SBSystemActionSuppressionStatus *v18;
  void *v19;
  id *v20;
  _BYTE *v21;

  -[SBSystemAction configuredAction](self->_selectedAction, "configuredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Nothing"));

  if (objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable"))
  {
    viewObstructionEligibility = self->_viewObstructionEligibility;
    v7 = viewObstructionEligibility == 2 ? 1 : v5;
    if ((v7 & 1) == 0
      && (viewObstructionEligibility != 1 || self->_isAlwaysOnDisplayEnabled)
      && (self->_isAlwaysOnDisplayEnabled
       || !-[SBSystemAction shouldBePerformedWhenSuppressed](self->_selectedAction, "shouldBePerformedWhenSuppressed"))
      && !BLSBacklightStateIsActive())
    {
      LOBYTE(v8) = 0;
      v9 = 1;
      if ((v5 & 1) != 0)
        goto LABEL_19;
      goto LABEL_24;
    }
  }
  if (((objc_msgSend(MEMORY[0x1E0CA56A8], "isPocketStateAvailable") ^ 1 | v5) & 1) != 0
    || !self->_viewObstructionEligibility)
  {
    v8 = 0;
    if ((v5 & 1) == 0)
      goto LABEL_14;
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v8 = !-[SBSystemAction shouldBePerformedWhenSuppressed](self->_selectedAction, "shouldBePerformedWhenSuppressed");
  if ((v5 & 1) != 0)
    goto LABEL_18;
LABEL_14:
  if (self->_isAlwaysOnDisplayEnabled
    || !-[SBSystemAction shouldBePerformedWhenSuppressed](self->_selectedAction, "shouldBePerformedWhenSuppressed"))
  {
    v9 = 0;
    if (v8)
    {
      LOBYTE(v8) = 1;
      if ((self->_pocketState | 2) == 3)
      {
        v11 = 1;
        goto LABEL_32;
      }
    }
LABEL_24:
    viewObstructionState = self->_viewObstructionState;
    if (viewObstructionState)
    {
      v13 = viewObstructionState->_event;
      if (v13)
      {
        v14 = v13;
        v15 = self->_viewObstructionState;
        if (v15)
          event = v15->_event;
        else
          event = 0;
        v17 = -[CMSuppressionEvent type](event, "type");

        v10 = v17 == 1;
        goto LABEL_29;
      }
    }
LABEL_19:
    v11 = 2;
    goto LABEL_32;
  }
  v9 = 0;
  v10 = self->_displayState == 0;
LABEL_29:
  if (v10)
    v11 = 1;
  else
    v11 = 2;
LABEL_32:
  v18 = [SBSystemActionSuppressionStatus alloc];
  -[SBSystemActionSuppressionManagerStateReducer _buildSuppressionMetrics](self, "_buildSuppressionMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBSystemActionSuppressionStatus initWithState:metrics:]((id *)&v18->super.isa, (void *)v11, v19);

  v21 = -[SBSystemActionSuppressionManagerState initWithSuppressionStatus:isEligibleForViewObstructionEvents:canUsePocketStateForSuppression:]([SBSystemActionSuppressionManagerState alloc], v20, v9, v8);
  return v21;
}

- (id)_buildSuppressionMetrics
{
  void *v3;
  void *v4;
  unint64_t pocketState;
  const __CFString *v6;
  void *v7;
  void *v8;
  SBSystemActionViewObstructionState *viewObstructionState;
  SBSystemActionViewObstructionState *v10;
  CMSuppressionEvent *event;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  SBSystemActionViewObstructionState *v15;
  CMSuppressionEvent *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  SBSystemActionViewObstructionState *v26;
  void *v27;
  SBSystemActionViewObstructionState *v28;
  SBSystemActionViewObstructionState *v29;
  void *v30;
  SBSystemActionViewObstructionState *v31;
  NSError *error;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSBSystemActionSuppressionViewObstructionEligibility(self->_viewObstructionEligibility);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("vo_eligibility"));

  pocketState = self->_pocketState;
  if (pocketState > 3)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E8EB4D78[pocketState];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pocket_state"));
  NSStringFromBLSBacklightState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("display_state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAlwaysOnDisplayEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("always_on_display"));

  viewObstructionState = self->_viewObstructionState;
  if (viewObstructionState)
    viewObstructionState = (SBSystemActionViewObstructionState *)viewObstructionState->_event;
  if (viewObstructionState)
  {
    v10 = self->_viewObstructionState;
    if (v10)
      event = v10->_event;
    else
      event = 0;
    v12 = -[CMSuppressionEvent type](event, "type");
    if (v12 > 3)
      v13 = CFSTR("Suppress");
    else
      v13 = off_1E8EB4D98[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("event_type"));
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = self->_viewObstructionState;
    if (v15)
      v16 = v15->_event;
    else
      v16 = 0;
    -[CMSuppressionEvent timestamp](v16, "timestamp");
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemUptime");
    v21 = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v18 - v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v24 = v23;

    objc_msgSend(v14, "numberWithDouble:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("event_timestamp"));

  }
  v26 = self->_viewObstructionState;
  if (v26)
    v26 = (SBSystemActionViewObstructionState *)v26->_error;
  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = self->_viewObstructionState;
    if (v28)
      v28 = (SBSystemActionViewObstructionState *)v28->_error;
    v29 = v28;
    -[SBSystemActionViewObstructionState domain](v29, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = self->_viewObstructionState;
    if (v31)
      error = v31->_error;
    else
      error = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSError code](error, "code"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@"), v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("error"));

  }
  v35 = (void *)objc_msgSend(v3, "copy");

  return v35;
}

- (BOOL)isAlwaysOnDisplayEnabled
{
  if (result)
    return *(_BYTE *)(result + 24) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_viewObstructionState, 0);
  objc_storeStrong(&self->_reduceBlock, 0);
}

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.1()
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

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.2()
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

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.3()
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

- (void)setViewObstructionState:.cold.1()
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

- (void)setSelectedAction:.cold.1()
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
