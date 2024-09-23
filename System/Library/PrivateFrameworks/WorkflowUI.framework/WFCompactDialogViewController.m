@implementation WFCompactDialogViewController

- (WFCompactDialogViewController)initWithRequest:(id)a3
{
  id v5;
  WFCompactDialogViewController *v6;
  WFCompactDialogViewController *v7;
  WFCompactDialogViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactDialogViewController;
  v6 = -[WFCompactPlatterViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactDialogViewController;
  -[WFCompactPlatterViewController loadView](&v8, sel_loadView);
  -[WFCompactDialogViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttribution:", v5);

  objc_msgSend(v3, "promptForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryText:", v6);

  if (objc_msgSend(v3, "shouldCenterPrompt"))
    v7 = 1;
  else
    v7 = 4;
  objc_msgSend(v4, "setPrimaryTextAlignment:", v7);

}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)configureActionGroupWithActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") > 2)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v7, "if_firstObjectPassingTest:", &__block_literal_global_11025);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "if_firstObjectPassingTest:", &__block_literal_global_112);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactDialogViewController setCancelAction:](self, "setCancelAction:", v5);

    -[WFCompactDialogViewController setActions:](self, "setActions:", v7);
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActions:", v7);

    -[WFCompactDialogViewController setPreferredAction:](self, "setPreferredAction:", v4);
  }
  else
  {
    -[WFCompactDialogViewController setActions:](self, "setActions:", 0);
    -[WFCompactDialogViewController setPreferredAction:](self, "setPreferredAction:", 0);
    -[WFCompactDialogViewController setCancelAction:](self, "setCancelAction:", 0);
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActions:", 0);
  }

}

- (BOOL)canHandleFollowUpRequest:(id)a3
{
  return 0;
}

- (void)handleFollowUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)finishWithResponse:(id)a3
{
  -[WFCompactDialogViewController finishWithResponse:waitForFollowUpRequest:](self, "finishWithResponse:waitForFollowUpRequest:", a3, 0);
}

- (void)finishWithResponse:(id)a3 waitForFollowUpRequest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[WFCompactDialogViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dialogViewController:didFinishWithResponse:waitForFollowUpRequest:", self, v6, v4);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[WFCompactDialogViewController cancelAction](self, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Cancel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, sel_cancelKeyPressed, *MEMORY[0x24BEBE3E0], 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v7);
  }
  -[WFCompactDialogViewController preferredAction](self, "preferredAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFCompactDialogViewController request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasMultilineTextEntry"))
      v10 = 0x100000;
    else
      v10 = 0;

    v11 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Done"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v12, 0, sel_doneKeyPressed, CFSTR("\r"), v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v13);
  }
  return v3;
}

- (void)cancelKeyPressed
{
  void *v3;
  void *v4;
  id v5;

  -[WFCompactDialogViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

  -[WFCompactDialogViewController cancelAction](self, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFCompactDialogViewController cancelAction](self, "cancelAction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invokeHandler");

  }
}

- (void)doneKeyPressed
{
  void *v3;
  void *v4;
  id v5;

  -[WFCompactDialogViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

  -[WFCompactDialogViewController preferredAction](self, "preferredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFCompactDialogViewController preferredAction](self, "preferredAction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invokeHandler");

  }
}

- (void)systemDismissedBanner
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v3);

}

- (WFCompactDialogViewControllerDelegate)delegate
{
  return (WFCompactDialogViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (WFCompactDialogAction)preferredAction
{
  return self->_preferredAction;
}

- (void)setPreferredAction:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAction, a3);
}

- (WFCompactDialogAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __65__WFCompactDialogViewController_configureActionGroupWithActions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dialogButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") == 1;

  return v3;
}

BOOL __65__WFCompactDialogViewController_configureActionGroupWithActions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dialogButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") == 0;

  return v3;
}

@end
