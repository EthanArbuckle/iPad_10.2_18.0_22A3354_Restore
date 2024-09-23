@implementation PMOtpauthQRCodeScannerViewController

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *viewfinderView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVCaptureVideoPreviewLayer *v14;
  AVCaptureVideoPreviewLayer *previewLayer;
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
  void *v30;
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewDidLoad](&v31, sel_viewDidLoad);
  -[PMOtpauthQRCodeScannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 1);
  v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  viewfinderView = self->_viewfinderView;
  self->_viewfinderView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_viewfinderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_viewfinderView);
  v24 = (void *)MEMORY[0x24BDD1628];
  -[UIView topAnchor](self->_viewfinderView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  -[UIView rightAnchor](self->_viewfinderView, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v6;
  -[UIView bottomAnchor](self->_viewfinderView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v9;
  -[UIView leftAnchor](self->_viewfinderView, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v13);

  -[PMOtpauthQRCodeScannerViewController _configureCaptureSession](self, "_configureCaptureSession");
  objc_msgSend(MEMORY[0x24BDB2510], "layerWithSession:", self->_captureSession);
  v14 = (AVCaptureVideoPreviewLayer *)objc_claimAutoreleasedReturnValue();
  previewLayer = self->_previewLayer;
  self->_previewLayer = v14;

  -[AVCaptureVideoPreviewLayer setVideoGravity:](self->_previewLayer, "setVideoGravity:", *MEMORY[0x24BDB1C80]);
  -[UIView layer](self->_viewfinderView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");

  -[PMOtpauthQRCodeScannerViewController _updatePreviewLayerOrientation](self, "_updatePreviewLayerOrientation");
  -[UIView layer](self->_viewfinderView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", self->_previewLayer);

  -[PMOtpauthQRCodeScannerViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navigationBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "standardAppearance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEdgeAppearance:", v20);

  -[PMOtpauthQRCodeScannerViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss_);
  objc_msgSend(v21, "setRightBarButtonItem:", v23);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AVCaptureSession startRunning](self->_captureSession, "startRunning");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[UIView layer](self->_viewfinderView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PMOtpauthQRCodeScannerViewController _updatePreviewLayerOrientation](self, "_updatePreviewLayerOrientation");
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;

  objc_msgSend(a4, "firstObject", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BDB1EC8];

  if (v7 == v8)
  {
    objc_msgSend(v6, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "QRCodeScannerViewController:didScanQRCodeWithURLValue:", self, v10);

    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PMOtpauthQRCodeScannerViewController captureOutput:didOutputMetadataObjects:fromConnection:].cold.1((uint64_t)v9, v12);
    }

  }
}

- (void)_dismiss:(id)a3
{
  void *v3;
  id v4;

  -[PMOtpauthQRCodeScannerViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_configureCaptureSession
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_243521000, v3, OS_LOG_TYPE_ERROR, "Unable to create input for QR code capture device. %@", (uint8_t *)&v5, 0xCu);

}

- (void)_updatePreviewLayerOrientation
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVCaptureVideoPreviewLayer setOrientation:](self->_previewLayer, "setOrientation:", -[PMOtpauthQRCodeScannerViewController _avCaptureVideoOrientationFromUIDeviceOrientation:](self, "_avCaptureVideoOrientationFromUIDeviceOrientation:", objc_msgSend(v3, "orientation")));

}

- (int64_t)_avCaptureVideoOrientationFromUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

- (PMOtpauthQRCodeScannerViewControllerDelegate)delegate
{
  return (PMOtpauthQRCodeScannerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewfinderView, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)captureOutput:(uint64_t)a1 didOutputMetadataObjects:(NSObject *)a2 fromConnection:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_243521000, a2, OS_LOG_TYPE_DEBUG, "QR code does not contain a valid URL. %@", (uint8_t *)&v2, 0xCu);
}

@end
