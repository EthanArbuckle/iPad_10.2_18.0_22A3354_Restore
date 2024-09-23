@implementation SFAirDropViewController

- (SFAirDropViewController)initWithNoContentView:(BOOL)a3
{
  _BOOL8 v3;
  SFAirDropViewController *v4;
  SFAirDropViewController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v3 = a3;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SFAirDropViewController;
  v4 = -[SFAirDropViewController init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SFAirDropViewController _beginDelayingPresentation:cancellationHandler:](v4, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
    objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.Sharing.AirDrop"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController setExtension:](v5, "setExtension:", v6);
    location = 0;
    objc_initWeak(&location, v5);
    v7 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke;
    v18[3] = &unk_24CE0F6C8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v6, "setRequestCancellationBlock:", v18);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_3;
    v16[3] = &unk_24CE0F6F0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "setRequestInterruptionBlock:", v16);
    v8 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v9 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, CFSTR("ShowNoContentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v11);

    v22[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_5;
    v14[3] = &unk_24CE0F718;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_2;
  block[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SFAirDropViewController_initWithNoContentView___block_invoke_4;
  block[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __49__SFAirDropViewController_initWithNoContentView___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  a1 += 4;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_setChildViewController:", v10);

  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "_setExtensionRequest:", v5);

  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v10, "setAirDropHost:", v8);

  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "_endDelayingPresentation");

}

- (void)dealloc
{
  objc_super v3;

  if (self->_extensionRequest)
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropViewController;
  -[SFAirDropViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFAirDropViewController;
  -[SFAirDropViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)_setExtensionRequest:(id)a3
{
  objc_storeStrong(&self->_extensionRequest, a3);
}

- (void)_setChildViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  -[_SFAirDropRemoteViewController view](self->_childViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[_SFAirDropRemoteViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    objc_msgSend(v30, "willMoveToParentViewController:", self);
    objc_msgSend(v30, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "setFrame:");

    -[SFAirDropViewController addChildViewController:](self, "addChildViewController:", v30);
    -[SFAirDropViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    objc_msgSend(v30, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    objc_msgSend(v30, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v24);

    objc_msgSend(v30, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v29);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v9);
    objc_msgSend(v30, "didMoveToParentViewController:", self);

  }
}

- (void)airDropViewServiceDidRequestDismissal
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__SFAirDropViewController_airDropViewServiceDidRequestDismissal__block_invoke;
  v2[3] = &unk_24CE0ED80;
  v2[4] = self;
  -[SFAirDropViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __64__SFAirDropViewController_airDropViewServiceDidRequestDismissal__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airDropViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFAirDropViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airDropViewServiceWillStartTransfer:toRecipient:", self, v4);

}

- (void)airDropViewServiceDidStartTransfer
{
  id v3;

  -[SFAirDropViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airDropViewControllerDidStartTransfer:", self);

}

- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SFAirDropViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airDropViewController:didFinishTransferWithSuccess:", self, v3);

}

- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFAirDropViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "airDropViewController:requestSharedItemsWithDataRequest:completionHandler:", self, v7, v6);

}

- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFAirDropViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airDropViewController:requestSendingAppBundleIdentifierWithCompletionHandler:", self, v4);

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_childViewController;
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SFAirDropViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SFAirDropViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airDropViewControllerDidDismiss:", self);

  }
}

- (SFAirDropViewControllerDelegate)delegate
{
  return (SFAirDropViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)retainedActivityViewController
{
  return self->_retainedActivityViewController;
}

- (void)setRetainedActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_retainedActivityViewController, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_retainedActivityViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
