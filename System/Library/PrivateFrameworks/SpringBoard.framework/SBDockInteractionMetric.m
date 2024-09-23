@implementation SBDockInteractionMetric

uint64_t __31__SBDockInteractionMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2 == 3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v10);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      v15 = *MEMORY[0x1E0DABD20];
      v16 = *MEMORY[0x1E0DAB660];
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "objectForKeyedSubscript:", v15, (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v16);

          if ((v19 & 1) != 0)
          {

            v9 = 2;
            goto LABEL_16;
          }
          ++v17;
        }
        while (v13 != v17);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }

    goto LABEL_14;
  }
  if (a2 != 25
    || (objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD68]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v7,
        v8))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_16;
  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (SBDockInteractionMetric)init
{
  SBDockInteractionMetric *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  PETGoalConversionEventTracker *swipeInTracker;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  PETGoalConversionEventTracker *dismissTracker;
  uint64_t v15;
  SBDockInteractionMetric *v16;
  void *v17;
  SBDockInteractionMetric *v18;
  void *v19;
  SBDockInteractionMetric *v20;
  void *v21;
  SBDockInteractionMetric *v22;
  void *v23;
  _QWORD v25[4];
  SBDockInteractionMetric *v26;
  _QWORD v27[4];
  SBDockInteractionMetric *v28;
  _QWORD v29[4];
  SBDockInteractionMetric *v30;
  _QWORD v31[4];
  SBDockInteractionMetric *v32;
  objc_super v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)SBDockInteractionMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v33, sel_init);
  if (v2)
  {
    PETEventPropertyForLayoutLocations(CFSTR("location"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D80F30]);
    v37[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("dockBeginSwipeIn"), CFSTR("dockCompleteSwipeIn"), v5, &unk_1E91CE8C0);
    swipeInTracker = v2->_swipeInTracker;
    v2->_swipeInTracker = (PETGoalConversionEventTracker *)v6;

    v8 = (void *)MEMORY[0x1E0D80F20];
    v35[0] = &unk_1E91D0E90;
    v35[1] = &unk_1E91D0EA8;
    v36[0] = CFSTR("tap");
    v36[1] = CFSTR("swipe");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyWithName:enumMapping:", CFSTR("dismissMethod"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D80F30]);
    v34 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("dockBeginManualDismiss"), CFSTR("dockCompleteManualDismiss"), v12);
    dismissTracker = v2->_dismissTracker;
    v2->_dismissTracker = (PETGoalConversionEventTracker *)v13;

    v15 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __31__SBDockInteractionMetric_init__block_invoke;
    v31[3] = &unk_1E8E9E018;
    v16 = v2;
    v32 = v16;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v16, "addEdge:", v17);

    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __31__SBDockInteractionMetric_init__block_invoke_2;
    v29[3] = &unk_1E8E9E018;
    v18 = v16;
    v30 = v18;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v18, "addEdge:", v19);

    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __31__SBDockInteractionMetric_init__block_invoke_3;
    v27[3] = &unk_1E8E9E018;
    v20 = v18;
    v28 = v20;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 2, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v20, "addEdge:", v21);

    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __31__SBDockInteractionMetric_init__block_invoke_4;
    v25[3] = &unk_1E8E9E018;
    v22 = v20;
    v26 = v22;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 3, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v22, "addEdge:", v23);

  }
  return v2;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2 != 25)
  {
LABEL_5:
    v13 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 != 1)
  {
    if (v8 == 2)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v9 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trackGoalOpportunityEventWithConversion:propertyValues:", 0, v12);
      v13 = 0;
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_5;
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v14 + 40) != 6)
  {
    v15 = *(void **)(v14 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackGoalOpportunityEventWithConversion:propertyValues:", 1, v12);
    v13 = 2;
    goto LABEL_9;
  }
  v13 = 2;
LABEL_10:

  return v13;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2 == 3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      v14 = *MEMORY[0x1E0DABD20];
      v15 = *MEMORY[0x1E0DAB660];
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "objectForKeyedSubscript:", v14, (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v15);

          if ((v18 & 1) != 0)
          {

            goto LABEL_18;
          }
          ++v16;
        }
        while (v12 != v16);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }

    goto LABEL_16;
  }
  if (a2 == 27)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trackGoalOpportunityEventWithConversion:propertyValues:", 1, &unk_1E91CE8D8);
LABEL_16:
    v9 = 0;
    goto LABEL_19;
  }
  if (a2 != 26
    || (objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD68]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v7,
        v8))
  {
LABEL_18:
    v9 = 2;
  }
  else
  {
    v9 = 3;
  }
LABEL_19:

  return v9;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a3, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2 != 26)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trackGoalOpportunityEventWithConversion:propertyValues:", 0, &unk_1E91CE908);
    v9 = 2;
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trackGoalOpportunityEventWithConversion:propertyValues:", 1, &unk_1E91CE8F0);
    v9 = 0;
  }
  else
  {
LABEL_5:
    v9 = 3;
  }
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTracker, 0);
  objc_storeStrong((id *)&self->_swipeInTracker, 0);
}

@end
