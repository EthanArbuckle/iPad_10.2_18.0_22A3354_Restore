@implementation PRXAction

- (PRXAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  PRXAction *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  id handler;
  PRXAction *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PRXAction;
  v10 = -[PRXAction init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v10->_style = a4;
    v13 = MEMORY[0x212BDE34C](v9);
    handler = v10->_handler;
    v10->_handler = (id)v13;

    v10->_enabled = 1;
    v15 = v10;
  }

  return v10;
}

+ (PRXAction)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:style:handler:", v9, a4, v8);

  return (PRXAction *)v10;
}

- (void)_callHandler
{
  UIButton **p_button;
  id WeakRetained;
  char isKindOfClass;
  id v6;
  void (**handler)(id, PRXAction *);

  p_button = &self->_button;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v6, "toggleActive");

  }
  handler = (void (**)(id, PRXAction *))self->_handler;
  if (handler)
    handler[2](handler, self);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(WeakRetained, "setEnabled:", v3);

  }
}

- (void)setButton:(id)a3
{
  UIButton **p_button;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  _BOOL8 enabled;
  id v10;
  id obj;

  obj = a3;
  p_button = &self->_button;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, sel__callHandler, 0x2000);

    v7 = objc_storeWeak((id *)&self->_button, obj);
    objc_msgSend(obj, "setTitle:forState:", self->_title, 0);

    v8 = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__callHandler, 0x2000);

    enabled = self->_enabled;
    v10 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v10, "setEnabled:", enabled);

  }
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)usesLegacyStyling
{
  return self->_usesLegacyStyling;
}

- (void)setUsesLegacyStyling:(BOOL)a3
{
  self->_usesLegacyStyling = a3;
}

- (UIButton)button
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_button);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

+ (id)dismissalConfirmationActionForViewController:(id)a3 withTitle:(id)a4 message:(id)a5 confirmButtonTitle:(id)a6 cancelButtonTitle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  location = 0;
  objc_initWeak(&location, v12);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke;
  v23[3] = &unk_24CC31FD8;
  objc_copyWeak(&v28, &location);
  v17 = v13;
  v24 = v17;
  v18 = v14;
  v25 = v18;
  v19 = v15;
  v26 = v19;
  v20 = v16;
  v27 = v20;
  objc_msgSend(a1, "actionWithTitle:style:handler:", &stru_24CC320A8, 0, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v21;
}

void __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDF67E8];
    v7 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke_2;
    v10[3] = &unk_24CC31FB0;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", *(_QWORD *)(a1 + 56), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v9);

    objc_msgSend(v5, "setPreferredAction:", v8);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

    objc_destroyWeak(&v11);
  }

}

void __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (id)defaultDismissalActionForViewController:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__PRXAction_ViewControllerActions__defaultDismissalActionForViewController___block_invoke;
  v7[3] = &unk_24CC31F30;
  objc_copyWeak(&v8, &location);
  objc_msgSend(a1, "actionWithTitle:style:handler:", &stru_24CC320A8, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __76__PRXAction_ViewControllerActions__defaultDismissalActionForViewController___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
