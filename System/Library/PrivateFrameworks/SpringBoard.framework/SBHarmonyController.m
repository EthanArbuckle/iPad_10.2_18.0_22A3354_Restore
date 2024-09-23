@implementation SBHarmonyController

- (SBHarmonySettings)harmonySettings
{
  SBHarmonySettings *harmonySettings;
  SBHarmonySettings *v4;
  SBHarmonySettings *v5;

  harmonySettings = self->_harmonySettings;
  if (!harmonySettings)
  {
    v4 = -[PTSettings initWithDefaultValues]([SBHarmonySettings alloc], "initWithDefaultValues");
    v5 = self->_harmonySettings;
    self->_harmonySettings = v4;

    harmonySettings = self->_harmonySettings;
  }
  return harmonySettings;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1)
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_160);
  return (id)sharedInstance___sharedInstance_13;
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  double v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v6 = a4;
  if (-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke;
    v14[3] = &unk_1E8EA0AF0;
    v14[4] = self;
    v16 = a3;
    v8 = v6;
    v15 = v8;
    v9 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v14);
    objc_msgSend(v8, "delay");
    if (v10 <= 0.0)
    {
      v9[2](v9);
    }
    else
    {
      v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke_2;
      v12[3] = &unk_1E8E9E8D0;
      v13 = v9;
      dispatch_after(v11, MEMORY[0x1E0C80D38], v12);

    }
  }

}

- (void)setWhitePointAdaptivityStyleWithStyles:(id)a3 animationSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD);
  double v18;
  dispatch_time_t v19;
  _QWORD block[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  if (-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
  {
    v8 = objc_msgSend(v6, "count");
    if (v8)
    {
      v9 = v8;
      if (v8 == 1)
      {
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHarmonyController setWhitePointAdaptivityStyle:animationSettings:](self, "setWhitePointAdaptivityStyle:animationSettings:", objc_msgSend(v10, "integerValue"), v7);

      }
      else
      {
        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v29 = 0;
        v11 = 0;
        v29 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");
          if (v13 < 5)
            v14 = v13 + 1;
          else
            v14 = 0;
          *(_DWORD *)(v27[3] + 4 * v11) = v14;

          ++v11;
        }
        while (v9 != v11);
        v15 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke;
        v22[3] = &unk_1E8EAE9C8;
        v22[4] = self;
        v24 = &v26;
        v25 = v9;
        v16 = v7;
        v23 = v16;
        v17 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v22);
        objc_msgSend(v16, "delay");
        if (v18 <= 0.0)
        {
          v17[2](v17);
        }
        else
        {
          v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
          block[0] = v15;
          block[1] = 3221225472;
          block[2] = __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke_2;
          block[3] = &unk_1E8E9E8D0;
          v21 = v17;
          dispatch_after(v19, MEMORY[0x1E0C80D38], block);

        }
        _Block_object_dispose(&v26, 8);
      }
    }
  }

}

- (void)transitionFromWhitePointAdaptivityStyleWithStyles:(id)a3 toWhitePointAdaptivityStyleWithStyles:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  void (**v29)(_QWORD);
  double v30;
  dispatch_time_t v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
  {
    v14 = objc_msgSend(v11, "count");
    v15 = objc_msgSend(v12, "count");
    if (v14 | v15)
    {
      v16 = v15;
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0;
      if (v14)
      {
        v17 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
        v18 = 0;
        v46[3] = (uint64_t)v17;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");
          if (v20 < 5)
            v21 = v20 + 1;
          else
            v21 = 0;
          *(_DWORD *)(v46[3] + 4 * v18) = v21;

          ++v18;
        }
        while (v14 != v18);
      }
      if (v16)
      {
        v22 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
        v23 = 0;
        v42[3] = (uint64_t)v22;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "integerValue");
          if (v25 < 5)
            v26 = v25 + 1;
          else
            v26 = 0;
          *(_DWORD *)(v42[3] + 4 * v23) = v26;

          ++v23;
        }
        while (v16 != v23);
      }
      v27 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke;
      v34[3] = &unk_1E8EAE9F0;
      v34[4] = self;
      v36 = &v45;
      v37 = &v41;
      v38 = v14;
      v39 = v16;
      v40 = a6;
      v28 = v13;
      v35 = v28;
      v29 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v34);
      objc_msgSend(v28, "delay");
      if (v30 <= 0.0)
      {
        v29[2](v29);
      }
      else
      {
        v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
        v32[0] = v27;
        v32[1] = 3221225472;
        v32[2] = __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke_2;
        v32[3] = &unk_1E8E9E8D0;
        v33 = v29;
        dispatch_after(v31, MEMORY[0x1E0C80D38], v32);

      }
      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v45, 8);
    }
  }

}

- (BOOL)supportsWhitePointAdaptation
{
  return self->_supportsWhitePointAdaptation;
}

void __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_adaptationClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 < 5)
    v4 = (v3 + 1);
  else
    v4 = 0;
  objc_msgSend(v2, "duration");
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setAdaptationMode:withPeriod:", v4, v5);

}

void __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float updated;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "_adaptationClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(unsigned int *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v6 = *(unsigned int *)(a1 + 72);
  updated = SBSampleValueWithWhitePointAdaptationInteractiveUpdateTimingFunction(*(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "duration");
  *(float *)&v9 = v8;
  *(float *)&v8 = updated;
  objc_msgSend(v2, "animateFromWeakestAdaptationModeInArray:withLength:toWeakestInArray:withLength:withProgress:andPeriod:", v3, v4, v5, v6, v8, v9);

  if (*(_QWORD *)(a1 + 64))
  {
    free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)_adaptationClient
{
  return (id)-[CBClient adaptationClient](self->_client, "adaptationClient");
}

void __37__SBHarmonyController_sharedInstance__block_invoke()
{
  SBHarmonyController *v0;
  void *v1;

  v0 = objc_alloc_init(SBHarmonyController);
  v1 = (void *)sharedInstance___sharedInstance_13;
  sharedInstance___sharedInstance_13 = (uint64_t)v0;

}

- (SBHarmonyController)init
{
  SBHarmonyController *v2;
  CBClient *v3;
  CBClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHarmonyController;
  v2 = -[SBHarmonyController init](&v6, sel_init);
  if (v2)
  {
    v3 = (CBClient *)objc_alloc_init(MEMORY[0x1E0D15728]);
    client = v2->_client;
    v2->_client = v3;

    v2->_supportsWhitePointAdaptation = objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation");
    v2->_supportsBlueLightReduction = objc_msgSend(MEMORY[0x1E0D15720], "supportsBlueLightReduction");
    *(int64x2_t *)&v2->_suppressedWhitePointAdaptationEnabled = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return v2;
}

- (BOOL)isWhitePointAdaptationEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation");
  if (v3)
  {
    -[SBHarmonyController _adaptationClient](self, "_adaptationClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "getEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setWhitePointAdaptationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
  {
    -[SBHarmonyController _adaptationClient](self, "_adaptationClient");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (int64_t)whitePointAdaptivityStyle
{
  void *v3;
  unsigned int v4;
  int64_t v5;

  if (!-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
    return -1;
  -[SBHarmonyController _adaptationClient](self, "_adaptationClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getAdaptationMode");
  if (v4 > 6)
    v5 = 0;
  else
    v5 = qword_1D0E89A20[v4];

  return v5;
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  -[SBHarmonyController setWhitePointAdaptivityStyle:animationSettings:](self, "setWhitePointAdaptivityStyle:animationSettings:", a3, 0);
}

uint64_t __70__SBHarmonyController_setWhitePointAdaptivityStyle_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "_adaptationClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(unsigned int *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "duration");
  *(float *)&v5 = v5;
  objc_msgSend(v2, "setWeakestAdaptationModeFromArray:withLength:andPeriod:", v3, v4, v5);

  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

uint64_t __80__SBHarmonyController_setWhitePointAdaptivityStyleWithStyles_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __157__SBHarmonyController_transitionFromWhitePointAdaptivityStyleWithStyles_toWhitePointAdaptivityStyleWithStyles_fromPercentage_toPercentage_animationSettings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)supportsBlueLightReduction
{
  return self->_supportsBlueLightReduction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_harmonySettings, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (float)whitePointAdaptationStrengthForWhitePointAdaptivityStyle:(int64_t)a3
{
  void *v5;
  int v6;
  int64_t v7;
  _DWORD v9[6];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
    return NAN;
  -[SBHarmonyController _adaptationClient](self, "_adaptationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getStrengths:nStrengths:", v9, 6);

  if (!v6)
    return NAN;
  if ((unint64_t)a3 < 5)
    v7 = a3 + 1;
  else
    v7 = 0;
  return *(float *)&v9[v7];
}

- (void)setWhitePointAdaptationStrength:(float)a3 forWhitePointAdaptivityStyle:(int64_t)a4
{
  int v6;
  void *v7;
  int v8;
  float v9;

  v9 = a3;
  if (-[SBHarmonyController supportsWhitePointAdaptation](self, "supportsWhitePointAdaptation"))
  {
    if ((unint64_t)a4 < 5)
      v6 = a4 + 1;
    else
      v6 = 0;
    v8 = v6;
    -[SBHarmonyController _adaptationClient](self, "_adaptationClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overrideStrengths:forModes:nModes:", &v9, &v8, 1);

  }
}

@end
