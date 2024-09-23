@implementation SBDynamicFlashlightActivityElement

- (void)dealloc
{
  objc_super v3;

  if (-[SAAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid"))
    -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_alertingAssertion, "invalidateWithReason:", CFSTR("Dynamic flashlight dealloc"));
  -[CSCoverSheetViewController unregisterExternalBehaviorProvider:](self->_coverSheetViewController, "unregisterExternalBehaviorProvider:", self);
  -[PTSettings removeKeyPathObserver:](self->_flashlightSettings, "removeKeyPathObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDynamicFlashlightActivityElement;
  -[SBDynamicFlashlightActivityElement dealloc](&v3, sel_dealloc);
}

- (SBDynamicFlashlightActivityElement)initWithState:(id)a3 coverSheetViewController:(id)a4 fixedWidth:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SBDynamicFlashlightActivityElement *v10;
  SBDynamicFlashlightActivityElement *v11;
  uint64_t v12;
  SBDynamicFlashlightSettings *flashlightSettings;
  id v14;
  void *v15;
  uint64_t v16;
  SBUISystemApertureCAPackageContentProvider *leadingPackageViewProvider;
  SBUISystemApertureCAPackageContentProvider *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  SBUISystemApertureTextContentProvider *trailingTextProvider;
  SBUISystemApertureTextContentProvider *v24;
  void *v25;
  SBDynamicFlashlightActivityElementViewController *v26;
  SBDynamicFlashlightActivityElementViewController *elementViewController;
  uint64_t v28;
  SBDynamicFlashlightState *flashlightState;
  uint64_t v30;
  SBSystemActionElementPreviewingCoordinator *previewingCoordinator;
  objc_super v33;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SBDynamicFlashlightActivityElement;
  v10 = -[SBDynamicFlashlightActivityElement init](&v33, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_preferredLayoutMode = 2;
    +[SBDynamicFlashlightDomain rootSettings](SBDynamicFlashlightDomain, "rootSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    flashlightSettings = v11->_flashlightSettings;
    v11->_flashlightSettings = (SBDynamicFlashlightSettings *)v12;

    -[PTSettings addKeyPathObserver:](v11->_flashlightSettings, "addKeyPathObserver:", v11);
    v14 = objc_alloc(MEMORY[0x1E0DAC6A0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithPackageName:inBundle:", CFSTR("Flashlight-Leading-D83"), v15);
    leadingPackageViewProvider = v11->_leadingPackageViewProvider;
    v11->_leadingPackageViewProvider = (SBUISystemApertureCAPackageContentProvider *)v16;

    -[SBUISystemApertureCAPackageContentProvider setIntrinsicPackageSize:](v11->_leadingPackageViewProvider, "setIntrinsicPackageSize:", 36.6666667, 36.6666667);
    v18 = v11->_leadingPackageViewProvider;
    -[SBDynamicFlashlightActivityElement _leadingPackageStateForState:](v11, "_leadingPackageStateForState:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureCAPackageContentProvider setState:animated:](v18, "setState:animated:", v19, 0);

    v20 = objc_alloc(MEMORY[0x1E0DAC6E8]);
    -[SBDynamicFlashlightActivityElement _trailingTextForState:](v11, "_trailingTextForState:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithText:style:", v21, 4);
    trailingTextProvider = v11->_trailingTextProvider;
    v11->_trailingTextProvider = (SBUISystemApertureTextContentProvider *)v22;

    v24 = v11->_trailingTextProvider;
    -[SBDynamicFlashlightActivityElement _textColorForState:](v11, "_textColorForState:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureTextContentProvider setContentColor:](v24, "setContentColor:", v25);

    v26 = -[SBDynamicFlashlightActivityElementViewController initWithOptionsProvider:state:fixedWidth:]([SBDynamicFlashlightActivityElementViewController alloc], "initWithOptionsProvider:state:fixedWidth:", v11->_flashlightSettings, v8, v5);
    elementViewController = v11->_elementViewController;
    v11->_elementViewController = v26;

    -[SBDynamicFlashlightActivityElementViewController setDelegate:](v11->_elementViewController, "setDelegate:", v11);
    -[SBDynamicFlashlightActivityElementViewController setPanEnabled:](v11->_elementViewController, "setPanEnabled:", 0);
    +[SBDynamicFlashlightState offState](SBDynamicFlashlightState, "offState");
    v28 = objc_claimAutoreleasedReturnValue();
    flashlightState = v11->_flashlightState;
    v11->_flashlightState = (SBDynamicFlashlightState *)v28;

    v30 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v11);
    previewingCoordinator = v11->_previewingCoordinator;
    v11->_previewingCoordinator = (SBSystemActionElementPreviewingCoordinator *)v30;

    objc_storeStrong((id *)&v11->_coverSheetViewController, a4);
    -[CSCoverSheetViewController registerExternalBehaviorProvider:](v11->_coverSheetViewController, "registerExternalBehaviorProvider:", v11);
  }

  return v11;
}

- (void)setFlashlightState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[SBDynamicFlashlightState isEqual:](self->_flashlightState, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_flashlightState, a3);
    -[SBDynamicFlashlightActivityElementViewController setState:](self->_elementViewController, "setState:", v5);
    -[SBDynamicFlashlightActivityElement _leadingPackageStateForState:](self, "_leadingPackageStateForState:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElement leadingPackageViewProvider](self, "leadingPackageViewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setState:animated:", v6, 1);

    -[SBDynamicFlashlightActivityElement _trailingTextForState:](self, "_trailingTextForState:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElement _textColorForState:](self, "_textColorForState:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElement trailingTextProvider](self, "trailingTextProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "swapInText:textColor:", v8, v9);

    if (-[SBDynamicFlashlightActivityElement layoutMode](self, "layoutMode") == 3)
    {
      -[SBDynamicFlashlightActivityElement customView](self, "customView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[SBDynamicFlashlightActivityElement layoutHostContainerViewDidLayoutSubviews:](self, "layoutHostContainerViewDidLayoutSubviews:", v12);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
    v16[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v14);

  }
}

- (BOOL)shouldRemainActiveWhileFlashlightIsOff
{
  NSObject *v3;

  SBLogFlashlightHUD();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBDynamicFlashlightActivityElement shouldRemainActiveWhileFlashlightIsOff].cold.1((uint64_t)self, v3);

  if (self->_layoutMode == 3)
    return !-[SBDynamicFlashlightActivityElementViewController shouldDismissWhenOff](self->_elementViewController, "shouldDismissWhenOff");
  else
    return 0;
}

- (NSString)elementIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (UIView)leadingView
{
  UIView *leadingView;
  UIView *v4;
  UIView *v5;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    -[SBUISystemApertureCAPackageContentProvider setContentContainer:](self->_leadingPackageViewProvider, "setContentContainer:", self);
    -[SBUISystemApertureCAPackageContentProvider providedView](self->_leadingPackageViewProvider, "providedView");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leadingView;
    self->_leadingView = v4;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIView *trailingView;
  UIView *v4;
  UIView *v5;

  trailingView = self->_trailingView;
  if (!trailingView)
  {
    -[SBUISystemApertureTextContentProvider setContentContainer:](self->_trailingTextProvider, "setContentContainer:", self);
    -[SBUISystemApertureTextContentProvider providedView](self->_trailingTextProvider, "providedView");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (UIView)customView
{
  return (UIView *)-[SBDynamicFlashlightActivityElementViewController view](self->_elementViewController, "view");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode;
  SAAutomaticallyInvalidatable *alertingAssertion;
  id WeakRetained;

  layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_layoutMode = a3;
    if (a3 == 3)
    {
      -[CSCoverSheetViewController externalBehaviorProviderBehaviorChanged:](self->_coverSheetViewController, "externalBehaviorProviderBehaviorChanged:", self, a4);
    }
    else if (layoutMode == 3)
    {
      if (-[SAAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid"))
      {
        -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_alertingAssertion, "invalidateWithReason:", CFSTR("Dynamic flashlight element collapsed layout"));
        alertingAssertion = self->_alertingAssertion;
        self->_alertingAssertion = 0;

      }
      -[CSCoverSheetViewController externalBehaviorProviderBehaviorChanged:](self->_coverSheetViewController, "externalBehaviorProviderBehaviorChanged:", self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dynamicFlashlightActivityElementDidCollapse");

    }
  }
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  CGFloat top;
  double v13;
  CGFloat leading;
  double v15;
  CGFloat bottom;
  double v17;
  CGFloat trailing;
  double v19;
  double v20;
  double v21;
  double v22;
  NSDirectionalEdgeInsets result;

  if (a3 == 3)
  {
    -[SBDynamicFlashlightActivityElementViewController preferredContentRect](self->_elementViewController, "preferredContentRect", a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
    v7 = v6;
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", v7, v9);
    top = v11;
    leading = v13;
    bottom = v15;
    trailing = v17;

  }
  else
  {
    trailing = a4.trailing;
    bottom = a4.bottom;
    leading = a4.leading;
    top = a4.top;
  }
  v19 = top;
  v20 = leading;
  v21 = bottom;
  v22 = trailing;
  result.trailing = v22;
  result.bottom = v21;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  SBDynamicFlashlightActivityElementViewController *elementViewController;
  id v5;

  elementViewController = self->_elementViewController;
  v5 = a3;
  -[SBDynamicFlashlightActivityElementViewController setElementOrientation:](elementViewController, "setElementOrientation:", -[SBDynamicFlashlightActivityElement elementOrientation](self, "elementOrientation"));
  -[SBDynamicFlashlightActivityElement _layoutContentViewInContainerView:](self, "_layoutContentViewInContainerView:", v5);

}

- (void)_layoutContentViewInContainerView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;

  v4 = a3;
  -[SBDynamicFlashlightActivityElement customView](self, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDynamicFlashlightActivityElement _frameForContentViewInContainerView:](self, "_frameForContentViewInContainerView:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  if ((unint64_t)(self->_layoutMode - 1) >= 2)
    v14 = 0.0;
  else
    v14 = 1.0;
  -[UIView setAlpha:](self->_leadingView, "setAlpha:", v14);
  -[UIView setAlpha:](self->_trailingView, "setAlpha:", v14);
  -[SBDynamicFlashlightActivityElement customView](self, "customView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (self->_layoutMode >= 3)
    v17 = 1.0;
  else
    v17 = 0.0;
  objc_msgSend(v15, "setAlpha:", v17);

  if (!-[SBDynamicFlashlightActivityElementViewController isExpanded](self->_elementViewController, "isExpanded")
    && self->_layoutMode == 3)
  {
    v18 = 1;
LABEL_14:
    -[SBDynamicFlashlightActivityElement _setCustomViewExpanded:](self, "_setCustomViewExpanded:", v18);
    return;
  }
  if (-[SBDynamicFlashlightActivityElementViewController isExpanded](self->_elementViewController, "isExpanded")
    && self->_layoutMode != 3)
  {
    v18 = 0;
    goto LABEL_14;
  }
}

- (CGRect)_frameForContentViewInContainerView:(id)a3
{
  id v4;
  void *v5;
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
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[SBDynamicFlashlightActivityElement customView](self, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v7 = v6;
  v9 = v8;

  v11 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    UIRectCenteredIntegralRectScale();
    v11 = v12;
    v10 = v13;
    v7 = v14;
    v9 = v15;
  }

  v16 = v11;
  v17 = v10;
  v18 = v7;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  return self->_leadingView == a3;
}

- (void)_setCustomViewExpanded:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBDynamicFlashlightActivityElementViewController setExpanded:](self->_elementViewController, "setExpanded:");
  -[SBDynamicFlashlightActivityElementViewController setPanEnabled:](self->_elementViewController, "setPanEnabled:", v3);
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[5];
  id v18;

  v7 = a4;
  v8 = a5;
  -[SBDynamicFlashlightActivityElementViewController setElementOrientation:](self->_elementViewController, "setElementOrientation:", -[SBDynamicFlashlightActivityElement elementOrientation](self, "elementOrientation"));
  v9 = MEMORY[0x1E0C809B0];
  v10 = (void *)MEMORY[0x1E0CEABB0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v17[3] = &unk_1E8E9E820;
  v17[4] = self;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v10, "_performWithoutRetargetingAnimations:", v17);
  objc_initWeak(&location, self);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E8EB79D8;
  objc_copyWeak(&v15, &location);
  v12 = v11;
  v14 = v12;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupContentViewInContainerView:", *(_QWORD *)(a1 + 40));
}

void __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_layoutContentViewInContainerView:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "customView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

    objc_msgSend(v5, "customView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    WeakRetained = v5;
  }

}

- (void)_setupContentViewInContainerView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[SBDynamicFlashlightActivityElement customView](self, "customView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDescendantOfView:", v7);

    if ((v5 & 1) == 0)
    {
      -[SBDynamicFlashlightActivityElement customView](self, "customView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:atIndex:", v6, 0);

    }
  }

}

- (void)takeAlertingAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  SAAutomaticallyInvalidatable *v6;
  SAAutomaticallyInvalidatable *alertingAssertion;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[SBDynamicFlashlightActivityElement activityHost](self, "activityHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertWithReason:implicitlyDismissable:", v4, 1);
  v6 = (SAAutomaticallyInvalidatable *)objc_claimAutoreleasedReturnValue();
  if (v6 != self->_alertingAssertion)
  {
    objc_storeStrong((id *)&self->_alertingAssertion, v6);
    objc_initWeak(&location, self);
    alertingAssertion = self->_alertingAssertion;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SBDynamicFlashlightActivityElement_takeAlertingAssertionWithReason___block_invoke;
    v8[3] = &unk_1E8EABB30;
    objc_copyWeak(&v9, &location);
    -[SAAutomaticallyInvalidatable addInvalidationBlock:](alertingAssertion, "addInvalidationBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __70__SBDynamicFlashlightActivityElement_takeAlertingAssertionWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_alertingAssertionDidInvalidate:withReason:", v6, v5);

}

- (void)_alertingAssertionDidInvalidate:(id)a3 withReason:(id)a4
{
  SAAutomaticallyInvalidatable *v5;
  SAAutomaticallyInvalidatable *v6;

  v5 = (SAAutomaticallyInvalidatable *)a3;
  if (self->_alertingAssertion == v5)
  {
    self->_alertingAssertion = 0;
    v6 = v5;

    v5 = v6;
  }

}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

}

- (CGSize)intrinsicCompactContainerSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumLeadingTrailingViewSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)keyColor
{
  return (UIColor *)-[SBDynamicFlashlightActivityElement _textColorForState:](self, "_textColorForState:", self->_flashlightState);
}

- (void)setObstructionEdge:(unint64_t)a3
{
  if (self->_obstructionEdge != a3)
  {
    self->_obstructionEdge = a3;
    -[SBDynamicFlashlightActivityElementViewController setElementOrientation:](self->_elementViewController, "setElementOrientation:", -[SBDynamicFlashlightActivityElement elementOrientation](self, "elementOrientation"));
  }
}

- (int64_t)elementOrientation
{
  unint64_t v2;

  v2 = -[SBDynamicFlashlightActivityElement obstructionEdge](self, "obstructionEdge");
  if (v2 > 3)
    return 1;
  else
    return qword_1D0E8AE98[v2];
}

- (int64_t)systemApertureCustomLayout
{
  return 4;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  int64_t v3;

  v3 = -[SBDynamicFlashlightActivityElement isProminent](self, "isProminent");
  if (-[SBDynamicFlashlightActivityElement isPreviewing](self, "isPreviewing"))
    return v3;
  else
    return v3 | 2;
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return self->_leadingView == a3;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (void)setPreviewing:(BOOL)a3
{
  id WeakRetained;

  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  id WeakRetained;

  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)pop
{
  -[SBSystemActionElementPreviewingCoordinator pop](self->_previewingCoordinator, a2);
}

- (BOOL)inhibitSystemPanGesture
{
  return self->_layoutMode == 3;
}

- (BOOL)inhibitSystemLongPressGesture
{
  return self->_layoutMode == 3;
}

- (void)dynamicFlashlightViewControllerDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;

  v5 = a5;
  -[SAAutomaticallyInvalidatable resetAutomaticInvalidationTimer](self->_alertingAssertion, "resetAutomaticInvalidationTimer");
  -[SBDynamicFlashlightActivityElement delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dynamicFlashlightActivityElementDidChangeIntensity:width:animated:", v5, a3, a4);

}

- (void)dynamicFlashlightViewControllerDidToggleFlashlight
{
  id v3;

  -[SAAutomaticallyInvalidatable resetAutomaticInvalidationTimer](self->_alertingAssertion, "resetAutomaticInvalidationTimer");
  -[SBDynamicFlashlightActivityElement delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicFlashlightActivityElementRequestsTogglingFlashlight");

}

- (void)dynamicFlashlightViewControllerDidChangePreferredContentRect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

}

- (void)dynamicFlashlightViewControllerCancelSystemApertureGestureHandlers
{
  -[SAAutomaticallyInvalidatable resetAutomaticInvalidationTimer](self->_alertingAssertion, "resetAutomaticInvalidationTimer");
}

- (void)dynamicFlashlightViewControllerUpdatePersistedIntensity:(double)a3 width:(double)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dynamicFlashlightActivityElementDidUpdatePersistedIntensity:width:", a3, a4);

}

- (void)dynamicFlashlightViewControllerShouldDismiss
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "ELT: Invalidating preferredLayoutMode...", v1, 2u);
}

- (id)_leadingPackageStateForState:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isUnavailable") & 1) != 0)
  {
    v4 = CFSTR("unavailable");
  }
  else if (objc_msgSend(v3, "isOn"))
  {
    v4 = CFSTR("ON");
  }
  else
  {
    v4 = CFSTR("OFF");
  }

  return (id)v4;
}

- (id)_trailingTextForState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "isUnavailable") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "isOn");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("FLASHLIGHT_ON");
    else
      v8 = CFSTR("FLASHLIGHT_OFF");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_textColorForState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isUnavailable") & 1) != 0 || (objc_msgSend(v3, "isOn") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "sbui_inactiveColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.835294118, 0.823529412, 1.0, 1.0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (self->_layoutMode == 3)
    return 2;
  else
    return 1;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0x4000000;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[SBDynamicFlashlightActivityElement flashlightState](self, "flashlightState", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDynamicFlashlightState offState](SBDynamicFlashlightState, "offState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    +[SBDynamicFlashlightState offState](SBDynamicFlashlightState, "offState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElement setFlashlightState:](self, "setFlashlightState:", v8);

    -[SBDynamicFlashlightActivityElement delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dynamicFlashlightActivityElementRequestsTogglingFlashlight");

    -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_alertingAssertion, "invalidateWithReason:", CFSTR("prototype settings changed"));
  }
}

- (unint64_t)obstructionEdge
{
  return self->_obstructionEdge;
}

- (SAActivityHosting)activityHost
{
  return (SAActivityHosting *)objc_loadWeakRetained((id *)&self->_activityHost);
}

- (void)setActivityHost:(id)a3
{
  objc_storeWeak((id *)&self->_activityHost, a3);
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (SAElementHosting)elementHost
{
  return (SAElementHosting *)objc_loadWeakRetained((id *)&self->_elementHost);
}

- (void)setElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_elementHost, a3);
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  return (SBSystemAperturePlatformElementHosting *)objc_loadWeakRetained((id *)&self->_platformElementHost);
}

- (void)setPlatformElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_platformElementHost, a3);
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (SBSystemApertureGestureHandling)gestureHandler
{
  return (SBSystemApertureGestureHandling *)objc_loadWeakRetained((id *)&self->_gestureHandler);
}

- (void)setGestureHandler:(id)a3
{
  objc_storeWeak((id *)&self->_gestureHandler, a3);
}

- (SBDynamicFlashlightActivityElementDelegate)delegate
{
  return (SBDynamicFlashlightActivityElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBDynamicFlashlightState)flashlightState
{
  return self->_flashlightState;
}

- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider
{
  return self->_leadingPackageViewProvider;
}

- (SBUISystemApertureTextContentProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, 0);
  objc_storeStrong((id *)&self->_flashlightState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_gestureHandler);
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_activityHost);
  objc_storeStrong((id *)&self->_flashlightSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_elementViewController, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
}

- (void)shouldRemainActiveWhileFlashlightIsOff
{
  _BOOL4 v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 88) == 3;
  v4 = objc_msgSend(*(id *)(a1 + 16), "shouldDismissWhenOff");
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4 ^ 1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "ELT: Remain active? layoutMode:%{BOOL}i && shouldNotDismiss:%{BOOL}i", (uint8_t *)v5, 0xEu);
}

@end
