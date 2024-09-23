@implementation WFDatePickerToFieldMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("332")) == 3)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.getupcomingevents"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 2);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__WFDatePickerToFieldMigration_migrateWorkflow__block_invoke;
  v5[3] = &unk_1E7AF18D0;
  v6 = v3;
  v4 = v3;
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.getupcomingevents"), v5);
  -[WFWorkflowMigration finish](self, "finish");

}

void __47__WFDatePickerToFieldMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("WFSpecifiedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("WFSpecifiedDate"));

  }
}

@end
