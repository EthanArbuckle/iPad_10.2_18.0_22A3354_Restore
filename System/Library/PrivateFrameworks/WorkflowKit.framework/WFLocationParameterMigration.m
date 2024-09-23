@implementation WFLocationParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.gettraveltime"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.weather.currentconditions"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.weather.forecast"), v5) & 1) != 0)
    {
      HasActionsWithIdentifier = 1;
    }
    else
    {
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.getdistance"), v5);
    }
  }
  else
  {
    HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFLocationValue *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFWorkflowMigration actions](self, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.gettraveltime")))
        {
LABEL_7:
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "wf_popObjectForKey:", CFSTR("WFGetDirectionsFrom"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:", CFSTR("Current Location")))
          {
            v14 = -[WFLocationValue initWithCurrentLocation]([WFLocationValue alloc], "initWithCurrentLocation");
            -[WFLocationValue serializedRepresentation](v14, "serializedRepresentation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v12;
            v17 = v15;
            v18 = CFSTR("WFGetDirectionsCustomLocation");
            goto LABEL_13;
          }
          goto LABEL_14;
        }
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.weather.currentconditions")) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.weather.forecast")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "wf_popObjectForKey:", CFSTR("WFWeatherLocation"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:", CFSTR("Current Location")))
          {
            v14 = -[WFLocationValue initWithCurrentLocation]([WFLocationValue alloc], "initWithCurrentLocation");
            -[WFLocationValue serializedRepresentation](v14, "serializedRepresentation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v12;
            v17 = v15;
            v18 = CFSTR("WFWeatherCustomLocation");
LABEL_13:
            objc_msgSend(v16, "setValue:forKey:", v17, v18);

          }
LABEL_14:

          goto LABEL_15;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.getdistance")))
          goto LABEL_7;
LABEL_15:

        ++v7;
      }
      while (v5 != v7);
      v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v5 = v20;
    }
    while (v20);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
