@implementation WFContactRepresentedValueMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("309")) == 3)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.phonenumber"), v5) & 1) != 0)
      HasActionsWithIdentifier = 1;
    else
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.email"), v5);
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
  _QWORD v4[5];

  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__WFContactRepresentedValueMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

void __53__WFContactRepresentedValueMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.actions.phonenumber")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.actions.email")))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("WFPhoneNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      WFMigrateContactFieldValueParameterValue(v7, 3u);
    objc_msgSend(v6, "objectForKey:", CFSTR("WFEmailAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      WFMigrateContactFieldValueParameterValue(v9, 4u);

  }
}

@end
