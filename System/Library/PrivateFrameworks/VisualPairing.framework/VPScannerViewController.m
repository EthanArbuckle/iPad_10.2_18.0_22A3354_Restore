@implementation VPScannerViewController

+ (id)instantiateViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.VisualPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6E00], "storyboardWithName:bundle:", CFSTR("VPScanner_iOS"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantiateViewControllerWithIdentifier:", CFSTR("ScannerProx"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)VPScannerViewController;
  -[VPScannerViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 != 1)
  {
    v5 = (void *)MEMORY[0x24BDD1628];
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintLessThanOrEqualToConstant:", 400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v8);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v7.receiver = self;
  v7.super_class = (Class)VPScannerViewController;
  -[VPScannerViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayCornerRadius");
  -[UIView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:");

  if (self->_titleMessage)
    -[UILabel setText:](self->_titleLabel, "setText:");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__VPScannerViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_24E04D018;
  v6[4] = self;
  -[VPScannerView setScannedCodeHandler:](self->_scannerView, "setScannedCodeHandler:", v6);
  -[VPScannerView start](self->_scannerView, "start");
}

uint64_t __42__VPScannerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id eventHandler;
  id scannedCodeHandler;
  objc_super v7;

  v3 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v7.receiver = self;
  v7.super_class = (Class)VPScannerViewController;
  -[VPScannerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  -[VPScannerView setScannedCodeHandler:](self->_scannerView, "setScannedCodeHandler:", 0);
  -[VPScannerView stop](self->_scannerView, "stop");
  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

  scannedCodeHandler = self->_scannedCodeHandler;
  self->_scannedCodeHandler = 0;

}

- (void)handleCancelButton:(id)a3
{
  void (**eventHandler)(id, uint64_t);
  id v5;

  v5 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler)
    eventHandler[2](eventHandler, 1);

}

- (void)handlePairManuallyButton:(id)a3
{
  void (**eventHandler)(id, uint64_t);
  id v5;

  v5 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler)
    eventHandler[2](eventHandler, 2);

}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (NSString)titleMessage
{
  return self->_titleMessage;
}

- (void)setTitleMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)pairManuallyButton
{
  return self->_pairManuallyButton;
}

- (void)setPairManuallyButton:(id)a3
{
  objc_storeStrong((id *)&self->_pairManuallyButton, a3);
}

- (VPScannerView)scannerView
{
  return self->_scannerView;
}

- (void)setScannerView:(id)a3
{
  objc_storeStrong((id *)&self->_scannerView, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)viewfinderView
{
  return self->_viewfinderView;
}

- (void)setViewfinderView:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_storeStrong((id *)&self->_pairManuallyButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_titleMessage, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
