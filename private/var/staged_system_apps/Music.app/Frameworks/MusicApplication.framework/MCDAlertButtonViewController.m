@implementation MCDAlertButtonViewController

- (MCDAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  MCDAlertButtonViewController *v8;
  MCDAlertButtonView *v9;
  MCDAlertButtonView *contentView;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCDAlertButtonViewController;
  v8 = -[MCDAlertButtonViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = -[MCDAlertButtonView initWithTitle:image:]([MCDAlertButtonView alloc], "initWithTitle:image:", v6, v7);
    contentView = v8->_contentView;
    v8->_contentView = v9;

  }
  return v8;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTouch:");
  objc_msgSend(v3, "setAllowedPressTypes:", &off_13E7860);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonViewController contentView](self, "contentView"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  v5 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleTouch:");
  objc_msgSend(v5, "setAllowedTouchTypes:", &off_13E7878);
  objc_msgSend(v5, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v5, "setCancelsTouchesInView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonViewController contentView](self, "contentView"));
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonViewController contentView](self, "contentView"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = __40__MCDAlertButtonViewController_loadView__block_invoke;
  v12 = &unk_1339380;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "setAccessibilityActivateBlock:", &v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonViewController contentView](self, "contentView", v9, v10, v11, v12));
  -[MCDAlertButtonViewController setView:](self, "setView:", v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __40__MCDAlertButtonViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAlertController");

  return 1;
}

- (void)_handleTouch:(id)a3
{
  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
    -[MCDAlertButtonViewController _dismissAlertController](self, "_dismissAlertController");
}

- (void)_dismissAlertController
{
  -[MCDAlertButtonView setHighlighted:](self->_contentView, "setHighlighted:", 0);
  -[MCDAlertButtonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[1] = 3221225472;
  v8[2] = __73__MCDAlertButtonViewController_dismissViewControllerAnimated_completion___block_invoke;
  v8[3] = &unk_13393A8;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonViewController completionHandler](self, "completionHandler", a3, a4));
  v7.receiver = self;
  v7.super_class = (Class)MCDAlertButtonViewController;
  v8[0] = _NSConcreteStackBlock;
  v6 = v9;
  -[MCDAlertButtonViewController dismissViewControllerAnimated:completion:](&v7, "dismissViewControllerAnimated:completion:", v4, v8);

}

uint64_t __73__MCDAlertButtonViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (MCDAlertButtonView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
