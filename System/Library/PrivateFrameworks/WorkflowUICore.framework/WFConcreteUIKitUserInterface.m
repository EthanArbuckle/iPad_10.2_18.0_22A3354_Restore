@implementation WFConcreteUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, 0);
  objc_destroyWeak((id *)&self->_presentedAlert);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_view);
}

- (WFConcreteUIKitUserInterface)initWithView:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  WFConcreteUIKitUserInterface *v8;
  WFConcreteUIKitUserInterface *v9;
  WFConcreteUIKitUserInterface *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFConcreteUIKitUserInterface;
  v8 = -[WFConcreteUIKitUserInterface init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_viewController, v7);
    v10 = v9;
  }

  return v9;
}

- (UIView)view
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v6, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIView *)v5;
}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x24BE19950];
}

- (BOOL)isRunningWithSiriUI
{
  return 0;
}

- (BOOL)isRunningWithExternalUI
{
  return 0;
}

- (BOOL)isRunningWithToolKitClient
{
  return 0;
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke;
  v6[3] = &unk_24EF60788;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)presentAlert:(id)a3
{
  id v4;

  v4 = a3;
  +[WFUIKitAlertPresenter presentAlert:withUserInterface:](WFUIKitAlertPresenter, "presentAlert:withUserInterface:", v4, self);
  -[WFConcreteUIKitUserInterface setPresentedAlert:](self, "setPresentedAlert:", v4);

}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;

  objc_msgSend(a3, "siriDialogAlertWithCompletionHandler:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFConcreteUIKitUserInterface presentAlert:](self, "presentAlert:", v5);

}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  WFActionUserInterfaceListener *v11;
  void *v12;
  void *v13;
  WFActionUserInterfaceListener *v14;

  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a4;
  v10 = a3;
  v11 = [WFActionUserInterfaceListener alloc];
  v14 = -[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:](v11, "initWithUserInterfaceType:actionClassName:classNamesByType:", *MEMORY[0x24BE19950], v10, v9);

  if (v14)
  {
    -[WFActionUserInterfaceListener actionInterface](v14, "actionInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[WFConcreteUIKitUserInterface setActionUserInterfaceListener:](self, "setActionUserInterfaceListener:", v14);
    -[WFActionUserInterfaceListener actionInterface](v14, "actionInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
  }

}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  void *v3;
  void *v4;

  -[WFConcreteUIKitUserInterface view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[WFConcreteUIKitUserInterface viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  -[WFConcreteUIKitUserInterface setPresentedViewController:](self, "setPresentedViewController:", v6);
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  -[WFConcreteUIKitUserInterface presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFConcreteUIKitUserInterface presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __87__WFConcreteUIKitUserInterface_dismissPlatterForActionUserInterface_completionHandler___block_invoke;
    v8[3] = &unk_24EF60788;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    v5[2](v5);
  }

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (WFAlert)presentedAlert
{
  return (WFAlert *)objc_loadWeakRetained((id *)&self->_presentedAlert);
}

- (void)setPresentedAlert:(id)a3
{
  objc_storeWeak((id *)&self->_presentedAlert, a3);
}

- (WFActionUserInterfaceListener)actionUserInterfaceListener
{
  return self->_actionUserInterfaceListener;
}

- (void)setActionUserInterfaceListener:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, a3);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

uint64_t __87__WFConcreteUIKitUserInterface_dismissPlatterForActionUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentedViewController:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  _QWORD v15[5];
  NSObject *v16;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "actionUserInterfaceListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    dispatch_group_enter(v2);
    objc_msgSend(*(id *)(a1 + 32), "actionUserInterfaceListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_24EF60738;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v2;
    objc_msgSend(v6, "cancelPresentationWithCompletionHandler:", v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "presentedAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dispatch_group_enter(v2);
    objc_msgSend(*(id *)(a1 + 32), "presentedAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_3;
    v13[3] = &unk_24EF60738;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v2;
    objc_msgSend(v8, "dismissWithCompletionHandler:", v13);
    v9 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 40));
      goto LABEL_8;
    }
    dispatch_group_enter(v2);
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_4;
    v11[3] = &unk_24EF60738;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v2;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v11);
    v9 = v12;
  }

LABEL_8:
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActionUserInterfaceListener:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentedAlert:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentedViewController:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
