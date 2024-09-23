@implementation WFMissingAction

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFMissingAction;
    -[WFAction localizedNameWithContext:](&v9, sel_localizedNameWithContext_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("Unknown Action"), CFSTR("Unknown Action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)iconImage
{
  return (id)objc_opt_new();
}

- (id)localizedDescriptionSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("This action could not be found. It may require a newer version of Shortcuts or another app.\n\nThe missing action’s identifier is “%@”."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isMissing
{
  return 1;
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("The shortcut could not be run because an action could not be found."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 14, v7);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (BOOL)requiresRemoteExecution
{
  return 0;
}

- (BOOL)isForLocalization
{
  return self->_isForLocalization;
}

- (void)setIsForLocalization:(BOOL)a3
{
  self->_isForLocalization = a3;
}

@end
