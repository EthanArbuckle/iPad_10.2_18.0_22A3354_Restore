@implementation SBDataPlanFailureAlertItem

- (SBDataPlanFailureAlertItem)initWithAccountURL:(id)a3 carrierName:(id)a4 newAccount:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  SBDataPlanFailureAlertItem *v9;
  SBDataPlanFailureAlertItem *v10;
  objc_super v12;

  v5 = a5;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDataPlanFailureAlertItem;
  v9 = -[SBDataPlanAccountAlertItem initWithAccountURL:](&v12, sel_initWithAccountURL_, a3);
  v10 = v9;
  if (v9)
  {
    -[SBDataPlanFailureAlertItem setCarrierName:](v9, "setCarrierName:", v8);
    -[SBDataPlanFailureAlertItem setNewAccount:](v10, "setNewAccount:", v5);
  }

  return v10;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBDataPlanFailureAlertItem;
  -[SBDataPlanAccountAlertItem configure:requirePasscodeForActions:](&v20, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDataPlanFailureAlertItem isNewAccount](self, "isNewAccount");
  v8 = CFSTR("UPDATE");
  if (v7)
    v8 = CFSTR("ACTIVATE");
  v9 = v8;
  -[SBDataPlanFailureAlertItem carrierName](self, "carrierName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("CARRIER");
  if (!v10)
    v11 = CFSTR("FALLBACK");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DATA_PLAN_FAILED_%@_%@_BODY"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_FAILED_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDataPlanFailureAlertItem carrierName](self, "carrierName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[SBDataPlanFailureAlertItem carrierName](self, "carrierName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v15, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v15;
  }

  objc_msgSend(v5, "setTitle:", v14);
  objc_msgSend(v5, "setMessage:", v19);

}

+ (id)laterButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_FAILED_TRY_LATER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nowButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_FAILED_TRY_AGAIN"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isNewAccount
{
  return self->_newAccount;
}

- (void)setNewAccount:(BOOL)a3
{
  self->_newAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end
