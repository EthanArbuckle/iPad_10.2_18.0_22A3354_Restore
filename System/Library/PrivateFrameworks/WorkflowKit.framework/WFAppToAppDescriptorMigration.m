@implementation WFAppToAppDescriptorMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  id v6;
  char HasActionsWithIdentifier;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v5 = a3;
  v6 = a4;
  HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.openapp"), v5);
  v8 = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.openin"), v5);
  v9 = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.quit.app"), v5);
  v10 = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.hide.app"), v5);
  v11 = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.splitscreen"), v5);
  if ((WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.mobilenotes.SharingExtension"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.appendnote"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.ride.requestride"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.sendmessage"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.mobilephone.call"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.facetime.facetime"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.venmo.pay"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.workout.start"), v5) & 1) != 0
    || (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.venmo.request"), v5) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v12 = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.timer.start"), v5);
  }
  if ((((HasActionsWithIdentifier | v8) | (v9 | v10)) & 1) != 0)
    v13 = 1;
  else
    v13 = v11 | v12;
  if (WFCompareBundleVersions(v6, CFSTR("0")) == 2)
  {
    if (WFCompareBundleVersions(v6, CFSTR("1136")) != 3)
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)actionDictionaryContainsSystemIntentAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[11];

  v10[10] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("com.apple.mobilenotes.SharingExtension");
  v10[1] = CFSTR("is.workflow.actions.appendnote");
  v10[2] = CFSTR("is.workflow.actions.ride.requestride");
  v10[3] = CFSTR("is.workflow.actions.sendmessage");
  v10[4] = CFSTR("com.apple.mobilephone.call");
  v10[5] = CFSTR("com.apple.facetime.facetime");
  v10[6] = CFSTR("is.workflow.actions.venmo.pay");
  v10[7] = CFSTR("is.workflow.actions.workout.start");
  v10[8] = CFSTR("is.workflow.actions.venmo.request");
  v10[9] = CFSTR("is.workflow.actions.timer.start");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v6, "containsObject:", v8);
  return (char)v7;
}

- (void)migrateWorkflow
{
  void *v3;
  _QWORD v4[5];

  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WFAppToAppDescriptorMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

- (void)migrateOpenAppWithParameters:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("WFAppIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("WFSelectedApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_10;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("WFAppIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v4);
      objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "serializedRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("WFSelectedApp"));

      }
    }
  }

LABEL_10:
}

- (void)migrateOpenInWithParameters:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("WFOpenInAppIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("WFSelectedApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_10;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("WFOpenInAppIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v4);
      objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "serializedRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("WFSelectedApp"));

      }
    }
  }

LABEL_10:
}

- (void)migrateQuitAppWithParameters:(id)a3
{
  -[WFAppToAppDescriptorMigration migrateAppToAppDescriptorForParameterKey:parameters:](self, "migrateAppToAppDescriptorForParameterKey:parameters:", CFSTR("WFApp"), a3);
}

- (void)migrateHideAppWithParameters:(id)a3
{
  -[WFAppToAppDescriptorMigration migrateAppToAppDescriptorForParameterKey:parameters:](self, "migrateAppToAppDescriptorForParameterKey:parameters:", CFSTR("WFApp"), a3);
}

- (void)migrateSplitScreenWithParameters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFAppToAppDescriptorMigration migrateAppToAppDescriptorForParameterKey:parameters:](self, "migrateAppToAppDescriptorForParameterKey:parameters:", CFSTR("WFPrimaryAppIdentifier"), v5);
  objc_msgSend(v5, "objectForKey:", CFSTR("WFSecondaryAppIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[WFAppToAppDescriptorMigration migrateAppToAppDescriptorForParameterKey:parameters:](self, "migrateAppToAppDescriptorForParameterKey:parameters:", CFSTR("WFSecondaryAppIdentifier"), v5);

}

- (void)migrateSystemIntentActionsWithParameters:(id)a3
{
  -[WFAppToAppDescriptorMigration migrateAppToAppDescriptorForParameterKey:parameters:](self, "migrateAppToAppDescriptorForParameterKey:parameters:", CFSTR("IntentAppDefinition"), a3);
}

- (void)migrateAppToAppDescriptorForParameterKey:(id)a3 parameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "objectForKey:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v7);
        objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resolvedAppMatchingDescriptor:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "serializedRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

        }
      }
    }

  }
}

void __48__WFAppToAppDescriptorMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("is.workflow.actions.openapp"));

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "migrateOpenAppWithParameters:", v4);
  }
  else
  {
    objc_msgSend(v8, "actionIdentifierKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.openin"));

    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v12, "migrateOpenInWithParameters:", v4);
    }
    else
    {
      objc_msgSend(v12, "actionIdentifierKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("is.workflow.actions.quit.app"));

      v16 = *(void **)(a1 + 32);
      if (v15)
      {
        objc_msgSend(v16, "migrateQuitAppWithParameters:", v4);
      }
      else
      {
        objc_msgSend(v16, "actionIdentifierKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("is.workflow.actions.hide.app"));

        v20 = *(void **)(a1 + 32);
        if (v19)
        {
          objc_msgSend(v20, "migrateHideAppWithParameters:", v4);
        }
        else
        {
          objc_msgSend(v20, "actionIdentifierKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("is.workflow.actions.splitscreen"));

          v24 = *(void **)(a1 + 32);
          if (v23)
          {
            objc_msgSend(v24, "migrateSplitScreenWithParameters:", v4);
          }
          else if (objc_msgSend(v24, "actionDictionaryContainsSystemIntentAction:", v4))
          {
            objc_msgSend(*(id *)(a1 + 32), "migrateSystemIntentActionsWithParameters:", v4);
          }
        }
      }
    }
  }

}

@end
