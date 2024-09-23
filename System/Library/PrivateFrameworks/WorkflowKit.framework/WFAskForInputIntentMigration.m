@implementation WFAskForInputIntentMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.ask"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.ask"), &__block_literal_global_55049);
  -[WFWorkflowMigration finish](self, "finish");
}

void __47__WFAskForInputIntentMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFInputType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Date")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFAskActionDateGranularity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Time");
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Time")) & 1) != 0
      || (v5 = CFSTR("Date and Time"), objc_msgSend(v4, "isEqualToString:", CFSTR("Date and Time"))))
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("WFInputType"));
    }

  }
  objc_msgSend(v10, "removeObjectForKey:", CFSTR("WFAskActionDateGranularity"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFAskActionDefaultAnswer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFInputType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Number")) & 1) != 0)
    {
      v8 = CFSTR("WFAskActionDefaultAnswerNumber");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v8 = CFSTR("WFAskActionDefaultAnswerURL");
    }
    else if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Date"))
           || (v8 = CFSTR("WFAskActionDefaultAnswerDate"),
               objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFAskActionDefaultAnswerDate")),
               v9 = (void *)objc_claimAutoreleasedReturnValue(),
               v9,
               v9))
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Time")) & 1) != 0)
      {
        v8 = CFSTR("WFAskActionDefaultAnswerTime");
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Date and Time")))
        {
LABEL_18:

          goto LABEL_19;
        }
        v8 = CFSTR("WFAskActionDefaultAnswerDateAndTime");
      }
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v8);
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("WFAskActionDefaultAnswer"));
    goto LABEL_18;
  }
LABEL_19:

}

@end
