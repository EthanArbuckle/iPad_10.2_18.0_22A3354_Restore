@implementation WFRequestUberActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1050.8")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("com.ubercab.UberClient.requestuber"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
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
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  WFLocationValue *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = CFSTR("UberShowEstimate");
    v6 = *(_QWORD *)v34;
    v30 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      v31 = v4;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.ubercab.UberClient.requestuber")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v12, "removeObjectForKey:", v5);
          v14 = v5;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("UberProductId"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v12, "removeObjectForKey:", CFSTR("UberProductId"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("com.ubercab.UberClient"), CFSTR("IntentAppIdentifier"));
          objc_msgSend(v12, "wf_popObjectForKey:", CFSTR("UberSeatCount"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;
            if (v17)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v18 = v17;
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
            }
            v19 = v18;

            v20 = (void *)MEMORY[0x1E0CB37E8];
            v21 = objc_msgSend(v19, "integerValue");

            if (v21 <= 1)
              v22 = 1;
            else
              v22 = v21;
            objc_msgSend(v20, "numberWithInteger:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("PartySize"));

          }
          else
          {
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("PartySize"));
          }
          objc_msgSend(v12, "wf_popObjectForKey:", CFSTR("UberPickupAt"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
          }
          else
          {
            v25 = 0;
          }
          v26 = v25;

          if (objc_msgSend(v26, "isEqualToString:", CFSTR("Current Location")))
          {
            v27 = -[WFLocationValue initWithCurrentLocation]([WFLocationValue alloc], "initWithCurrentLocation");
            -[WFLocationValue serializedRepresentation](v27, "serializedRepresentation");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setValue:forKey:", v28, CFSTR("PickupLocation"));

          }
          else if (objc_msgSend(v26, "isEqualToString:", CFSTR("Custom Location")))
          {
            objc_msgSend(v12, "removeObjectForKey:", CFSTR("UberCustomLocation"));
          }
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.ride.requestride"), v29);

          v5 = v14;
          v6 = v30;
          v4 = v31;
        }

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
