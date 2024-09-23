@implementation SBSystemGestureMetric

- (id)initForType:(unint64_t)a3 parentMetric:(id)a4
{
  SBSystemGestureMetric *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PETGoalConversionEventTracker *goalTracker;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id location;
  objc_super v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v51.receiver = self;
  v51.super_class = (Class)SBSystemGestureMetric;
  v6 = -[SBAnalyticsStateMachineEventHandler init](&v51, sel_init);
  if (v6)
  {
    objc_initWeak(&location, v6);
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 5, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 3, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 4, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke;
    v47[3] = &unk_1E8E9F280;
    objc_copyWeak(&v49, &location);
    v8 = v36;
    v48 = v8;
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:andDo:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:andDo:", 0, 5, 5, v47);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_2;
    v44[3] = &unk_1E8E9F280;
    objc_copyWeak(&v46, &location);
    v9 = v8;
    v45 = v9;
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:andDo:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:andDo:", 0, 3, 3, v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_3;
    v41[3] = &unk_1E8E9F280;
    objc_copyWeak(&v43, &location);
    v42 = v9;
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:andDo:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:andDo:", 0, 1, 1, v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 1, 2, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_4;
    v39[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v40, &location);
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:andDo:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:andDo:", 1, 3, 3, v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 1, 4, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 1, 5, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 2, 2, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_5;
    v37[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v38, &location);
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:andDo:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:andDo:", 2, 3, 3, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 2, 5, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAnalyticsStateMachineEdge edgeFromState:toState:uponGestureState:](SBAnalyticsStateMachineEdge, "edgeFromState:toState:uponGestureState:", 2, 4, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v35);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v34);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v33);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v32);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v31);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v30);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v29);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v28);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v27);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v26);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v25);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v24);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v10);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v11);
    SBAnalyticsNameForSystemGestureType(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 10; ++i)
    {
      NSStringFromAnalyticsLayoutLocation(i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

    }
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("location"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D80F30]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SGstart_%@"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SGend_%@"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), v18, v19, v20);
    goalTracker = v6->_goalTracker;
    v6->_goalTracker = (PETGoalConversionEventTracker *)v21;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v46);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalTracker, 0);
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 3);
    NSStringFromAnalyticsLayoutLocation(objc_msgSend(*(id *)(a1 + 32), "currentLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackGoalOpportunityEventWithConversion:propertyValues:", 1, v6);

  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 3);
    NSStringFromAnalyticsLayoutLocation(objc_msgSend(*(id *)(a1 + 32), "currentLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackGoalOpportunityEventWithConversion:propertyValues:", 0, v6);

  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "currentLocation");
    WeakRetained[4] = v3;
    v4 = (void *)WeakRetained[3];
    NSStringFromAnalyticsLayoutLocation(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackGoalOpportunityEventWithPropertyValues:", v6);

  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_4(uint64_t a1)
{
  unint64_t *WeakRetained;
  unint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    NSStringFromAnalyticsLayoutLocation(WeakRetained[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trackGoalConversionEventWithPropertyValues:", v5);

  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_5(uint64_t a1)
{
  unint64_t *WeakRetained;
  unint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    NSStringFromAnalyticsLayoutLocation(WeakRetained[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trackGoalConversionEventWithPropertyValues:", v5);

  }
}

@end
