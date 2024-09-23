@implementation TSCellularPlanScanViewController

- (TSCellularPlanScanViewController)initWithBackButton:(BOOL)a3
{
  void *v5;
  TSCellularPlanScanViewController *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanScanViewController;
  v6 = -[TSCellularPlanScanViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("TSCellularPlanScanView"), v5);

  if (v6)
  {
    -[TSCellularPlanScanViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
    v6->_withBackButton = a3;
    v6->_confirmationCodeRequired = 0;
    v6->_manualCardInfoEntry = 0;
    v6->_transferViaQRCode = 0;
    -[TSCellularPlanScanViewController setEntryPoint:](v6, "setEntryPoint:", 0);
  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TSCellularPlanQRCodeScannerView *v8;
  TSCellularPlanQRCodeScannerView *v9;
  TSCellularPlanQRCodeScannerView *scannerView;
  TSCellularPlanQRCodeScannerView *v11;
  void *v12;
  id WeakRetained;
  CAShapeLayer *v14;
  CAShapeLayer *holeOutlineLayer;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  id v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TSCellularPlanScanViewController;
  -[SSUIViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanScanViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanScanViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  if (!self->_scannerView)
  {
    v8 = [TSCellularPlanQRCodeScannerView alloc];
    v9 = -[TSCellularPlanQRCodeScannerView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    scannerView = self->_scannerView;
    self->_scannerView = v9;

    -[TSCellularPlanQRCodeScannerView setDelegate:](self->_scannerView, "setDelegate:", self);
    -[TSCellularPlanQRCodeScannerView setupCameraSession](self->_scannerView, "setupCameraSession");
    v11 = self->_scannerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanQRCodeScannerView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&self->_scanView);
    objc_msgSend(WeakRetained, "addSubview:", self->_scannerView);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v14 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    holeOutlineLayer = self->_holeOutlineLayer;
    self->_holeOutlineLayer = v14;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_holeOutlineLayer, "setFillColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_holeOutlineLayer, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_holeOutlineLayer, "setLineWidth:", 2.0);
    v18 = objc_loadWeakRetained((id *)&self->_cutoutView);
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", self->_holeOutlineLayer);

    v20 = objc_loadWeakRetained((id *)&self->_cutoutView);
    objc_msgSend(v20, "setAlpha:", 0.0);

  }
  if (self->_withBackButton)
  {
    if (+[TSUtilities isPad](TSUtilities, "isPad"))
    {
      -[TSCellularPlanScanViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDefaultNavigationItems:", self);

    }
    v22 = +[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self);
    -[TSCellularPlanScanViewController navigationController](self, "navigationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidesBackButton:", !v22);
    goto LABEL_9;
  }
  -[TSCellularPlanScanViewController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDefaultNavigationItems:", self);

  if (!+[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self))
  {
    -[TSCellularPlanScanViewController navigationController](self, "navigationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidesBackButton:animated:", 1, 0);
LABEL_9:

  }
  -[TSCellularPlanScanViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v26 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  v27 = objc_loadWeakRetained((id *)&self->_btLearnMore);
  objc_msgSend(v27, "setHidden:", v26);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSCellularPlanScanViewController;
  -[TSCellularPlanScanViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  self->_confirmationCodeRequired = 0;
  self->_manualCardInfoEntry = 0;
  self->_transferViaQRCode = 0;
  -[TSCellularPlanScanViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_enterDetailsManuallyButton);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v6 = objc_loadWeakRetained((id *)&self->_cutoutView);
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[TSCellularPlanQRCodeScannerView startRunning](self->_scannerView, "startRunning");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  TSCellularPlanQRCodeScannerView *scannerView;
  id WeakRetained;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  objc_super v60;
  CGRect v61;
  CGRect v62;

  v60.receiver = self;
  v60.super_class = (Class)TSCellularPlanScanViewController;
  -[TSCellularPlanScanViewController viewDidLayoutSubviews](&v60, sel_viewDidLayoutSubviews);
  -[TSCellularPlanScanViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  scannerView = self->_scannerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanView);
  objc_msgSend(WeakRetained, "bounds");
  -[TSCellularPlanQRCodeScannerView setFrame:](scannerView, "setFrame:");

  -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v62.origin.x = v16;
  v62.origin.y = v17;
  v62.size.width = v18;
  v62.size.height = v19;
  v61.origin.x = v8;
  v61.origin.y = v10;
  v61.size.width = v12;
  v61.size.height = v14;
  v20 = CGRectIntersectsRect(v61, v62);

  if (v20)
  {
    -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v31 = v30;
    -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v31 - v34;
    -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "origin");
    v38 = v37;
    -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "size");
    v41 = v35 - (v38 + v40);
    -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "frame");
    v44 = v41 - v43;

    if (v44 <= 0.0)
    {
      -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "origin");
      v52 = v51;
      -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "size");
      v50 = v52 + v53 + 1.0;
    }
    else if (v44 >= 10.0)
    {
      -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "superview");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "frame");
      v55 = v54;
      -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "superview");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "frame");
      v50 = v55 - v58 - v27 + -10.0;

    }
    else
    {
      -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "origin");
      v47 = v46;
      -[TSCellularPlanScanViewController positionQRCodeLabel](self, "positionQRCodeLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "size");
      v50 = v44 * 0.5 + v47 + v49;
    }

    -[TSCellularPlanScanViewController enterDetailsManuallyButton](self, "enterDetailsManuallyButton");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFrame:", v23, v50, v25, v27);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  -[TSCellularPlanQRCodeScannerView stopRunning](self->_scannerView, "stopRunning");
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanScanViewController;
  -[TSCellularPlanScanViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "receivedResponse");

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  TSCellularPlanQRCodeScannerView *scannerView;
  id v9;
  id v10;
  objc_super v11;

  v5 = a4;
  scannerView = self->_scannerView;
  v9 = a5;
  v10 = a3;
  -[TSCellularPlanQRCodeScannerView stopRunning](scannerView, "stopRunning");
  v11.receiver = self;
  v11.super_class = (Class)TSCellularPlanScanViewController;
  -[TSCellularPlanScanViewController presentViewController:animated:completion:](&v11, sel_presentViewController_animated_completion_, v10, v5, v9);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanScanViewController;
  v7 = a4;
  -[TSCellularPlanScanViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__TSCellularPlanScanViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24DEF2E00;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __87__TSCellularPlanScanViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  if ((unint64_t)(v3 - 2) >= 3)
    v4 = 1;
  else
    v4 = v3;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setOrientation:", v4);
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSDate *v12;
  NSDate *nextTimeToAcceptScan;
  _QWORD block[4];
  id v15;
  TSCellularPlanScanViewController *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _TSLogDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2080;
    v21 = "-[TSCellularPlanScanViewController captureOutput:didOutputMetadataObjects:fromConnection:]";
    _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "%@ @%s", buf, 0x16u);
  }

  if (!self->_nextTimeToAcceptScan
    || (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "compare:", self->_nextTimeToAcceptScan),
        v10,
        v11 != -1))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    nextTimeToAcceptScan = self->_nextTimeToAcceptScan;
    self->_nextTimeToAcceptScan = v12;

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke;
    block[3] = &unk_24DEF2E28;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v8;
    v16 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2080;
    v21 = "-[TSCellularPlanScanViewController captureOutput:didOutputMetadataObjects:fromConnection:]_block_invoke";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "scannedCode %@ @%s", buf, 0x16u);
  }

  if (v5)
  {
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("LPA:1$TR$")))
      *((_BYTE *)WeakRetained + 994) = 1;
    objc_msgSend(WeakRetained, "btLearnMore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

    objc_msgSend(WeakRetained, "enterDetailsManuallyButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    v9 = objc_msgSend(v5, "copy");
    v10 = (void *)*((_QWORD *)WeakRetained + 127);
    *((_QWORD *)WeakRetained + 127) = v9;

    objc_msgSend(*((id *)WeakRetained + 129), "stopRunning");
    objc_msgSend(WeakRetained, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v4, "corners");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawQRBox:", v13);

    v14 = (void *)MEMORY[0x24BEBDB00];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_39;
    v17[3] = &unk_24DEF29A8;
    v17[4] = WeakRetained;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2;
    v15[3] = &unk_24DEF2930;
    objc_copyWeak(&v16, v2);
    v15[4] = WeakRetained;
    objc_msgSend(v14, "animateWithDuration:animations:completion:", v17, v15, 0.25);
    objc_destroyWeak(&v16);
  }

}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_39(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  _QWORD v4[5];
  id v5;

  if (a2)
  {
    AudioServicesPlaySystemSound(0xFFFu);
    v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3;
    v4[3] = &unk_24DEF2B00;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    v4[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x24BDAC9B8], v4);
    objc_destroyWeak(&v5);
  }
}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_addNewPlanWithCardData:confirmationCode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016), 0);

}

- (CGPoint)makeCGPoint:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("X"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  objc_msgSend(v4, "valueForKey:", CFSTR("Y"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  -[TSCellularPlanQRCodeScannerView pointForCaptureDevicePointOfInterest:](self->_scannerView, "pointForCaptureDevicePointOfInterest:", v7, v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)drawQRBox:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MaxX;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double MinX;
  double v31;
  double v32;
  CGFloat v33;
  id v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v35 = a3;
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanScanViewController makeCGPoint:](self, "makeCGPoint:", v4);
    v6 = v5;
    v8 = v7;

    objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanScanViewController makeCGPoint:](self, "makeCGPoint:", v9);
    v11 = v10;
    v13 = v12;

    if (v11 - v6 <= v13 - v8)
      v14 = v13 - v8;
    else
      v14 = v11 - v6;
    if (v14 / 5.0 >= 5.0)
      v15 = v14 / 5.0;
    else
      v15 = 5.0;
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = v14;
    v36.size.height = v14;
    v17 = CGRectGetMinX(v36) + 5.0;
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = v14;
    v37.size.height = v14;
    objc_msgSend(v16, "moveToPoint:", v17, CGRectGetMinY(v37));
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v14;
    v38.size.height = v14;
    v18 = v15 + CGRectGetMinX(v38);
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v14;
    v39.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v18, CGRectGetMinY(v39));
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.width = v14;
    v40.size.height = v14;
    v19 = CGRectGetMaxX(v40) - v15;
    v41.origin.x = v6;
    v41.origin.y = v8;
    v41.size.width = v14;
    v41.size.height = v14;
    objc_msgSend(v16, "moveToPoint:", v19, CGRectGetMinY(v41));
    v42.origin.x = v6;
    v42.origin.y = v8;
    v42.size.width = v14;
    v42.size.height = v14;
    v20 = CGRectGetMaxX(v42) + -5.0;
    v43.origin.x = v6;
    v43.origin.y = v8;
    v43.size.width = v14;
    v43.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v20, CGRectGetMinY(v43));
    v44.origin.x = v6;
    v44.origin.y = v8;
    v44.size.width = v14;
    v44.size.height = v14;
    v21 = CGRectGetMaxX(v44) + -5.0;
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v14;
    v45.size.height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMinY(v45) + 5.0, 5.0);
    v46.origin.x = v6;
    v46.origin.y = v8;
    v46.size.width = v14;
    v46.size.height = v14;
    MaxX = CGRectGetMaxX(v46);
    v47.origin.x = v6;
    v47.origin.y = v8;
    v47.size.width = v14;
    v47.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", MaxX, v15 + CGRectGetMinY(v47));
    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.width = v14;
    v48.size.height = v14;
    v23 = CGRectGetMaxX(v48);
    v49.origin.x = v6;
    v49.origin.y = v8;
    v49.size.width = v14;
    v49.size.height = v14;
    objc_msgSend(v16, "moveToPoint:", v23, CGRectGetMaxY(v49) - v15);
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v14;
    v50.size.height = v14;
    v24 = CGRectGetMaxX(v50);
    v51.origin.x = v6;
    v51.origin.y = v8;
    v51.size.width = v14;
    v51.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v24, CGRectGetMaxY(v51) + -5.0);
    v52.origin.x = v6;
    v52.origin.y = v8;
    v52.size.width = v14;
    v52.size.height = v14;
    v25 = CGRectGetMaxX(v52) + -5.0;
    v53.origin.x = v6;
    v53.origin.y = v8;
    v53.size.width = v14;
    v53.size.height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMaxY(v53) + -5.0, 5.0, 0.0, 1.57079633);
    v54.origin.x = v6;
    v54.origin.y = v8;
    v54.size.width = v14;
    v54.size.height = v14;
    v26 = CGRectGetMaxX(v54) - v15;
    v55.origin.x = v6;
    v55.origin.y = v8;
    v55.size.width = v14;
    v55.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v26, CGRectGetMaxY(v55));
    v56.origin.x = v6;
    v56.origin.y = v8;
    v56.size.width = v14;
    v56.size.height = v14;
    v27 = v15 + CGRectGetMinX(v56);
    v57.origin.x = v6;
    v57.origin.y = v8;
    v57.size.width = v14;
    v57.size.height = v14;
    objc_msgSend(v16, "moveToPoint:", v27, CGRectGetMaxY(v57));
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v14;
    v58.size.height = v14;
    v28 = CGRectGetMinX(v58) + 5.0;
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v14;
    v59.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v28, CGRectGetMaxY(v59));
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v14;
    v60.size.height = v14;
    v29 = CGRectGetMinX(v60) + 5.0;
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.width = v14;
    v61.size.height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v29, CGRectGetMaxY(v61) + -5.0, 5.0, 1.57079633, 3.14159265);
    v62.origin.x = v6;
    v62.origin.y = v8;
    v62.size.width = v14;
    v62.size.height = v14;
    MinX = CGRectGetMinX(v62);
    v63.origin.x = v6;
    v63.origin.y = v8;
    v63.size.width = v14;
    v63.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", MinX, CGRectGetMaxY(v63) - v15);
    v64.origin.x = v6;
    v64.origin.y = v8;
    v64.size.width = v14;
    v64.size.height = v14;
    v31 = CGRectGetMinX(v64);
    v65.origin.x = v6;
    v65.origin.y = v8;
    v65.size.width = v14;
    v65.size.height = v14;
    objc_msgSend(v16, "moveToPoint:", v31, v15 + CGRectGetMinY(v65));
    v66.origin.x = v6;
    v66.origin.y = v8;
    v66.size.width = v14;
    v66.size.height = v14;
    v32 = CGRectGetMinX(v66);
    v67.origin.x = v6;
    v67.origin.y = v8;
    v67.size.width = v14;
    v67.size.height = v14;
    objc_msgSend(v16, "addLineToPoint:", v32, CGRectGetMinY(v67) + 5.0);
    v68.origin.x = v6;
    v68.origin.y = v8;
    v68.size.width = v14;
    v68.size.height = v14;
    v33 = CGRectGetMinX(v68) + 5.0;
    v69.origin.x = v6;
    v69.origin.y = v8;
    v69.size.width = v14;
    v69.size.height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v33, CGRectGetMinY(v69) + 5.0, 5.0, 3.14159265, 4.71238898);
    v34 = objc_retainAutorelease(v16);
    -[CAShapeLayer setPath:](self->_holeOutlineLayer, "setPath:", objc_msgSend(v34, "CGPath"));

  }
}

- (void)enterFauxCardDataManually:(id)a3
{
  id v4;

  self->_manualCardInfoEntry = 1;
  -[TSCellularPlanScanViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidComplete:", self);

}

- (void)learnMoreTapped:(id)a3
{
  const __CFString *v3;

  if (+[TSUtilities isPad](TSUtilities, "isPad", a3))
    v3 = CFSTR("https://support.apple.com/HT203089?cid=mc-ols-esim-article_ht203089-ipados_ui-07212023#esim");
  else
    v3 = CFSTR("https://support.apple.com/ht209096?cid=mc-ols-esim-article_ht209096-ios_ui-07192022");
  +[TSUtilities launchURL:](TSUtilities, "launchURL:", v3);
}

- (void)_addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waitForResponse:", self);

  objc_initWeak(&location, self);
  if (self->_transferViaQRCode)
  {
    -[TSCellularPlanScanViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerDidComplete:", self);

  }
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_msgSend(v11, "signupUserConsentResponse");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke;
  v13[3] = &unk_24DEF2EA0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  objc_msgSend(v10, "addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:", v6, v7, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2;
  block[3] = &unk_24DEF2E78;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);

}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  int v6;
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
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  uint64_t v22;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  if (v4
    && (objc_msgSend(v4, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE158B0]),
        v5,
        v6))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "code") == 19)
    {
      WeakRetained[992] = 1;
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewControllerDidComplete:", WeakRetained);
LABEL_9:

      goto LABEL_10;
    }
    if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", *(_QWORD *)(a1 + 32))&& objc_msgSend(*(id *)(a1 + 32), "code") == 2)
    {
      +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:", *(_QWORD *)(a1 + 32), &stru_24DEF4290);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_60;
      v19[3] = &unk_24DEF2E50;
      v20 = *(id *)(a1 + 32);
      v21 = WeakRetained;
      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v15);

      objc_msgSend(WeakRetained, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "visibleViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentViewController:animated:completion:", v11, 1, 0);

      objc_msgSend(WeakRetained, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "receivedResponse");

      goto LABEL_9;
    }
  }
  else if (WeakRetained[994])
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "receivedResponse");
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_60(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "code");
  if (result == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "receivedResponse");

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultNavigationItems:", *(_QWORD *)(a1 + 48));

    return objc_msgSend(*(id *)(a1 + 40), "viewWillAppear:", 1);
  }
  return result;
}

- (void)didChangeValueForKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("userConsentAllowed")))
    -[TSCellularPlanQRCodeScannerView startRunning](self->_scannerView, "startRunning");
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)startScanning
{
  -[TSCellularPlanQRCodeScannerView startRunning](self->_scannerView, "startRunning");
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(unint64_t)a3
{
  self->_entryPoint = a3;
}

- (NSString)fauxCardData
{
  return (NSString *)objc_getProperty(self, a2, 1016, 1);
}

- (BOOL)confirmationCodeRequired
{
  return self->_confirmationCodeRequired;
}

- (BOOL)manualCardInfoEntry
{
  return self->_manualCardInfoEntry;
}

- (BOOL)transferViaQRCode
{
  return self->_transferViaQRCode;
}

- (UIView)scanView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_scanView);
}

- (void)setScanView:(id)a3
{
  objc_storeWeak((id *)&self->_scanView, a3);
}

- (TSCellularPlanQRCodeScannerView)scannerView
{
  return (TSCellularPlanQRCodeScannerView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setScannerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (UIView)cutoutView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cutoutView);
}

- (void)setCutoutView:(id)a3
{
  objc_storeWeak((id *)&self->_cutoutView, a3);
}

- (UIButton)enterDetailsManuallyButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_enterDetailsManuallyButton);
}

- (void)setEnterDetailsManuallyButton:(id)a3
{
  objc_storeWeak((id *)&self->_enterDetailsManuallyButton, a3);
}

- (UILabel)scanQRCodeLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_scanQRCodeLabel);
}

- (void)setScanQRCodeLabel:(id)a3
{
  objc_storeWeak((id *)&self->_scanQRCodeLabel, a3);
}

- (UILabel)positionQRCodeLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_positionQRCodeLabel);
}

- (void)setPositionQRCodeLabel:(id)a3
{
  objc_storeWeak((id *)&self->_positionQRCodeLabel, a3);
}

- (UIButton)btLearnMore
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_btLearnMore);
}

- (void)setBtLearnMore:(id)a3
{
  objc_storeWeak((id *)&self->_btLearnMore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_btLearnMore);
  objc_destroyWeak((id *)&self->_positionQRCodeLabel);
  objc_destroyWeak((id *)&self->_scanQRCodeLabel);
  objc_destroyWeak((id *)&self->_enterDetailsManuallyButton);
  objc_destroyWeak((id *)&self->_cutoutView);
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_destroyWeak((id *)&self->_scanView);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_holeOutlineLayer, 0);
  objc_storeStrong((id *)&self->_nextTimeToAcceptScan, 0);
}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v2;
  v5 = 2080;
  v6 = "-[TSCellularPlanScanViewController _addNewPlanWithCardData:confirmationCode:]_block_invoke_2";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v3, 0x16u);
}

@end
