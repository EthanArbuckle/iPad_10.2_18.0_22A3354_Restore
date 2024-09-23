@implementation SBDataPlanCompletionAlertItem

- (SBDataPlanCompletionAlertItem)initWithCarrierName:(id)a3 newAccount:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBDataPlanCompletionAlertItem *v7;
  SBDataPlanCompletionAlertItem *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDataPlanCompletionAlertItem;
  v7 = -[SBAlertItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SBDataPlanCompletionAlertItem setCarrierName:](v7, "setCarrierName:", v6);
    -[SBDataPlanCompletionAlertItem setNewAccount:](v8, "setNewAccount:", v4);
  }

  return v8;
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
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDataPlanCompletionAlertItem isNewAccount](self, "isNewAccount");
  v8 = CFSTR("UPDATED");
  if (v7)
    v8 = CFSTR("ACTIVATED");
  v9 = v8;
  -[SBDataPlanCompletionAlertItem carrierName](self, "carrierName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("CARRIER");
  if (!v10)
    v11 = CFSTR("FALLBACK");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DATA_PLAN_%@_TITLE"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DATA_PLAN_%@_%@_BODY"), v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v14, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDataPlanCompletionAlertItem carrierName](self, "carrierName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[SBDataPlanCompletionAlertItem carrierName](self, "carrierName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v16, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v16;
  }

  objc_msgSend(v5, "setTitle:", v15);
  objc_msgSend(v5, "setMessage:", v20);
  v21 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__SBDataPlanCompletionAlertItem_configure_requirePasscodeForActions___block_invoke;
  v24[3] = &unk_1E8E9DCB0;
  v24[4] = self;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v23);

}

uint64_t __69__SBDataPlanCompletionAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
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
