@implementation UIAlertView

- (id)initWithFrame:(CGRect)frame
{
  UIAlertView *v3;
  UIAlertController *v4;
  UIAlertController *alertController;
  _UIAlertControllerShimPresenter *v6;
  _UIAlertControllerShimPresenter *presenter;
  NSMutableArray *v8;
  NSMutableArray *actions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIAlertView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIAlertController);
    alertController = v3->_alertController;
    v3->_alertController = v4;

    -[UIAlertController setPreferredStyle:](v3->_alertController, "setPreferredStyle:", 1);
    -[UIAlertController _setShouldAllowNilParameters:](v3->_alertController, "_setShouldAllowNilParameters:", 1);
    if (dyld_program_sdk_at_least()
      && ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
       || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle")))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2FC0], CFSTR("UIAlertView is deprecated and unavailable for UIScene based applications, please use UIAlertController!"));
    }
    v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    presenter = v3->_presenter;
    v3->_presenter = v6;

    -[_UIAlertControllerShimPresenter setAlertController:](v3->_presenter, "setAlertController:", v3->_alertController);
    -[_UIAlertControllerShimPresenter setLegacyAlert:](v3->_presenter, "setLegacyAlert:", v3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v3->_actions;
    v3->_actions = v8;

    v3->_cancelIndex = -1;
    v3->_defaultButtonIndex = -1;
    v3->_firstOtherButtonIndex = -1;
  }
  return v3;
}

- (UIAlertView)initWithTitle:(id)a3 buttons:(id)a4 defaultButtonIndex:(int)a5 delegate:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  UIAlertView *v16;
  UIAlertView *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (v16)
  {
    -[UIAlertView setTitle:](v16, "setTitle:", v12);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          -[UIAlertView addButtonWithTitle:](v17, "addButtonWithTitle:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22++), (_QWORD)v24);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }

    -[UIAlertView setDefaultButtonIndex:](v17, "setDefaultButtonIndex:", a5);
    -[UIAlertView setDelegate:](v17, "setDelegate:", v14);
    -[UIAlertView setContext:](v17, "setContext:", v15);
  }

  return v17;
}

- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButtons:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UIAlertView *v20;
  UIAlertView *v21;
  id *v22;
  id v23;
  id *v25;
  uint64_t v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v21 = v20;
  if (v20)
  {
    -[UIAlertView setTitle:](v20, "setTitle:", v14);
    -[UIAlertView setMessage:](v21, "setMessage:", v15);
    -[UIAlertView setDelegate:](v21, "setDelegate:", v16);
    if (v17)
      -[UIAlertView setCancelButtonIndex:](v21, "setCancelButtonIndex:", -[UIAlertView addButtonWithTitle:](v21, "addButtonWithTitle:", v17));
    if (v18)
      -[UIAlertView setCancelButtonIndex:](v21, "setCancelButtonIndex:", -[UIAlertView addButtonWithTitle:](v21, "addButtonWithTitle:", v18));
    if (v19)
    {
      v25 = (id *)&v26;
      do
      {
        -[UIAlertView addButtonWithTitle:](v21, "addButtonWithTitle:", v19);
        v22 = v25++;
        v23 = *v22;

        v19 = v23;
      }
      while (v23);
    }
  }

  return v21;
}

- (UIAlertView)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
  NSString *v12;
  NSString *v13;
  id v14;
  NSString *v15;
  NSString *v16;
  UIAlertView *v17;
  UIAlertView *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  va_list v23;
  va_list va;

  va_start(va, otherButtonTitles);
  v12 = title;
  v13 = message;
  v14 = delegate;
  v15 = cancelButtonTitle;
  v16 = otherButtonTitles;
  v17 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (v17)
  {
    -[UIAlertView setTitle:](v17, "setTitle:", v12);
    -[UIAlertView setMessage:](v18, "setMessage:", v13);
    -[UIAlertView setDelegate:](v18, "setDelegate:", v14);
    if (v15)
      -[UIAlertView setCancelButtonIndex:](v18, "setCancelButtonIndex:", -[UIAlertView addButtonWithTitle:](v18, "addButtonWithTitle:", v15));
    if (v16)
    {
      va_copy(v23, va);
      do
      {
        v19 = -[UIAlertView addButtonWithTitle:](v18, "addButtonWithTitle:", v16);
        if (-[UIAlertView firstOtherButtonIndex](v18, "firstOtherButtonIndex") == -1)
          -[UIAlertView _setFirstOtherButtonIndex:](v18, "_setFirstOtherButtonIndex:", v19);
        v20 = va_arg(v23, void *);
        v21 = v20;

        v16 = v21;
      }
      while (v21);
    }
  }

  return v18;
}

- (UIAlertView)initWithCoder:(NSCoder *)coder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIAlertView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, coder);
}

- (void)dealloc
{
  _UIAlertControllerShimPresenter *presenter;
  objc_super v4;

  -[_UIAlertControllerShimPresenter setAlertController:](self->_presenter, "setAlertController:", 0);
  -[_UIAlertControllerShimPresenter setLegacyAlert:](self->_presenter, "setLegacyAlert:", 0);
  presenter = self->_presenter;
  self->_presenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIAlertView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_updateButtonTitle:(id)a3 buttonIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSMutableArray count](self->_actions, "count") > a4)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_actions, "replaceObjectAtIndex:withObject:", a4, v7);
  -[UIAlertView _preparedAlertActionAtIndex:](self, "_preparedAlertActionAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

}

- (id)_preparedAlertActionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[UIAlertController _actions](self->_alertController, "_actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_prepareAlertActions
{
  char *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[2];
  _QWORD v11[4];
  id v12[2];
  id location;

  if (!self->_hasPreparedAlertActions)
  {
    v8 = 496;
    objc_initWeak(&location, self);
    v3 = 0;
    v4 = MEMORY[0x1E0C809B0];
    while ((unint64_t)v3 < -[NSMutableArray count](self->_actions, "count", v8))
    {
      -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v3 == (char *)self->_cancelIndex;
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __35__UIAlertView__prepareAlertActions__block_invoke;
      v11[3] = &unk_1E16B1C50;
      objc_copyWeak(v12, &location);
      v12[1] = v3;
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __35__UIAlertView__prepareAlertActions__block_invoke_2;
      v9[3] = &unk_1E16B1C78;
      objc_copyWeak(v10, &location);
      v10[1] = v3;
      +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:](UIAlertAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v5, 0, v6, v11, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](self->_alertController, "addAction:", v7);
      if (v3 == (char *)self->_defaultButtonIndex)
        -[UIAlertController setPreferredAction:](self->_alertController, "setPreferredAction:", v7);

      objc_destroyWeak(v10);
      objc_destroyWeak(v12);

      ++v3;
    }
    *((_BYTE *)&self->super.super.super.isa + v8) = 1;
    objc_destroyWeak(&location);
  }
}

void __35__UIAlertView__prepareAlertActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_dismissForTappedIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

uint64_t __35__UIAlertView__prepareAlertActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "_prepareToDismissForTappedIndex:", *(_QWORD *)(a1 + 40));
  else
    v4 = 1;

  return v4;
}

- (BOOL)isVisible
{
  void *v2;
  int v3;

  if (self->_isPresented)
  {
    -[UIAlertView window](self, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isHidden") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setTitle:(NSString *)title
{
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", title);
}

- (NSString)title
{
  return -[UIViewController title](self->_alertController, "title");
}

- (void)setMessage:(NSString *)message
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](message, "copy");
  v5 = self->_message;
  self->_message = v4;

  -[UIAlertView _updateMessageAndSubtitle](self, "_updateMessageAndSubtitle");
}

- (NSString)message
{
  return self->_message;
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  -[UIAlertView _updateMessageAndSubtitle](self, "_updateMessageAndSubtitle");
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)_updateMessageAndSubtitle
{
  NSString *message;
  NSString *subtitle;
  UIAlertController *alertController;
  id v5;

  message = self->_message;
  subtitle = self->_subtitle;
  if (message)
  {
    if (subtitle)
    {
      alertController = self->_alertController;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), subtitle, message);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIAlertController setMessage:](alertController, "setMessage:", v5);

      return;
    }
    subtitle = self->_message;
  }
  -[UIAlertController setMessage:](self->_alertController, "setMessage:", subtitle);
}

- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  self->_alertViewStyle = alertViewStyle;
  -[UIAlertView _alertController](self, "_alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeAllTextFields");

  switch(alertViewStyle)
  {
    case UIAlertViewStyleSecureTextInput:
      goto LABEL_7;
    case UIAlertViewStyleLoginAndPasswordInput:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Login"), CFSTR("Login"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIAlertView addTextFieldWithValue:label:](self, "addTextFieldWithValue:label:", 0, v7);

LABEL_7:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Password"), CFSTR("Password"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertView addTextFieldWithValue:label:](self, "addTextFieldWithValue:label:", 0, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setSecureTextEntry:", 1);
      return;
    case UIAlertViewStylePlainTextInput:
      v6 = -[UIAlertView addTextFieldWithValue:label:](self, "addTextFieldWithValue:label:", 0, 0);
      break;
  }
}

- (UIAlertViewStyle)alertViewStyle
{
  return self->_alertViewStyle;
}

- (id)window
{
  return -[_UIAlertControllerShimPresenter window](self->_presenter, "window");
}

- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3
{
  id v5;
  UIAlertView *v6;

  self->_handlingAlertActionShouldDismiss = 1;
  -[UIAlertView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  v6->_alertControllerShouldDismiss = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alertView:clickedButtonAtIndex:", v6, a3);
  -[UIAlertView dismissWithClickedButtonIndex:animated:](v6, "dismissWithClickedButtonIndex:animated:", a3, 1);
  self->_handlingAlertActionShouldDismiss = 0;
  return v6->_alertControllerShouldDismiss;
}

- (void)_dismissForTappedIndex:(int64_t)a3
{
  -[UIAlertView _performPresentationDismissalWithClickedButtonIndex:animated:](self, "_performPresentationDismissalWithClickedButtonIndex:animated:", a3, 1);
}

- (void)_setIsPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id *p_retainedSelf;
  char v7;
  id v8;
  void *v9;

  v3 = a3;
  -[UIAlertView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isPresented != v3)
  {
    self->_isPresented = v3;
    p_retainedSelf = &self->_retainedSelf;
    v9 = v5;
    if (!v3)
    {
      v8 = *p_retainedSelf;
      *p_retainedSelf = 0;

      goto LABEL_6;
    }
    objc_storeStrong(p_retainedSelf, self);
    -[UIAlertView _prepareAlertActions](self, "_prepareAlertActions");
    v7 = objc_opt_respondsToSelector();
    v5 = v9;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v9, "willPresentAlertView:", self);
LABEL_6:
      v5 = v9;
    }
  }

}

- (id)addButtonWithTitle:(id)a3 label:(id)a4
{
  -[UIAlertView addButtonWithTitle:](self, "addButtonWithTitle:", a3, a4);
  return 0;
}

- (id)addButtonWithTitle:(id)a3 buttonClass:(Class)a4
{
  -[UIAlertView addButtonWithTitle:](self, "addButtonWithTitle:", a3, a4);
  return 0;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
  NSString *v5;
  NSInteger v6;
  void *v8;

  v5 = title;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAlertView.m"), 384, CFSTR("UIAlertView: Buttons added must have a title."));

  }
  v6 = -[NSMutableArray count](self->_actions, "count");
  -[NSMutableArray addObject:](self->_actions, "addObject:", v5);

  return v6;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  int64_t v3;

  if (a3 < 0)
    v3 = -1;
  else
    v3 = a3;
  self->_defaultButtonIndex = v3;
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex
{
  self->_cancelIndex = cancelButtonIndex;
}

- (NSInteger)cancelButtonIndex
{
  return self->_cancelIndex;
}

- (void)_setFirstOtherButtonIndex:(int64_t)a3
{
  self->_firstOtherButtonIndex = a3;
}

- (NSInteger)firstOtherButtonIndex
{
  return self->_firstOtherButtonIndex;
}

- (void)_updateFirstOtherButtonEnabledState
{
  void *v3;
  uint64_t v4;
  id v5;

  -[UIAlertView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertView _preparedAlertActionAtIndex:](self, "_preparedAlertActionAtIndex:", self->_firstOtherButtonIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v5, "alertViewShouldEnableFirstOtherButton:", self);
    else
      v4 = 1;
    objc_msgSend(v3, "setEnabled:", v4);
  }

}

- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex
{
  return (NSString *)-[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", buttonIndex);
}

- (NSInteger)numberOfButtons
{
  return -[NSMutableArray count](self->_actions, "count");
}

- (int)buttonCount
{
  return -[UIAlertView numberOfButtons](self, "numberOfButtons");
}

- (int64_t)_maximumNumberOfTextFieldsForCurrentStyle
{
  UIAlertViewStyle v3;

  -[UIAlertView alertViewStyle](self, "alertViewStyle");
  v3 = -[UIAlertView alertViewStyle](self, "alertViewStyle");
  if ((unint64_t)(v3 - 1) > 2)
    return 2;
  else
    return qword_1866781B8[v3 - 1];
}

- (id)_addTextFieldWithValue:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  UIAlertView *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = -[UIAlertView textFieldCount](self, "textFieldCount");
  if (-[UIAlertView _maximumNumberOfTextFieldsForCurrentStyle](self, "_maximumNumberOfTextFieldsForCurrentStyle") == v8)
  {
    v9 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    -[UIAlertView _alertController](self, "_alertController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__UIAlertView__addTextFieldWithValue_label___block_invoke;
    v12[3] = &unk_1E16B1D40;
    v16 = &v17;
    v13 = v6;
    v14 = v7;
    v15 = self;
    objc_msgSend(v10, "addTextFieldWithConfigurationHandler:", v12);

    v9 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  return v9;
}

void __44__UIAlertView__addTextFieldWithValue_label___block_invoke(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setText:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setPlaceholder:", a1[5]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addTarget:action:forControlEvents:", a1[6], sel__textDidChangeInTextField_, 0x20000);

}

- (int)textFieldCount
{
  void *v2;
  void *v3;
  int v4;

  -[UIAlertView _alertController](self, "_alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)textField
{
  void *v2;
  void *v3;
  void *v4;

  -[UIAlertView _alertController](self, "_alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UITextField)textFieldAtIndex:(NSInteger)textFieldIndex
{
  void *v4;
  void *v5;
  void *v6;

  -[UIAlertView _alertController](self, "_alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (textFieldIndex < 0 || objc_msgSend(v5, "count") <= (unint64_t)textFieldIndex)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", textFieldIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UITextField *)v6;
}

- (void)_showAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  _UIAlertControllerShimPresenter *presenter;
  id v8;
  _QWORD v9[4];
  id v10;
  UIAlertView *v11;
  _QWORD v12[5];

  v3 = a3;
  -[UIAlertView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertView _setIsPresented:](self, "_setIsPresented:", 1);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__UIAlertView__showAnimated___block_invoke;
  v12[3] = &unk_1E16B1B28;
  v12[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  presenter = self->_presenter;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __29__UIAlertView__showAnimated___block_invoke_2;
  v9[3] = &unk_1E16B1B50;
  v10 = v5;
  v11 = self;
  v8 = v5;
  -[_UIAlertControllerShimPresenter _presentAlertControllerAnimated:completion:](presenter, "_presentAlertControllerAnimated:completion:", v3, v9);

}

uint64_t __29__UIAlertView__showAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFirstOtherButtonEnabledState");
}

void __29__UIAlertView__showAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "didPresentAlertView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "textField");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)show
{
  -[UIAlertView _showAnimated:](self, "_showAnimated:", 1);
}

- (void)dismissAnimated:(BOOL)a3
{
  -[UIAlertView dismissWithClickedButtonIndex:animated:](self, "dismissWithClickedButtonIndex:animated:", -[UIAlertView cancelButtonIndex](self, "cancelButtonIndex"), a3);
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
  _BOOL8 v4;
  uint64_t v7;
  id v8;

  if (!self->_dismissingAlertController)
  {
    v4 = animated;
    -[UIAlertView delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    self->_alertControllerShouldDismiss = 1;
    self->_dismissingAlertController = 1;
    v8 = (id)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "alertView:willDismissWithButtonIndex:", self, buttonIndex);
    if (!self->_handlingAlertActionShouldDismiss)
      -[UIAlertView _performPresentationDismissalWithClickedButtonIndex:animated:](self, "_performPresentationDismissalWithClickedButtonIndex:animated:", buttonIndex, v4);

  }
}

- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  _UIAlertControllerShimPresenter *presenter;
  id v9;
  UIAlertView *v10;
  _QWORD v11[4];
  id v12;
  UIAlertView *v13;
  int64_t v14;

  if (self->_alertControllerShouldDismiss)
  {
    v4 = a4;
    -[UIAlertView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    presenter = self->_presenter;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__UIAlertView__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke;
    v11[3] = &unk_1E16B1C28;
    v12 = v7;
    v13 = self;
    v14 = a3;
    v9 = v7;
    v10 = self;
    -[_UIAlertControllerShimPresenter _dismissAlertControllerAnimated:completion:](presenter, "_dismissAlertControllerAnimated:completion:", v4, v11);
    v10->_dismissingAlertController = 0;

  }
}

uint64_t __76__UIAlertView__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "alertView:didDismissWithButtonIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_setIsPresented:", 0);
}

- (BOOL)_isAnimating
{
  return -[UIViewController isBeingPresented](self->_alertController, "isBeingPresented")
      || -[UIViewController isBeingDismissed](self->_alertController, "isBeingDismissed");
}

- (CGSize)backgroundSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)numberOfRows
{
  return 0;
}

- (void)_setAccessoryView:(id)a3
{
  id v4;
  UIViewController *v5;
  void *v6;
  _UIAlertViewShimAccessoryViewController *v7;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(UIViewController);
    -[UIViewController setView:](v5, "setView:", v4);

    v7 = -[_UIAlertViewShimAccessoryViewController initWithAccessoryViewController:]([_UIAlertViewShimAccessoryViewController alloc], "initWithAccessoryViewController:", v5);
  }
  else
  {
    v7 = 0;
  }
  -[UIAlertView _alertController](self, "_alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentViewController:", v7);

}

- (BOOL)groupsTextFields
{
  return 0;
}

- (void)dismiss
{
  -[UIAlertView dismissAnimated:](self, "dismissAnimated:", 1);
}

- (id)titleLabel
{
  return 0;
}

- (id)keyboard
{
  return 0;
}

- (id)tableView
{
  return 0;
}

- (id)_addButtonWithTitle:(id)a3
{
  -[UIAlertView addButtonWithTitle:](self, "addButtonWithTitle:", a3);
  return 0;
}

- (id)_alertController
{
  return self->_alertController;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak(&self->_delegate, delegate);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (UIViewController)_externalViewControllerForPresentation
{
  return self->_externalViewControllerForPresentation;
}

- (void)_setExternalViewControllerForPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_externalViewControllerForPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalViewControllerForPresentation, 0);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 cancelButtonTitle:(id)a6
{
  return -[UIAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:](self, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a3, a4, a5, a6, 0);
}

+ (id)_remoteAlertViewWithBlock:(id)a3
{
  void (**v3)(id, _UIUserNotificationAlertView *);
  _UIUserNotificationAlertView *v4;
  void *v5;

  v3 = (void (**)(id, _UIUserNotificationAlertView *))a3;
  v4 = -[UIAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:]([_UIUserNotificationAlertView alloc], "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", 0, 0, 0, 0, 0);
  v3[2](v3, v4);

  +[_UIUserNotificationRestrictedAlertViewProxy restrictedProxyForAlertView:](_UIUserNotificationRestrictedAlertViewProxy, "restrictedProxyForAlertView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_alertViewForSessionWithRemoteViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("remoteViewControllerProxy is nil!"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__UIAlertView_ViewServiceSupport___alertViewForSessionWithRemoteViewController___block_invoke;
  v8[3] = &unk_1E16E8D30;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_remoteAlertViewWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __80__UIAlertView_ViewServiceSupport___alertViewForSessionWithRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRemoteViewController:", *(_QWORD *)(a1 + 32));
}

+ (id)_alertViewForWindow:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__UIAlertView_ViewServiceSupport___alertViewForWindow___block_invoke;
    v7[3] = &unk_1E16E8D30;
    v8 = v4;
    objc_msgSend(a1, "_remoteAlertViewWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", 0, 0, 0, 0, 0);
  }

  return v5;
}

uint64_t __55__UIAlertView_ViewServiceSupport___alertViewForWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostedWindow:", *(_QWORD *)(a1 + 32));
}

@end
