@implementation CACOnboardingCommandsDetailViewController

- (CACOnboardingCommandsDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 commandGroups:(id)a5
{
  id v9;
  CACOnboardingCommandsDetailViewController *v10;
  CACOnboardingCommandsDetailViewController *v11;
  void *v12;
  OBTrayButton *mainButton;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACOnboardingCommandsDetailViewController;
  v10 = -[CACOnboardingCommandsDetailViewController initWithTitle:detailText:symbolName:](&v15, sel_initWithTitle_detailText_symbolName_, a3, a4, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_commandGroups, a5);
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    mainButton = v11->_mainButton;
    v11->_mainButton = (OBTrayButton *)v12;

  }
  return v11;
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)CACOnboardingCommandsDetailViewController;
  -[OBBaseWelcomeController viewDidLoad](&v35, sel_viewDidLoad);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CACOnboardingCommandsDetailViewController commandGroups](self, "commandGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[CACOnboardingCommandsDetailViewController commandGroups](self, "commandGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 != 1)
        {
          objc_msgSend(v7, "groupTitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", v10, &stru_24F2ADCC8);

        }
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v7, "commands");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v16, "titleText");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "helperText");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v17, v18);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v13);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v4);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismiss);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  -[CACOnboardingCommandsDetailViewController mainButton](self, "mainButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Done"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v22, 0);

  -[CACOnboardingCommandsDetailViewController mainButton](self, "mainButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_dismiss, 64);

  if (!-[CACOnboardingCommandsDetailViewController hideTrayButtons](self, "hideTrayButtons"))
  {
    -[CACOnboardingCommandsDetailViewController buttonTray](self, "buttonTray");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACOnboardingCommandsDetailViewController mainButton](self, "mainButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addButton:", v25);

  }
}

- (void)setHideTrayButtons:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  CACOnboardingCommandsDetailViewController *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[CACOnboardingCommandsDetailViewController buttonTray](obj, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  obj->_hideTrayButtons = v3;
  objc_sync_exit(obj);

}

- (void)dismiss
{
  -[CACOnboardingCommandsDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_7);
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)hideTrayButtons
{
  return self->_hideTrayButtons;
}

- (BOOL)skipAnalytics
{
  return self->_skipAnalytics;
}

- (void)setSkipAnalytics:(BOOL)a3
{
  self->_skipAnalytics = a3;
}

- (OBTrayButton)mainButton
{
  return self->_mainButton;
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (CACOnboardingCommandsDetailViewController)nextCommandGroupVC
{
  return self->_nextCommandGroupVC;
}

- (void)setNextCommandGroupVC:(id)a3
{
  objc_storeStrong((id *)&self->_nextCommandGroupVC, a3);
}

- (NSArray)commandGroups
{
  return self->_commandGroups;
}

- (void)setCommandGroups:(id)a3
{
  objc_storeStrong((id *)&self->_commandGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandGroups, 0);
  objc_storeStrong((id *)&self->_nextCommandGroupVC, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_mainButton, 0);
}

@end
