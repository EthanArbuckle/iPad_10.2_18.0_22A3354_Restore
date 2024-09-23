@implementation PSUIOtherOptionsGroup

- (PSUIOtherOptionsGroup)init
{
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUIOtherOptionsGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIOtherOptionsGroup *v8;
  PSUIOtherOptionsGroup *v9;
  PSSpecifier *groupSpecifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSUIOtherOptionsGroup;
  v8 = -[PSUIOtherOptionsGroup init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
    groupSpecifier = v9->_groupSpecifier;
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);

  }
  return v9;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setButtonAction:", sel_otherOptionsPressed_);
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (void)otherOptionsPressed:(id)a3
{
  id v4;
  PSUIAddNewPlanController *v5;
  id WeakRetained;
  id v7;

  v4 = objc_alloc(MEMORY[0x24BEBD7A0]);
  v5 = objc_alloc_init(PSUIAddNewPlanController);
  v7 = (id)objc_msgSend(v4, "initWithRootViewController:", v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("OtherOptions"));
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
