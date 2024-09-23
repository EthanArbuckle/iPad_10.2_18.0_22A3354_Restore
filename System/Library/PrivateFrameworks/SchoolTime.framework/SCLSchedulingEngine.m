@implementation SCLSchedulingEngine

- (SCLSchedulingEngine)initWithParametersBlock:(id)a3 shouldStartManuallyActive:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, SCLSchedulingParameters *);
  SCLSchedulingEngine *v7;
  SCLSchedulingParameters *v8;
  SCLState *v9;
  SCLState *state;
  objc_super v12;

  v4 = a4;
  v6 = (void (**)(id, SCLSchedulingParameters *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLSchedulingEngine;
  v7 = -[SCLSchedulingEngine init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(SCLSchedulingParameters);
    -[SCLSchedulingParameters setActivationSetting:](v8, "setActivationSetting:", 0);
    v6[2](v6, v8);
    -[SCLSchedulingEngine _evaluateChangeFromParameters:toParameters:](v7, "_evaluateChangeFromParameters:toParameters:", 0, v8);
    if (v4 && !-[SCLState activeState](v7->_state, "activeState"))
    {
      v9 = -[SCLState initWithActiveState:scheduleEnabled:inSchedule:]([SCLState alloc], "initWithActiveState:scheduleEnabled:inSchedule:", 2, -[SCLState isScheduleEnabled](v7->_state, "isScheduleEnabled"), -[SCLState isInSchedule](v7->_state, "isInSchedule"));
      state = v7->_state;
      v7->_state = v9;

    }
  }

  return v7;
}

- (void)updateParametersWithBlock:(id)a3
{
  void *v4;
  SCLSchedulingParameters *v5;
  SCLState *v6;
  _BOOL4 v7;
  SCLState *v8;
  NSDate *v9;
  void *v10;
  void (**v11)(id, SCLSchedulingParameters *);

  v11 = (void (**)(id, SCLSchedulingParameters *))a3;
  -[SCLSchedulingEngine schedulingParameters](self, "schedulingParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (SCLSchedulingParameters *)objc_msgSend(v4, "copy");
  if (!v5)
    v5 = objc_alloc_init(SCLSchedulingParameters);
  v11[2](v11, v5);
  v6 = self->_state;
  v7 = -[SCLSchedulingEngine _evaluateChangeFromParameters:toParameters:](self, "_evaluateChangeFromParameters:toParameters:", v4, v5);
  v8 = self->_state;
  if (v7)
  {
    v9 = self->_nextEvaluationDate;
    -[SCLSchedulingEngine delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schedulingEngine:didUpdateState:fromState:nextEvaluationDate:", self, v8, v6, v9);

  }
}

- (BOOL)_evaluateChangeFromParameters:(id)a3 toParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SCLState **p_state;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SCLState *v25;
  NSDate *v26;
  int v27;
  void *v28;
  void *v30;
  NSDate *v31;
  unsigned int v32;
  SCLState *v33;
  unsigned int v34;

  v6 = a4;
  objc_msgSend(v6, "evaluationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  p_state = &self->_state;
  v33 = self->_state;
  objc_msgSend(v6, "scheduleSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v11, "isEnabled");

  objc_msgSend(v6, "scheduleSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v12, "isActiveAtDate:calendar:", v7, v13);

  v30 = (void *)v9;
  objc_msgSend(v8, "dateIntervalForActiveScheduleOnOrAfterDate:calendar:", v7, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "containsDate:", v7))
  {
    objc_msgSend(v14, "endDate");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (NSDate *)v15;
    goto LABEL_7;
  }
  if (v14)
  {
    objc_msgSend(v14, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:
  v31 = self->_nextEvaluationDate;
  objc_storeStrong((id *)&self->_nextEvaluationDate, v16);
  objc_storeStrong((id *)&self->_lastEvaluationDate, v7);
  v17 = objc_msgSend(v6, "activationSetting");
  if (v17)
  {
    v18 = v17;
    v19 = v8;
    v20 = v32 ^ -[SCLState isScheduleEnabled](v33, "isScheduleEnabled");
    p_state = &self->_state;
    v21 = v34 ^ -[SCLState isInSchedule](v33, "isInSchedule") | v20;
    v8 = v19;
    if (v21)
      v22 = 0;
    else
      v22 = v18;
    objc_msgSend(v6, "setActivationSetting:", v22);
  }
  v23 = objc_msgSend(v6, "activationSetting");
  if (v23 == 1 || !v23 && v34)
  {
    if (objc_msgSend(v6, "isSuppressed"))
      v24 = 1;
    else
      v24 = 2;
  }
  else
  {
    v24 = 0;
  }
  v25 = -[SCLState initWithActiveState:scheduleEnabled:inSchedule:]([SCLState alloc], "initWithActiveState:scheduleEnabled:inSchedule:", v24, v32, v34);
  objc_storeStrong((id *)p_state, v25);
  objc_storeStrong((id *)&self->_schedulingParameters, a4);
  if (-[SCLState isEqual:](v25, "isEqual:", v33))
  {
    v26 = v31;
    if (v31 == v16)
      LOBYTE(v27) = 0;
    else
      v27 = -[NSDate isEqual:](v31, "isEqual:", v16) ^ 1;
    v28 = v30;
  }
  else
  {
    LOBYTE(v27) = 1;
    v28 = v30;
    v26 = v31;
  }

  return v27;
}

- (void)reevaluateStateAtDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SCLSchedulingEngine_reevaluateStateAtDate___block_invoke;
  v6[3] = &unk_24E29B9E0;
  v7 = v4;
  v5 = v4;
  -[SCLSchedulingEngine updateParametersWithBlock:](self, "updateParametersWithBlock:", v6);

}

uint64_t __45__SCLSchedulingEngine_reevaluateStateAtDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEvaluationDate:", *(_QWORD *)(a1 + 32));
}

- (NSDate)lastEvaluationDate
{
  return self->_lastEvaluationDate;
}

- (NSDate)nextEvaluationDate
{
  return self->_nextEvaluationDate;
}

- (SCLSchedulingEngineDelegate)delegate
{
  return (SCLSchedulingEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SCLState)state
{
  return self->_state;
}

- (SCLSchedulingParameters)schedulingParameters
{
  return self->_schedulingParameters;
}

- (void)setSchedulingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulingParameters, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextEvaluationDate, 0);
  objc_storeStrong((id *)&self->_lastEvaluationDate, 0);
}

@end
