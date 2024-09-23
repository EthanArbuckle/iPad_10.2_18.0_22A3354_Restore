@implementation SBDataPlanUsageAlertItem

- (SBDataPlanUsageAlertItem)initWithAccountURL:(id)a3 usage:(id)a4
{
  id v6;
  SBDataPlanUsageAlertItem *v7;
  SBDataPlanUsageAlertItem *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBDataPlanUsageAlertItem;
  v7 = -[SBDataPlanAccountAlertItem initWithAccountURL:](&v10, sel_initWithAccountURL_, a3);
  v8 = v7;
  if (v7)
    -[SBDataPlanUsageAlertItem setRemainingPortion:](v7, "setRemainingPortion:", v6);

  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBDataPlanUsageAlertItem;
  -[SBDataPlanAccountAlertItem configure:requirePasscodeForActions:](&v16, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_ADD_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);
  -[SBDataPlanUsageAlertItem remainingPortion](self, "remainingPortion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v10 <= 0.01)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_ADD_EMPTY_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_ADD_LOW_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)SBApp;
    -[SBDataPlanUsageAlertItem remainingPortion](self, "remainingPortion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formattedPercentStringForNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "setMessage:", v15);

}

- (NSNumber)remainingPortion
{
  return self->_remainingPortion;
}

- (void)setRemainingPortion:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPortion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingPortion, 0);
}

@end
