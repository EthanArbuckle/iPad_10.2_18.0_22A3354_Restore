@implementation PXVideoComparisonViewController

- (PXVideoComparisonViewController)initWithInputAsset:(id)a3
{
  id v5;
  PXVideoComparisonViewController *v6;
  PXVideoComparisonViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoComparisonViewController;
  v6 = -[PXVideoComparisonViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputAsset, a3);
    v7->_videoRequestID = 0;
    v7->_useVariantVideoByDefaultInToggle = 0;
  }

  return v7;
}

- (PXVideoComparisonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoComparisonViewController.m"), 64, CFSTR("%s is not available as initializer"), "-[PXVideoComparisonViewController initWithNibName:bundle:]");

  abort();
}

- (PXVideoComparisonViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoComparisonViewController.m"), 68, CFSTR("%s is not available as initializer"), "-[PXVideoComparisonViewController initWithCoder:]");

  abort();
}

- (void)viewDidLoad
{
  ISWrappedAVPlayer *v3;
  ISWrappedAVPlayer *videoPlayer;
  void *v5;
  void *v6;
  PXVideoPlayerView *v7;
  PXVideoPlayerView *videoView;
  ISWrappedAVPlayer *v9;
  void *v10;
  UIProgressView *v11;
  UIProgressView *progressView;
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
  UIVisualEffectView *v27;
  UIVisualEffectView *statusBackgroundView;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UILabel *v44;
  UILabel *statusLabel;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  UISegmentedControl *v53;
  UISegmentedControl *variantSegmentedControl;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[2];
  _QWORD v70[4];
  _QWORD v71[4];

  v71[3] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)PXVideoComparisonViewController;
  -[PXVideoComparisonViewController viewDidLoad](&v68, sel_viewDidLoad);
  v3 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E0D78298]);
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v3;

  -[PXVideoComparisonViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = objc_alloc_init(PXVideoPlayerView);
  videoView = self->_videoView;
  self->_videoView = v7;

  objc_msgSend(v5, "bounds");
  -[PXVideoPlayerView setFrame:](self->_videoView, "setFrame:");
  -[PXVideoPlayerView setAutoresizingMask:](self->_videoView, "setAutoresizingMask:", 18);
  -[PXVideoPlayerView setVideoViewContentMode:](self->_videoView, "setVideoViewContentMode:", 1);
  -[PXVideoPlayerView setPlayer:](self->_videoView, "setPlayer:", self->_videoPlayer);
  v9 = self->_videoPlayer;
  objc_msgSend(MEMORY[0x1E0D78290], "sharedAmbientInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISWrappedAVPlayer setWrappedAudioSession:](v9, "setWrappedAudioSession:", v10);

  objc_msgSend(v5, "addSubview:", self->_videoView);
  v11 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
  progressView = self->_progressView;
  self->_progressView = v11;

  objc_msgSend(v5, "addSubview:", self->_progressView);
  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIProgressView topAnchor](self->_progressView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIProgressView leftAnchor](self->_progressView, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIProgressView rightAnchor](self->_progressView, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3718];
  v71[0] = v16;
  v71[1] = v20;
  v71[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v67);
  statusBackgroundView = self->_statusBackgroundView;
  self->_statusBackgroundView = v27;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_statusBackgroundView);
  -[UIVisualEffectView topAnchor](self->_statusBackgroundView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressView bottomAnchor](self->_progressView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 10.0);
  v31 = objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView leftAnchor](self->_statusBackgroundView, "leftAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 50.0);
  v35 = objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView rightAnchor](self->_statusBackgroundView, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, -50.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView heightAnchor](self->_statusBackgroundView, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", 40.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0CB3718];
  v65 = (void *)v35;
  v66 = (void *)v31;
  v70[0] = v31;
  v70[1] = v35;
  v70[2] = v39;
  v70[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v43);

  -[UIVisualEffectView setAlpha:](self->_statusBackgroundView, "setAlpha:", 0.0);
  v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v44;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_statusLabel, "setTextColor:", v46);

  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 1);
  -[UILabel setAutoresizingMask:](self->_statusLabel, "setAutoresizingMask:", 18);
  -[UIVisualEffectView bounds](self->_statusBackgroundView, "bounds");
  -[UILabel setFrame:](self->_statusLabel, "setFrame:");
  -[UIVisualEffectView contentView](self->_statusBackgroundView, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", self->_statusLabel);

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__handleActionButton_);
  v49 = objc_alloc(MEMORY[0x1E0DC3C58]);
  -[PXVideoComparisonViewController inputVideoButtonsTitle](self, "inputVideoButtonsTitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v50;
  -[PXVideoComparisonViewController variantVideoButtonsTitle](self, "variantVideoButtonsTitle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (UISegmentedControl *)objc_msgSend(v49, "initWithItems:", v52);
  variantSegmentedControl = self->_variantSegmentedControl;
  self->_variantSegmentedControl = v53;

  -[UISegmentedControl setSelectedSegmentIndex:](self->_variantSegmentedControl, "setSelectedSegmentIndex:", -[PXVideoComparisonViewController useVariantVideoByDefaultInToggle](self, "useVariantVideoByDefaultInToggle"));
  -[UISegmentedControl addTarget:action:forControlEvents:](self->_variantSegmentedControl, "addTarget:action:forControlEvents:", self, sel__handleVariantSegmentedControl_, 4096);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_variantSegmentedControl);
  -[PXVideoComparisonViewController navigationItem](self, "navigationItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setRightBarButtonItem:", v55);

  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PXVideoComparisonViewController settings](self, "settings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v59 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gear"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v59, "initWithImage:style:target:action:", v60, 0, self, sel__handleSettingsButton_);

  }
  v61 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithImage:style:target:action:", v62, 0, self, sel__handleResultButton_);

  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v64, "addObject:", v48);
  if (v58)
  {
    objc_msgSend(v64, "addObject:", v57);
    objc_msgSend(v64, "addObject:", v58);
  }
  objc_msgSend(v64, "addObject:", v57);
  objc_msgSend(v64, "addObject:", v63);
  -[PXVideoComparisonViewController setToolbarItems:](self, "setToolbarItems:", v64);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXVideoComparisonViewController;
  -[PXVideoComparisonViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PXVideoComparisonViewController _reloadInputAndVariantVideos](self, "_reloadInputAndVariantVideos");
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (void)_handleSettingsButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXVideoComparisonViewController settings](self, "settings", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83120]), "initWithRootSettings:", v7);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleSettingsDone_);
    objc_msgSend(v4, "setDismissButton:", v5);

    objc_msgSend(v4, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[PXVideoComparisonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

- (void)_handleSettingsDone:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PXVideoComparisonViewController__handleSettingsDone___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXVideoComparisonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)_handleActionButton:(id)a3
{
  void *v4;
  uint64_t v5;
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
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke;
  v19[3] = &unk_1E5144530;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PXVideoComparisonViewController inputVideoButtonsTitle](self, "inputVideoButtonsTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Export %@ Video"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke_2;
  v18[3] = &unk_1E5144530;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v9, 0, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[PXVideoComparisonViewController variantVideoButtonsTitle](self, "variantVideoButtonsTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Export %@ Video"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __55__PXVideoComparisonViewController__handleActionButton___block_invoke_3;
  v17[3] = &unk_1E5144530;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 0, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v14);

  -[PXVideoComparisonViewController extraAlertAction](self, "extraAlertAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "addAction:", v15);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v16);

  -[PXVideoComparisonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)_handleResultButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  if (-[UISegmentedControl selectedSegmentIndex](self->_variantSegmentedControl, "selectedSegmentIndex", a3))
    -[PXVideoComparisonViewController variantVideoDescription](self, "variantVideoDescription");
  else
    -[PXVideoComparisonViewController inputVideoDescription](self, "inputVideoDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3F20];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PXVideoComparisonViewController__handleResultButton___block_invoke;
  v8[3] = &unk_1E5136628;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "px_viewControllerWithOutput:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoComparisonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_showAlertWithMessage:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error"), a3, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

  -[PXVideoComparisonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_fileRadar
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PXVideoComparisonViewController__fileRadar__block_invoke;
  v2[3] = &unk_1E5132048;
  v2[4] = self;
  -[PXVideoComparisonViewController _exportVariantVideoWithCompletionHandler:](self, "_exportVariantVideoWithCompletionHandler:", v2);
}

- (void)_exportInputVideo
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_inputVideoURL)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    v6[0] = self->_inputVideoURL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v4, 0);

    -[PXVideoComparisonViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
}

- (void)_exportVariantVideo
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PXVideoComparisonViewController__exportVariantVideo__block_invoke;
  v3[3] = &unk_1E5132070;
  objc_copyWeak(&v4, &location);
  -[PXVideoComparisonViewController _exportVariantVideoWithCompletionHandler:](self, "_exportVariantVideoWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_exportVariantVideoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXVideoComparisonViewController variantVideoButtonsTitle](self, "variantVideoButtonsTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Preparing %@ Video for Export"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = 0;
  -[PXVideoComparisonViewController _updateProgress:status:](self, "_updateProgress:status:", v7, v8);
  -[PXVideoComparisonViewController _showProgressAndStatus](self, "_showProgressAndStatus");
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5132098;
  objc_copyWeak(&v15, &location);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E51320C0;
  v10 = v4;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  -[PXVideoComparisonViewController prepareVariantVideoForExportWithProgress:completion:](self, "prepareVariantVideoForExportWithProgress:completion:", v14, v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_hideProgressAndStatus
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__PXVideoComparisonViewController__hideProgressAndStatus__block_invoke;
  v2[3] = &unk_1E5149198;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.1);
}

- (void)_showProgressAndStatus
{
  double v2;
  _QWORD v4[5];

  LODWORD(v2) = 0;
  -[UIProgressView setProgress:](self->_progressView, "setProgress:", v2);
  -[UILabel setText:](self->_statusLabel, "setText:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PXVideoComparisonViewController__showProgressAndStatus__block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.1);
}

- (void)_updateProgress:(float)a3 status:(id)a4
{
  UIProgressView *progressView;
  double v7;
  id v8;

  progressView = self->_progressView;
  v8 = a4;
  *(float *)&v7 = a3;
  -[UIProgressView setProgress:](progressView, "setProgress:", v7);
  -[UILabel setText:](self->_statusLabel, "setText:", v8);

}

- (void)_reloadInputAndVariantVideos
{
  -[PXVideoComparisonViewController _showProgressAndStatus](self, "_showProgressAndStatus");
  -[PXVideoComparisonViewController invalidateInputAndVariantReferences](self, "invalidateInputAndVariantReferences");
  -[PXVideoComparisonViewController _prepareInputAndVariantVideos](self, "_prepareInputAndVariantVideos");
}

- (void)_prepareInputAndVariantVideos
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXVideoComparisonViewController inputVideoButtonsTitle](self, "inputVideoButtonsTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Loading %@ Video"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = 1036831949;
  -[PXVideoComparisonViewController _updateProgress:status:](self, "_updateProgress:status:", v5, v6);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelImageRequest:", -[PXVideoComparisonViewController videoRequestID](self, "videoRequestID"));

  -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPropertySetsIfNeeded");
  v9 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v9, "setVideoComplementAllowed:", 1);
  objc_msgSend(v9, "setStreamingAllowed:", 0);
  objc_initWeak(&location, self);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke;
  v12[3] = &unk_1E51320E8;
  v12[4] = &v14;
  objc_copyWeak(&v13, &location);
  v11 = objc_msgSend(v10, "requestURLForVideo:options:resultHandler:", v8, v9, v12);

  *((_DWORD *)v15 + 6) = v11;
  -[PXVideoComparisonViewController setVideoRequestID:](self, "setVideoRequestID:", v11);
  _Block_object_dispose(&v14, 8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_prepareVariantVideo
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXVideoComparisonViewController variantVideoButtonsTitle](self, "variantVideoButtonsTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Loading %@ Video"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = 0.5;
  -[PXVideoComparisonViewController _updateProgress:status:](self, "_updateProgress:status:", v5, v6);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke;
  v10[3] = &unk_1E5132098;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke_2;
  v8[3] = &unk_1E5132110;
  objc_copyWeak(&v9, &location);
  -[PXVideoComparisonViewController prepareVariantVideoWithProgress:completion:](self, "prepareVariantVideoWithProgress:completion:", v10, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_updateDisplayedPlayerItem
{
  void *v3;
  id v4;

  if (-[UISegmentedControl selectedSegmentIndex](self->_variantSegmentedControl, "selectedSegmentIndex"))
  {
    -[PXVideoComparisonViewController variantPlayerItem](self, "variantPlayerItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXVideoComparisonViewController variantVideoError](self, "variantVideoError");
  }
  else
  {
    -[PXVideoComparisonViewController inputPlayerItem](self, "inputPlayerItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXVideoComparisonViewController inputVideoError](self, "inputVideoError");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoComparisonViewController _updatePlayerItem:error:](self, "_updatePlayerItem:error:", v4, v3);

}

- (void)_updatePlayerItem:(id)a3 error:(id)a4
{
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a4;
  -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:](self->_videoPlayer, "replaceCurrentItemWithPlayerItem:", a3);
  LODWORD(v6) = 1.0;
  -[ISWrappedAVPlayer setRate:](self->_videoPlayer, "setRate:", v6);
  v7 = v11;
  if (v11)
  {
    objc_msgSend(v11, "description");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = CFSTR("Unable to display video – no error passed");
    -[PXVideoComparisonViewController _showAlertWithMessage:](self, "_showAlertWithMessage:", v10);

    v7 = v11;
  }

}

- (NSString)inputVideoDescription
{
  void *v2;
  void *v3;

  -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)variantVideoDescription
{
  return 0;
}

- (NSString)inputVideoButtonsTitle
{
  return (NSString *)CFSTR("A");
}

- (NSString)variantVideoButtonsTitle
{
  return (NSString *)CFSTR("B");
}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoComparisonViewController.m"), 404, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoComparisonViewController prepareVariantVideoWithProgress:completion:]", v11);

  abort();
}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoComparisonViewController.m"), 408, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoComparisonViewController prepareVariantVideoForExportWithProgress:completion:]", v11);

  abort();
}

- (void)invalidateInputAndVariantReferences
{
  void *v3;

  -[PXVideoComparisonViewController setInputVideoURL:](self, "setInputVideoURL:", 0);
  -[PXVideoComparisonViewController setInputPlayerItem:](self, "setInputPlayerItem:", 0);
  -[PXVideoComparisonViewController setInputVideoError:](self, "setInputVideoError:", 0);
  -[PXVideoComparisonViewController setVariantPlayerItem:](self, "setVariantPlayerItem:", 0);
  -[PXVideoComparisonViewController setVariantVideoError:](self, "setVariantVideoError:", 0);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PXVideoComparisonViewController videoRequestID](self, "videoRequestID"));

  -[PXVideoComparisonViewController setVideoRequestID:](self, "setVideoRequestID:", 0);
}

- (PHAsset)inputAsset
{
  return self->_inputAsset;
}

- (NSURL)inputVideoURL
{
  return self->_inputVideoURL;
}

- (void)setInputVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_inputVideoURL, a3);
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return self->_useVariantVideoByDefaultInToggle;
}

- (UIAlertAction)extraAlertAction
{
  return self->_extraAlertAction;
}

- (PXSettings)settings
{
  return self->_settings;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)radarClassification
{
  return self->_radarClassification;
}

- (NSString)radarComponentID
{
  return self->_radarComponentID;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (AVPlayerItem)inputPlayerItem
{
  return self->_inputPlayerItem;
}

- (void)setInputPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_inputPlayerItem, a3);
}

- (NSError)inputVideoError
{
  return self->_inputVideoError;
}

- (void)setInputVideoError:(id)a3
{
  objc_storeStrong((id *)&self->_inputVideoError, a3);
}

- (int)videoRequestID
{
  return self->_videoRequestID;
}

- (void)setVideoRequestID:(int)a3
{
  self->_videoRequestID = a3;
}

- (AVPlayerItem)variantPlayerItem
{
  return self->_variantPlayerItem;
}

- (void)setVariantPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_variantPlayerItem, a3);
}

- (NSError)variantVideoError
{
  return self->_variantVideoError;
}

- (void)setVariantVideoError:(id)a3
{
  objc_storeStrong((id *)&self->_variantVideoError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantVideoError, 0);
  objc_storeStrong((id *)&self->_variantPlayerItem, 0);
  objc_storeStrong((id *)&self->_inputVideoError, 0);
  objc_storeStrong((id *)&self->_inputPlayerItem, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarClassification, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_extraAlertAction, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_statusBackgroundView, 0);
  objc_storeStrong((id *)&self->_variantSegmentedControl, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

void __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke(uint64_t a1, void *a2, float a3)
{
  id *v4;
  id v5;
  double v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  *(float *)&v6 = a3;
  objc_msgSend(WeakRetained, "_updateProgress:status:", v5, v6);

}

void __55__PXVideoComparisonViewController__prepareVariantVideo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setVariantPlayerItem:", v6);

  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "setVariantVideoError:", v5);

  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "_hideProgressAndStatus");

  v10 = objc_loadWeakRetained(v4);
  objc_msgSend(v10, "_updateDisplayedPlayerItem");

}

void __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v8);
}

void __64__PXVideoComparisonViewController__prepareInputAndVariantVideos__block_invoke_2(uint64_t a1)
{
  int v2;
  id *v3;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CMTimeRange v15;
  CMTime start;
  CMTime duration;
  CMTimeRange v18;

  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend(WeakRetained, "videoRequestID");

  if (v2 == v5)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "duration");
      else
        memset(&duration, 0, sizeof(duration));
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      CMTimeRangeMake(&v18, &start, &duration);
      v15 = v18;
      objc_msgSend(v6, "setLoopTimeRange:", &v15);

      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to URL for Input Video"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_loadWeakRetained(v3);
    objc_msgSend(v11, "setInputVideoURL:", v10);

    v12 = objc_loadWeakRetained(v3);
    objc_msgSend(v12, "setInputPlayerItem:", v6);

    v13 = objc_loadWeakRetained(v3);
    objc_msgSend(v13, "setInputVideoError:", v9);

    v14 = objc_loadWeakRetained(v3);
    objc_msgSend(v14, "_prepareVariantVideo");

  }
}

uint64_t __57__PXVideoComparisonViewController__showProgressAndStatus__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 1.0);
}

uint64_t __57__PXVideoComparisonViewController__hideProgressAndStatus__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 0.0);
}

void __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, float a3)
{
  id *v4;
  id v5;
  double v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  *(float *)&v6 = a3;
  objc_msgSend(WeakRetained, "_updateProgress:status:", v5, v6);

}

void __76__PXVideoComparisonViewController__exportVariantVideoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_hideProgressAndStatus");

}

void __54__PXVideoComparisonViewController__exportVariantVideo__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!a2 || v6)
  {
    v14 = a2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "description");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("<empty>");
    if (v17)
      v19 = (const __CFString *)v17;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Export failed with error: %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_showAlertWithMessage:", v20);
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x1E0D96D28];
    v9 = a2;
    v10 = [v8 alloc];
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v11, 0);
    v13 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

void __45__PXVideoComparisonViewController__fileRadar__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  PXFeedbackTapToRadarViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if (v12)
  {
    v13 = objc_alloc_init(PXFeedbackTapToRadarViewController);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__PXVideoComparisonViewController__fileRadar__block_invoke_2;
    v20[3] = &unk_1E5147460;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    v22 = v8;
    -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v13, "setFileRadarHandler:", v20);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 1, 0);

  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "description");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("<empty>");
    if (v16)
      v18 = (const __CFString *)v16;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Export failed with error: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_showAlertWithMessage:", v19);

  }
}

void __45__PXVideoComparisonViewController__fileRadar__block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v28[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(*(id *)(a1 + 32), "radarTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarClassification");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("Other Bug");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "radarComponentID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("937049");
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 32), "radarComponentName");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = CFSTR("Photos UI Library");
  if (v17)
    v19 = (__CFString *)v17;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 32), "radarComponentVersion");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = CFSTR("iOS");
  if (v21)
    v23 = (__CFString *)v21;
  v24 = v23;

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v25;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v25, "addObject:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v26, "addObject:");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032))
    objc_msgSend(v26, "addObject:");
  LOWORD(v27) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, &stru_1E5149688, v12, v16, v20, v24, 0, 0, v26, v27, v7, 0);

}

__CFString *__55__PXVideoComparisonViewController__handleResultButton___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (__CFString *)*(id *)(a1 + 32);
  else
    return &stru_1E5149688;
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadar");
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exportInputVideo");
}

uint64_t __55__PXVideoComparisonViewController__handleActionButton___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exportVariantVideo");
}

uint64_t __55__PXVideoComparisonViewController__handleSettingsDone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadInputAndVariantVideos");
}

@end
