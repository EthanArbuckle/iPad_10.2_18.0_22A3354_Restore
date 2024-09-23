@implementation SBApplicationLayoutGestureMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PETScalarEventTracker *pinGestureCompletionTracker;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  PETScalarEventTracker *movePIPGestureCompletionTracker;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  PETScalarEventTracker *moveSideGestureCompletionTracker;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a3)
  {
    case 0x14uLL:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDA0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDA8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      pinGestureCompletionTracker = self->_pinGestureCompletionTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](pinGestureCompletionTracker, "trackEventWithPropertyValues:", v15);

      goto LABEL_9;
    case 0x15uLL:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD90]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD98]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      v21 = -[SBApplicationLayoutGestureMetric _moveActionForInitialFloatingConfig:finalConfig:](self, "_moveActionForInitialFloatingConfig:finalConfig:", v18, v20);
      if (!v21)
        goto LABEL_9;
      movePIPGestureCompletionTracker = self->_movePIPGestureCompletionTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v23;
      v16 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](movePIPGestureCompletionTracker, "trackEventWithPropertyValues:", v24);

      break;
    case 0x16uLL:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEC0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABEC8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      v29 = -[SBApplicationLayoutGestureMetric _moveActionForInitialSpaceConfig:finalConfig:](self, "_moveActionForInitialSpaceConfig:finalConfig:", v26, v28);
      if (!v29)
        goto LABEL_9;
      moveSideGestureCompletionTracker = self->_moveSideGestureCompletionTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](moveSideGestureCompletionTracker, "trackEventWithPropertyValues:", v32);

      v16 = 1;
      break;
    case 0x17uLL:
      -[PETScalarEventTracker trackEventWithPropertyValues:](self->_unpinGestureCompletionTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
LABEL_9:
      v16 = 1;
      break;
    default:
      v16 = 0;
      break;
  }

  return v16;
}

- (SBApplicationLayoutGestureMetric)init
{
  SBApplicationLayoutGestureMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PETScalarEventTracker *pinGestureCompletionTracker;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  PETScalarEventTracker *movePIPGestureCompletionTracker;
  id v20;
  void *v21;
  uint64_t v22;
  PETScalarEventTracker *moveSideGestureCompletionTracker;
  id v24;
  uint64_t v25;
  PETScalarEventTracker *unpinGestureCompletionTracker;
  objc_super v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[2];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBApplicationLayoutGestureMetric;
  v2 = -[SBApplicationLayoutGestureMetric init](&v28, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v36[0] = MEMORY[0x1E0C9AAB0];
    v36[1] = MEMORY[0x1E0C9AAA0];
    v37[0] = CFSTR("DOWN");
    v37[1] = CFSTR("UP");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("swipeDirection"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = &unk_1E91D05C0;
    v34[1] = &unk_1E91D05D8;
    v35[0] = CFSTR("none");
    v35[1] = CFSTR("pinLeft");
    v34[2] = &unk_1E91D05F0;
    v34[3] = &unk_1E91D0608;
    v35[2] = CFSTR("pinRight");
    v35[3] = CFSTR("replaceSide");
    v6 = (void *)MEMORY[0x1E0D80F20];
    v34[4] = &unk_1E91D0620;
    v35[4] = CFSTR("replacePrimary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyWithName:enumMapping:", CFSTR("completionAction"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D80F38]);
    v33[0] = v5;
    v33[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("FloatingAppPin"), v10, &unk_1E91CE3B0);
    pinGestureCompletionTracker = v2->_pinGestureCompletionTracker;
    v2->_pinGestureCompletionTracker = (PETScalarEventTracker *)v11;

    v13 = (void *)MEMORY[0x1E0D80F20];
    v31[0] = &unk_1E91D0638;
    v31[1] = &unk_1E91D0650;
    v32[0] = CFSTR("unknown");
    v32[1] = CFSTR("moveLeft");
    v31[2] = &unk_1E91D0668;
    v31[3] = &unk_1E91D0680;
    v32[2] = CFSTR("moveRight");
    v32[3] = CFSTR("stashLeft");
    v31[4] = &unk_1E91D0698;
    v31[5] = &unk_1E91D06B0;
    v32[4] = CFSTR("stashRight");
    v32[5] = CFSTR("unstash");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyWithName:enumMapping:", CFSTR("moveAction"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0D80F38]);
    v30 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("FloatingAppMove"), v17, &unk_1E91CE3C8);
    movePIPGestureCompletionTracker = v2->_movePIPGestureCompletionTracker;
    v2->_movePIPGestureCompletionTracker = (PETScalarEventTracker *)v18;

    v20 = objc_alloc(MEMORY[0x1E0D80F38]);
    v29 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("SideAppMove"), v21, &unk_1E91CE3E0);
    moveSideGestureCompletionTracker = v2->_moveSideGestureCompletionTracker;
    v2->_moveSideGestureCompletionTracker = (PETScalarEventTracker *)v22;

    v24 = objc_alloc(MEMORY[0x1E0D80F38]);
    v25 = objc_msgSend(v24, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("SideAppUnpin"), MEMORY[0x1E0C9AA60], &unk_1E91CE3F8);
    unpinGestureCompletionTracker = v2->_unpinGestureCompletionTracker;
    v2->_unpinGestureCompletionTracker = (PETScalarEventTracker *)v25;

  }
  return v2;
}

- (unint64_t)_moveActionForInitialFloatingConfig:(int64_t)a3 finalConfig:(int64_t)a4
{
  unint64_t result;

  result = 0;
  if (a3 != a4 && a3 && a4)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      if (SBFloatingConfigurationIsStashed(a3))
        return 5;
    }
    else
    {
      result = a4;
      if ((unint64_t)(a4 - 1) < 4)
        return result;
    }
    return 0;
  }
  return result;
}

- (unint64_t)_moveActionForInitialSpaceConfig:(int64_t)a3 finalConfig:(int64_t)a4
{
  unint64_t result;
  unint64_t v5;

  result = 0;
  v5 = a3 - 2;
  if ((unint64_t)a3 >= 2 && (unint64_t)a4 >= 2)
  {
    if (a3 != 3 && a3 == a4 || v5 > 2)
      return 0;
    else
      return qword_1D0E88DD8[v5];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveSideGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_movePIPGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_unpinGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_pinGestureCompletionTracker, 0);
}

@end
