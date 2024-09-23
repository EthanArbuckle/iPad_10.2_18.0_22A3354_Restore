@implementation PXAlertController

- (PXAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  PXAlertController *v4;
  _PXAlertContentViewController *v5;
  _PXAlertContentViewController *contentViewController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXAlertController;
  v4 = -[PXAlertController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(_PXAlertContentViewController);
    contentViewController = v4->_contentViewController;
    v4->_contentViewController = v5;

  }
  return v4;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView *v7;
  _PXAlertContentViewController *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  if (self->_contentView != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_contentView, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;
    objc_storeStrong((id *)&self->_progressView, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
    objc_storeStrong((id *)&self->_activityIndicatorView, v7);
    if (v9)
    {
      v8 = -[_PXAlertContentViewController initWithContentView:]([_PXAlertContentViewController alloc], "initWithContentView:", v9);
      -[PXAlertController setContentViewController:](self, "setContentViewController:", v8);

    }
    else
    {
      -[PXAlertController setContentViewController:](self, "setContentViewController:", 0);
    }
    v5 = v9;
  }

}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  -[UIProgressView setProgress:animated:](self->_progressView, "setProgress:animated:", a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAlertController;
  -[PXAlertController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAlertController;
  -[PXAlertController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4 shouldDismiss:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  BOOL v14;

  v8 = a4;
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__PXAlertController_activityAlertControllerWithTitle_cancelHandler_shouldDismiss___block_invoke;
  v13[3] = &__block_descriptor_33_e5_B8__0l;
  v14 = a5;
  objc_msgSend(v9, "_addActionWithTitle:style:handler:shouldDismissHandler:", v10, 1, v8, v13);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v9, "setContentView:", v11);

  return v9;
}

+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4
{
  return (id)objc_msgSend(a1, "activityAlertControllerWithTitle:cancelHandler:shouldDismiss:", a3, a4, 0);
}

+ (id)progressAlertControllerWithMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
  objc_msgSend(v3, "setContentView:", v4);

  return v3;
}

uint64_t __82__PXAlertController_activityAlertControllerWithTitle_cancelHandler_shouldDismiss___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

@end
