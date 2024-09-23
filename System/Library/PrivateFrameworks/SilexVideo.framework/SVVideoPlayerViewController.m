@implementation SVVideoPlayerViewController

- (SVVideoPlayerViewController)init
{
  SVVideoPlayerViewController *v2;
  AVPlayerViewController *v3;
  AVPlayerViewController *playerViewController;
  SVAutomaticFullscreenVideoPlaybackBehaviorManager *v5;
  SVAutomaticFullscreenVideoPlaybackBehaviorManager *fullscreenBehaviorManager;
  SVKeyValueObserver *v7;
  AVPlayerViewController *v8;
  uint64_t v9;
  SVKeyValueObserver *videoBoundsObserver;
  SVLearnMoreButton *v11;
  SVLearnMoreButton *learnMoreButton;
  SVVideoAdSkipButton *v13;
  SVVideoAdSkipButton *skipButton;
  uint64_t v15;
  UIActivityIndicatorView *activityIndicatorView;
  uint64_t v17;
  UIGestureRecognizer *tapGesture;
  SVAdGradientView *v19;
  SVAdGradientView *adGradientView;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SVVideoPlayerViewController;
  v2 = -[SVVideoPlayerViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v3 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x24BDB27C0]);
    playerViewController = v2->_playerViewController;
    v2->_playerViewController = v3;

    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](v2->_playerViewController, "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController setModalPresentationStyle:](v2->_playerViewController, "setModalPresentationStyle:", 5);
    -[AVPlayerViewController setDelegate:](v2->_playerViewController, "setDelegate:", v2);
    -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](v2->_playerViewController, "setUpdatesNowPlayingInfoCenter:", 0);
    v5 = objc_alloc_init(SVAutomaticFullscreenVideoPlaybackBehaviorManager);
    fullscreenBehaviorManager = v2->_fullscreenBehaviorManager;
    v2->_fullscreenBehaviorManager = v5;

    -[SVAutomaticFullscreenVideoPlaybackBehaviorManager setDelegate:](v2->_fullscreenBehaviorManager, "setDelegate:", v2);
    objc_initWeak(&location, v2->_fullscreenBehaviorManager);
    v7 = [SVKeyValueObserver alloc];
    v8 = v2->_playerViewController;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __35__SVVideoPlayerViewController_init__block_invoke;
    v25 = &unk_24DBC23B8;
    objc_copyWeak(&v26, &location);
    v9 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v7, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("videoBounds"), v8, 1, &v22);
    videoBoundsObserver = v2->_videoBoundsObserver;
    v2->_videoBoundsObserver = (SVKeyValueObserver *)v9;

    v11 = objc_alloc_init(SVLearnMoreButton);
    learnMoreButton = v2->_learnMoreButton;
    v2->_learnMoreButton = v11;

    -[SVLearnMoreButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_learnMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v22, v23, v24, v25);
    -[SVLearnMoreButton addTarget:action:forControlEvents:](v2->_learnMoreButton, "addTarget:action:forControlEvents:", v2, sel_learnMoreButtonTapped_, 64);
    -[SVLearnMoreButton setHidden:](v2->_learnMoreButton, "setHidden:", 1);
    v13 = objc_alloc_init(SVVideoAdSkipButton);
    skipButton = v2->_skipButton;
    v2->_skipButton = v13;

    -[SVVideoAdSkipButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SVVideoAdSkipButton addTarget:action:forControlEvents:](v2->_skipButton, "addTarget:action:forControlEvents:", v2, sel_adSkipButtonTapped_, 64);
    -[SVVideoAdSkipButton setHidden:](v2->_skipButton, "setHidden:", 1);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 0);
    activityIndicatorView = v2->_activityIndicatorView;
    v2->_activityIndicatorView = (UIActivityIndicatorView *)v15;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v2->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](v2->_activityIndicatorView, "setHidesWhenStopped:", 1);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v2, sel_tapped);
    tapGesture = v2->_tapGesture;
    v2->_tapGesture = (UIGestureRecognizer *)v17;

    -[UIGestureRecognizer setDelegate:](v2->_tapGesture, "setDelegate:", v2);
    v19 = objc_alloc_init(SVAdGradientView);
    adGradientView = v2->_adGradientView;
    v2->_adGradientView = v19;

    -[SVAdGradientView setTranslatesAutoresizingMaskIntoConstraints:](v2->_adGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SVAdGradientView setHidden:](v2->_adGradientView, "setHidden:", 1);
    v2->_showsPlaybackControls = 1;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__SVVideoPlayerViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "CGRectValue");
  objc_msgSend(WeakRetained, "setVideoBounds:");

}

- (void)loadView
{
  SVTouchAbsorbingView *v3;

  v3 = objc_alloc_init(SVTouchAbsorbingView);
  -[SVVideoPlayerViewController setView:](self, "setView:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHost:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SVVideoPlayerViewController;
  -[SVVideoPlayerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
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
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SVVideoPlayerViewController;
  -[SVVideoPlayerViewController viewDidLoad](&v33, sel_viewDidLoad);
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController addChildViewController:](self, "addChildViewController:", v3);

  -[SVVideoPlayerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v10, "setFrame:");

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didMoveToParentViewController:", self);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsPlaybackControls:", 0);

  -[SVVideoPlayerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  -[SVVideoPlayerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController activityIndicatorView](self, "activityIndicatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController tapGesture](self, "tapGesture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addGestureRecognizer:", v20);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "customControlsView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "customControlsView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentOverlayView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "customControlsView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAccessibilityElementsHidden:", 0);

  -[SVVideoPlayerViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setNeedsUpdateConstraints");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SVVideoPlayerViewController;
  -[SVVideoPlayerViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[SVVideoPlayerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

  }
}

- (void)updateViewConstraints
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
  objc_super v69;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animatedUnobscuredCenterAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportControlsAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -2.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 3.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -4.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

  }
  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -4.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[SVVideoPlayerViewController activityIndicatorView](self, "activityIndicatorView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[SVVideoPlayerViewController activityIndicatorView](self, "activityIndicatorView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "contentOverlayView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "contentOverlayView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "contentOverlayView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "contentOverlayView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  v69.receiver = self;
  v69.super_class = (Class)SVVideoPlayerViewController;
  -[SVVideoPlayerViewController updateViewConstraints](&v69, sel_updateViewConstraints);

}

- (void)playWithButtonTapped:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SVVideoPlayerViewController setupQueueIfNeeded](self, "setupQueueIfNeeded");
  -[SVVideoPlayerViewController setPlayButtonTapped:](self, "setPlayButtonTapped:", v3);
  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController startPlaybackForCoordinatorIfAllowed:](self, "startPlaybackForCoordinatorIfAllowed:", v6);

  }
  else
  {
    -[SVVideoPlayerViewController advance](self, "advance");
  }
}

- (void)pause
{
  void *v3;
  void *v4;
  id v5;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHost:", v4);

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pause");

}

- (void)enterFullscreenWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!-[SVVideoPlayerViewController isFullscreen](self, "isFullscreen"))
  {
    -[SVVideoPlayerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    objc_initWeak(&location, self);
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__SVVideoPlayerViewController_enterFullscreenWithCompletionBlock___block_invoke;
    v7[3] = &unk_24DBC2710;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "enterFullScreenAnimated:completionHandler:", 1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __66__SVVideoPlayerViewController_enterFullscreenWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFullscreen:", 1);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)exitFullscreenWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (-[SVVideoPlayerViewController isFullscreen](self, "isFullscreen"))
  {
    -[SVVideoPlayerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    objc_initWeak(&location, self);
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__SVVideoPlayerViewController_exitFullscreenWithCompletionBlock___block_invoke;
    v7[3] = &unk_24DBC2710;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "exitFullScreenAnimated:completionHandler:", 1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __65__SVVideoPlayerViewController_exitFullscreenWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFullscreen:", 0);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)startPictureInPictureIfPossible
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isPictureInPictureActive") & 1) != 0)
    goto LABEL_2;
  v3 = -[SVVideoPlayerViewController isPlaying](self, "isPlaying");

  if (v3 && !-[SVVideoPlayerViewController isFullscreen](self, "isFullscreen"))
  {
    if (objc_msgSend(MEMORY[0x24BDB27B0], "isPictureInPictureSupported"))
    {
      -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "allowsPictureInPicturePlayback")
        && -[SVVideoPlayerViewController enablePictureInPictureBehaviors](self, "enablePictureInPictureBehaviors")
        && -[SVVideoPlayerViewController mode](self, "mode") != 1)
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "userInterfaceIdiom");

        if (v6 != 5)
        {
          -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "startPictureInPicture");
LABEL_2:

          return;
        }
      }
      else
      {

      }
    }
    -[SVVideoPlayerViewController pause](self, "pause");
  }
}

- (void)stopPictureInPicture
{
  id v2;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPictureInPicture");

}

- (BOOL)isPlaying
{
  void *v2;
  BOOL v3;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 3;

  return v3;
}

- (BOOL)isLoading
{
  void *v2;
  BOOL v3;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 1;

  return v3;
}

- (BOOL)isPictureInPictureActive
{
  void *v2;
  char v3;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPictureInPictureActive");

  return v3;
}

- (void)addDebuggerAction:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDB2788];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithTitle:type:", CFSTR("Debugger"), 0);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ant.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  objc_msgSend(v6, "setAction:", v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController setCustomControlItems:](self->_playerViewController, "setCustomControlItems:", v8);

}

- (void)embedVideoPlayerIfNeeded
{
  void *v3;
  SVVideoPlayerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (SVVideoPlayerViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController addChildViewController:](self, "addChildViewController:", v5);

    -[SVVideoPlayerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v8);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v10, "setFrame:");

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didMoveToParentViewController:", self);

    -[SVVideoPlayerViewController view](self, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

  }
}

- (void)removeVideoPlayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromParentViewController");

  }
}

- (void)willUnload
{
  id v2;

  -[SVVideoPlayerViewController videoAd](self, "videoAd");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willUnload");

}

- (BOOL)isFullscreenInProgress
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  -[SVVideoPlayerViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SVVideoPlayerViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("AVFullScreenViewController"));
  return (char)v4;
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  -[AVPlayerViewController flashPlaybackControlsWithDuration:](self->_playerViewController, "flashPlaybackControlsWithDuration:", a3);
}

- (void)fullscreenBehaviorManagerRequiresFullscreenPlayback:(id)a3
{
  if (!-[SVVideoPlayerViewController isFullscreen](self, "isFullscreen", a3))
  {
    if (-[SVVideoPlayerViewController isPlaying](self, "isPlaying"))
      -[SVVideoPlayerViewController enterFullscreenWithCompletionBlock:](self, "enterFullscreenWithCompletionBlock:", 0);
  }
}

- (void)setFullscreenBehavior:(unint64_t)a3
{
  id v4;

  if (self->_fullscreenBehavior != a3)
  {
    self->_fullscreenBehavior = a3;
    -[SVVideoPlayerViewController fullscreenBehaviorManager](self, "fullscreenBehaviorManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBehavior:", a3);

  }
}

- (BOOL)playerViewController:(id)a3 shouldExitFullScreenWithReason:(int64_t)a4
{
  void *v5;
  int v6;

  -[SVVideoPlayerViewController fullscreenBehaviorManager](self, "fullscreenBehaviorManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fullscreenPlaybackRequiredForCurrentConditions");

  if (v6)
    -[SVVideoPlayerViewController pause](self, "pause");
  return 1;
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _QWORD v5[5];
  BOOL v6;
  _QWORD v7[5];
  BOOL v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_24DBC2738;
  v8 = a4;
  v7[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v5[3] = &unk_24DBC2760;
  v5[4] = self;
  v6 = a4;
  objc_msgSend(a5, "addCoordinatedAnimations:completion:", v7, v5);
}

void __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "adGradientView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setShowsPlaybackControls:", *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v5 = a4;
  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[SVVideoPlayerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoPlayerViewControllerWillExitFullscreen:", self);

  }
  -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __106__SVVideoPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v14[3] = &unk_24DBC2788;
  v14[4] = self;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v14);

}

void __106__SVVideoPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateAdsButtonsVisibility");
  v3 = objc_msgSend(v11, "isCancelled");
  v4 = v11;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v11, "viewForKey:", *MEMORY[0x24BDF7F88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tapGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tapGesture");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", v8);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoPlayerViewControllerDidExitFullscreen:", *(_QWORD *)(a1 + 32));

    }
    v4 = v11;
  }

}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a4;
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPlayerViewControllerWillEnterFullscreen:", self);

  }
  -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __108__SVVideoPlayerViewController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v13[3] = &unk_24DBC2788;
  v13[4] = self;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v13);

}

void __108__SVVideoPlayerViewController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateAdsButtonsVisibility");
  if ((objc_msgSend(v7, "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tapGesture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", v4);

    objc_msgSend(v7, "viewForKey:", *MEMORY[0x24BDF7F98]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tapGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v6);

  }
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SVVideoPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewControllerWillStartPictureInPicture:", self);

  }
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SVVideoPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewControllerDidStartPictureInPicture:", self);

  }
  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "video");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "video");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startedPictureInPicture");

  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SVVideoPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewControllerWillStopPictureInPicture:", self);

  }
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SVVideoPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewControllerDidStopPictureInPicture:", self);

  }
  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "video");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "video");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stoppedPictureInPicture");

  }
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoPlayerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:", self, v8);

  }
  else
  {
    v8[2](v8, 1);
  }

}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  if (a4 == 5)
  {
    v12 = v6;
    -[SVVideoPlayerViewController setFullscreen:](self, "setFullscreen:", 0);
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "video");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "video");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "exitedFullscreen");
      goto LABEL_7;
    }
LABEL_8:

    v6 = v12;
    goto LABEL_9;
  }
  if (a4 == 4)
  {
    v12 = v6;
    -[SVVideoPlayerViewController setFullscreen:](self, "setFullscreen:", 1);
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "video");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "video");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enteredFullscreen");
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)playbackCoordinatorStartedPlayback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController videoAd](self, "videoAd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[SVVideoPlayerViewController videoAd](self, "videoAd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextVideoStartedPlaying");

    -[SVVideoPlayerViewController videoAd](self, "videoAd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metricsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SVVideoPlayerViewController setVideoAd:](self, "setVideoAd:", 0);
  }
  -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:", v13);
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "video");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "videoPlayerViewController:startedPlaybackOfVideo:", self, v12);

  }
}

- (void)playbackCoordinatorPausedPlayback:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:");
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewController:pausedPlaybackOfVideo:", self, v7);

  }
}

- (void)playbackCoordinatorResumedPlayback:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewController:resumedPlaybackOfVideo:", self, v7);

  }
}

- (void)playbackCoordinator:(id)a3 timeElapsed:(double)a4 duration:(double)a5
{
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "video");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_2550CA060);

  if (v8)
  {
    objc_msgSend(v10, "video");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController updateSkipButtonWithThreshold:time:](self, "updateSkipButtonWithThreshold:time:", objc_msgSend(v9, "skipThreshold"), a4);

  }
}

- (void)playbackCoordinatorStateChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == 2)
  {
    -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:", v7);
    objc_msgSend(v7, "video");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2550CA060);

    if (v5)
    {
      objc_msgSend(v7, "video");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVVideoPlayerViewController updateSkipButtonWithThreshold:time:](self, "updateSkipButtonWithThreshold:time:", objc_msgSend(v6, "skipThreshold"), 0.0);

    }
    if (-[SVVideoPlayerViewController playbackAllowedForPlaybackCoordinator:](self, "playbackAllowedForPlaybackCoordinator:", v7))
    {
      objc_msgSend(v7, "playWithButtonTapped:", -[SVVideoPlayerViewController playButtonTapped](self, "playButtonTapped"));
    }
    else
    {
      objc_msgSend(v7, "pause");
    }
  }

}

- (void)playbackCoordinatorFinishedLoadingVideoURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHost:", v5);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

  }
}

- (void)learnMoreButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[SVVideoPlayerViewController coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "video");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentAction");
  -[SVVideoPlayerViewController pause](self, "pause");

}

- (void)adSkipButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SVVideoPlayerViewController coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "video");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "conformsToProtocol:", &unk_2550CA060))
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "video");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "skipped");
    -[SVVideoPlayerViewController advance](self, "advance");

  }
}

- (void)refreshControlsForPlaybackCoordinator:(id)a3
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
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
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = objc_msgSend(v24, "state") == 1 || !objc_msgSend(v24, "state") || objc_msgSend(v24, "state") == 2;
  v5 = objc_msgSend(v24, "state") == 3 || objc_msgSend(v24, "state") == 4 || objc_msgSend(v24, "state") == 5;
  objc_msgSend(v24, "video");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_2550CA060);

  if ((_DWORD)v7)
  {
    objc_msgSend(v24, "video");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v24, "state") != 3 && objc_msgSend(v24, "state") != 4;
    v10 = objc_msgSend(v8, "hasAction") ^ 1 | v9;

  }
  else
  {
    v10 = 1;
    v9 = 1;
  }
  -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:withShowDelay:", v9, 0.1);

  -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:withShowDelay:", v10, 0.1);

  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:withShowDelay:", v9, 0.1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:withShowDelay:", v9, 0.1);

  -[SVVideoPlayerViewController activityIndicatorView](self, "activityIndicatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
    objc_msgSend(v15, "startAnimating");
  else
    objc_msgSend(v15, "stopAnimating");

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowsPlaybackControls:", v5);

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRequiresLinearPlayback:", v7);

  if ((v7 & 1) != 0 || !self->_enablePictureInPictureBehaviors)
  {
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsPictureInPicturePlayback:", 0);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0;
  }
  else
  {
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsPictureInPicturePlayback:", 1);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 1;
  }
  objc_msgSend(v20, "setCanStartPictureInPictureAutomaticallyFromInline:", v22);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setupQueueIfNeeded
{
  void *v3;
  SVVideoPlaybackQueue *v4;
  void *v5;
  char v6;
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
  SVAVURLAssetFactory *v25;
  uint64_t v26;
  void *v27;
  SVAVURLAssetFactory *v28;
  SVAVPlayerItemFactory *v29;
  SVAVPlayerFactory *v30;
  SVPlaybackCoordinator *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  SVAVURLAssetFactory *v36;
  void *v37;
  SVAVURLAssetFactory *v38;
  SVAVPlayerItemFactory *v39;
  SVAVPlayerFactory *v40;
  SVPlaybackCoordinator *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x24BDAC8D0];
  -[SVVideoPlayerViewController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(SVVideoPlaybackQueue);
    -[SVVideoPlayerViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SVVideoPlayerViewController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoAdForVideoPlayerViewController:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "metricsView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "metricsView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contentOverlayView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bounds");
          objc_msgSend(v10, "setFrame:");

          objc_msgSend(v8, "metricsView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAutoresizingMask:", 18);

          objc_msgSend(v8, "metricsView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setUserInteractionEnabled:", 0);

          -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "contentOverlayView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "metricsView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addSubview:", v17);

        }
        objc_msgSend(v8, "privacyMarker");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVVideoPlayerViewController setAdPrivacyButton:](self, "setAdPrivacyButton:", v18);

        -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHidden:", 1);

        -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_pause, 64);

        -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "customControlsView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", v24);

        -[SVVideoPlayerViewController updateViewConstraints](self, "updateViewConstraints");
        v25 = [SVAVURLAssetFactory alloc];
        v26 = *MEMORY[0x24BDB21F0];
        v45[0] = *MEMORY[0x24BDB21E0];
        v45[1] = v26;
        v46[0] = &unk_24DBC8908;
        v46[1] = &unk_24DBC8920;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[SVAVURLAssetFactory initWithOptions:](v25, "initWithOptions:", v27);

        v29 = -[SVAVPlayerItemFactory initWithAutomaticallyLoadedAssetKeys:assetFactory:preferredForwardBufferDuration:]([SVAVPlayerItemFactory alloc], "initWithAutomaticallyLoadedAssetKeys:assetFactory:preferredForwardBufferDuration:", &unk_24DBC89A8, v28, 0.0);
        v30 = -[SVAVPlayerFactory initWithAudioMode:playerItemFactory:]([SVAVPlayerFactory alloc], "initWithAudioMode:playerItemFactory:", 1, v29);
        v31 = -[SVPlaybackCoordinator initWithVideo:playerFactory:]([SVPlaybackCoordinator alloc], "initWithVideo:playerFactory:", v8, v30);
        -[SVVideoPlaybackQueue appendItem:](v4, "appendItem:", v31);
        -[SVVideoPlayerViewController setVideoAd:](self, "setVideoAd:", v8);

      }
    }
    -[SVVideoPlayerViewController dataSource](self, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      -[SVVideoPlayerViewController dataSource](self, "dataSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "videoForVideoPlayerViewController:", self);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = [SVAVURLAssetFactory alloc];
      v43 = *MEMORY[0x24BDB21F0];
      v44 = &unk_24DBC8920;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SVAVURLAssetFactory initWithOptions:](v36, "initWithOptions:", v37);

      v39 = -[SVAVPlayerItemFactory initWithAutomaticallyLoadedAssetKeys:assetFactory:preferredForwardBufferDuration:]([SVAVPlayerItemFactory alloc], "initWithAutomaticallyLoadedAssetKeys:assetFactory:preferredForwardBufferDuration:", &unk_24DBC89C0, v38, 10.0);
      v40 = -[SVAVPlayerFactory initWithAudioMode:playerItemFactory:]([SVAVPlayerFactory alloc], "initWithAudioMode:playerItemFactory:", 1, v39);
      v41 = -[SVPlaybackCoordinator initWithVideo:playerFactory:]([SVPlaybackCoordinator alloc], "initWithVideo:playerFactory:", v35, v40);
      -[SVVideoPlaybackQueue appendItem:](v4, "appendItem:", v41);
      -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVPlaybackCoordinator setHost:](v41, "setHost:", v42);

      -[SVVideoPlayerViewController setPrimaryContentCoordinator:](self, "setPrimaryContentCoordinator:", v41);
    }
    -[SVVideoPlayerViewController setQueue:](self, "setQueue:", v4);

  }
}

- (void)advance
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SVVideoPlayerViewController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "advance");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[SVVideoPlayerViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "video");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "videoPlayerViewController:initiatedPlaybackOfVideo:", self, v7);

    }
    -[SVVideoPlayerViewController transitionToCoordinator:](self, "transitionToCoordinator:", v15);
    -[SVVideoPlayerViewController startPlaybackForCoordinatorIfAllowed:](self, "startPlaybackForCoordinatorIfAllowed:", v15);
  }
  else
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "state");

    if (v9 == 5)
    {
      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pause");

      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHost:", v12);

      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:", v13);

    }
    else
    {
      -[SVVideoPlayerViewController finished](self, "finished");
    }
  }
  if (-[SVVideoPlayerViewController mode](self, "mode") != 1)
  {
    -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    -[SVVideoPlayerViewController setAdPrivacyButton:](self, "setAdPrivacyButton:", 0);
  }

}

- (void)transitionToCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SVVideoVolumeObserver *v17;
  void *v18;
  SVVideoVolumeObserver *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:", v4);
  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHost:", 0);

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removePlaybackObserver:", self);

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayerViewController fullscreenBehaviorManager](self, "fullscreenBehaviorManager");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePlaybackObserver:", v8);

  objc_msgSend(v4, "addPlaybackObserver:", self);
  -[SVVideoPlayerViewController fullscreenBehaviorManager](self, "fullscreenBehaviorManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPlaybackObserver:", v9);

  -[SVVideoPlayerViewController setCoordinator:](self, "setCoordinator:", v4);
  objc_msgSend(v4, "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_2550CA060);
  LOBYTE(v8) = v11;
  v12 = v11;

  -[SVVideoPlayerViewController setMode:](self, "setMode:", v12);
  if ((v8 & 1) == 0)
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHost:", v14);

    -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

  }
  v17 = [SVVideoVolumeObserver alloc];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SVVideoVolumeObserver initWithPlaybackCoordinator:audioSession:](v17, "initWithPlaybackCoordinator:audioSession:", v4, v18);
  -[SVVideoPlayerViewController setVolumeObserver:](self, "setVolumeObserver:", v19);

  -[SVVideoPlayerViewController volumeObserver](self, "volumeObserver");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__SVVideoPlayerViewController_transitionToCoordinator___block_invoke;
  v22[3] = &unk_24DBC27B0;
  v23 = v4;
  v21 = v4;
  objc_msgSend(v20, "onMuteStateChange:", v22);

}

void __55__SVVideoPlayerViewController_transitionToCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setMuted:", objc_msgSend(v6, "muted"));
  objc_msgSend(*(id *)(a1 + 32), "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "muteStateChanged:", objc_msgSend(v6, "muted"));

  }
}

- (void)finished
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seekToTime:withCompletionBlock:", 0, 0.0);

  -[SVVideoPlayerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SVVideoPlayerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerViewControllerFinishedVideoPlayback:", self);

  }
}

- (void)startPlaybackForCoordinatorIfAllowed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SVVideoPlayerViewController playbackAllowedForPlaybackCoordinator:](self, "playbackAllowedForPlaybackCoordinator:"))
  {
    objc_msgSend(v4, "playWithButtonTapped:", -[SVVideoPlayerViewController playButtonTapped](self, "playButtonTapped"));
  }

}

- (BOOL)playbackAllowedForPlaybackCoordinator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[SVVideoPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[SVVideoPlayerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "videoPlayerViewControllerShouldStartPlayback:", self);

  return v7;
}

- (void)updateSkipButtonWithThreshold:(unint64_t)a3 time:(double)a4
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = vcvtad_u64_f64(a4);
  v5 = a3 >= v4;
  v6 = a3 - v4;
  if (!v5)
    v6 = 0;
  if (a3 - 1 >= 0xFFFFFFFFFFFFFFFELL)
    v7 = 0;
  else
    v7 = v6;
  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSkipDuration:", v7);

}

- (void)updateAdsButtonsVisibility
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2550CA060);

  if (v5)
  {
    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVVideoPlayerViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "state") == 3)
    {
      v9 = 0;
    }
    else
    {
      -[SVVideoPlayerViewController coordinator](self, "coordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "state") != 4;

    }
    v10 = objc_msgSend(v7, "hasAction") ^ 1 | v9;

  }
  else
  {
    v10 = 1;
    v9 = 1;
  }
  -[SVVideoPlayerViewController adPrivacyButton](self, "adPrivacyButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:withShowDelay:", v9, 0.1);

  -[SVVideoPlayerViewController learnMoreButton](self, "learnMoreButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:withShowDelay:", v10, 0.1);

  -[SVVideoPlayerViewController skipButton](self, "skipButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:withShowDelay:", v9, 0.1);

  -[SVVideoPlayerViewController adGradientView](self, "adGradientView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:withShowDelay:", v9, 0.1);

}

- (UIViewController)viewControllerForModalPresentation
{
  void *v2;
  void *v3;

  -[SVVideoPlayerViewController playerViewController](self, "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForFullScreenPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)tapped
{
  void *v3;
  id v4;

  -[SVVideoPlayerViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "video");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tappedToToggleControlVisibility:", -[SVVideoPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"));

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SVVideoPlayerViewControllerDelegate)delegate
{
  return (SVVideoPlayerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SVVideoPlayerViewControllerDataSource)dataSource
{
  return (SVVideoPlayerViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)enablePictureInPictureBehaviors
{
  return self->_enablePictureInPictureBehaviors;
}

- (void)setEnablePictureInPictureBehaviors:(BOOL)a3
{
  self->_enablePictureInPictureBehaviors = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
}

- (unint64_t)fullscreenBehavior
{
  return self->_fullscreenBehavior;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (SVVideoPlaybackQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SVPlaybackCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (SVPlaybackCoordinator)primaryContentCoordinator
{
  return self->_primaryContentCoordinator;
}

- (void)setPrimaryContentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_primaryContentCoordinator, a3);
}

- (SVVideoAdProviding)videoAd
{
  return self->_videoAd;
}

- (void)setVideoAd:(id)a3
{
  objc_storeStrong((id *)&self->_videoAd, a3);
}

- (BOOL)playButtonTapped
{
  return self->_playButtonTapped;
}

- (void)setPlayButtonTapped:(BOOL)a3
{
  self->_playButtonTapped = a3;
}

- (SVLearnMoreButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (SVVideoAdSkipButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (SVAdPrivacyButton)adPrivacyButton
{
  return self->_adPrivacyButton;
}

- (void)setAdPrivacyButton:(id)a3
{
  objc_storeStrong((id *)&self->_adPrivacyButton, a3);
}

- (SVAdGradientView)adGradientView
{
  return self->_adGradientView;
}

- (void)setAdGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_adGradientView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (SVKeyValueObserver)videoBoundsObserver
{
  return self->_videoBoundsObserver;
}

- (void)setVideoBoundsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_videoBoundsObserver, a3);
}

- (SVAutomaticFullscreenVideoPlaybackBehaviorManager)fullscreenBehaviorManager
{
  return self->_fullscreenBehaviorManager;
}

- (SVVideoVolumeObserver)volumeObserver
{
  return self->_volumeObserver;
}

- (void)setVolumeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_volumeObserver, a3);
}

- (UIGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  self->_showsPlaybackControls = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_volumeObserver, 0);
  objc_storeStrong((id *)&self->_fullscreenBehaviorManager, 0);
  objc_storeStrong((id *)&self->_videoBoundsObserver, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_adGradientView, 0);
  objc_storeStrong((id *)&self->_adPrivacyButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_videoAd, 0);
  objc_storeStrong((id *)&self->_primaryContentCoordinator, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
