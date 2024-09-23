@implementation WFOpenAppPosterBoardMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1177.1")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.openapp"), v5);
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
  v4[2] = __48__WFOpenAppPosterBoardMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

void __48__WFOpenAppPosterBoardMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.actions.openapp"));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFSelectedApp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("BundleIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
        }
        else
        {
          v10 = 0;
        }
        v11 = v10;

        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PosterBoard"));
        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, CFSTR("WFSelectedApp"));

        }
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("WFAppIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

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

    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.PosterBoard"));
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, CFSTR("WFAppIdentifier"));

    }
  }

}

@end
