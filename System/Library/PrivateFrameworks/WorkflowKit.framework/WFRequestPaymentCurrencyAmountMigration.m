@implementation WFRequestPaymentCurrencyAmountMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1084")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.venmo.request"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.venmo.request"), &__block_literal_global_116_23409);
  -[WFWorkflowMigration finish](self, "finish");
}

void __58__WFRequestPaymentCurrencyAmountMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  WFMigratePaymentActionCurrencyAmount(a3);
}

@end
