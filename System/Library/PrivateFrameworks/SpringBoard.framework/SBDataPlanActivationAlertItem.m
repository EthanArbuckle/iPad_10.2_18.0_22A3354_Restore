@implementation SBDataPlanActivationAlertItem

- (SBDataPlanActivationAlertItem)initWithAccountURL:(id)a3 newAccount:(BOOL)a4 promptToDisable:(BOOL)a5
{
  _BOOL8 v6;
  SBDataPlanActivationAlertItem *v7;
  SBDataPlanActivationAlertItem *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBDataPlanActivationAlertItem;
  v7 = -[SBDataPlanAccountAlertItem initWithAccountURL:](&v10, sel_initWithAccountURL_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_promptToDisable = a5;
    -[SBDataPlanActivationAlertItem setNewAccount:](v7, "setNewAccount:", v6);
  }
  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDataPlanActivationAlertItem;
  -[SBDataPlanAccountAlertItem configure:requirePasscodeForActions:](&v12, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDataPlanActivationAlertItem isNewAccount](self, "isNewAccount");
  if (v6)
    v7 = CFSTR("DATA_PLAN_NEW_ACCOUNT_BODY");
  else
    v7 = CFSTR("DATA_PLAN_ADD_EMPTY_BODY");
  if (v6)
    v8 = CFSTR("DATA_PLAN_NEW_ACCOUNT_TITLE");
  else
    v8 = CFSTR("DATA_PLAN_ADD_TITLE");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v10);
  objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v11);

}

- (void)notNow
{
  void *v2;
  SBDataPlanDisableAlertItem *v3;

  if (self->_promptToDisable)
  {
    v3 = objc_alloc_init(SBDataPlanDisableAlertItem);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activateAlertItem:", v3);

  }
}

- (BOOL)isNewAccount
{
  return self->_newAccount;
}

- (void)setNewAccount:(BOOL)a3
{
  self->_newAccount = a3;
}

@end
