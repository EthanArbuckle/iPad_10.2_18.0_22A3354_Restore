@implementation SBIconFlockingMetric

BOOL __28__SBIconFlockingMetric_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 28;
}

- (SBIconFlockingMetric)init
{
  SBIconFlockingMetric *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  PETDistributionEventTracker *flockingDistributionTracker;
  uint64_t v7;
  PETScalarEventTracker *flockingUsageTracker;
  void *v9;
  SBIconFlockingMetric *v10;
  void *v11;
  _QWORD v13[4];
  SBIconFlockingMetric *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBIconFlockingMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F18]);
    v4 = MEMORY[0x1E0C9AA60];
    v5 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("IconDragging"), MEMORY[0x1E0C9AA60]);
    flockingDistributionTracker = v2->_flockingDistributionTracker;
    v2->_flockingDistributionTracker = (PETDistributionEventTracker *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("IconFlocking"), v4);
    flockingUsageTracker = v2->_flockingUsageTracker;
    v2->_flockingUsageTracker = (PETScalarEventTracker *)v7;

    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, &__block_literal_global_64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v2, "addEdge:", v9);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __28__SBIconFlockingMetric_init__block_invoke_2;
    v13[3] = &unk_1E8E9E018;
    v10 = v2;
    v14 = v10;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v10, "addEdge:", v11);

  }
  return v2;
}

uint64_t __28__SBIconFlockingMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  double v8;

  if (a2 != 30)
    return 1;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = 0;
  while (v6 >= qword_1D0E88D58[v7])
  {
    if (++v7 == 15)
    {
      v8 = 50.0;
      goto LABEL_10;
    }
  }
  if ((int)v7 <= 1)
    LODWORD(v7) = 1;
  v8 = (double)qword_1D0E88D58[(v7 - 1)];
LABEL_10:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], v8);
  if (v6 >= 2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flockingUsageTracker, 0);
  objc_storeStrong((id *)&self->_flockingDistributionTracker, 0);
}

@end
