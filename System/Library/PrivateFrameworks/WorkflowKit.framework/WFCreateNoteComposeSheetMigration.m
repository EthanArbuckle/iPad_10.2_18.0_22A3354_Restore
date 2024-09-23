@implementation WFCreateNoteComposeSheetMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1167")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.mobilenotes.SharingExtension"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  _QWORD v4[5];

  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__WFCreateNoteComposeSheetMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

void __52__WFCreateNoteComposeSheetMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  WFBooleanSubstitutableState *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilenotes.SharingExtension"));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ShowWhenRun"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFBooleanSubstitutableState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v8, 0, 0);
    -[WFNumberSubstitutableState number](v9, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v12, "actionIdentifierKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.runextension"), v13);

      objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("com.apple.mobilenotes");
      v18 = CFSTR("WFAppIdentifier");
    }
    else
    {
      objc_msgSend(v12, "actionParametersKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = (const __CFString *)MEMORY[0x1E0C9AAA0];
      v18 = CFSTR("OpenWhenRun");
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

  }
}

@end
