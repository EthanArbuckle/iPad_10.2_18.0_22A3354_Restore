@implementation SBBreadcrumbMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PETGoalConversionEventTracker *v11;
  void *v12;
  void *v13;
  PETGoalConversionEventTracker *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PETGoalConversionEventTracker *leftTracker;
  PETGoalConversionEventTracker *v20;
  BOOL v21;
  PETGoalConversionEventTracker *rightTracker;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (a3 == 16)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABCF8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v18 == 2)
    {
      rightTracker = self->_rightTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = rightTracker;
    }
    else
    {
      if (v18 != 1)
      {
LABEL_14:
        v21 = 1;
        goto LABEL_15;
      }
      leftTracker = self->_leftTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = leftTracker;
    }
    -[PETGoalConversionEventTracker trackGoalConversionEventWithPropertyValues:](v20, "trackGoalConversionEventWithPropertyValues:", v16);
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 15)
  {
    if (v8)
    {
      v11 = self->_leftTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](v11, "trackGoalOpportunityEventWithPropertyValues:", v13);

    }
    if (!v10)
      goto LABEL_14;
    v14 = self->_rightTracker;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](v14, "trackGoalOpportunityEventWithPropertyValues:", v16);
    goto LABEL_13;
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (SBBreadcrumbMetric)init
{
  SBBreadcrumbMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PETGoalConversionEventTracker *leftTracker;
  id v10;
  void *v11;
  uint64_t v12;
  PETGoalConversionEventTracker *rightTracker;
  objc_super v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBBreadcrumbMetric;
  v2 = -[SBBreadcrumbMetric init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v18[0] = &unk_1E91D1EC8;
    v18[1] = &unk_1E91D1EE0;
    v19[0] = CFSTR("App");
    v19[1] = CFSTR("None");
    v18[2] = &unk_1E91D1EF8;
    v18[3] = &unk_1E91D1F10;
    v19[2] = CFSTR("Unknown");
    v19[3] = CFSTR("Siri");
    v18[4] = &unk_1E91D1F28;
    v18[5] = &unk_1E91D1F40;
    v19[4] = CFSTR("Spotlight");
    v19[5] = CFSTR("AppLinkEscape");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("type"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D80F30]);
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("LeftBreadcrumbShown"), CFSTR("LeftBreadcrumbTapped"), v7);
    leftTracker = v2->_leftTracker;
    v2->_leftTracker = (PETGoalConversionEventTracker *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D80F30]);
    v16 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("RightBreadcrumbShown"), CFSTR("RightBreadcrumbTapped"), v11);
    rightTracker = v2->_rightTracker;
    v2->_rightTracker = (PETGoalConversionEventTracker *)v12;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTracker, 0);
  objc_storeStrong((id *)&self->_leftTracker, 0);
}

@end
