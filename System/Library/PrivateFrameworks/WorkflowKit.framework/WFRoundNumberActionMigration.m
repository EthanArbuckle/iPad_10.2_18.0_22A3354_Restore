@implementation WFRoundNumberActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.round"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFRoundNumberActionMigration *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  WFRoundNumberActionMigration *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[10];
  _QWORD v47[10];
  _BYTE v48[128];
  uint64_t v49;

  v2 = self;
  v49 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v3)
  {
    v4 = v3;
    v5 = CFSTR("is.workflow.actions.round");
    v6 = *(_QWORD *)v43;
    v38 = v2;
    v39 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      v40 = v4;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey", v38);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", v5))
        {
          -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFRoundType"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Left of Decimal"));
          v15 = v14;
          v46[0] = &unk_1E7B8B5F0;
          v46[1] = &unk_1E7B8B608;
          v16 = CFSTR("Tenths");
          if (v14)
            v16 = CFSTR("Tens Place");
          v47[0] = CFSTR("Ones Place");
          v47[1] = v16;
          v17 = CFSTR("Hundredths");
          if (v14)
            v17 = CFSTR("Hundreds Place");
          v46[2] = &unk_1E7B8B620;
          v46[3] = &unk_1E7B8B638;
          v18 = CFSTR("Thousandths");
          if (v14)
            v18 = CFSTR("Thousands");
          v47[2] = v17;
          v47[3] = v18;
          v19 = CFSTR("Ten Thousandths");
          if (v14)
            v19 = CFSTR("Ten Thousands");
          v46[4] = &unk_1E7B8B650;
          v46[5] = &unk_1E7B8B668;
          v20 = CFSTR("Hundred Thousandths");
          if (v14)
            v20 = CFSTR("Hundred Thousands");
          v47[4] = v19;
          v47[5] = v20;
          v21 = CFSTR("Millionths");
          if (v14)
            v21 = CFSTR("Millions");
          v46[6] = &unk_1E7B8B680;
          v46[7] = &unk_1E7B8B698;
          v22 = CFSTR("Ten Millionths");
          if (v14)
            v22 = CFSTR("10 ^");
          v47[6] = v21;
          v47[7] = v22;
          v23 = CFSTR("Hundred Millionths");
          if (v14)
            v23 = CFSTR("10 ^");
          v46[8] = &unk_1E7B8B6B0;
          v46[9] = &unk_1E7B8B6C8;
          v24 = CFSTR("Billionths");
          if (v14)
            v24 = CFSTR("10 ^");
          v47[8] = v23;
          v47[9] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
LABEL_28:
            objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundDecimalPlaces"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v12, "setObject:forKey:", v28, CFSTR("WFRoundTo"));
            }
            else
            {
              v29 = v5;

              objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundDecimalPlaces"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "integerValue");
              if (v31 >= 0)
                v32 = v31;
              else
                v32 = -v31;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v33);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28 && (objc_msgSend(v28, "isEqualToString:", CFSTR("10 ^")) & 1) == 0)
              {
                objc_msgSend(v12, "setObject:forKey:", v28, CFSTR("WFRoundTo"));
              }
              else
              {
                objc_msgSend(v12, "setObject:forKey:", CFSTR("10 ^"), CFSTR("WFRoundTo"));
                if (v15)
                  v34 = v32;
                else
                  v34 = -v32;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKey:", v35, CFSTR("TenToThePowerOf"));

              }
              v5 = v29;
              v2 = v38;
            }

            objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundType"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
              objc_msgSend(v12, "removeObjectForKey:", CFSTR("WFRoundType"));
            objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundDecimalPlaces"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
              objc_msgSend(v12, "removeObjectForKey:", CFSTR("WFRoundDecimalPlaces"));
          }
          else
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("WFRoundDecimalPlaces"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v15 = 1;
              goto LABEL_28;
            }
          }

          v6 = v39;
          v4 = v40;
        }

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
