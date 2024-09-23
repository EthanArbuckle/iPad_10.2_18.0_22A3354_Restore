@implementation PNPPairingView

- (void)layoutSubviews
{
  PNPPencilView *pencilView;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double y;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  PNPPencilView *v38;
  __int128 v39;
  PNPPencilView *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  _OWORD v54[3];

  pencilView = self->_pencilView;
  -[PNPPairingView deviceState](self, "deviceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPencilView setDeviceState:](pencilView, "setDeviceState:", v4);

  -[PNPPairingView bounds](self, "bounds");
  v5 = MEMORY[0x24BDBF090];
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[PNPPairingView deviceState](self, "deviceState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingView _intrinsicContentSizeForState:deviceState:](self, "_intrinsicContentSizeForState:deviceState:", 1, v8);
  v10 = v9;
  v12 = v11;

  -[PNPWizardViewController view](self->_wizardViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v7, v10, v12);

  v14 = -[PNPPairingView state](self, "state");
  -[PNPPairingView deviceState](self, "deviceState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == 1 || (v16 = 1.0, -[PNPPairingView showsChargingStatusView](self, "showsChargingStatusView")))
    v16 = 0.0;
  if (v14)
  {
    if (self->_finishedWizardTransition)
    {
      v17 = *(double *)(v5 + 16);
      v18 = *(double *)(v5 + 24);
      v19 = v7;
      v20 = v6;
    }
    else
    {
      -[PNPPairingView _pencilSizeForState:](self, "_pencilSizeForState:", v14);
      v26 = v25;
      v28 = v27;
      x = self->_pencilSpinningRect.origin.x;
      y = self->_pencilSpinningRect.origin.y;
      -[PNPWizardViewController view](self->_wizardViewController, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPPairingView convertRect:fromView:](self, "convertRect:fromView:", v31, x, y, v26, v28);
      v20 = v32;
      v19 = v33;
      v17 = v34;
      v18 = v35;

    }
  }
  else
  {
    -[PNPPairingView _pencilSizeForState:](self, "_pencilSizeForState:", 0);
    UIRectCenteredIntegralRect();
    v20 = v21;
    v19 = v22;
    v17 = v23;
    v18 = v24;
    self->_pencilSpinningRect.origin.x = v21;
    self->_pencilSpinningRect.origin.y = v22;
    self->_pencilSpinningRect.size.width = v23;
    self->_pencilSpinningRect.size.height = v24;
  }
  -[PNPPencilView setSpinning:](self->_pencilView, "setSpinning:", v14 == 0);
  -[PNPPencilView setAlpha:](self->_pencilView, "setAlpha:", v16);
  -[PNPWizardViewController view](self->_wizardViewController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PNPPairingView showsChargingStatusView](self, "showsChargingStatusView"))
    v37 = 0.0;
  else
    v37 = 1.0;
  objc_msgSend(v36, "setAlpha:", v37);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v38 = self->_pencilView;
  v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v54[0] = *MEMORY[0x24BDBD8B8];
  v54[1] = v39;
  v54[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[PNPPencilView setTransform:](v38, "setTransform:", v54);
  -[PNPPencilView setFrame:](self->_pencilView, "setFrame:", v20, v19, v17, v18);
  v40 = self->_pencilView;
  -[PNPPairingView _pencilTransformForState:deviceState:](self, "_pencilTransformForState:deviceState:", v14, v15);
  -[PNPPencilView setTransform:](v40, "setTransform:", &v53);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[PNPPairingView chargingStatusView](self, "chargingStatusView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PNPPairingView showsChargingStatusView](self, "showsChargingStatusView"))
    v42 = 1.0;
  else
    v42 = 0.0;
  objc_msgSend(v41, "setAlpha:", v42);

  -[PNPPairingView chargingStatusView](self, "chargingStatusView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "intrinsicContentSize");

  -[PNPPairingView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[PNPPairingView chargingStatusView](self, "chargingStatusView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

}

- (CGSize)_intrinsicContentSizeForState:(unint64_t)a3 deviceState:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  if (a3)
    objc_msgSend((id)objc_opt_class(), "preferredContentSize");
  else
    -[PNPPencilView comfortableContainingSizeForDeviceState:](self->_pencilView, "comfortableContainingSizeForDeviceState:", a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[PNPPairingView showsChargingStatusView](self, "showsChargingStatusView"))
  {
    -[PNPChargingStatusView intrinsicContentSize](self->_chargingStatusView, "intrinsicContentSize");
  }
  else
  {
    v5 = -[PNPPairingView state](self, "state");
    -[PNPPairingView deviceState](self, "deviceState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPPairingView _intrinsicContentSizeForState:deviceState:](self, "_intrinsicContentSizeForState:deviceState:", v5, v6);
    v8 = v7;
    v10 = v9;

    v3 = v8;
    v4 = v10;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_pencilSizeForState:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PNPPencilView *pencilView;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (a3)
  {
    -[PNPWizardViewController view](self->_wizardViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5 + self->_pencilSpinningRect.origin.x * -2.0;
    -[PNPPencilView intrinsicContentSize](self->_pencilView, "intrinsicContentSize");
    v8 = v7 + -20.0;
  }
  else
  {
    pencilView = self->_pencilView;
    v4 = (void *)objc_opt_new();
    -[PNPPencilView intrinsicSizeForDeviceState:](pencilView, "intrinsicSizeForDeviceState:", v4);
    v6 = v10;
    v8 = v11;
  }

  v12 = v6;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGAffineTransform)_pencilTransformForState:(SEL)a3 deviceState:(unint64_t)a4
{
  id v8;
  uint64_t v9;
  __int128 v10;
  PNPPencilView *pencilView;
  CGAffineTransform *result;
  id v13;

  v8 = a5;
  if (a4 == 1 && self->_finishedWizardTransition)
  {
    v9 = MEMORY[0x24BDBD8B8];
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v9 + 32);
  }
  else
  {
    pencilView = self->_pencilView;
    if (pencilView)
    {
      v13 = v8;
      -[PNPPencilView transformForDeviceState:](pencilView, "transformForDeviceState:", v8);
      v8 = v13;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }

  return result;
}

- (void)setDeviceState:(id)a3
{
  id v5;
  PNPPencilView *pencilView;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_deviceState, a3);
  v5 = a3;
  pencilView = self->_pencilView;
  -[PNPPairingView deviceState](self, "deviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPencilView setDeviceState:](pencilView, "setDeviceState:", v7);

  -[PNPWizardViewController deviceStateDidChange](self->_wizardViewController, "deviceStateDidChange");
  -[PNPPairingView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSizeDidChangeForView:", self);

  -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setState:(unint64_t)a3
{
  void *v4;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[PNPPairingView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intrinsicContentSizeDidChangeForView:", self);

    -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowWizardContents:(BOOL)a3
{
  if (self->_showWizardContents != a3)
  {
    self->_showWizardContents = a3;
    -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForTransitionToWizard
{
  -[PNPWizardViewController prepareForPresentation](self->_wizardViewController, "prepareForPresentation");
}

- (void)transitionToWizard
{
  void *v3;

  -[PNPPairingView pencilView](self, "pencilView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[PNPPairingView unhideWizardIfNecessary](self, "unhideWizardIfNecessary");
}

- (void)unhideWizardIfNecessary
{
  void *v3;
  id v4;

  -[PNPWizardViewController view](self->_wizardViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PNPWizardViewController view](self->_wizardViewController, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)wizardTransitionFinished
{
  void *v3;

  self->_finishedWizardTransition = 1;
  -[PNPPairingView pencilView](self, "pencilView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupSpinningResources");

  -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)wizardViewRequestsDismiss:(id)a3
{
  id v4;

  -[PNPPairingView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewRequestsDismiss:", self);

}

- (id)backgroundColorForWizardController:(id)a3
{
  void *v3;
  void *v4;

  -[PNPPairingView superview](self, "superview", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PNPPencilView)pencilView
{
  return self->_pencilView;
}

- (void)setChargingStatusView:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[PNPPairingView chargingStatusView](self, "chargingStatusView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[PNPChargingStatusView removeFromSuperview](self->_chargingStatusView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_chargingStatusView, a3);
    if (self->_chargingStatusView)
    {
      -[PNPPairingView addSubview:](self, "addSubview:");
      -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setShowsChargingStatusView:(BOOL)a3
{
  self->_showsChargingStatusView = a3;
  -[PNPPairingView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPPairingView)initWithFrame:(CGRect)a3
{
  PNPPairingView *v3;
  PNPPencilView *v4;
  PNPPencilView *pencilView;
  PNPWizardViewController *v6;
  PNPWizardViewController *wizardViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PNPPairingView;
  v3 = -[PNPPairingView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = -[PNPPencilView initWithVariant:]([PNPPencilView alloc], "initWithVariant:", 0);
  pencilView = v3->_pencilView;
  v3->_pencilView = v4;

  -[PNPPairingView addSubview:](v3, "addSubview:", v3->_pencilView);
  v6 = -[PNPWizardViewController initWithNibName:bundle:]([PNPWizardViewController alloc], "initWithNibName:bundle:", 0, 0);
  wizardViewController = v3->_wizardViewController;
  v3->_wizardViewController = v6;

  -[PNPWizardViewController setWizardDelegate:](v3->_wizardViewController, "setWizardDelegate:", v3);
  -[PNPWizardViewController view](v3->_wizardViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  -[PNPWizardViewController view](v3->_wizardViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[PNPWizardViewController view](v3->_wizardViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, 176.0, 176.0);

  -[PNPWizardViewController view](v3->_wizardViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingView addSubview:](v3, "addSubview:", v11);

  return v3;
}

- (PNPChargingStatusView)chargingStatusView
{
  return self->_chargingStatusView;
}

- (BOOL)showsChargingStatusView
{
  return self->_showsChargingStatusView;
}

- (unint64_t)state
{
  return self->_state;
}

- (PNPPairingViewDelegate)delegate
{
  return (PNPPairingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showWizardContents
{
  return self->_showWizardContents;
}

- (BOOL)shouldShowWhatsNew
{
  return self->_shouldShowWhatsNew;
}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  self->_shouldShowWhatsNew = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (PNPWizardViewController)wizardViewController
{
  return self->_wizardViewController;
}

- (void)setWizardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wizardViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wizardViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chargingStatusView, 0);
  objc_storeStrong((id *)&self->_pencilView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
