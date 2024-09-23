@implementation STIntroAppLimitsViewController

- (STIntroAppLimitsViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  STIntroductionViewModel *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  STIntroAppLimitsViewController *v15;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v17;
  uint64_t v18;
  id continueHandler;
  objc_super v21;

  v6 = (STIntroductionViewModel *)a3;
  v7 = a4;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IntroAppLimitsTitle"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IntroAppLimitsDetail"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationWithHierarchicalColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("hourglass"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)STIntroAppLimitsViewController;
  v15 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v21, sel_initWithTitle_detailText_icon_, v9, v10, v14);
  model = v15->_model;
  v15->_model = v6;
  v17 = v6;

  v18 = objc_msgSend(v7, "copy");
  continueHandler = v15->_continueHandler;
  v15->_continueHandler = (id)v18;

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STIntroAppLimitsViewController tableViewController](self, "tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("allowance.time"), "KVOContextIntroAppLimitsViewController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("allowance.categoryIdentifiers"), "KVOContextIntroAppLimitsViewController");

  v4.receiver = self;
  v4.super_class = (Class)STIntroAppLimitsViewController;
  -[STTableWelcomeController dealloc](&v4, sel_dealloc);
}

- (STIntroAppLimitsTableViewController)tableViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STIntroAppLimitsViewController;
  -[STTableWelcomeController tableViewController](&v3, sel_tableViewController);
  return (STIntroAppLimitsTableViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTableViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroAppLimitsViewController.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(tableViewController == nil) || [tableViewController isKindOfClass:[STIntroAppLimitsTableViewController class]]"));

    }
  }
  -[STIntroAppLimitsViewController tableViewController](self, "tableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("allowance.time"), "KVOContextIntroAppLimitsViewController");
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("allowance.categoryIdentifiers"), "KVOContextIntroAppLimitsViewController");
  v8.receiver = self;
  v8.super_class = (Class)STIntroAppLimitsViewController;
  -[STTableWelcomeController setTableViewController:](&v8, sel_setTableViewController_, v5);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("allowance.time"), 1, "KVOContextIntroAppLimitsViewController");
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("allowance.categoryIdentifiers"), 5, "KVOContextIntroAppLimitsViewController");

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STIntroAppLimitsViewController;
  -[OBTableWelcomeController loadView](&v13, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppLimitsSetAppLimitButton"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__setAppLimit_, 0x2000);
  objc_msgSend(v5, "setEnabled:", 0);
  objc_msgSend(v4, "addButton:", v5);
  -[STIntroAppLimitsViewController setSetAppLimitButton:](self, "setSetAppLimitButton:", v5);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppLimitsSetUpLaterButton"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__notNow_, 0x2000);
  objc_msgSend(v4, "addButton:", v7);
  v9 = (void *)MEMORY[0x24BEBD9A0];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storyboardWithName:bundle:", CFSTR("STIntroAppLimitsTableViewController"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "instantiateInitialViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsViewController setTableViewController:](self, "setTableViewController:", v12);

}

- (void)_setAppLimit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  -[STIntroAppLimitsViewController tableViewController](self, "tableViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsViewController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowance:", v5);

  -[STIntroAppLimitsViewController continueHandler](self, "continueHandler");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();

}

- (void)_notNow:(id)a3
{
  void (**v3)(void);

  -[STIntroAppLimitsViewController continueHandler](self, "continueHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextIntroAppLimitsViewController")
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("allowance.time")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STIntroAppLimitsViewController _allowanceTimeDidChange:](self, "_allowanceTimeDidChange:", v12);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("allowance.categoryIdentifiers")))
        goto LABEL_12;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {

        v12 = 0;
      }
      -[STIntroAppLimitsViewController _allowanceSelectedCategoriesDidChange:](self, "_allowanceSelectedCategoriesDidChange:", v12);
    }

    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)STIntroAppLimitsViewController;
  -[STTableWelcomeController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_12:

}

- (void)_allowanceTimeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STIntroAppLimitsViewController tableViewController](self, "tableViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsViewController _updateSetAppLimitButtonWithTime:selectedCategories:](self, "_updateSetAppLimitButtonWithTime:selectedCategories:", v4, v6);

}

- (void)_allowanceSelectedCategoriesDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STIntroAppLimitsViewController tableViewController](self, "tableViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppLimitsViewController _updateSetAppLimitButtonWithTime:selectedCategories:](self, "_updateSetAppLimitButtonWithTime:selectedCategories:", v6, v4);

}

- (void)_updateSetAppLimitButtonWithTime:(id)a3 selectedCategories:(id)a4
{
  id v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v8 = v10
    && (+[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:"), v7 > 0.0)&& objc_msgSend(v6, "count") != 0;
  -[STIntroAppLimitsViewController setAppLimitButton](self, "setAppLimitButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1240, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1248, 1);
}

- (OBBoldTrayButton)setAppLimitButton
{
  return (OBBoldTrayButton *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setSetAppLimitButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAppLimitButton, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
