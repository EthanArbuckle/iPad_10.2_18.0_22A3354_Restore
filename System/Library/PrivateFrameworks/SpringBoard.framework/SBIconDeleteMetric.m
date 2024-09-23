@implementation SBIconDeleteMetric

uint64_t __26__SBIconDeleteMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a2 != 18)
    return 0;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD00]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD08]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v8, "unsignedIntegerValue");

  return 1;
}

- (SBIconDeleteMetric)init
{
  SBIconDeleteMetric *result;
  uint64_t v3;
  SBIconDeleteMetric *v4;
  SBIconDeleteMetric *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  PETDistributionEventTracker *tracker;
  void *v22;
  void *v23;
  SBIconDeleteMetric *v24;
  _QWORD v25[4];
  SBIconDeleteMetric *v26;
  _QWORD v27[4];
  SBIconDeleteMetric *v28;
  objc_super v29;
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SBIconDeleteMetric;
  result = -[SBAnalyticsStateMachineEventHandler init](&v29, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __26__SBIconDeleteMetric_init__block_invoke;
    v27[3] = &unk_1E8E9E018;
    v24 = result;
    v4 = result;
    v28 = v4;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v3;
    v25[1] = 3221225472;
    v25[2] = __26__SBIconDeleteMetric_init__block_invoke_2;
    v25[3] = &unk_1E8E9E018;
    v5 = v4;
    v26 = v5;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v5, "addEdge:", v23);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v5, "addEdge:", v22);
    v6 = (void *)MEMORY[0x1E0D80F20];
    v7 = MEMORY[0x1E0C9AAB0];
    v8 = MEMORY[0x1E0C9AAA0];
    v35[0] = MEMORY[0x1E0C9AAB0];
    v35[1] = MEMORY[0x1E0C9AAA0];
    v36[0] = CFSTR("Y");
    v36[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyWithName:enumMapping:", CFSTR("cancel"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D80F20];
    v33[0] = v7;
    v33[1] = v8;
    v34[0] = CFSTR("Y");
    v34[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertyWithName:enumMapping:", CFSTR("delete"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0D80F20];
    v31[0] = v7;
    v31[1] = v8;
    v32[0] = CFSTR("Y");
    v32[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "propertyWithName:enumMapping:", CFSTR("removeDock"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PETEventPropertyForIconLocation(CFSTR("Location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D80F18]);
    v30[0] = v10;
    v30[1] = v13;
    v30[2] = v16;
    v30[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("deleteIcon"), v19, &unk_1E91CDEE8);
    tracker = v5->_tracker;
    v5->_tracker = (PETDistributionEventTracker *)v20;

    return v24;
  }
  return result;
}

uint64_t __26__SBIconDeleteMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;

  if (a2 != 19)
    return 1;
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[5];
  objc_msgSend(v7, "_propertyValuesForTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackEventWithPropertyValues:value:", v9, (double)v6);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), (id)*MEMORY[0x1E0DAA9E0]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;

  return 0;
}

- (id)_propertyValuesForTracker
{
  unint64_t presentedOptions;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *location;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  presentedOptions = self->_presentedOptions;
  v4 = (presentedOptions >> 1) & 1;
  v5 = (presentedOptions >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", presentedOptions & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  v12[2] = v8;
  v12[3] = location;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
