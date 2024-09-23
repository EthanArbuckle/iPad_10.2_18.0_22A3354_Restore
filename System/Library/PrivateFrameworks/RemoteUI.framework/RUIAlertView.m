@implementation RUIAlertView

+ (void)_enableTestMode
{
  _testMode = 1;
}

- (RUIAlertView)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6;
  RUIAlertView *v7;
  RUIAlertView *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RUIAlertView;
  v7 = -[RUIElement initWithAttributes:parent:](&v12, sel_initWithAttributes_parent_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_buttonIndex = 0;
    objc_msgSend(v6, "objectForKey:", CFSTR("tintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIAlertView setTintColor:](v8, "setTintColor:", v10);

    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[RUIAlertView _dismissAlertController](self, "_dismissAlertController");
  v3.receiver = self;
  v3.super_class = (Class)RUIAlertView;
  -[RUIElement dealloc](&v3, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)a3;
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", v4);
  title = self->_title;
  self->_title = v4;

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;

  v4 = (NSString *)a3;
  -[UIAlertController setMessage:](self->_alertController, "setMessage:", v4);
  message = self->_message;
  self->_message = v4;

}

- (void)setTintColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *tintColor;

  v4 = (UIColor *)a3;
  -[UIAlertController view](self->_alertController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  tintColor = self->_tintColor;
  self->_tintColor = v4;

}

- (void)addButtonWithTitle:(id)a3 URL:(id)a4 style:(int64_t)a5 attributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  int64_t buttonIndex;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5 == 1)
  {
    buttonIndex = -1;
  }
  else
  {
    buttonIndex = self->_buttonIndex;
    self->_buttonIndex = buttonIndex + 1;
  }
  objc_initWeak(&location, self);
  -[RUIAlertView alertController](self, "alertController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBD3A8];
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __56__RUIAlertView_addButtonWithTitle_URL_style_attributes___block_invoke;
  v29 = &unk_24C2981C8;
  objc_copyWeak(v31, &location);
  v31[1] = (id)buttonIndex;
  v16 = v12;
  v30 = v16;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v10, a5, &v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17, v26, v27, v28, v29);

  -[RUIElement attributes](self, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("preferredButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if (v21)
  {
    -[RUIAlertView alertController](self, "alertController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIAlertView alertController](self, "alertController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPreferredAction:", v25);

  }
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

void __56__RUIAlertView_addButtonWithTitle_URL_style_attributes___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  RUIAlertButton *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained(WeakRetained + 10);
    objc_msgSend(WeakRetained, "completion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(WeakRetained, "completion");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(_QWORD *)(a1 + 48));

    }
    objc_msgSend(WeakRetained, "_dismissAlertController");
    v5 = -[RUIElement initWithAttributes:parent:]([RUIAlertButton alloc], "initWithAttributes:parent:", *(_QWORD *)(a1 + 32), WeakRetained);
    objc_msgSend(v2, "alertView:pressedButton:completion:", WeakRetained, v5, 0);

  }
}

- (id)alertController
{
  UIAlertController *alertController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UIAlertController *v16;
  UIAlertController *v17;
  void *v18;
  void *v19;

  alertController = self->_alertController;
  if (!alertController)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "horizontalSizeClass");
    if (v7)
      v9 = v8 == 1;
    else
      v9 = 1;
    if (v9)
    {
      -[RUIElement attributes](self, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("style"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("sheet")) ^ 1;

    }
    else
    {
      v12 = 1;
    }
    v13 = (void *)MEMORY[0x24BEBD3B0];
    -[RUIAlertView title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIAlertView message](self, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v15, v12);
    v16 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    v17 = self->_alertController;
    self->_alertController = v16;

    -[RUIAlertView tintColor](self, "tintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController view](self->_alertController, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v18);

    alertController = self->_alertController;
  }
  return alertController;
}

- (void)_dismissAlertController
{
  id WeakRetained;
  UIAlertController *v4;
  id v5;
  UIAlertController *v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  UIAlertController *v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);
  v4 = self->_alertController;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __39__RUIAlertView__dismissAlertController__block_invoke;
  v11 = &unk_24C2979C0;
  v12 = v4;
  v5 = WeakRetained;
  v13 = v5;
  v6 = v4;
  v7 = (void (**)(_QWORD))_Block_copy(&v8);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v8, v9, v10, v11))
    v7[2](v7);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __39__RUIAlertView__dismissAlertController__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "ruiDidDismissAlertController:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)runAlertInController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id WeakRetained;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  v8 = WeakRetained;
  objc_msgSend(v8, "delegate");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__RUIAlertView_runAlertInController_completion___block_invoke;
  v13[3] = &unk_24C2981F0;
  v9 = v7;
  v14 = v9;
  v15 = v19;
  v16 = v17;
  -[RUIAlertView setCompletion:](self, "setCompletion:", v13);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2545FEF40))
  {
    v10 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[RUIAlertView alertController](self, "alertController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ruiPresentAlertController:", v11);

    }
    objc_storeWeak((id *)&self->_presentationContext, v10);
  }
  else
  {
    -[RUIAlertView alertController](self, "alertController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_storeWeak((id *)&self->_presentationContext, 0);
    -[RUIAlertView alertController](self, "alertController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v10, (_testMode & 1) == 0, 0);
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void __48__RUIAlertView_runAlertInController_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (RUIAlertViewDelegate)objectModel
{
  return (RUIAlertViewDelegate *)objc_loadWeakRetained((id *)&self->_objectModel);
}

- (void)setObjectModel:(id)a3
{
  objc_storeWeak((id *)&self->_objectModel, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_destroyWeak((id *)&self->_presentationContext);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
