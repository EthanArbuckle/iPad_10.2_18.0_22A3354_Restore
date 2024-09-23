@implementation SBInteractionAfterWakeMetric

uint64_t __36__SBInteractionAfterWakeMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 37
    && (objc_msgSend(v5, "eventPayload"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABFD8]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "unsignedIntegerValue"),
        v8,
        v7,
        v9 == 26))
  {
    objc_msgSend(WeakRetained, "_trackUnlockOpportunity");
    objc_msgSend(v5, "eventPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    *((_QWORD *)WeakRetained + 5) = v11;

    *((_QWORD *)WeakRetained + 6) = 0;
    *((_BYTE *)WeakRetained + 58) = 0;
    *((_WORD *)WeakRetained + 28) = 0;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_determineIfShouldReport
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  BOOL v15;
  void *v17;
  id v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!os_variant_has_internal_content())
    return 1;
  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountType:", v3);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v17 = v3;
    v18 = v2;
    v20 = *(_QWORD *)v26;
    v6 = *MEMORY[0x1E0C8F1C8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "objectForKeyedSubscript:", v6, v17, v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "allKeys");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
              v9 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v9 = 0;
            }
          }
        }
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v14, "hasSuffix:", CFSTR("apple.com")))
              {
                v11 = v14;
                goto LABEL_24;
              }
            }
            v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_24:

        if (v11)
        {

          v15 = 1;
          goto LABEL_30;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v5)
        continue;
      break;
    }
    v15 = 0;
LABEL_30:
    v3 = v17;
    v2 = v18;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_trackUnlockOpportunity
{
  if (self->_shouldReport)
    -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](self->_unlockTracker, "trackGoalOpportunityEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
}

- (void)_trackUnlockConversion:(BOOL)a3
{
  if (self->_shouldReport)
    -[PETGoalConversionEventTracker trackGoalOpportunityEventWithConversion:propertyValues:](self->_unlockTracker, "trackGoalOpportunityEventWithConversion:propertyValues:", a3, MEMORY[0x1E0C9AA60]);
}

- (void)_trackSessionWithDuration:(double)a3
{
  unint64_t v4;
  BOOL unlockDismissed;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PETDistributionEventTracker *sessionTimeTracker;
  _QWORD v20[12];

  v20[11] = *MEMORY[0x1E0C80C00];
  if (self->_shouldReport)
  {
    sessionTimeTracker = self->_sessionTimeTracker;
    v4 = *(_QWORD *)&self->_sessionInteractions.usedQuickActionButton;
    unlockDismissed = self->_sessionInteractions.unlockDismissed;
    v6 = *(unsigned __int16 *)&self->_sessionInteractions.activatedControlCenter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 & 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v4 >> 8) & 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v4 >> 16) & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v4 >> 24) & 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v4) & 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v4 >> 40) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIWORD(v4) & 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[6] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v4) & 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[7] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 & 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[8] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v6 >> 8) & 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[9] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", unlockDismissed);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[10] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PETDistributionEventTracker trackEventWithPropertyValues:value:](sessionTimeTracker, "trackEventWithPropertyValues:value:", v16, a3);
  }
}

- (SBInteractionAfterWakeMetric)init
{
  SBInteractionAfterWakeMetric *v2;
  SBInteractionAfterWakeMetric *v3;
  id v4;
  uint64_t v5;
  PETGoalConversionEventTracker *unlockTracker;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PETDistributionEventTracker *sessionTimeTracker;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SBInteractionAfterWakeMetric;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldReport = -[SBInteractionAfterWakeMetric _determineIfShouldReport](v2, "_determineIfShouldReport");
    v4 = objc_alloc(MEMORY[0x1E0D80F30]);
    v5 = objc_msgSend(v4, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("PresentLockScreen"), CFSTR("DismissedLockScreen"), MEMORY[0x1E0C9AA60], &unk_1E91CF4F0);
    unlockTracker = v3->_unlockTracker;
    v3->_unlockTracker = (PETGoalConversionEventTracker *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D80F18]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    PETEventPropertyForBoolValues(CFSTR("QuickAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    PETEventPropertyForBoolValues(CFSTR("ScrolledNotifListIn"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    PETEventPropertyForBoolValues(CFSTR("LongLook"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    PETEventPropertyForBoolValues(CFSTR("InteractedNotif"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    PETEventPropertyForBoolValues(CFSTR("ClearedNotif"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

    PETEventPropertyForBoolValues(CFSTR("CameraActivated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

    PETEventPropertyForBoolValues(CFSTR("CameraPrewarmFalsePositive"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

    PETEventPropertyForBoolValues(CFSTR("CameraSwipeFailed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

    PETEventPropertyForBoolValues(CFSTR("ControlCenter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

    PETEventPropertyForBoolValues(CFSTR("Spotlight"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

    PETEventPropertyForBoolValues(CFSTR("UnlockDismissed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

    v20 = objc_msgSend(v7, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("SpringBoard"), CFSTR("LockScreenSession"), v8, &unk_1E91CF508);
    sessionTimeTracker = v3->_sessionTimeTracker;
    v3->_sessionTimeTracker = (PETDistributionEventTracker *)v20;

    objc_initWeak(&location, v3);
    v22 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __36__SBInteractionAfterWakeMetric_init__block_invoke;
    v28[3] = &unk_1E8EBFEE8;
    objc_copyWeak(&v29, &location);
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 0, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    v26[1] = 3221225472;
    v26[2] = __36__SBInteractionAfterWakeMetric_init__block_invoke_2;
    v26[3] = &unk_1E8EBFEE8;
    objc_copyWeak(&v27, &location);
    +[SBAnalyticsStateMachineEdge edgeFromState:transition:](SBAnalyticsStateMachineEdge, "edgeFromState:transition:", 1, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAnalyticsStateMachineEventHandler addEdge:](v3, "addEdge:", v23);
    -[SBAnalyticsStateMachineEventHandler addEdge:](v3, "addEdge:", v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __36__SBInteractionAfterWakeMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  v8 = 1;
  switch(a2)
  {
    case '%':
      objc_msgSend(v5, "eventPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DABFD8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      if (v11 == 25)
      {
        objc_msgSend(v7, "_trackUnlockConversion:", 0);
      }
      else
      {
        if (v11 != 12)
          goto LABEL_26;
        objc_msgSend(v7, "_trackUnlockConversion:", 1);
        v7[58] = 1;
      }
      objc_msgSend(v5, "eventPayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timestamp");
      v24 = v23;

      objc_msgSend(v7, "_trackSessionWithDuration:", v24 - *((double *)v7 + 5));
      v8 = 0;
      break;
    case '&':
      v8 = 1;
      WeakRetained[51] = 1;
      break;
    case '\'':
      v8 = 1;
      WeakRetained[49] = 1;
      break;
    case '(':
      v8 = 1;
      WeakRetained[52] = 1;
      break;
    case ')':
      v8 = 1;
      WeakRetained[50] = 1;
      break;
    case '*':
      v8 = 1;
      WeakRetained[48] = 1;
      break;
    case '+':
      break;
    case ',':
      v8 = 1;
      WeakRetained[53] = 1;
      break;
    case '-':
      v8 = 1;
      WeakRetained[54] = 1;
      break;
    case '.':
      v8 = 1;
      WeakRetained[55] = 1;
      break;
    case '/':
      v8 = 1;
      WeakRetained[56] = 1;
      break;
    default:
      if (a2 == 3)
      {
        objc_msgSend(v5, "eventPayload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
          v18 = *MEMORY[0x1E0DABD20];
          v19 = *MEMORY[0x1E0DAB6A0];
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "objectForKeyedSubscript:", v18, (_QWORD)v26);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "isEqualToString:", v19))
              {
                v7[57] = 1;

                goto LABEL_25;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_25:

LABEL_26:
        v8 = 1;
      }
      break;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_unlockTracker, 0);
}

@end
