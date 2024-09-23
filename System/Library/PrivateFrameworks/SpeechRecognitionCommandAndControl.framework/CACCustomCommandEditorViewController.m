@implementation CACCustomCommandEditorViewController

- (CACCustomCommandEditorViewController)init
{
  CACCustomCommandEditorViewController *v2;
  uint64_t v3;
  UIBarButtonItem *editButton;
  uint64_t v5;
  UIBarButtonItem *doneButton;
  uint64_t v7;
  UIBarButtonItem *saveButton;
  uint64_t v9;
  UIBarButtonItem *cancelButton;

  v2 = -[CACCustomCommandEditorViewController initWithStyle:](self, "initWithStyle:", 1);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 2, v2, sel_editButtonTapped_);
    editButton = v2->_editButton;
    v2->_editButton = (UIBarButtonItem *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v2, sel_doneButtonTapped_);
    doneButton = v2->_doneButton;
    v2->_doneButton = (UIBarButtonItem *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, v2, sel_saveButtonTapped);
    saveButton = v2->_saveButton;
    v2->_saveButton = (UIBarButtonItem *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_cancelAction);
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v9;

  }
  return v2;
}

- (void)viewDidLoad
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CACCustomCommandEditorViewController;
  -[CACCustomCommandEditorViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = -[CACCustomCommandEditorViewController isNewCommand](self, "isNewCommand");
  -[CACCustomCommandEditorViewController commandItem](self, "commandItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[CACCustomCommandEditorViewController setMutableCommandItem:](self, "setMutableCommandItem:", v4);
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[CACCustomCommandEditorViewController setMutableCommandItem:](self, "setMutableCommandItem:", v6);

  }
  -[CACCustomCommandEditorViewController setIsInEditingMode:](self, "setIsInEditingMode:", -[CACCustomCommandEditorViewController isNewCommand](self, "isNewCommand"));
  -[CACCustomCommandEditorViewController configureNavItems](self, "configureNavItems");
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.NewCommandTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController setTitle:](self, "setTitle:", v7);

  v8 = objc_alloc(MEMORY[0x24BEBDA20]);
  -[CACCustomCommandEditorViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:action:", v9, sel_endEditing_);

  objc_msgSend(v10, "setCancelsTouchesInView:", 0);
  -[CACCustomCommandEditorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v10);

  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController setShortcutsManager:](self, "setShortcutsManager:", v12);

}

- (BOOL)isModalInPresentation
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  BOOL v7;

  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RunGesture")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PasteText")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("RunUserActionFlow")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("RunShortcutsWorkflow")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PasteBoard"));
  }
  v6 = -[CACCustomCommandEditorViewController hasEmptySpokenString](self, "hasEmptySpokenString");
  v7 = (v5 | ~v6) & -[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode");

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACCustomCommandEditorViewController;
  -[CACCustomCommandEditorViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[CACCustomCommandEditorViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v7 = -[CACCustomCommandEditorViewController isNewCommand](self, "isNewCommand");

    if (!v7)
      return;
    -[CACCustomCommandEditorViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CACCustomCommandEditorViewController;
  -[CACCustomCommandEditorViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)saveButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  if (-[CACCustomCommandEditorViewController isValidCommandItem](self, "isValidCommandItem"))
  {
    -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandEditorViewController setCommandItem:](self, "setCommandItem:", v3);

    -[CACCustomCommandEditorViewController delegate](self, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          -[CACCustomCommandEditorViewController delegate](self, "delegate"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_opt_respondsToSelector(),
          v6,
          v5,
          (v7 & 1) != 0))
    {
      -[CACCustomCommandEditorViewController delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didFinishEditingCustomCommandForEditor:", self);

    }
    else
    {
      -[CACCustomCommandEditorViewController commandItem](self, "commandItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "saveToPreferences");

      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__CACCustomCommandEditorViewController_saveButtonTapped__block_invoke;
      v10[3] = &unk_24F2AA860;
      v10[4] = self;
      -[CACCustomCommandEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
    }
  }
  else
  {
    -[CACCustomCommandEditorViewController showAlertIfNeededForAnyError](self, "showAlertIfNeededForAnyError");
  }
}

void __56__CACCustomCommandEditorViewController_saveButtonTapped__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdatePropertiesForEditor:", *(_QWORD *)(a1 + 32));

}

- (void)cancelAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[5];

  -[CACCustomCommandEditorViewController delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CACCustomCommandEditorViewController delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[CACCustomCommandEditorViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCancelEditingCustomCommandForEditor:", self);

  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__CACCustomCommandEditorViewController_cancelAction__block_invoke;
    v8[3] = &unk_24F2AA860;
    v8[4] = self;
    -[CACCustomCommandEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  }
}

void __52__CACCustomCommandEditorViewController_cancelAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdatePropertiesForEditor:", *(_QWORD *)(a1 + 32));

}

- (void)editButtonTapped:(id)a3
{
  -[CACCustomCommandEditorViewController setIsInEditingMode:](self, "setIsInEditingMode:", 1);
  -[CACCustomCommandEditorViewController configureNavItems](self, "configureNavItems");
}

- (void)doneButtonTapped:(id)a3
{
  _QWORD v4[5];

  -[CACCustomCommandEditorViewController setIsInEditingMode:](self, "setIsInEditingMode:", 0);
  -[CACCustomCommandEditorViewController configureNavItems](self, "configureNavItems");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__CACCustomCommandEditorViewController_doneButtonTapped___block_invoke;
  v4[3] = &unk_24F2AA860;
  v4[4] = self;
  -[CACCustomCommandEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
}

void __57__CACCustomCommandEditorViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdatePropertiesForEditor:", *(_QWORD *)(a1 + 32));

}

- (void)configureNavItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode"))
    -[CACCustomCommandEditorViewController saveButton](self, "saveButton");
  else
    -[CACCustomCommandEditorViewController editButton](self, "editButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  if (-[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode"))
    -[CACCustomCommandEditorViewController cancelButton](self, "cancelButton");
  else
    -[CACCustomCommandEditorViewController doneButton](self, "doneButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

}

- (BOOL)isNewCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController commandItem](self, "commandItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForCommandIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CACCustomCommandEditorViewController *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_isInEditingMode = v3;
  -[CACCustomCommandEditorViewController setShowsDeleteButton:](obj, "setShowsDeleteButton:", v3);
  -[CACCustomCommandEditorViewController tableView](obj, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD15E0];
  -[CACCustomCommandEditorViewController tableView](obj, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "numberOfSections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:withRowAnimation:", v7, 100);

  objc_sync_exit(obj);
}

- (BOOL)isValidCommandItem
{
  _BOOL4 v3;

  v3 = -[CACCustomCommandEditorViewController _hasValidSpokenStringWithErrorText:](self, "_hasValidSpokenStringWithErrorText:", 0);
  if (v3)
    LOBYTE(v3) = -[CACCustomCommandEditorViewController _hasValidActionWithErrorText:](self, "_hasValidActionWithErrorText:", 0);
  return v3;
}

- (BOOL)isEmptyCommandItem
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CACCustomCommandEditorViewController hasEmptySpokenString](self, "hasEmptySpokenString"))
  {
    objc_msgSend(v3, "customType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v3, "customScope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope"));

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasEmptySpokenString
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)showAlertIfNeededForErrorInSpokenString
{
  BOOL v3;
  id v4;
  id v6;

  v6 = 0;
  v3 = -[CACCustomCommandEditorViewController _hasValidSpokenStringWithErrorText:](self, "_hasValidSpokenStringWithErrorText:", &v6);
  v4 = v6;
  if (!v3)
    -[CACCustomCommandEditorViewController _showErrorAlertWithText:](self, "_showErrorAlertWithText:", v4);

  return !v3;
}

- (BOOL)_showAlertIfNeededForAction
{
  BOOL v3;
  id v4;
  id v6;

  v6 = 0;
  v3 = -[CACCustomCommandEditorViewController _hasValidActionWithErrorText:](self, "_hasValidActionWithErrorText:", &v6);
  v4 = v6;
  if (!v3)
    -[CACCustomCommandEditorViewController _showErrorAlertWithText:](self, "_showErrorAlertWithText:", v4);

  return !v3;
}

- (BOOL)showAlertIfNeededForAnyError
{
  return -[CACCustomCommandEditorViewController showAlertIfNeededForErrorInSpokenString](self, "showAlertIfNeededForErrorInSpokenString")|| -[CACCustomCommandEditorViewController _showAlertIfNeededForAction](self, "_showAlertIfNeededForAction");
}

- (void)_showErrorAlertWithText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BEBD3B0];
  v5 = a3;
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v5, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v9);
  -[CACCustomCommandEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (BOOL)_hasValidSpokenStringWithErrorText:(id *)a3
{
  CACCustomCommandEditorViewController *v4;
  void *v5;
  void *v6;
  CACSpokenCommandPresentation *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  CACSpokenCommandPresentation *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = self;
  v26 = *MEMORY[0x24BDAC8D0];
  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = -[CACCustomCommandEditorViewController _commandStringIsValid:checkForLength:](v4, "_commandStringIsValid:checkForLength:", v6, 1);

  if (!(_DWORD)v4)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.EmptyName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_22;
    goto LABEL_21;
  }
  v7 = objc_alloc_init(CACSpokenCommandPresentation);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CACSpokenCommandPresentation flattenedCommandGroupsAndItems](v7, "flattenedCommandGroupsAndItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v20 = v7;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isGroup") & 1) == 0)
        {
          v14 = v13;
          objc_msgSend(v5, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
          {

          }
          else
          {
            v17 = objc_msgSend(v5, "conflictsWithItem:", v14);

            if ((v17 & 1) != 0)
            {

              +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Error.ConflictingName"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_18;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }

    v18 = 0;
LABEL_18:
    v7 = v20;
  }
  else
  {

    v18 = 0;
  }

  if (a3)
LABEL_21:
    *a3 = objc_retainAutorelease(v18);
LABEL_22:

  return v18 == 0;
}

- (BOOL)_hasValidActionWithErrorText:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;

  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RunGesture"));

  if (!v6)
  {
    objc_msgSend(v4, "customType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PasteText"));

    if (v10)
    {
      objc_msgSend(v4, "customTextToInsert");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
        goto LABEL_15;
      v8 = CFSTR("CustomCommand.Error.EmptyTextToInsert");
    }
    else
    {
      objc_msgSend(v4, "customType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("RunUserActionFlow"));

      if (v14)
      {
        objc_msgSend(v4, "customUserActionFlow");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userActions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
          goto LABEL_15;
        v8 = CFSTR("CustomCommand.Error.EmptyUserActionFlow");
      }
      else
      {
        objc_msgSend(v4, "customType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("RunShortcutsWorkflow"));

        if (v19)
        {
          objc_msgSend(v4, "customShortcutsWorkflowIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          if (v21)
            goto LABEL_15;
          v8 = CFSTR("CustomCommand.Error.EmptyShortcutsWorkflow");
        }
        else
        {
          objc_msgSend(v4, "customType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("PasteBoard"));

          if (v23)
          {
            objc_msgSend(v4, "customPasteBoard");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

            if (v25)
              goto LABEL_15;
            v8 = CFSTR("CustomCommand.Error.EmptyPasteBoard");
          }
          else
          {
            v8 = CFSTR("CustomCommand.Error.EmptyAction");
          }
        }
      }
    }
LABEL_20:
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v4, "customGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = CFSTR("CustomCommand.Error.EmptyGesture");
    goto LABEL_20;
  }
LABEL_15:
  v26 = 0;
  if (a3)
LABEL_16:
    *a3 = objc_retainAutorelease(v26);
LABEL_17:

  return v26 == 0;
}

- (BOOL)_commandStringIsValid:(id)a3 checkForLength:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)objc_msgSend(v7, "length") > 3;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSDictionary)applicationIdentifiersToNames
{
  NSDictionary *applicationIdentifiersToNames;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  applicationIdentifiersToNames = self->_applicationIdentifiersToNames;
  if (!applicationIdentifiersToNames)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installedApps");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_applicationIdentifiersToNames;
    self->_applicationIdentifiersToNames = v5;

    applicationIdentifiersToNames = self->_applicationIdentifiersToNames;
  }
  return applicationIdentifiersToNames;
}

- (BOOL)_shouldShowDeleteButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode")
    || !-[CACCustomCommandEditorViewController showsDeleteButton](self, "showsDeleteButton"))
  {
    return 0;
  }
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController commandItem](self, "commandItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForCommandIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2)
    return 0;
  else
    return qword_229AD3ED8[a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
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
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.SpokenString"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  const __CFString *v5;
  void *v6;

  if (-[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode", a3))
  {
    if (!a4)
    {
      v5 = CFSTR("CustomCommand.SpokenStringFooterText");
      goto LABEL_7;
    }
    if (a4 == 1)
    {
      v5 = CFSTR("CustomCommand.ActionFooterText");
LABEL_7:
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  v6 = 0;
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  CACCustomCommandEditorTextFieldCell *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  CACCustomCommandEditorTextFieldCell *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") == 2)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Delete"));
      v8 = (CACCustomCommandEditorTextFieldCell *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = (CACCustomCommandEditorTextFieldCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Delete"));
        -[CACCustomCommandEditorTextFieldCell textLabel](v8, "textLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTextAlignment:", 1);

        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Delete"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACCustomCommandEditorTextFieldCell textLabel](v8, "textLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v10);

        objc_msgSend(MEMORY[0x24BEBD4B8], "_systemDestructiveTintColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACCustomCommandEditorTextFieldCell textLabel](v8, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextColor:", v12);

      }
      -[CACCustomCommandEditorTextFieldCell setHidden:](v8, "setHidden:", -[CACCustomCommandEditorViewController _shouldShowDeleteButton](self, "_shouldShowDeleteButton") ^ 1);
      goto LABEL_32;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Property"));
    v8 = (CACCustomCommandEditorTextFieldCell *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = (CACCustomCommandEditorTextFieldCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("Property"));
    v19 = objc_msgSend(v7, "row");
    if (v19 == 1)
    {
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Application"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "customScope");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope")))
      {
        v23 = CFSTR("CustomCommand.AnyApplication");
        goto LABEL_17;
      }
      -[CACCustomCommandEditorViewController applicationIdentifiersToNames](self, "applicationIdentifiersToNames");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v22);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v19)
      {
        v25 = 0;
        v20 = 0;
        goto LABEL_26;
      }
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Action"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "customType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "isEqualToString:", CFSTR("RunGesture")))
      {
        v23 = CFSTR("CustomCommand.RunGesture");
LABEL_17:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
        -[CACCustomCommandEditorTextFieldCell textLabel](v8, "textLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setText:", v20);

        -[CACCustomCommandEditorTextFieldCell detailTextLabel](v8, "detailTextLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", v25);

        if (-[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode"))
        {
          -[CACCustomCommandEditorTextFieldCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 1);
          if (!objc_msgSend(v7, "row"))
          {
            -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "customType");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[CACCustomCommandEditorTextFieldCell setAccessoryType:](v8, "setAccessoryType:", objc_msgSend(v37, "isEqualToString:", CFSTR("RunUserActionFlow")) ^ 1);

            goto LABEL_31;
          }
          v33 = v8;
          v34 = 1;
        }
        else
        {
          -[CACCustomCommandEditorTextFieldCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
          v33 = v8;
          v34 = 0;
        }
        -[CACCustomCommandEditorTextFieldCell setAccessoryType:](v33, "setAccessoryType:", v34);
LABEL_31:

        goto LABEL_32;
      }
      if (!objc_msgSend(v22, "isEqualToString:", CFSTR("PasteText")))
      {
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("RunUserActionFlow")))
        {
          v47 = (void *)MEMORY[0x24BDD17C8];
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunUserActionFlowWithNumber"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACCustomCommandEditorViewController commandItem](self, "commandItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "customUserActionFlow");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "userActions");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "count");
          AXFormatInteger();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v46, CFSTR("%@"), 0, v40);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("RunShortcutsWorkflow")))
        {
          objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "customShortcutsWorkflowIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "shortcutForIdentifier:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "shortcutName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = (void *)MEMORY[0x24BDD17C8];
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.RunShortcutsWorkflowFormatted"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v45, CFSTR("%@"), 0, v50);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("PasteBoard")))
          v23 = CFSTR("CustomCommand.PasteBoard");
        else
          v23 = CFSTR("CustomCommand.Unset");
        goto LABEL_17;
      }
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "customTextToInsert");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "length"))
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.PasteTextFormat"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
        goto LABEL_25;
      }
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.PasteText"));
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v30;
    goto LABEL_24;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SpokenString"));
  v8 = (CACCustomCommandEditorTextFieldCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[CACCustomCommandEditorTextFieldCell initWithStyle:reuseIdentifier:]([CACCustomCommandEditorTextFieldCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("SpokenString"));
    -[CACCustomCommandEditorTextFieldCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    -[CACCustomCommandEditorTextFieldCell textField](v8, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.SpokenStringPlaceholder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaceholder:", v15);

    objc_msgSend(v14, "setTextAlignment:", 4);
    objc_msgSend(v14, "setAutocapitalizationType:", 2);
    objc_msgSend(v14, "setReturnKeyType:", 9);
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);
    objc_msgSend(v14, "setDelegate:", self);

  }
  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorTextFieldCell textField](v8, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[CACCustomCommandEditorTextFieldCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", -[CACCustomCommandEditorViewController isInEditingMode](self, "isInEditingMode"));
LABEL_32:

  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a4;
  v6 = v5;
  if (objc_msgSend(v5, "section") == 1)
  {
    v6 = v5;
    if (!objc_msgSend(v5, "row"))
    {
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "customType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RunUserActionFlow"));

      v6 = v5;
      if (v9)
      {

        v6 = 0;
      }
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  CACCustomCommandApplicationViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];

  v5 = a4;
  if (objc_msgSend(v5, "section") == 1)
  {
    v6 = objc_msgSend(v5, "row");
    if (v6 == 1)
    {
      v7 = objc_alloc_init(CACCustomCommandApplicationViewController);
      -[CACCustomCommandApplicationViewController setDelegate:](v7, "setDelegate:", self);
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandApplicationViewController setCommandItem:](v7, "setCommandItem:", v20);

      -[CACCustomCommandEditorViewController applicationIdentifiersToNames](self, "applicationIdentifiersToNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandApplicationViewController setApplicationIdentifiersToNames:](v7, "setApplicationIdentifiersToNames:", v8);
    }
    else
    {
      if (v6)
        goto LABEL_11;
      v7 = objc_alloc_init(CACCustomCommandActionViewController);
      -[CACCustomCommandApplicationViewController setDelegate:](v7, "setDelegate:", self);
      -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCustomCommandApplicationViewController setCommandItem:](v7, "setCommandItem:", v8);
    }

    if (v7)
    {
      -[CACCustomCommandEditorViewController navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pushViewController:animated:", v7, 1);

      goto LABEL_10;
    }
  }
  else if (objc_msgSend(v5, "section") == 2)
  {
    -[CACCustomCommandEditorViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
    v7 = (CACCustomCommandApplicationViewController *)objc_claimAutoreleasedReturnValue();

    -[CACCustomCommandApplicationViewController textField](v7, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resignFirstResponder");

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BEBD3A8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Delete"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v24[3] = &unk_24F2AA888;
    v24[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 2, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v16);

    v17 = (void *)MEMORY[0x24BEBD3A8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Cancel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v22[3] = &unk_24F2AA8B0;
    v22[4] = self;
    v23 = v5;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v19);

    -[CACCustomCommandEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
LABEL_10:

  }
LABEL_11:

}

uint64_t __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "commandItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromPreferences");

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_24F2AA860;
  v5[4] = v3;
  return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);
}

void __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdatePropertiesForEditor:", *(_QWORD *)(a1 + 32));

}

void __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (void)_updateCommandItemWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CACCustomCommandEditorViewController mutableCommandItem](self, "mutableCommandItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bestLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:locale:", v6, CFSTR("CustomCommands"), v8);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CACCustomCommandEditorViewController _commandStringIsValid:checkForLength:](self, "_commandStringIsValid:checkForLength:", v4, 1);

  -[CACCustomCommandEditorViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CACCustomCommandEditorViewController _commandStringIsValid:checkForLength:](self, "_commandStringIsValid:checkForLength:", v4, 1);

  -[CACCustomCommandEditorViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = 0;
  if (-[CACCustomCommandEditorViewController _commandStringIsValid:checkForLength:](self, "_commandStringIsValid:checkForLength:", v10, 0))
  {
    if (location && objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "characterIsMember:", objc_msgSend(v10, "characterAtIndex:", 0)) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", location - 1));

        if ((v15 & 1) != 0)
        {
          v11 = 0;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v9, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandEditorViewController _updateCommandItemWithText:](self, "_updateCommandItemWithText:", v17);

    v11 = 1;
  }
LABEL_9:

  return v11;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[CACCustomCommandEditorViewController _shouldShowDeleteButton](self, "_shouldShowDeleteButton");
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandEditorViewController _updateCommandItemWithText:](self, "_updateCommandItemWithText:", v8);

  v9 = -[CACCustomCommandEditorViewController _shouldShowDeleteButton](self, "_shouldShowDeleteButton");
  if (!v5 && v9)
  {
    -[CACCustomCommandEditorViewController tableView](self, "tableView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSections:withRowAnimation:", v10, 0);

  }
}

- (void)didUpdateCommandItemForApplicationViewController:(id)a3
{
  id v4;

  -[CACCustomCommandEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdatePropertiesForEditor:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (CACCustomCommandEditorViewControllerDelegate)delegate
{
  return (CACCustomCommandEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void)setIsValidCommandItem:(BOOL)a3
{
  self->_isValidCommandItem = a3;
}

- (void)setIsEmptyCommandItem:(BOOL)a3
{
  self->_isEmptyCommandItem = a3;
}

- (void)setHasEmptySpokenString:(BOOL)a3
{
  self->_hasEmptySpokenString = a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  self->_showsDeleteButton = a3;
}

- (void)setApplicationIdentifiersToNames:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifiersToNames, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIBarButtonItem)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (CACSpokenCommandItem)mutableCommandItem
{
  return self->_mutableCommandItem;
}

- (void)setMutableCommandItem:(id)a3
{
  objc_storeStrong((id *)&self->_mutableCommandItem, a3);
}

- (AXSiriShortcutsManager)shortcutsManager
{
  return self->_shortcutsManager;
}

- (void)setShortcutsManager:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsManager, 0);
  objc_storeStrong((id *)&self->_mutableCommandItem, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationIdentifiersToNames, 0);
}

@end
