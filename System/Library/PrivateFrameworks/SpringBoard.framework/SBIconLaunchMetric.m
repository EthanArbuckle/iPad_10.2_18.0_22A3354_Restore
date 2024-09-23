@implementation SBIconLaunchMetric

uint64_t __26__SBIconLaunchMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;

  if (a2 != 9)
    return 0;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_processAndReportTappedEventPayload:", v4);

  return 1;
}

uint64_t __26__SBIconLaunchMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  if (a2 == 3)
  {
    objc_msgSend(a3, "eventPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

uint64_t __26__SBIconLaunchMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a2 == 9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "eventPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_processAndReportTappedEventPayload:", v8);
    v9 = 1;
  }
  else
  {
    if (a2 != 10)
    {
      v9 = 1;
      goto LABEL_7;
    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "eventPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_processAndReportLaunchedEventPayload:", v8);
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (void)_processAndReportLaunchedEventPayload:(id)a3
{
  PETGoalConversionEventTracker *trackerV1;
  void *v5;
  NSString *iconLocationValue;
  void *v7;
  PETGoalConversionEventTracker *trackerV2;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  trackerV1 = self->_trackerV1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFolder);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  iconLocationValue = self->_iconLocationValue;
  v13[0] = v5;
  v13[1] = iconLocationValue;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETGoalConversionEventTracker trackGoalConversionEventWithPropertyValues:](trackerV1, "trackGoalConversionEventWithPropertyValues:", v7);

  trackerV2 = self->_trackerV2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFolder);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_layoutLocation, v9, self->_iconLocationValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETGoalConversionEventTracker trackGoalConversionEventWithPropertyValues:](trackerV2, "trackGoalConversionEventWithPropertyValues:", v11);

}

- (void)_processAndReportTappedEventPayload:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *iconLocationValue;
  PETGoalConversionEventTracker *trackerV1;
  void *v11;
  NSString *v12;
  void *v13;
  PETGoalConversionEventTracker *trackerV2;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DABE00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isFolder = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PETStringValueForIconLocation(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  iconLocationValue = self->_iconLocationValue;
  self->_iconLocationValue = v8;

  trackerV1 = self->_trackerV1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFolder);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_iconLocationValue;
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](trackerV1, "trackGoalOpportunityEventWithPropertyValues:", v13);

  trackerV2 = self->_trackerV2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFolder);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_layoutLocation, v15, self->_iconLocationValue);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](trackerV2, "trackGoalOpportunityEventWithPropertyValues:", v17);

}

- (SBIconLaunchMetric)init
{
  SBIconLaunchMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PETGoalConversionEventTracker *trackerV1;
  id v12;
  void *v13;
  uint64_t v14;
  PETGoalConversionEventTracker *trackerV2;
  uint64_t v16;
  SBIconLaunchMetric *v17;
  void *v18;
  SBIconLaunchMetric *v19;
  void *v20;
  SBIconLaunchMetric *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  SBIconLaunchMetric *v26;
  _QWORD v27[4];
  SBIconLaunchMetric *v28;
  _QWORD v29[4];
  SBIconLaunchMetric *v30;
  objc_super v31;
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)SBIconLaunchMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v31, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v34[0] = MEMORY[0x1E0C9AAA0];
    v34[1] = MEMORY[0x1E0C9AAB0];
    v35[0] = CFSTR("App");
    v35[1] = CFSTR("Folder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("Type"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PETEventPropertyForIconLocation(CFSTR("Location"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PETEventPropertyForIconLocation(CFSTR("iconLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PETEventPropertyForLayoutLocations(CFSTR("location"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D80F30]);
    v33[0] = v5;
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("iconTapped"), CFSTR("iconLaunched"), v9);
    trackerV1 = v2->_trackerV1;
    v2->_trackerV1 = (PETGoalConversionEventTracker *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D80F30]);
    v32[0] = v5;
    v32[1] = v6;
    v32[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("iconTappedv2"), CFSTR("iconLaunchedv2"), v13);
    trackerV2 = v2->_trackerV2;
    v2->_trackerV2 = (PETGoalConversionEventTracker *)v14;

    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __26__SBIconLaunchMetric_init__block_invoke;
    v29[3] = &unk_1E8E9E018;
    v17 = v2;
    v30 = v17;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __26__SBIconLaunchMetric_init__block_invoke_2;
    v27[3] = &unk_1E8E9E018;
    v19 = v17;
    v28 = v19;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __26__SBIconLaunchMetric_init__block_invoke_3;
    v25[3] = &unk_1E8E9E018;
    v21 = v19;
    v26 = v21;
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v21, "addEdge:", v18);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v21, "addEdge:", v20);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v21, "addEdge:", v22);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLocationValue, 0);
  objc_storeStrong((id *)&self->_trackerV2, 0);
  objc_storeStrong((id *)&self->_trackerV1, 0);
}

@end
