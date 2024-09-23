@implementation WFPaletteGreenMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("WFWorkflowIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WFCompareBundleVersions(v5, CFSTR("128"));

  if (v7 == 3)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("WFWorkflowIconStartColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue") == -1512163329;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)migrateWorkflow
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  -[WFWorkflowMigration workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFWorkflowIcon"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("WFWorkflowIconStartColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 == -1512163329)
    objc_msgSend(v8, "setObject:forKey:", &unk_1E7B8B6E0, CFSTR("WFWorkflowIconStartColor"));
  objc_msgSend(v8, "objectForKey:", CFSTR("WFWorkflowIconEndColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7 == -1512163329)
    objc_msgSend(v8, "setObject:forKey:", &unk_1E7B8B6E0, CFSTR("WFWorkflowIconEndColor"));
  -[WFWorkflowMigration finish](self, "finish");

}

@end
