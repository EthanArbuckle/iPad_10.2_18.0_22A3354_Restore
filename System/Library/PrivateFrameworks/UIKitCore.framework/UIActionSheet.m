@implementation UIActionSheet

- (UIActionSheet)initWithFrame:(CGRect)a3
{
  UIActionSheet *v3;
  UIAlertController *v4;
  UIAlertController *alertController;
  _UIAlertControllerShimPresenter *v6;
  _UIAlertControllerShimPresenter *presenter;
  NSMutableArray *v8;
  NSMutableArray *actions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIActionSheet;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIAlertController);
    alertController = v3->_alertController;
    v3->_alertController = v4;

    -[UIAlertController setPreferredStyle:](v3->_alertController, "setPreferredStyle:", 0);
    -[UIAlertController _setShouldAllowNilParameters:](v3->_alertController, "_setShouldAllowNilParameters:", 1);
    v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    presenter = v3->_presenter;
    v3->_presenter = v6;

    -[_UIAlertControllerShimPresenter setAlertController:](v3->_presenter, "setAlertController:", v3->_alertController);
    -[_UIAlertControllerShimPresenter setPopoverDelegate:](v3->_presenter, "setPopoverDelegate:", v3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v3->_actions;
    v3->_actions = v8;

    v3->_cancelIndex = -1;
    v3->_firstOtherButtonIndex = -1;
    v3->_destructiveButtonIndex = -1;
  }
  return v3;
}

- (UIActionSheet)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
  NSString *v12;
  id v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  UIActionSheet *v17;
  UIActionSheet *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  va_list v23;
  va_list va;

  va_start(va, otherButtonTitles);
  v12 = title;
  v13 = delegate;
  v14 = cancelButtonTitle;
  v15 = destructiveButtonTitle;
  v16 = otherButtonTitles;
  v17 = -[UIActionSheet initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (v17)
  {
    -[UIActionSheet setTitle:](v17, "setTitle:", v12);
    -[UIActionSheet setDelegate:](v18, "setDelegate:", v13);
    if (v15)
      -[UIActionSheet setDestructiveButtonIndex:](v18, "setDestructiveButtonIndex:", -[UIActionSheet addButtonWithTitle:](v18, "addButtonWithTitle:", v15));
    if (v16)
    {
      va_copy(v23, va);
      do
      {
        v19 = -[UIActionSheet addButtonWithTitle:](v18, "addButtonWithTitle:", v16);
        if (-[UIActionSheet firstOtherButtonIndex](v18, "firstOtherButtonIndex") == -1)
          -[UIActionSheet _setFirstOtherButtonIndex:](v18, "_setFirstOtherButtonIndex:", v19);
        v20 = va_arg(v23, void *);
        v21 = v20;

        v16 = v21;
      }
      while (v21);
    }
    if (v14)
      -[UIActionSheet setCancelButtonIndex:](v18, "setCancelButtonIndex:", -[UIActionSheet addButtonWithTitle:](v18, "addButtonWithTitle:", v14));
    v16 = 0;
  }

  return v18;
}

- (void)dealloc
{
  _UIAlertControllerShimPresenter *presenter;
  objc_super v4;

  -[_UIAlertControllerShimPresenter setAlertController:](self->_presenter, "setAlertController:", 0);
  -[_UIAlertControllerShimPresenter setPopoverDelegate:](self->_presenter, "setPopoverDelegate:", 0);
  presenter = self->_presenter;
  self->_presenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIActionSheet;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setTitle:(NSString *)title
{
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", title);
}

- (NSString)title
{
  return -[UIViewController title](self->_alertController, "title");
}

- (void)setActionSheetStyle:(UIActionSheetStyle)actionSheetStyle
{
  self->_actionSheetStyle = actionSheetStyle;
}

- (UIActionSheetStyle)actionSheetStyle
{
  return self->_actionSheetStyle;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActionSheet.m"), 125, CFSTR("UIActionSheet: Buttons added must have a title."));

  }
  v6 = -[NSMutableArray count](self->_actions, "count");
  -[NSMutableArray addObject:](self->_actions, "addObject:", v5);

  return v6;
}

- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex
{
  return (NSString *)-[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", buttonIndex);
}

- (NSInteger)numberOfButtons
{
  return -[NSMutableArray count](self->_actions, "count");
}

- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex
{
  self->_cancelIndex = cancelButtonIndex;
}

- (NSInteger)cancelButtonIndex
{
  return self->_cancelIndex;
}

- (void)setDestructiveButtonIndex:(NSInteger)destructiveButtonIndex
{
  self->_destructiveButtonIndex = destructiveButtonIndex;
}

- (NSInteger)destructiveButtonIndex
{
  return self->_destructiveButtonIndex;
}

- (void)_setFirstOtherButtonIndex:(int64_t)a3
{
  self->_firstOtherButtonIndex = a3;
}

- (NSInteger)firstOtherButtonIndex
{
  return self->_firstOtherButtonIndex;
}

- (BOOL)isVisible
{
  void *v2;
  int v3;

  if (self->_isPresented)
  {
    -[UIView window](self, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isHidden") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  _BOOL8 v4;
  UIBarButtonItem *v6;
  _UIAlertControllerShimPresenter *presenter;
  _QWORD v8[5];

  v4 = animated;
  v6 = item;
  -[UIActionSheet _setIsPresented:](self, "_setIsPresented:", 1);
  presenter = self->_presenter;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__UIActionSheet_showFromBarButtonItem_animated___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromBarButtonItem:animated:completion:](presenter, "_presentAlertControllerFromBarButtonItem:animated:completion:", v6, v4, v8);

}

uint64_t __48__UIActionSheet_showFromBarButtonItem_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresent");
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
  -[UIActionSheet _showFromRect:inView:direction:animated:](self, "_showFromRect:inView:direction:animated:", view, 15, animated, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)_showFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  _UIAlertControllerShimPresenter *presenter;
  _QWORD v15[5];

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  -[UIActionSheet _setIsPresented:](self, "_setIsPresented:", 1);
  presenter = self->_presenter;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__UIActionSheet__showFromRect_inView_direction_animated___block_invoke;
  v15[3] = &unk_1E16B1B28;
  v15[4] = self;
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](presenter, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v13, a5, v6, v15, x, y, width, height);

}

uint64_t __57__UIActionSheet__showFromRect_inView_direction_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresent");
}

- (void)showInView:(UIView *)view
{
  UIView *v4;
  double v5;
  double v6;
  double v7;
  _UIAlertControllerShimPresenter *presenter;
  double v9;
  _QWORD v10[5];

  v4 = view;
  -[UIActionSheet _setIsPresented:](self, "_setIsPresented:", 1);
  -[UIView bounds](v4, "bounds");
  presenter = self->_presenter;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__UIActionSheet_showInView___block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](presenter, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v4, 0, 1, v10, v6 + floor(v5 * 0.5), v9 + floor(v7 * 0.5), 1.0, 1.0);

}

uint64_t __28__UIActionSheet_showInView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresent");
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
  _BOOL8 v4;
  uint64_t v7;
  id v8;

  if (!self->_dismissingAlertController)
  {
    v4 = animated;
    -[UIActionSheet delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    self->_alertControllerShouldDismiss = 1;
    self->_dismissingAlertController = 1;
    v8 = (id)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "actionSheet:willDismissWithButtonIndex:", self, buttonIndex);
    if (!self->_handlingAlertActionShouldDismiss)
      -[UIActionSheet _performPresentationDismissalWithClickedButtonIndex:animated:](self, "_performPresentationDismissalWithClickedButtonIndex:animated:", buttonIndex, v4);

  }
}

- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  _UIAlertControllerShimPresenter *presenter;
  id v8;
  _QWORD v9[4];
  id v10;
  UIActionSheet *v11;
  int64_t v12;

  if (self->_alertControllerShouldDismiss)
  {
    -[UIActionSheet delegate](self, "delegate", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    presenter = self->_presenter;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__UIActionSheet__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke;
    v9[3] = &unk_1E16B1C28;
    v10 = v6;
    v11 = self;
    v12 = a3;
    v8 = v6;
    -[_UIAlertControllerShimPresenter _dismissAlertControllerAnimated:completion:](presenter, "_dismissAlertControllerAnimated:completion:", 1, v9);
    self->_dismissingAlertController = 0;

  }
}

uint64_t __78__UIActionSheet__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "actionSheet:didDismissWithButtonIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_setIsPresented:", 0);
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
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[2];
  _QWORD v11[4];
  id v12[2];
  id location;

  if (!self->_hasPreparedAlertActions)
  {
    v8 = 480;
    objc_initWeak(&location, self);
    v3 = 0;
    v4 = MEMORY[0x1E0C809B0];
    while ((unint64_t)v3 < -[NSMutableArray count](self->_actions, "count", v8))
    {
      -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 == (char *)self->_destructiveButtonIndex)
        v6 = 2;
      else
        v6 = v3 == (char *)self->_cancelIndex;
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __37__UIActionSheet__prepareAlertActions__block_invoke;
      v11[3] = &unk_1E16B1C50;
      objc_copyWeak(v12, &location);
      v12[1] = v3;
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __37__UIActionSheet__prepareAlertActions__block_invoke_2;
      v9[3] = &unk_1E16B1C78;
      objc_copyWeak(v10, &location);
      v10[1] = v3;
      +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:](UIAlertAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v5, 0, v6, v11, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](self->_alertController, "addAction:", v7);

      objc_destroyWeak(v10);
      objc_destroyWeak(v12);

      ++v3;
    }
    *((_BYTE *)&self->super.super.super.isa + v8) = 1;
    objc_destroyWeak(&location);
  }
}

void __37__UIActionSheet__prepareAlertActions__block_invoke(uint64_t a1)
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

uint64_t __37__UIActionSheet__prepareAlertActions__block_invoke_2(uint64_t a1)
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

- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3
{
  id v5;
  UIActionSheet *v6;

  self->_handlingAlertActionShouldDismiss = 1;
  -[UIActionSheet delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  v6->_alertControllerShouldDismiss = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "actionSheet:clickedButtonAtIndex:", v6, a3);
  -[UIActionSheet dismissWithClickedButtonIndex:animated:](v6, "dismissWithClickedButtonIndex:animated:", a3, 1);
  self->_handlingAlertActionShouldDismiss = 0;
  return v6->_alertControllerShouldDismiss;
}

- (void)_dismissForTappedIndex:(int64_t)a3
{
  -[UIActionSheet _performPresentationDismissalWithClickedButtonIndex:animated:](self, "_performPresentationDismissalWithClickedButtonIndex:animated:", a3, 1);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  -[UIActionSheet _prepareToDismissForTappedIndex:](self, "_prepareToDismissForTappedIndex:", -[UIActionSheet cancelButtonIndex](self, "cancelButtonIndex", a3));
  -[UIActionSheet _dismissForTappedIndex:](self, "_dismissForTappedIndex:", -[UIActionSheet cancelButtonIndex](self, "cancelButtonIndex"));
}

- (void)_setIsPresented:(BOOL)a3
{
  char v4;
  UIActionSheet *retainedSelf;
  UIActionSheet *v6;

  if (self->_isPresented != a3)
  {
    self->_isPresented = a3;
    if (a3)
    {
      -[UIActionSheet delegate](self, "delegate");
      v6 = (UIActionSheet *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_retainedSelf, self);
      -[UIActionSheet _prepareAlertActions](self, "_prepareAlertActions");
      v4 = objc_opt_respondsToSelector();
      retainedSelf = v6;
      if ((v4 & 1) != 0)
      {
        -[UIActionSheet willPresentActionSheet:](v6, "willPresentActionSheet:", self);

        return;
      }
    }
    else
    {
      retainedSelf = self->_retainedSelf;
      self->_retainedSelf = 0;
    }

  }
}

- (void)_didPresent
{
  id v3;

  -[UIActionSheet delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didPresentActionSheet:", self);

}

- (void)setMessage:(id)a3
{
  -[UIAlertController setMessage:](self->_alertController, "setMessage:", a3);
}

- (id)message
{
  return -[UIAlertController message](self->_alertController, "message");
}

- (void)presentFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 allowInteractionWithViews:(id)a6 backgroundStyle:(int64_t)a7 animated:(BOOL)a8
{
  -[UIActionSheet _showFromRect:inView:direction:animated:](self, "_showFromRect:inView:direction:animated:", a4, a5, a8, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setAttributedTitleString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIActionSheet _alertController](self, "_alertController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAttributedTitle:", v4);

}

- (id)addButtonWithTitle:(id)a3 label:(id)a4
{
  -[UIActionSheet addButtonWithTitle:](self, "addButtonWithTitle:", a3, a4);
  return 0;
}

- (id)_alertController
{
  return self->_alertController;
}

- (id)_titleLabel
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (UIActionSheet)initWithTitle:(id)a3 delegate:(id)a4 cancelButtonTitle:(id)a5 destructiveButtonTitle:(id)a6
{
  return -[UIActionSheet initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:](self, "initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:", a3, a4, a5, a6, 0);
}

@end
