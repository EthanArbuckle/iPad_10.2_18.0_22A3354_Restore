@implementation WFRepeatAction

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[WFControlFlowAction mode](self, "mode") == 2)
  {
    WFLocalizedStringResourceWithKey(CFSTR("WFRepeatAction - End Repeat"), CFSTR("End Repeat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFRepeatAction;
    -[WFAction localizedNameWithContext:](&v8, sel_localizedNameWithContext_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)displaysParameterSummary
{
  return -[WFControlFlowAction mode](self, "mode") != 2;
}

- (id)createAccompanyingActions
{
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    v6.receiver = self;
    v6.super_class = (Class)WFRepeatAction;
    -[WFAction createAccompanyingActions](&v6, sel_createAccompanyingActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFControlFlowAction createAccompanyingActionWithMode:](self, "createAccompanyingActionWithMode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  return 0;
}

- (BOOL)outputsMultipleItems
{
  objc_super v4;

  if (-[WFControlFlowAction mode](self, "mode") == 2)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)WFRepeatAction;
  return -[WFControlFlowAction inputTypePassthrough](&v4, sel_inputTypePassthrough);
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFRepeatAction indexVariableName](self, "indexVariableName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContent:forVariableWithName:", 0, v5);

}

- (unint64_t)numberOfLoops
{
  return 0;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[WFRepeatAction indexVariableName](self, "indexVariableName", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[WFControlFlowAction mode](self, "mode"))
  {
    -[WFAction variableSource](self, "variableSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentForVariableWithName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    -[WFAction variableSource](self, "variableSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D13EA8];
    v14 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionWithItems:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContent:forVariableWithName:", v18, v5);

  }
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    v8 = v6 == 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFRepeatAction;
    v8 = -[WFAction ignoresOutputFromAction:inWorkflow:](&v10, sel_ignoresOutputFromAction_inWorkflow_, v6, v7);
  }

  return v8;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Repeat Results"), CFSTR("Repeat Results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexVariableName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variableAvailability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRepeatAction indexVariableNameWithScopeLevel:](self, "indexVariableNameWithScopeLevel:", objc_msgSend(v4, "variableScopeLevelForGroupingIdentifier:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexVariableNameWithScopeLevel:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("Repeat Index");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Repeat Index %lu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)itemVariableNameWithScopeLevel:(unint64_t)a3
{
  return 0;
}

- (id)providedVariableNames
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[WFControlFlowAction mode](self, "mode"))
    return 0;
  -[WFRepeatAction indexVariableName](self, "indexVariableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

@end
