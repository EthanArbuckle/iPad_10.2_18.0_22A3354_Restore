@implementation CACContextCluesViewController

- (CACContextCluesViewController)initWithCommands:(id)a3
{
  id v4;
  CACContextCluesViewController *v5;
  CACContextCluesWelcomeController *v6;
  void *v7;
  CACContextCluesWelcomeController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CACContextCluesViewController;
  v5 = -[CACContextCluesViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = [CACContextCluesWelcomeController alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ContextClues.Title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[OBTextWelcomeController initWithTitle:](v6, "initWithTitle:", v7);
    -[CACContextCluesViewController setContextCluesController:](v5, "setContextCluesController:", v8);

    -[CACContextCluesViewController setCommands:](v5, "setCommands:", v4);
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CACContextCluesViewController;
  -[CACContextCluesViewController viewDidAppear:](&v15, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rootSheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v6 = objc_alloc(MEMORY[0x24BEBD7A0]);
  -[CACContextCluesViewController contextCluesController](self, "contextCluesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRootViewController:", v7);

  v9 = objc_alloc(MEMORY[0x24BEBD410]);
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Done"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 2, self, sel_doneButtonPressed);
  -[CACContextCluesViewController contextCluesController](self, "contextCluesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v11);

  -[CACContextCluesViewController setPresentingNavigationController:](self, "setPresentingNavigationController:", v8);
  objc_msgSend(v8, "presentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[CACContextCluesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[CACContextCluesViewController presentingNavigationController](self, "presentingNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rootSheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 1);

  v8.receiver = self;
  v8.super_class = (Class)CACContextCluesViewController;
  -[CACContextCluesViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
}

- (void)setCommands:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  if (self->_commands != v5)
  {
    objc_storeStrong((id *)&self->_commands, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[CACContextCluesViewController contextCluesController](self, "contextCluesController", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "titleText");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "helperText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addBulletedListItemWithTitle:description:", v13, v14);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (void)doneButtonPressed
{
  id v2;

  -[CACContextCluesViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextCludesDidPressDoneButton");

}

- (int64_t)zOrder
{
  return 7;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACContextCluesDelegate)delegate
{
  return (CACContextCluesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)commands
{
  return self->_commands;
}

- (CACContextCluesWelcomeController)contextCluesController
{
  return self->_contextCluesController;
}

- (void)setContextCluesController:(id)a3
{
  objc_storeStrong((id *)&self->_contextCluesController, a3);
}

- (UINavigationController)presentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void)setPresentingNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingNavigationController, 0);
  objc_storeStrong((id *)&self->_contextCluesController, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
