@implementation WFForEachRepeatAction

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFForEachRepeatAction.m"), 22, CFSTR("Only open action can determine control flow"));

  }
  -[WFForEachRepeatAction repeatCollectionWithVariableSource:](self, "repeatCollectionWithVariableSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems") > 0;

  return v7;
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFForEachRepeatAction;
  v4 = a3;
  -[WFRepeatAction resetEvaluationCriteriaWithVariableSource:](&v5, sel_resetEvaluationCriteriaWithVariableSource_, v4);
  -[WFForEachRepeatAction setRepeatCollection:withVariableSource:](self, "setRepeatCollection:withVariableSource:", 0, v4, v5.receiver, v5.super_class);

}

- (void)setRepeatCollection:(id)a3 withVariableSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_msgSend(a3, "copy");
  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("-collection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContent:forVariableWithName:", v9, v8);

}

- (id)repeatCollectionWithVariableSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-collection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentForVariableWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFForEachRepeatAction;
  -[WFRepeatAction runWithInput:error:](&v30, sel_runWithInput_error_, v6, a4);
  -[WFAction variableSource](self, "variableSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFControlFlowAction mode](self, "mode");
  if (v8 == 2)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "items", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21);
          -[WFAction output](self, "output");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addItem:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }

    -[WFControlFlowAction controlFlowTracker](self, "controlFlowTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftScopeOfControlFlowAction:", self);
    goto LABEL_15;
  }
  if (v8)
    goto LABEL_16;
  -[WFForEachRepeatAction repeatCollectionWithVariableSource:](self, "repeatCollectionWithVariableSource:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[WFForEachRepeatAction setRepeatCollection:withVariableSource:](self, "setRepeatCollection:withVariableSource:", v6, v7);
    self->_numberOfLoops = objc_msgSend(v6, "numberOfItems");
    -[WFControlFlowAction controlFlowTracker](self, "controlFlowTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enteredScopeOfControlFlowAction:withInput:", self, v6);

  }
  -[WFForEachRepeatAction repeatCollectionWithVariableSource:](self, "repeatCollectionWithVariableSource:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0D13EA8];
    v32[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionWithItems:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setOutput:](self, "setOutput:", v16);

    objc_msgSend(v11, "removeItem:", v13);
LABEL_15:

LABEL_16:
    -[WFForEachRepeatAction itemVariableName](self, "itemVariableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[WFAction variableSource](self, "variableSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction output](self, "output");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContent:forVariableWithName:", v25, v11);

    }
    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 0, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6;
  id v7;
  WFUserDefinedVariable *v8;
  WFUserDefinedVariable *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    v12.receiver = self;
    v12.super_class = (Class)WFForEachRepeatAction;
    -[WFAction outputVariableWithVariableProvider:UUIDProvider:](&v12, sel_outputVariableWithVariableProvider_UUIDProvider_, v6, v7);
    v8 = (WFUserDefinedVariable *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = [WFUserDefinedVariable alloc];
    -[WFForEachRepeatAction itemVariableName](self, "itemVariableName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFUserDefinedVariable initWithName:variableProvider:aggrandizements:](v9, "initWithName:variableProvider:aggrandizements:", v10, v6, 0);

  }
  return v8;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    v14.receiver = self;
    v14.super_class = (Class)WFForEachRepeatAction;
    -[WFControlFlowAction inheritedOutputContentClassesInWorkflow:context:](&v14, sel_inheritedOutputContentClassesInWorkflow_context_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v7, "containsObject:", self) & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "addObject:", self);
    -[WFAction inputParameterKey](self, "inputParameterKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "variable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "possibleAggrandizedContentClassesWithContext:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)itemVariableName
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
  -[WFForEachRepeatAction itemVariableNameWithScopeLevel:](self, "itemVariableNameWithScopeLevel:", objc_msgSend(v4, "variableScopeLevelForGroupingIdentifier:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemVariableNameWithScopeLevel:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("Repeat Item");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Repeat Item %lu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)providedVariableNames
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[WFControlFlowAction mode](self, "mode"))
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)WFForEachRepeatAction;
  -[WFRepeatAction providedVariableNames](&v7, sel_providedVariableNames);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFForEachRepeatAction itemVariableName](self, "itemVariableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

@end
