@implementation WFLinkNotesPinNotesAction

- (id)localizedNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("WFLinkNotesPinNotesAction - Action Name"), CFSTR("Pin Notes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  WFActionParameterSummaryValue *v3;
  void *v4;
  WFActionParameterSummaryValue *v5;
  WFActionParameterSummaryValue *v6;
  void *v7;
  WFActionParameterSummaryValue *v8;
  void *v9;
  WFActionParameterSummary *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = [WFActionParameterSummary alloc];
  v3 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${operation} ${entities} to pinned notes"), CFSTR("${operation} ${entities} to pinned notes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v3, "initWithKey:summaryString:", CFSTR("operation(add)"), v4);
  v12[0] = v5;
  v6 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${operation} ${entities} from pinned notes"), CFSTR("${operation} ${entities} from pinned notes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v6, "initWithKey:summaryString:", CFSTR("operation(remove)"), v7);
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFActionParameterSummary initWithValues:](v2, "initWithValues:", v9);

  return v10;
}

- (BOOL)shouldOverrideParameterLabels
{
  return 1;
}

- (id)overrideLabelsByParameter
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)WFLinkNotesPinNotesAction;
  -[WFLinkFavoriteEntityAction overrideLabelsByParameter](&v8, sel_overrideLabelsByParameter);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("operation");
  WFLocalizedStringWithKey(CFSTR("Operation (operation)"), CFSTR("Operation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "if_dictionaryByAddingEntriesFromDictionary:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

@end
