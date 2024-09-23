@implementation WFOpenInActionAskWhenRunMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  id v6;
  char HasActionsWithIdentifier;

  v5 = a3;
  v6 = a4;
  if (WFCompareBundleVersions(v6, CFSTR("0")) == 2 && (WFCompareBundleVersions(v6, CFSTR("1122")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.openin"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.openin"), &__block_literal_global_5409);
  -[WFWorkflowMigration finish](self, "finish");
}

void __52__WFOpenInActionAskWhenRunMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFOpenInAskWhenRun"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WFOpenInAskWhenRun"));

}

@end
