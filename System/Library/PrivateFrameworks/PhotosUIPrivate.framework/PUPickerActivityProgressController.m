@implementation PUPickerActivityProgressController

- (PUPickerActivityProgressController)init
{
  PUPickerActivityProgressController *v2;
  PUAssetPickerActivityProgressViewController *v3;
  PUAssetPickerActivityProgressViewController *progressViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPickerActivityProgressController;
  v2 = -[PUPickerActivityProgressController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PUAssetPickerActivityProgressViewController);
    progressViewController = v2->_progressViewController;
    v2->_progressViewController = v3;

  }
  return v2;
}

- (void)setProgress:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_progress, a3);
  v5 = a3;
  -[PUAssetPickerActivityProgressViewController setProgress:](self->_progressViewController, "setProgress:", v5);

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  UIAlertController *alertController;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v6;

      alertController = self->_alertController;
      if (alertController)
        -[UIAlertController setTitle:](alertController, "setTitle:", self->_title);
    }
  }

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *message;
  UIAlertController *alertController;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_message;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v9, "copy");
      message = self->_message;
      self->_message = v6;

      alertController = self->_alertController;
      if (alertController)
        -[UIAlertController setMessage:](alertController, "setMessage:", self->_message);
    }
  }

}

- (void)showFromSourceViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PUPickerActivityProgressController _setupAlertController](self, "_setupAlertController");
  objc_msgSend(v7, "presentViewController:animated:completion:", self->_alertController, 1, v6);

}

- (void)hideWithCompletion:(id)a3
{
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 1, a3);
}

- (void)_setupAlertController
{
  void *v3;
  void *v4;
  UIAlertController *v5;
  void *v6;
  UIAlertController *alertController;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[PUPickerActivityProgressController title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerActivityProgressController message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  PULocalizedString(CFSTR("CANCEL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__PUPickerActivityProgressController__setupAlertController__block_invoke;
  v11 = &unk_1E58AB2F8;
  objc_copyWeak(&v12, &location);
  -[UIAlertController _addActionWithTitle:style:handler:shouldDismissHandler:](v5, "_addActionWithTitle:style:handler:shouldDismissHandler:", v6, 1, &v8, &__block_literal_global_1278);

  -[UIAlertController setContentViewController:](v5, "setContentViewController:", self->_progressViewController, v8, v9, v10, v11);
  alertController = self->_alertController;
  self->_alertController = v5;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
}

void __59__PUPickerActivityProgressController__setupAlertController__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancellationHandler");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

}

uint64_t __59__PUPickerActivityProgressController__setupAlertController__block_invoke_2()
{
  return 0;
}

@end
