@implementation SBMedusaDragAndDropMetric

uint64_t __33__SBMedusaDragAndDropMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  if (a2 == 28)
    return 1;
  if (a2 == 3)
  {
    objc_msgSend(a3, "eventPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

- (SBMedusaDragAndDropMetric)init
{
  SBMedusaDragAndDropMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PETGoalConversionEventTracker *medusaDropTracker;
  uint64_t v13;
  SBMedusaDragAndDropMetric *v14;
  void *v15;
  SBMedusaDragAndDropMetric *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  SBMedusaDragAndDropMetric *v21;
  _QWORD v22[4];
  SBMedusaDragAndDropMetric *v23;
  objc_super v24;
  _QWORD v25[3];
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[9];
  _QWORD v29[11];

  v29[9] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SBMedusaDragAndDropMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v24, sel_init);
  if (v2)
  {
    PETEventPropertyForLayoutLocations(CFSTR("location"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D80F20];
    v28[0] = &unk_1E91D1AA8;
    v28[1] = &unk_1E91D1AC0;
    v29[0] = CFSTR("Dock");
    v29[1] = CFSTR("Suggestions");
    v28[2] = &unk_1E91D1AD8;
    v28[3] = &unk_1E91D1AF0;
    v29[2] = CFSTR("Unknown");
    v29[3] = CFSTR("Spotlight");
    v28[4] = &unk_1E91D1B08;
    v28[5] = &unk_1E91D1B20;
    v29[4] = CFSTR("Home");
    v29[5] = CFSTR("StackConfiguration");
    v28[6] = &unk_1E91D1B38;
    v28[7] = &unk_1E91D1B50;
    v29[6] = CFSTR("AddWidgetSheet");
    v29[7] = CFSTR("AppLibrary");
    v28[8] = &unk_1E91D1B68;
    v29[8] = CFSTR("Today");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("dragStart"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = &unk_1E91D1AA8;
    v26[1] = &unk_1E91D1AF0;
    v6 = (void *)MEMORY[0x1E0D80F20];
    v27[0] = CFSTR("cancel");
    v27[1] = CFSTR("rSide");
    v26[2] = &unk_1E91D1AD8;
    v26[3] = &unk_1E91D1AC0;
    v27[2] = CFSTR("rPrimary");
    v27[3] = CFSTR("rSpace");
    v26[4] = &unk_1E91D1B08;
    v26[5] = &unk_1E91D1B20;
    v27[4] = CFSTR("rSideLeft");
    v27[5] = CFSTR("rSideRight");
    v26[6] = &unk_1E91D1B38;
    v27[6] = CFSTR("pip");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyWithName:enumMapping:", CFSTR("dropAction"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D80F30]);
    v25[0] = v19;
    v25[1] = v5;
    v25[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("MedusaDrop"), CFSTR("MedusaDropComplete"), v10);
    medusaDropTracker = v2->_medusaDropTracker;
    v2->_medusaDropTracker = (PETGoalConversionEventTracker *)v11;

    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __33__SBMedusaDragAndDropMetric_init__block_invoke;
    v22[3] = &unk_1E8E9E018;
    v14 = v2;
    v23 = v14;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v14, "addEdge:", v15);

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __33__SBMedusaDragAndDropMetric_init__block_invoke_2;
    v20[3] = &unk_1E8E9E018;
    v16 = v14;
    v21 = v16;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v16, "addEdge:", v17);

  }
  return v2;
}

uint64_t __33__SBMedusaDragAndDropMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (a2 != 30)
  {
    if (a2 != 32)
      return 1;
    objc_msgSend(a3, "eventPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDE0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v9 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BridgeLocationForSBSLocation(v6);
    if (v8)
    {
      v20[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v13;
      if (v8 > 0xA)
        v14 = 0;
      else
        v14 = qword_1D0E8B490[v8 - 1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      v19 = 1;
    }
    else
    {
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      v19 = 0;
    }
    objc_msgSend(v18, "trackGoalOpportunityEventWithConversion:propertyValues:", v19, v17);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medusaDropTracker, 0);
}

@end
