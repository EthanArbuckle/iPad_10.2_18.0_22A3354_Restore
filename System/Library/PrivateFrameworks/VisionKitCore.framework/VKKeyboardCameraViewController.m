@implementation VKKeyboardCameraViewController

+ (BOOL)isOpticalFlowForTextEnabled
{
  int v2;

  v2 = vk_supportsOpticalFlowTracking();
  if (v2)
    LOBYTE(v2) = !vk_isInternalBuild()
              || +[VKCInternalSettings isOpticalFlowForTextEnabled](VKCInternalSettings, "isOpticalFlowForTextEnabled");
  return v2;
}

- (VKKeyboardCameraViewController)init
{
  VKKeyboardCameraViewController *v2;
  VKFrameProviderConfiguration *v3;
  VKAVCaptureFrameProvider *v4;
  VKAVCaptureFrameProvider *frameProvider;
  VKTextWithTrackingFrameProcessor *v6;
  VKTextWithTrackingFrameProcessor *optFlowTextProcessor;
  void *v8;
  id *v9;
  VKTextFrameProcessor *v10;
  VKTextFrameProcessor *textProcessor;
  void *v12;
  uint64_t v13;
  VKHomographyFrameProcessor *v14;
  VKHomographyFrameProcessor *homographyProcessor;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VKKeyboardCameraViewController;
  v2 = -[VKKeyboardCameraViewController init](&v27, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKFrameProviderConfiguration);
    -[VKFrameProviderConfiguration setResolutionPreset:](v3, "setResolutionPreset:", 5);
    v4 = -[VKAVCaptureFrameProvider initWithConfiguration:]([VKAVCaptureFrameProvider alloc], "initWithConfiguration:", v3);
    frameProvider = v2->_frameProvider;
    v2->_frameProvider = v4;

    -[VKAVCaptureFrameProvider setDelegate:queue:](v2->_frameProvider, "setDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    if (+[VKKeyboardCameraViewController isOpticalFlowForTextEnabled](VKKeyboardCameraViewController, "isOpticalFlowForTextEnabled"))
    {
      v6 = objc_alloc_init(VKTextWithTrackingFrameProcessor);
      optFlowTextProcessor = v2->_optFlowTextProcessor;
      v2->_optFlowTextProcessor = v6;

      v8 = (void *)MEMORY[0x1E0C80D38];
      -[VKFrameProcessor setResultHandlerQueue:](v2->_optFlowTextProcessor, "setResultHandlerQueue:", MEMORY[0x1E0C80D38]);

      objc_initWeak(&location, v2);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __38__VKKeyboardCameraViewController_init__block_invoke;
      v24[3] = &unk_1E94624C8;
      v9 = &v25;
      objc_copyWeak(&v25, &location);
      -[VKTextWithTrackingFrameProcessor setResultHandler:](v2->_optFlowTextProcessor, "setResultHandler:", v24);
      -[VKFrameProvider registerProcessor:](v2->_frameProvider, "registerProcessor:", v2->_optFlowTextProcessor);
    }
    else
    {
      v10 = objc_alloc_init(VKTextFrameProcessor);
      textProcessor = v2->_textProcessor;
      v2->_textProcessor = v10;

      v12 = (void *)MEMORY[0x1E0C80D38];
      -[VKFrameProcessor setResultHandlerQueue:](v2->_textProcessor, "setResultHandlerQueue:", MEMORY[0x1E0C80D38]);

      objc_initWeak(&location, v2);
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __38__VKKeyboardCameraViewController_init__block_invoke_2;
      v22[3] = &unk_1E94624C8;
      v9 = &v23;
      objc_copyWeak(&v23, &location);
      -[VKTextFrameProcessor setResultHandler:](v2->_textProcessor, "setResultHandler:", v22);
      v14 = objc_alloc_init(VKHomographyFrameProcessor);
      homographyProcessor = v2->_homographyProcessor;
      v2->_homographyProcessor = v14;

      v17 = v13;
      v18 = 3221225472;
      v19 = __38__VKKeyboardCameraViewController_init__block_invoke_3;
      v20 = &unk_1E94624F0;
      objc_copyWeak(&v21, &location);
      -[VKHomographyFrameProcessor setResultHandler:](v2->_homographyProcessor, "setResultHandler:", &v17);
      -[VKFrameProvider registerProcessor:](v2->_frameProvider, "registerProcessor:", v2->_textProcessor, v17, v18, v19, v20);
      -[VKFrameProvider registerProcessor:](v2->_frameProvider, "registerProcessor:", v2->_homographyProcessor);
      objc_destroyWeak(&v21);
    }
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __38__VKKeyboardCameraViewController_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "textProcessorResult:", v3);

}

void __38__VKKeyboardCameraViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "textProcessorResult:", v3);

}

void __38__VKKeyboardCameraViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "textProcessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "warpTransform");
  v9 = v6;
  v10 = v5;
  v8 = v7;

  objc_msgSend(v4, "applyHomographyWarpTransform:", v10, v9, v8);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  VKKeyboardCameraReticleView *v5;
  id v6;
  void *v7;
  void *v8;
  VKKeyboardCameraGuidanceView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[VKKeyboardCameraViewController setPreviousString:](self, "setPreviousString:", &stru_1E94661A8);
  -[VKKeyboardCameraViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  +[VKKeyboardCameraDefaults sharedInstance](VKKeyboardCameraDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VKKeyboardCameraReticleView);
  -[VKKeyboardCameraReticleView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v4, "doubleForKey:", CFSTR("DimmingRadius"));
  -[VKKeyboardCameraReticleView setSpotlightBlurRadius:](v5, "setSpotlightBlurRadius:");
  objc_msgSend(v4, "doubleForKey:", CFSTR("DimmingOpacity"));
  -[VKKeyboardCameraReticleView setInvertedShadowAlpha:](v5, "setInvertedShadowAlpha:");
  -[VKKeyboardCameraViewController setReticleView:](self, "setReticleView:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.01);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v3, "addSubview:", v6);
  -[VKKeyboardCameraViewController setHitTestView:](self, "setHitTestView:", v6);
  -[VKKeyboardCameraViewController addButtons](self, "addButtons");
  v9 = objc_alloc_init(VKKeyboardCameraGuidanceView);
  -[VKKeyboardCameraGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v9);
  -[VKKeyboardCameraViewController setGuidanceView:](self, "setGuidanceView:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_onTap_);
  -[VKKeyboardCameraViewController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v10);

  -[VKKeyboardCameraViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA840]), "initWithTarget:action:", self, sel_onPinch_);
  -[VKKeyboardCameraViewController setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", v12);

  -[VKKeyboardCameraViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v14);

  -[VKKeyboardCameraViewController configureConstraints](self, "configureConstraints");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController dealloc](&v4, sel_dealloc);
}

- (void)addButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VKKeyboardCameraInsertButton *v8;
  VKKeyboardCameraInsertButton *v9;
  void *v10;
  VKKeyboardCameraCloseButton *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  -[VKKeyboardCameraViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("KC_INSERT_BUTTON"), CFSTR("KC_INSERT_BUTTON"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0CEA2A8];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __44__VKKeyboardCameraViewController_addButtons__block_invoke;
  v18 = &unk_1E9462518;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v5, 0, 0, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [VKKeyboardCameraInsertButton alloc];
  v9 = -[VKKeyboardCameraInsertButton initWithPrimaryAction:](v8, "initWithPrimaryAction:", v7, v15, v16, v17, v18);
  -[VKKeyboardCameraInsertButton setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VKKeyboardCameraInsertButton uiButton](v9, "uiButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 0);

  objc_msgSend(v3, "addSubview:", v9);
  -[VKKeyboardCameraViewController setInsertButton:](self, "setInsertButton:", v9);
  v11 = objc_alloc_init(VKKeyboardCameraCloseButton);
  -[VKKeyboardCameraCloseButton setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VKKeyboardCameraCloseButton uiButton](v11, "uiButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_onCancel, 64);

  objc_msgSend(v3, "addSubview:", v11);
  -[VKKeyboardCameraViewController setCloseButton:](self, "setCloseButton:", v11);
  +[VKImageAnalysisButton buttonWithType:](VKImageAnalysisButton, "buttonWithType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_onLiftTextButton_, 64);
  objc_msgSend(v13, "setFunction:", 1);
  objc_msgSend(v13, "setGlyphConfiguration:", 1);
  objc_msgSend(v13, "setMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "setAlpha:", 0.0);
  objc_msgSend(v3, "addSubview:", v13);
  -[VKKeyboardCameraViewController setLiftTextButton:](self, "setLiftTextButton:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __44__VKKeyboardCameraViewController_addButtons__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "onInsert");
    WeakRetained = v2;
  }

}

- (void)animate:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, a3, 0, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
}

- (void)loadView
{
  void *v3;
  id v4;

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  VKTextFrameProcessorConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v5 = objc_alloc_init(VKTextFrameProcessorConfiguration);
  -[VKTextFrameProcessorConfiguration setIsForSingleItem:](v5, "setIsForSingleItem:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessorConfiguration setRecognitionLanguages:](v5, "setRecognitionLanguages:", v6);

  -[VKTextFrameProcessorConfiguration setDataType:](v5, "setDataType:", -[VKKeyboardCameraViewController dataType](self, "dataType"));
  -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v5);

  -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v5);

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startRunning");

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startProcessing");

  v11.receiver = self;
  v11.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[VKKeyboardCameraViewController setDidDismiss:](self, "setDidDismiss:", 1);
  -[VKKeyboardCameraViewController setClosestItem:](self, "setClosestItem:", 0);
  -[VKKeyboardCameraViewController setReticleView:](self, "setReticleView:", 0);
  -[VKKeyboardCameraViewController setFrameProvider:](self, "setFrameProvider:", 0);
  -[VKKeyboardCameraViewController setTextProcessor:](self, "setTextProcessor:", 0);
  -[VKKeyboardCameraViewController setOptFlowTextProcessor:](self, "setOptFlowTextProcessor:", 0);
  -[VKKeyboardCameraViewController setHomographyProcessor:](self, "setHomographyProcessor:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VKKeyboardCameraViewController startTimeWithoutTextTimer](self, "startTimeWithoutTextTimer");
  -[VKKeyboardCameraViewController setDidDismiss:](self, "setDidDismiss:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__VKKeyboardCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E9462540;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

void __85__VKKeyboardCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "textLiftingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "textLiftingView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

- (void)updateInsertButtonWithRecognizedString:(id)a3
{
  void *v4;
  char v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[VKKeyboardCameraViewController previousString](self, "previousString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v11);

  if ((v5 & 1) == 0)
  {
    -[VKKeyboardCameraViewController setPreviousString:](self, "setPreviousString:", v11);
    v6 = objc_msgSend(v11, "length") != 0;
    -[VKKeyboardCameraViewController insertButton](self, "insertButton");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "uiButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v6);

    -[VKKeyboardCameraViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[VKKeyboardCameraViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyboardCamera:didUpdateString:", self, v11);

    }
  }

}

- (void)clearFoundItemAndRemoveLiftTextButton:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VKKeyboardCameraViewController closestItem](self, "closestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[VKKeyboardCameraViewController resetToDefaultComparisonPoint](self, "resetToDefaultComparisonPoint");
  -[VKKeyboardCameraViewController setClosestItem:](self, "setClosestItem:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__VKKeyboardCameraViewController_clearFoundItemAndRemoveLiftTextButton___block_invoke;
  v6[3] = &unk_1E9462568;
  v7 = a3;
  v6[4] = self;
  -[VKKeyboardCameraViewController animate:](self, "animate:", v6);
}

void __72__VKKeyboardCameraViewController_clearFoundItemAndRemoveLiftTextButton___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "liftTextButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

  }
  objc_msgSend(*(id *)(a1 + 32), "reticleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReticleAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "reticleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collapseReticleRect");

}

- (void)configureConstraints
{
  void *v3;
  void *v4;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  _QWORD v71[19];

  v71[17] = *MEMORY[0x1E0C80C00];
  -[VKKeyboardCameraViewController reticleView](self, "reticleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController hitTestView](self, "hitTestView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController insertButton](self, "insertButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController closeButton](self, "closeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController liftTextButton](self, "liftTextButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKKeyboardCameraViewController guidanceView](self, "guidanceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v68;
  objc_msgSend(v5, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v64;
  v67 = v5;
  objc_msgSend(v5, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v61;
  objc_msgSend(v5, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v57;
  objc_msgSend(v3, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v54;
  objc_msgSend(v3, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v51;
  v60 = v3;
  objc_msgSend(v3, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v48;
  objc_msgSend(v3, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v42;
  objc_msgSend(v7, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 20.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v39;
  objc_msgSend(v7, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v35, -20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v34;
  objc_msgSend(v6, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -36.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v31;
  v45 = v6;
  objc_msgSend(v6, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v28;
  v43 = v8;
  objc_msgSend(v8, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v38 = v7;
  objc_msgSend(v7, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[12] = v25;
  objc_msgSend(v8, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71[13] = v22;
  objc_msgSend(v9, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:multiplier:", v20, 0.666666667);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71[14] = v11;
  v36 = v9;
  objc_msgSend(v9, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v71[15] = v14;
  objc_msgSend(v9, "firstBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uiButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstBaselineAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71[16] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v19);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKKeyboardCameraViewController;
  -[VKKeyboardCameraViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[VKKeyboardCameraViewController textLiftingView](self, "textLiftingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKKeyboardCameraViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[VKKeyboardCameraViewController textLiftingView](self, "textLiftingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
  if (!-[VKKeyboardCameraViewController didSetInitialComparisonPoint](self, "didSetInitialComparisonPoint"))
  {
    -[VKKeyboardCameraViewController resetToDefaultComparisonPoint](self, "resetToDefaultComparisonPoint");
    -[VKKeyboardCameraViewController setDidSetInitialComparisonPoint:](self, "setDidSetInitialComparisonPoint:", 1);
  }
}

- (void)onInsert
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopProcessing");

  -[VKKeyboardCameraViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKKeyboardCameraViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userDidAcceptWithKeyboardCamera:", self);

  }
}

- (void)onCancel
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted"))
  {
    -[VKKeyboardCameraViewController textAnalyzer](self, "textAnalyzer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllRequests");

  }
  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopProcessing");

  -[VKKeyboardCameraViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[VKKeyboardCameraViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidCancelWithKeyboardCamera:", self);

  }
}

- (void)onSelectionChanged:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textSelectionView", "-[VKKeyboardCameraViewController onSelectionChanged:]", 0, 0, CFSTR("Unexpected: Missing text selection view for lifted text."));
    objc_msgSend(v6, "selectedVKRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && !objc_msgSend(v7, "isEmpty"))
    {
      objc_msgSend(v6, "selectedText");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VKKeyboardCameraViewController liftedString](self, "liftedString");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    -[VKKeyboardCameraViewController updateInsertButtonWithRecognizedString:](self, "updateInsertButtonWithRecognizedString:", v9);

    v5 = v11;
  }

}

- (void)onLiftTextButton:(id)a3
{
  if (-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted", a3))
    -[VKKeyboardCameraViewController dismissLiftedText](self, "dismissLiftedText");
  else
    -[VKKeyboardCameraViewController liftTextIfPossible](self, "liftTextIfPossible");
}

- (void)onTap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (objc_msgSend(a3, "state") == 3)
  {
    if (-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted"))
    {
      -[VKKeyboardCameraViewController dismissLiftedText](self, "dismissLiftedText");
      return;
    }
    -[VKKeyboardCameraViewController view](self, "view");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    -[VKKeyboardCameraViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer locationInView:](tapGestureRecognizer, "locationInView:", v11);

    VKMFlipPoint();
    v14 = VKMNormalizedPointInRect(v12, v13, v5, v7, v9);
    v16 = v15;
    -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setComparisonPoint:", v14, v16);
      -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_10:
        -[VKKeyboardCameraViewController setDidOverrideComparisonPoint:](self, "setDidOverrideComparisonPoint:", 1);

        return;
      }
      -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setComparisonPoint:", v14, v16);
      -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v20;
    objc_msgSend(v20, "setConfiguration:", v19);

    goto LABEL_10;
  }
}

- (void)onPinch:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[VKKeyboardCameraViewController setIsPinchToZoomInProgress:](self, "setIsPinchToZoomInProgress:", 0);
    -[VKKeyboardCameraViewController didEndPinchToZoom](self, "didEndPinchToZoom");
  }
  else if (v4 == 2)
  {
    -[VKKeyboardCameraViewController initialPinchZoom](self, "initialPinchZoom");
    v7 = v6;
    objc_msgSend(v11, "scale");
    v9 = v7 * v8;
    -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZoomFactor:", v9);

  }
  else if (v4 == 1)
  {
    -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomFactor");
    -[VKKeyboardCameraViewController setInitialPinchZoom:](self, "setInitialPinchZoom:");

    -[VKKeyboardCameraViewController setIsPinchToZoomInProgress:](self, "setIsPinchToZoomInProgress:", 1);
    -[VKKeyboardCameraViewController willBeginPinchToZoom](self, "willBeginPinchToZoom");
  }

}

- (void)willBeginPinchToZoom
{
  void *v3;

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopProcessing");

  -[VKKeyboardCameraViewController clearFoundItemAndRemoveLiftTextButton:](self, "clearFoundItemAndRemoveLiftTextButton:", 1);
}

- (void)didEndPinchToZoom
{
  id v2;

  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startProcessing");

}

- (void)liftTextIfPossible
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isTextLifted", "-[VKKeyboardCameraViewController liftTextIfPossible]", 0, 0, CFSTR("request to lift text, but text is already lifted"));
  -[VKKeyboardCameraViewController closestItem](self, "closestItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopProcessing");

    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__VKKeyboardCameraViewController_liftTextIfPossible__block_invoke;
    v5[3] = &unk_1E9462590;
    objc_copyWeak(&v6, &location);
    -[VKKeyboardCameraViewController liftTextWithCompletion:](self, "liftTextWithCompletion:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __52__VKKeyboardCameraViewController_liftTextIfPossible__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained, "liftTextButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSelected:", 1);

      VKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("KC_LIFTED_TEXT_HELP"), CFSTR("KC_LIFTED_TEXT_HELP"), CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "guidanceView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showGuidanceWithText:", v6);

      objc_msgSend(v8, "clearFoundItemAndRemoveLiftTextButton:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "frameProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startProcessing");
    }

    WeakRetained = v8;
  }

}

- (void)dismissLiftedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (!-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isTextLifted", "-[VKKeyboardCameraViewController dismissLiftedText]", 0, 0, CFSTR("request dismiss lifted text, but no text is lifted"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VKCImageTextSelectionViewSelectionDidChange"), 0);

  -[VKKeyboardCameraViewController textAnalyzer](self, "textAnalyzer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

  -[VKKeyboardCameraViewController textLiftingView](self, "textLiftingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fadeOutAndRemoveFromSuperview");

  -[VKKeyboardCameraViewController setTextLiftingView:](self, "setTextLiftingView:", 0);
  -[VKKeyboardCameraViewController setIsTextLifted:](self, "setIsTextLifted:", 0);
  -[VKKeyboardCameraViewController insertButton](self, "insertButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

  -[VKKeyboardCameraViewController liftTextButton](self, "liftTextButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__VKKeyboardCameraViewController_dismissLiftedText__block_invoke;
  v10[3] = &unk_1E94625B8;
  v10[4] = self;
  -[VKKeyboardCameraViewController animate:](self, "animate:", v10);
  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startProcessing");

}

void __51__VKKeyboardCameraViewController_dismissLiftedText__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "liftTextButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)liftTextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke;
  v7[3] = &unk_1E94625E0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "snapshotWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  NSObject *v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "liftTextWithSnapshot:", v3) & 1) == 0)
    {
      v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_1();

    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else if (WeakRetained)
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_2();

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v8 = *(void (**)(void))(v10 + 16);
      goto LABEL_14;
    }
  }

}

- (BOOL)liftTextWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VKCaptureTextAnalyzer *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Height;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  void *v39;
  CGFloat v40;
  VKTextLiftingView *v41;
  VKCImageAnalysisInteraction *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v50;
  VKCaptureTextAnalysisRequest *v51;
  CGAffineTransform v52;
  _QWORD v53[2];
  CGRect v54;
  CGRect v55;

  v53[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKKeyboardCameraViewController closestItem](self, "closestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VKKeyboardCameraViewController textAnalyzer](self, "textAnalyzer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(VKCaptureTextAnalyzer);
      -[VKCaptureTextAnalyzer setShouldCreateFeedbackProviders:](v7, "setShouldCreateFeedbackProviders:", 0);
      -[VKKeyboardCameraViewController setTextAnalyzer:](self, "setTextAnalyzer:", v7);

    }
    objc_msgSend(v5, "layerQuad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[VKCaptureTextAnalysisRequest initWithImage:focusQuad:delegate:]([VKCaptureTextAnalysisRequest alloc], "initWithImage:focusQuad:delegate:", v4, v8, self);
    -[VKKeyboardCameraViewController textAnalyzer](self, "textAnalyzer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processRequest:", v51);

    -[VKKeyboardCameraViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[VKKeyboardCameraViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
    v50 = v19;
    -[VKKeyboardCameraViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
    v21 = v20;
    v54.origin.x = v12;
    v54.origin.y = v14;
    v54.size.width = v16;
    v54.size.height = v18;
    Height = CGRectGetHeight(v54);
    -[VKKeyboardCameraViewController insertButton](self, "insertButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v24 = Height - CGRectGetMinY(v55) + 5.0;

    objc_msgSend(v8, "averagedAngleFromBottomAndTopEdges");
    v26 = v25;
    -[VKKeyboardCameraViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "normalizedQuadFromView:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    -[VKKeyboardCameraViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v32 = VKMAspectRatio(v30, v31);

    v33 = (void *)MEMORY[0x1E0CEA390];
    v53[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v34, v32, 0.1, 0.2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKKeyboardCameraViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37;
    -[VKKeyboardCameraViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frame");
    CGAffineTransformMakeScale(&v52, v38, v40);
    objc_msgSend(v35, "vk_applyTransform:", &v52);

    v41 = -[VKTextLiftingView initWithImage:cutoutPath:baselineAngle:]([VKTextLiftingView alloc], "initWithImage:cutoutPath:baselineAngle:", v4, v35, v26);
    -[VKTextLiftingView setDelegate:](v41, "setDelegate:", self);
    -[VKTextLiftingView setMaxScale:](v41, "setMaxScale:", 2.0);
    -[VKTextLiftingView setFrame:](v41, "setFrame:", v12, v14, v16, v18);
    -[VKTextLiftingView setContentInsets:](v41, "setContentInsets:", 20.0, v50, v24, v21);
    -[VKTextLiftingView setPresentsMenuForLiftedText:](v41, "setPresentsMenuForLiftedText:", 0);
    -[VKTextLiftingView setHitTestPath:](v41, "setHitTestPath:", v35);
    v42 = -[VKCImageAnalysisInteraction initWithInteractionOptions:]([VKCImageAnalysisInteraction alloc], "initWithInteractionOptions:", 7);
    -[VKCImageAnalysisInteraction setActiveInteractionTypes:](v42, "setActiveInteractionTypes:", 1);
    -[VKCImageAnalysisInteraction setAllowLongPressForDataDetectorsInTextMode:](v42, "setAllowLongPressForDataDetectorsInTextMode:", 0);
    -[VKTextLiftingView setImageInteraction:](v41, "setImageInteraction:", v42);
    -[VKKeyboardCameraViewController closestItem](self, "closestItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "transcript");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraViewController setLiftedString:](self, "setLiftedString:", v44);

    -[VKCImageAnalysisInteraction baseView](v42, "baseView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "textSelectionView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:selector:name:object:", self, sel_onSelectionChanged_, CFSTR("VKCImageTextSelectionViewSelectionDidChange"), v46);

    -[VKKeyboardCameraViewController hitTestView](self, "hitTestView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:aboveSubview:", v41, v48);

    -[VKTextLiftingView performLiftAnimation](v41, "performLiftAnimation");
    -[VKKeyboardCameraViewController setTextLiftingView:](self, "setTextLiftingView:", v41);
    -[VKKeyboardCameraViewController setIsTextLifted:](self, "setIsTextLifted:", 1);

  }
  else
  {
    v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[VKKeyboardCameraViewController liftTextWithSnapshot:].cold.1();
  }

  return v5 != 0;
}

- (void)cancelTimeWithoutTextTimer
{
  void *v3;
  void *v4;

  -[VKKeyboardCameraViewController guidanceView](self, "guidanceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideGuidance");

  -[VKKeyboardCameraViewController timeWithoutTextTimer](self, "timeWithoutTextTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[VKKeyboardCameraViewController setTimeWithoutTextTimer:](self, "setTimeWithoutTextTimer:", 0);
}

- (void)startTimeWithoutTextTimer
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[VKKeyboardCameraViewController timeWithoutTextTimer](self, "timeWithoutTextTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__VKKeyboardCameraViewController_startTimeWithoutTextTimer__block_invoke;
    v5[3] = &unk_1E9462608;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraViewController setTimeWithoutTextTimer:](self, "setTimeWithoutTextTimer:", v4);

  }
}

void __59__VKKeyboardCameraViewController_startTimeWithoutTextTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  VKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "findTextLocalizedStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "findTextLocalizedStringKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, CFSTR("Localizable"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "guidanceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showGuidanceWithText:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setTimeWithoutTextTimer:", 0);
}

- (void)resetToDefaultComparisonPoint
{
  double Height;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  -[VKKeyboardCameraViewController setDidOverrideComparisonPoint:](self, "setDidOverrideComparisonPoint:", 0);
  -[VKKeyboardCameraViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Height = CGRectGetHeight(v12);
  if (Height > 0.0)
  {
    v4 = Height;
    -[VKKeyboardCameraViewController insertButton](self, "insertButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v11, "convertRect:fromView:", v5);
    v6 = (v4 - CGRectGetMaxY(v13)) / v4 + 0.5;
    -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setComparisonPoint:", 0.5, v6);

    -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setComparisonPoint:", 0.5, v6);

  }
}

- (unint64_t)dataType
{
  void *v2;
  unint64_t v3;

  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBD00]) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBC70]) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBD08]) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBC58]) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBC68]) & 1) != 0)
  {
    v3 = 7;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBCE0]) & 1) != 0)
  {
    v3 = 8;
  }
  else if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEBC50]))
  {
    v3 = 5;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)findTextLocalizedStringKey
{
  void *v3;
  void *v4;
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

  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0CEBD00];

  if (v3 == v4)
    return CFSTR("KC_NO_PHONE_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0CEBC70];

  if (v5 == v6)
    return CFSTR("KC_NO_ADDRESS_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0CEBD08];

  if (v7 == v8)
    return CFSTR("KC_NO_URL_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0CEBC58];

  if (v9 == v10)
    return CFSTR("KC_NO_EMAIL_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0CEBC68];

  if (v11 == v12)
    return CFSTR("KC_NO_FLIGHT_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0CEBCE0];

  if (v13 == v14)
    return CFSTR("KC_NO_TRACKING_HELP");
  -[VKKeyboardCameraViewController textContentType](self, "textContentType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0CEBC50];

  if (v15 == v16)
    return CFSTR("KC_NO_DATETIME_HELP");
  else
    return CFSTR("KC_NO_TEXT_HELP");
}

- (void)textProcessorResult:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  _QWORD v46[5];

  v4 = a3;
  if (!-[VKKeyboardCameraViewController didDismiss](self, "didDismiss"))
  {
    -[VKKeyboardCameraViewController frameProvider](self, "frameProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isProcessing");

    if (v6)
    {
      objc_msgSend(v4, "allItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[VKKeyboardCameraViewController closestItem](self, "closestItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
        {
          -[VKKeyboardCameraViewController setClosestItem:](self, "setClosestItem:", v8);
          if (-[VKKeyboardCameraViewController didOverrideComparisonPoint](self, "didOverrideComparisonPoint"))
          {
            -[VKKeyboardCameraViewController view](self, "view");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "bounds");
            v12 = v11;
            v14 = v13;
            v16 = v15;
            -[VKKeyboardCameraViewController closestItem](self, "closestItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "layerQuad");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "vertexCentroid");

            VKMFlipPoint();
            v21 = VKMNormalizedPointInRect(v19, v20, v12, v14, v16);
            v23 = v22;
            -[VKKeyboardCameraViewController textProcessor](self, "textProcessor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "configuration");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setComparisonPoint:", v21, v23);

            -[VKKeyboardCameraViewController optFlowTextProcessor](self, "optFlowTextProcessor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "configuration");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setComparisonPoint:", v21, v23);

          }
        }
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __54__VKKeyboardCameraViewController_textProcessorResult___block_invoke;
        v46[3] = &unk_1E94625B8;
        v46[4] = self;
        -[VKKeyboardCameraViewController animate:](self, "animate:", v46);
        objc_msgSend(v8, "layerQuad");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "minimumBoundingRectWithoutRotation");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(v28, "averagedAngleFromBottomAndTopEdges");
        v38 = v37;
        -[VKKeyboardCameraViewController reticleView](self, "reticleView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setReticleRect:angle:", v30, v32, v34, v36, v38);

        -[VKKeyboardCameraViewController cancelTimeWithoutTextTimer](self, "cancelTimeWithoutTextTimer");
      }
      else
      {
        -[VKKeyboardCameraViewController clearFoundItemAndRemoveLiftTextButton:](self, "clearFoundItemAndRemoveLiftTextButton:", 1);
        -[VKKeyboardCameraViewController startTimeWithoutTextTimer](self, "startTimeWithoutTextTimer");
      }
      -[VKKeyboardCameraViewController insertButton](self, "insertButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "uiButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setEnabled:", v8 != 0);

      objc_msgSend(v8, "transcript");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v42;
      v44 = &stru_1E94661A8;
      if (v42)
        v44 = (__CFString *)v42;
      v45 = v44;

      -[VKKeyboardCameraViewController updateInsertButtonWithRecognizedString:](self, "updateInsertButtonWithRecognizedString:", v45);
    }
  }

}

void __54__VKKeyboardCameraViewController_textProcessorResult___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "liftTextButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "reticleView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReticleAlpha:", 1.0);

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VKKeyboardCameraViewController request:didFailWithError:].cold.1((uint64_t)v4, v5);

}

- (void)request:(id)a3 didRecgonizeTextWithAnalysis:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  if (-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted")
    && (-[VKKeyboardCameraViewController textLiftingView](self, "textLiftingView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[VKKeyboardCameraViewController textLiftingView](self, "textLiftingView");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject imageInteraction](v7, "imageInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnalysis:", v5);

  }
  else
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VKKeyboardCameraViewController request:didRecgonizeTextWithAnalysis:].cold.1();
  }

}

- (void)animateAlongsideTextLiftingForView:(id)a3
{
  void *v4;
  id v5;

  -[VKKeyboardCameraViewController reticleView](self, "reticleView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReticleAlpha:", 0.0);

  -[VKKeyboardCameraViewController reticleView](self, "reticleView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvertedShadowAlpha:", 0.5);

}

- (void)textLiftingAnimationDidEndForView:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 2000000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__VKKeyboardCameraViewController_textLiftingAnimationDidEndForView___block_invoke;
  v4[3] = &unk_1E9462630;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__VKKeyboardCameraViewController_textLiftingAnimationDidEndForView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "guidanceView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hideGuidance");

    WeakRetained = v3;
  }

}

- (void)animateAlongsideFadeOutForTextLiftingView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[VKKeyboardCameraViewController reticleView](self, "reticleView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  +[VKKeyboardCameraDefaults sharedInstance](VKKeyboardCameraDefaults, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleForKey:", CFSTR("DimmingOpacity"));
  v6 = v5;
  -[VKKeyboardCameraViewController reticleView](self, "reticleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvertedShadowAlpha:", v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[VKKeyboardCameraViewController isTextLifted](self, "isTextLifted")
    && !-[VKKeyboardCameraViewController isPinchToZoomInProgress](self, "isPinchToZoomInProgress"))
  {
    if (a4 < 2)
    {
      if (a4 == 1 && objc_msgSend(v10, "isProcessing"))
      {
        objc_msgSend(v10, "stopProcessing");
        -[VKKeyboardCameraViewController clearFoundItemAndRemoveLiftTextButton:](self, "clearFoundItemAndRemoveLiftTextButton:", 1);
        -[VKKeyboardCameraViewController updateInsertButtonWithRecognizedString:](self, "updateInsertButtonWithRecognizedString:", &stru_1E94661A8);
        VKBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("KC_STABILITY_HELP"), CFSTR("KC_STABILITY_HELP"), CFSTR("Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[VKKeyboardCameraViewController guidanceView](self, "guidanceView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "showGuidanceWithText:", v8);

      }
    }
    else if ((objc_msgSend(v10, "isProcessing") & 1) == 0)
    {
      -[VKKeyboardCameraViewController guidanceView](self, "guidanceView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hideGuidance");

      objc_msgSend(v10, "startProcessing");
    }
  }

}

- (VKKeyboardCameraViewControllerDelegate)delegate
{
  return (VKKeyboardCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (VKAVCaptureFrameProvider)frameProvider
{
  return self->_frameProvider;
}

- (void)setFrameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_frameProvider, a3);
}

- (VKTextFrameProcessor)textProcessor
{
  return self->_textProcessor;
}

- (void)setTextProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_textProcessor, a3);
}

- (VKTextWithTrackingFrameProcessor)optFlowTextProcessor
{
  return self->_optFlowTextProcessor;
}

- (void)setOptFlowTextProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_optFlowTextProcessor, a3);
}

- (VKHomographyFrameProcessor)homographyProcessor
{
  return self->_homographyProcessor;
}

- (void)setHomographyProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_homographyProcessor, a3);
}

- (UIView)hitTestView
{
  return self->_hitTestView;
}

- (void)setHitTestView:(id)a3
{
  objc_storeStrong((id *)&self->_hitTestView, a3);
}

- (VKKeyboardCameraCloseButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (VKTextLiftingView)textLiftingView
{
  return self->_textLiftingView;
}

- (void)setTextLiftingView:(id)a3
{
  objc_storeStrong((id *)&self->_textLiftingView, a3);
}

- (VKKeyboardCameraInsertButton)insertButton
{
  return self->_insertButton;
}

- (void)setInsertButton:(id)a3
{
  objc_storeStrong((id *)&self->_insertButton, a3);
}

- (VKImageAnalysisButton)liftTextButton
{
  return self->_liftTextButton;
}

- (void)setLiftTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_liftTextButton, a3);
}

- (VKKeyboardCameraGuidanceView)guidanceView
{
  return self->_guidanceView;
}

- (void)setGuidanceView:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceView, a3);
}

- (VKKeyboardCameraReticleView)reticleView
{
  return self->_reticleView;
}

- (void)setReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_reticleView, a3);
}

- (BOOL)didSetInitialComparisonPoint
{
  return self->_didSetInitialComparisonPoint;
}

- (void)setDidSetInitialComparisonPoint:(BOOL)a3
{
  self->_didSetInitialComparisonPoint = a3;
}

- (BOOL)didOverrideComparisonPoint
{
  return self->_didOverrideComparisonPoint;
}

- (void)setDidOverrideComparisonPoint:(BOOL)a3
{
  self->_didOverrideComparisonPoint = a3;
}

- (VKRecognizedText)closestItem
{
  return self->_closestItem;
}

- (void)setClosestItem:(id)a3
{
  objc_storeStrong((id *)&self->_closestItem, a3);
}

- (NSString)previousString
{
  return self->_previousString;
}

- (void)setPreviousString:(id)a3
{
  objc_storeStrong((id *)&self->_previousString, a3);
}

- (NSString)liftedString
{
  return self->_liftedString;
}

- (void)setLiftedString:(id)a3
{
  objc_storeStrong((id *)&self->_liftedString, a3);
}

- (BOOL)didDismiss
{
  return self->_didDismiss;
}

- (void)setDidDismiss:(BOOL)a3
{
  self->_didDismiss = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (NSTimer)timeWithoutTextTimer
{
  return self->_timeWithoutTextTimer;
}

- (void)setTimeWithoutTextTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeWithoutTextTimer, a3);
}

- (VKCaptureTextAnalyzer)textAnalyzer
{
  return self->_textAnalyzer;
}

- (void)setTextAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_textAnalyzer, a3);
}

- (BOOL)isTextLifted
{
  return self->_isTextLifted;
}

- (void)setIsTextLifted:(BOOL)a3
{
  self->_isTextLifted = a3;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (double)initialPinchZoom
{
  return self->_initialPinchZoom;
}

- (void)setInitialPinchZoom:(double)a3
{
  self->_initialPinchZoom = a3;
}

- (BOOL)isPinchToZoomInProgress
{
  return self->_isPinchToZoomInProgress;
}

- (void)setIsPinchToZoomInProgress:(BOOL)a3
{
  self->_isPinchToZoomInProgress = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (VKFeedbackProvider)feedbackProvider
{
  return self->_feedbackProvider;
}

- (void)setFeedbackProvider:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackProvider, a3);
}

- (NSMutableArray)dataForRadar
{
  return self->_dataForRadar;
}

- (void)setDataForRadar:(id)a3
{
  objc_storeStrong((id *)&self->_dataForRadar, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialRecordingTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1160);
  return self;
}

- (void)setInitialRecordingTimestamp:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_initialRecordingTimestamp.value = *(_OWORD *)&a3->var0;
  self->_initialRecordingTimestamp.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForRadar, 0);
  objc_storeStrong((id *)&self->_feedbackProvider, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textAnalyzer, 0);
  objc_storeStrong((id *)&self->_timeWithoutTextTimer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_liftedString, 0);
  objc_storeStrong((id *)&self->_previousString, 0);
  objc_storeStrong((id *)&self->_closestItem, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_guidanceView, 0);
  objc_storeStrong((id *)&self->_liftTextButton, 0);
  objc_storeStrong((id *)&self->_insertButton, 0);
  objc_storeStrong((id *)&self->_textLiftingView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_hitTestView, 0);
  objc_storeStrong((id *)&self->_homographyProcessor, 0);
  objc_storeStrong((id *)&self->_optFlowTextProcessor, 0);
  objc_storeStrong((id *)&self->_textProcessor, 0);
  objc_storeStrong((id *)&self->_frameProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Error lifting text", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Error creating snapshot image for lifting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liftTextWithSnapshot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to lift text without a closest-item.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)request:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Error analyzing image for lifted text. %@", (uint8_t *)&v2, 0xCu);
}

- (void)request:didRecgonizeTextWithAnalysis:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Image analysis finished but text isn't lifted or there isn't a lifting-view.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
