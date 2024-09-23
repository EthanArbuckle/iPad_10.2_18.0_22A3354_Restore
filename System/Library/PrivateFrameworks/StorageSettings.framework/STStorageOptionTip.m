@implementation STStorageOptionTip

- (int64_t)eventualGain
{
  void *v2;
  int64_t v3;

  -[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stEventualGain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (float)activationPercent
{
  void *v2;
  float v3;
  float v4;

  -[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stPercent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (int64_t)immediateGain
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STStorageTip specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("stImmediateGain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (STStorageOptionTip)init
{
  STStorageOptionTip *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStorageOptionTip;
  v2 = -[STStorageTip init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, v2, sel_setValue_specifier_, 0, 0, 6, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[STStorageTip setSpecifier:](v2, "setSpecifier:", v3);
    -[STStorageTip setProperty:forKey:](v2, "setProperty:forKey:", CFSTR("stOptionTip"), CFSTR("stTipKind"));

  }
  return v2;
}

- (void)enableOption
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "enableOptionForTip:", self);

  objc_msgSend(MEMORY[0x24BEB1C88], "sharedNotifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postAppsStateChanged:", 0);

}

- (void)performAdditionalAction
{
  STStorageOptionTipDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "performAdditionalAction:", self);

  }
}

- (void)setValue:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[STStorageOptionTip confirmationText](self, "confirmationText", a3, a4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    -[STStorageOptionTip confirmationButtonTitle](self, "confirmationButtonTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[STStorageTip title](self, "title");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    STFrameworkLocStr(CFSTR("ST_CANCEL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (char *)objc_alloc_init(MEMORY[0x24BE754D0]);
    objc_msgSend(v10, "setTitle:", v8);
    objc_msgSend(v10, "setPrompt:", v18);
    objc_msgSend(v10, "setCancelButton:", v9);
    STFrameworkLocStr(CFSTR("ST_ENABLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOkButton:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[STStorageOptionTip mayCauseDataLoss](self, "mayCauseDataLoss"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x24BE75978]);

    objc_storeWeak((id *)&v10[*MEMORY[0x24BE75768]], self);
    objc_msgSend(v10, "setConfirmationAction:", sel_enableOption);
    -[STStorageOptionTip additionalButtonTitle](self, "additionalButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      -[STStorageOptionTip additionalButtonTitle](self, "additionalButtonTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlternateButton:", v15);

      objc_msgSend(v10, "setConfirmationAlternateAction:", sel_performAdditionalAction);
    }
    -[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("_stController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pointerValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showConfirmationViewForSpecifier:", v10);

  }
  else
  {
    -[STStorageOptionTip enableOption](self, "enableOption");
  }

}

- (id)getValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (void)setEnableButtonTitle:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stEnableTitle"));
}

- (NSString)enableButtonTitle
{
  return (NSString *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stEnableTitle"));
}

- (void)setActivationPercent:(float)a3
{
  double v5;
  id v6;

  -[STStorageOptionTip activationPercent](self, "activationPercent");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", v6, CFSTR("stPercent"));

  }
}

- (void)setActivatingString:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stActivating"));
}

- (NSString)activatingString
{
  return (NSString *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stActivating"));
}

- (void)setImmediateGain:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", v4, CFSTR("stImmediateGain"));

}

- (void)setEventualGain:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", v4, CFSTR("stEventualGain"));

}

- (STStorageOptionTipDelegate)delegate
{
  return (STStorageOptionTipDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)mayCauseDataLoss
{
  return self->_mayCauseDataLoss;
}

- (void)setMayCauseDataLoss:(BOOL)a3
{
  self->_mayCauseDataLoss = a3;
}

- (NSString)confirmationText
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfirmationText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)confirmationButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfirmationButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)additionalButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAdditionalButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
