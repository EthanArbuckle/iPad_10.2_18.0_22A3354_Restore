@implementation SBSystemNotesContentViewController

- (SBSystemNotesContentViewController)initWithSceneHandle:(id)a3 workspace:(id)a4 transientUIInteractionManager:(id)a5 notesInteractionSettings:(id)a6 presentationContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBSystemNotesContentViewController *v17;
  SBSystemNotesContentViewController *v18;
  CGFloat v19;
  SBDeviceApplicationSceneViewController *v20;
  SBDeviceApplicationSceneViewController *sceneViewController;
  uint64_t v22;
  UITapGestureRecognizer *thumbnailTapGestureRecognizer;
  void *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SBSystemNotesContentViewController;
  v17 = -[SBSystemNotesContentViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_workspace, a4);
    objc_storeStrong((id *)&v18->_notesInteractionSettings, a6);
    objc_storeStrong((id *)&v18->_transientUIInteractionManager, a5);
    v18->_preferredSceneContentSize.width = SBSystemNotesDefaultWindowSize();
    v18->_preferredSceneContentSize.height = v19;
    objc_msgSend(v12, "addObserver:", v18);
    objc_msgSend(v12, "addActionConsumer:", v18);
    v20 = -[SBDeviceApplicationSceneViewController initWithSceneHandle:]([SBDeviceApplicationSceneViewController alloc], "initWithSceneHandle:", v12);
    sceneViewController = v18->_sceneViewController;
    v18->_sceneViewController = v20;

    -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](v18->_sceneViewController, "setHomeGrabberDisplayMode:", 1);
    -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](v18->_sceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v18, sel__handleThumbnailTapGesture_);
    thumbnailTapGestureRecognizer = v18->_thumbnailTapGestureRecognizer;
    v18->_thumbnailTapGestureRecognizer = (UITapGestureRecognizer *)v22;

    -[UITapGestureRecognizer setAllowedTouchTypes:](v18->_thumbnailTapGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEC20);
    objc_storeStrong((id *)&v18->_presentationContext, a7);
    -[SBSystemNotesContentPresentationContext requestedConfiguration](v18->_presentationContext, "requestedConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:](v18, "updateConfiguration:sendCreateActionIfNecessary:", v24, 1);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v6;

  if (-[SBSystemNotesContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBDeviceApplicationSceneViewController willMoveToParentViewController:](self->_sceneViewController, "willMoveToParentViewController:", 0);
    -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[SBDeviceApplicationSceneViewController removeFromParentViewController](self->_sceneViewController, "removeFromParentViewController");
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
    -[SBNubView contentView](self->_nubView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "unregisterView:", v5);

  }
  -[SBSystemNotesContentViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
  -[SBDeviceApplicationSceneViewController invalidate](self->_sceneViewController, "invalidate");
  -[SBTransientUIInteractionManager unregisterParticipantForTapToDismiss:](self->_transientUIInteractionManager, "unregisterParticipantForTapToDismiss:", self);
  -[BSAbsoluteMachTimer invalidate](self->_thumbnailCooldownTimer, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController dealloc](&v6, sel_dealloc);
}

- (id)contentView
{
  return (id)-[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  SBSystemNotesBackgroundView *v9;
  SBSystemNotesBackgroundView *v10;
  SBNubView *v11;
  void *v12;
  SBNubView *v13;
  SBNubView *nubView;
  void *v15;
  id WeakRetained;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[SBSystemNotesContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "addGestureRecognizer:", self->_thumbnailTapGestureRecognizer);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("system-notes-content-view"));
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.15);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v3, "addSubview:", self->_thumbnailView);
  -[UIView setContentMode:](self->_thumbnailView, "setContentMode:", 0);
  -[UIView setOpaque:](self->_thumbnailView, "setOpaque:", 0);
  -[UIView setAccessibilityIdentifier:](self->_thumbnailView, "setAccessibilityIdentifier:", CFSTR("system-notes-thumbnail-view"));
  -[SBSystemNotesContentViewController addChildViewController:](self, "addChildViewController:", self->_sceneViewController);
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v3, "addSubview:", v7);
  objc_msgSend(v7, "setOpaque:", 0);
  -[SBDeviceApplicationSceneViewController didMoveToParentViewController:](self->_sceneViewController, "didMoveToParentViewController:", self);
  v9 = [SBSystemNotesBackgroundView alloc];
  objc_msgSend(v7, "bounds");
  v10 = -[SBSystemNotesBackgroundView initWithFrame:](v9, "initWithFrame:");
  -[SBDeviceApplicationSceneViewController setBackgroundView:](self->_sceneViewController, "setBackgroundView:", v10);
  v11 = [SBNubView alloc];
  -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBNubView initWithDeviceApplicationSceneHandle:](v11, "initWithDeviceApplicationSceneHandle:", v12);
  nubView = self->_nubView;
  self->_nubView = v13;

  -[SBNubView layer](self->_nubView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHitTestsAsOpaque:", 1);

  -[SBNubView setHighlighted:](self->_nubView, "setHighlighted:", 0);
  objc_msgSend(v7, "addSubview:", self->_nubView);
  -[SBNubView setAccessibilityIdentifier:](self->_nubView, "setAccessibilityIdentifier:", CFSTR("system-notes-nub-view"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  -[SBNubView contentView](self->_nubView, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "registerView:delegate:", v17, self);

  objc_msgSend(v3, "bringSubviewToFront:", self->_thumbnailView);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  double v22;
  UIView *thumbnailView;
  int v24;
  uint64_t v25;
  void *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  -[SBSystemNotesContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v8 - SBSystemNotesThumbnailSize();
  v13 = SBSystemNotesMinimumWindowSize();
  v14 = v12 / (v13 - SBSystemNotesThumbnailSize());
  if (v14 < 0.0)
    v14 = 0.0;
  v15 = fmin(v14, 1.0);
  -[UIView setFrame:](self->_thumbnailView, "setFrame:", v5, v7, v9, v11);
  -[SBApplicationBlurContentView setFrame:](self->_blurView, "setFrame:", v5, v7, v9, v11);
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  UIRectGetCenter();
  objc_msgSend(v16, "setCenter:");
  width = self->_preferredSceneContentSize.width;
  height = self->_preferredSceneContentSize.height;
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, width, height);
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, v9 / width, v11 / height);
  v27 = v28;
  objc_msgSend(v16, "setTransform:", &v27);
  +[SBNubView height](SBNubView, "height");
  -[SBNubView setFrame:](self->_nubView, "setFrame:", 0.0, 0.0, width, v19);
  v20 = SBSystemNotesThumbnailCornerRadius();
  v21 = SBSystemNotesWindowCornerRadius();
  if (v20 >= v21)
    v22 = v21;
  else
    v22 = v20;
  if (v20 >= v21)
    v21 = v20;
  objc_msgSend(v3, "_setContinuousCornerRadius:", v22 + (v21 - v22) * v15);
  -[UIView setAlpha:](self->_thumbnailView, "setAlpha:", 1.0 - v15);
  if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(v16, "setHidden:", 1);
    thumbnailView = self->_thumbnailView;
LABEL_12:
    v25 = 0;
    goto LABEL_13;
  }
  v24 = BSFloatGreaterThanOrEqualToFloat();
  objc_msgSend(v16, "setHidden:", 0);
  thumbnailView = self->_thumbnailView;
  if (!v24)
    goto LABEL_12;
  v25 = 1;
LABEL_13:
  -[UIView setHidden:](thumbnailView, "setHidden:", v25);
  objc_msgSend(v3, "_sbWindowScene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesContentViewController _acquireTraitsParticipantOnWindowSceneIfNecessary:](self, "_acquireTraitsParticipantOnWindowSceneIfNecessary:", v26);

}

- (void)viewWillAppear:(BOOL)a3
{
  SBSceneViewStatusBarAssertion *v4;
  SBSceneViewStatusBarAssertion *statusBarAssertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarHidden:atLevel:](self->_sceneViewController, "statusBarAssertionWithStatusBarHidden:atLevel:", 1, 0);
  v4 = (SBSceneViewStatusBarAssertion *)objc_claimAutoreleasedReturnValue();
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = v4;

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  SBLogSystemNotes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBSystemNotesContentViewController viewDidAppear:].cold.1((id *)&self->super.super.super.isa, (uint64_t)a2, v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemPointerInteractionManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained != v8)
  {
    -[SBNubView contentView](self->_nubView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "unregisterView:", v9);

    objc_storeWeak((id *)&self->_systemPointerInteractionManager, v8);
    -[SBNubView contentView](self->_nubView, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerView:delegate:", v10, self);

  }
  if (!-[SBSystemNotesContentViewController presentationMode](self, "presentationMode"))
    -[SBSystemNotesContentViewController _updateForegroundStatus:](self, "_updateForegroundStatus:", 1);
  -[SBTransientUIInteractionManager registerParticipantForTapToDismiss:](self->_transientUIInteractionManager, "registerParticipantForTapToDismiss:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBTransientUIInteractionManager unregisterParticipantForTapToDismiss:](self->_transientUIInteractionManager, "unregisterParticipantForTapToDismiss:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  SBSceneViewStatusBarAssertion *statusBarAssertion;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemNotesContentViewController;
  -[SBSystemNotesContentViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SBSceneViewStatusBarAssertion invalidate](self->_statusBarAssertion, "invalidate");
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemNotesContentViewController;
  v6 = a3;
  -[SBSystemNotesContentViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v13, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  objc_msgSend(v6, "_sbWindowScene", v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesContentViewController _acquireTraitsParticipantOnWindowSceneIfNecessary:](self, "_acquireTraitsParticipantOnWindowSceneIfNecessary:", v7);

  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "windowLevel");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](traitsParticipantDelegate, "setPreferredSceneLevel:", v12);

}

- (void)_acquireTraitsParticipantOnWindowSceneIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  SBTraitsSceneParticipantDelegate *v8;
  void *v9;
  SBTraitsSceneParticipantDelegate *v10;
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *v12;
  TRAParticipant *traitsParticipant;
  SBTraitsSceneParticipantDelegate *v14;
  uint64_t v15;
  SBTraitsSceneParticipantDelegate *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  if (!self->_traitsParticipant
    || (v5 = objc_loadWeakRetained((id *)&self->_lastKnownWindowScene), v5, v5 != v4))
  {
    objc_storeWeak((id *)&self->_lastKnownWindowScene, v4);
    objc_msgSend(v4, "traitsArbiter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_arbiter, v6);

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    -[SBSystemNotesContentViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
    if (WeakRetained)
    {
      v8 = [SBTraitsSceneParticipantDelegate alloc];
      -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:](v8, "initWithSceneHandle:", v9);
      traitsParticipantDelegate = self->_traitsParticipantDelegate;
      self->_traitsParticipantDelegate = v10;

      objc_msgSend(WeakRetained, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRolePictureInPicture"), self->_traitsParticipantDelegate);
      v12 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
      traitsParticipant = self->_traitsParticipant;
      self->_traitsParticipant = v12;

      -[SBTraitsSceneParticipantDelegate setArbiter:](self->_traitsParticipantDelegate, "setArbiter:", WeakRetained);
      -[SBTraitsSceneParticipantDelegate setParticipant:](self->_traitsParticipantDelegate, "setParticipant:", self->_traitsParticipant);
      objc_initWeak(&location, self);
      v14 = self->_traitsParticipantDelegate;
      v15 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke;
      v19[3] = &unk_1E8EB6FA8;
      objc_copyWeak(&v20, &location);
      -[SBTraitsSceneParticipantDelegate setActuateOrientationSettingsAlongsideBlock:](v14, "setActuateOrientationSettingsAlongsideBlock:", v19);
      v16 = self->_traitsParticipantDelegate;
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke_2;
      v17[3] = &unk_1E8EA3840;
      objc_copyWeak(&v18, &location);
      -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v16, "setActuateOrientationAlongsideBlock:", v17);
      -[TRAParticipant setNeedsUpdatePreferencesWithReason:animate:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:animate:", CFSTR("setup"), 0);
      -[SBDeviceApplicationSceneViewController containerDidUpdateTraitsParticipant:](self->_sceneViewController, "containerDidUpdateTraitsParticipant:", self->_traitsParticipant);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

  }
}

void __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sceneFrame");
    objc_msgSend(v5, "setFrame:");
  }

}

void __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  id v3;
  double v4;
  double v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = objc_msgSend(WeakRetained[145], "sbf_currentOrientation");
    v3 = v6[122];
    objc_msgSend(v6, "_sceneFrame");
    objc_msgSend(v3, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v2, v2, v4, v5);
    WeakRetained = v6;
  }

}

- (void)_invalidateTraitsParticipant
{
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *traitsParticipant;

  -[SBTraitsSceneParticipantDelegate invalidate](self->_traitsParticipantDelegate, "invalidate");
  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

}

- (id)_sbWindowSceneForSceneHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)presentationMode
{
  SBSSystemNotesPresentationConfiguration *currentConfiguration;

  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration)
    return -[SBSSystemNotesPresentationConfiguration preferredPresentationMode](currentConfiguration, "preferredPresentationMode");
  else
    return -1;
}

- (void)setPresentationMode:(int64_t)a3
{
  SBSSystemNotesPresentationConfiguration *currentConfiguration;
  id v5;

  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration)
  {
    -[SBSSystemNotesPresentationConfiguration presentationConfigurationWithPreferredPresentationMode:](currentConfiguration, "presentationConfigurationWithPreferredPresentationMode:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:](self, "updateConfiguration:sendCreateActionIfNecessary:", v5, 1);

  }
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[SBSSystemNotesPresentationConfiguration sceneBundleIdentifier](self->_currentConfiguration, "sceneBundleIdentifier");
}

- (CGSize)preferredContentSize
{
  int64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  CGSize result;

  v4 = -[SBSystemNotesContentViewController presentationMode](self, "presentationMode");
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = SBSystemNotesThumbnailSize();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SBSSystemNotesPresentationModeDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesContentViewController.m"), 362, CFSTR("invalid mode: %@"), v8);

      v5 = *MEMORY[0x1E0C9D820];
      v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    v5 = SBSystemNotesDefaultWindowSize();
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (SBSSystemNotesPresentationConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (unint64_t)updateConfiguration:(id)a3 sendCreateActionIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v8;
  int64_t v9;
  SBSSystemNotesPresentationConfiguration **p_currentConfiguration;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  SBSystemNotesPlaceholderContentProvider *placeholderProvider;
  SBSystemNotesPlaceholderContentProvider *v23;
  SBSystemNotesPlaceholderContentProvider *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BSAbsoluteMachTimer *v28;
  BSAbsoluteMachTimer *thumbnailCooldownTimer;
  BSAbsoluteMachTimer *v30;
  double v31;
  double v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  id WeakRetained;
  unint64_t v44;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id location;
  _QWORD v53[5];
  id v54;
  id v55;

  v4 = a4;
  v8 = a3;
  v9 = -[SBSystemNotesContentViewController presentationMode](self, "presentationMode");
  p_currentConfiguration = &self->_currentConfiguration;
  v11 = SBSDiffSystemNotesPresentationConfigurations();
  if (v11)
  {
    v12 = v11;
    if ((v11 & 1) != 0 && *p_currentConfiguration)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_opt_class();
      -[SBSSystemNotesPresentationConfiguration sceneBundleIdentifier](*p_currentConfiguration, "sceneBundleIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneBundleIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesContentViewController.m"), 379, CFSTR("%@ can't update configuration for different bundleID. our bundleID: %@; new bundleID: %@"),
        v48,
        v46,
        v47);

    }
    objc_storeStrong((id *)&self->_currentConfiguration, a3);
    if ((v12 & 4) != 0)
    {
      -[SBSSystemNotesPresentationConfiguration userActivity](*p_currentConfiguration, "userActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemNotesContentViewController _thumbnailViewForUserActivity:](self, "_thumbnailViewForUserActivity:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_thumbnailView)
        v15 = v9 == 1;
      else
        v15 = 0;
      if (v15 && (-[SBSystemNotesContentViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DAC218], "crossfadeViewWithStartView:endView:translucent:", self->_thumbnailView, v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_thumbnailView, v14);
        -[SBSystemNotesContentViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        objc_msgSend(v16, "setFrame:");
        objc_msgSend(v17, "addSubview:", v16);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke;
        v53[3] = &unk_1E8E9E270;
        v53[4] = self;
        v54 = v17;
        v55 = v16;
        v18 = v16;
        v19 = v17;
        objc_msgSend(v18, "crossfadeWithCompletion:", v53);

      }
      else
      {
        objc_storeStrong((id *)&self->_thumbnailView, v14);
      }
      -[SBSSystemNotesPresentationConfiguration userActivity](*p_currentConfiguration, "userActivity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemNotesContentViewController _imageFromUserActivity:presentationMode:](self, "_imageFromUserActivity:presentationMode:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      placeholderProvider = self->_placeholderProvider;
      if (placeholderProvider)
      {
        -[SBSystemNotesPlaceholderContentProvider setSnapshot:](placeholderProvider, "setSnapshot:", v21);
      }
      else
      {
        v23 = -[SBSystemNotesPlaceholderContentProvider initWithSnapshot:]([SBSystemNotesPlaceholderContentProvider alloc], "initWithSnapshot:", v21);
        v24 = self->_placeholderProvider;
        self->_placeholderProvider = v23;

        -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPlaceholderContentProvider:", self->_placeholderProvider);

      }
    }
    v26 = objc_msgSend(v8, "preferredPresentationMode");
    if ((v12 & 2) != 0)
    {
      v27 = v26;
      -[BSAbsoluteMachTimer cancel](self->_thumbnailCooldownTimer, "cancel");
      self->_thumbnailCooldownTimerFired = 0;
      if (v27)
      {
        if (v27 == 1)
        {
          if (!self->_thumbnailCooldownTimer)
          {
            v28 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBSystemNotesConventViewController.thumbnailCooldown"));
            thumbnailCooldownTimer = self->_thumbnailCooldownTimer;
            self->_thumbnailCooldownTimer = v28;

          }
          objc_initWeak(&location, self);
          v30 = self->_thumbnailCooldownTimer;
          -[SBSystemNotesInteractionSettings delayBeforeUserInteractionDismissesThumbnail](self->_notesInteractionSettings, "delayBeforeUserInteractionDismissesThumbnail");
          v32 = v31;
          v33 = MEMORY[0x1E0C80D38];
          v34 = MEMORY[0x1E0C80D38];
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke_2;
          v50[3] = &unk_1E8E9EEC8;
          objc_copyWeak(&v51, &location);
          -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v30, "scheduleWithFireInterval:leewayInterval:queue:handler:", v33, v50, v32, 0.05);

          objc_destroyWeak(&v51);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        switch(-[SBSystemNotesContentPresentationContext source](self->_presentationContext, "source"))
        {
          case 2uLL:
            objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB0798]);
            SBLogSystemNotes();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.2();

            -[SBSSystemNotesPresentationConfiguration userActivity](*p_currentConfiguration, "userActivity");
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(MEMORY[0x1E0DB06F8], "didActivateBacklinkItemWithUserActivity:", v36);
              SBLogSystemNotes();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.1();

            }
            goto LABEL_43;
          case 4uLL:
            -[SBSystemNotesContentPresentationContext positionConfiguration](self->_presentationContext, "positionConfiguration");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "edgeProtectEnabled");

            if ((v39 & 1) != 0)
            {
              objc_storeStrong((id *)&self->_pendingAnalyticsString, (id)*MEMORY[0x1E0DB07B0]);
              SBLogSystemNotes();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.3();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB07B0]);
              SBLogSystemNotes();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.4();
            }
            goto LABEL_43;
          case 5uLL:
            -[SBSystemNotesContentPresentationContext positionConfiguration](self->_presentationContext, "positionConfiguration");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "edgeProtectEnabled");

            if ((v41 & 1) != 0)
            {
              objc_storeStrong((id *)&self->_pendingAnalyticsString, (id)*MEMORY[0x1E0DB07A8]);
              SBLogSystemNotes();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.5();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB07A8]);
              SBLogSystemNotes();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.6();
            }
            goto LABEL_43;
          case 6uLL:
            objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:", *MEMORY[0x1E0DB07A0]);
            SBLogSystemNotes();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.7();
LABEL_43:

            break;
          default:
            break;
        }
        -[SBSystemNotesContentViewController _updateForegroundStatus:](self, "_updateForegroundStatus:", 1);
      }
      -[SBSystemNotesContentViewController viewIfLoaded](self, "viewIfLoaded");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setNeedsLayout");

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "contentViewController:didChangeToPresentationMode:", self, v27);

    }
  }
  if (v9)
    v44 = 0;
  else
    v44 = -[SBSystemNotesContentViewController _sendActionForUpdatedConfiguration:sendCreateIfNecessary:](self, "_sendActionForUpdatedConfiguration:sendCreateIfNecessary:", *p_currentConfiguration, v4);

  return v44;
}

uint64_t __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
}

void __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[1128] = 1;

}

- (unint64_t)_sendActionForUpdatedConfiguration:(id)a3 sendCreateIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "userActivity");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v4 || v9)
    {
      if (!v9)
      {
        v13 = 0;
LABEL_17:
        SBLogSystemNotes();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[SBSystemNotesContentViewController _sendActionForUpdatedConfiguration:sendCreateIfNecessary:].cold.2();
        goto LABEL_19;
      }
      SBLogSystemNotes();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "sending UIUserActivityContinuationAction to remote scene", v18, 2u);
      }

      objc_msgSend(v6, "_uiActivityContinuationAction");
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = 2;
      if (!v14)
        goto LABEL_17;
    }
    else
    {
      SBLogSystemNotes();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "sending SBSSystemNotesCreateAction to remote scene", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", &__block_literal_global_260);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeout:", dispatch_time(0, 2000000000));
      v13 = 1;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAB020]), "initWithReason:responder:", 1, v12);

      if (!v14)
        goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendActions:", v16);

LABEL_19:
    goto LABEL_20;
  }
  SBLogSystemNotes();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBSystemNotesContentViewController _sendActionForUpdatedConfiguration:sendCreateIfNecessary:].cold.1();
  v13 = 0;
LABEL_20:

  return v13;
}

void __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBLogSystemNotes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke_cold_1();

  }
}

- (void)_setBlurred:(BOOL)a3
{
  SBApplicationBlurContentView *blurView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBApplicationBlurContentView *v9;
  SBApplicationBlurContentView *v10;
  SBApplicationBlurContentView *v11;
  void *v12;
  void *v13;
  void *v14;
  SBApplicationBlurContentView *v15;
  SBApplicationBlurContentView *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBApplicationBlurContentView *v20;
  id v21;
  _QWORD v22[4];
  SBApplicationBlurContentView *v23;
  _QWORD v24[4];
  SBApplicationBlurContentView *v25;

  blurView = self->_blurView;
  if (a3)
  {
    if (!blurView)
    {
      -[SBSystemNotesContentViewController view](self, "view");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "application");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [SBApplicationBlurContentView alloc];
      objc_msgSend(v21, "bounds");
      v10 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](v9, "initWithFrame:bundleIdentifier:targetViewToBlur:", v8, v5);
      v11 = self->_blurView;
      self->_blurView = v10;

      objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplicationBlurContentView generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:](self->_blurView, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", v12, 0);
      -[SBApplicationBlurContentView setClipsToBounds:](self->_blurView, "setClipsToBounds:", 1);
      -[SBApplicationBlurContentView layer](self->_blurView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupOpacity:", 1);

      -[SBApplicationBlurContentView iconView](self->_blurView, "iconView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

      objc_msgSend(v21, "addSubview:", self->_blurView);
    }
  }
  else if (blurView)
  {
    v15 = blurView;
    v16 = self->_blurView;
    self->_blurView = 0;

    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D01908];
    v19 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __50__SBSystemNotesContentViewController__setBlurred___block_invoke;
    v24[3] = &unk_1E8E9DED8;
    v25 = v15;
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __50__SBSystemNotesContentViewController__setBlurred___block_invoke_2;
    v22[3] = &unk_1E8E9E980;
    v23 = v25;
    v20 = v25;
    objc_msgSend(v18, "animateWithFactory:options:actions:completion:", v17, 4, v24, v22);

  }
}

uint64_t __50__SBSystemNotesContentViewController__setBlurred___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__SBSystemNotesContentViewController__setBlurred___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return (SBDeviceApplicationSceneHandle *)-[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
}

- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4
{
  id v6;
  NSString **p_pendingAnalyticsString;
  NSObject *v8;
  NSString *v9;

  v6 = a3;
  if (!a4)
  {
    p_pendingAnalyticsString = &self->_pendingAnalyticsString;
    if (self->_pendingAnalyticsString)
    {
      objc_msgSend(MEMORY[0x1E0DB0758], "logActivationEvent:");
      SBLogSystemNotes();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SBSystemNotesContentViewController containerViewController:didSettleOnStashState:].cold.1((uint64_t *)&self->_pendingAnalyticsString, v8);

      v9 = *p_pendingAnalyticsString;
      *p_pendingAnalyticsString = 0;

    }
    if ((objc_msgSend(v6, "isStashed") & 1) == 0)
      -[SBSystemNotesContentViewController _updateSceneFrameWithCompletion:](self, "_updateSceneFrameWithCompletion:", 0);
  }

}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  id v5;

  if (-[SBSystemNotesContentViewController presentationMode](self, "presentationMode", a3, *(_QWORD *)&a4) != 1)
  {
    -[SBSystemNotesContentViewController _setBlurred:](self, "_setBlurred:", 1);
    -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[5];

  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[SBSystemNotesContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[SBSystemNotesContentViewController _setPreferredSceneContentSize:](self, "_setPreferredSceneContentSize:", v6, v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SBSystemNotesContentViewController_containerViewControllerDidEndSizeChange___block_invoke;
  v8[3] = &unk_1E8E9DED8;
  v8[4] = self;
  -[SBSystemNotesContentViewController _updateSceneFrameWithCompletion:](self, "_updateSceneFrameWithCompletion:", v8);
}

uint64_t __78__SBSystemNotesContentViewController_containerViewControllerDidEndSizeChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBlurred:", 0);
}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  if ((objc_msgSend(a3, "isStashed") & 1) == 0)
    -[SBSystemNotesContentViewController _updateSceneFrameWithCompletion:](self, "_updateSceneFrameWithCompletion:", 0);
}

- (void)_updateSceneFrameWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect *p_lastKnownSceneFrame;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[8];
  CGRect v19;

  v4 = (void (**)(_QWORD))a3;
  -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemNotesContentViewController _sceneFrame](self, "_sceneFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  p_lastKnownSceneFrame = &self->_lastKnownSceneFrame;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  if (CGRectEqualToRect(*p_lastKnownSceneFrame, v19))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    p_lastKnownSceneFrame->origin.x = v8;
    p_lastKnownSceneFrame->origin.y = v10;
    p_lastKnownSceneFrame->size.width = v12;
    p_lastKnownSceneFrame->size.height = v14;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke;
    v18[3] = &__block_descriptor_64_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    *(CGFloat *)&v18[4] = v8;
    *(CGFloat *)&v18[5] = v10;
    *(CGFloat *)&v18[6] = v12;
    *(CGFloat *)&v18[7] = v14;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke_2;
    v16[3] = &unk_1E8EAE788;
    v17 = v4;
    objc_msgSend(v6, "performUpdate:withCompletion:", v18, v16);

  }
}

uint64_t __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4
{
  int64_t v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[SBSystemNotesContentViewController presentationMode](self, "presentationMode", a3, a4);
  if (v5 == 1)
  {
    SBLogSystemNotes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal of thumbnail due to transition", (uint8_t *)&v10, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentViewControllerWantsDismissal:forReason:animated:", self, 1, 1);

  }
  return v5 == 1;
}

- (void)_handleThumbnailTapGesture:(id)a3
{
  id WeakRetained;
  BOOL v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = -[SBSystemNotesContentViewController presentationMode](self, "presentationMode") == 1;
    WeakRetained = v6;
    if (v5)
    {
      objc_msgSend(v6, "contentViewControllerDidReceiveTapToExpand:", self);
      WeakRetained = v6;
    }
  }

}

- (BOOL)_updateForegroundStatus:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  SBMainWorkspace *workspace;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[SBSceneViewController sceneHandle](self->_sceneViewController, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesContentViewController _sbWindowSceneForSceneHandle:](self, "_sbWindowSceneForSceneHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesContentViewController _acquireTraitsParticipantOnWindowSceneIfNecessary:](self, "_acquireTraitsParticipantOnWindowSceneIfNecessary:", v6);

  workspace = self->_workspace;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke;
  v14[3] = &unk_1E8EB7010;
  v14[4] = self;
  v16 = v3;
  v8 = v5;
  v15 = v8;
  v9 = -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](workspace, "requestTransitionWithOptions:builder:validator:", 0, v14, &__block_literal_global_66_2);
  SBLogPIP();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "sceneIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "PIP scene transition succeeded; sceneID: %{public}@",
        buf,
        0xCu);

    }
    if (v3)
      self->_haveBeenForeground = 1;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesContentViewController _updateForegroundStatus:].cold.1(v8, v11);

  }
  return v9;
}

void __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  char v11;

  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_2;
  v10[3] = &unk_1E8E9F398;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "modifyApplicationContext:", v10);
  objc_msgSend(v4, "setSource:", 49);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_3;
  v7[3] = &unk_1E8EAB0A0;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "setTransactionProvider:", v7);

}

void __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1160);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v3, "sbf_currentOrientation"));
  objc_msgSend(v4, "setBackground:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(v4, "setWaitsForSceneUpdates:", 1);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

SBPIPSceneContentSceneUpdateWorkspaceTransaction *__62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SBPIPSceneContentSceneUpdateWorkspaceTransaction *v15;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "_uiActivityContinuationAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v4, "addActions:", v8);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v9 + 1129))
  {
    v10 = objc_msgSend(*(id *)(v9 + 1112), "source");
    if ((unint64_t)(v10 - 2) > 3)
      v11 = 0;
    else
      v11 = qword_1D0E8AD60[v10 - 2];
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAB018]), "initWithSource:responder:", v11, 0);
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v4, "addActions:", v14);

  }
  v15 = -[SBPIPSceneContentSceneUpdateWorkspaceTransaction initWithApplicationSceneEntity:transitionRequest:]([SBPIPSceneContentSceneUpdateWorkspaceTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", v4, v3);

  return v15;
}

uint64_t __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_4()
{
  return 1;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousLayoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hitTestTouch:(id)a3 gestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  -[SBSystemNotesContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fixedCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v13);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v12, v15, v17);
  v19 = v18;
  v21 = v20;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v12, v19, v21);
  objc_msgSend(v8, "hitTest:withEvent:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v22 != 0;

  return (char)v7;
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  BOOL v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SBSystemNotesContentViewController presentationMode](self, "presentationMode") != 1)
    goto LABEL_8;
  if (-[SBSystemNotesContentViewController _hitTestTouch:gestureRecognizer:](self, "_hitTestTouch:gestureRecognizer:", v6, v7))
  {
    -[SBSystemNotesContentViewController _handleThumbnailTapGesture:](self, "_handleThumbnailTapGesture:", v7);
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  if (!self->_thumbnailCooldownTimerFired)
    goto LABEL_8;
  SBLogSystemNotes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal for outside interaction after thumbnail cooldown", (uint8_t *)&v13, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = 1;
  objc_msgSend(WeakRetained, "contentViewControllerWantsDismissal:forReason:animated:", self, 1, 1);

LABEL_9:
  return v11;
}

- (void)_setPreferredSceneContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize *p_preferredSceneContentSize;
  id v14;

  height = a3.height;
  width = a3.width;
  v6 = SBSystemNotesMinimumWindowSize();
  v8 = v7;
  v9 = SBSystemNotesMaximumWindowSize();
  if (width < v6 || height < v8)
  {
    self->_preferredSceneContentSize.width = v6;
    self->_preferredSceneContentSize.height = v8;
  }
  else
  {
    p_preferredSceneContentSize = &self->_preferredSceneContentSize;
    if (width <= v9 && height <= v10)
    {
      p_preferredSceneContentSize->width = width;
      self->_preferredSceneContentSize.height = height;
    }
    else
    {
      p_preferredSceneContentSize->width = v9;
      self->_preferredSceneContentSize.height = v10;
    }
  }
  -[SBSystemNotesContentViewController view](self, "view", v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

}

- (CGRect)_sceneFrame
{
  int64_t v3;
  double width;
  double height;
  double v6;
  double v7;
  CGRect result;

  v3 = -[TRAParticipant sbf_currentOrientation](self->_traitsParticipant, "sbf_currentOrientation");
  if ((unint64_t)(v3 - 3) >= 2)
    width = self->_preferredSceneContentSize.width;
  else
    width = self->_preferredSceneContentSize.height;
  if ((unint64_t)(v3 - 3) >= 2)
    height = self->_preferredSceneContentSize.height;
  else
    height = self->_preferredSceneContentSize.width;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)_thumbnailViewForUserActivity:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemNotesContentViewController _imageFromUserActivity:presentationMode:](self, "_imageFromUserActivity:presentationMode:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3);
  objc_msgSend(v4, "setContentMode:", 2);

  return v4;
}

- (id)_imageFromUserActivity:(id)a3 presentationMode:(int64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v7 = (void *)MEMORY[0x1E0D62A58];
  v8 = a3;
  objc_msgSend(v7, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "previewForUserActivity:error:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v18;
  if (v11)
  {
    SBLogSystemNotes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesContentViewController _imageFromUserActivity:presentationMode:].cold.1();

  }
  if (a4)
  {
    if (a4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBSSystemNotesPresentationModeDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesContentViewController.m"), 792, CFSTR("unsupported presentationMode: %@"), v16);

      v14 = 0;
      goto LABEL_11;
    }
    v13 = (_QWORD *)MEMORY[0x1E0D62A50];
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0D62A48];
  }
  objc_msgSend(v10, "objectForKey:", *v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  id v7;
  id v8;
  SBNubView *nubView;
  char v10;

  v7 = a3;
  v8 = a5;
  nubView = self->_nubView;
  if (nubView && (-[SBNubView isHiddenOrHasHiddenAncestor](nubView, "isHiddenOrHasHiddenAncestor") & 1) == 0)
    v10 = -[SBNubView _isInAWindow](self->_nubView, "_isInAWindow");
  else
    v10 = 0;

  return v10;
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  +[SBNubView height](SBNubView, "height", a3);
  v4 = v3;
  +[SBNubView contentHeight](SBNubView, "contentHeight");
  v6 = v4 - v5;
  +[SBNubView hitTestPadding](SBNubView, "hitTestPadding");
  v7 = v6 * -0.5;
  v9 = -v8;
  v10 = v6 * -0.5;
  v11 = v9;
  result.right = v11;
  result.bottom = v7;
  result.left = v9;
  result.top = v10;
  return result;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
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

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self->_nubView);
  objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNubView contentView](self->_nubView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", v9 + -7.0, v11 + -4.0, v13 + 14.0, v15 + 8.0, (v13 + 14.0) * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SBSystemNotesContentViewController_sceneHandle_didCreateScene___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __65__SBSystemNotesContentViewController_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sbWindowSceneForSceneHandle:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "_acquireTraitsParticipantOnWindowSceneIfNecessary:", v5);
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SBSystemNotesContentViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant", a3, a4);
  SBLogSystemNotes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal for scene destruction (invalidation)", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contentViewControllerWantsDismissal:forReason:animated:", self, 2, 0);

}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    objc_msgSend(v5, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "canSendResponse")
      && (objc_msgSend(v12, "clientProcess"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.springboard.systemNotesScreenshot")),
          v13,
          v14))
    {
      objc_msgSend(v11, "displaysToScreenshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E20];
      v17 = objc_msgSend(v15, "count");
      if (v17 <= 1)
        v18 = 1;
      else
        v18 = v17;
      objc_msgSend(v16, "setWithCapacity:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = v15;
        v20 = v15;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v29);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v22);
        }

        v15 = v29;
      }
      else
      {
        objc_msgSend(v12, "settings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sb_displayIdentityForSceneManagers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v26);

      }
      v30 = v11;
      v27 = v19;
      BSDispatchMain();

      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke_2;
  v5[3] = &unk_1E8EA3290;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "contentViewController:didReceiveScreenshotRequestForDisplays:completion:", v3, v4, v5);

}

void __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0D017D0];
  v4 = a2;
  v8 = objc_alloc_init(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D018A8]), "initWithArray:", v4);

  objc_msgSend(v8, "setObject:forSetting:", v5, 0);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendResponse:", v7);

}

- (SBSystemNotesContentViewControllerDelegate)delegate
{
  return (SBSystemNotesContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_destroyWeak((id *)&self->_lastKnownWindowScene);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_pendingAnalyticsString, 0);
  objc_storeStrong((id *)&self->_thumbnailCooldownTimer, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_transientUIInteractionManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_placeholderProvider, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_thumbnailTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_nubView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_notesInteractionSettings, 0);
}

- (void)viewDidAppear:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[122], "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recursiveDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v5;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = v9;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ \n%{public}@", (uint8_t *)&v10, 0x20u);

}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] didActivateBacklinkItemWithUserActivity:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodBacklink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Pended] [Metrics] SYSystemPaperActivationMethodSwipePencil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipePencil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Pended] [Metrics] SYSystemPaperActivationMethodSwipeFinger", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeFinger", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[Metrics] SYSystemPaperActivationMethodKeyboard", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_sendActionForUpdatedConfiguration:sendCreateIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "asked to send an action but we don't have a scene for handle: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_sendActionForUpdatedConfiguration:sendCreateIfNecessary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "not sending any action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "received an error in response to SBSystemNotesCreateAction: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)containerViewController:(uint64_t *)a1 didSettleOnStashState:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[Metrics] %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForegroundStatus:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "PIP scene transition failed. sceneID: %{public}@", v5);

}

- (void)_imageFromUserActivity:presentationMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "previewForUserActivity:error: returned an error: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
