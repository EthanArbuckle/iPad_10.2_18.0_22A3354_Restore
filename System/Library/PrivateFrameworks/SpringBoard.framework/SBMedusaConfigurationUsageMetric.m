@implementation SBMedusaConfigurationUsageMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;

  objc_msgSend(a4, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 24)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEA0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (self->_isPIPVideoActive == v19)
    {
LABEL_36:
      v24 = 1;
      goto LABEL_37;
    }
    if (!self->_isPIPVideoActive || (v19 & 1) != 0)
    {
      if (!self->_isPIPVideoActive && v19)
      {
        objc_msgSend(v7, "timestamp");
        self->_pipVideoActivationTimestamp = v26;
      }
    }
    else
    {
      objc_msgSend(v7, "timestamp");
      v20 = 0;
      v22 = v21 - self->_pipVideoActivationTimestamp;
      while (v22 >= dbl_1D0E8AD98[v20])
      {
        if (++v20 == 13)
        {
          v23 = 3840.0;
          goto LABEL_33;
        }
      }
      if ((int)v20 <= 1)
        LODWORD(v20) = 1;
      v23 = dbl_1D0E8AD98[(v20 - 1)];
LABEL_33:
      -[PETDistributionEventTracker trackEventWithPropertyValues:value:](self->_pipVideoSessionTimeTracker, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], v23);
    }
    self->_isPIPVideoActive = v19;
LABEL_35:
    -[SBMedusaConfigurationUsageMetric _trackMedusaConfigChange](self, "_trackMedusaConfigChange");
    goto LABEL_36;
  }
  if (a3 == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE68]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (self->_currentSpaceConfig != v9)
      self->_currentSpaceConfig = v9;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (self->_currentFloatingConfig != v11)
    {
      v12 = -[SBMedusaConfigurationUsageMetric _floatingAppIsActiveForConfiguration:](self, "_floatingAppIsActiveForConfiguration:");
      v13 = -[SBMedusaConfigurationUsageMetric _floatingAppIsActiveForConfiguration:](self, "_floatingAppIsActiveForConfiguration:", v11);
      if (!v12 || v13)
      {
        if (!v12 && v13)
        {
          objc_msgSend(v7, "timestamp");
          self->_floatingAppActivationTimestamp = v25;
        }
      }
      else
      {
        objc_msgSend(v7, "timestamp");
        v14 = 0;
        v16 = v15 - self->_floatingAppActivationTimestamp;
        while (v16 >= dbl_1D0E8AD98[v14])
        {
          if (++v14 == 13)
          {
            v17 = 3840.0;
            goto LABEL_28;
          }
        }
        if ((int)v14 <= 1)
          LODWORD(v14) = 1;
        v17 = dbl_1D0E8AD98[(v14 - 1)];
LABEL_28:
        -[PETDistributionEventTracker trackEventWithPropertyValues:value:](self->_floatingAppSessionTimeTracker, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], v17);
      }
      self->_currentFloatingConfig = v11;
    }
    goto LABEL_35;
  }
  v24 = 0;
LABEL_37:

  return v24;
}

- (void)_trackMedusaConfigChange
{
  PETScalarEventTracker *medusaUsageTracker;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  medusaUsageTracker = self->_medusaUsageTracker;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentSpaceConfig);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentFloatingConfig, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPIPVideoActive);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](medusaUsageTracker, "trackEventWithPropertyValues:", v7);

}

- (SBMedusaConfigurationUsageMetric)init
{
  SBMedusaConfigurationUsageMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  PETScalarEventTracker *medusaUsageTracker;
  id v16;
  uint64_t v17;
  uint64_t v18;
  PETDistributionEventTracker *floatingAppSessionTimeTracker;
  uint64_t v20;
  PETDistributionEventTracker *pipVideoSessionTimeTracker;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[7];

  v30[5] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)SBMedusaConfigurationUsageMetric;
  v2 = -[SBMedusaConfigurationUsageMetric init](&v23, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v29[0] = &unk_1E91D1568;
    v29[1] = &unk_1E91D1580;
    v30[0] = CFSTR("undefined");
    v30[1] = CFSTR("full");
    v29[2] = &unk_1E91D1598;
    v29[3] = &unk_1E91D15B0;
    v30[2] = CFSTR("halfHalf");
    v30[3] = CFSTR("narrowWide");
    v29[4] = &unk_1E91D15C8;
    v30[4] = CFSTR("wideNarrow");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("space"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D80F20];
    v27[0] = &unk_1E91D1568;
    v27[1] = &unk_1E91D1580;
    v28[0] = CFSTR("undefined");
    v28[1] = CFSTR("left");
    v27[2] = &unk_1E91D15B0;
    v27[3] = &unk_1E91D1598;
    v28[2] = CFSTR("right");
    v28[3] = CFSTR("stashed left");
    v27[4] = &unk_1E91D15C8;
    v28[4] = CFSTR("stashed right");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyWithName:enumMapping:", CFSTR("floating"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D80F20];
    v25[0] = MEMORY[0x1E0C9AAB0];
    v25[1] = MEMORY[0x1E0C9AAA0];
    v26[0] = CFSTR("Y");
    v26[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyWithName:enumMapping:", CFSTR("pipVideo"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0D80F38]);
    v24[0] = v5;
    v24[1] = v8;
    v24[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("MedusaUsage"), v13, &unk_1E91CEC38);
    medusaUsageTracker = v2->_medusaUsageTracker;
    v2->_medusaUsageTracker = (PETScalarEventTracker *)v14;

    v16 = objc_alloc(MEMORY[0x1E0D80F18]);
    v17 = MEMORY[0x1E0C9AA60];
    v18 = objc_msgSend(v16, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("FloatingSessionTime"), MEMORY[0x1E0C9AA60]);
    floatingAppSessionTimeTracker = v2->_floatingAppSessionTimeTracker;
    v2->_floatingAppSessionTimeTracker = (PETDistributionEventTracker *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("PIPVideoSessionTime"), v17);
    pipVideoSessionTimeTracker = v2->_pipVideoSessionTimeTracker;
    v2->_pipVideoSessionTimeTracker = (PETDistributionEventTracker *)v20;

  }
  return v2;
}

- (BOOL)_floatingAppIsActiveForConfiguration:(int64_t)a3
{
  BOOL result;

  result = SBFloatingConfigurationIsStashed(a3);
  if (!a3)
    return 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipVideoSessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_floatingAppSessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_medusaUsageTracker, 0);
}

@end
