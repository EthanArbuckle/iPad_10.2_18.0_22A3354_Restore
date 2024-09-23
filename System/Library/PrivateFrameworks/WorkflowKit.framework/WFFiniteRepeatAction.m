@implementation WFFiniteRepeatAction

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFiniteRepeatAction.m"), 23, CFSTR("Only open action can determine control flow"));

  }
  v6 = -[WFFiniteRepeatAction repeatCountWithVariableSource:](self, "repeatCountWithVariableSource:", v5) > 0;

  return v6;
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFiniteRepeatAction;
  v4 = a3;
  -[WFRepeatAction resetEvaluationCriteriaWithVariableSource:](&v5, sel_resetEvaluationCriteriaWithVariableSource_, v4);
  -[WFFiniteRepeatAction setRepeatInput:withVariableSource:](self, "setRepeatInput:withVariableSource:", 0, v4, v5.receiver, v5.super_class);
  -[WFFiniteRepeatAction setRepeatCount:withVariableSource:](self, "setRepeatCount:withVariableSource:", 0, v4);

}

- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!-[WFControlFlowAction mode](self, "mode"))
  {
    -[WFAction processedParameters](self, "processedParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[WFFiniteRepeatAction repeatCountVariableName](self, "repeatCountVariableName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentForVariableWithName:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "items");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v23;
      if (v23)
      {
        v29 = CFSTR("WFRepeatCount");
        objc_msgSend(v23, "number");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction setProcessedParameters:](self, "setProcessedParameters:", v26);

      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)WFFiniteRepeatAction;
  -[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:](&v28, sel_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler_, v14, v15, v16, v17, v18, v19);

}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[WFControlFlowAction mode](self, "mode") == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFFiniteRepeatAction;
    -[WFAction outputVariableWithVariableProvider:UUIDProvider:](&v10, sel_outputVariableWithVariableProvider_UUIDProvider_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)repeatInputVariableName
{
  void *v2;
  void *v3;

  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-input"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)repeatCountVariableName
{
  void *v2;
  void *v3;

  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRepeatInput:(id)a3 withVariableSource:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_msgSend(a3, "copy");
  -[WFFiniteRepeatAction repeatInputVariableName](self, "repeatInputVariableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContent:forVariableWithName:", v8, v7);

}

- (id)repeatInputWithVariableSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFFiniteRepeatAction repeatInputVariableName](self, "repeatInputVariableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentForVariableWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRepeatCount:(int64_t)a3 withVariableSource:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0D13EA8];
    v11 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionWithItems:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[WFFiniteRepeatAction repeatCountVariableName](self, "repeatCountVariableName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContent:forVariableWithName:", v12, v13);

  if (a3)
  {

  }
}

- (int64_t)repeatCountWithVariableSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[WFFiniteRepeatAction repeatCountVariableName](self, "repeatCountVariableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentForVariableWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "number");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  return v10;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFFiniteRepeatAction;
  -[WFRepeatAction runWithInput:error:](&v24, sel_runWithInput_error_, v6, a4);
  -[WFAction variableSource](self, "variableSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFControlFlowAction mode](self, "mode");
  if (v8 == 2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "items", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[WFAction output](self, "output");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addItem:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v15);
    }

  }
  else if (!v8)
  {
    -[WFFiniteRepeatAction repeatInputWithVariableSource:](self, "repeatInputWithVariableSource:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_6:
      -[WFFiniteRepeatAction repeatInputWithVariableSource:](self, "repeatInputWithVariableSource:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction setOutput:](self, "setOutput:", v12);

      -[WFFiniteRepeatAction setRepeatCount:withVariableSource:](self, "setRepeatCount:withVariableSource:", -[WFFiniteRepeatAction repeatCountWithVariableSource:](self, "repeatCountWithVariableSource:", v7) - 1, v7);
      goto LABEL_15;
    }
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRepeatCount"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11)
    {
      -[WFFiniteRepeatAction setRepeatInput:withVariableSource:](self, "setRepeatInput:withVariableSource:", v6, v7);
      -[WFFiniteRepeatAction setRepeatCount:withVariableSource:](self, "setRepeatCount:withVariableSource:", v11, v7);
      self->_numberOfLoops = v11;
      goto LABEL_6;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_15:

}

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

@end
