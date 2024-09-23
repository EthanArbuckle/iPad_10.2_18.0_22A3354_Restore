@implementation WFLinkOpenEntityAction

- (id)entityParameterName
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("entity");
  v6[1] = CFSTR("target");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkEntityAction actualEntityParameterNameFromPossibleNames:](self, "actualEntityParameterNameFromPossibleNames:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)verb
{
  return CFSTR("open");
}

- (id)overrideLabelsByParameter
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFLinkOpenEntityAction entityParameterName](self, "entityParameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameterSummary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  WFActionParameterSummary *v7;
  void *v8;
  WFActionParameterSummary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFLinkOpenEntityAction;
  -[WFLinkAction parameterSummary](&v11, sel_parameterSummary);
  v3 = objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5 | v3;

  if (v6)
  {
    v9 = (WFActionParameterSummary *)(id)v3;
  }
  else
  {
    v7 = [WFActionParameterSummary alloc];
    WFLocalizedStringResourceWithKey(CFSTR("Open ${target}"), CFSTR("Open ${target}"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFActionParameterSummary initWithString:](v7, "initWithString:", v8);

  }
  return v9;
}

+ (id)overrideInputParameterNames
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("entity");
  v3[1] = CFSTR("target");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
