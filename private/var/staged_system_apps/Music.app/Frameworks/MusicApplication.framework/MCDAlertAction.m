@implementation MCDAlertAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCDAlertButtonViewController *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MCDAlertButtonViewController initWithTitle:image:]([MCDAlertButtonViewController alloc], "initWithTitle:image:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_actionWithContentViewController:style:handler:", v11, 0, v10));
  objc_msgSend(v12, "setActionHandler:", v10);
  objc_initWeak(&location, v12);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = __48__MCDAlertAction_actionWithTitle_image_handler___block_invoke;
  v17 = &unk_1338FB0;
  objc_copyWeak(&v18, &location);
  -[MCDAlertButtonViewController setCompletionHandler:](v11, "setCompletionHandler:", &v14);
  objc_msgSend(v12, "setEnabled:", 0, v14, v15, v16, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __48__MCDAlertAction_actionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "actionHandler"));

  if (v1)
  {
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "actionHandler"));
    ((void (**)(_QWORD, id))v2)[2](v2, WeakRetained);

  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
