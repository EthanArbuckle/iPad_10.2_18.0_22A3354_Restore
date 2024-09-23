@implementation WFLinkStartWorkoutAction

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkStartWorkoutAction;
  -[WFLinkAction initializeParameters](&v7, sel_initializeParameters);
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("workoutStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAction:", self);
    -[WFAction parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_14145);

  }
}

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  void *v3;
  WFActionParameterSummary *v4;

  v2 = [WFActionParameterSummary alloc];
  WFLocalizedStringResourceWithKey(CFSTR("Start ${workoutStyle} Workout"), CFSTR("Start ${workoutStyle} Workout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFActionParameterSummary initWithString:](v2, "initWithString:", v3);

  return v4;
}

- (id)parameterOverrides
{
  void *v2;
  void *v3;
  WFParameterDefinition *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  WFParameterDefinition *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v15 = CFSTR("workoutStyle");
  v5 = [WFParameterDefinition alloc];
  v13[0] = CFSTR("Class");
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("DisallowedVariableTypes");
  v14[0] = v7;
  v12 = CFSTR("Variable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFParameterDefinition initWithDictionary:](v5, "initWithDictionary:", v9);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("workoutStyle"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFLinkAction runAsynchronouslyWithLinkAction:](self, "runAsynchronouslyWithLinkAction:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLinkStartWorkoutAction;
    -[WFLinkAction runAsynchronouslyWithInput:](&v6, sel_runAsynchronouslyWithInput_, v4);
  }

}

void __48__WFLinkStartWorkoutAction_initializeParameters__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v2, "setHidden:", 1);

}

@end
