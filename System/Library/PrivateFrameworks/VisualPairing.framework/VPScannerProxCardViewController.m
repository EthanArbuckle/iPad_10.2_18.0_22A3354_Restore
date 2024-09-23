@implementation VPScannerProxCardViewController

- (void)viewDidLoad
{
  VPScannerView *v3;
  VPScannerView *scannerView;
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
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v25.receiver = self;
  v25.super_class = (Class)VPScannerProxCardViewController;
  -[VPScannerProxCardViewController viewDidLoad](&v25, sel_viewDidLoad);
  v3 = -[VPScannerView initAsProxCard]([VPScannerView alloc], "initAsProxCard");
  scannerView = self->_scannerView;
  self->_scannerView = v3;

  -[VPScannerProxCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[VPScannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_scannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VPScannerProxCardViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_scannerView);

  v17 = (void *)MEMORY[0x24BDD1628];
  -[VPScannerView topAnchor](self->_scannerView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerProxCardViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[VPScannerView bottomAnchor](self->_scannerView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerProxCardViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  -[VPScannerView leftAnchor](self->_scannerView, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerProxCardViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  -[VPScannerView rightAnchor](self->_scannerView, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerProxCardViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v14);

  -[VPScannerView setNeedsLayout](self->_scannerView, "setNeedsLayout");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)start
{
  _QWORD v3[5];

  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__VPScannerProxCardViewController_start__block_invoke;
  v3[3] = &unk_24E04D018;
  v3[4] = self;
  -[VPScannerView setScannedCodeHandler:](self->_scannerView, "setScannedCodeHandler:", v3);
  -[VPScannerView start](self->_scannerView, "start");
}

uint64_t __40__VPScannerProxCardViewController_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stop
{
  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[VPScannerView setScannedCodeHandler:](self->_scannerView, "setScannedCodeHandler:", 0);
  -[VPScannerView stop](self->_scannerView, "stop");
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (VPScannerView)scannerView
{
  return self->_scannerView;
}

- (void)setScannerView:(id)a3
{
  objc_storeStrong((id *)&self->_scannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
}

@end
