@implementation SBDeviceApplicationSceneViewController

- (void)_layoutStatusBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  UIStatusBar *statusBar;
  UIStatusBar *v32;
  void *v33;
  void *v34;
  CGAffineTransform v35;
  CGRect v36;

  if (self->_statusBar)
  {
    -[SBDeviceApplicationSceneViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneViewController sceneHandle](self, "sceneHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar styleRequest](self->_statusBar, "styleRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v3;
    objc_msgSend(v3, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(v4, "statusBarOrientation");
    v16 = v15;
    if ((objc_msgSend(v5, "isMedusaCapable") & 1) == 0)
    {
      objc_msgSend(v4, "statusBarStateProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "statusBarOrientation");

    }
    if ((objc_msgSend(v4, "isEffectivelyForeground") & 1) == 0)
    {
      -[SBSceneViewController _sceneView](self, "_sceneView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v18, "orientation");

    }
    if ((unint64_t)(v16 - 3) < 2 != (unint64_t)(v15 - 3) < 2)
      v19 = v14;
    else
      v19 = v12;
    objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", objc_msgSend(v6, "style"), v16);
    v21 = v20;
    objc_msgSend(v4, "displayIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v5, "classicAppNonFullScreenWithHomeAffordance");
    if (objc_msgSend(v22, "isMainRootDisplay"))
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "userInterfaceIdiom");

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (objc_msgSend(v5, "classicAppPhoneAppRunningOnPad") & 1) == 0)
        {
          +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v4, v34, v16, v6, 0, v8, v10, v12, v14);
          v8 = v26;
          v10 = v27;
          v19 = v28;
          v21 = v29;
        }
      }
    }
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "statusBarDebugOffsettingEnabled"))
    {
      v36.origin.x = v8;
      v36.origin.y = v10;
      v36.size.width = v19;
      v36.size.height = v21;
      CGRectGetHeight(v36);
    }
    -[UIStatusBar setBounds:](self->_statusBar, "setBounds:", v8, v10, v19, v21);
    statusBar = self->_statusBar;
    UIRectGetCenter();
    -[UIStatusBar setCenter:](statusBar, "setCenter:");
    if ((BSFloatIsOne() & 1) == 0)
    {
      v32 = self->_statusBar;
      CGAffineTransformMakeScale(&v35, 1.0, 1.0);
      -[UIStatusBar setTransform:](v32, "setTransform:", &v35);
    }
    -[UIStatusBar setAutoresizingMask:](self->_statusBar, "setAutoresizingMask:", 34);
    -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_statusBarTransformView, "setContentOrientation:", v16);
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_statusBarTransformView, "setContainerOrientation:", v15);
    -[UIStatusBar requestResolvedStyle:](self->_statusBar, "requestResolvedStyle:", -[UIStatusBar currentResolvedStyle](self->_statusBar, "currentResolvedStyle"));

  }
}

- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivitiesToSuppress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  if ((*(_BYTE *)&self->_conformanceFlags & 2) != 0)
  {
    -[UIStatusBarStyleDelegate_SpringBoardOnly statusBar:effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:](self->_realStatusBarStyleDelegate, "statusBar:effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v10);

  return v12;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  int64_t v7;
  SBSceneViewStatusBarAssertion *activeOverlayStatusBarAssertion;
  void *v9;
  _SBStatusBarChanges *statusBarChanges;
  _SBStatusBarChanges *v11;
  _SBStatusBarChanges *v12;
  id v13;

  v13 = a5;
  v7 = -[SBDeviceApplicationSceneViewController _currentStatusBarStyleForPartWithIdentifier:](self, "_currentStatusBarStyleForPartWithIdentifier:");
  activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
  if (activeOverlayStatusBarAssertion)
  {
    -[SBSceneViewStatusBarAssertion settings](activeOverlayStatusBarAssertion, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v9, "style"));

  }
  if (v7 != a4)
  {
    statusBarChanges = self->_statusBarChanges;
    if (!statusBarChanges)
    {
      v11 = (_SBStatusBarChanges *)objc_opt_new();
      v12 = self->_statusBarChanges;
      self->_statusBarChanges = v11;

      statusBarChanges = self->_statusBarChanges;
    }
    -[_SBStatusBarChanges setStatusBarPartStyle:forPartWithIdentifier:](statusBarChanges, "setStatusBarPartStyle:forPartWithIdentifier:", a4, v13);
    -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
  }

}

- (int64_t)_currentStatusBarStyleForPartWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[SBDeviceApplicationSceneViewController _underlyingStatusBarViewIfAvailable](self, "_underlyingStatusBarViewIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "styleForPartWithIdentifier:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)_underlyingStatusBarViewIfAvailable
{
  return (id)-[UIStatusBar statusBar](self->_statusBar, "statusBar");
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  -[NSHashTable removeObject:](self->_statusBarAssertions, "removeObject:", a3);
  -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
}

- (void)_updateStatusBarState
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[SBDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[NSHashTable count](self->_statusBarAssertions, "count") && !self->_shouldDrawStatusBarInsideSceneView)
    {
      -[SBDeviceApplicationSceneViewController _removeStatusBar](self, "_removeStatusBar");
      -[SBApplicationSceneViewController _setOverrideStatusBarSettings:](self, "_setOverrideStatusBarSettings:", 0);
      -[SBSceneViewController _sceneView](self, "_sceneView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setForcesStatusBarHidden:", 0);

      -[SBSceneViewController sceneHandle](self, "sceneHandle");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "statusBarStateProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeStatusBarObserver:", self);

      objc_msgSend(v26, "breadcrumbProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObserver:", self);

      return;
    }
    -[NSHashTable allObjects](self->_statusBarAssertions, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_132);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v11, "settings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "settings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v8)
              objc_msgSend(v8, "applySettings:", v13);
            else
              v8 = (void *)objc_msgSend(v13, "mutableCopy");

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    if (!self->_statusBar)
      -[SBDeviceApplicationSceneViewController _createStatusBar](self, "_createStatusBar");
    -[SBDeviceApplicationSceneViewController _configureStatusBarWithCurrentStyleRequest](self, "_configureStatusBarWithCurrentStyleRequest");
    if (!self->_statusBar)
      goto LABEL_31;
    if (v8)
    {
      objc_msgSend(v8, "alpha");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v18 = 1.0;
        goto LABEL_28;
      }
      objc_msgSend(v8, "alpha");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;
    }
    else
    {
      -[SBSceneViewController sceneHandle](self, "sceneHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "statusBarStateProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "statusBarAlpha");
      v18 = v19;
    }

LABEL_28:
    v23 = -[SBDeviceApplicationSceneViewController _isApplicationStatusBarHidden](self, "_isApplicationStatusBarHidden");
    v24 = 0.0;
    if (!v23)
      v24 = v18;
    -[UIStatusBar setAlpha:](self->_statusBar, "setAlpha:", v24);
    objc_msgSend(v8, "setAlpha:", &unk_1E91D0BD8);
LABEL_31:
    -[SBApplicationSceneViewController _setOverrideStatusBarSettings:](self, "_setOverrideStatusBarSettings:", v8);
    -[SBSceneViewController _sceneView](self, "_sceneView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setForcesStatusBarHidden:", 1);

  }
}

- (void)_configureStatusBarWithCurrentStyleRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  if (self->_statusBar)
  {
    -[SBSceneViewController sceneHandle](self, "sceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBApplicationSceneViewController overrideStatusBarStyle](self, "overrideStatusBarStyle");
    if (v4 == -1)
      objc_msgSend(v3, "currentEffectiveStatusBarStyleRequest");
    else
      objc_msgSend(v3, "statusBarEffectiveStyleRequestWithStyle:", _SBStatusBarStyleFromLegacyStyle(v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar setStyleRequest:](self->_statusBar, "setStyleRequest:", v5);
    -[UIStatusBar setHidden:](self->_statusBar, "setHidden:", -[SBDeviceApplicationSceneViewController _isApplicationStatusBarHidden](self, "_isApplicationStatusBarHidden"));
    -[UIStatusBar sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:](self->_statusBar, "sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:", objc_msgSend(v3, "statusBarParts"));
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusBarAvoidanceFrame");
    objc_msgSend(v7, "setAvoidanceFrame:reason:statusBar:animationSettings:", CFSTR("SBDeviceApplicationSceneViewController"), self->_statusBar, 0);

    objc_msgSend(v3, "breadcrumbProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke;
    v15[3] = &unk_1E8E9E270;
    v15[4] = self;
    v10 = v8;
    v16 = v10;
    v14 = v3;
    v17 = v14;
    objc_msgSend(v9, "performWithoutAnimation:", v15);
    if (-[_SBStatusBarChanges statusBarStyleChanged](self->_statusBarChanges, "statusBarStyleChanged"))
      -[SBDeviceApplicationSceneViewController _setStatusBarStyle:](self, "_setStatusBarStyle:", -[_SBStatusBarChanges statusBarStyle](self->_statusBarChanges, "statusBarStyle"));
    if (-[_SBStatusBarChanges statusBarPartStyleChanged](self->_statusBarChanges, "statusBarPartStyleChanged"))
    {
      v11 = -[_SBStatusBarChanges statusBarPartStyle](self->_statusBarChanges, "statusBarPartStyle");
      -[_SBStatusBarChanges statusBarPartIdentifier](self->_statusBarChanges, "statusBarPartIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", v11, v12);

    }
    -[_SBStatusBarChanges invalidate](self->_statusBarChanges, "invalidate");
    objc_msgSend(v6, "recordingIndicatorManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateRecordingIndicatorForStatusBarChanges");
    -[SBDeviceApplicationSceneViewController _layoutStatusBar](self, "_layoutStatusBar");

  }
}

- (BOOL)_isApplicationStatusBarHidden
{
  void *v2;
  void *v3;
  char v4;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusBarHidden");

  return v4;
}

void __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "hasBreadcrumb"))
  {
    objc_msgSend(*(id *)(a1 + 48), "overlayStatusBarData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOverlayData:", v3);

    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
    v6 = (void *)MEMORY[0x1E0CEAED0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke_2;
    v8[3] = &unk_1E8EA98B8;
    v9 = v4;
    objc_msgSend(v6, "actionWithBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAction:forPartWithIdentifier:", v7, *MEMORY[0x1E0CEC1E0]);

  }
  else
  {
    objc_msgSend(v2, "setOverlayData:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAction:forPartWithIdentifier:", 0, *MEMORY[0x1E0CEC1E0]);
  }

}

- (void)_setStatusBarStyle:(int64_t)a3
{
  id v4;

  -[SBDeviceApplicationSceneViewController _underlyingStatusBarViewIfAvailable](self, "_underlyingStatusBarViewIfAvailable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  -[SBDeviceApplicationSceneViewController _applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:](self, "_applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:", a4, a3);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (double)currentStatusBarHeight
{
  double result;

  -[UIStatusBar currentHeight](self->_statusBar, "currentHeight");
  return result;
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResizesHostedContext:", v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBDeviceApplicationSceneViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBDeviceApplicationSceneViewController _layoutStatusBar](self, "_layoutStatusBar");
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_activeOverlayViewProviders, "count"))
  {
    -[NSMutableArray lastObject](self->_activeOverlayViewProviders, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v5, "bestHomeAffordanceOrientationForOrientation:", a3);

  }
  return a3;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5;

  v5 = a4;
  -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
  objc_msgSend(v5, "_setSceneMaskingDelegate:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBSceneViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SBDeviceApplicationSceneViewController _configureForCurrentSecureDisplayState](self, "_configureForCurrentSecureDisplayState");
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[SBDeviceApplicationSceneViewController sceneMinificationFilter](self, "sceneMinificationFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinificationFilter:", v4);

  objc_msgSend(v3, "setRendersAsynchronously:", -[SBDeviceApplicationSceneViewController sceneRendersAsynchronously](self, "sceneRendersAsynchronously"));
  if (self->_statusBarAssertions || self->_shouldDrawStatusBarInsideSceneView)
    -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
  if (!-[SBDeviceApplicationSceneViewController _shouldSuppressHomeGrabber](self, "_shouldSuppressHomeGrabber"))
  {
    -[SBDeviceApplicationSceneViewController homeGrabberPillSettings](self, "homeGrabberPillSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createHomeGrabberViewIfNecessaryWithSettings:", v5);

  }
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  id v4;

  if (self->_sceneRendersAsynchronously != a3)
  {
    self->_sceneRendersAsynchronously = a3;
    if (-[SBDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBSceneViewController _sceneView](self, "_sceneView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRendersAsynchronously:", self->_sceneRendersAsynchronously);

    }
  }
}

- (void)setSceneMinificationFilter:(id)a3
{
  NSString *v4;
  NSString *sceneMinificationFilter;
  char v6;
  NSString *v7;
  NSString *v8;
  int v9;
  void *v10;
  NSString *v11;

  v4 = (NSString *)a3;
  sceneMinificationFilter = self->_sceneMinificationFilter;
  if (sceneMinificationFilter != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqual:](sceneMinificationFilter, "isEqual:", v4);
    v4 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      v8 = self->_sceneMinificationFilter;
      self->_sceneMinificationFilter = v7;

      v9 = -[SBDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded");
      v4 = v11;
      if (v9)
      {
        -[SBSceneViewController _sceneView](self, "_sceneView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMinificationFilter:", self->_sceneMinificationFilter);

        v4 = v11;
      }
    }
  }

}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  int v5;
  int v6;
  int v7;
  void *v8;
  id v9;

  if (self->_homeGrabberDisplayMode != a3)
  {
    v5 = -[SBDeviceApplicationSceneViewController _shouldSuppressHomeGrabber](self, "_shouldSuppressHomeGrabber");
    self->_homeGrabberDisplayMode = a3;
    v6 = -[SBDeviceApplicationSceneViewController _shouldSuppressHomeGrabber](self, "_shouldSuppressHomeGrabber");
    if (v5 != v6)
    {
      v7 = v6;
      -[SBSceneViewController _sceneView](self, "_sceneView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v9, "tearDownHomeGrabberView");
      }
      else
      {
        -[SBDeviceApplicationSceneViewController homeGrabberPillSettings](self, "homeGrabberPillSettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createHomeGrabberViewIfNecessaryWithSettings:", v8);

      }
    }
  }
}

- (BOOL)_shouldSuppressHomeGrabber
{
  int64_t homeGrabberDisplayMode;
  int v3;

  homeGrabberDisplayMode = self->_homeGrabberDisplayMode;
  if (!homeGrabberDisplayMode)
  {
    v3 = -[SBFHomeGrabberSettings isEnabled](self->_homeGrabberSettings, "isEnabled");
    homeGrabberDisplayMode = 1;
    if (v3)
      homeGrabberDisplayMode = 2;
  }
  return homeGrabberDisplayMode == 1;
}

- (BOOL)sceneRendersAsynchronously
{
  return self->_sceneRendersAsynchronously;
}

- (NSString)sceneMinificationFilter
{
  return self->_sceneMinificationFilter;
}

- (void)_configureForCurrentSecureDisplayState
{
  void *v3;
  void *v4;
  id v5;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureDisplayStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewController _configureForSecureDisplay:](self, "_configureForSecureDisplay:", objc_msgSend(v4, "isInSecureDisplayMode"));

}

- (void)_configureForSecureDisplay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *liveContentDisableAssertion;
  void *v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BSInvalidatable *v18;
  BSInvalidatable *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureDisplayStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsSecureDisplayMode");

  v9 = v8 & v3;
  if ((v8 & v3) != 1 || -[SBDeviceApplicationSceneViewController rendersWhileLocked](self, "rendersWhileLocked"))
  {
    -[BSInvalidatable invalidate](self->_liveContentDisableAssertion, "invalidate");
    liveContentDisableAssertion = self->_liveContentDisableAssertion;
    self->_liveContentDisableAssertion = 0;
LABEL_4:

    goto LABEL_5;
  }
  if (!self->_liveContentDisableAssertion)
  {
    -[SBSceneViewController _sceneView](self, "_sceneView");
    liveContentDisableAssertion = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(liveContentDisableAssertion, "acquireLiveContentDisableAssertionForReason:", CFSTR("Secure Rendering Enabled"));
    v18 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v19 = self->_liveContentDisableAssertion;
    self->_liveContentDisableAssertion = v18;

    goto LABEL_4;
  }
LABEL_5:
  if (v9 != -[SBDeviceApplicationSceneViewController rendersWhileLocked](self, "rendersWhileLocked"))
  {
    -[SBSceneViewController _sceneView](self, "_sceneView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "effectiveDisplayMode");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = self->_overlayViewProviders;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "noteDisplayModeChange:", v12, (_QWORD)v20);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

  }
}

- (BOOL)rendersWhileLocked
{
  return self->_rendersWhileLocked;
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBSceneViewController setDisplayMode:animationFactory:completion:](&v16, sel_setDisplayMode_animationFactory_completion_, a3, a4, a5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_overlayViewProviders;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "noteDisplayModeChange:", a3, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)setShouldDrawStatusBarInsideSceneView:(BOOL)a3
{
  self->_shouldDrawStatusBarInsideSceneView = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_traitsParticipantForOverlayContainer, v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_activeOverlayViewProviders;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "containerDidUpdateTraitsParticipant:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (SBDeviceApplicationSceneViewController)initWithSceneHandle:(id)a3
{
  id v5;
  SBDeviceApplicationSceneViewController *v6;
  uint64_t v7;
  SBFHomeGrabberSettings *homeGrabberSettings;
  void *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneViewController.m"), 147, CFSTR("SceneHandle must be of type SBDeviceApplicationSceneHandle, but was: %@"), v5);

  }
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneViewController;
  v6 = -[SBApplicationSceneViewController initWithSceneHandle:](&v12, sel_initWithSceneHandle_, v5);
  if (v6)
  {
    objc_msgSend(v5, "setShouldApplyAppProtectionSceneSettings:", 1);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v7;

    objc_msgSend(v5, "addObserver:", v6);
    -[SBDeviceApplicationSceneViewController _setRealStatusBarStyleDelegate:](v6, "_setRealStatusBarStyleDelegate:", SBApp);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__willEnableSecureDisplay, *MEMORY[0x1E0DA9FE8], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__didDisableSecureDisplay, *MEMORY[0x1E0DA9FE0], 0);

  }
  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBDeviceApplicationSceneViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (a3)
    -[SBDeviceApplicationSceneViewController _createSceneOverlayViewProvidersIfNecessary](self, "_createSceneOverlayViewProvidersIfNecessary");
  else
    -[SBDeviceApplicationSceneViewController _destroySceneOverlayViewProviders](self, "_destroySceneOverlayViewProviders");
}

- (void)_createSceneOverlayViewProvidersIfNecessary
{
  NSMutableArray *v3;
  NSMutableArray *overlayViewProviders;
  void *v5;
  SBDeviceApplicationRemoteTransientOverlayViewProvider *v6;
  SBDeviceApplicationAppClipOverlayViewProvider *v7;
  SBDeviceApplicationAppProtectionSceneOverlayViewProvider *v8;
  void *v9;
  uint64_t v10;
  SBDeviceApplicationInputUIViewProvider *v11;
  SBDeviceApplicationMomentsUIViewProvider *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SBDeviceApplicationRemoteTransientOverlayViewProvider *v18;
  SBDeviceApplicationScreenTimeLockoutViewProvider *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_overlayViewProviders)
    return;
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  overlayViewProviders = self->_overlayViewProviders;
  self->_overlayViewProviders = v3;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBDeviceApplicationScreenTimeLockoutViewProvider initWithSceneHandle:delegate:]([SBDeviceApplicationScreenTimeLockoutViewProvider alloc], "initWithSceneHandle:delegate:", v5, self);
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:");
  v18 = -[SBDeviceApplicationRemoteTransientOverlayViewProvider initWithSceneHandle:delegate:handlesSceneBackedRemoteTransientOverlaysOnly:]([SBDeviceApplicationRemoteTransientOverlayViewProvider alloc], "initWithSceneHandle:delegate:handlesSceneBackedRemoteTransientOverlaysOnly:", v5, self, 0);
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:");
  v6 = -[SBDeviceApplicationRemoteTransientOverlayViewProvider initWithSceneHandle:delegate:handlesSceneBackedRemoteTransientOverlaysOnly:]([SBDeviceApplicationRemoteTransientOverlayViewProvider alloc], "initWithSceneHandle:delegate:handlesSceneBackedRemoteTransientOverlaysOnly:", v5, self, 1);
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:", v6);
  v7 = -[SBDeviceApplicationAppClipOverlayViewProvider initWithSceneHandle:delegate:]([SBDeviceApplicationAppClipOverlayViewProvider alloc], "initWithSceneHandle:delegate:", v5, self);
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:", v7);
  v8 = -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider initWithSceneHandle:delegate:]([SBDeviceApplicationAppProtectionSceneOverlayViewProvider alloc], "initWithSceneHandle:delegate:", v5, self);
  -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:", v8);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_9;
LABEL_6:
    if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
    {
      v11 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:]([SBDeviceApplicationInputUIViewProvider alloc], "initWithSceneHandle:delegate:", v5, self);
      -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:", v11);

    }
    v12 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:]([SBDeviceApplicationMomentsUIViewProvider alloc], "initWithSceneHandle:delegate:", v5, self);
    -[NSMutableArray addObject:](self->_overlayViewProviders, "addObject:", v12);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 != 1)
    goto LABEL_6;
LABEL_9:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_overlayViewProviders;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17++), "noteDisplayModeChange:", -[SBSceneViewController displayMode](self, "displayMode"));
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)_setRealStatusBarStyleDelegate:(id)a3
{
  char v5;
  char v6;
  UIStatusBarStyleDelegate_SpringBoardOnly *v7;

  v7 = (UIStatusBarStyleDelegate_SpringBoardOnly *)a3;
  if (self->_realStatusBarStyleDelegate != v7)
  {
    objc_storeStrong((id *)&self->_realStatusBarStyleDelegate, a3);
    *(_BYTE *)&self->_conformanceFlags = *(_BYTE *)&self->_conformanceFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&self->_conformanceFlags = *(_BYTE *)&self->_conformanceFlags & 0xFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_conformanceFlags = *(_BYTE *)&self->_conformanceFlags & 0xFD | v6;
  }

}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  _BOOL4 v5;
  SBMutableStatusBarSettings *v7;
  double v8;
  void *v9;
  void *v10;

  v5 = a3;
  v7 = objc_alloc_init(SBMutableStatusBarSettings);
  v8 = 1.0;
  if (v5)
    v8 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setAlpha:](v7, "setAlpha:", v9);

  -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarSettings:atLevel:](self, "statusBarAssertionWithStatusBarSettings:atLevel:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)statusBarAssertionWithStatusBarSettings:(id)a3 atLevel:(unint64_t)a4
{
  id v6;
  NSHashTable *v7;
  NSHashTable *statusBarAssertions;
  SBSceneViewStatusBarAssertion *v9;

  v6 = a3;
  if (!self->_statusBarAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    statusBarAssertions = self->_statusBarAssertions;
    self->_statusBarAssertions = v7;

  }
  v9 = -[SBSceneViewStatusBarAssertion initWithStatusBarSettings:nubViewHidden:atLevel:]([SBSceneViewStatusBarAssertion alloc], "initWithStatusBarSettings:nubViewHidden:atLevel:", v6, 0x7FFFFFFFFFFFFFFFLL, a4);
  -[SBSceneViewStatusBarAssertion addObserver:](v9, "addObserver:", self);
  -[NSHashTable addObject:](self->_statusBarAssertions, "addObject:", v9);
  -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");

  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  void *v2;
  void *v3;

  -[SBSceneViewController _sceneView](self, "_sceneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplicationSceneBackgroundView *)v3;
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  void *v11;
  id v12;

  v6 = a6;
  v12 = a5;
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "wantsDeviceOrientationEventsEnabled")
    && !-[SBDeviceApplicationSceneViewController _statusBarHasMatchMoveAnimation](self, "_statusBarHasMatchMoveAnimation"))
  {

    if (v6)
      -[SBDeviceApplicationSceneViewController _addStatusBarMatchMoveAnimationForView:](self, "_addStatusBarMatchMoveAnimationForView:", v12);
  }
  else
  {

  }
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", a3, a4, v12, v6);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  _BOOL4 v5;
  id v6;

  -[SBSceneViewController sceneHandle](self, "sceneHandle", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "wantsDeviceOrientationEventsEnabled"))
  {
    v5 = -[SBDeviceApplicationSceneViewController _statusBarHasMatchMoveAnimation](self, "_statusBarHasMatchMoveAnimation");

    if (v5)
      -[SBDeviceApplicationSceneViewController _removeStatusBarMatchMoveAnimation](self, "_removeStatusBarMatchMoveAnimation");
  }
  else
  {

  }
}

- (void)_createStatusBar
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIStatusBar *v11;
  UIStatusBar *statusBar;
  void *v13;
  void *v14;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *scrollToTopGestureRecognizer;
  void *v17;
  int v18;
  UITapGestureRecognizer *v19;
  UITapGestureRecognizer *showDebugGestureRecognizer;
  void *v21;
  void *v22;
  UIStatusBar *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  UIView *v33;
  UIView *statusBarWrapperView;
  id v35;
  BSUIOrientationTransformWrapperView *v36;
  BSUIOrientationTransformWrapperView *statusBarTransformView;
  void *v38;
  void *v39;
  id v40;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sceneIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ - %@"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v3;
  objc_msgSend(v3, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reusePool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_statusBarReusePool, v10);
  objc_msgSend(v10, "getReusableStatusBarWithReason:", v8);
  v11 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
  statusBar = self->_statusBar;
  self->_statusBar = v11;

  -[SBDeviceApplicationSceneViewController _underlyingStatusBarViewIfAvailable](self, "_underlyingStatusBarViewIfAvailable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__statusBarScrollToTop_);
  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = v15;

  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_scrollToTopGestureRecognizer, "requireGestureRecognizerToFail:", v14);
  objc_msgSend(v13, "addGestureRecognizer:", self->_scrollToTopGestureRecognizer);
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isInternalInstall");

  if (v18)
  {
    v19 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__statusBarShowDebug_);
    showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
    self->_showDebugGestureRecognizer = v19;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_showDebugGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_showDebugGestureRecognizer, "requireGestureRecognizerToFail:", v14);
    objc_msgSend(v13, "addGestureRecognizer:", self->_showDebugGestureRecognizer);
  }
  -[UIStatusBar layer](self->_statusBar, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHitTestsAsOpaque:", 1);

  -[SBDeviceApplicationSceneViewController _setupStatusBarStylesFromSceneHandle:](self, "_setupStatusBarStylesFromSceneHandle:", v40);
  -[UIStatusBar requestResolvedStyle:](self->_statusBar, "requestResolvedStyle:", 0);
  -[UIStatusBar setStyleDelegate:](self->_statusBar, "setStyleDelegate:", self);
  -[UIStatusBar setLegibilityStyle:](self->_statusBar, "setLegibilityStyle:", 0);
  -[UIStatusBar setForegroundColor:](self->_statusBar, "setForegroundColor:", 0);
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "statusBarDebugBackgroundColorsEnabled"))
  {
    v23 = self->_statusBar;
    objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "colorWithAlphaComponent:", 0.4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar setBackgroundColor:](v23, "setBackgroundColor:", v25);

  }
  objc_msgSend(v40, "statusBarStateProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addStatusBarObserver:", self);

  objc_msgSend(v40, "breadcrumbProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:", self);

  objc_msgSend(v40, "statusBarStateProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "backgroundActivitiesToSuppress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "sceneIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewController _applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:](self, "_applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:", v29, v30);

  -[SBDeviceApplicationSceneViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x1E0DA9F28]);
  objc_msgSend(v31, "bounds");
  v33 = (UIView *)objc_msgSend(v32, "initWithFrame:");
  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = v33;

  v35 = objc_alloc(MEMORY[0x1E0D01940]);
  objc_msgSend(v31, "bounds");
  v36 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v35, "initWithFrame:");
  statusBarTransformView = self->_statusBarTransformView;
  self->_statusBarTransformView = v36;

  -[BSUIOrientationTransformWrapperView setAutoresizingMask:](self->_statusBarTransformView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_statusBarWrapperView, "addSubview:", self->_statusBar);
  -[BSUIOrientationTransformWrapperView addContentView:](self->_statusBarTransformView, "addContentView:", self->_statusBarWrapperView);
  objc_msgSend(v31, "addSubview:", self->_statusBarTransformView);

}

- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4
{
  UIStatusBar *statusBar;

  statusBar = self->_statusBar;
  if (statusBar)
    -[UIStatusBar requestResolvedStyle:](statusBar, "requestResolvedStyle:", -[UIStatusBar currentResolvedStyle](self->_statusBar, "currentResolvedStyle", a3, a4));
}

- (void)_setupStatusBarStylesFromSceneHandle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "statusBarStateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:](self, "_setStatusBarStyle:", objc_msgSend(v5, "statusBarStyle"));
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", objc_msgSend(v5, "statusBarStyleForPartWithIdentifier:", *MEMORY[0x1E0CEC200]), *MEMORY[0x1E0CEC200]);
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", objc_msgSend(v5, "statusBarStyleForPartWithIdentifier:", *MEMORY[0x1E0CEC1E8]), *MEMORY[0x1E0CEC1E8]);
    -[SBDeviceApplicationSceneViewController _setStatusBarStyle:forPartWithIdentifier:](self, "_setStatusBarStyle:forPartWithIdentifier:", objc_msgSend(v5, "statusBarStyleForPartWithIdentifier:", *MEMORY[0x1E0CEC210]), *MEMORY[0x1E0CEC210]);

  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  int64_t v6;
  SBSceneViewStatusBarAssertion *activeOverlayStatusBarAssertion;
  void *v8;
  _SBStatusBarChanges *statusBarChanges;
  _SBStatusBarChanges *v10;
  _SBStatusBarChanges *v11;

  v6 = -[SBDeviceApplicationSceneViewController _currentStatusBarStyle](self, "_currentStatusBarStyle", a3);
  activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
  if (activeOverlayStatusBarAssertion)
  {
    -[SBSceneViewStatusBarAssertion settings](activeOverlayStatusBarAssertion, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v8, "style"));

  }
  if (v6 != a4)
  {
    statusBarChanges = self->_statusBarChanges;
    if (!statusBarChanges)
    {
      v10 = (_SBStatusBarChanges *)objc_opt_new();
      v11 = self->_statusBarChanges;
      self->_statusBarChanges = v10;

      statusBarChanges = self->_statusBarChanges;
    }
    -[_SBStatusBarChanges setStatusBarStyle:](statusBarChanges, "setStatusBarStyle:", a4);
    -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
  }
}

- (int64_t)_currentStatusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBDeviceApplicationSceneViewController _underlyingStatusBarViewIfAvailable](self, "_underlyingStatusBarViewIfAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "style");
  else
    v4 = 0;

  return v4;
}

- (void)_setStatusBarStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBDeviceApplicationSceneViewController _underlyingStatusBarViewIfAvailable](self, "_underlyingStatusBarViewIfAvailable");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyle:forPartWithIdentifier:", a3, v6);

}

- (id)animationFactoryForImplicitTransitionFromMode:(int64_t)a3 toMode:(int64_t)a4 defaultFactory:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v7 = a5;
  if (a4 != 4)
    goto LABEL_4;
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldSkipCrossfadeToLive");

  if ((v11 & 1) != 0)
    v12 = 0;
  else
LABEL_4:
    v12 = v7;

  return v12;
}

- (void)sceneView:(id)a3 changedPreferredStatusBarStyleTo:(int64_t)a4
{
  SBSceneViewStatusBarAssertion *placeholderStatusBarAssertion;
  void *v7;
  uint64_t v8;
  void *v9;
  SBMutableStatusBarSettings *v10;
  SBSceneViewStatusBarAssertion *v11;
  SBSceneViewStatusBarAssertion *v12;
  id v13;

  v13 = a3;
  placeholderStatusBarAssertion = self->_placeholderStatusBarAssertion;
  if (a4 == -1)
  {
    -[SBSceneViewStatusBarAssertion invalidate](placeholderStatusBarAssertion, "invalidate");
    v10 = (SBMutableStatusBarSettings *)self->_placeholderStatusBarAssertion;
    self->_placeholderStatusBarAssertion = 0;
    goto LABEL_7;
  }
  if (!placeholderStatusBarAssertion)
  {
    v10 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBMutableStatusBarSettings setStyle:](v10, "setStyle:", a4);
    -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarSettings:atLevel:](self, "statusBarAssertionWithStatusBarSettings:atLevel:", v10, 0);
    v11 = (SBSceneViewStatusBarAssertion *)objc_claimAutoreleasedReturnValue();
    v12 = self->_placeholderStatusBarAssertion;
    self->_placeholderStatusBarAssertion = v11;

    goto LABEL_7;
  }
  -[SBSceneViewStatusBarAssertion settings](placeholderStatusBarAssertion, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");

  if (v8 != a4)
  {
    -[SBSceneViewStatusBarAssertion settings](self->_placeholderStatusBarAssertion, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (SBMutableStatusBarSettings *)objc_msgSend(v9, "mutableCopy");

    -[SBMutableStatusBarSettings setStyle:](v10, "setStyle:", a4);
    -[SBSceneViewStatusBarAssertion setSettings:](self->_placeholderStatusBarAssertion, "setSettings:", v10);
LABEL_7:

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  objc_msgSend(v3, "statusBarStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeStatusBarObserver:", self);

  objc_msgSend(v3, "breadcrumbProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBDeviceApplicationSceneViewController _removeStatusBar](self, "_removeStatusBar");
  -[SBDeviceApplicationSceneViewController _relinquishResignActiveAssertion](self, "_relinquishResignActiveAssertion");
  -[SBDeviceApplicationSceneViewController _destroySceneOverlayViewProviders](self, "_destroySceneOverlayViewProviders");
  -[BSInvalidatable invalidate](self->_liveContentDisableAssertion, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBSceneViewController dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneViewController;
  -[SBSceneViewController invalidate](&v4, sel_invalidate);
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBDeviceApplicationSceneViewController _relinquishResignActiveAssertion](self, "_relinquishResignActiveAssertion");
  -[SBDeviceApplicationSceneViewController _destroySceneOverlayViewProviders](self, "_destroySceneOverlayViewProviders");
  -[BSInvalidatable invalidate](self->_liveContentDisableAssertion, "invalidate");
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneViewController;
  v7 = a4;
  -[SBDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBSceneViewController _sceneView](self, "_sceneView", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (SBHomeGrabberView)homeGrabberView
{
  void *v2;
  void *v3;

  -[SBSceneViewController _sceneView](self, "_sceneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeGrabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeGrabberView *)v3;
}

- (void)setRendersWhileLocked:(BOOL)a3
{
  if (self->_rendersWhileLocked != a3)
  {
    self->_rendersWhileLocked = a3;
    -[SBDeviceApplicationSceneViewController _configureForCurrentSecureDisplayState](self, "_configureForCurrentSecureDisplayState");
  }
}

- (BOOL)sceneResizesHostedContext
{
  void *v2;
  char v3;

  -[SBSceneViewController _sceneView](self, "_sceneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resizesHostedContext");

  return v3;
}

- (void)_setStatusBarAssertions:(id)a3
{
  NSHashTable *v5;
  int v6;
  NSHashTable *v7;

  v5 = (NSHashTable *)a3;
  if (self->_statusBarAssertions != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_statusBarAssertions, a3);
    v6 = -[SBDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[SBDeviceApplicationSceneViewController _updateStatusBarState](self, "_updateStatusBarState");
      v5 = v7;
    }
  }

}

- (void)setBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundView:", v4);

}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

uint64_t __63__SBDeviceApplicationSceneViewController__updateStatusBarState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "level");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (void)activateOverlayForViewProvider:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *activeOverlayViewProviders;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "overlayViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    activeOverlayViewProviders = self->_activeOverlayViewProviders;
    if (!activeOverlayViewProviders)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_activeOverlayViewProviders;
      self->_activeOverlayViewProviders = v7;

      activeOverlayViewProviders = self->_activeOverlayViewProviders;
    }
    -[NSMutableArray addObject:](activeOverlayViewProviders, "addObject:", v13);
    -[SBSceneViewController _sceneView](self, "_sceneView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overlayView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSMutableArray containsObject:](self->_overlayViewProviders, "containsObject:", v13);
    objc_msgSend(v4, "beginAppearanceTransition:animated:", 1, v11);
    -[SBDeviceApplicationSceneViewController addChildViewController:](self, "addChildViewController:", v4);
    objc_msgSend(v9, "addOverlayView:withPriority:", v10, objc_msgSend(v13, "priority"));
    objc_msgSend(v4, "didMoveToParentViewController:", self);
    objc_msgSend(v4, "endAppearanceTransition");
    objc_msgSend(v13, "showContentWithAnimation:completionHandler:", v11, 0);
    -[SBDeviceApplicationSceneViewController _updateStatusBarAppearanceForOverlayProvider:](self, "_updateStatusBarAppearanceForOverlayProvider:", v13);
    -[SBDeviceApplicationSceneViewController _recalculateResignActiveAssertionForActiveOverlays](self, "_recalculateResignActiveAssertionForActiveOverlays");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:", self);

  }
}

- (void)deactivateOverlayForViewProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_activeOverlayViewProviders, "containsObject:", v4))
  {
    objc_msgSend(v4, "overlayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__SBDeviceApplicationSceneViewController_deactivateOverlayForViewProvider___block_invoke;
    v7[3] = &unk_1E8E9E270;
    v7[4] = self;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    objc_msgSend(v9, "hideContentWithAnimation:completionHandler:", 1, v7);

  }
}

uint64_t __75__SBDeviceApplicationSceneViewController_deactivateOverlayForViewProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateOverlay:forViewProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deactivateOverlay:(id)a3 forViewProvider:(id)a4
{
  NSMutableArray *activeOverlayViewProviders;
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBMutableStatusBarSettings *v11;
  void *v12;
  NSMutableArray *v13;
  SBSceneViewStatusBarAssertion *activeOverlayStatusBarAssertion;
  id WeakRetained;
  id v16;

  activeOverlayViewProviders = self->_activeOverlayViewProviders;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray lastObject](activeOverlayViewProviders, "lastObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginAppearanceTransition:animated:", 0, 0);
  objc_msgSend(v8, "willMoveToParentViewController:", 0);
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeOverlayView:withPriority:", v10, objc_msgSend(v7, "priority"));

  objc_msgSend(v8, "removeFromParentViewController");
  objc_msgSend(v8, "endAppearanceTransition");

  -[NSMutableArray removeObject:](self->_activeOverlayViewProviders, "removeObject:", v7);
  if (-[NSMutableArray count](self->_activeOverlayViewProviders, "count"))
  {
    if (objc_msgSend(v16, "affectsStatusBarPresentation"))
    {
      v11 = objc_alloc_init(SBMutableStatusBarSettings);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "prefersStatusBarHidden") ^ 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMutableStatusBarSettings setAlpha:](v11, "setAlpha:", v12);

      -[SBMutableStatusBarSettings setStyle:](v11, "setStyle:", objc_msgSend(v16, "preferredStatusBarStyle"));
      -[SBSceneViewStatusBarAssertion setSettings:](self->_activeOverlayStatusBarAssertion, "setSettings:", v11);
LABEL_6:

    }
  }
  else
  {
    v13 = self->_activeOverlayViewProviders;
    self->_activeOverlayViewProviders = 0;

    activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
    if (activeOverlayStatusBarAssertion)
    {
      -[SBSceneViewStatusBarAssertion invalidate](activeOverlayStatusBarAssertion, "invalidate");
      v11 = (SBMutableStatusBarSettings *)self->_activeOverlayStatusBarAssertion;
      self->_activeOverlayStatusBarAssertion = 0;
      goto LABEL_6;
    }
  }
  -[SBDeviceApplicationSceneViewController _recalculateResignActiveAssertionForActiveOverlays](self, "_recalculateResignActiveAssertionForActiveOverlays");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:", self);

}

- (BOOL)overlayViewProviderIsHostedInNonrotatingWindow:(id)a3
{
  void *v4;
  char v5;

  -[SBDeviceApplicationSceneViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "applicationSceneViewControllerIsInNonrotatingWindow:", self);
  else
    v5 = 0;

  return v5;
}

- (id)windowSceneForOverlayViewProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)SBApp, "windowSceneManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForSceneHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)overlayViewProviderIsHostedInSecureWindow:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBDeviceApplicationSceneViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "_isSecure");

  return v5;
}

- (id)initialTraitsParticipantForOverlayViewProvider:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_traitsParticipantForOverlayContainer);
}

- (void)overlayViewProviderNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_activeOverlayViewProviders, "containsObject:"))
    -[SBDeviceApplicationSceneViewController _updateStatusBarAppearanceForOverlayProvider:](self, "_updateStatusBarAppearanceForOverlayProvider:", v4);

}

- (CGRect)adjustedBoundsForContentBounds:(CGRect)a3 inOverlayViewProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SBSceneViewController _sceneView](self, "_sceneView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "overlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustedBoundsForContentBounds:inOverlayView:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)beginMaskingForReason:(int64_t)a3 continuation:(id)a4 scene:(id)a5
{
  void (**v6)(id, _QWORD);
  id v7;

  if (a3 == 1)
  {
    v6 = (void (**)(id, _QWORD))a4;
    -[SBSceneViewController _sceneView](self, "_sceneView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableTransitionOverlay:", 1);
    v6[2](v6, 0);

  }
}

- (void)invalidateMasking:(id)a3
{
  id v3;

  -[SBSceneViewController _sceneView](self, "_sceneView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableTransitionOverlay:", 0);

}

- (int64_t)leadingStatusBarStyle
{
  return _SBStatusBarLegacyStyleFromStyle(-[SBDeviceApplicationSceneViewController _effectiveStyleForPartIdentifier:](self, "_effectiveStyleForPartIdentifier:", *MEMORY[0x1E0CEC200]));
}

- (int64_t)trailingStatusBarStyle
{
  return _SBStatusBarLegacyStyleFromStyle(-[SBDeviceApplicationSceneViewController _effectiveStyleForPartIdentifier:](self, "_effectiveStyleForPartIdentifier:", *MEMORY[0x1E0CEC210]));
}

- (id)backgroundActivitiesToSuppress
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundActivitiesToSuppress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)prepareForContentRotation
{
  void *v2;
  void *v3;

  -[SBSceneViewController _sceneView](self, "_sceneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForContentRotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  return a4;
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v5 = a5;
  if ((*(_BYTE *)&self->_conformanceFlags & 1) != 0)
    v5 = -[UIStatusBarStyleDelegate_SpringBoardOnly statusBar:effectiveStyleOverridesForRequestedStyle:overrides:](self->_realStatusBarStyleDelegate, "statusBar:effectiveStyleOverridesForRequestedStyle:overrides:", a3, a4, a5);
  -[SBSceneViewController sceneHandle](self, "sceneHandle", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBarStateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundActivitiesToSuppress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v5 & ~STUIStyleOverridesForBackgroundActivityIdentifiers();
  return v10;
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  if ((*(_BYTE *)&self->_conformanceFlags & 4) != 0)
    return -[UIStatusBarStyleDelegate_SpringBoardOnly overriddenRequestedStyleFromStyle:](self->_realStatusBarStyleDelegate, "overriddenRequestedStyleFromStyle:", a3);
  else
    return a3;
}

- (void)_destroySceneOverlayViewProviders
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *activeOverlayViewProviders;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *overlayViewProviders;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_activeOverlayViewProviders, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        -[SBDeviceApplicationSceneViewController deactivateOverlayForViewProvider:](self, "deactivateOverlayForViewProvider:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_activeOverlayViewProviders, "removeAllObjects");
  activeOverlayViewProviders = self->_activeOverlayViewProviders;
  self->_activeOverlayViewProviders = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_overlayViewProviders;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "invalidate", (_QWORD)v15);
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_overlayViewProviders, "removeAllObjects");
  overlayViewProviders = self->_overlayViewProviders;
  self->_overlayViewProviders = 0;

}

- (void)_updateStatusBarAppearanceForOverlayProvider:(id)a3
{
  SBMutableStatusBarSettings *v4;
  void *v5;
  SBSceneViewStatusBarAssertion *activeOverlayStatusBarAssertion;
  SBSceneViewStatusBarAssertion *v7;
  SBSceneViewStatusBarAssertion *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "affectsStatusBarPresentation"))
  {
    v4 = objc_alloc_init(SBMutableStatusBarSettings);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "prefersStatusBarHidden") ^ 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setAlpha:](v4, "setAlpha:", v5);

    -[SBMutableStatusBarSettings setStyle:](v4, "setStyle:", objc_msgSend(v9, "preferredStatusBarStyle"));
    activeOverlayStatusBarAssertion = self->_activeOverlayStatusBarAssertion;
    if (activeOverlayStatusBarAssertion)
    {
      -[SBSceneViewStatusBarAssertion setSettings:](activeOverlayStatusBarAssertion, "setSettings:", v4);
    }
    else
    {
      -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarSettings:atLevel:](self, "statusBarAssertionWithStatusBarSettings:atLevel:", v4, 1);
      v7 = (SBSceneViewStatusBarAssertion *)objc_claimAutoreleasedReturnValue();
      v8 = self->_activeOverlayStatusBarAssertion;
      self->_activeOverlayStatusBarAssertion = v7;

    }
  }

}

- (void)_recalculateResignActiveAssertionForActiveOverlays
{
  _BOOL4 v3;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  void *v5;
  void *v6;
  UIApplicationSceneDeactivationAssertion *v7;
  UIApplicationSceneDeactivationAssertion *v8;
  UIApplicationSceneDeactivationAssertion *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = -[SBDeviceApplicationSceneViewController _activeOverlaysWantResignActiveAssertion](self, "_activeOverlaysWantResignActiveAssertion");
  resignActiveAssertion = self->_resignActiveAssertion;
  if (v3)
  {
    if (!resignActiveAssertion)
    {
      objc_initWeak(&location, self);
      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sceneDeactivationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v6, "newAssertionWithReason:", 7);
      v8 = self->_resignActiveAssertion;
      self->_resignActiveAssertion = v7;

      v9 = self->_resignActiveAssertion;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __92__SBDeviceApplicationSceneViewController__recalculateResignActiveAssertionForActiveOverlays__block_invoke;
      v10[3] = &unk_1E8EAC318;
      objc_copyWeak(&v11, &location);
      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v9, "acquireWithPredicate:transitionContext:", v10, 0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (resignActiveAssertion)
  {
    -[SBDeviceApplicationSceneViewController _relinquishResignActiveAssertion](self, "_relinquishResignActiveAssertion");
  }
}

uint64_t __92__SBDeviceApplicationSceneViewController__recalculateResignActiveAssertionForActiveOverlays__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (void)_relinquishResignActiveAssertion
{
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  resignActiveAssertion = self->_resignActiveAssertion;
  self->_resignActiveAssertion = 0;

}

- (BOOL)_activeOverlaysWantResignActiveAssertion
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_activeOverlayViewProviders;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "wantsResignActiveAssertion", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t __84__SBDeviceApplicationSceneViewController__configureStatusBarWithCurrentStyleRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateBreadcrumbIfPossible");
}

- (void)_removeStatusBar
{
  void *v3;
  UITapGestureRecognizer *scrollToTopGestureRecognizer;
  void *v5;
  UITapGestureRecognizer *showDebugGestureRecognizer;
  id WeakRetained;
  UIStatusBar *statusBar;
  UIView *statusBarWrapperView;
  BSUIOrientationTransformWrapperView *statusBarTransformView;

  -[UITapGestureRecognizer view](self->_scrollToTopGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_scrollToTopGestureRecognizer);

  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = 0;

  -[UITapGestureRecognizer view](self->_showDebugGestureRecognizer, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_showDebugGestureRecognizer);

  showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
  self->_showDebugGestureRecognizer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarReusePool);
  objc_msgSend(WeakRetained, "recycleStatusBar:", self->_statusBar);

  statusBar = self->_statusBar;
  self->_statusBar = 0;

  objc_storeWeak((id *)&self->_statusBarReusePool, 0);
  -[UIView removeFromSuperview](self->_statusBarWrapperView, "removeFromSuperview");
  -[BSUIOrientationTransformWrapperView removeFromSuperview](self->_statusBarTransformView, "removeFromSuperview");
  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = 0;

  statusBarTransformView = self->_statusBarTransformView;
  self->_statusBarTransformView = 0;

}

- (void)_statusBarScrollToTop:(id)a3
{
  -[SBDeviceApplicationSceneViewController _statusBarTapped:type:](self, "_statusBarTapped:type:", a3, 0);
}

- (void)_statusBarShowDebug:(id)a3
{
  -[SBDeviceApplicationSceneViewController _statusBarTapped:type:](self, "_statusBarTapped:type:", a3, 1);
}

- (void)_statusBarTapped:(id)a3 type:(int64_t)a4
{
  id v6;
  NSMutableArray *WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  WeakRetained = self->_overlayViewProviders;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(WeakRetained);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "handledStatusBarTap:type:", v6, a4, (_QWORD)v12) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    WeakRetained = (NSMutableArray *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSMutableArray applicationSceneViewController:statusBarTapped:tapActionType:](WeakRetained, "applicationSceneViewController:statusBarTapped:tapActionType:", self, v6, a4);
  }

}

- (BOOL)_statusBarHasMatchMoveAnimation
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BSUIOrientationTransformWrapperView layer](self->_statusBarTransformView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationForKey:", CFSTR("RotationMatchMoveAnimation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_addStatusBarMatchMoveAnimationForView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CD27C0];
  v5 = a3;
  objc_msgSend(v4, "animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSourceLayer:", v7);
  objc_msgSend(v6, "setDuration:", INFINITY);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setAppliesX:", 0);
  objc_msgSend(v6, "setAppliesY:", 0);
  objc_msgSend(v6, "setAppliesScale:", 1);
  objc_msgSend(v6, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourcePoints:", v12);

  -[BSUIOrientationTransformWrapperView layer](self->_statusBarTransformView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v6, CFSTR("RotationMatchMoveAnimation"));

}

- (void)_removeStatusBarMatchMoveAnimation
{
  id v2;

  -[BSUIOrientationTransformWrapperView layer](self->_statusBarTransformView, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("RotationMatchMoveAnimation"));

}

- (int64_t)_effectiveStyleForPartIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarStateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "statusBarStyle");
  objc_msgSend(v6, "statusBarPartStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "integerValue");
    if (v10 != 4)
      v7 = v10;
  }

  return v7;
}

- (void)_willEnableSecureDisplay
{
  -[SBDeviceApplicationSceneViewController _configureForSecureDisplay:](self, "_configureForSecureDisplay:", 1);
}

- (void)_didDisableSecureDisplay
{
  -[SBDeviceApplicationSceneViewController _configureForSecureDisplay:](self, "_configureForSecureDisplay:", 0);
}

- (int64_t)homeGrabberDisplayMode
{
  return self->_homeGrabberDisplayMode;
}

- (NSHashTable)_statusBarAssertions
{
  return self->_statusBarAssertions;
}

- (BOOL)shouldDrawStatusBarInsideSceneView
{
  return self->_shouldDrawStatusBarInsideSceneView;
}

- (SBDeviceApplicationSceneViewControllerDelegate)delegate
{
  return (SBDeviceApplicationSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MTLumaDodgePillSettings)homeGrabberPillSettings
{
  return self->_homeGrabberPillSettings;
}

- (void)setHomeGrabberPillSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGrabberPillSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGrabberPillSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_statusBarChanges, 0);
  objc_storeStrong((id *)&self->_realStatusBarStyleDelegate, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_liveContentDisableAssertion, 0);
  objc_storeStrong((id *)&self->_showDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollToTopGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarTransformView, 0);
  objc_storeStrong((id *)&self->_statusBarWrapperView, 0);
  objc_destroyWeak((id *)&self->_statusBarReusePool);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_placeholderStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_activeOverlayStatusBarAssertion, 0);
  objc_destroyWeak((id *)&self->_traitsParticipantForOverlayContainer);
  objc_storeStrong((id *)&self->_activeOverlayViewProviders, 0);
  objc_storeStrong((id *)&self->_overlayViewProviders, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
}

@end
