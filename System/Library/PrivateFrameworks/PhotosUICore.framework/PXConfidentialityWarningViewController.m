@implementation PXConfidentialityWarningViewController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *effectView;
  UILabel *v8;
  UILabel *messageLabel;
  void *v10;
  id v11;
  void (**v12)(void *, const __CFString *, uint64_t);
  UIButton *v13;
  UIButton *confirmButton;
  UIButton *v15;
  UIButton *cancelButton;
  _QWORD v17[5];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXConfidentialityWarningViewController;
  -[PXConfidentialityWarningViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[PXConfidentialityWarningViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIVisualEffectView *)objc_msgSend(v4, "initWithEffect:", v5);
  effectView = self->_effectView;
  self->_effectView = v6;

  objc_msgSend(v3, "addSubview:", self->_effectView);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v10);

  -[UILabel setText:](self->_messageLabel, "setText:", CFSTR("Confidential UI Warning\n\nMake sure that every person around you is appropriately disclosed."));
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "addSubview:", self->_messageLabel);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__PXConfidentialityWarningViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_1E51331F8;
  v17[4] = self;
  v18 = v3;
  v11 = v3;
  v12 = (void (**)(void *, const __CFString *, uint64_t))_Block_copy(v17);
  v12[2](v12, CFSTR("Continue with Confidential UI"), 1);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v13;

  v12[2](v12, CFSTR("Cancel"), 2);
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v15;

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  CGFloat height;
  double (**v16)(void *, void *);
  void *v17;
  double v18;
  void *v19;
  double v20;
  double MaxY;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD aBlock[4];
  CGRect v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v37.receiver = self;
  v37.super_class = (Class)PXConfidentialityWarningViewController;
  -[PXConfidentialityWarningViewController viewWillLayoutSubviews](&v37, sel_viewWillLayoutSubviews);
  -[PXConfidentialityWarningViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v31 = v4;
  v32 = v6;
  v7 = v6;
  v9 = v8;
  v33 = v8;
  v34 = v10;
  v11 = v10;

  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  v39 = CGRectInset(v38, 20.0, 20.0);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXConfidentialityWarningViewController_viewWillLayoutSubviews__block_invoke;
  aBlock[3] = &__block_descriptor_64_e18_d16__0__UIButton_8l;
  v36 = v39;
  v16 = (double (**)(void *, void *))_Block_copy(aBlock);
  -[PXConfidentialityWarningViewController confirmButton](self, "confirmButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16[2](v16, v17);

  -[PXConfidentialityWarningViewController cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16[2](v16, v19);

  if (v18 >= v20)
    v20 = v18;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MaxY = CGRectGetMaxY(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = v20;
  v22 = MaxY - CGRectGetHeight(v41);
  v42.origin.x = x;
  v42.origin.y = v22;
  v42.size.width = width;
  v42.size.height = v20;
  v23 = CGRectGetMinY(v42) + -20.0;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = v20;
  v24 = v23 - CGRectGetHeight(v43);
  v44.origin.x = x;
  v44.origin.y = v24;
  v44.size.width = width;
  v44.size.height = v20;
  v25 = CGRectGetMinY(v44) + -20.0;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v26 = v25 - CGRectGetMinY(v45);
  -[PXConfidentialityWarningViewController effectView](self, "effectView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v31, v32, v33, v34);

  -[PXConfidentialityWarningViewController messageLabel](self, "messageLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", x, y, width, v26);

  -[PXConfidentialityWarningViewController confirmButton](self, "confirmButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", x, v24, width, v20);

  -[PXConfidentialityWarningViewController cancelButton](self, "cancelButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", x, v22, width, v20);

}

- (void)presentAsOverlayInWindowScene:(id)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)overlayWindow;
  if (!overlayWindow)
  {
    v5 = (objc_class *)MEMORY[0x1E0DC3F98];
    v6 = a3;
    v7 = objc_msgSend([v5 alloc], "initWithWindowScene:", v6);

    v8 = (void *)overlayWindow;
    overlayWindow = v7;

    objc_msgSend((id)overlayWindow, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
    v4 = (void *)overlayWindow;
  }
  objc_msgSend(v4, "setRootViewController:", self);
  objc_msgSend((id)overlayWindow, "setHidden:", 0);
  objc_msgSend((id)overlayWindow, "makeKeyAndVisible");
}

- (void)_handleButton:(id)a3
{
  uint64_t v4;
  void (**v5)(_QWORD);
  PXConfidentialityWarningViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "tag") == 2)
  {
    -[PXConfidentialityWarningViewController cancellationHandler](self, "cancellationHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      exit(1);
    v5 = (void (**)(_QWORD))v4;
    -[PXConfidentialityWarningViewController setCancellationHandler:](self, "setCancellationHandler:", 0);
    v5[2](v5);

  }
  objc_msgSend((id)overlayWindow, "rootViewController");
  v6 = (PXConfidentialityWarningViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeKeyAndVisible");

    objc_msgSend((id)overlayWindow, "setHidden:", 1);
    objc_msgSend((id)overlayWindow, "setRootViewController:", 0);
  }
  else
  {
    -[PXConfidentialityWarningViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
}

double __64__PXConfidentialityWarningViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return v2;
}

id __53__PXConfidentialityWarningViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0DC3518];
  v6 = a2;
  objc_msgSend(v5, "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTag:", a3);
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleButton_, 0x2000);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v7);
  return v7;
}

@end
