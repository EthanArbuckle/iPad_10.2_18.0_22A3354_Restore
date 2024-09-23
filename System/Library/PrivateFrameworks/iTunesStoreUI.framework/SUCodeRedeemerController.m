@implementation SUCodeRedeemerController

- (SUCodeRedeemerController)init
{
  SUCodeRedeemerController *v2;
  SUCodeRedeemerController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCodeRedeemerController;
  v2 = -[SUCodeRedeemerController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUCodeRedeemerController _setup](v2, "_setup");
  return v3;
}

- (void)cancel
{
  id v2;

  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

+ (BOOL)cameraSupported
{
  return objc_msgSend(MEMORY[0x24BE27E58], "isCRCodeRedeemerAvailable") != 0;
}

- (void)recognitionError
{
  void *v2;
  id v3;

  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMessage:color:style:duration:", 0, v2, 3, 60.0);

}

- (void)recognitionSuccess
{
  void *v2;
  id v3;

  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMessage:color:style:duration:", 0, v2, 2, 60.0);

}

- (void)startSession
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSession");

  -[SUCodeRedeemerController _enableBlur](self, "_enableBlur");
  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 500000000);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUCodeRedeemerController_startSession__block_invoke;
  v5[3] = &unk_24DE7B5C8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__SUCodeRedeemerController_startSession__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disableBlur");

}

- (void)toggleCameraWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  SUCodeRedeemerController *v13;
  id v14;

  v4 = a3;
  -[SUCodeRedeemerController _enableBlur](self, "_enableBlur");
  if (-[SUCodeRedeemerController cameraflipDirection](self, "cameraflipDirection"))
    v5 = 0x100000;
  else
    v5 = 0x200000;
  v6 = (void *)MEMORY[0x24BDF6F90];
  -[SUCodeRedeemerController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __55__SUCodeRedeemerController_toggleCameraWithCompletion___block_invoke;
  v12 = &unk_24DE7D1D0;
  v13 = self;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, v5, 0, &v9, 0.3);

  -[SUCodeRedeemerController setCameraflipDirection:](self, "setCameraflipDirection:", -[SUCodeRedeemerController cameraflipDirection](self, "cameraflipDirection", v9, v10, v11, v12, v13) ^ 1);
}

uint64_t __55__SUCodeRedeemerController_toggleCameraWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "codeRedeemerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleCamera");

  objc_msgSend(*(id *)(a1 + 32), "_disableBlur");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setup
{
  -[SUCodeRedeemerController _setupCodeRedeemerController](self, "_setupCodeRedeemerController");
  -[SUCodeRedeemerController _setupFlipVisualEffectView](self, "_setupFlipVisualEffectView");
}

- (void)_setupCodeRedeemerController
{
  id v3;
  CRCodeRedeemerController *codeRedeemerController;

  v3 = objc_alloc_init(MEMORY[0x24BE27E58]);
  objc_msgSend(v3, "setDelegate:", self);
  codeRedeemerController = self->_codeRedeemerController;
  self->_codeRedeemerController = (CRCodeRedeemerController *)v3;

}

- (void)_setupFlipVisualEffectView
{
  UIVisualEffectView *v3;
  void *v4;
  UIVisualEffectView *visualEffectView;

  v3 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x24BDF6FC8]);
  -[UIVisualEffectView setHidden:](v3, "setHidden:", 1);
  -[SUCodeRedeemerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v3;

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUCodeRedeemerController;
  -[SUCodeRedeemerController viewDidLoad](&v4, sel_viewDidLoad);
  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCodeRedeemerController _setChildViewController:](self, "_setChildViewController:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUCodeRedeemerController;
  -[SUCodeRedeemerController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[SUCodeRedeemerController visualEffectView](self, "visualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCodeRedeemerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[SUCodeRedeemerController codeRedeemerController](self, "codeRedeemerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCodeRedeemerController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *MEMORY[0x24BE27E08];
  v6 = a4;
  objc_msgSend(v6, "valueForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BE27E10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCodeRedeemerController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codeRedeemerControllerDidEndWithCode:error:", v9, v7);

}

- (void)codeRedeemerControllerDidCancel:(id)a3
{
  id v3;

  -[SUCodeRedeemerController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "codeRedeemerControllerDidCancel");

}

- (void)_disableBlur
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SUCodeRedeemerController__disableBlur__block_invoke;
  v6[3] = &unk_24DE7B5C8;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __40__SUCodeRedeemerController__disableBlur__block_invoke_2;
  v4[3] = &unk_24DE7D1F8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v4, 0.3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __40__SUCodeRedeemerController__disableBlur__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visualEffectView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEffect:", 0);

}

void __40__SUCodeRedeemerController__disableBlur__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visualEffectView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)_enableBlur
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCodeRedeemerController visualEffectView](self, "visualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v5);

  -[SUCodeRedeemerController visualEffectView](self, "visualEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)_setChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "willMoveToParentViewController:", self);
  -[SUCodeRedeemerController addChildViewController:](self, "addChildViewController:", v8);
  -[SUCodeRedeemerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[SUCodeRedeemerController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendSubviewToBack:", v7);

  objc_msgSend(v8, "didMoveToParentViewController:", self);
}

- (SUCodeRedeemerControllerDelegate)delegate
{
  return (SUCodeRedeemerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)cameraflipDirection
{
  return self->_cameraflipDirection;
}

- (void)setCameraflipDirection:(BOOL)a3
{
  self->_cameraflipDirection = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (CRCodeRedeemerController)codeRedeemerController
{
  return self->_codeRedeemerController;
}

- (void)setCodeRedeemerController:(id)a3
{
  objc_storeStrong((id *)&self->_codeRedeemerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeRedeemerController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
