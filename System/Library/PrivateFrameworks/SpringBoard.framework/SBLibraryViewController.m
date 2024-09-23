@implementation SBLibraryViewController

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation", a3, a4);
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");
  -[SBLibraryViewController _evaluateFirstResponderStatus](self, "_evaluateFirstResponderStatus");
}

- (void)_evaluateFirstResponderStatus
{
  if (-[SBLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared")
    && -[SBLibraryViewController _isPresentationForegroundModal](self, "_isPresentationForegroundModal"))
  {
    -[SBLibraryViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    -[SBLibraryViewController resignFirstResponder](self, "resignFirstResponder");
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(a4, "toLayoutState", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unlockedEnvironmentMode") == 1)
  {
    v6 = (void *)*MEMORY[0x1E0CEB258];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __98__SBLibraryViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v8[3] = &unk_1E8E9DED8;
    v8[4] = self;
    objc_msgSend(v6, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);
  }
  else
  {
    -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SBLibraryViewController setUseSnapshotAsBackgroundViewAssertion:](self, "setUseSnapshotAsBackgroundViewAssertion:", 0);
  }
  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation");

}

- (BSInvalidatable)useSnapshotAsBackgroundViewAssertion
{
  return self->_useSnapshotAsBackgroundViewAssertion;
}

- (void)setUseSnapshotAsBackgroundViewAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_useSnapshotAsBackgroundViewAssertion, a3);
}

uint64_t __98__SBLibraryViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary");
}

- (void)_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[SBLibraryViewController _currentLayoutState](self, "_currentLayoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockedEnvironmentMode");

  if (-[SBLibraryViewController _appearState](self, "_appearState") == 2
    && !-[SBLibraryViewController isRotating](self, "isRotating")
    && v4 == 1)
  {
    -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[SBHLibraryViewController presenter](self, "presenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "acquireUseSnapshotAsBackgroundViewAssertionForReason:", CFSTR("SBLibraryViewControllerSnapshotBackgroundViewReason"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[SBLibraryViewController setUseSnapshotAsBackgroundViewAssertion:](self, "setUseSnapshotAsBackgroundViewAssertion:", v7);
    }
  }
}

- (void)_evaluateAsyncRenderingAssertion
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  SBAsynchronousRenderingAssertion *v10;
  objc_class *v11;
  void *v12;
  SBAsynchronousRenderingAssertion *v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = -[SBLibraryViewController _isPresentationForegroundModal](self, "_isPresentationForegroundModal");
  -[SBLibraryViewController _currentLayoutState](self, "_currentLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");

  v6 = 0;
  if (v3 && v5 == 3)
    v6 = !-[SBLibraryViewController isRotating](self, "isRotating");
  -[SBLibraryViewController asynchronousRenderingAssertion](self, "asynchronousRenderingAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isValid");

  if (!v6 || (v8 & 1) != 0)
  {
    if (((v6 | v8 ^ 1) & 1) == 0)
    {
      SBLogAppLibrary();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[SBLibraryViewController] Updating async rendering assertion to: Relinquished", v16, 2u);
      }

      -[SBLibraryViewController asynchronousRenderingAssertion](self, "asynchronousRenderingAssertion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      -[SBLibraryViewController setAsynchronousRenderingAssertion:](self, "setAsynchronousRenderingAssertion:", 0);
    }
  }
  else
  {
    SBLogAppLibrary();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBLibraryViewController] Updating async rendering assertion to: Acquired", buf, 2u);
    }

    v10 = [SBAsynchronousRenderingAssertion alloc];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBAsynchronousRenderingAssertion initWithReason:](v10, "initWithReason:", v12);
    -[SBLibraryViewController setAsynchronousRenderingAssertion:](self, "setAsynchronousRenderingAssertion:", v13);

  }
}

- (void)_evaluateAffordanceActivation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  _BOOL4 v11;
  int v12;
  unsigned int v13;
  id v14;

  -[SBHLibraryViewController barSwipeViewController](self, "barSwipeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = v3;
    -[SBHLibraryViewController presenter](self, "presenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLibraryPresentationModal");
    -[SBLibraryViewController _currentLayoutState](self, "_currentLayoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unlockedEnvironmentMode");

    if ((-[SBLibraryViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) != 0)
    {
LABEL_3:
      v8 = 0;
LABEL_15:
      objc_msgSend(v14, "setWantsToBeActiveAffordance:", v8);

      v3 = v14;
      goto LABEL_16;
    }
    v9 = objc_msgSend(v4, "isPresentingLibraryInMostForegroundState:", self);
    if (v5)
    {
      if ((v9 & 1) == 0)
        goto LABEL_3;
    }
    else
    {
      v8 = 0;
      if (!v9 || v7 != 1)
        goto LABEL_15;
    }
    v10 = -[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder");
    v11 = -[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch");
    if (v7 == 1)
      v12 = 0;
    else
      v12 = v5;
    v13 = v11 | v12;
    if (v10)
      v8 = 1;
    else
      v8 = v13;
    goto LABEL_15;
  }
LABEL_16:

}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (BOOL)_isPresentationForegroundModal
{
  SBLibraryViewController *v2;
  void *v3;
  char v4;

  v2 = self;
  -[SBHLibraryViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLibraryPresentationModal");
  LOBYTE(v2) = v4 & objc_msgSend(v3, "isPresentingLibraryInMostForegroundState:", v2);

  return (char)v2;
}

- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI", a3))
  {
    -[SBHLibraryViewController barSwipeViewController](self, "barSwipeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "wantsToBeActiveAffordance"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = -[SBLibraryViewController isViewLoaded](self, "isViewLoaded");

    if (v5)
    {
      -[SBLibraryViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      return v7;
    }
  }
  v7 = 0;
  return v7;
}

- (SBLibraryViewController)initWithCategoryMapProvider:(id)a3 windowScene:(id)a4
{
  id v6;
  SBLibraryViewController *v7;
  SBLibraryViewController *v8;
  void *v9;
  SBBarSwipeAffordanceViewController *v10;
  void *v11;
  uint64_t v12;
  ATXAppDirectoryClient *loggingClient;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBLibraryViewController;
  v7 = -[SBHLibraryViewController initWithCategoryMapProvider:](&v15, sel_initWithCategoryMapProvider_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_windowScene, v6);
    objc_msgSend(v6, "layoutStateTransitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v8);

    if (SBHomeGestureEnabled())
    {
      v10 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceViewController alloc], "initWithZStackParticipantIdentifier:windowScene:", 3, v6);
      -[SBBarSwipeAffordanceViewController setDelegate:](v10, "setDelegate:", v8);
      -[SBBarSwipeAffordanceViewController view](v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColorBias:", 2);
      objc_msgSend(v11, "setIgnoresLuminance:", 1);
      objc_msgSend(v11, "addObserver:", v8);
      objc_msgSend(v11, "setDelegate:", v8);
      objc_msgSend(v11, "setUserInteractionEnabled:", 0);
      -[SBHLibraryViewController setBarSwipeViewController:](v8, "setBarSwipeViewController:", v10);

    }
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    loggingClient = v8->_loggingClient;
    v8->_loggingClient = (ATXAppDirectoryClient *)v12;

    -[SBHLibraryViewController addObserver:](v8, "addObserver:", v8);
  }

  return v8;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!-[SBLibraryViewController isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[SBLibraryViewController isInvalidated](self, "isInvalidated"))
  {
    -[SBLibraryViewController setInvalidated:](self, "setInvalidated:", 1);
    -[SBLibraryViewController windowScene](self, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutStateTransitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[SBLibraryViewController expandedPodDisplayLayoutElementAssertion](self, "expandedPodDisplayLayoutElementAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[SBLibraryViewController asynchronousRenderingAssertion](self, "asynchronousRenderingAssertion");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SBLibraryViewController setRotating:](self, "setRotating:", 1);
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");
  -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[SBLibraryViewController setUseSnapshotAsBackgroundViewAssertion:](self, "setUseSnapshotAsBackgroundViewAssertion:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E8E9EA28;
  v10[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v10);
  v9.receiver = self;
  v9.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setRotating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_evaluateAsyncRenderingAssertion");
  v2 = (void *)*MEMORY[0x1E0CEB258];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_performBlockAfterCATransactionSynchronizedCommit:", v4);
}

uint64_t __78__SBLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBLibraryViewController;
  v4 = a3;
  -[SBLibraryViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  -[SBLibraryViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "invalidate");
      -[SBLibraryViewController setUseSnapshotAsBackgroundViewAssertion:](self, "setUseSnapshotAsBackgroundViewAssertion:", 0);
      v10 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__SBLibraryViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E8E9DED8;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
    }

  }
}

uint64_t __52__SBLibraryViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary");
}

- (void)setPresenter:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController presenter](&v10, sel_presenter);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLibraryViewController;
    -[SBHLibraryViewController setPresenter:](&v9, sel_setPresenter_, v4);
    v6 = objc_msgSend(v4, "isLibraryPresentationModal");
    -[SBHLibraryViewController barSwipeViewController](self, "barSwipeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActivationPolicyForParticipantsBelow:", v6);

    if ((objc_msgSend(v4, "hasBackgroundBlur") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibraryViewController setOverrideLegibilitySettings:](self, "setOverrideLegibilitySettings:", v8);

    }
    else
    {
      -[SBHLibraryViewController setOverrideLegibilitySettings:](self, "setOverrideLegibilitySettings:", 0);
    }
  }

}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBLibraryViewController;
  -[SBHLibraryViewController overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:](&v8, sel_overlayController_didChangePresentationProgress_newPresentationProgress_fromLeading_, a3, a4);
  if (!a6)
    -[SBLibraryViewController _setStatusBarSettingsAssertionActive:quickly:](self, "_setStatusBarSettingsAssertionActive:quickly:", BSFloatGreaterThanFloat(), 1);
}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  -[SBLibraryViewController _setExpandedPodDisplayLayoutElementActive:](self, "_setExpandedPodDisplayLayoutElementActive:", 1, a4);
  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation");
}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  -[SBLibraryViewController _setExpandedPodDisplayLayoutElementActive:](self, "_setExpandedPodDisplayLayoutElementActive:", 0, a4);
  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation");
}

- (void)libraryViewControllerWillPresent:(id)a3
{
  void *v4;
  int v5;

  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation", a3);
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");
  -[SBLibraryViewController _evaluateFirstResponderStatus](self, "_evaluateFirstResponderStatus");
  -[SBHLibraryViewController presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLibraryPresentationModal");

  if (v5)
    -[SBLibraryViewController _setStatusBarSettingsAssertionActive:](self, "_setStatusBarSettingsAssertionActive:", 1);
}

- (void)libraryViewControllerDidPresent:(id)a3
{
  void *v4;
  void *v5;

  -[SBLibraryViewController loggingClient](self, "loggingClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logDidEnterAppDirectoryWithDate:", v5);

  -[SBLibraryViewController _acquireUseSnapshotAsBackgroundViewAssertionIfNecessary](self, "_acquireUseSnapshotAsBackgroundViewAssertionIfNecessary");
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");
}

- (void)libraryViewControllerWillDismiss:(id)a3
{
  void *v4;
  int v5;

  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation", a3);
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");
  -[SBLibraryViewController _evaluateFirstResponderStatus](self, "_evaluateFirstResponderStatus");
  -[SBHLibraryViewController presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLibraryPresentationModal");

  if (v5)
    -[SBLibraryViewController _setStatusBarSettingsAssertionActive:](self, "_setStatusBarSettingsAssertionActive:", 0);
}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SBHLibraryViewController libraryCategoryMap](self, "libraryCategoryMap", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAA820]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SBLibraryViewController loggingClient](self, "loggingClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logDidLeaveAppDirectoryWithDate:appDirectoryResponse:", v7, v9);

  -[SBLibraryViewController useSnapshotAsBackgroundViewAssertion](self, "useSnapshotAsBackgroundViewAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[SBLibraryViewController setUseSnapshotAsBackgroundViewAssertion:](self, "setUseSnapshotAsBackgroundViewAssertion:", 0);
  -[SBLibraryViewController _evaluateAsyncRenderingAssertion](self, "_evaluateAsyncRenderingAssertion");

}

- (void)libraryViewController:(id)a3 didPresentSearchController:(id)a4
{
  void *v5;
  void *v6;

  -[SBLibraryViewController loggingClient](self, "loggingClient", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logOpenSearchWithDate:", v6);

  -[SBLibraryViewController _evaluateAffordanceActivation](self, "_evaluateAffordanceActivation");
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  void *v4;
  id v5;

  -[SBLibraryViewController loggingClient](self, "loggingClient", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logCloseSearchWithDate:", v4);

}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  unint64_t v4;

  v4 = 60;
  if (a4 != 3)
    v4 = 0;
  if (a4 == 1)
    return 59;
  else
    return v4;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHLibraryViewController barSwipeViewController](self, "barSwipeViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", objc_msgSend(v6, "activationPolicyForParticipantsBelow"));

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLibraryViewController;
  v6 = a4;
  -[SBLibraryViewController pressesBegan:withEvent:](&v7, sel_pressesBegan_withEvent_, a3, v6);
  -[SBLibraryViewController _handlePressesBegan:](self, "_handlePressesBegan:", v6, v7.receiver, v7.super_class);

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  -[SBLibraryViewController pressesChanged:withEvent:](&v4, sel_pressesChanged_withEvent_, a3, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  -[SBLibraryViewController pressesEnded:withEvent:](&v4, sel_pressesEnded_withEvent_, a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLibraryViewController;
  -[SBLibraryViewController pressesCancelled:withEvent:](&v4, sel_pressesCancelled_withEvent_, a3, a4);
}

- (void)_handlePressesBegan:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (-[SBLibraryViewController _canHandleKeyEvents](self, "_canHandleKeyEvents")
    && -[SBLibraryViewController _canHandleKeyUIEvent:](self, "_canHandleKeyUIEvent:", v4))
  {
    -[SBHLibraryViewController containerViewController](self, "containerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isActive") & 1) == 0)
    {
      SBLogAppLibrary();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Activating type-ahead search in App Library due to key input event", v10, 2u);
      }

      -[SBLibraryViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isKeyWindow") & 1) == 0)
        objc_msgSend(v8, "makeKeyWindow");
      objc_msgSend(v5, "searchResultsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDisablesNullQueryExecution:", 1);
      objc_msgSend(v5, "setActive:", 1);
      objc_msgSend(v9, "setDisablesNullQueryExecution:", 0);
      -[SBLibraryViewController _didActivateTypeAheadSearchWithPhysicalKeyboardEvent:](self, "_didActivateTypeAheadSearchWithPhysicalKeyboardEvent:", v4);

    }
  }

}

- (BOOL)_canHandleKeyEvents
{
  int v3;
  void *v4;
  char v5;

  v3 = -[SBLibraryViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    -[SBLibraryViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isHidden"))
    {

LABEL_7:
      LOBYTE(v3) = 0;
      return v3;
    }
    v5 = -[SBLibraryViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared");

    if ((v5 & 1) != 0
      || -[SBHLibraryViewController contentVisibility](self, "contentVisibility")
      || -[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
    {
      goto LABEL_7;
    }
    LOBYTE(v3) = !-[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder");
  }
  return v3;
}

- (BOOL)_canHandleKeyUIEvent:(id)a3
{
  id v3;
  int v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "type") != 4)
    goto LABEL_4;
  if (!objc_msgSend(v3, "_isKeyDown"))
    goto LABEL_4;
  if (objc_msgSend(v3, "modifierFlags"))
    goto LABEL_4;
  objc_msgSend(v3, "_unmodifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    if (_canHandleKeyUIEvent__onceToken != -1)
      dispatch_once(&_canHandleKeyUIEvent__onceToken, &__block_literal_global_316);
    v10 = (void *)_canHandleKeyUIEvent__keyInputsToIgnore;
    objc_msgSend(v3, "_unmodifiedInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v10, "containsObject:", v11) ^ 1;

  }
  else
  {
LABEL_4:
    LOBYTE(v4) = 0;
  }

  return v4;
}

void __48__SBLibraryViewController__canHandleKeyUIEvent___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[24];

  v13[23] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB728];
  v13[0] = *MEMORY[0x1E0CEB7D0];
  v13[1] = v0;
  v1 = *MEMORY[0x1E0CEB7C8];
  v13[2] = *MEMORY[0x1E0CEB7B0];
  v13[3] = v1;
  v2 = *MEMORY[0x1E0CEB7C0];
  v13[4] = *MEMORY[0x1E0CEB740];
  v13[5] = v2;
  v3 = *MEMORY[0x1E0CEB7A8];
  v13[6] = *MEMORY[0x1E0CEB7B8];
  v13[7] = v3;
  v4 = *MEMORY[0x1E0CEB748];
  v13[8] = *MEMORY[0x1E0CEB738];
  v13[9] = v4;
  v5 = *MEMORY[0x1E0CEB768];
  v13[10] = v4;
  v13[11] = v5;
  v6 = *MEMORY[0x1E0CEB778];
  v13[12] = *MEMORY[0x1E0CEB770];
  v13[13] = v6;
  v7 = *MEMORY[0x1E0CEB788];
  v13[14] = *MEMORY[0x1E0CEB780];
  v13[15] = v7;
  v8 = *MEMORY[0x1E0CEB798];
  v13[16] = *MEMORY[0x1E0CEB790];
  v13[17] = v8;
  v9 = *MEMORY[0x1E0CEB750];
  v13[18] = *MEMORY[0x1E0CEB7A0];
  v13[19] = v9;
  v10 = *MEMORY[0x1E0CEB760];
  v13[20] = *MEMORY[0x1E0CEB758];
  v13[21] = v10;
  v13[22] = *MEMORY[0x1E0CEB720];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_canHandleKeyUIEvent__keyInputsToIgnore;
  _canHandleKeyUIEvent__keyInputsToIgnore = v11;

}

- (void)_didActivateTypeAheadSearchWithPhysicalKeyboardEvent:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = (void *)objc_msgSend(a3, "_cloneEvent");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__SBLibraryViewController__didActivateTypeAheadSearchWithPhysicalKeyboardEvent___block_invoke;
    v5[3] = &unk_1E8E9DED8;
    v6 = v3;
    objc_msgSend(v4, "performBlock:", v5);

  }
}

void __80__SBLibraryViewController__didActivateTypeAheadSearchWithPhysicalKeyboardEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDelete");
  objc_msgSend(v2, "handleKeyEvent:", *(_QWORD *)(a1 + 32));

}

- (void)_setExpandedPodDisplayLayoutElementActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[SBLibraryViewController expandedPodDisplayLayoutElementAssertion](self, "expandedPodDisplayLayoutElementAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    v17 = 0;
    v6 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v7 = (void *)objc_msgSend(v6, "initWithIdentifier:", *MEMORY[0x1E0DAB650]);
    objc_msgSend(v7, "setFillsDisplayBounds:", 1);
    objc_msgSend(v7, "setLayoutRole:", 6);
    -[SBLibraryViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "level");
    v11 = v10;
    v12 = (uint64_t)v10;

    if (*MEMORY[0x1E0CEBE28] + -2.0 >= (double)(uint64_t)v11)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(v7, "setLevel:", v13);
    -[SBLibraryViewController _sbWindowScene](self, "_sbWindowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayLayoutPublisher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addElement:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBLibraryViewController setExpandedPodDisplayLayoutElementAssertion:](self, "setExpandedPodDisplayLayoutElementAssertion:", v16);
    goto LABEL_10;
  }
  if (!v3 && v5)
  {
    v17 = v5;
    objc_msgSend(v5, "invalidate");
    -[SBLibraryViewController setExpandedPodDisplayLayoutElementAssertion:](self, "setExpandedPodDisplayLayoutElementAssertion:", 0);
LABEL_10:
    v5 = v17;
  }

}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3
{
  -[SBLibraryViewController _setStatusBarSettingsAssertionActive:quickly:](self, "_setStatusBarSettingsAssertionActive:quickly:", a3, 0);
}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3 quickly:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  SBMutableStatusBarSettings *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  BOOL v19;

  v5 = a3;
  -[SBLibraryViewController statusBarSettingsAssertion](self, "statusBarSettingsAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__SBLibraryViewController__setStatusBarSettingsAssertionActive_quickly___block_invoke;
  v18[3] = &__block_descriptor_33_e42___UIStatusBarStyleAnimationParameters_8__0l;
  v19 = a4;
  v8 = MEMORY[0x1D17E5550](v18);
  v9 = (void (**)(_QWORD))v8;
  if (!v5 || v7)
  {
    if (!v5 && v7)
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidateWithAnimationParameters:", v17);

      -[SBLibraryViewController setStatusBarSettingsAssertion:](self, "setStatusBarSettingsAssertion:", 0);
    }
  }
  else
  {
    -[SBLibraryViewController _sbWindowScene](self, "_sbWindowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBHLibraryViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setLegibilitySettings:](v13, "setLegibilitySettings:", v14);

    v15 = (void *)objc_msgSend(v12, "newSettingsAssertionWithSettings:atLevel:reason:", v13, 3, CFSTR("App Library"));
    v9[2](v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "acquireWithAnimationParameters:", v16);

    -[SBLibraryViewController setStatusBarSettingsAssertion:](self, "setStatusBarSettingsAssertion:", v15);
  }

}

id __72__SBLibraryViewController__setStatusBarSettingsAssertionActive_quickly___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
  v3 = v2;
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v2, "duration");
    objc_msgSend(v3, "setDuration:", v4 * 0.6);
  }
  return v3;
}

- (id)_currentLayoutState
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sbWindowScene
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBLibraryViewController windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLibraryViewController;
    -[UIViewController _sbWindowScene](&v8, sel__sbWindowScene);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion
{
  return self->_statusBarSettingsAssertion;
}

- (void)setStatusBarSettingsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, a3);
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, a3);
}

- (BSInvalidatable)expandedPodDisplayLayoutElementAssertion
{
  return self->_expandedPodDisplayLayoutElementAssertion;
}

- (void)setExpandedPodDisplayLayoutElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_expandedPodDisplayLayoutElementAssertion, a3);
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (ATXAppDirectoryClient)loggingClient
{
  return self->_loggingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_useSnapshotAsBackgroundViewAssertion, 0);
  objc_storeStrong((id *)&self->_expandedPodDisplayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
}

@end
