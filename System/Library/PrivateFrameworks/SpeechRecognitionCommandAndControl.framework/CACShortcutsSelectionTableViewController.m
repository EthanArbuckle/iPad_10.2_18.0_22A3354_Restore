@implementation CACShortcutsSelectionTableViewController

- (CACShortcutsSelectionTableViewController)initWithPreviouslySelectedShortcut:(id)a3
{
  id v5;
  CACShortcutsSelectionTableViewController *v6;
  CACShortcutsSelectionTableViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACShortcutsSelectionTableViewController;
  v6 = -[CACShortcutsSelectionTableViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_previouslySelectedShortcut, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACShortcutsSelectionTableViewController;
  -[CACShortcutsSelectionTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[CACShortcutsSelectionTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[CACShortcutsSelectionTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[CACShortcutsSelectionTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ShortcutsCell"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonAction);
  -[CACShortcutsSelectionTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortcuts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACShortcutsSelectionTableViewController setCachedShortcuts:](self, "setCachedShortcuts:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSString *v5;
  NSString *shortcutsToken;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACShortcutsSelectionTableViewController;
  -[CACShortcutsSelectionTableViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CACShortcutsSelectionTableViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_24F2AB0B0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "registerShortcutsDidChangeBlock:", v7);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  shortcutsToken = self->_shortcutsToken;
  self->_shortcutsToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__CACShortcutsSelectionTableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
    v4 = v5;
  else
    v4 = (id)MEMORY[0x24BDBD1A8];
  objc_msgSend(WeakRetained, "shortcutsDidChange:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACShortcutsSelectionTableViewController shortcutsToken](self, "shortcutsToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterShortcutsDidChangeBlock:", v6);

  -[CACShortcutsSelectionTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_6);
  v7.receiver = self;
  v7.super_class = (Class)CACShortcutsSelectionTableViewController;
  -[CACShortcutsSelectionTableViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

void __62__CACShortcutsSelectionTableViewController_viewWillDisappear___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  CACLogShortcuts();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_229A40000, v0, OS_LOG_TYPE_DEFAULT, "View disappeared. Dismissing.", v1, 2u);
  }

}

- (void)cancelButtonAction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62__CACShortcutsSelectionTableViewController_cancelButtonAction__block_invoke;
  v2[3] = &unk_24F2AA860;
  v2[4] = self;
  -[CACShortcutsSelectionTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __62__CACShortcutsSelectionTableViewController_cancelButtonAction__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "shortcutsSelectionDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didSelectShortcut:", 0);

  CACLogShortcuts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_229A40000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling selection of shortcut", v3, 2u);
  }

}

- (void)setCachedShortcuts:(id)a3
{
  NSArray *v4;
  CACShortcutsSelectionTableViewController *v5;
  NSArray *cachedShortcuts;
  NSArray *v7;
  _QWORD block[5];

  v4 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  cachedShortcuts = v5->_cachedShortcuts;
  v5->_cachedShortcuts = v4;
  v7 = v4;

  objc_sync_exit(v5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CACShortcutsSelectionTableViewController_setCachedShortcuts___block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__CACShortcutsSelectionTableViewController_setCachedShortcuts___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)shortcutsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CACLogShortcuts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_229A40000, v5, OS_LOG_TYPE_DEFAULT, "New shortcuts %@", (uint8_t *)&v6, 0xCu);
  }

  -[CACShortcutsSelectionTableViewController setCachedShortcuts:](self, "setCachedShortcuts:", v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CACShortcutsSelectionTableViewController cachedShortcuts](self, "cachedShortcuts", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ShortcutsCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("ShortcutsCell"));
  -[CACShortcutsSelectionTableViewController cachedShortcuts](self, "cachedShortcuts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "shortcutName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "shortcutName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\"%@\"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACShortcutsSelectionTableViewController previouslySelectedShortcut](self, "previouslySelectedShortcut");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v18)
  {
    objc_msgSend(v7, "setAccessoryType:", 3);
    -[CACShortcutsSelectionTableViewController setPreviouslySelectedIndex:](self, "setPreviouslySelectedIndex:", v6);
  }
  else
  {
    objc_msgSend(v7, "setAccessoryType:", 0);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CACShortcutsSelectionTableViewController previouslySelectedIndex](self, "previouslySelectedIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 0);
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 3);
  -[CACShortcutsSelectionTableViewController cachedShortcuts](self, "cachedShortcuts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACShortcutsSelectionTableViewController shortcutsSelectionDelegate](self, "shortcutsSelectionDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didSelectShortcut:", v13);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__CACShortcutsSelectionTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_24F2AA860;
  v17 = v13;
  v15 = v13;
  -[CACShortcutsSelectionTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v16);

}

void __78__CACShortcutsSelectionTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CACLogShortcuts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_229A40000, v2, OS_LOG_TYPE_DEFAULT, "Selected shortcut %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACShortcutsSelectionDelegate)shortcutsSelectionDelegate
{
  return self->_shortcutsSelectionDelegate;
}

- (void)setShortcutsSelectionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsSelectionDelegate, a3);
}

- (NSArray)cachedShortcuts
{
  return self->_cachedShortcuts;
}

- (AXSiriShortcut)previouslySelectedShortcut
{
  return self->_previouslySelectedShortcut;
}

- (void)setPreviouslySelectedShortcut:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedShortcut, a3);
}

- (NSIndexPath)previouslySelectedIndex
{
  return self->_previouslySelectedIndex;
}

- (void)setPreviouslySelectedIndex:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedIndex, a3);
}

- (NSString)shortcutsToken
{
  return self->_shortcutsToken;
}

- (void)setShortcutsToken:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsToken, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndex, 0);
  objc_storeStrong((id *)&self->_previouslySelectedShortcut, 0);
  objc_storeStrong((id *)&self->_cachedShortcuts, 0);
  objc_storeStrong((id *)&self->_shortcutsSelectionDelegate, 0);
}

@end
