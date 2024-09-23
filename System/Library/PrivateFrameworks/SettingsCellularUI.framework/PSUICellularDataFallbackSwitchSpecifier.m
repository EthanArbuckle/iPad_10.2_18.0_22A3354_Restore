@implementation PSUICellularDataFallbackSwitchSpecifier

- (PSUICellularDataFallbackSwitchSpecifier)initWithHostController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PSUICellularDataFallbackSwitchSpecifier *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_SWITCHING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularDataFallbackSwitchSpecifier;
  v7 = -[PSUICellularDataFallbackSwitchSpecifier initWithName:target:set:get:detail:cell:edit:](&v9, sel_initWithName_target_set_get_detail_cell_edit_, v6, self, sel_setFallbackEnabled_specifier_, sel_isFallbackEnabled_, 0, 6, 0);

  if (v7)
  {
    objc_storeWeak((id *)&v7->_hostController, v4);
    -[PSUICellularDataFallbackSwitchSpecifier setProperty:forKey:](v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  }

  return v7;
}

- (void)setFallbackEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = objc_msgSend(a3, "BOOLValue");
  else
    v4 = 0;
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataFallbackEnabled:", v4);

}

- (id)isFallbackEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDataFallbackEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostController);
}

@end
