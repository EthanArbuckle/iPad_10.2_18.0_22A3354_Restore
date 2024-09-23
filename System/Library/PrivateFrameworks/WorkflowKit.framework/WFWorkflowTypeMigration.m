@implementation WFWorkflowTypeMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("160")) == 3)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("WFWorkflowShowInActionExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)migrateWorkflow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[WFWorkflowMigration workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFWorkflowShowInActionExtension"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:

    goto LABEL_7;
  }
  v5 = (void *)v4;
  -[WFWorkflowMigration workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WFWorkflowTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v3 = (void *)objc_opt_new();
    -[WFWorkflowMigration workflow](self, "workflow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WFWorkflowShowInActionExtension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
      objc_msgSend(v3, "addObject:", *MEMORY[0x1E0DC8500]);
    -[WFWorkflowMigration workflow](self, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("WFWorkflowTypes"));

    goto LABEL_6;
  }
LABEL_7:
  -[WFWorkflowMigration finish](self, "finish");
}

@end
