@implementation SBDataPlanExpirationAlertItem

- (SBDataPlanExpirationAlertItem)initWithAccountURL:(id)a3 expirationDate:(id)a4
{
  id v6;
  SBDataPlanExpirationAlertItem *v7;
  SBDataPlanExpirationAlertItem *v8;

  v6 = a4;
  v7 = -[SBDataPlanAccountAlertItem initWithAccountURL:](self, "initWithAccountURL:", a3);
  v8 = v7;
  if (v7)
    -[SBDataPlanExpirationAlertItem setExpirationDate:](v7, "setExpirationDate:", v6);

  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  float v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBDataPlanExpirationAlertItem;
  -[SBDataPlanAccountAlertItem configure:requirePasscodeForActions:](&v17, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_ADD_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);
  -[NSDate timeIntervalSinceNow](self->_expirationDate, "timeIntervalSinceNow");
  if (v8 >= 3600.0)
  {
    if (v8 <= 84600.0)
    {
      v9 = (unint64_t)fmax(floor(v8 / 3600.0), 1.0);
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("DATA_PLAN_ADD_EXPIRATION_BODY_HOURS");
    }
    else
    {
      v9 = (unint64_t)fmax(ceil(v8 / 86400.0), 1.0);
      v14 = -(v8 - (double)v9 * 86400.0) / 86400.0;
      if (v14 >= 0.75)
      {
        --v9;
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("DATA_PLAN_ADD_EXPIRATION_BODY_DAYS");
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("DATA_PLAN_ADD_EXPIRATION_BODY_LESS_THAN_DAYS");
      }
    }
  }
  else
  {
    v9 = vcvtad_u64_f64(fmax(v8 / 60.0, 2.0));
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("DATA_PLAN_ADD_EXPIRATION_BODY_MINUTES");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, CFSTR("SpringBoardPlurals"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessage:", v16);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
