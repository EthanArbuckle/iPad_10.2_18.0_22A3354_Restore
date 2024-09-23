@implementation CACCustomCommandActionViewController

- (CACCustomCommandActionViewController)init
{
  CACCustomCommandActionViewController *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  v2 = -[CACCustomCommandActionViewController initWithStyle:](self, "initWithStyle:", 1);
  if (v2)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Action"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandActionViewController setTitle:](v2, "setTitle:", v3);

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__CACCustomCommandActionViewController_init__block_invoke;
    v7[3] = &unk_24F2AB0B0;
    objc_copyWeak(&v8, &location);
    v5 = (id)objc_msgSend(v4, "registerShortcutsDidChangeBlock:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __44__CACCustomCommandActionViewController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__CACCustomCommandActionViewController_init__block_invoke_2;
  v11[3] = &unk_24F2ACD68;
  v4 = (id *)(a1 + 32);
  objc_copyWeak(&v12, v4);
  if (objc_msgSend(v3, "indexOfObjectPassingTest:", v11) == 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "commandItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCustomType:", 0);

    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "commandItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomShortcutsWorkflowIdentifier:", 0);

  }
  objc_destroyWeak(&v12);
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

uint64_t __44__CACCustomCommandActionViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "commandItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customShortcutsWorkflowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqualToString:", v6);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACCustomCommandActionViewController;
  -[CACCustomCommandActionViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CustomCommandActionCheckmarkCell"));

  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CustomCommandShortcutsViewCell"));

  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CustomCommandActionTextViewCell"));

  v6 = objc_alloc(MEMORY[0x24BEBDA20]);
  -[CACCustomCommandActionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTarget:action:", v7, sel_endEditing_);

  objc_msgSend(v8, "setCancelsTouchesInView:", 0);
  -[CACCustomCommandActionViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACCustomCommandActionViewController;
  -[CACCustomCommandActionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CACCustomCommandActionViewController setIsPresentingGestureRecorder:](self, "setIsPresentingGestureRecorder:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CACCustomCommandActionViewController;
  -[CACCustomCommandActionViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACCustomCommandActionViewController;
  -[CACCustomCommandActionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (!-[CACCustomCommandActionViewController isPresentingGestureRecorder](self, "isPresentingGestureRecorder"))
  {
    -[CACCustomCommandActionViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didDismissActionViewController:", self);

  }
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return a4 == 1;
  else
    return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  __CFString *v40;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CustomCommandActionTextViewCell"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandActionViewController commandItem](self, "commandItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customTextToInsert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(v8, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    v13 = v8;
    -[CACCustomCommandActionViewController commandItem](self, "commandItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", objc_msgSend(v15, "isEqualToString:", CFSTR("PasteText")) ^ 1);
    v16 = v13;
LABEL_29:

    goto LABEL_30;
  }
  if (!objc_msgSend(v7, "section"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CustomCommandActionCheckmarkCell"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandActionViewController commandItem](self, "commandItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "customType");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v13, "isEqualToString:", CFSTR("RunShortcutsWorkflow"));
    v19 = CFSTR("CustomCommandShortcutsViewCell");
    if (!v18)
      v19 = CFSTR("CustomCommandActionCheckmarkCell");
    v20 = v19;
    if (-[CACCustomCommandActionViewController _shouldDisallowSelectingRowAtIndexPath:](self, "_shouldDisallowSelectingRowAtIndexPath:", v7))
    {

      v20 = CFSTR("CustomCommandShortcutsViewCell");
    }
    v40 = v20;
    switch(objc_msgSend(v7, "row"))
    {
      case 0:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.PasteText"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("PasteText");
        goto LABEL_16;
      case 1:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunGesture"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("RunGesture");
        goto LABEL_16;
      case 2:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunShortcutsWorkflow"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACCustomCommandActionViewController commandItem](self, "commandItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "customShortcutsWorkflowIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortcutForIdentifier:", v25);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v13, "isEqualToString:", CFSTR("RunShortcutsWorkflow"));
        objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shortcuts");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v28)
        {
          v29 = v39;
          objc_msgSend(v39, "shortcutName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunShortcutsWorkflowSetupShortcuts"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v39;
        }

        break;
      case 3:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunUserActionFlow"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("RunUserActionFlow");
LABEL_16:
        v22 = objc_msgSend(v13, "isEqualToString:", v21);
        v15 = 0;
        break;
      default:
        v22 = 0;
        v15 = 0;
        v14 = 0;
        break;
    }
    objc_msgSend(v16, "textLabel", v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v14);

    objc_msgSend(v16, "detailTextLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v15);

    if (v22)
      v32 = 3;
    else
      v32 = 0;
    objc_msgSend(v16, "setAccessoryType:", v32);
    v33 = -[CACCustomCommandActionViewController _shouldDisallowSelectingRowAtIndexPath:](self, "_shouldDisallowSelectingRowAtIndexPath:", v7);
    if (v33)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextColor:", v34);

    if (v33)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detailTextLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextColor:", v36);

    goto LABEL_29;
  }
  v16 = 0;
LABEL_30:

  return v16;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Actions.RecordedCommandsExplanation"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_shouldDisallowSelectingRowAtIndexPath:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "section") && objc_msgSend(v3, "row") == 3 || objc_msgSend(v3, "section") == 1)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "section") || objc_msgSend(v3, "row") != 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortcuts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") == 0;

  }
  return v4;
}

- (BOOL)_useDetailCell
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CACCustomCommandActionViewController commandItem](self, "commandItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RunShortcutsWorkflow")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CACCustomCommandActionViewController commandItem](self, "commandItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortcuts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "count") == 0;

    }
  }

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (-[CACCustomCommandActionViewController _shouldDisallowSelectingRowAtIndexPath:](self, "_shouldDisallowSelectingRowAtIndexPath:", v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CACShortcutsSelectionTableViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v6 = a3;
  v7 = objc_msgSend(v18, "section");
  v8 = v18;
  if (!v7)
  {
    if (objc_msgSend(v18, "row") != 2)
    {
      -[CACCustomCommandActionViewController commandItem](self, "commandItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCustomShortcutsWorkflowIdentifier:", 0);

    }
    v10 = objc_msgSend(v18, "row");
    if (!v10)
    {
      -[CACCustomCommandActionViewController _updateForAction:](self, "_updateForAction:", 0);
LABEL_11:
      v8 = v18;
      goto LABEL_12;
    }
    if (v10 == 2)
    {
      objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandActionViewController commandItem](self, "commandItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "customShortcutsWorkflowIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortcutForIdentifier:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[CACShortcutsSelectionTableViewController initWithPreviouslySelectedShortcut:]([CACShortcutsSelectionTableViewController alloc], "initWithPreviouslySelectedShortcut:", v11);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v12);
      -[CACShortcutsSelectionTableViewController setShortcutsSelectionDelegate:](v12, "setShortcutsSelectionDelegate:", self);
      -[CACCustomCommandActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

      goto LABEL_10;
    }
    v8 = v18;
    if (v10 == 1)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFFA70]), "initWithType:", 1);
      objc_msgSend(v11, "setDelegate:", self);
      v12 = (CACShortcutsSelectionTableViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v11);
      -[CACShortcutsSelectionTableViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 0);
      -[CACCustomCommandActionViewController setIsPresentingGestureRecorder:](self, "setIsPresentingGestureRecorder:", 1);
      -[CACCustomCommandActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
LABEL_10:

      goto LABEL_11;
    }
  }
LABEL_12:
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v8, 1);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "numberOfSections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v17, 100);

}

- (void)_updateForAction:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 > 3)
    v5 = 0;
  else
    v5 = off_24F2ACD88[a3];
  -[CACCustomCommandActionViewController commandItem](self, "commandItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomType:", v5);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CACCustomCommandActionViewController tableView](self, "tableView", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if (v16 == v9)
          v17 = 3;
        else
          v17 = 0;
        objc_msgSend(v16, "setAccessoryType:", v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deselectRowAtIndexPath:animated:", v7, 1);

  -[CACCustomCommandActionViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didUpdateCommandItemForActionViewController:", self);

}

- (void)gestureRecorder:(id)a3 saveReplayableGesture:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CACCustomCommandActionViewController commandItem](self, "commandItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomGesture:", v5);

  -[CACCustomCommandActionViewController _updateForAction:](self, "_updateForAction:", 1);
  -[CACCustomCommandActionViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)didSelectShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandActionViewController commandItem](self, "commandItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomShortcutsWorkflowIdentifier:", v6);

    CACLogShortcuts();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CACCustomCommandActionViewController commandItem](self, "commandItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_229A40000, v8, OS_LOG_TYPE_DEFAULT, "Delegate received shortcut %@ for commandItem %@", (uint8_t *)&v11, 0x16u);

    }
    -[CACCustomCommandActionViewController _updateForAction:](self, "_updateForAction:", 2);
    -[CACCustomCommandActionViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandActionViewController commandItem](self, "commandItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomTextToInsert:", v4);

  -[CACCustomCommandActionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didUpdateCommandItemForActionViewController:", self);

}

- (id)_stringFromPasteboardDataArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD7E8], "pasteboardWithUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("CustomPasteBoardType"), (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("CustomPasteBoardData"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
          objc_msgSend(v5, "setObject:forKey:", v13, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  v23 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v15);

  objc_msgSend(v4, "strings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCustomCommandActionViewControllerDelegate)delegate
{
  return (CACCustomCommandActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CACSpokenCommandItem)commandItem
{
  return self->_commandItem;
}

- (void)setCommandItem:(id)a3
{
  objc_storeStrong((id *)&self->_commandItem, a3);
}

- (BOOL)isPresentingGestureRecorder
{
  return self->_isPresentingGestureRecorder;
}

- (void)setIsPresentingGestureRecorder:(BOOL)a3
{
  self->_isPresentingGestureRecorder = a3;
}

- (AXSiriShortcut)selectedShortcutForCommand
{
  return self->_selectedShortcutForCommand;
}

- (void)setSelectedShortcutForCommand:(id)a3
{
  objc_storeStrong((id *)&self->_selectedShortcutForCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedShortcutForCommand, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
