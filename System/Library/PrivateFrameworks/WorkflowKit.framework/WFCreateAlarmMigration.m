@implementation WFCreateAlarmMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.alarm.create"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFCreateAlarmMigration *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  WFCreateAlarmMigration *v45;
  id obj;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v2 = self;
  v73 = *MEMORY[0x1E0C80C00];
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v58;
    *(_QWORD *)&v4 = 136315906;
    v43 = v4;
    v44 = *(_QWORD *)v58;
    v45 = v2;
    do
    {
      v7 = 0;
      v50 = v5;
      do
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(obj);
        v52 = v7;
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey", v43);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.alarm.create"));

        if (v11)
        {
          -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent"), v12);

          -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFTime"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFTime"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("dateComponents"));

          }
          v51 = v15;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFLabel"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFLabel"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("label"));

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFFrequency"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v50;
          if (v20)
          {
            v48 = v14;
            v49 = v8;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFFrequency"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_opt_class();
            v23 = v21;
            if (v23 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              getWFGeneralLogObject();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                v26 = (void *)objc_opt_class();
                *(_DWORD *)buf = v43;
                v66 = "WFEnforceClass";
                v67 = 2114;
                v68 = v23;
                v69 = 2114;
                v70 = v26;
                v71 = 2114;
                v72 = v22;
                v27 = v26;
                _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

              }
              v24 = 0;
            }
            else
            {
              v24 = v23;
            }

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            objc_msgSend(v47, "weekdaySymbols");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v30 = v24;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v54;
              do
              {
                v34 = 0;
                do
                {
                  if (*(_QWORD *)v54 != v33)
                    objc_enumerationMutation(v30);
                  v35 = ((uint64_t (*)(void *))softLinkSAAlarmDayOfWeekForString)(*(void **)(*((_QWORD *)&v53 + 1) + 8 * v34));
                  v36 = 0;
                  v37 = 64;
                  switch(v35)
                  {
                    case 0:
                    case 1:
                      goto LABEL_32;
                    case 2:
                      goto LABEL_30;
                    case 3:
                      v36 = 1;
                      v37 = 1;
                      goto LABEL_30;
                    case 4:
                      v36 = 2;
                      v37 = 2;
                      goto LABEL_30;
                    case 5:
                      v36 = 3;
                      v37 = 4;
                      goto LABEL_30;
                    case 6:
                      v36 = 4;
                      v37 = 8;
                      goto LABEL_30;
                    case 7:
                      v36 = 5;
                      v37 = 16;
                      goto LABEL_30;
                    case 8:
                      v36 = 6;
                      v37 = 32;
LABEL_30:
                      objc_msgSend(v29, "objectAtIndexedSubscript:", v36);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = v37;
                      break;
                    default:
                      v38 = 0;
                      break;
                  }
                  v61[0] = CFSTR("displayString");
                  v61[1] = CFSTR("value");
                  v62[0] = v38;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v62[1] = v39;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addObject:", v40);

LABEL_32:
                  ++v34;
                }
                while (v32 != v34);
                v41 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
                v32 = v41;
              }
              while (v41);
            }

            objc_msgSend(v51, "setObject:forKey:", v28, CFSTR("repeatSchedule"));
            v6 = v44;
            v2 = v45;
            v8 = v49;
            v5 = v50;
            v14 = v48;
          }
          if (objc_msgSend(v51, "count"))
          {
            -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, v42);

          }
        }
        v7 = v52 + 1;
      }
      while (v52 + 1 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
