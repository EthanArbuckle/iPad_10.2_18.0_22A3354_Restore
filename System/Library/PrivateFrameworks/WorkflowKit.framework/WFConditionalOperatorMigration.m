@implementation WFConditionalOperatorMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.conditional"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.conditional"), &__block_literal_global_58033);
  -[WFWorkflowMigration finish](self, "finish");
}

void __49__WFConditionalOperatorMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  WFNumberSubstitutableState *v8;
  void *v9;
  WFNumberSubstitutableState *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFControlFlowMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v5 = v12;
  if (!v4)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFCondition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Equals")) & 1) != 0)
      {
        v7 = 4;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Is Greater Than")) & 1) != 0)
      {
        v7 = 2;
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Is Less Than")))
      {
        v7 = 0;
      }
      else
      {
        v7 = 99;
      }
      v8 = [WFNumberSubstitutableState alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFNumberSubstitutableState initWithNumber:](v8, "initWithNumber:", v9);
      -[WFVariableSubstitutableParameterState serializedRepresentation](v10, "serializedRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("WFCondition"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WFConditionalLegacyComparisonBehavior"));
    }

    v5 = v12;
  }

}

@end
