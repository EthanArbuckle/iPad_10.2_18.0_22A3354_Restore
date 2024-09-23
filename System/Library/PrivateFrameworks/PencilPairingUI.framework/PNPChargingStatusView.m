@implementation PNPChargingStatusView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  UILabel *deviceNameLabel;
  void *v13;
  uint64_t v14;
  UILabel *percentageLabel;
  void *v16;
  PNPConnectButton *tapToConnectButton;
  void *v18;
  _UIBatteryView *batteryView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIActivityIndicatorView *spinnerView;
  double v25;
  double v26;
  UILabel *v27;
  UIView *v28;
  PNPConnectButton *v29;
  UIView *batterySectionView;
  __int128 v31;
  PNPConnectButton *v32;
  __int128 v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[3];
  _OWORD v41[2];
  __int128 v42;
  _OWORD v43[3];
  CGAffineTransform v44;
  _OWORD v45[3];
  CGAffineTransform v46;
  _OWORD v47[3];
  CGAffineTransform v48;
  CGAffineTransform v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)PNPChargingStatusView;
  -[PNPChargingStatusView layoutSubviews](&v50, sel_layoutSubviews);
  -[PNPChargingStatusView deviceState](self, "deviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryLevel");
  v5 = v4;
  v6 = v4 * 100.0;
  v7 = vcvtmd_s64_f64(v6);
  v8 = (double)(uint64_t)floor(v6);
  -[UILabel text](self->_deviceNameLabel, "text");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = (void *)v9, v11 = objc_msgSend(v3, "deviceType"), v10, v11))
  {
    deviceNameLabel = self->_deviceNameLabel;
    objc_msgSend(v3, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](deviceNameLabel, "setText:", v13);

  }
  v14 = 1;
  -[UILabel setTextAlignment:](self->_deviceNameLabel, "setTextAlignment:", 1);
  percentageLabel = self->_percentageLabel;
  if (v7 < 21)
    v14 = 2;
  objc_msgSend(MEMORY[0x24BDF6950], "batteryTextColorLowPower:", v7 < 21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](percentageLabel, "setTextColor:", v16);

  tapToConnectButton = self->_tapToConnectButton;
  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPConnectButton setTitleColor:forState:](tapToConnectButton, "setTitleColor:forState:", v18, 0);

  -[_UIBatteryView setChargingState:](self->_batteryView, "setChargingState:", objc_msgSend(v3, "isCharging"));
  -[_UIBatteryView setChargePercent:](self->_batteryView, "setChargePercent:", v5);
  -[_UIBatteryView setLowBatteryMode:](self->_batteryView, "setLowBatteryMode:", v14);
  batteryView = self->_batteryView;
  objc_msgSend(MEMORY[0x24BDF6950], "batteryBodyColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setBodyColor:](batteryView, "setBodyColor:", v20);

  v21 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 / 100.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringFromNumber:numberStyle:", v22, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_percentageLabel, "setText:", v23);
  -[UILabel setTextAlignment:](self->_percentageLabel, "setTextAlignment:", 1);
  if (self->_alphaOutName)
  {
    spinnerView = self->_spinnerView;
LABEL_8:
    v25 = 0.0;
LABEL_9:
    -[UIActivityIndicatorView setAlpha:](spinnerView, "setAlpha:", v25);
    goto LABEL_10;
  }
  if (-[PNPChargingStatusView _showBatteryStatus](self, "_showBatteryStatus"))
  {
    spinnerView = self->_spinnerView;
    if (self->_isTransitioningToBatteryUI)
      goto LABEL_8;
    -[UIActivityIndicatorView stopAnimating](spinnerView, "stopAnimating");
  }
  else if (-[PNPChargingStatusView chargingState](self, "chargingState") == 1)
  {
    spinnerView = self->_spinnerView;
    v25 = 1.0;
    goto LABEL_9;
  }
LABEL_10:
  memset(&v49, 0, sizeof(v49));
  CGAffineTransformMakeScale(&v49, 0.8, 0.8);
  switch(self->_chargingState)
  {
    case 1:
      v26 = 0.6;
      if (self->_isFadingOutDeviceName)
        v26 = 1.0;
      -[UILabel setAlpha:](self->_deviceNameLabel, "setAlpha:", v26);
      goto LABEL_14;
    case 2:
      -[UILabel setAlpha:](self->_deviceNameLabel, "setAlpha:", 1.0);
      -[UIView setAlpha:](self->_batterySectionView, "setAlpha:", 1.0);
      -[PNPConnectButton setAlpha:](self->_tapToConnectButton, "setAlpha:", 0.0);
      v48 = v49;
      -[UILabel setTransform:](self->_deviceNameLabel, "setTransform:", &v48);
      batterySectionView = self->_batterySectionView;
      v31 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v47[0] = *MEMORY[0x24BDBD8B8];
      v47[1] = v31;
      v47[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      -[UIView setTransform:](batterySectionView, "setTransform:", v47);
      goto LABEL_23;
    case 3:
      v44 = v49;
      -[UILabel setTransform:](self->_deviceNameLabel, "setTransform:", &v44);
      v32 = self->_tapToConnectButton;
      v33 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v43[0] = *MEMORY[0x24BDBD8B8];
      v43[1] = v33;
      v43[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v34 = v43;
      goto LABEL_21;
    case 4:
      v46 = v49;
      -[UILabel setTransform:](self->_deviceNameLabel, "setTransform:", &v46);
      v32 = self->_tapToConnectButton;
      v35 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v45[0] = *MEMORY[0x24BDBD8B8];
      v45[1] = v35;
      v45[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v34 = v45;
LABEL_21:
      -[PNPConnectButton setTransform:](v32, "setTransform:", v34);
      -[UILabel setAlpha:](self->_deviceNameLabel, "setAlpha:", 1.0);
      -[PNPConnectButton setAlpha:](self->_tapToConnectButton, "setAlpha:", 1.0);
      v29 = (PNPConnectButton *)self->_batterySectionView;
      break;
    default:
LABEL_14:
      v27 = self->_deviceNameLabel;
      v38 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v41[0] = *MEMORY[0x24BDBD8B8];
      v41[1] = v38;
      v42 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      -[UILabel setTransform:](v27, "setTransform:", v41, v42, v41[0], v38);
      v28 = self->_batterySectionView;
      v40[0] = v37;
      v40[1] = v39;
      v40[2] = v36;
      -[UIView setTransform:](v28, "setTransform:", v40);
      -[UIView setAlpha:](self->_batterySectionView, "setAlpha:", 0.0);
      v29 = self->_tapToConnectButton;
      break;
  }
  -[PNPConnectButton setAlpha:](v29, "setAlpha:", 0.0);
LABEL_23:

}

- (void)_performAnimations:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDF6F90];
  v11 = v6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__PNPChargingStatusView__performAnimations_completion___block_invoke;
  v12[3] = &unk_24F4E5188;
  v13 = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__PNPChargingStatusView__performAnimations_completion___block_invoke_2;
  v10[3] = &unk_24F4E5240;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v12, v10, 0.6, 0.0, 0.7, 0.0);

}

uint64_t __55__PNPChargingStatusView__performAnimations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__PNPChargingStatusView__performAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_showBatteryStatus
{
  void *v3;
  BOOL v4;

  -[PNPChargingStatusView deviceState](self, "deviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "batteryLevelUnknown") & 1) == 0
    && -[PNPChargingStatusView showsCharging](self, "showsCharging")
    && -[PNPChargingStatusView chargingState](self, "chargingState") == 2;

  return v4;
}

- (void)updateChargingState:(int64_t)a3
{
  int64_t chargingState;
  void *v5;
  void *v6;
  PNPConnectButton *tapToConnectButton;
  void *v8;
  void *v9;
  id v10;

  chargingState = self->_chargingState;
  if (!a3 && chargingState == 4)
  {
    self->_chargingState = 0;
LABEL_4:
    -[PNPChargingStatusView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PNPChargingStatusView setNeedsLayout](self, "setNeedsLayout");
    -[PNPChargingStatusView layoutIfNeeded](self, "layoutIfNeeded");
    return;
  }
  if (a3 != 1 || chargingState)
  {
    switch(a3)
    {
      case 4:
        self->_chargingState = 4;
        break;
      case 3:
        self->_chargingState = 3;
        -[PNPConnectButton setHidden:](self->_tapToConnectButton, "setHidden:", 0);
        tapToConnectButton = self->_tapToConnectButton;
        PencilPairingUIBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INTERNET_CONNECTION_REQUIRED"), &stru_24F4E5CD0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PNPConnectButton setTitle:forState:](tapToConnectButton, "setTitle:forState:", v9, 0);

        -[PNPConnectButton titleLabel](self->_tapToConnectButton, "titleLabel");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

        break;
      case 2:
        -[PNPChargingStatusView layer](self, "layer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeAllAnimations");

        -[UILabel layer](self->_deviceNameLabel, "layer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeAllAnimations");

        self->_chargingState = 2;
        goto LABEL_4;
    }
  }
  else
  {
    -[PNPChargingStatusView _setAndAnimateChargingStateToConnecting](self, "_setAndAnimateChargingStateToConnecting");
  }
}

- (void)_setAndAnimateChargingStateToConnecting
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (self->_alphaOutName)
  {
    self->_chargingState = 1;
    -[UILabel setAlpha:](self->_deviceNameLabel, "setAlpha:", 1.0);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke;
    v4[3] = &unk_24F4E50A0;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 28, v4, 0, 0.8, 0.0);
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke_2;
    v3[3] = &unk_24F4E50A0;
    v3[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "_animateWithDuration:delay:options:animations:start:completion:", 4, v3, 0, 0, 0.8, 0.0);
  }
}

uint64_t __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.6);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  UILabel *deviceNameLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  deviceNameLabel = self->_deviceNameLabel;
  -[UILabel frame](deviceNameLabel, "frame");
  -[UILabel sizeThatFits:](deviceNameLabel, "sizeThatFits:", v4, 1.79769313e308);
  v6 = fmax(self->_maxPillWidth, fmin(fmax(v5 + 60.0, 188.0), 260.0));
  self->_maxPillWidth = v6;
  v7 = 56.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  -[PNPChargingStatusView setNeedsLayout](self, "setNeedsLayout");
  -[PNPChargingStatusView layoutIfNeeded](self, "layoutIfNeeded");
  -[PNPChargingStatusView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setShowsCharging:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__PNPChargingStatusView_setShowsCharging___block_invoke;
  v3[3] = &unk_24F4E5160;
  v3[4] = self;
  v4 = a3;
  -[PNPChargingStatusView _performAnimations:completion:](self, "_performAnimations:completion:", v3, &__block_literal_global_10);
}

uint64_t __42__PNPChargingStatusView_setShowsCharging___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 514) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setIsTransitioningToBatteryUI:(BOOL)a3
{
  self->_isTransitioningToBatteryUI = a3;
  -[PNPChargingStatusView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PNPChargingStatusView setNeedsLayout](self, "setNeedsLayout");
  -[PNPChargingStatusView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)updateConstraints
{
  int *v3;
  int *v4;
  int64_t v5;
  int *v6;
  objc_super v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_deviceNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = &OBJC_IVAR___PNPChargingStatusView__centerDeviceNameConstraint;
  v4 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
  if (-[PNPChargingStatusView chargingState](self, "chargingState"))
  {
    v5 = -[PNPChargingStatusView chargingState](self, "chargingState");
    if (v5 == 1)
      v6 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
    else
      v6 = &OBJC_IVAR___PNPChargingStatusView__centerDeviceNameConstraint;
    if (v5 != 1)
      v3 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
    v4 = v6;
  }
  -[PNPChargingStatusView removeConstraint:](self, "removeConstraint:", *(Class *)((char *)&self->super.super.super.isa + *v4));
  -[PNPChargingStatusView addConstraint:](self, "addConstraint:", *(Class *)((char *)&self->super.super.super.isa + *v3));
  v7.receiver = self;
  v7.super_class = (Class)PNPChargingStatusView;
  -[PNPChargingStatusView updateConstraints](&v7, sel_updateConstraints);
  -[NSLayoutConstraint setConstant:](self->_tapToConnectButtonWidthConstraint, "setConstant:", self->_maxPillWidth * 0.85);
}

- (PNPChargingStatusView)initWithFrame:(CGRect)a3
{
  PNPChargingStatusView *v3;
  UILabel *v4;
  UILabel *deviceNameLabel;
  uint64_t v6;
  _UIBatteryView *batteryView;
  UILabel *v8;
  UILabel *percentageLabel;
  UIView *v10;
  UIView *contentAreaView;
  UIView *v12;
  UIView *batterySectionView;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *spinnerView;
  uint64_t v16;
  PNPConnectButton *tapToConnectButton;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  PNPConnectButton *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSLayoutConstraint *alignDeviceNameToTopConstraint;
  void *v50;
  void *v51;
  uint64_t v52;
  NSLayoutConstraint *centerDeviceNameConstraint;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSLayoutConstraint *tapToConnectButtonWidthConstraint;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  objc_super v96;

  v96.receiver = self;
  v96.super_class = (Class)PNPChargingStatusView;
  v3 = -[PNPChargingStatusView initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_maxPillWidth = 0.0;
  v3->_alphaOutName = 1;
  v3->_didStartBatteryAnimation = 0;
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  deviceNameLabel = v3->_deviceNameLabel;
  v3->_deviceNameLabel = v4;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7038]), "initWithSizeCategory:", 1);
  batteryView = v3->_batteryView;
  v3->_batteryView = (_UIBatteryView *)v6;

  -[_UIBatteryView setShowsInlineChargingIndicator:](v3->_batteryView, "setShowsInlineChargingIndicator:", 1);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  percentageLabel = v3->_percentageLabel;
  v3->_percentageLabel = v8;

  v10 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  contentAreaView = v3->_contentAreaView;
  v3->_contentAreaView = v10;

  v12 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  batterySectionView = v3->_batterySectionView;
  v3->_batterySectionView = v12;

  v14 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x24BDF67D0]);
  spinnerView = v3->_spinnerView;
  v3->_spinnerView = v14;

  -[UIActivityIndicatorView startAnimating](v3->_spinnerView, "startAnimating");
  -[UIActivityIndicatorView setAlpha:](v3->_spinnerView, "setAlpha:", 0.0);
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v3->_spinnerView, "setActivityIndicatorViewStyle:", 2);
  +[PNPConnectButton buttonWithType:](PNPConnectButton, "buttonWithType:", 1);
  v16 = objc_claimAutoreleasedReturnValue();
  tapToConnectButton = v3->_tapToConnectButton;
  v3->_tapToConnectButton = (PNPConnectButton *)v16;

  -[PNPConnectButton addTarget:action:forControlEvents:](v3->_tapToConnectButton, "addTarget:action:forControlEvents:", v3, sel_beginPairing, 64);
  v18 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB5E8]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPConnectButton titleLabel](v3->_tapToConnectButton, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v95);

  PencilPairingUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME"), &stru_24F4E5CD0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v3->_deviceNameLabel, "setText:", v21);

  v22 = v3->_tapToConnectButton;
  PencilPairingUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TAP_TO_CONNECT"), &stru_24F4E5CD0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPConnectButton setTitle:forState:](v22, "setTitle:forState:", v24, 0);

  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BDF76A0]);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77E8], v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v93, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v25, "pointSize");
  objc_msgSend(v26, "systemFontOfSize:weight:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 13.0, v18);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3->_deviceNameLabel, "setFont:", v92);
  -[UILabel setFont:](v3->_percentageLabel, "setFont:", v91);
  -[PNPChargingStatusView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_deviceNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_batteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_percentageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_batterySectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PNPConnectButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_tapToConnectButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PNPChargingStatusView addSubview:](v3, "addSubview:", v3->_spinnerView);
  -[PNPChargingStatusView addSubview:](v3, "addSubview:", v3->_contentAreaView);
  -[PNPChargingStatusView addSubview:](v3, "addSubview:", v3->_batterySectionView);
  -[PNPChargingStatusView addSubview:](v3, "addSubview:", v3->_deviceNameLabel);
  -[PNPChargingStatusView addSubview:](v3, "addSubview:", v3->_tapToConnectButton);
  -[UIView addSubview:](v3->_batterySectionView, "addSubview:", v3->_batteryView);
  -[UIView addSubview:](v3->_batterySectionView, "addSubview:", v3->_percentageLabel);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_contentAreaView, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView leadingAnchor](v3, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 30.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v30);

  -[UIView trailingAnchor](v3->_contentAreaView, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView trailingAnchor](v3, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -30.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v33);

  -[UIView centerYAnchor](v3->_contentAreaView, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView centerYAnchor](v3, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v36);

  -[UIActivityIndicatorView leadingAnchor](v3->_spinnerView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView leadingAnchor](v3, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 15.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v39);

  -[UIActivityIndicatorView trailingAnchor](v3->_spinnerView, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_contentAreaView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -5.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v42);

  -[UIActivityIndicatorView centerYAnchor](v3->_spinnerView, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView centerYAnchor](v3, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v45);

  -[UILabel topAnchor](v3->_deviceNameLabel, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v3->_contentAreaView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = objc_claimAutoreleasedReturnValue();
  alignDeviceNameToTopConstraint = v3->_alignDeviceNameToTopConstraint;
  v3->_alignDeviceNameToTopConstraint = (NSLayoutConstraint *)v48;

  -[UILabel centerYAnchor](v3->_deviceNameLabel, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v3->_contentAreaView, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = objc_claimAutoreleasedReturnValue();
  centerDeviceNameConstraint = v3->_centerDeviceNameConstraint;
  v3->_centerDeviceNameConstraint = (NSLayoutConstraint *)v52;

  objc_msgSend(v27, "addObject:", v3->_alignDeviceNameToTopConstraint);
  -[UILabel leadingAnchor](v3->_deviceNameLabel, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView leadingAnchor](v3, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 30.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v56);

  -[UILabel trailingAnchor](v3->_deviceNameLabel, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView trailingAnchor](v3, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, -30.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v59);

  -[UIView centerXAnchor](v3->_batterySectionView, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v3->_contentAreaView, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v62);

  -[UILabel leadingAnchor](v3->_percentageLabel, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_batterySectionView, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v65);

  -[UILabel lastBaselineAnchor](v3->_percentageLabel, "lastBaselineAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](v3->_deviceNameLabel, "lastBaselineAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 18.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v68);

  -[UILabel bottomAnchor](v3->_percentageLabel, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v3->_contentAreaView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintLessThanOrEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v71);

  -[_UIBatteryView leadingAnchor](v3->_batteryView, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v3->_percentageLabel, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 8.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v74);

  -[_UIBatteryView trailingAnchor](v3->_batteryView, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v3->_batterySectionView, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintLessThanOrEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v77);

  -[_UIBatteryView centerYAnchor](v3->_batteryView, "centerYAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](v3->_percentageLabel, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v80);

  -[PNPConnectButton lastBaselineAnchor](v3->_tapToConnectButton, "lastBaselineAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](v3->_deviceNameLabel, "lastBaselineAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, 18.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v83);

  -[PNPConnectButton centerXAnchor](v3->_tapToConnectButton, "centerXAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPChargingStatusView centerXAnchor](v3, "centerXAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v86);

  -[PNPConnectButton widthAnchor](v3->_tapToConnectButton, "widthAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToConstant:", 180.0);
  v88 = objc_claimAutoreleasedReturnValue();
  tapToConnectButtonWidthConstraint = v3->_tapToConnectButtonWidthConstraint;
  v3->_tapToConnectButtonWidthConstraint = (NSLayoutConstraint *)v88;

  objc_msgSend(v27, "addObject:", v3->_tapToConnectButtonWidthConstraint);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v27);

  return v3;
}

- (void)beginPairing
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didTapOnConnectButton");

}

- (PNPChargingStatusViewDelegate)delegate
{
  return (PNPChargingStatusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsCharging
{
  return self->_showsCharging;
}

- (BOOL)isTransitioningToBatteryUI
{
  return self->_isTransitioningToBatteryUI;
}

- (BOOL)didStartBatteryTransition
{
  return self->_didStartBatteryTransition;
}

- (void)setDidStartBatteryTransition:(BOOL)a3
{
  self->_didStartBatteryTransition = a3;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (void)setChargingState:(int64_t)a3
{
  self->_chargingState = a3;
}

- (BOOL)alphaOutName
{
  return self->_alphaOutName;
}

- (void)setAlphaOutName:(BOOL)a3
{
  self->_alphaOutName = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_tapToConnectButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_centerDeviceNameConstraint, 0);
  objc_storeStrong((id *)&self->_alignDeviceNameToTopConstraint, 0);
  objc_storeStrong((id *)&self->_tapToConnectButton, 0);
  objc_storeStrong((id *)&self->_percentageLabel, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_batterySectionView, 0);
  objc_storeStrong((id *)&self->_contentAreaView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
