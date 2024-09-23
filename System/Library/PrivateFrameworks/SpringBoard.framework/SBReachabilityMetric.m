@implementation SBReachabilityMetric

uint64_t __28__SBReachabilityMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  if (a2 != 6)
    return 0;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return 1;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  if (a2 == 3)
  {
    objc_msgSend(a3, "eventPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

- (SBReachabilityMetric)init
{
  SBReachabilityMetric *v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PETDistributionEventTracker *tracker;
  uint64_t v12;
  SBReachabilityMetric *v13;
  void *v14;
  SBReachabilityMetric *v15;
  void *v16;
  SBReachabilityMetric *v17;
  void *v18;
  SBReachabilityMetric *v19;
  void *v20;
  SBReachabilityMetric *v21;
  void *v22;
  SBReachabilityMetric *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  SBReachabilityMetric *v29;
  _QWORD v30[4];
  SBReachabilityMetric *v31;
  _QWORD v32[4];
  SBReachabilityMetric *v33;
  _QWORD v34[4];
  SBReachabilityMetric *v35;
  _QWORD v36[4];
  SBReachabilityMetric *v37;
  _QWORD v38[4];
  SBReachabilityMetric *v39;
  objc_super v40;
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)SBReachabilityMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v40, sel_init);
  if (v2)
  {
    PETEventPropertyForLayoutLocations(CFSTR("location"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = -1;
    do
    {
      v6 = CFSTR("other");
      if (v5 <= 6)
        v6 = off_1E8EB23B8[v5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ++v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

    }
    while (v5 != 7);
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:enumMapping:", CFSTR("deactivate"), v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0D80F18]);
    v41[0] = v3;
    v41[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("reachability"), v9);
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v10;

    v12 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __28__SBReachabilityMetric_init__block_invoke;
    v38[3] = &unk_1E8E9E018;
    v13 = v2;
    v39 = v13;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v38);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __28__SBReachabilityMetric_init__block_invoke_2;
    v36[3] = &unk_1E8E9E018;
    v15 = v13;
    v37 = v15;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __28__SBReachabilityMetric_init__block_invoke_3;
    v34[3] = &unk_1E8E9E018;
    v17 = v15;
    v35 = v17;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 2, v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __28__SBReachabilityMetric_init__block_invoke_4;
    v32[3] = &unk_1E8E9E018;
    v26 = (void *)v3;
    v19 = v17;
    v33 = v19;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __28__SBReachabilityMetric_init__block_invoke_5;
    v30[3] = &unk_1E8E9E018;
    v21 = v19;
    v31 = v21;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __28__SBReachabilityMetric_init__block_invoke_6;
    v28[3] = &unk_1E8E9E018;
    v23 = v21;
    v29 = v23;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v14);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v16);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v18);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v20);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v22);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v23, "addEdge:", v24);

  }
  return v2;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (a2 != 7)
    return 2;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5 - *(double *)(*(_QWORD *)(a1 + 32) + 24);

  v7 = 0;
  while (v6 >= dbl_1D0E89F38[v7])
  {
    if (++v7 == 10)
    {
      v8 = 16.0;
      goto LABEL_10;
    }
  }
  if ((int)v7 <= 1)
    LODWORD(v7) = 1;
  v8 = dbl_1D0E89F38[(v7 - 1)];
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v10 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEventWithPropertyValues:value:", v14, v8);

  return 0;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a2 != 9)
    return 1;
  v2 = *(_QWORD *)(a1 + 32);
  result = 2;
  *(_QWORD *)(v2 + 48) = 2;
  return result;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    return 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return 2;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (a2 != 8)
    return 1;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 <= 4)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v6 + 3;

  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
