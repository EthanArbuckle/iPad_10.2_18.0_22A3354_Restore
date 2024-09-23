@implementation PKPaymentDocumentSubmissionIDCaptureViewController

- (PKPaymentDocumentSubmissionIDCaptureViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5
{
  id v9;
  PKPaymentDocumentSubmissionIDCaptureViewController *v10;
  PKPaymentDocumentSubmissionIDCaptureViewController *v11;
  uint64_t *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  v10 = -[CRCameraReader init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_featureIdentifier = a5;
    objc_storeStrong((id *)&v10->_captureController, a3);
    if (-[PKPaymentDocumentSubmissionController side](v11->_captureController, "side"))
    {
      v16 = *MEMORY[0x1E0D182D0];
      v12 = &v16;
    }
    else
    {
      v17[0] = *MEMORY[0x1E0D182D8];
      v12 = v17;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setOutputObjectTypes:](v11, "setOutputObjectTypes:", v13);

    -[CRCameraReader setDelegate:](v11, "setDelegate:", v11);
    -[CRCameraReader setHidePlacementText:](v11, "setHidePlacementText:", 1);
    v11->_reachedTimeout = 0;
    v11->_context = a4;
  }

  return v11;
}

- (void)dealloc
{
  NSTimer *timerTryAgain;
  objc_super v4;

  timerTryAgain = self->_timerTryAgain;
  if (timerTryAgain)
    -[NSTimer invalidate](timerTryAgain, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[CRCameraReader dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  UIView *v3;
  UIView *cameraView;
  PKCameraCaptureInstructionView *v5;
  PKCameraCaptureInstructionView *v6;
  PKCameraCaptureInstructionView *cameraInstructionView;
  UIView *v8;
  UIView *cameraInstructionContainerView;
  UIView *v10;
  void *v11;
  id v12;
  void *v13;
  UIView *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[CRCameraReader loadView](&v15, sel_loadView);
  -[PKPaymentDocumentSubmissionIDCaptureViewController view](self, "view");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  cameraView = self->_cameraView;
  self->_cameraView = v3;

  -[UIView setClipsToBounds:](self->_cameraView, "setClipsToBounds:", 1);
  v5 = [PKCameraCaptureInstructionView alloc];
  v6 = -[PKCameraCaptureInstructionView initWithFrame:context:primaryAction:primaryActionTitle:secondaryAction:secondaryActionTitle:](v5, "initWithFrame:context:primaryAction:primaryActionTitle:secondaryAction:secondaryActionTitle:", self->_context, 0, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  cameraInstructionView = self->_cameraInstructionView;
  self->_cameraInstructionView = v6;

  v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  cameraInstructionContainerView = self->_cameraInstructionContainerView;
  self->_cameraInstructionContainerView = v8;

  v10 = self->_cameraInstructionContainerView;
  PKProvisioningBackgroundColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UIView addSubview:](self->_cameraInstructionContainerView, "addSubview:", self->_cameraInstructionView);
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIView frame](self->_cameraView, "frame");
  v13 = (void *)objc_msgSend(v12, "initWithFrame:");
  v14 = self->_cameraView;
  objc_msgSend(v13, "bounds");
  -[UIView setFrame:](v14, "setFrame:");
  objc_msgSend(v13, "addSubview:", self->_cameraView);
  objc_msgSend(v13, "addSubview:", self->_cameraInstructionContainerView);
  -[PKPaymentDocumentSubmissionIDCaptureViewController setView:](self, "setView:", v13);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIBarButtonItem *buttonCancel;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[PKPaymentDocumentSubmissionIDCaptureViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKPaymentDocumentSubmissionIDCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if ((self->_featureIdentifier | 2) == 3)
  {
    -[PKPaymentDocumentSubmissionIDCaptureViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackBarButtonItem:", 0);
    buttonCancel = self->_buttonCancel;
    if (!buttonCancel)
    {
      v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
      v8 = self->_buttonCancel;
      self->_buttonCancel = v7;

      buttonCancel = self->_buttonCancel;
    }
    objc_msgSend(v5, "setLeftBarButtonItem:", buttonCancel);
    -[PKPaymentDocumentSubmissionIDCaptureViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);

  }
  PKPaymentSetupApplyContextAppearance(self->_context, v3);

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
  double v15;
  double v16;
  CGFloat v17;
  CGRect v18;
  CGRect slice;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[CRCameraReader viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  -[PKPaymentDocumentSubmissionIDCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  -[PKCameraCaptureInstructionView sizeThatFits:](self->_cameraInstructionView, "sizeThatFits:", v9, v11 - v14);
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v17 = v15 + v15 + v16 + fmax(v11 - (v13 + v15) - (v15 + v16) + -337.0, 0.0);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v17, CGRectMaxYEdge);
  -[UIView setFrame:](self->_cameraView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[UIView setFrame:](self->_cameraInstructionContainerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UIView bounds](self->_cameraInstructionContainerView, "bounds");
  v18 = v22;
  CGRectDivide(v22, &slice, &v18, v15, CGRectMaxYEdge);
  -[PKCameraCaptureInstructionView setFrame:](self->_cameraInstructionView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[UIView setNeedsLayout](self->_cameraView, "setNeedsLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  NSTimer *v4;
  NSTimer *timerTryAgain;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[CRCameraReader viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CRCameraReader start](self, "start");
  -[PKPaymentDocumentSubmissionController setDelegate:](self->_captureController, "setDelegate:", self);
  self->_reachedTimeout = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentDocumentSubmissionIDCaptureViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_1E3E6B958;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 10.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timerTryAgain = self->_timerTryAgain;
  self->_timerTryAgain = v4;

  -[PKPaymentDocumentSubmissionIDCaptureViewController updateUIWithState:](self, "updateUIWithState:", -[PKPaymentDocumentSubmissionController state](self->_captureController, "state"));
}

uint64_t __69__PKPaymentDocumentSubmissionIDCaptureViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1528) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "updateUIWithState:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1496), "state"));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  -[PKPaymentDocumentSubmissionIDCaptureViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  if (os_variant_has_internal_ui())
  {
    PKCIPInputFile();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      if (objc_msgSend(v5, "fileExistsAtPath:", v4))
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithContentsOfFile:", v4);
        PKLogFacilityTypeGetObject();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v8)
          {
            *(_DWORD *)buf = 138412290;
            v11 = v4;
            _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Using CIP capture image override at path: '%@'", buf, 0xCu);
          }

          -[PKPaymentDocumentSubmissionController capturedImage:](self->_captureController, "capturedImage:", v6);
        }
        else
        {
          if (v8)
          {
            *(_DWORD *)buf = 138412290;
            v11 = v4;
            _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Could not load data for file at path: '%@'", buf, 0xCu);
          }

          v6 = 0;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v4;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Warning: File does not exist at path: '%@'", buf, 0xCu);
        }
      }

    }
  }
}

- (void)cancel
{
  -[PKPaymentDocumentSubmissionController userWantsToCancel](self->_captureController, "userWantsToCancel");
}

- (void)updateUIWithState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSTimer *timerTryAgain;
  void *v11;
  void *v12;
  int64_t context;
  void *v14;
  _QWORD v15[5];
  id v16;

  -[PKCameraCaptureInstructionView headerView](self->_cameraInstructionView, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[CRCameraReader setEnableAltIDCardScan:](self, "setEnableAltIDCardScan:", self->_reachedTimeout);
    -[PKPaymentDocumentSubmissionController preferredLanguage](self->_captureController, "preferredLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDocumentSubmissionController side](self->_captureController, "side");
    objc_msgSend(v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

    objc_msgSend(v5, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

  }
  else
  {
    -[NSTimer invalidate](self->_timerTryAgain, "invalidate");
    timerTryAgain = self->_timerTryAgain;
    self->_timerTryAgain = 0;

    self->_reachedTimeout = 0;
    -[PKPaymentDocumentSubmissionController nextViewController](self->_captureController, "nextViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v11)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__PKPaymentDocumentSubmissionIDCaptureViewController_updateUIWithState___block_invoke;
      v15[3] = &unk_1E3E61388;
      v15[4] = self;
      v16 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }

  context = self->_context;
  -[PKPaymentDocumentSubmissionIDCaptureViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(context, v14);

}

void __72__PKPaymentDocumentSubmissionIDCaptureViewController_updateUIWithState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_presentPaymentSetupViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4
{
  -[PKPaymentDocumentSubmissionIDCaptureViewController updateUIWithState:](self, "updateUIWithState:", a4);
}

- (void)cameraReaderDidCancel:(id)a3
{
  -[PKPaymentDocumentSubmissionController terminateSetupFlow](self->_captureController, "terminateSetupFlow", a3);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "count");
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      PKAnalyticsSendEventForFeature();
      -[PKPaymentDocumentSubmissionController capturedImage:](self->_captureController, "capturedImage:", v8);
    }

    v6 = v9;
  }

}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  PKPaymentDocumentSubmissionController *captureController;

  captureController = self->_captureController;
  if (captureController)
    -[PKPaymentDocumentSubmissionController captureFailedWithError:](captureController, "captureFailedWithError:", a4);
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonCancel, 0);
  objc_storeStrong((id *)&self->_timerTryAgain, 0);
  objc_storeStrong((id *)&self->_cameraInstructionView, 0);
  objc_storeStrong((id *)&self->_cameraInstructionContainerView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
}

@end
