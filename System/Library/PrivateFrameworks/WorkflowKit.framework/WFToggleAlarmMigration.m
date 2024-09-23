@implementation WFToggleAlarmMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.alarm.toggle"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
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
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v48;
    *(_QWORD *)&v4 = 136315906;
    v43 = v4;
    v45 = *(_QWORD *)v48;
    do
    {
      v7 = 0;
      v44 = v5;
      do
      {
        if (*(_QWORD *)v48 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey", v43);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.alarm.toggle"));

        if (v11)
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent"), v12);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFEnabled"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFEnabled"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("enabled"));

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFAlarm"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFAlarm"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_class();
            v21 = v19;
            if (v21 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              getWFGeneralLogObject();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              {
                v24 = (void *)objc_opt_class();
                *(_DWORD *)buf = v43;
                v55 = "WFEnforceClass";
                v56 = 2114;
                v57 = v21;
                v58 = 2114;
                v59 = v24;
                v60 = 2114;
                v61 = v20;
                v25 = v24;
                _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

              }
              v22 = 0;
            }
            else
            {
              v22 = v21;
            }

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmHour"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {

              goto LABEL_19;
            }
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmMinute"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
LABEL_19:
              v51[0] = CFSTR("hour");
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmHour"));
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = (void *)v29;
              if (v29)
                v31 = (void *)v29;
              else
                v31 = &unk_1E7B8BDD0;
              v51[1] = CFSTR("minute");
              v52[0] = v31;
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmMinute"));
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v32;
              if (v32)
                v34 = (void *)v32;
              else
                v34 = &unk_1E7B8BDD0;
              v52[1] = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v35, CFSTR("dateComponents"));

            }
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmLabel"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmLabel"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v37, CFSTR("displayString"));

              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmLabel"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v38, CFSTR("label"));

            }
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmIdentifier"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WFAlarmIdentifier"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "substringFromIndex:", objc_msgSend(CFSTR("x-apple-clock:alarm?id="), "length"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v41, CFSTR("identifier"));

            }
            objc_msgSend(v15, "setObject:forKey:", v26, CFSTR("alarm"));

            v5 = v44;
          }
          if (objc_msgSend(v15, "count"))
          {
            -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v42);

          }
          v6 = v45;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
