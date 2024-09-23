@implementation WFAddNewReminderActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.addnewreminder"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  char isKindOfClass;
  const __CFString *v18;
  char v19;
  int v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    v30 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("is.workflow.actions.addnewreminder")))
        {
          v10 = v4;
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFCalendarItemAlert"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v12, "removeObjectForKey:", CFSTR("WFCalendarItemAlert"));
          objc_msgSend(v12, "objectForKey:", CFSTR("WFAlertTrigger"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_27;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "setObject:forKey:", CFSTR("Alert"), CFSTR("WFAlertEnabled"));
            v15 = v14;
            if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("At Location")))
            {
              objc_msgSend(v12, "objectForKey:", CFSTR("WFAlertLocationProximity"));
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v18 = v16;
                if ((isKindOfClass & 1) != 0)
                {
                  v19 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Enter"));
                  v18 = CFSTR("When I Arrive");
                  if ((v19 & 1) == 0)
                  {
                    v20 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Leave"));
                    v18 = CFSTR("When I Leave");
                    if (!v20)
                    {
LABEL_23:
                      objc_msgSend(v12, "objectForKey:", CFSTR("WFAlertLocationRadius"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v39[0] = CFSTR("Value");
                        v37[0] = CFSTR("Magnitude");
                        objc_msgSend(v24, "stringValue");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v37[1] = CFSTR("Unit");
                        v38[0] = v28;
                        v38[1] = CFSTR("m");
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
                        v29 = v16;
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v39[1] = CFSTR("WFSerializationType");
                        v40[0] = v25;
                        v40[1] = CFSTR("WFQuantityFieldValue");
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();

                        v16 = v29;
                        objc_msgSend(v12, "setObject:forKey:", v26, CFSTR("WFAlertLocationRadius"));

                      }
LABEL_26:

                      v36[0] = CFSTR("WFAlertLocationRadius");
                      v36[1] = CFSTR("WFAlertLocationProximity");
                      v36[2] = CFSTR("WFAlertTrigger");
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "removeObjectsForKeys:", v27);

LABEL_27:
                      v4 = v10;
                      v5 = v30;
                      goto LABEL_28;
                    }
                  }
                }
              }
              else
              {
                v18 = CFSTR("When I Arrive");
              }
              objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("WFAlertCondition"));
              goto LABEL_23;
            }
            if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("At Time")))
              goto LABEL_26;
            v21 = v12;
            v22 = CFSTR("At Time");
            v23 = CFSTR("WFAlertCondition");
          }
          else
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("WFAlertTrigger"));
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v21 = v12;
            v22 = v15;
            v23 = CFSTR("WFAlertEnabled");
          }
          objc_msgSend(v21, "setObject:forKey:", v22, v23);
          goto LABEL_26;
        }
LABEL_28:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
