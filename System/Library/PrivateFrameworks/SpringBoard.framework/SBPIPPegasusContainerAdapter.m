@implementation SBPIPPegasusContainerAdapter

- (SBPIPPegasusContainerAdapter)initWithPictureInPictureViewController:(id)a3
{
  id v5;
  SBPIPPegasusContainerAdapter *v6;
  SBPIPPegasusContainerAdapter *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBPIPPegasusContainerAdapter;
  v6 = -[SBPIPPegasusContainerAdapter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pictureInPictureViewController, a3);
    -[PGPictureInPictureViewController setContentContainer:](v7->_pictureInPictureViewController, "setContentContainer:", v7);
    +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:](SBPIPContentViewLayoutMetrics, "pegasusMetricsForContentType:", objc_msgSend(v5, "contentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minimumStashedTabSize");
    v7->_minimumStashTabSize.width = v9;
    v7->_minimumStashTabSize.height = v10;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPPegasusContainerAdapter.m"), 94, CFSTR("Attempting to dealloc %@ without invalidating."), self);

  }
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPPegasusContainerAdapter;
  -[SBPIPPegasusContainerAdapter dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  SBPIPStashTabSuppressionPolicyProvider *stashTabVisibilityPolicyProvider;
  void *v5;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPPegasusContainerAdapter.m"), 101, CFSTR("Attempting to -invalidate twice; this is unsupported."));

  }
  self->_invalidated = 1;
  -[SBPIPPegasusContainerAdapter _invalidateVisibilityAssertion](self, "_invalidateVisibilityAssertion");
  -[PGPictureInPictureViewController setContentContainer:](self->_pictureInPictureViewController, "setContentContainer:", 0);
  -[SBPIPStashTabSuppressionPolicyProvider invalidate](self->_stashTabVisibilityPolicyProvider, "invalidate");
  stashTabVisibilityPolicyProvider = self->_stashTabVisibilityPolicyProvider;
  self->_stashTabVisibilityPolicyProvider = 0;

}

- (void)setContainerViewController:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerViewController, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(obj, "setPrefersHiddenFromClonedDisplay:", -[PGPictureInPictureViewController prefersHiddenFromClonedDisplay](self->_pictureInPictureViewController, "prefersHiddenFromClonedDisplay"));
  }

}

- (void)loadSubviewsForContainerViewController:(id)a3
{
  -[PGPictureInPictureViewController setMinimumStashTabSize:](self->_pictureInPictureViewController, "setMinimumStashTabSize:", a3, self->_minimumStashTabSize.width, self->_minimumStashTabSize.height);
  -[SBPIPPegasusContainerAdapter _reloadMenuButton](self, "_reloadMenuButton");
}

- (id)bundleIdentifierForContainerViewController:(id)a3
{
  void *v3;
  void *v4;

  -[PGPictureInPictureViewController application](self->_pictureInPictureViewController, "application", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scenePersistenceIdentifierForContainerViewController:(id)a3
{
  return (id)-[PGPictureInPictureViewController sourceSceneSessionPersistentIdentifier](self->_pictureInPictureViewController, "sourceSceneSessionPersistentIdentifier", a3);
}

- (int)processIdentifierForContainerViewController:(id)a3
{
  void *v3;
  int v4;

  -[PGPictureInPictureViewController application](self->_pictureInPictureViewController, "application", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "processIdentifier");

  return v4;
}

- (id)contentViewControllerForContainerViewController:(id)a3
{
  return self->_pictureInPictureViewController;
}

- (BOOL)shouldDisableIdleTimerForContainerViewController:(id)a3
{
  return -[PGPictureInPictureViewController prefersIdleTimerDisabled](self->_pictureInPictureViewController, "prefersIdleTimerDisabled", a3);
}

- (void)transitionAnimationWillBeginForContainerViewController:(id)a3
{
  -[PGPictureInPictureViewController setCanStartShowingChrome:](self->_pictureInPictureViewController, "setCanStartShowingChrome:", 0);
}

- (void)transitionAnimationDidEndForContainerViewController:(id)a3
{
  -[PGPictureInPictureViewController setCanStartShowingChrome:](self->_pictureInPictureViewController, "setCanStartShowingChrome:", 1);
}

- (id)morphAnimatorTargetViewForContainerViewController:(id)a3
{
  return (id)-[PGPictureInPictureViewController view](self->_pictureInPictureViewController, "view", a3);
}

- (id)morphAnimatorTargetContainerViewForContainerViewController:(id)a3
{
  return (id)-[PGPictureInPictureViewController contentContainerView](self->_pictureInPictureViewController, "contentContainerView", a3);
}

- (void)containerViewController:(id)a3 didUpdateContentViewFrame:(CGRect)a4 reason:(id)a5
{
  -[PGPictureInPictureViewController updateHostedWindowSize:](self->_pictureInPictureViewController, "updateHostedWindowSize:", a3, a5, a4.size.width, a4.size.height);
}

- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  v7 = a5;
  -[PGPictureInPictureViewController setStashed:](self->_pictureInPictureViewController, "setStashed:", v5);
  if (!v5)
    -[PGPictureInPictureViewController setStashTabHidden:left:withSpringBehavior:](self->_pictureInPictureViewController, "setStashTabHidden:left:withSpringBehavior:", 1, 0, v7);
  -[SBPIPPegasusContainerAdapter _createOrInvalidateStashTabVisibilityPolicyProvider](self, "_createOrInvalidateStashTabVisibilityPolicyProvider");

}

- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  self->_isAnyInteractionGestureActive = 1;
  -[SBPIPPegasusContainerAdapter _createOrInvalidateStashTabVisibilityPolicyProvider](self, "_createOrInvalidateStashTabVisibilityPolicyProvider", a3, a4);
}

- (void)containerViewControllerDidEndInteraction:(id)a3
{
  self->_isAnyInteractionGestureActive = 0;
  -[SBPIPPegasusContainerAdapter _createOrInvalidateStashTabVisibilityPolicyProvider](self, "_createOrInvalidateStashTabVisibilityPolicyProvider", a3);
}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  if (!self->_isChangingSize)
  {
    self->_isChangingSize = 1;
    -[PGPictureInPictureViewController hostedWindowSizeChangeBegan](self->_pictureInPictureViewController, "hostedWindowSizeChangeBegan", a3);
    -[PGPictureInPictureViewController setInteractivelyResizing:](self->_pictureInPictureViewController, "setInteractivelyResizing:", a4 != 0);
  }
}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  PGPictureInPictureViewController *pictureInPictureViewController;
  void *v5;
  double v6;
  double v7;

  if (self->_isChangingSize)
  {
    self->_isChangingSize = 0;
    -[PGPictureInPictureViewController setInteractivelyResizing:](self->_pictureInPictureViewController, "setInteractivelyResizing:", 0);
    pictureInPictureViewController = self->_pictureInPictureViewController;
    -[PGPictureInPictureViewController view](pictureInPictureViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[PGPictureInPictureViewController updateHostedWindowSize:](pictureInPictureViewController, "updateHostedWindowSize:", v6, v7);

    -[PGPictureInPictureViewController hostedWindowSizeChangeEnded](self->_pictureInPictureViewController, "hostedWindowSizeChangeEnded");
  }
}

- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  -[PGPictureInPictureViewController setStashTabHidden:left:withSpringBehavior:](self->_pictureInPictureViewController, "setStashTabHidden:left:withSpringBehavior:", v9, v8, a6);
  v11 = v12;
  if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
    v11 = v12;
  }

}

- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4
{
  -[PGPictureInPictureViewController setStashProgress:](self->_pictureInPictureViewController, "setStashProgress:", a3, a4);
}

- (BOOL)isStashTabHiddenForContainerViewController:(id)a3
{
  return -[PGPictureInPictureViewController isStashTabHidden](self->_pictureInPictureViewController, "isStashTabHidden", a3);
}

- (void)containerViewControllerStartReducingResourcesUsage:(id)a3
{
  -[PGPictureInPictureViewController setContentViewHidden:](self->_pictureInPictureViewController, "setContentViewHidden:", 1);
}

- (void)containerViewControllerStopReducingResourcesUsage:(id)a3
{
  -[PGPictureInPictureViewController setContentViewHidden:](self->_pictureInPictureViewController, "setContentViewHidden:", 0);
}

- (void)notePictureInPictureViewControllerTetheringDidUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
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
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  -[PGPictureInPictureViewController tetheredViewController](self->_pictureInPictureViewController, "tetheredViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureViewController tetheringViewController](self->_pictureInPictureViewController, "tetheringViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipControllerForType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPPegasusContainerAdapter.m"), 244, CFSTR("SBPIPController was expected"));

  }
  v8 = -[PGPictureInPictureViewController tetheringMode](self->_pictureInPictureViewController, "tetheringMode");
  objc_msgSend((id)objc_opt_class(), "defaultContentCornerRadius");
  if (v5)
  {
    if (v8 == 1)
      -[PGPictureInPictureViewController setContentCornerRadius:animated:](self->_pictureInPictureViewController, "setContentCornerRadius:animated:", 1, v9 + -4.0);
    objc_msgSend(v7, "containerViewControllerForContentViewController:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTetheringContainerViewController:", v10);
    objc_msgSend(WeakRetained, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v16)
      objc_msgSend(v12, "setWindowScene:", v16);

    if (v4)
      goto LABEL_9;
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  -[PGPictureInPictureViewController setContentCornerRadius:animated:](self->_pictureInPictureViewController, "setContentCornerRadius:animated:", 1);
  if (!v4)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(v7, "containerViewControllerForContentViewController:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  objc_msgSend(WeakRetained, "setTetheredContainerViewController:", v17);
  objc_msgSend(WeakRetained, "setIsActivelyTethered:mode:", v5 != 0, v8);
  objc_msgSend(WeakRetained, "_sbWindowScene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bringTetheredContentToFrontOnWindowScene:", v18);

}

- (void)preferredContentSizeDidChangeForPictureInPictureViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  -[PGPictureInPictureViewController preferredContentSize](self->_pictureInPictureViewController, "preferredContentSize");
  objc_msgSend(WeakRetained, "updatePreferredContentSize:");

}

- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  SBPIPContainerViewControllerAdapterContextProviding **p_containerViewController;
  void (**v12)(_QWORD);
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_containerViewController = &self->_containerViewController;
  v12 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(WeakRetained, "startAnimationWillBeginWithInitialInterfaceOrientation:initialFrame:", a3, x, y, width, height);

  v12[2](v12);
  -[SBPIPPegasusContainerAdapter _acquireVisibilityAssertionIfNeeded](self, "_acquireVisibilityAssertionIfNeeded");
}

- (void)performStartAnimationWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v4 = a3;
  -[SBPIPPegasusContainerAdapter _acquireVisibilityAssertionIfNeeded](self, "_acquireVisibilityAssertionIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = objc_msgSend(WeakRetained, "windowInterfaceOrientation");
  objc_msgSend(WeakRetained, "startShowingContentWithAnimationSettings:parameters:completion:", 0, 0, 0.0, 0.0, 0.0);
  v7 = (void *)MEMORY[0x1E0D6C9C8];
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E8E9DE88;
  v16 = WeakRetained;
  v17 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E8EBD2B8;
  v12 = v16;
  v13 = v4;
  v14 = v6;
  v9 = v16;
  v10 = v4;
  objc_msgSend(v7, "animateViewWithAnimationType:initialSpringVelocity:animations:completion:", 0, v15, v11, 0.0);

}

uint64_t __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAnimationDidBeginWithInitialInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

uint64_t __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "startAnimationDidCompleteWithInitialInterfaceOrientation:", *(_QWORD *)(a1 + 48));
}

- (void)performStartInIsolationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  id v16;

  v4 = a3;
  -[SBPIPPegasusContainerAdapter _acquireVisibilityAssertionIfNeeded](self, "_acquireVisibilityAssertionIfNeeded");
  -[PGPictureInPictureViewController showChrome:animated:](self->_pictureInPictureViewController, "showChrome:animated:", 1, 0);
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fadeInOutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fadeInOutAnimationSettings");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fadeInOutSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fadeInInitialValues");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "startShowingContentWithAnimationSettings:parameters:completion:", v16, v4, v10, v12, v14);

}

- (void)performStopInIsolationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fadeInOutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fadeInOutAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fadeInOutSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fadeOutFinalValues");
  v11 = v10;
  v13 = v12;
  v15 = v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__SBPIPPegasusContainerAdapter_performStopInIsolationWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E8E9F1E8;
  v18[4] = self;
  v19 = v4;
  v17 = v4;
  objc_msgSend(WeakRetained, "stopShowingContentWithAnimationSettings:parameters:completion:", v7, v18, v11, v13, v15);

}

uint64_t __76__SBPIPPegasusContainerAdapter_performStopInIsolationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibilityAssertion");
}

- (void)performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id WeakRetained;
  uint64_t v12;
  PGPictureInPictureViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t (*__ptr32 *v23)();
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51[6];
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  id location[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "_sbWindowScene");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v13 = self->_pictureInPictureViewController;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureViewController sourceSceneSessionPersistentIdentifier](v13, "sourceSceneSessionPersistentIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sceneManagerForPersistenceIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v12;
  v44 = v10;

  -[PGPictureInPictureViewController sourceSceneSessionPersistentIdentifier](v13, "sourceSceneSessionPersistentIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "existingSceneHandleForPersistenceIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sceneIfExists");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isForeground");
  v22 = MEMORY[0x1E0C809B0];
  v23 = &off_1D0E87000;
  if (!v21)
  {
    v26 = 0;
    goto LABEL_12;
  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "windowSceneForDisplayIdentity:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "switcherController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "application");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isMedusaCapable") & 1) != 0)
    goto LABEL_9;
  v29 = objc_msgSend(v27, "isChamoisWindowingUIEnabled");

  if (v29)
  {
    objc_msgSend(v27, "layoutState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appLayout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
    v52[3] = &unk_1E8EA85E0;
    v53 = v18;
    v54 = &v55;
    v42 = v30;
    objc_msgSend(v30, "enumerate:", v52);
    if (v56[3])
    {
      -[PGPictureInPictureViewController view](v13, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "window");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = a3;
      if (!a3)
        v32 = objc_msgSend(v41, "interfaceOrientation");
      objc_msgSend(v27, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v56[3], v42, v32);
      objc_msgSend(v41, "_convertRectToSceneReferenceSpace:");
      x = v33;
      y = v34;
      width = v35;
      height = v36;

    }
    _Block_object_dispose(&v55, 8);

LABEL_9:
  }

  v22 = MEMORY[0x1E0C809B0];
  v23 = &off_1D0E87000;
LABEL_12:
  v46[0] = v22;
  v46[1] = *((_QWORD *)v23 + 445);
  v46[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v46[3] = &unk_1E8EBD308;
  v37 = v26;
  v47 = v37;
  v38 = v43;
  v48 = v38;
  v39 = WeakRetained;
  v49 = v39;
  objc_copyWeak(v51, location);
  v51[1] = (id)a3;
  v51[2] = *(id *)&x;
  v51[3] = *(id *)&y;
  v51[4] = *(id *)&width;
  v51[5] = *(id *)&height;
  v40 = v44;
  v50 = v40;
  objc_msgSend(v39, "performAfterInFlightAnimationsComplete:", v46);

  objc_destroyWeak(v51);
  objc_destroyWeak(location);

}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && v2 != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
  v6[3] = &unk_1E8EBD2E0;
  v7 = *(id *)(a1 + 56);
  objc_copyWeak(&v8, (id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", v5, v6, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_destroyWeak(&v8);

}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateVisibilityAssertion");

}

- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  _QWORD v21[4];
  id v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id location;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "stopAnimationWillBeginWithFinalInterfaceOrientation:finalFrame:", a3, x, y, width, height);
  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0D6C9C8];
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
  v21[3] = &unk_1E8EA4938;
  v22 = WeakRetained;
  v23 = a3;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v17[3] = &unk_1E8EBD330;
  v15 = v11;
  v19 = v15;
  v16 = v22;
  v18 = v16;
  v20[1] = (id)a3;
  objc_copyWeak(v20, &location);
  objc_msgSend(v13, "animateViewWithAnimationType:initialSpringVelocity:animations:completion:", 0, v21, v17, 0.0);
  objc_destroyWeak(v20);

  objc_destroyWeak(&location);
}

uint64_t __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAnimationDidBeginWithFinalInterfaceOrientation:finalFrame:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "stopAnimationDidCompleteWithFinalInterfaceOrientation:", *(_QWORD *)(a1 + 56));
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_invalidateVisibilityAssertion");

  }
}

- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  int64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[4];
  id v34;
  int64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ((unint64_t)(a3 - 1) >= 3)
    v8 = 0;
  else
    v8 = a3;
  -[PGPictureInPictureViewController view](self->_pictureInPictureViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(WeakRetained, "rotationAnimationWillBeginToRotation:contentViewFrame:", v8, v11, v13, v15, v17);
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "interactionSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rotationFluidBehavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CEABB0];
  v22 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke;
  v33[3] = &unk_1E8EA4938;
  v34 = WeakRetained;
  v35 = v8;
  v36 = v11;
  v37 = v13;
  v38 = v15;
  v39 = v17;
  v25[0] = v22;
  v25[1] = 3221225472;
  v25[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_3;
  v25[3] = &unk_1E8EBD358;
  v27 = v6;
  v28 = v8;
  v29 = v11;
  v30 = v13;
  v31 = v15;
  v32 = v17;
  v26 = v34;
  v23 = v6;
  v24 = v34;
  objc_msgSend(v21, "_animateUsingSpringBehavior:tracking:animations:completion:", v20, 1, v33, v25);

}

void __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  id v6;
  uint64_t v7;
  __int128 v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  CAFrameRateRange v15;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v15.minimum;
  maximum = v15.maximum;
  preferred = v15.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_2;
  v10[3] = &unk_1E8EA4938;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v8 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 48);
  v14 = v8;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114140, v10, COERCE_DOUBLE(__PAIR64__(DWORD1(v13), LODWORD(minimum))), *(double *)&v8, v9);

}

uint64_t __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rotationAnimationDidBeginToRotation:contentViewFrame:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "rotationAnimationWillCompleteToRotation:contentViewFrame:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "rotationAnimationDidCompleteToRotation:contentViewFrame:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)acquireInterfaceOrientationLock
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "acquireInterfaceOrientationLock");

}

- (void)relinquishInterfaceOrientationLock
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "relinquishInterfaceOrientationLock");

}

- (BOOL)handleDoubleTapGesture
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = objc_msgSend(WeakRetained, "toggleUserPreferredScale");

  return v3;
}

- (BOOL)handleTapWhileStashedGesture
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setStashed:", 0);
  v3 = objc_msgSend(WeakRetained, "isStashed") ^ 1;

  return v3;
}

- (void)notePictureInPictureViewControllerPrefersHiddenFromClonedDisplayDidChange
{
  id WeakRetained;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "setPrefersHiddenFromClonedDisplay:", -[PGPictureInPictureViewController prefersHiddenFromClonedDisplay](self->_pictureInPictureViewController, "prefersHiddenFromClonedDisplay"));

  }
}

- (void)pictureInPictureClientDidRequestStashing
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setStashed:", 1);

}

- (NSNumber)overrideResourcesUsageReductionTimeout
{
  void *v3;

  v3 = &unk_1E91CFA48;
  if (-[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType") != 4
    && -[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType") != 5)
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)shouldSuppressAssociatedElementsInSystemAperture
{
  int v3;
  void *v5;
  void *v6;

  if (-[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType") == 1
    || -[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType") == 2)
  {
    LOBYTE(v3) = 1;
  }
  else if (-[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType") == 4)
  {
    -[PGPictureInPictureViewController application](self->_pictureInPictureViewController, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = BSEqualStrings() ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)debugName
{
  uint64_t v2;

  v2 = -[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType");
  if ((unint64_t)(v2 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E8EBD3B8[v2 - 1];
}

- (id)defaultPositionHyperregionComposers
{
  SBPIPMultidisplayHyperregionComposer *pipPositionHyperregionComposer;
  SBPIPMultidisplayHyperregionComposer *v4;
  SBPIPMultidisplayHyperregionComposer *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  pipPositionHyperregionComposer = self->_pipPositionHyperregionComposer;
  if (!pipPositionHyperregionComposer)
  {
    v4 = objc_alloc_init(SBPIPMultidisplayHyperregionComposer);
    v5 = self->_pipPositionHyperregionComposer;
    self->_pipPositionHyperregionComposer = v4;

    pipPositionHyperregionComposer = self->_pipPositionHyperregionComposer;
  }
  v7[0] = pipPositionHyperregionComposer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutSettings
{
  SBPIPContentViewLayoutSettings *v3;
  void *v4;
  SBPIPContentViewLayoutSettings *v5;

  v3 = [SBPIPContentViewLayoutSettings alloc];
  +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:](SBPIPContentViewLayoutMetrics, "pegasusMetricsForContentType:", -[PGPictureInPictureViewController contentType](self->_pictureInPictureViewController, "contentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureViewController preferredContentSize](self->_pictureInPictureViewController, "preferredContentSize");
  v5 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v3, "initWithPlatformMetrics:contentSize:", v4);

  return v5;
}

- (id)systemGestureManagerForInteractionControllerResizing:(id)a3
{
  return 0;
}

- (double)currentCornerRadiusForInteractionController:(id)a3
{
  double result;

  -[PGPictureInPictureViewController currentContentCornerRadius](self->_pictureInPictureViewController, "currentContentCornerRadius", a3);
  return result;
}

- (id)systemPointerInteractionManagerForInteractionController:(id)a3
{
  void *v3;
  void *v4;

  -[PGPictureInPictureViewController _sbWindowScene](self->_pictureInPictureViewController, "_sbWindowScene", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemPointerInteractionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3
{
  return 0;
}

- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4
{
  SBPIPContainerViewControllerAdapterContextProviding **p_containerViewController;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  p_containerViewController = &self->_containerViewController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(WeakRetained, "effectiveEdgeInsetsForWindowScene:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4
{
  id WeakRetained;
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
  double v16;
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "stashedPadding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)interactionControllerConnectedWindowScenes:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "connectedWindowScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldPointerInteractionBeginForInteractionController:(id)a3 atLocation:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  id v22;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[PGPictureInPictureViewController _sbWindowScene](self->_pictureInPictureViewController, "_sbWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pictureInPictureManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isZStackForegroundActive"))
  {
    -[PGPictureInPictureViewController view](self->_pictureInPictureViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toView:", v11, x, y);
    v13 = v12;
    v15 = v14;

    -[PGPictureInPictureViewController view](self->_pictureInPictureViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hitTest:withEvent:", 0, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v22 = v20;

    if (v22)
      v21 = objc_msgSend(v22, "isHovered") ^ 1;
    else
      LOBYTE(v21) = 1;

  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (void)stashTabVisibilityPolicyProviderDidUpdatePolicy:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "stashTabCanBeHidden");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[provider stashTabCanBeHidden] %{BOOL}u", (uint8_t *)v6, 8u);
  }

  -[PGPictureInPictureViewController setPrefersStashTabSuppressed:](self->_pictureInPictureViewController, "setPrefersStashTabSuppressed:", objc_msgSend(v4, "stashTabCanBeHidden"));
}

- (void)_reloadMenuButton
{
  void *v3;
  uint64_t v4;
  UIButton *menuButton;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
  uint64_t v12;

  -[PGPictureInPictureViewController menuItems](self->_pictureInPictureViewController, "menuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  menuButton = self->_menuButton;
  if (v4)
  {
    if (!menuButton)
    {
      +[SBPIPMenuButton pipMenuButton](SBPIPMenuButton, "pipMenuButton");
      v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v7 = self->_menuButton;
      self->_menuButton = v6;

    }
    -[PGPictureInPictureViewController menuItems](self->_pictureInPictureViewController, "menuItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_map:", &__block_literal_global_350);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = self->_menuButton;
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithChildren:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](v9, "setMenu:", v10);

    v11 = (UIButton *)v12;
  }
  else
  {
    -[UIButton removeFromSuperview](menuButton, "removeFromSuperview");
    v11 = self->_menuButton;
    self->_menuButton = 0;
  }

}

id __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v2 = a2;
  objc_initWeak(&location, v2);
  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "buttonFontSize");
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v2, "symbolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemImageNamed:withConfiguration:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(v2, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke_2;
  v13[3] = &unk_1E8EA3C88;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v8, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

void __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invokeAction");

}

- (void)_createOrInvalidateStashTabVisibilityPolicyProvider
{
  SBPIPStashTabSuppressionPolicyProvider *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SBPIPStashTabSuppressionPolicyProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  SBPIPStashTabSuppressionPolicyProvider *v11;
  SBPIPStashTabSuppressionPolicyProvider *stashTabVisibilityPolicyProvider;
  id v13;

  if (!self->_isAnyInteractionGestureActive
    && -[PGPictureInPictureViewController stashed](self->_pictureInPictureViewController, "stashed")
    && -[PGPictureInPictureViewController wantsStashTabSuppression](self->_pictureInPictureViewController, "wantsStashTabSuppression"))
  {
    if (!self->_stashTabVisibilityPolicyProvider)
    {
      -[PGPictureInPictureViewController _sbWindowScene](self->_pictureInPictureViewController, "_sbWindowScene");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sceneManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pictureInPictureManager");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v4)
      {
        if (v5)
        {
          v7 = [SBPIPStashTabSuppressionPolicyProvider alloc];
          objc_msgSend((id)SBApp, "bannerManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sceneManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pictureInPictureManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SBPIPStashTabSuppressionPolicyProvider initWithObserver:bannerManager:sceneManager:pipManager:](v7, "initWithObserver:bannerManager:sceneManager:pipManager:", self, v8, v9, v10);
          stashTabVisibilityPolicyProvider = self->_stashTabVisibilityPolicyProvider;
          self->_stashTabVisibilityPolicyProvider = v11;

        }
      }

    }
  }
  else
  {
    -[SBPIPStashTabSuppressionPolicyProvider invalidate](self->_stashTabVisibilityPolicyProvider, "invalidate");
    v3 = self->_stashTabVisibilityPolicyProvider;
    self->_stashTabVisibilityPolicyProvider = 0;

    -[PGPictureInPictureViewController setPrefersStashTabSuppressed:](self->_pictureInPictureViewController, "setPrefersStashTabSuppressed:", 0);
  }
}

- (void)_acquireVisibilityAssertionIfNeeded
{
  PGPictureInPictureViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *visibilityAssertion;
  id v16;

  if (!self->_visibilityAssertion)
  {
    v3 = self->_pictureInPictureViewController;
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureViewController sourceSceneSessionPersistentIdentifier](v3, "sourceSceneSessionPersistentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneManagerForPersistenceIdentifier:", v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[PGPictureInPictureViewController sourceSceneSessionPersistentIdentifier](v3, "sourceSceneSessionPersistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "existingSceneHandleForPersistenceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appProtectionAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - p"), v12, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acquireVisibilityAssertionForReason:", v13);
    v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    visibilityAssertion = self->_visibilityAssertion;
    self->_visibilityAssertion = v14;

  }
}

- (void)_invalidateVisibilityAssertion
{
  BSInvalidatable *visibilityAssertion;
  BSInvalidatable *v3;

  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;
  v3 = visibilityAssertion;

  -[BSInvalidatable invalidate](v3, "invalidate");
}

- (PGPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_offScreenHyperregionComposers, 0);
  objc_storeStrong((id *)&self->_pipPositionHyperregionComposer, 0);
  objc_storeStrong((id *)&self->_stashTabVisibilityPolicyProvider, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
}

@end
