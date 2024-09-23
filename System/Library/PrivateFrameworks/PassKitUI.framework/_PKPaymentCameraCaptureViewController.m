@implementation _PKPaymentCameraCaptureViewController

- (_PKPaymentCameraCaptureViewController)init
{
  _PKPaymentCameraCaptureViewController *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_PKPaymentCameraCaptureViewController;
  v2 = -[CRCameraReader init](&v6, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x1E0D182C0];
    v7[0] = *MEMORY[0x1E0D182B8];
    v7[1] = v3;
    v7[2] = *MEMORY[0x1E0D182C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setOutputObjectTypes:](v2, "setOutputObjectTypes:", v4);

    -[CRCameraReader setDelegate:](v2, "setDelegate:", v2);
    -[CRCameraReader setHidePlacementText:](v2, "setHidePlacementText:", 1);
    v2->_showTypeCardNumberButton = 1;
  }
  return v2;
}

- (_PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v7;
  _PKPaymentCameraCaptureViewController *v8;
  _PKPaymentCameraCaptureViewController *v9;

  v7 = a3;
  v8 = -[_PKPaymentCameraCaptureViewController init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v9->_context = a4;
  }

  return v9;
}

- (void)configureForModalPresentation
{
  void *v3;
  id v4;

  self->_hideSetupLaterButton = 1;
  self->_showTapToProvisionButton = 0;
  self->_showTypeCardNumberButton = 0;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelButtonPressed);
  -[_PKPaymentCameraCaptureViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

}

- (void)loadView
{
  UIView *v3;
  UIView *cameraView;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int IsSetupAssistant;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  PKTableHeaderView *v15;
  PKTableHeaderView *headerView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  PKPaymentSetupDockView *v27;
  PKPaymentSetupDockView *dockView;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)_PKPaymentCameraCaptureViewController;
  -[CRCameraReader loadView](&v38, sel_loadView);
  -[_PKPaymentCameraCaptureViewController view](self, "view");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  cameraView = self->_cameraView;
  self->_cameraView = v3;

  -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_cameraView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKPaymentCameraCaptureViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  else
    IsSetupAssistant = 0;
  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  objc_msgSend(v14, "setBackgroundColor:", v5);
  objc_msgSend(v14, "addSubview:", self->_cameraView);
  -[_PKPaymentCameraCaptureViewController setView:](self, "setView:", v14);
  v15 = -[PKTableHeaderView initWithFrame:]([PKTableHeaderView alloc], "initWithFrame:", v10, v11, v12, v13);
  headerView = self->_headerView;
  self->_headerView = v15;

  -[PKTableHeaderView setBackgroundColor:](self->_headerView, "setBackgroundColor:", v5);
  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ADD_CARD"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "targetDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceRegion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (PKDeviceRegionSupportsDebit())
    v22 = CFSTR("POSITION_CARD");
  else
    v22 = CFSTR("POSITION_CARD_NO_DEBIT");
  PKLocalizedPaymentString(&v22->isa);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  -[PKTableHeaderView setStyle:](self->_headerView, "setStyle:", IsSetupAssistant);
  objc_msgSend(v14, "addSubview:", self->_headerView);
  v25 = 10.0;
  if (IsSetupAssistant)
  {
    v25 = 20.0;
    v26 = 19.0;
  }
  else
  {
    v26 = 9.0;
  }
  -[PKTableHeaderView setTopPadding:](self->_headerView, "setTopPadding:", v25);
  -[PKTableHeaderView setBottomPadding:](self->_headerView, "setBottomPadding:", v26);
  v27 = objc_alloc_init(PKPaymentSetupDockView);
  dockView = self->_dockView;
  self->_dockView = v27;

  -[PKPaymentSetupDockView setBackgroundColor:](self->_dockView, "setBackgroundColor:", v5);
  -[PKPaymentSetupDockView footerView](self->_dockView, "footerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSetupLaterButton:", 0);
  objc_msgSend(v29, "setManualEntryButton:", 0);
  objc_msgSend(v29, "setSkipCardButton:", 0);
  objc_msgSend(v14, "addSubview:", self->_dockView);
  if (self->_showTypeCardNumberButton)
  {
    -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEnabled:", 1);
    objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel__manualEntryButtonPressed_, 0x2000);
    PKLocalizedPaymentString(CFSTR("ENTER_CARD_DETAILS"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTitle:forState:", v31, 0);

  }
  v32 = (_QWORD *)MEMORY[0x1E0D67FE0];
  if (!self->_hideSetupLaterButton)
  {
    objc_msgSend(v29, "secondaryActionButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTitle:forState:", v34, 0);
    objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__setupLater_, 0x2000);
    objc_msgSend(v33, "setAccessibilityIdentifier:", *v32);

  }
  if (self->_showTapToProvisionButton)
  {
    objc_msgSend(v29, "secondaryActionButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CAMERA_CAPTURE_TAP_TO_PROVISION_PROMPT"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTitle:forState:", v36, 0);
    objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel__tapToProvisionButtonPressed_, 0x2000);
    objc_msgSend(v35, "setAccessibilityIdentifier:", *v32);

  }
  -[_PKPaymentCameraCaptureViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E40]);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t context;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PKPaymentCameraCaptureViewController;
  -[_PKPaymentCameraCaptureViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[_PKPaymentCameraCaptureViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("BACK_BUTTON_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, 0, 0);

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  objc_msgSend(v3, "setBackBarButtonItem:", v6);
  objc_msgSend(v3, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);
  context = self->_context;
  -[_PKPaymentCameraCaptureViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(context, v8);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v18;
  CGRect slice;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)_PKPaymentCameraCaptureViewController;
  -[CRCameraReader viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  -[_PKPaymentCameraCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v9, v11);
  v17 = v16;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v15, CGRectMaxYEdge);
  CGRectDivide(v18, &slice, &v18, v17, CGRectMaxYEdge);
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v9, v11);
  v22 = v18;
  CGRectDivide(v18, &slice, &v18, fmin(fmax(v18.size.height - v22.origin.y, 200.0), v13 + 281.0), CGRectMinYEdge);
  -[UIView setFrame:](self->_cameraView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UIView setNeedsLayout](self->_cameraView, "setNeedsLayout");
  -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PKPaymentCameraCaptureViewController;
  -[CRCameraReader viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CRCameraReader start](self, "start");
  self->_cameraCaptureStartTime = mach_absolute_time();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PKPaymentCameraCaptureViewController;
  -[_PKPaymentCameraCaptureViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___PKPaymentCameraCaptureViewController_cameraReader_didFailWithError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)cameraReaderDidEnd:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___PKPaymentCameraCaptureViewController_cameraReaderDidEnd___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___PKPaymentCameraCaptureViewController_cameraReader_didRecognizeObjects___block_invoke;
  block[3] = &unk_1E3E61388;
  block[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a3;
  -[_PKPaymentCameraCaptureViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowSpinner:", v4);

  -[PKPaymentSetupDockView setButtonsEnabled:](self->_dockView, "setButtonsEnabled:", v4 ^ 1);
}

- (void)_manualEntryButtonPressed:(id)a3
{
  id WeakRetained;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "cameraCaptureViewControllerDidSelectManualEntry:", self);

}

- (void)_setupLater:(id)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKPaymentCameraCaptureViewController description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);

  }
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "cameraCaptureViewControllerDidSelectSetupLater:", self);

}

- (void)_tapToProvisionButtonPressed:(id)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKPaymentCameraCaptureViewController description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);

  }
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "cameraCaptureViewControllerDidSelectTapToProvision:", self);

}

- (void)_cancelButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "cameraCaptureViewControllerDidSelectSetupLater:", self);

}

- (BOOL)showTapToProvisionButton
{
  return self->_showTapToProvisionButton;
}

- (void)setShowTapToProvisionButton:(BOOL)a3
{
  self->_showTapToProvisionButton = a3;
}

- (BOOL)showTypeCardNumberButton
{
  return self->_showTypeCardNumberButton;
}

- (void)setShowTypeCardNumberButton:(BOOL)a3
{
  self->_showTypeCardNumberButton = a3;
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate
{
  return (PKPaymentCameraCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_outputObjects, 0);
}

@end
