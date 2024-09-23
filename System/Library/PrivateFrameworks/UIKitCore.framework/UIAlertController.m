@implementation UIAlertController

+ (BOOL)_allowInteractiveSheetDismissal
{
  return 1;
}

- (UIAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIAlertController *v4;
  UIAlertController *v5;
  UIAlertController *v6;
  NSMutableArray *v7;
  NSMutableArray *actions;
  uint64_t v9;
  NSIndexSet *indexesOfActionSectionSeparators;
  NSMutableDictionary *v11;
  NSMutableDictionary *actionToKeyCommandsDictionary;
  uint64_t v13;
  NSMapTable *keyCommandToActionMapTable;
  NSSet *v15;
  NSSet *linkedAlertControllers;
  _UIAlertControllerTextFieldViewController *v17;
  _UIAlertControllerTextFieldViewController *textFieldViewController;
  uint64_t v19;
  NSPointerArray *actionsWithInvokedHandlers;
  void *v21;
  uint64_t v22;
  id ownedTransitioningDelegate;
  void *v24;
  id v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)UIAlertController;
  v4 = -[UIViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    _UIApplicationAssertForExtensionType(&unk_1E1A92AF8);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v6->_actions;
    v6->_actions = v7;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = objc_claimAutoreleasedReturnValue();
    indexesOfActionSectionSeparators = v6->_indexesOfActionSectionSeparators;
    v6->_indexesOfActionSectionSeparators = (NSIndexSet *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionToKeyCommandsDictionary = v6->_actionToKeyCommandsDictionary;
    v6->_actionToKeyCommandsDictionary = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    keyCommandToActionMapTable = v6->_keyCommandToActionMapTable;
    v6->_keyCommandToActionMapTable = (NSMapTable *)v13;

    v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    linkedAlertControllers = v6->_linkedAlertControllers;
    v6->_linkedAlertControllers = v15;

    v17 = objc_alloc_init(_UIAlertControllerTextFieldViewController);
    textFieldViewController = v6->_textFieldViewController;
    v6->_textFieldViewController = v17;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v19 = objc_claimAutoreleasedReturnValue();
    actionsWithInvokedHandlers = v6->_actionsWithInvokedHandlers;
    v6->_actionsWithInvokedHandlers = (NSPointerArray *)v19;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertController _createTransitioningDelegateForIdiom:](UIAlertController, "_createTransitioningDelegateForIdiom:", objc_msgSend(v21, "userInterfaceIdiom"));
    v22 = objc_claimAutoreleasedReturnValue();
    ownedTransitioningDelegate = v6->_ownedTransitioningDelegate;
    v6->_ownedTransitioningDelegate = (id)v22;

    -[UIViewController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6->_ownedTransitioningDelegate);
    -[UIAlertController _updateModalPresentationStyle](v6, "_updateModalPresentationStyle");
    -[UIAlertController set_shouldFlipFrameForShimDismissal:](v6, "set_shouldFlipFrameForShimDismissal:", 0);
    v6->_titleMaximumLineCount = -1;
    v6->_titleLineBreakMode = 4;
    v6->__shouldAlignToKeyboard = 1;
    v6->__shouldInvokeCancelActionOnDimmingViewTap = 1;
    v28[0] = 0x1E1A99498;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](v6, "_registerForTraitTokenChanges:withTarget:action:", v24, v6, sel__userInterfaceIdiomChanged);

  }
  return v5;
}

+ (UIAlertController)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
  NSString *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v7 = title;
  v8 = message;
  v9 = objc_alloc_init((Class)objc_opt_class());
  if (-[NSString length](v7, "length") >= 0x3E8)
  {
    -[NSString substringToIndex:](v7, "substringToIndex:", 999);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (NSString *)v10;
  }
  if (-[NSString length](v8, "length") >> 4 >= 0x271)
  {
    -[NSString substringToIndex:](v8, "substringToIndex:", 9999);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (NSString *)v11;
  }
  objc_msgSend(v9, "setTitle:", v7);
  objc_msgSend(v9, "setMessage:", v8);
  objc_msgSend(v9, "setPreferredStyle:", preferredStyle);

  return (UIAlertController *)v9;
}

- (void)addAction:(UIAlertAction *)action
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIAlertAction *v10;

  v10 = action;
  if (-[UIAlertAction style](v10, "style") == UIAlertActionStyleCancel)
  {
    if (self->_cancelAction)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertController.m"), 292, CFSTR("UIAlertController can only have one action with a style of UIAlertActionStyleCancel"));

    }
    -[UIAlertController _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_keyCommandInputForCancelAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertAction _setKeyCommandInput:modifierFlags:](v10, "_setKeyCommandInput:modifierFlags:", v6, 0);

    -[UIAlertController setCancelAction:](self, "setCancelAction:", v10);
  }
  -[NSMutableArray addObject:](self->_actions, "addObject:", v10);
  -[UIAlertAction _setAlertController:](v10, "_setAlertController:", self);
  -[UIAlertAction _keyCommandInput](v10, "_keyCommandInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _action:changedToKeyCommandWithInput:modifierFlags:](self, "_action:changedToKeyCommandWithInput:modifierFlags:", v10, v7, -[UIAlertAction _keyCommandModifierFlags](v10, "_keyCommandModifierFlags"));

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_actionsChanged");

  -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
}

+ (id)_alertControllerWithTitle:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "alertControllerWithTitle:message:preferredStyle:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", a3, a4, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSimpleHandler:", v8);

  -[UIAlertController addAction:](self, "addAction:", v9);
}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 shouldDismissHandler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", a3, a4, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSimpleHandler:", v11);

  objc_msgSend(v12, "setShouldDismissHandler:", v10);
  -[UIAlertController addAction:](self, "addAction:", v12);

}

- (void)_addActionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", a3, a5, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSimpleHandler:", v10);

  objc_msgSend(v12, "setImage:", v11);
  -[UIAlertController addAction:](self, "addAction:", v12);

}

- (void)_setActions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v5 = v4;
  if ((-[NSMutableArray isEqual:](self->_actions, "isEqual:", v5) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__UIAlertController__setActions___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v5;
    -[UIAlertController _performBatchActionChangesWithBlock:](self, "_performBatchActionChangesWithBlock:", v6);

  }
}

void __33__UIAlertController__setActions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_removeAllActions");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "addAction:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_performBatchActionChangesWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  UIAlertController *v10;
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    ++self->_batchActionChangesInProgressCount;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __57__UIAlertController__performBatchActionChangesWithBlock___block_invoke;
    v9 = &unk_1E16B2F48;
    v10 = self;
    v11 = v4;
    objc_msgSend(v5, "_performBatchActionChangesWithBlock:", &v6);
    -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle", v6, v7, v8, v9);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __57__UIAlertController__performBatchActionChangesWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096);
  return result;
}

- (void)_removeAllActions
{
  UIAlertAction *cancelAction;

  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
  cancelAction = self->_cancelAction;
  self->_cancelAction = 0;

}

- (void)setPreferredAction:(UIAlertAction *)preferredAction
{
  UIAlertAction *v6;
  UIAlertAction *v7;
  char v8;
  void *v9;
  void *v10;
  UIAlertAction *v11;

  v11 = preferredAction;
  -[UIAlertController preferredAction](self, "preferredAction");
  v6 = (UIAlertAction *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v6 != v11)
  {
    v8 = -[NSMutableArray containsObject:](self->_actions, "containsObject:", v11);
    if (v11 && (v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertController.m"), 397, CFSTR("The -preferredAction of an alert controller must be contained in the -actions array or be nil."));

    }
    objc_storeStrong((id *)&self->_preferredAction, preferredAction);
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updatePreferredAction");

    v7 = v11;
  }

}

- (void)_addSectionDelimiter
{
  void *v3;
  id v4;

  v4 = (id)-[NSIndexSet mutableCopy](self->_indexesOfActionSectionSeparators, "mutableCopy");
  -[UIAlertController actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndex:", objc_msgSend(v3, "count"));

  -[UIAlertController _setIndexesOfActionSectionSeparators:](self, "_setIndexesOfActionSectionSeparators:", v4);
}

- (void)_setIndexesOfActionSectionSeparators:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSIndexSet isEqualToIndexSet:](self->_indexesOfActionSectionSeparators, "isEqualToIndexSet:"))
  {
    objc_storeStrong((id *)&self->_indexesOfActionSectionSeparators, a3);
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_actionsChanged");

  }
}

- (void)_action:(id)a3 changedToKeyCommandWithInput:(id)a4 modifierFlags:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  -[UIAlertController _removeKeyCommandForAction:](self, "_removeKeyCommandForAction:", v9);
  -[UIAlertController _addKeyCommandForAction:withInput:modifierFlags:](self, "_addKeyCommandForAction:withInput:modifierFlags:", v9, v8, a5);

}

- (void)_addKeyCommandForAction:(id)a3 withInput:(id)a4 modifierFlags:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    -[UIAlertController _keyCommandForAction:input:modifierFlags:](self, "_keyCommandForAction:input:modifierFlags:", v10, v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController addKeyCommand:](self, "addKeyCommand:", v9);

  }
}

- (void)_removeKeyCommandForAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_actionToKeyCommandsDictionary, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable removeObjectForKey:](self->_keyCommandToActionMapTable, "removeObjectForKey:", v4);
    -[UIViewController removeKeyCommand:](self, "removeKeyCommand:", v4);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_actionToKeyCommandsDictionary, "removeObjectForKey:", v5);

}

- (id)_keyCommandForAction:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v9, a5, sel__handleKeyCommand_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "style") == 1 && objc_msgSend(v9, "isEqualToString:", CFSTR("UIKeyInputEscape")))
  {
    objc_msgSend(v10, "setDiscoverabilityTitle:", &stru_1E16EDF20);
  }
  else
  {
    objc_msgSend(v8, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDiscoverabilityTitle:", v11);

  }
  -[NSMapTable setObject:forKey:](self->_keyCommandToActionMapTable, "setObject:forKey:", v8, v10);

  return v10;
}

- (void)_handleKeyCommand:(id)a3
{
  id v4;

  -[NSMapTable objectForKey:](self->_keyCommandToActionMapTable, "objectForKey:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEnabled"))
    -[UIAlertController _dismissAnimated:triggeringAction:](self, "_dismissAnimated:triggeringAction:", 1, v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;
  objc_super v7;

  if (sel__handleReturn == a3)
  {
    -[UIAlertController textFields](self, "textFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAlertController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)_handleReturn
{
  void *v3;
  void *v4;

  -[UIAlertController _actionForReturnKey](self, "_actionForReturnKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[UIAlertController _dismissAnimated:triggeringAction:](self, "_dismissAnimated:triggeringAction:", 1, v3);
    v3 = v4;
  }

}

- (id)_returnKeyCommand
{
  return +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__handleReturn);
}

- (void)_addReturnKeyCommandIfAppropriate
{
  void *v3;
  id v4;

  if (-[UIAlertController _resolvedStyle](self, "_resolvedStyle") == 1)
  {
    -[UIViewController _focusSystem](self, "_focusSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[UIAlertController _returnKeyCommand](self, "_returnKeyCommand");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UIViewController addKeyCommand:](self, "addKeyCommand:", v4);

    }
  }
}

- (NSArray)actions
{
  void *v2;
  void *v3;

  -[UIAlertController _actions](self, "_actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)_actionForReturnKey
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  -[UIAlertController preferredAction](self, "preferredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIAlertController preferredAction](self, "preferredAction");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIAlertController actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__UIAlertController__actionForReturnKey__block_invoke;
  v11[3] = &unk_1E16B2DD0;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v8 = objc_msgSend(v7, "count");
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[UIAlertController _cancelAction](self, "_cancelAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_17));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)v9;
  }
LABEL_10:

  return v10;
}

void __40__UIAlertController__actionForReturnKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

BOOL __40__UIAlertController__actionForReturnKey__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "style") != 1;
}

- (void)addTextFieldWithConfigurationHandler:(void *)configurationHandler
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = configurationHandler;
  if (-[UIAlertController preferredStyle](self, "preferredStyle") != UIAlertControllerStyleAlert)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertController.m"), 587, CFSTR("Text fields can only be added to an alert controller of style UIAlertControllerStyleAlert"));

  }
  -[_UIAlertControllerTextFieldViewController setContainer:](self->_textFieldViewController, "setContainer:", self);
  -[_UIAlertControllerTextFieldViewController addTextFieldWithPlaceholder:](self->_textFieldViewController, "addTextFieldWithPlaceholder:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8, v5);
  -[UIAlertController _updateShouldAlignToKeyboard](self, "_updateShouldAlignToKeyboard");
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_textFieldsChanged");

}

- (NSArray)textFields
{
  return -[_UIAlertControllerTextFieldViewController textFields](self->_textFieldViewController, "textFields");
}

- (_UIAlertControllerTextFieldViewController)_textFieldViewController
{
  return self->_textFieldViewController;
}

- (BOOL)_shouldSupportReturnKeyPresses
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 2)
  {
    v4 = 0;
  }
  else
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") != 8;

  }
  return v4;
}

- (id)_textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIAlertController _visualStyle](self, "_visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textFieldContainingViewWithTextField:position:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_willParentTextFieldViewController
{
  -[UIViewController willMoveToParentViewController:](self->_textFieldViewController, "willMoveToParentViewController:", self);
}

- (void)_didParentTextFieldViewController
{
  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_textFieldViewController);
  -[UIViewController didMoveToParentViewController:](self->_textFieldViewController, "didMoveToParentViewController:", self);
}

- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3
{
  _UIAlertControllerTextFieldViewController *textFieldViewController;

  textFieldViewController = self->_textFieldViewController;
  if (textFieldViewController)
    -[_UIAlertControllerTextFieldViewController setTextFieldsCanBecomeFirstResponder:](textFieldViewController, "setTextFieldsCanBecomeFirstResponder:", a3);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  -[UIAlertController description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    -[UIViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=\"%@\" message=\"%@\"), v6, v7);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
  }

  return (NSString *)v4;
}

- (void)dealloc
{
  _UIAlertControllerShimPresenter *presenter;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id ownedTransitioningDelegate;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_presenter)
  {
    +[_UIAlertControllerShimPresenter _removePresenter:](_UIAlertControllerShimPresenter, "_removePresenter:");
    presenter = self->_presenter;
    self->_presenter = 0;

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_actions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "_setAlertController:", 0);
        -[UIAlertController _removeKeyCommandForAction:](self, "_removeKeyCommandForAction:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[UIAlertController _uninstallBackGestureRecognizer](self, "_uninstallBackGestureRecognizer");
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlertController:", 0);

  -[UIAlertController _clearActionHandlers](self, "_clearActionHandlers");
  -[_UIAlertControllerTextFieldViewController setContainer:](self->_textFieldViewController, "setContainer:", 0);
  ownedTransitioningDelegate = self->_ownedTransitioningDelegate;
  self->_ownedTransitioningDelegate = 0;

  v12.receiver = self;
  v12.super_class = (Class)UIAlertController;
  -[UIViewController dealloc](&v12, sel_dealloc);
}

- (BOOL)shouldAutorotate
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "_isSupportedInterfaceOrientation:", a3);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIAlertController;
    v7 = -[UIViewController _isSupportedInterfaceOrientation:](&v10, sel__isSupportedInterfaceOrientation_, a3);
  }
  v8 = v7;

  return v8;
}

- (void)_getRotationContentSettings:(id *)a3
{
  int has_internal_diagnostics;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UIViewController view](self, "view");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject window](v6, "window");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (has_internal_diagnostics)
    {
      if (v7)
      {
        -[UIViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
LABEL_14:
          a3->var6 = 0;
          return;
        }
        __UIFaultDebugAssertLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          -[UIViewController view](self, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "window");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v21;
          _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Surprising window for legacy alert presentation: %@", (uint8_t *)&v22, 0xCu);

        }
      }
    }
    else if (v7)
    {
      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0)
      {
        v12 = _getRotationContentSettings____s_category;
        if (!_getRotationContentSettings____s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_getRotationContentSettings____s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = v13;
          -[UIViewController view](self, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "window");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v16;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Surprising window for legacy alert presentation: %@", (uint8_t *)&v22, 0xCu);

        }
      }
      goto LABEL_14;
    }

    goto LABEL_14;
  }
}

- (void)loadView
{
  int has_internal_diagnostics;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[UIAlertController _visualStyle](self, "_visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "We must we have a _visualStyle before creating the _UIAlertControllerView", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v12 = loadView___s_category;
    if (!loadView___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&loadView___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "We must we have a _visualStyle before creating the _UIAlertControllerView", buf, 2u);
    }
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController platformStyleViewForAlertController:inIdiom:](self, "platformStyleViewForAlertController:inIdiom:", self, objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "setSpringLoaded:", -[UIAlertController isSpringLoaded](self, "isSpringLoaded"));

  }
  objc_msgSend(v6, "setAlertController:", self);
  -[UIViewController setView:](self, "setView:", v6);
  -[UIViewController _screen](self, "_screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v6, "setFrame:");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __29__UIAlertController_loadView__block_invoke;
  v14[3] = &unk_1E16B1B28;
  v15 = v6;
  v9 = v6;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v14);
  -[UIAlertController _updateShouldAlignToKeyboard](self, "_updateShouldAlignToKeyboard");
  objc_msgSend(v9, "_actionsChanged");
  objc_msgSend(v9, "_textFieldsChanged");
  -[UIAlertController _visualStyle](self, "_visualStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setVisualStyle:", v10);

}

uint64_t __29__UIAlertController_loadView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasDimmingView:", +[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController") ^ 1);
  return objc_msgSend(*(id *)(a1 + 32), "setShouldHaveBackdropView:", 1);
}

- (void)_updateShouldAlignToKeyboard
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__UIAlertController__updateShouldAlignToKeyboard__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

void __49__UIAlertController__updateShouldAlignToKeyboard__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_alertControllerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlignsToKeyboard:", objc_msgSend(*(id *)(a1 + 32), "_alignsToKeyboard"));

}

- (BOOL)_alignsToKeyboard
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  char v11;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isHostedInAnotherProcess") & 1) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = objc_msgSend(v3, "_windowOwnsInterfaceOrientation") ^ 1;
  if (-[UIAlertController _shouldAlignToKeyboard](self, "_shouldAlignToKeyboard"))
  {
    -[UIAlertController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController textFields](self, "textFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[UIAlertController _visualStyle](self, "_visualStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "placementAvoidsKeyboard");
    if (v5)
      v10 = 1;
    else
      v10 = v4;
    if (v7)
      v10 = 1;
    v11 = v10 & v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setShouldReverseActions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setActionsReversed:", v3);

}

- (BOOL)_shouldReverseActions
{
  void *v2;
  char v3;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_actionsReversed");

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIAlertController;
  -[UIViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIAlertController _idiomSupportsBackGesture:](self, "_idiomSupportsBackGesture:", objc_msgSend(v4, "userInterfaceIdiom"));

  if (v5)
    -[UIAlertController _installBackGestureRecognizer](self, "_installBackGestureRecognizer");
  -[UIViewController title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIViewController title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setTitle:", v7);

  }
  -[UIAlertController message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIAlertController message](self, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setMessage:", v9);

  }
  -[UIAlertController _attributedTitle](self, "_attributedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIAlertController _attributedTitle](self, "_attributedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAttributedTitle:", v11);

  }
  -[UIAlertController _attributedMessage](self, "_attributedMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIAlertController _attributedMessage](self, "_attributedMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAttributedMessage:", v13);

  }
  -[UIAlertController _attributedDetailMessage](self, "_attributedDetailMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIAlertController _attributedDetailMessage](self, "_attributedDetailMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAttributedDetailMessage:", v15);

  }
}

- (id)_alertControllerView
{
  void *v3;

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_needsPreferredSizeCalculated
{
  return -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation")
      || -[UIAlertController _isPresentedAsPopover](self, "_isPresentedAsPopover");
}

- (void)_recomputePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  self->_isInRecomputePreferredContentSize = 1;
  if (-[UIAlertController _needsPreferredSizeCalculated](self, "_needsPreferredSizeCalculated"))
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = v4;
    v7 = v6;

    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
    -[UIViewController setContentSizeForViewInPopover:](self, "setContentSizeForViewInPopover:", v5, v7);
  }
  self->_isInRecomputePreferredContentSize = 0;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  -[UIViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _resolvedStyleChanged](self, "_resolvedStyleChanged");
  -[UIAlertController _reevaluateResolvedStyle](self, "_reevaluateResolvedStyle");
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDF13010))
  {
    v4 = v3;
    v5 = v4;
    if (self->_separatedHeaderContentViewController)
      objc_msgSend(v4, "_addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary");
    if (self->_headerContentViewController)
      objc_msgSend(v5, "_addHeaderContentViewControllerToViewHierarchyIfNecessary");

  }
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDF13100) && self->_contentViewController)
    objc_msgSend(v3, "_addContentViewControllerToViewHierarchyIfNecessary");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  _BOOL4 isInRecomputePreferredContentSize;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  -[UIViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDF13010))
    objc_msgSend(v3, "_recomputeActionMetrics");
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    isInRecomputePreferredContentSize = self->_isInRecomputePreferredContentSize;

    if (!isInRecomputePreferredContentSize)
      -[UIAlertController _recomputePreferredContentSize](self, "_recomputePreferredContentSize");
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UIAlertController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[UIAlertController _shouldDismissOnSizeChange](self, "_shouldDismissOnSizeChange"))
    -[UIAlertController _dismissWithCancelOrEmptyAction](self, "_dismissWithCancelOrEmptyAction");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__UIAlertController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E16B2150;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __72__UIAlertController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_alertControllerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_actionLayoutDirectionChanged");

}

- (void)_reevaluateResolvedStyle
{
  UIAlertControllerStyle v3;
  int64_t resolvedStyle;

  v3 = -[UIAlertController preferredStyle](self, "preferredStyle");
  resolvedStyle = self->_resolvedStyle;
  self->_resolvedStyle = v3;
  if (_UIAppUseModernRotationAndPresentationBehaviors() || -[UIViewController isViewLoaded](self, "isViewLoaded"))
    -[UIAlertController _updateModalPresentationStyle](self, "_updateModalPresentationStyle");
  if (resolvedStyle != v3)
    -[UIAlertController _resolvedStyleChanged](self, "_resolvedStyleChanged");
}

- (void)_updateProvidedStyleWithTraitCollection:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  if (self->_batchActionChangesInProgressCount <= 0)
  {
    v19 = v4;
    v5 = -[UIAlertController _resolvedStyle](self, "_resolvedStyle");
    -[UIAlertController _currentDescriptor](self, "_currentDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController _styleProvider](self, "_styleProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualStyleForAlertControllerStyle:traitCollection:descriptor:", v5, v19, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    if (v9
      || (-[UIAlertController visualStyleForAlertControllerStyle:traitCollection:descriptor:](self, "visualStyleForAlertControllerStyle:traitCollection:descriptor:", v5, v19, v6), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v9, "setTraitCollection:", v19);
      objc_msgSend(v9, "setDescriptor:", v6);
      -[UIAlertController _visualStyle](self, "_visualStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v9);

      if ((v11 & 1) == 0)
      {
        -[UIAlertController _setVisualStyle:](self, "_setVisualStyle:", v9);
        -[UIAlertController _updateShouldAlignToKeyboard](self, "_updateShouldAlignToKeyboard");
      }
      -[UIAlertController _alertControllerView](self, "_alertControllerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_visualStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v9);

      if ((v14 & 1) == 0)
        objc_msgSend(v12, "_setVisualStyle:", v9);
      -[_UIAlertControllerTextFieldViewController visualStyle](self->_textFieldViewController, "visualStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v9);

      if ((v16 & 1) == 0)
        -[UIAlertController _updateTextFieldViewControllerWithVisualStyle:](self, "_updateTextFieldViewControllerWithVisualStyle:", v9);
      -[UIAlertController _headerContentViewController](self, "_headerContentViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_containingAlertControllerDidChangeVisualStyle:", v9);

      -[UIAlertController contentViewController](self, "contentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_containingAlertControllerDidChangeVisualStyle:", v9);

    }
    v4 = v19;
  }

}

- (void)_updateProvidedStyle
{
  id v3;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _updateProvidedStyleWithTraitCollection:](self, "_updateProvidedStyleWithTraitCollection:", v3);

}

- (id)_currentDescriptor
{
  UIAlertControllerDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(UIAlertControllerDescriptor);
  -[UIAlertController _headerContentViewController](self, "_headerContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerDescriptor setHasHeaderContentViewController:](v3, "setHasHeaderContentViewController:", v4 != 0);

  -[UIAlertControllerDescriptor setHasTitle:](v3, "setHasTitle:", -[UIAlertController _hasTitle](self, "_hasTitle"));
  -[UIAlertControllerDescriptor setHasMessage:](v3, "setHasMessage:", -[UIAlertController _hasMessage](self, "_hasMessage"));
  -[UIAlertController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerDescriptor setHasContentViewController:](v3, "setHasContentViewController:", v5 != 0);

  -[UIAlertController actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerDescriptor setNumberOfActions:](v3, "setNumberOfActions:", objc_msgSend(v6, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIAlertController actions](self, "actions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "style") == 1)
        {
          -[UIAlertController _visualStyle](self, "_visualStyle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hideCancelAction:inAlertController:", v13, self);

          if ((v15 & 1) != 0)
            continue;
        }
        ++v10;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  -[UIAlertControllerDescriptor setNumberOfVisibleActions:](v3, "setNumberOfVisibleActions:", v10);
  -[UIViewController _existingView](self, "_existingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  -[UIAlertControllerDescriptor setContainerViewSafeAreaInsets:](v3, "setContainerViewSafeAreaInsets:");

  -[UIViewController _window](self, "_window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerDescriptor setApplicationIsFullscreen:](v3, "setApplicationIsFullscreen:", objc_msgSend(v18, "_windowOwnsInterfaceOrientation"));

  return v3;
}

- (void)_resolvedStyleChanged
{
  -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
  -[UIAlertController _updateModalPresentationStyle](self, "_updateModalPresentationStyle");
}

- (void)_userInterfaceIdiomChanged
{
  void *v3;
  _BOOL4 v4;

  -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIAlertController _idiomSupportsBackGesture:](self, "_idiomSupportsBackGesture:", objc_msgSend(v3, "userInterfaceIdiom"));

  if (v4)
    -[UIAlertController _installBackGestureRecognizer](self, "_installBackGestureRecognizer");
  else
    -[UIAlertController _uninstallBackGestureRecognizer](self, "_uninstallBackGestureRecognizer");
}

- (BOOL)_idiomSupportsBackGesture:(int64_t)a3
{
  return a3 == 8 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)_buttonTypeForBackGestureForIdiom:(int64_t)a3
{
  if (a3 == 8 || a3 == 2)
    return 5;
  else
    return 7;
}

- (void)_installBackGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *backButtonDismissGestureRecognizer;
  UITapGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!self->_backButtonDismissGestureRecognizer)
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__dismissFromBackButton_);
    backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
    self->_backButtonDismissGestureRecognizer = v3;

    v5 = self->_backButtonDismissGestureRecognizer;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[UIViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", -[UIAlertController _buttonTypeForBackGestureForIdiom:](self, "_buttonTypeForBackGestureForIdiom:", objc_msgSend(v7, "userInterfaceIdiom")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", v9);

  }
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", self->_backButtonDismissGestureRecognizer);

}

- (void)_uninstallBackGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *backButtonDismissGestureRecognizer;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_backButtonDismissGestureRecognizer);

  backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
  self->_backButtonDismissGestureRecognizer = 0;

}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
  -[UIAlertController _reevaluateResolvedStyle](self, "_reevaluateResolvedStyle");
}

- (UIAlertControllerStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (UIAlertControllerSeverity)severity
{
  return self->_severity;
}

- (void)setSeverity:(UIAlertControllerSeverity)severity
{
  self->_severity = severity;
}

- (BOOL)_shouldProvideDimmingView
{
  return !+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController");
}

- (BOOL)_shouldDismissOnSizeChange
{
  return -[UIAlertController _resolvedStyle](self, "_resolvedStyle") == 1000
      || -[UIAlertController _resolvedStyle](self, "_resolvedStyle") == 1001;
}

+ (void)registerPlatformStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)_MergedGlobals_9_0;
  if (!_MergedGlobals_9_0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_MergedGlobals_9_0;
    _MergedGlobals_9_0 = v6;

    v5 = (void *)_MergedGlobals_9_0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, v8);

}

+ (id)_createTransitioningDelegateForIdiom:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _UIAlertControllerTransitioningDelegate *v6;

  v3 = (void *)_MergedGlobals_9_0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v5, "preferredTransitioningDelegate"),
        (v6 = (_UIAlertControllerTransitioningDelegate *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = objc_alloc_init(_UIAlertControllerTransitioningDelegate);
  }

  return v6;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __objc2_class **v15;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "userInterfaceIdiom");
  if (v9 == -1)
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "userInterfaceIdiom");

  }
  v11 = (void *)_MergedGlobals_9_0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (objc_msgSend(v13, "visualStyleForAlertControllerStyle:traitCollection:descriptor:", a3, v7, v8),
        (v14 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v9 == -1)
      goto LABEL_15;
    if ((unint64_t)(a3 - 1000) >= 2)
    {
      if (a3 == 1)
      {
        v14 = 0;
        if (v9 > 8)
          goto LABEL_28;
        if (((1 << v9) & 0x23) != 0)
        {
          v15 = off_1E167A2C0;
        }
        else if (((1 << v9) & 0x104) != 0)
        {
          if (dyld_program_sdk_at_least() && (_os_feature_enabled_impl() & 1) != 0)
            v15 = off_1E167A2D0;
          else
            v15 = off_1E167A2D8;
        }
        else
        {
          if (v9 != 3)
            goto LABEL_28;
          v15 = off_1E167A2C8;
        }
        goto LABEL_27;
      }
      if (a3)
        goto LABEL_15;
    }
    if (v9 < 2)
      goto LABEL_12;
    if (v9 != 3)
    {
      if (v9 == 5)
      {
LABEL_12:
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8)
          v15 = off_1E167A2B8;
        else
          v15 = off_1E167A2A8;
        goto LABEL_27;
      }
LABEL_15:
      v14 = 0;
      goto LABEL_28;
    }
    v15 = off_1E167A2B0;
LABEL_27:
    v14 = objc_alloc_init(*v15);
LABEL_28:
    if (os_variant_has_internal_diagnostics())
    {
      if (v14)
        goto LABEL_30;
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v20 = 134217984;
        v21 = v9;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "No visual style provided for idiom %ld", (uint8_t *)&v20, 0xCu);
      }

    }
    else
    {
      if (v14)
        goto LABEL_30;
      v18 = qword_1ECD7AD30;
      if (!qword_1ECD7AD30)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7AD30);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = 134217984;
        v21 = v9;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "No visual style provided for idiom %ld", (uint8_t *)&v20, 0xCu);
      }
    }
    v14 = 0;
  }
LABEL_30:

  return v14;
}

- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _UIAlertControllerPhoneTVMacView *v9;

  v5 = a3;
  v6 = (void *)_MergedGlobals_9_0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(v8, "platformStyleViewForAlertController:inIdiom:", v5, a4),
        (v9 = (_UIAlertControllerPhoneTVMacView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = objc_alloc_init(_UIAlertControllerPhoneTVMacView);
  }

  return v9;
}

- (void)_dismissWithAction:(id)a3 dismissCompletion:(id)a4
{
  -[UIAlertController _dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:](self, "_dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:", 1, a3, 0, a4);
}

- (void)_dismissWithAction:(id)a3
{
  -[UIAlertController _dismissAnimated:triggeringAction:](self, "_dismissAnimated:triggeringAction:", 1, a3);
}

- (void)_invokeHandlersForAction:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void (**v7)(void);
  id v8;

  v8 = a3;
  objc_msgSend(v8, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "handler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v8);

  }
  objc_msgSend(v8, "simpleHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "simpleHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

LABEL_6:
    -[NSPointerArray addPointer:](self->_actionsWithInvokedHandlers, "addPointer:", v8);
    goto LABEL_7;
  }
  if (v4)
    goto LABEL_6;
LABEL_7:

}

- (void)_clearActionHandlers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_actions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setHandler:", 0, (_QWORD)v8);
        objc_msgSend(v7, "setSimpleHandler:", 0);
        objc_msgSend(v7, "setShouldDismissHandler:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_dismissGestureRecognizer
{
  return -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__attemptAnimatedDismissWithGestureRecognizer_);
}

- (BOOL)_canDismissWithGestureRecognizer
{
  int64_t v2;

  v2 = -[UIAlertController _resolvedStyle](self, "_resolvedStyle");
  return (unint64_t)(v2 - 1000) < 2 || v2 == 0;
}

- (void)_attemptAnimatedDismissWithGestureRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    if (-[UIAlertController _canDismissWithGestureRecognizer](self, "_canDismissWithGestureRecognizer"))
      -[UIAlertController _dismissWithCancelOrEmptyAction](self, "_dismissWithCancelOrEmptyAction");
  }
}

- (void)_dismissFromBackButton:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UIAlertController _dismissWithCancelOrEmptyAction](self, "_dismissWithCancelOrEmptyAction");
}

- (void)_dismissWithCancelOrEmptyAction
{
  id v3;

  if (-[UIAlertController _shouldInvokeCancelActionOnDimmingViewTap](self, "_shouldInvokeCancelActionOnDimmingViewTap"))
    -[UIAlertController cancelAction](self, "cancelAction");
  else
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", &stru_1E16EDF20, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _dismissAnimated:triggeringAction:](self, "_dismissAnimated:triggeringAction:", 1, v3);

}

- (void)_dismissFromPopoverDimmingView
{
  id v3;

  -[UIAlertController cancelAction](self, "cancelAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:](self, "_dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:", 1, v3, 1, 0);

}

- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4
{
  -[UIAlertController _dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:](self, "_dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:", a3, a4, 0, 0);
}

- (void)_beginNoPresentingViewControllerPresentation:(id)a3
{
  id v4;
  _UIAlertControllerShimPresenter *presenter;
  _UIAlertControllerShimPresenter *v6;
  _UIAlertControllerShimPresenter *v7;
  id v8;

  v4 = a3;
  presenter = self->_presenter;
  v8 = v4;
  if (!presenter)
  {
    v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    v7 = self->_presenter;
    self->_presenter = v6;

    -[_UIAlertControllerShimPresenter setAlertController:](self->_presenter, "setAlertController:", self);
    v4 = v8;
    presenter = self->_presenter;
  }
  -[_UIAlertControllerShimPresenter _presentAlertControllerAnimated:hostingScene:completion:](presenter, "_presentAlertControllerAnimated:hostingScene:completion:", 1, v4, 0);

}

- (void)_endNoPresentingViewControllerPresentation
{
  -[_UIAlertControllerShimPresenter _dismissAlertControllerAnimated:completion:](self->_presenter, "_dismissAlertControllerAnimated:completion:", 0, 0);
}

- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4 triggeredByPopoverDimmingView:(BOOL)a5 dismissCompletion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  UIAlertController *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t (**v23)(void);
  char v24;
  UIAlertController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  _QWORD v31[5];
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD aBlock[5];
  id v41;
  _QWORD v42[4];
  id v43;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v13 = v10;
  v41 = v13;
  v14 = _Block_copy(aBlock);
  if (v7)
  {
    v15 = self;
    goto LABEL_3;
  }
  if (v13)
  {
    objc_msgSend(v13, "shouldDismissHandler");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21
      || (v22 = (void *)v21,
          objc_msgSend(v13, "shouldDismissHandler"),
          v23 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          v24 = v23[2](),
          v23,
          v22,
          (v24 & 1) != 0))
    {
      v25 = self;
      -[UIViewController _parentModalViewController](v25, "_parentModalViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[UIViewController popoverPresentationController](v25, "popoverPresentationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v28, "delegate"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v29,
              (isKindOfClass & 1) != 0))
        {
          v16 = &__block_literal_global_635;
        }
        else
        {
          v42[0] = v12;
          v42[1] = 3221225472;
          v42[2] = __manualPopoverPresentationControllerDidDismissPopoverInvocationForDismiss_block_invoke_2;
          v42[3] = &unk_1E16B1B28;
          v43 = v27;
          v16 = _Block_copy(v42);

        }
        goto LABEL_4;
      }
LABEL_3:
      v16 = &__block_literal_global_635;
LABEL_4:
      v17 = _Block_copy(v16);

      v36[0] = v12;
      v36[1] = 3221225472;
      v36[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_2;
      v36[3] = &unk_1E16B2E18;
      v18 = v14;
      v37 = v18;
      v38 = v17;
      v39 = v11;
      v19 = v17;
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_3;
      v31[3] = &unk_1E16B2E40;
      v34 = v7;
      v35 = a3;
      v31[4] = self;
      v33 = _Block_copy(v36);
      v32 = v13;
      v20 = v33;
      -[UIAlertController _performAction:invokeActionBlock:dismissAndPerformActionIfNotAlreadyPerformed:](self, "_performAction:invokeActionBlock:dismissAndPerformActionIfNotAlreadyPerformed:", v32, v18, v31);

      goto LABEL_16;
    }
    -[UIAlertController _performAction:invokeActionBlock:dismissAndPerformActionIfNotAlreadyPerformed:](self, "_performAction:invokeActionBlock:dismissAndPerformActionIfNotAlreadyPerformed:", v13, v14, 0);
  }
  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  self->_actionInvokedOnDismiss = 0;
LABEL_16:

}

uint64_t __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 1136))
  {
    *(_BYTE *)(v1 + 1136) = 1;
    return objc_msgSend(*(id *)(result + 32), "_invokeHandlersForAction:", *(_QWORD *)(result + 40));
  }
  return result;
}

uint64_t __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void (**v17)(void);

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_postWillBeginSystemProvidedDismissalOfAlertController");
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_postDidBeginSystemProvidedDismissalOfAlertController");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_compatibilityPopoverController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_compatibilityPopoverController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissPopoverAnimated:", *(unsigned __int8 *)(a1 + 57));

LABEL_6:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    if (*(_BYTE *)(a1 + 56))
      goto LABEL_6;
    if (os_variant_has_internal_diagnostics())
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99768];
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 56))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      if (*(_BYTE *)(v12 + 1136))
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      objc_msgSend(*(id *)(v12 + 1112), "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "raise:format:", v6, CFSTR("Attempt to dismiss %@ with unknown presenter, action will not be performed.\nDebug Info: \n\taction = %@, \n\tpresentingViewController = %@, view = %@, window = %@, \n\ttriggeredByPopoverDimmingView = %@, \n\tlocal.performActionInvoked = %@, \n\t_actionsWithInvokedHandlers = %@"), v7, v8, v3, v9, v11, v13, v14, v15);

    }
  }
LABEL_9:
  if (v17)
    v17[2]();

}

- (void)_performAction:(id)a3 invokeActionBlock:(id)a4 dismissAndPerformActionIfNotAlreadyPerformed:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatedActionPerformingDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_performActionForAlertController:invokeActionBlock:dismissControllerBlock:", self, v10, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
  else if (v10)
  {
    v10[2]();
  }

}

- (void)_postWillBeginSystemProvidedDismissalOfAlertController
{
  id v3;

  -[UIAlertController _systemProvidedPresentationDelegate](self, "_systemProvidedPresentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_willBeginSystemProvidedDismissalOfAlertController:", self);

}

- (void)_postDidBeginSystemProvidedDismissalOfAlertController
{
  id v3;

  -[UIAlertController _systemProvidedPresentationDelegate](self, "_systemProvidedPresentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_didBeginSystemProvidedDismissalOfAlertController:", self);

}

- (id)linkedAlertControllers
{
  return 0;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UIAlertControllerAlertPresentationController *v19;
  _UIAlertControllerAlertPresentationController *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _UIAlertControllerActionSheetCompactPresentationController *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    v20 = 0;
LABEL_26:
    v19 = v20;
    goto LABEL_27;
  }
  v11 = -[UIAlertController _viewControllerIsPresentedInModalPresentationContext:](self, "_viewControllerIsPresentedInModalPresentationContext:", v10);
  v12 = -[UIAlertController _resolvedStyle](self, "_resolvedStyle");
  v13 = (void *)_MergedGlobals_9_0;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "userInterfaceIdiom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v17, "platformStylePresentationControllerForPresentedController:presentingController:sourceController:style:", v8, v9, v10, v12), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((unint64_t)(v12 - 1000) < 2)
      goto LABEL_9;
    if (v12 == 1)
    {
      v20 = -[_UIAlertControllerPresentationController initWithPresentedViewController:presentingViewController:]([_UIAlertControllerAlertPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
    }
    else
    {
      if (!v12)
      {
LABEL_9:
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "userInterfaceIdiom");

        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          v23 = 1;
        }
        else
        {
          objc_msgSend(v10, "traitCollection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "userInterfaceIdiom") == 1)
          {
            v23 = 1;
          }
          else
          {
            objc_msgSend(v9, "traitCollection");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v25, "userInterfaceIdiom") == 1;

          }
        }
        if (!v23 || v11)
        {
          v26 = -[_UIAlertControllerPresentationController initWithPresentedViewController:presentingViewController:]([_UIAlertControllerActionSheetCompactPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v10);
          v20 = (_UIAlertControllerAlertPresentationController *)v26;
          if (v11)
            -[_UIAlertControllerPresentationController _setIsCurrentContext:](v26, "_setIsCurrentContext:", 1);
          if (objc_msgSend(v10, "_ancestorViewControllerIsInPopover"))
            -[_UIAlertControllerPresentationController _setShouldRespectNearestCurrentContextPresenter:](v20, "_setShouldRespectNearestCurrentContextPresenter:", 1);
        }
        else
        {
          v20 = -[UIPopoverPresentationController initWithPresentedViewController:presentingViewController:]([_UIAlertControllerActionSheetRegularPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
          if (dyld_program_sdk_at_least() && _UIIsPrivateMainBundle())
          {
            -[_UIAlertControllerAlertPresentationController _setCentersPopoverIfSourceViewNotSet:](v20, "_setCentersPopoverIfSourceViewNotSet:", 1);
            -[_UIAlertControllerAlertPresentationController _setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:](v20, "_setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:", 1);
          }
        }
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unknown style %ld when trying to generate a presentation controller to present %@"), v12, self);
      v20 = 0;
    }
LABEL_25:

    goto LABEL_26;
  }
  v19 = v18;

LABEL_27:
  return v19;
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)_updateModalPresentationStyle
{
  -[UIAlertController setModalPresentationStyle:](self, "setModalPresentationStyle:", -[UIAlertController _modalPresentationStyleForResolvedStyle](self, "_modalPresentationStyleForResolvedStyle"));
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAlertController;
  -[UIViewController setModalPresentationStyle:](&v3, sel_setModalPresentationStyle_, -[UIAlertController _modalPresentationStyleForResolvedStyle](self, "_modalPresentationStyleForResolvedStyle", a3));
}

- (int64_t)_modalPresentationStyleForResolvedStyle
{
  void *v2;
  uint64_t v3;

  if (-[UIAlertController _resolvedStyle](self, "_resolvedStyle"))
    return 4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 4;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
    return 7;
  return 18;
}

- (void)_updateViewFrameForLandscapePresentationInShimIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;
  CGAffineTransform t2;
  CGAffineTransform v20;

  memset(&v20, 0, sizeof(v20));
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&v20, 0, sizeof(v20));

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  CGAffineTransformMakeRotation(&v18, 1.57079633);
  *(float64x2_t *)&v18.a = vrndaq_f64(*(float64x2_t *)&v18.a);
  *(float64x2_t *)&v18.c = vrndaq_f64(*(float64x2_t *)&v18.c);
  *(float64x2_t *)&v18.tx = vrndaq_f64(*(float64x2_t *)&v18.tx);
  t2 = v18;
  t1 = v20;
  if (CGAffineTransformEqualToTransform(&t1, &t2)
    || (CGAffineTransformMakeRotation(&v15, -1.57079633),
        *(float64x2_t *)&v15.a = vrndaq_f64(*(float64x2_t *)&v15.a),
        *(float64x2_t *)&v15.c = vrndaq_f64(*(float64x2_t *)&v15.c),
        *(float64x2_t *)&v15.tx = vrndaq_f64(*(float64x2_t *)&v15.tx),
        v16 = v15,
        t1 = v20,
        CGAffineTransformEqualToTransform(&t1, &v16)))
  {
    if (v11 > v13)
    {
      -[UIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", v7, v9, v13, v11);

      -[UIAlertController set_shouldFlipFrameForShimDismissal:](self, "set_shouldFlipFrameForShimDismissal:", 1);
    }
  }
}

- (void)_flipFrameForShimDismissalIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  if (-[UIAlertController _shouldFlipFrameForShimDismissal](self, "_shouldFlipFrameForShimDismissal"))
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v11, v9);

    -[UIAlertController set_shouldFlipFrameForShimDismissal:](self, "set_shouldFlipFrameForShimDismissal:", 0);
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIAlertController;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v10, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__UIAlertController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E16B2E68;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

  }
  else
  {
    -[UIAlertController _updateProvidedStyleWithTraitCollection:](self, "_updateProvidedStyleWithTraitCollection:", v6);
  }

}

uint64_t __79__UIAlertController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProvidedStyleWithTraitCollection:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_isPresentedAsPopover
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[UIAlertController _alertControllerContainer](self, "_alertControllerContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    objc_msgSend(v3, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    -[UIViewController _popoverController](self, "_popoverController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v6)
    {
      objc_msgSend(v6, "contentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = v7 == v3;

    }
    else
    {
      isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)_allowsShowingDimmingView
{
  return 1;
}

- (BOOL)_viewControllerIsPresentedInModalPresentationContext:(id)a3
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "_isInPopoverPresentation") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || !dyld_program_sdk_at_least()
      || (v4 = 1,
          (objc_msgSend(v3, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1) & 1) == 0))
    {
      v4 = objc_msgSend(v3, "_ancestorViewControllerIsInPopover");
    }
  }

  return v4;
}

- (id)_alertControllerContainer
{
  UIAlertController *v3;
  UIAlertController *v4;
  UIAlertController *v5;

  -[UIViewController parentViewController](self, "parentViewController");
  v3 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  if (-[UIAlertController conformsToProtocol:](v3, "conformsToProtocol:", &unk_1EDE346C8))
    v4 = v3;
  else
    v4 = self;
  v5 = v4;

  return v5;
}

- (BOOL)_shouldSizeToFillSuperview
{
  void *v3;
  int v4;

  if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    return -[UIAlertController _isPresentedAsPopover](self, "_isPresentedAsPopover");
  }
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentedAsPopover");

  return !v4 || -[UIAlertController _isPresentedAsPopover](self, "_isPresentedAsPopover");
}

- (BOOL)_shouldFitWidthToContentViewControllerWidth
{
  void *v3;
  double v4;
  BOOL v5;

  if (!-[UIAlertController _isPresentedAsPopover](self, "_isPresentedAsPopover"))
    return 0;
  -[UIAlertController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4 > 0.0;

  return v5;
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  v4 = title;
  -[UIViewController setTitle:](&v6, sel_setTitle_, v4);
  -[UIAlertController _alertControllerView](self, "_alertControllerView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTitle:", v4);

}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(NSString *)message
{
  NSString *v4;
  NSString *v5;
  void *v6;
  NSString *v7;

  v7 = message;
  if ((-[NSString isEqual:](v7, "isEqual:", self->_message) & 1) == 0)
  {
    v4 = (NSString *)-[NSString copy](v7, "copy");
    v5 = self->_message;
    self->_message = v4;

    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setMessage:", v7);

  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSAttributedString)_attributedTitle
{
  return self->_attributedTitle;
}

- (void)_setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_attributedTitle) & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v7, "copy");
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAttributedTitle:", v7);

  }
}

- (void)_setTitleMaximumLineCount:(int64_t)a3
{
  id v3;

  if (self->_titleMaximumLineCount != a3)
  {
    self->_titleMaximumLineCount = a3;
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateLabelProperties");

  }
}

- (void)_setTitleLineBreakMode:(int64_t)a3
{
  id v3;

  if (self->_titleLineBreakMode != a3)
  {
    self->_titleLineBreakMode = a3;
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateLabelProperties");

  }
}

- (NSAttributedString)_attributedMessage
{
  return self->_attributedMessage;
}

- (void)_setAttributedMessage:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedMessage;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_attributedMessage) & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v7, "copy");
    attributedMessage = self->_attributedMessage;
    self->_attributedMessage = v4;

    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAttributedMessage:", v7);

  }
}

- (NSAttributedString)_attributedDetailMessage
{
  return self->_attributedDetailMessage;
}

- (void)_setAttributedDetailMessage:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedDetailMessage;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_attributedDetailMessage) & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v7, "copy");
    attributedDetailMessage = self->_attributedDetailMessage;
    self->_attributedDetailMessage = v4;

    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAttributedDetailMessage:", v7);

  }
}

- (BOOL)_hasTitle
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIViewController title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIAlertController _shouldTreatEmptyStringsAsNil](self, "_shouldTreatEmptyStringsAsNil"))
  {
    if (!v3)
      return -[UIAlertController _hasAttributedTitle](self, "_hasAttributedTitle");
    -[UIViewController title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      return -[UIAlertController _hasAttributedTitle](self, "_hasAttributedTitle");
  }
  else if (!v3)
  {
    return -[UIAlertController _hasAttributedTitle](self, "_hasAttributedTitle");
  }
  return 1;
}

- (BOOL)_hasAttributedTitle
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  -[UIAlertController _attributedTitle](self, "_attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !-[UIAlertController _shouldTreatEmptyStringsAsNil](self, "_shouldTreatEmptyStringsAsNil");
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  if ((v4 & 1) == 0 && v3)
  {
    -[UIAlertController _attributedTitle](self, "_attributedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)_hasMessage
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIAlertController message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIAlertController _shouldTreatEmptyStringsAsNil](self, "_shouldTreatEmptyStringsAsNil"))
  {
    if (!v3)
      return -[UIAlertController _hasAttributedMessage](self, "_hasAttributedMessage");
    -[UIAlertController message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      return -[UIAlertController _hasAttributedMessage](self, "_hasAttributedMessage");
  }
  else if (!v3)
  {
    return -[UIAlertController _hasAttributedMessage](self, "_hasAttributedMessage");
  }
  return 1;
}

- (BOOL)_hasAttributedMessage
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  -[UIAlertController _attributedMessage](self, "_attributedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !-[UIAlertController _shouldTreatEmptyStringsAsNil](self, "_shouldTreatEmptyStringsAsNil");
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  if ((v4 & 1) == 0 && v3)
  {
    -[UIAlertController _attributedMessage](self, "_attributedMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)_hasDetailMessage
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  -[UIAlertController _attributedDetailMessage](self, "_attributedDetailMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !-[UIAlertController _shouldTreatEmptyStringsAsNil](self, "_shouldTreatEmptyStringsAsNil");
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  if ((v4 & 1) == 0 && v3)
  {
    -[UIAlertController _attributedDetailMessage](self, "_attributedDetailMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)_shouldTreatEmptyStringsAsNil
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (UIAlertAction)_focusedAction
{
  void *v2;
  void *v3;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAlertAction *)v3;
}

- (UIView)_foregroundView
{
  void *v2;
  void *v3;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)_dimmingView
{
  void *v3;
  void *v4;

  if (-[UIAlertController _shouldProvideDimmingView](self, "_shouldProvideDimmingView"))
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v3, "_dimmingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (UIView *)v4;
}

- (UIEdgeInsets)_contentInsets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsetsForContainerView:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_setSeparatedHeaderContentViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  void *v9;
  int v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  if (self->_separatedHeaderContentViewController != v5)
  {
    v11 = v5;
    -[UIAlertController _separatedHeaderContentViewController](self, "_separatedHeaderContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromParentViewController");
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13010))
      objc_msgSend(v7, "_removeSeparatedHeaderContentViewControllerFromHierarchy");
    objc_storeStrong((id *)&self->_separatedHeaderContentViewController, a3);
    v8 = v11;
    if (v11)
    {
      -[UIViewController view](v11, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIViewController addChildViewController:](self, "addChildViewController:", v11);
      -[UIViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
      v8 = v11;
      if (v7)
      {
        v10 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13010);
        v8 = v11;
        if (v10)
        {
          objc_msgSend(v7, "_addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary");
          v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      objc_msgSend(v7, "_propertiesChanged");
      -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
    }

    v5 = v11;
  }

}

- (void)_setHeaderContentViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  void *v9;
  int v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  if (self->_headerContentViewController != v5)
  {
    v11 = v5;
    -[UIAlertController _headerContentViewController](self, "_headerContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromParentViewController");
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13010))
      objc_msgSend(v7, "_removeHeaderContentViewControllerViewFromHierarchy");
    objc_storeStrong((id *)&self->_headerContentViewController, a3);
    v8 = v11;
    if (v11)
    {
      -[UIViewController view](v11, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIViewController addChildViewController:](self, "addChildViewController:", v11);
      -[UIViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
      v8 = v11;
      if (v7)
      {
        v10 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13010);
        v8 = v11;
        if (v10)
        {
          objc_msgSend(v7, "_addHeaderContentViewControllerToViewHierarchyIfNecessary");
          v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      objc_msgSend(v7, "_propertiesChanged");
      -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
    }

    v5 = v11;
  }

}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  void *v9;
  int v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  if (self->_contentViewController != v5)
  {
    v11 = v5;
    -[UIAlertController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromParentViewController");
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13100))
      objc_msgSend(v7, "_removeContentViewControllerViewFromHierarchy");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    v8 = v11;
    if (v11)
    {
      -[UIViewController view](v11, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIViewController addChildViewController:](self, "addChildViewController:", v11);
      -[UIViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
      v8 = v11;
      if (v7)
      {
        v10 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF13100);
        v8 = v11;
        if (v10)
        {
          objc_msgSend(v7, "_addContentViewControllerToViewHierarchyIfNecessary");
          v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      objc_msgSend(v7, "_propertiesChanged");
      -[UIAlertController _updateProvidedStyle](self, "_updateProvidedStyle");
    }

    v5 = v11;
  }

}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF13100);

  if (v5)
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v12)
      objc_msgSend(v6, "_sizeOfContentViewControllerChanged");

  }
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EDF13010);

  if (v9)
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController _headerContentViewController](self, "_headerContentViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
      objc_msgSend(v10, "_sizeOfHeaderContentViewControllerChanged");
    else
      objc_msgSend(v10, "_sizeOfTextFieldViewControllerChanged");
    -[UIAlertController _recomputePreferredContentSize](self, "_recomputePreferredContentSize");

  }
}

- (void)_headerContentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[UIAlertController _headerContentViewController](self, "_headerContentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _childViewController:willTransitionToSize:withAnimations:](self, "_childViewController:willTransitionToSize:withAnimations:", v8, v7, width, height);

}

- (void)_contentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[UIAlertController contentViewController](self, "contentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _childViewController:willTransitionToSize:withAnimations:](self, "_childViewController:willTransitionToSize:withAnimations:", v8, v7, width, height);

}

- (void)_childViewController:(id)a3 willTransitionToSize:(CGSize)a4 withAnimations:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  _UIAnimationCoordinator *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  void (**v33)(_QWORD);
  _QWORD v34[6];
  _QWORD v35[4];
  void (**v36)(_QWORD);

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  if (!-[UIViewController isBeingPresented](self, "isBeingPresented")
    && !-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    v14 = objc_alloc_init(_UIAnimationCoordinator);
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    -[_UIAnimationCoordinator setDuration:](v14, "setDuration:", 0.35);
    v17 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_2;
    v34[3] = &__block_descriptor_48_e33_v16__0___UIAnimationCoordinator_8l;
    *(CGFloat *)&v34[4] = width;
    *(CGFloat *)&v34[5] = height;
    -[_UIAnimationCoordinator setPreperation:](v14, "setPreperation:", v34);
    v31[0] = v17;
    v31[1] = 3221225472;
    v31[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_3;
    v31[3] = &unk_1E16B2ED8;
    v33 = v10;
    v18 = v15;
    v32 = v18;
    -[_UIAnimationCoordinator setAnimator:](v14, "setAnimator:", v31);
    objc_initWeak(&location, self);
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_4;
    v28[3] = &unk_1E16B2F00;
    objc_copyWeak(&v29, &location);
    -[_UIAnimationCoordinator setCompletion:](v14, "setCompletion:", v28);
    -[_UIAnimationCoordinator setContainerView:](v14, "setContainerView:", v18);
    -[_UIAnimationCoordinator setViewController:](v14, "setViewController:", v16);
    objc_msgSend(v16, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[_UIAnimationCoordinator setStartFrame:](v14, "setStartFrame:", v21, v23, v25, v27);
    -[_UIAnimationCoordinator setEndFrame:](v14, "setEndFrame:", v21, v23, v25, v27);
    -[UIAlertController setTemporaryAnimationCoordinator:](self, "setTemporaryAnimationCoordinator:", v14);
    -[_UIAnimationCoordinator animate](v14, "animate");
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_5;
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke;
  v35[3] = &unk_1E16B2E90;
  v36 = v10;
  v13 = objc_msgSend(v12, "animateAlongsideTransition:completion:", v35, 0);

  if ((v13 & 1) == 0)
  {
LABEL_5:
    v10[2](v10);
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v14 = (_UIAnimationCoordinator *)objc_claimAutoreleasedReturnValue();
    -[_UIAnimationCoordinator layoutIfNeeded](v14, "layoutIfNeeded");
LABEL_7:

  }
}

uint64_t __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewWillTransitionToSize:withTransitionCoordinator:", v5, *(double *)(a1 + 32), *(double *)(a1 + 40));

}

uint64_t __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EDF13010);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_layoutAndPositionInParentIfNeeded");
  return result;
}

void __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setTemporaryAnimationCoordinator:", 0);

}

+ (id)_alertControllerContainedInViewController:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE346C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIAlertController.m"), 2183, CFSTR("A view controller not containing an alert controller was asked for its contained alert controller."));

  }
  objc_msgSend(v5, "_containedAlertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_hasContentToDisplay
{
  UIAlertController *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  UIAlertController *v8;
  void *v9;
  UIAlertController *v10;
  void *v11;
  void *v12;

  v2 = self;
  -[UIViewController title](v2, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[UIAlertController _attributedTitle](v2, "_attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  v8 = v2;
  -[UIAlertController message](v8, "message");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_2:
    v4 = (void *)v3;
    goto LABEL_3;
  }
  -[UIAlertController _attributedMessage](v8, "_attributedMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    return 1;
  v10 = v8;
  -[UIAlertController _headerContentViewController](v10, "_headerContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIAlertController contentViewController](v10, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v5 = 1;
    }
    else
    {
      -[UIAlertController _actions](v10, "_actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v12, "count") != 0;

    }
    goto LABEL_4;
  }
LABEL_3:
  v5 = 1;
LABEL_4:

  return v5;
}

- (void)_updateTextFieldViewControllerWithVisualStyle:(id)a3
{
  -[_UIAlertControllerTextFieldViewController setVisualStyle:](self->_textFieldViewController, "setVisualStyle:", a3);
}

- (void)_removeAllTextFields
{
  -[_UIAlertControllerTextFieldViewController removeAllTextFields](self->_textFieldViewController, "removeAllTextFields");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;

  v3 = a3;
  -[UIViewController _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_alertControllerStackManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_alertControllerStackManager, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  objc_msgSend(WeakRetained, "_alertControllerWillAppear:", self);

  -[UIAlertController _preserveInputViewsAnimated:](self, "_preserveInputViewsAnimated:", v3);
  -[UIAlertController _becomeFirstResponderIfAppropriate](self, "_becomeFirstResponderIfAppropriate");
  -[UIAlertController _addReturnKeyCommandIfAppropriate](self, "_addReturnKeyCommandIfAppropriate");
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__UIAlertController_viewWillAppear___block_invoke;
    v17[3] = &unk_1E16B2E68;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v18, "animateAlongsideTransition:completion:", v17, 0);

  }
  else
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureForPresentAlongsideTransitionCoordinator:", 0);

  }
  v16.receiver = self;
  v16.super_class = (Class)UIAlertController;
  -[UIViewController viewWillAppear:](&v16, sel_viewWillAppear_, v3);
  if (!-[UIAlertController _shouldAllowNilParameters](self, "_shouldAllowNilParameters")
    && !-[UIAlertController _hasContentToDisplay](self, "_hasContentToDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertController.m"), 2254, CFSTR("UIAlertController must have a title, a message or an action to display"));

  }
  self->_actionInvokedOnDismiss = 0;
  if (!+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController")&& !-[UIAlertController _isPresentedAsPopover](self, "_isPresentedAsPopover"))
  {
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldHaveBackdropView:", 1);

    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHasDimmingView:", 1);

  }
  if (-[UIViewController isBeingPresented](self, "isBeingPresented"))
    -[UIAlertController _logBeingPresented](self, "_logBeingPresented");

}

void __36__UIAlertController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_alertControllerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureForPresentAlongsideTransitionCoordinator:", *(_QWORD *)(a1 + 40));

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  objc_msgSend(WeakRetained, "_alertControllerDidAppear:", self);

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController _systemProvidedGestureRecognizer](self, "_systemProvidedGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:", v7);

  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  -[UIViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  objc_msgSend(WeakRetained, "_alertControllerWillDisappear:", self);

  -[_UIAlertControllerTextFieldViewController resignFirstResponder](self->_textFieldViewController, "resignFirstResponder");
  if (v3)
    -[UIAlertController _restoreInputViewsAnimated:](self, "_restoreInputViewsAnimated:", 1);
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureForDismissAlongsideTransitionCoordinator:", v7);

  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  -[UIViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
    -[UIAlertController _logBeingDismissed](self, "_logBeingDismissed");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  objc_msgSend(WeakRetained, "_alertControllerDidDisappear:", self);

  if (!v3)
    -[UIAlertController _restoreInputViewsAnimated:](self, "_restoreInputViewsAnimated:", 0);
  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectAllActions");

  v7.receiver = self;
  v7.super_class = (Class)UIAlertController;
  -[UIViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (BOOL)_shouldPreserveInputViews
{
  void *v3;
  void *v4;
  int v5;

  if (-[UIAlertController _shouldBecomeFirstResponder](self, "_shouldBecomeFirstResponder"))
  {
    if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
    {
      -[UIViewController _window](self, "_window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIViewController presentationController](self, "presentationController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "_preserveResponderAcrossWindows") ^ 1;

      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (!-[UIAlertController _hasPreservedInputViews](self, "_hasPreservedInputViews"))
  {
    if (-[UIAlertController _shouldPreserveInputViews](self, "_shouldPreserveInputViews"))
    {
      -[UIAlertController _setHasPreservedInputViews:](self, "_setHasPreservedInputViews:", 1);
      -[UIViewController _window](self, "_window");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyboardSceneDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_preserveInputViewsWithId:animated:", v7, v3);

    }
  }
}

- (void)_restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (-[UIAlertController _hasPreservedInputViews](self, "_hasPreservedInputViews"))
  {
    -[UIViewController _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_restoreInputViewsWithId:animated:", v8, v3);

    -[UIAlertController _setHasPreservedInputViews:](self, "_setHasPreservedInputViews:", 0);
  }
}

- (BOOL)_shouldBecomeFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = -[UIAlertController _resolvedStyle](self, "_resolvedStyle");
  v4 = v3;
  if (v3 == (void *)1000 || v3 == (void *)1)
  {
    -[UIViewController _focusSystem](self, "_focusSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 == 0;
  }
  else
  {
    v5 = 0;
  }
  if (v4 == (void *)1000 || v4 == (void *)1)

  return v5;
}

- (void)_becomeFirstResponderIfAppropriate
{
  if (-[UIAlertController _shouldBecomeFirstResponder](self, "_shouldBecomeFirstResponder"))
    -[UIResponder becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_hidden != a3)
  {
    v3 = a3;
    self->_hidden = a3;
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", self->_hidden);

    if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
    {
      -[UIViewController presentationController](self, "presentationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "_setChromeHidden:", v3);

    }
  }
}

- (void)_setEffectAlpha:(double)a3
{
  id v4;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectAlpha:", a3);

}

- (double)_effectAlpha
{
  void *v2;
  double v3;
  double v4;

  -[UIAlertController _alertControllerView](self, "_alertControllerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectAlpha");
  v4 = v3;

  return v4;
}

- (void)setSpringLoaded:(BOOL)a3
{
  id v4;

  if (self->_springLoaded != a3)
  {
    self->_springLoaded = a3;
    -[UIAlertController _alertControllerView](self, "_alertControllerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EDE11DE8))
      objc_msgSend(v4, "setSpringLoaded:", self->_springLoaded);

  }
}

- (id)_setView:(id)a3 forSystemProvidedPresentationWithDelegate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UIPreviewInteractionController *v17;
  UIPreviewForceInteractionProgress *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIAlertController _systemProvidedPresentationView](self, "_systemProvidedPresentationView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if ((id)v8 != v6)
  {
    if (v8)
    {
      -[UIAlertController _previewInteractionController](self, "_previewInteractionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "gestureRecognizers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v33;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v9, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v14);
      }

      -[UIAlertController _setSystemProvidedPresentationDelegate:](self, "_setSystemProvidedPresentationDelegate:", 0);
      -[UIAlertController _setSystemProvidedPresentationView:](self, "_setSystemProvidedPresentationView:", 0);
      -[UIAlertController _setPreviewInteractionController:](self, "_setPreviewInteractionController:", 0);

    }
    if (v6)
    {
      v17 = objc_alloc_init(UIPreviewInteractionController);
      v18 = -[UIPreviewForceInteractionProgress initWithView:targetState:]([UIPreviewForceInteractionProgress alloc], "initWithView:targetState:", v6, 2);
      -[UIPreviewInteractionController setInteractionProgressForPresentation:](v17, "setInteractionProgressForPresentation:", v18);
      -[UIPreviewInteractionController beginPreviewGestureRecognizer](v17, "beginPreviewGestureRecognizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPreviewForceInteractionProgress _setGestureBeginObservable:](v18, "_setGestureBeginObservable:", v19);

      -[UIPreviewInteractionController setDelegate:](v17, "setDelegate:", self);
      -[UIPreviewInteractionController gestureRecognizers](v17, "gestureRecognizers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v6, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v22);
      }
      -[UIAlertController _setSystemProvidedPresentationDelegate:](self, "_setSystemProvidedPresentationDelegate:", v7);
      -[UIAlertController _setSystemProvidedPresentationView:](self, "_setSystemProvidedPresentationView:", v6);
      -[UIAlertController _setPreviewInteractionController:](self, "_setPreviewInteractionController:", v17);

    }
  }
  -[UIAlertController _previewInteractionController](self, "_previewInteractionController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "presentationGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6
{
  void *v8;
  UIAlertController *v9;

  if (-[UIAlertController _canBePresentedAtLocation:](self, "_canBePresentedAtLocation:", a3, a5, a4.x, a4.y))
  {
    -[UIAlertController _systemProvidedPresentationDelegate](self, "_systemProvidedPresentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_presentingViewControllerForSystemProvidedPresentationOfAlertController:", self);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  id v7;

  -[UIAlertController _systemProvidedPresentationDelegate](self, "_systemProvidedPresentationDelegate", a3, a4, a6, a5.x, a5.y);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_willBeginSystemProvidedPresentationOfAlertController:", self);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_willPerformSystemProvidedPresentationOfAlertController:", self);
  }

}

- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3
{
  return 0;
}

- (BOOL)_isPresented
{
  void *v3;
  _BOOL4 v4;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[UIViewController isBeingPresented](self, "isBeingPresented");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)_canBePresentedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  void *v7;
  int v8;
  char v9;

  y = a3.y;
  x = a3.x;
  if (-[UIAlertController _isPresented](self, "_isPresented")
    || -[UIViewController isBeingPresented](self, "isBeingPresented"))
  {
    v6 = 0;
  }
  else
  {
    v6 = !-[UIViewController isBeingDismissed](self, "isBeingDismissed");
  }
  -[UIAlertController _systemProvidedPresentationDelegate](self, "_systemProvidedPresentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector() ^ 1;
  v9 = v8 & v6;
  if ((v8 & 1) == 0 && v6)
    v9 = objc_msgSend(v7, "_shouldPerformSystemProvidedPresentationOfAlertController:atSystemProvidedPresentationRegisteredViewLocation:", self, x, y);

  return v9;
}

- (void)_setSystemProvidedGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, a3);
}

- (__CFString)_powerLoggingEventName
{
  int64_t v4;
  void *v7;

  v4 = -[UIAlertController _resolvedStyle](self, "_resolvedStyle");
  if ((unint64_t)(v4 - 1000) < 2 || v4 == 0)
    return CFSTR("UIKit-ActionSheet");
  if (v4 == 1)
    return CFSTR("UIKit-Alert");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertController.m"), 2604, CFSTR("Unknown resolved alert controller style while trying to log."));

  return 0;
}

- (void)_logBeingPresented
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = &unk_1E1A965B8;
  v6[1] = CFSTR("Status");
  v6[2] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertController _powerLoggingEventName](self, "_powerLoggingEventName");
  PLLogRegisteredEvent();

}

- (void)_logBeingDismissed
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = &unk_1E1A965D0;
  v6[1] = CFSTR("Status");
  v6[2] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertController _powerLoggingEventName](self, "_powerLoggingEventName");
  PLLogRegisteredEvent();

}

- (NSMutableArray)_actions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1152, 1);
}

- (UIAlertAction)_cancelAction
{
  return (UIAlertAction *)objc_getProperty(self, a2, 1008, 1);
}

- (UIViewController)_headerContentViewController
{
  return self->_headerContentViewController;
}

- (UIViewController)_separatedHeaderContentViewController
{
  return self->_separatedHeaderContentViewController;
}

- (BOOL)_dismissedFromShim
{
  return self->dismissedFromShim;
}

- (void)_setDismissedFromShim:(BOOL)a3
{
  self->dismissedFromShim = a3;
}

- (int64_t)_resolvedStyle
{
  return self->_resolvedStyle;
}

- (UIAlertControllerVisualStyleProviding)_styleProvider
{
  return (UIAlertControllerVisualStyleProviding *)objc_loadWeakRetained((id *)&self->_styleProvider);
}

- (void)_setStyleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_styleProvider, a3);
}

- (BOOL)_isHidden
{
  return self->_hidden;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIAlertAction)preferredAction
{
  return self->_preferredAction;
}

- (BOOL)_shouldFlipFrameForShimDismissal
{
  return self->__shouldFlipFrameForShimDismissal;
}

- (void)set_shouldFlipFrameForShimDismissal:(BOOL)a3
{
  self->__shouldFlipFrameForShimDismissal = a3;
}

- (_UIAnimationCoordinator)temporaryAnimationCoordinator
{
  return self->_temporaryAnimationCoordinator;
}

- (void)setTemporaryAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryAnimationCoordinator, a3);
}

- (UIPreviewInteractionController)_previewInteractionController
{
  return self->_previewInteractionController;
}

- (void)_setPreviewInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteractionController, a3);
}

- (UIAlertControllerVisualStyle)_visualStyle
{
  return self->__visualStyle;
}

- (void)_setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->__visualStyle, a3);
}

- (NSIndexSet)_indexesOfActionSectionSeparators
{
  return self->_indexesOfActionSectionSeparators;
}

- (NSMutableArray)_actionDelimiterIndices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1224, 1);
}

- (BOOL)_shouldAllowNilParameters
{
  return self->__shouldAllowNilParameters;
}

- (void)_setShouldAllowNilParameters:(BOOL)a3
{
  self->__shouldAllowNilParameters = a3;
}

- (UIPopoverController)_compatibilityPopoverController
{
  return self->__compatibilityPopoverController;
}

- (void)_setCompatibilityPopoverController:(id)a3
{
  self->__compatibilityPopoverController = (UIPopoverController *)a3;
}

- (BOOL)_hasPreservedInputViews
{
  return self->_hasPreservedInputViews;
}

- (void)_setHasPreservedInputViews:(BOOL)a3
{
  self->_hasPreservedInputViews = a3;
}

- (UIView)_systemProvidedPresentationView
{
  return self->__systemProvidedPresentationView;
}

- (void)_setSystemProvidedPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->__systemProvidedPresentationView, a3);
}

- (UIAlertControllerSystemProvidedPresentationDelegate)_systemProvidedPresentationDelegate
{
  return self->__systemProvidedPresentationDelegate;
}

- (void)_setSystemProvidedPresentationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->__systemProvidedPresentationDelegate, a3);
}

- (UIGestureRecognizer)_systemProvidedGestureRecognizer
{
  return self->_systemProvidedGestureRecognizer;
}

- (BOOL)_wantsUnclippedContentViewControllerContainer
{
  return self->__wantsUnclippedContentViewControllerContainer;
}

- (void)_setWantsUnclippedContentViewControllerContainer:(BOOL)a3
{
  self->__wantsUnclippedContentViewControllerContainer = a3;
}

- (BOOL)_wantsUnclippedHeaderContentViewControllerContainer
{
  return self->__wantsUnclippedHeaderContentViewControllerContainer;
}

- (void)_setWantsUnclippedHeaderContentViewControllerContainer:(BOOL)a3
{
  self->__wantsUnclippedHeaderContentViewControllerContainer = a3;
}

- (UIAlertControllerCoordinatedActionPerforming)coordinatedActionPerformingDelegate
{
  return (UIAlertControllerCoordinatedActionPerforming *)objc_loadWeakRetained((id *)&self->_coordinatedActionPerformingDelegate);
}

- (void)setCoordinatedActionPerformingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_coordinatedActionPerformingDelegate, a3);
}

- (UIView)_presentationSourceRepresentationView
{
  return self->__presentationSourceRepresentationView;
}

- (void)_setPresentationSourceRepresentationView:(id)a3
{
  objc_storeStrong((id *)&self->__presentationSourceRepresentationView, a3);
}

- (int64_t)_titleMaximumLineCount
{
  return self->_titleMaximumLineCount;
}

- (int64_t)_titleLineBreakMode
{
  return self->_titleLineBreakMode;
}

- (UIImage)_accessoryImage
{
  return self->_accessoryImage;
}

- (void)_setAccessoryImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (BOOL)_shouldAlignToKeyboard
{
  return self->__shouldAlignToKeyboard;
}

- (void)_setShouldAlignToKeyboard:(BOOL)a3
{
  self->__shouldAlignToKeyboard = a3;
}

- (BOOL)_shouldInvokeCancelActionOnDimmingViewTap
{
  return self->__shouldInvokeCancelActionOnDimmingViewTap;
}

- (void)_setShouldInvokeCancelActionOnDimmingViewTap:(BOOL)a3
{
  self->__shouldInvokeCancelActionOnDimmingViewTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->__presentationSourceRepresentationView, 0);
  objc_destroyWeak((id *)&self->_coordinatedActionPerformingDelegate);
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__systemProvidedPresentationDelegate, 0);
  objc_storeStrong((id *)&self->__systemProvidedPresentationView, 0);
  objc_storeStrong((id *)&self->__actionDelimiterIndices, 0);
  objc_storeStrong((id *)&self->_indexesOfActionSectionSeparators, 0);
  objc_storeStrong((id *)&self->__visualStyle, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_temporaryAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewController, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_alertControllerStackManager);
  objc_storeStrong((id *)&self->_actionsWithInvokedHandlers, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong(&self->_ownedTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_backButtonDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textFieldViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_keyCommandToActionMapTable, 0);
  objc_storeStrong((id *)&self->_actionToKeyCommandsDictionary, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_linkedAlertControllers, 0);
  objc_storeStrong((id *)&self->_attributedDetailMessage, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
