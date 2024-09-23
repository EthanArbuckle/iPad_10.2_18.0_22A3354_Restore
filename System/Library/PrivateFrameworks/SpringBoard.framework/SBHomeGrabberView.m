@implementation SBHomeGrabberView

- (void)layoutSubviews
{
  id WeakRetained;
  SBFHomeAffordanceView *homeAffordanceView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *pointerHitTestBlockingView;
  id v14;

  -[SBHomeGrabberView bounds](self, "bounds");
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "additionalEdgeSpacingForHomeGrabberView:", self);

  homeAffordanceView = self->_homeAffordanceView;
  SBScreenScale();
  BSRectRoundForScale();
  -[SBFHomeAffordanceView setFrame:](homeAffordanceView, "setFrame:");
  -[SBFHomeAffordanceInteraction setNeedsUpdate](self->_homeAffordanceInteraction, "setNeedsUpdate");
  -[SBFHomeAffordanceInteraction homeAffordanceHitTestRect](self->_homeAffordanceInteraction, "homeAffordanceHitTestRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView setFrame:](self->_hitTestRectVisualizationView, "setFrame:");
  -[UIView setFrame:](self->_touchHitTestBlockingView, "setFrame:", v6, v8, v10, v12);
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_pointerHitTestBlockingView, "setFrame:");
  pointerHitTestBlockingView = self->_pointerHitTestBlockingView;
  objc_msgSend((id)SBApp, "mousePointerManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](pointerHitTestBlockingView, "setHidden:", objc_msgSend(v14, "isHardwarePointingDeviceAttached") ^ 1);

}

- (CGRect)grabberFrameForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat rect;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect = *MEMORY[0x1E0C9D648];
  -[SBHomeGrabberView suggestedSizeForContentWidth:](self, "suggestedSizeForContentWidth:", CGRectGetWidth(a3));
  v10 = v9;
  v12 = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = CGRectGetWidth(v20);
  v21.origin.x = rect;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  v14 = (v13 - CGRectGetWidth(v21)) * 0.5;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGRectGetHeight(v22);
  v23.origin.x = v14;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  CGRectGetHeight(v23);
  -[SBHomeGrabberView suggestedEdgeSpacing](self, "suggestedEdgeSpacing");
  SBScreenScale();
  BSRectRoundForScale();
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  MTLumaDodgePillView *pillView;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  pillView = self->_pillView;
  if (pillView)
  {
    -[MTLumaDodgePillView suggestedSizeForContentWidth:](pillView, "suggestedSizeForContentWidth:", a3);
  }
  else
  {
    v8 = (void *)objc_opt_class();
    -[SBHomeGrabberView _effectiveLumaDodgePillSettings](self, "_effectiveLumaDodgePillSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestedSizeForContentWidth:withSettings:", v9, a3);
    v11 = v10;
    v13 = v12;

    v6 = v11;
    v7 = v13;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)suggestedEdgeSpacing
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeGrabberView _effectiveLumaDodgePillSettings](self, "_effectiveLumaDodgePillSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeSpacing");
  v4 = v3;

  return v4;
}

- (id)_effectiveLumaDodgePillSettings
{
  MTLumaDodgePillSettings *pillSettings;

  pillSettings = self->_pillSettings;
  if (pillSettings)
    return pillSettings;
  objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSuppressesBounce:(BOOL)a3
{
  self->_suppressesBounce = a3;
}

- (BOOL)isHidden
{
  return self->_presence != 0;
}

- (void)turnOffAutoHideWithDelay:(double)a3
{
  NSObject *v5;
  unint64_t v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  _QWORD block[7];
  uint8_t buf[4];
  SBHomeGrabberView *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView turnOffAutoHideWithDelay:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBHomeGrabberView.m"), 243, CFSTR("this call must be made on the main thread"));

  }
  if (-[SBHomeGrabberView _autohideEffectivelyEnabled](self, "_autohideEffectivelyEnabled"))
  {
    if (self->_touchState && BSFloatGreaterThanFloat())
    {
      self->_touchState = 2;
      SBLogHomeAffordance();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v12 = self;
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "grabber=%p touch idleness disabled - preparing to stop asserting hidden after %fs", buf, 0x16u);
      }

      -[SBHomeGrabberView updateStyle](self, "updateStyle");
      v6 = self->_lastActivatingToken + 1;
      self->_lastActivatingToken = v6;
      v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__SBHomeGrabberView_turnOffAutoHideWithDelay___block_invoke;
      block[3] = &unk_1E8E9DF00;
      block[4] = self;
      block[5] = v6;
      *(double *)&block[6] = a3;
      dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    }
    -[SBHomeGrabberView setAutoHides:](self, "setAutoHides:", 0);
  }
}

- (BOOL)_autohideEffectivelyEnabled
{
  if (-[SBFHomeGrabberSettings autoHideOverride](self->_settings, "autoHideOverride") == 0x7FFFFFFFFFFFFFFFLL)
    return self->_autoHides;
  else
    return BSSettingFlagIsYes();
}

- (void)setEdgeProtectEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setEdgeProtectEnabled:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBHomeGrabberView.m"), 267, CFSTR("this call must be made on the main thread"));

  }
  if (self->_edgeProtectEnabled != v3)
  {
    self->_edgeProtectEnabled = v3;
    -[SBHomeGrabberView updateStyle](self, "updateStyle");
  }
}

uint64_t __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setStyle:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidateInitialAutoHideTime
{
  ++self->_lastInitialHideToken;
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3
{
  id v4;
  int64_t luma;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView lumaDodgePillDidDetectBackgroundLuminanceChange:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBHomeGrabberView.m"), 919, CFSTR("this call must be made on the main thread"));

  }
  luma = self->_luma;
  self->_luma = objc_msgSend(v4, "backgroundLuminance");
  SBLogHomeAffordance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBHomeGrabberView lumaDodgePillDidDetectBackgroundLuminanceChange:].cold.1();

  if (luma)
  {
    -[SBHomeGrabberView updateStyle](self, "updateStyle");
  }
  else
  {
    -[SBFHomeGrabberSettings initialLumaResponseAnimationSettings](self->_settings, "initialLumaResponseAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BSAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGrabberView updateStyleWithAnimationSettings:](self, "updateStyleWithAnimationSettings:", v8);

  }
}

- (void)updateStyleWithAnimationSettings:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  if ((objc_msgSend(v4, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView updateStyleWithAnimationSettings:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBHomeGrabberView.m"), 325, CFSTR("this call must be made on the main thread"));

  }
  -[SBHomeGrabberView _updatePresence:style:withAnimationSettings:](self, "_updatePresence:style:withAnimationSettings:", -[SBHomeGrabberView _calculatePresence](self, "_calculatePresence"), -[SBHomeGrabberView _calculateStyle](self, "_calculateStyle"), v5);

  -[SBHomeGrabberView _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
}

- (void)updateStyle
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView updateStyle]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBHomeGrabberView.m"), 316, CFSTR("this call must be made on the main thread"));

  }
  v3 = -[SBHomeGrabberView _calculateStyle](self, "_calculateStyle");
  v4 = -[SBHomeGrabberView _calculatePresence](self, "_calculatePresence");
  -[SBHomeGrabberView _animationSettingsForTransitionFromStyle:toStyle:fromPresence:toPresence:](self, "_animationSettingsForTransitionFromStyle:toStyle:fromPresence:toPresence:", self->_style, v3, self->_presence, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeGrabberView _updatePresence:style:withAnimationSettings:](self, "_updatePresence:style:withAnimationSettings:", v4, v3, v7);
  -[SBHomeGrabberView _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");

}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 withAnimationSettings:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  NSMutableSet *hiddenOverrides;
  void *v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  SBHomeGrabberView *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v6 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setHidden:forReason:withAnimationSettings:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SBHomeGrabberView.m"), 394, CFSTR("this call must be made on the main thread"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGrabberView.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  v11 = -[NSMutableSet count](self->_hiddenOverrides, "count");
  hiddenOverrides = self->_hiddenOverrides;
  if (v6)
  {
    if (hiddenOverrides)
    {
      v13 = (void *)objc_msgSend(v9, "copy");
      -[NSMutableSet addObject:](hiddenOverrides, "addObject:", v13);

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99E20];
      v15 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v14, "setWithObject:", v15);
      v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v17 = self->_hiddenOverrides;
      self->_hiddenOverrides = v16;

    }
  }
  else
  {
    -[NSMutableSet removeObject:](self->_hiddenOverrides, "removeObject:", v9);
  }
  v18 = -[NSMutableSet count](self->_hiddenOverrides, "count");
  if ((v11 == 0) == (v18 != 0))
  {
    v19 = v18;
    SBLogHomeAffordance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("stopped");
      if (v19)
        v21 = CFSTR("started");
      *(_DWORD *)buf = 134218242;
      v26 = self;
      v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, "grabber=%p local override - %{public}@ asserting hidden", buf, 0x16u);
    }

    -[SBHomeGrabberView _updatePresence:style:withAnimationSettings:](self, "_updatePresence:style:withAnimationSettings:", -[SBHomeGrabberView _calculatePresence](self, "_calculatePresence"), -[SBHomeGrabberView _calculateStyle](self, "_calculateStyle"), v10);
    -[SBHomeGrabberView _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
  }

}

- (void)_updatePresence:(int64_t)a3 style:(int64_t)a4 withAnimationSettings:(id)a5
{
  id v9;
  int64_t presence;
  NSObject *v11;
  void *v12;
  int64_t v13;
  MTLumaDodgePillView *pillView;
  SBFHomeAffordanceView *homeAffordanceView;
  void *v16;
  void *v17;
  NSMutableSet *outstandingVisibilityTransitionTokens;
  NSMutableSet *v19;
  NSMutableSet *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  int64_t v31;
  _QWORD v32[5];
  BOOL v33;
  _QWORD v34[5];
  uint8_t buf[4];
  SBHomeGrabberView *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  presence = self->_presence;
  if ((a3 != 0) == (presence != 0))
  {
    if (a3)
    {
      if (presence != a3)
      {
        self->_presence = a3;
        SBLogHomeAffordance();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          NSStringFromSBHomeGrabberViewPresence(a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v36 = self;
          v37 = 2114;
          v38 = v12;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "grabber=%p presence change to %{public}@", buf, 0x16u);

        }
        v13 = self->_presence;
        if (v13 == 1)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_47;
          v28[3] = &unk_1E8E9DED8;
          v28[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v28);
        }
        else if (v13 == 2
               && !-[NSMutableSet count](self->_outstandingVisibilityTransitionTokens, "count")
               && -[SBFHomeGrabberSettings removeViewOnHide](self->_settings, "removeViewOnHide"))
        {
          -[MTLumaDodgePillView setBackgroundLumninanceObserver:](self->_pillView, "setBackgroundLumninanceObserver:", 0);
          pillView = self->_pillView;
          self->_pillView = 0;

          -[SBFHomeAffordanceView removeFromSuperview](self->_homeAffordanceView, "removeFromSuperview");
          homeAffordanceView = self->_homeAffordanceView;
          self->_homeAffordanceView = 0;

          -[SBHomeGrabberView _setSystemPointerInteractionEnabled:](self, "_setSystemPointerInteractionEnabled:", 0);
          self->_luma = 0;
        }
      }
      self->_style = a4;
    }
    else
    {
      if (presence)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSBHomeGrabberViewPresence(self->_presence);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGrabberView.m"), 725, CFSTR("grabber=%p from visible to visible means the presence shouldn't change : %@ -> %@"), self, v27, CFSTR("visible"));

      }
      if (self->_style != a4)
      {
        self->_style = a4;
        -[SBHomeGrabberView _animateToStyle:disallowAdditive:withAnimationSettings:](self, "_animateToStyle:disallowAdditive:withAnimationSettings:", a4, 0, v9);
      }
    }
  }
  else
  {
    self->_presence = a3;
    self->_style = a4;
    if (presence)
    {
      if (-[NSMutableSet count](self->_outstandingVisibilityTransitionTokens, "count"))
      {
        -[SBHomeGrabberView _animateToStyle:disallowAdditive:withAnimationSettings:](self, "_animateToStyle:disallowAdditive:withAnimationSettings:", self->_style, 1, v9);
      }
      else
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke;
        v34[3] = &unk_1E8E9DED8;
        v34[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v34);
      }
    }
    v16 = (void *)MEMORY[0x1E0CB37E8];
    ++self->_lastVisibilityTransitionToken;
    objc_msgSend(v16, "numberWithUnsignedInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    outstandingVisibilityTransitionTokens = self->_outstandingVisibilityTransitionTokens;
    if (outstandingVisibilityTransitionTokens)
    {
      -[NSMutableSet addObject:](outstandingVisibilityTransitionTokens, "addObject:", v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v17);
      v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v20 = self->_outstandingVisibilityTransitionTokens;
      self->_outstandingVisibilityTransitionTokens = v19;

    }
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsAdditiveAnimations:", 1);
    SBLogHomeAffordance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSBHomeGrabberViewPresence(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = self;
      v37 = 2114;
      v38 = v23;
      v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "grabber=%p additive presence change to %{public}@ with %{public}@", buf, 0x20u);

    }
    v24 = (void *)MEMORY[0x1E0D01908];
    v31 = a3;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_44;
    v32[3] = &unk_1E8E9F508;
    v32[4] = self;
    v33 = a3 != 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2;
    v29[3] = &unk_1E8EAD9C8;
    v29[4] = self;
    v30 = v17;
    v25 = v17;
    objc_msgSend(v24, "animateWithFactory:options:actions:completion:", v21, 4, v32, v29);
    -[SBHomeGrabberView _notifyObserversOfDidUpdateHidden](self, "_notifyObserversOfDidUpdateHidden");

  }
}

- (int64_t)_calculateStyle
{
  id WeakRetained;
  char v4;

  if (!-[SBHomeGrabberView _edgeProtectEffectivelyEnabled](self, "_edgeProtectEffectivelyEnabled"))
    return -[SBHomeGrabberView _calculateLumaStyle](self, "_calculateLumaStyle");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(WeakRetained, "shouldAllowThinStyleForHomeGrabberView:", self);

    if ((v4 & 1) == 0)
      return -[SBHomeGrabberView _calculateLumaStyle](self, "_calculateLumaStyle");
  }
  else
  {

  }
  return 1;
}

- (BOOL)_edgeProtectEffectivelyEnabled
{
  if (-[SBFHomeGrabberSettings edgeProtectOverride](self->_settings, "edgeProtectOverride") == 0x7FFFFFFFFFFFFFFFLL)
    return self->_edgeProtectEnabled;
  else
    return BSSettingFlagIsYes();
}

- (int64_t)_calculateLumaStyle
{
  int64_t luma;
  int64_t colorBias;
  unint64_t v5;

  luma = self->_luma;
  if (self->_ignoresLuminance)
    luma = 0;
  if (luma == 2)
    return 3;
  if (luma == 1)
    return 4;
  colorBias = self->_colorBias;
  if (colorBias == 1)
    return 3;
  if (colorBias == 2)
    return 4;
  v5 = -[SBFHomeGrabberSettings initializationStyle](self->_settings, "initializationStyle");
  if (v5 >= 3)
    return 0;
  else
    return v5 + 2;
}

- (void)_animateToStyle:(int64_t)a3 disallowAdditive:(BOOL)a4 withAnimationSettings:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  uint8_t buf[4];
  SBHomeGrabberView *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[MTLumaDodgePillView style](self->_pillView, "style") != a3)
  {
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)a3 < 2 || a4)
    {
      SBLogHomeAffordance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromMTLumaDodgePillStyle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v20 = self;
        v21 = 2114;
        v22 = v14;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "grabber=%p style change to %{public}@ with %{public}@", buf, 0x20u);

      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_40;
      v16[3] = &unk_1E8E9DE88;
      v16[4] = self;
      v16[5] = a3;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_41;
      v15[3] = &unk_1E8EAAB58;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:options:actions:completion:", v8, 4, v16, v15);
    }
    else
    {
      objc_msgSend(v9, "setAllowsAdditiveAnimations:", 1);
      SBLogHomeAffordance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromMTLumaDodgePillStyle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v20 = self;
        v21 = 2114;
        v22 = v12;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "grabber=%p additive style change to %{public}@ with %{public}@", buf, 0x20u);

      }
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke;
      v18[3] = &unk_1E8E9DE88;
      v18[4] = self;
      v18[5] = a3;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2;
      v17[3] = &unk_1E8EAAB58;
      v17[4] = self;
      v17[5] = a3;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:options:actions:completion:", v10, 4, v18, v17);
    }

  }
}

- (void)_notifyObserversOfDidUpdateHidden
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "homeGrabberViewDidUpdateHidden:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_animationSettingsForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 fromPresence:(int64_t)a5 toPresence:(int64_t)a6
{
  BOOL v6;
  int v7;
  BOOL v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;
  SBFHomeGrabberSettings *settings;

  if (a3)
    v6 = a5 == 0;
  else
    v6 = 0;
  v7 = v6;
  if (a4)
    v8 = a6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if ((v7 & 1) != 0 || !v9)
  {
    if (((v7 | v9) & 1) != 0)
    {
      if ((v7 & v9) == 1)
      {
        -[SBFHomeGrabberSettings hideAnimationSettings](self->_settings, "hideAnimationSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 1)
          LOBYTE(v9) = 1;
        if ((v9 & 1) != 0)
        {
          v14 = v7 ^ 1;
          settings = self->_settings;
          if (a4 != 1)
            v14 = 1;
          if ((v14 & 1) != 0)
            -[SBFHomeGrabberSettings lumaResponseAnimationSettings](settings, "lumaResponseAnimationSettings");
          else
            -[SBFHomeGrabberSettings prominentToThinAnimationSettings](settings, "prominentToThinAnimationSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[SBFHomeGrabberSettings thinToProminentAnimationSettings](self->_settings, "thinToProminentAnimationSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      -[SBFHomeGrabberSettings unhideAnimationSettings](self->_settings, "unhideAnimationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(v11, "BSAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)setPointerClickDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pointerClickDelegate, a3);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setDelegate:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBHomeGrabberView.m"), 200, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBHomeGrabberView updateStyle](self, "updateStyle");
    -[SBHomeGrabberView setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  SBLogHomeAffordance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2_cold_1(a1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "count"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 560);
    *(_QWORD *)(v3 + 560) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 536) == 2)
    {
      if (objc_msgSend(*(id *)(v5 + 416), "removeViewOnHide"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setBackgroundLumninanceObserver:", 0);
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 440);
        *(_QWORD *)(v6 + 440) = 0;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 432);
        *(_QWORD *)(v8 + 432) = 0;

        objc_msgSend(*(id *)(a1 + 32), "_setSystemPointerInteractionEnabled:", 0);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = 0;
      }
    }
  }
}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3 settings:(id)a4 shouldEnableGestures:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SBHomeGrabberView *v13;
  SBHomeGrabberView *v14;
  uint64_t v15;
  SBFHomeGrabberSettings *settings;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  UIView *touchHitTestBlockingView;
  void *v24;
  uint64_t v25;
  UIView *pointerHitTestBlockingView;
  void *v27;
  uint64_t v28;
  MTLumaDodgePillView *pillView;
  uint64_t v30;
  SBFHomeAffordanceView *homeAffordanceView;
  void *v32;
  id v33;
  SBAttentionAwarenessClient *v34;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  objc_super v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:]");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("SBHomeGrabberView.m"), 121, CFSTR("this call must be made on the main thread"));

  }
  v41.receiver = self;
  v41.super_class = (Class)SBHomeGrabberView;
  v13 = -[SBHomeGrabberView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_shouldEnableGestures = a5;
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    settings = v14->_settings;
    v14->_settings = (SBFHomeGrabberSettings *)v15;

    -[SBFHomeGrabberSettings addKeyPathObserver:](v14->_settings, "addKeyPathObserver:", v14);
    -[SBHomeGrabberView setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", CFSTR("Home Grabber"));
    objc_storeStrong((id *)&v14->_pillSettings, a4);
    v17 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v22 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v19, v20, v21);
    touchHitTestBlockingView = v14->_touchHitTestBlockingView;
    v14->_touchHitTestBlockingView = (UIView *)v22;

    -[UIView layer](v14->_touchHitTestBlockingView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHitTestsAsOpaque:", 1);

    -[SBHomeGrabberView _updateTouchHitTestBlockingView](v14, "_updateTouchHitTestBlockingView");
    -[SBHomeGrabberView addSubview:](v14, "addSubview:", v14->_touchHitTestBlockingView);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v18, v19, v20, v21);
    pointerHitTestBlockingView = v14->_pointerHitTestBlockingView;
    v14->_pointerHitTestBlockingView = (UIView *)v25;

    -[UIView layer](v14->_pointerHitTestBlockingView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHitTestsAsOpaque:", 1);

    -[SBHomeGrabberView addSubview:](v14, "addSubview:", v14->_pointerHitTestBlockingView);
    v28 = -[SBHomeGrabberView _newPillView](v14, "_newPillView");
    pillView = v14->_pillView;
    v14->_pillView = (MTLumaDodgePillView *)v28;

    -[MTLumaDodgePillView setBackgroundLumninanceObserver:](v14->_pillView, "setBackgroundLumninanceObserver:", v14);
    v30 = -[SBHomeGrabberView _newHomeAffordanceView](v14, "_newHomeAffordanceView");
    homeAffordanceView = v14->_homeAffordanceView;
    v14->_homeAffordanceView = (SBFHomeAffordanceView *)v30;

    -[SBFHomeAffordanceView addContentView:](v14->_homeAffordanceView, "addContentView:", v14->_pillView);
    -[SBHomeGrabberView addSubview:](v14, "addSubview:", v14->_homeAffordanceView);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SpringBoard.HomeGrabberView-%llu"), ++initWithFrame_settings_shouldEnableGestures____grabberNumber);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
    objc_msgSend(v33, "setIdentifier:", v32);
    objc_msgSend(v33, "setEventMask:", 8);
    -[SBFHomeGrabberSettings autoHideTime](v14->_settings, "autoHideTime");
    objc_msgSend(v33, "setAttentionLostTimeout:");
    v34 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v14->_idleTouchAwarenessClient;
    v14->_idleTouchAwarenessClient = v34;

    -[SBAttentionAwarenessClient setDelegate:](v14->_idleTouchAwarenessClient, "setDelegate:", v14);
    -[SBAttentionAwarenessClient setConfiguration:](v14->_idleTouchAwarenessClient, "setConfiguration:", v33);
    -[SBHomeGrabberView settings:changedValueForKeyPath:](v14, "settings:changedValueForKeyPath:", v14->_settings, 0);
    -[SBHomeGrabberView _setSystemPointerInteractionEnabled:](v14, "_setSystemPointerInteractionEnabled:", 1);
    objc_msgSend((id)SBApp, "mousePointerManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:", v14);

    SBLogHomeAffordance();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:].cold.1((uint64_t)v14, (uint64_t *)&v14->_pillView, v37);

  }
  return v14;
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 432))
  {
    objc_msgSend(*(id *)(v1 + 440), "setStyle:", *(_QWORD *)(v1 + 544));
  }
  else
  {
    v3 = objc_msgSend((id)v1, "_newPillView");
    v4 = (void *)*((_QWORD *)*v2 + 55);
    *((_QWORD *)*v2 + 55) = v3;

    v5 = *((_QWORD *)*v2 + 78);
    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2 * (v5 == 1);
    objc_msgSend(*((id *)*v2 + 55), "setBackgroundLuminanceBias:", v6);
    objc_msgSend(*((id *)*v2 + 55), "setStyle:", *((_QWORD *)*v2 + 68));
    v7 = (id *)*v2;
    if (!*((_BYTE *)*v2 + 609))
    {
      objc_msgSend(v7[55], "setBackgroundLumninanceObserver:");
      v7 = (id *)*v2;
    }
    v8 = objc_msgSend(v7, "_newHomeAffordanceView");
    v9 = (void *)*((_QWORD *)*v2 + 54);
    *((_QWORD *)*v2 + 54) = v8;

    objc_msgSend(*((id *)*v2 + 54), "setAlpha:", 0.0);
    objc_msgSend(*((id *)*v2 + 54), "addContentView:", *((_QWORD *)*v2 + 55));
    objc_msgSend(*v2, "addSubview:", *((_QWORD *)*v2 + 54));
    objc_msgSend(*v2, "_setSystemPointerInteractionEnabled:", 1);
    objc_msgSend(*v2, "layoutSubviews");
    SBLogHomeAffordance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1();

  }
}

- (void)_setSystemPointerInteractionEnabled:(BOOL)a3
{
  id WeakRetained;
  id v5;

  if (self->_isSystemPointerInteractionEnabled != a3)
  {
    self->_isSystemPointerInteractionEnabled = a3;
    if (self->_shouldEnableGestures)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
      v5 = WeakRetained;
      if (self->_isSystemPointerInteractionEnabled)
        objc_msgSend(WeakRetained, "registerView:delegate:", self, self);
      else
        objc_msgSend(WeakRetained, "unregisterView:", self);

    }
  }
}

- (id)_newPillView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[SBHomeGrabberView grabberFrame](self, "grabberFrame");
  SBRectWithSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHomeGrabberView _effectiveLumaDodgePillSettings](self, "_effectiveLumaDodgePillSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sbf_homeGrabberGraphicsQuality");

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47490]), "initWithFrame:settings:graphicsQuality:", v11, v13, v4, v6, v8, v10);
  return v14;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBFHomeAffordanceInteraction **p_homeAffordanceInteraction;
  SBFHomeAffordanceInteraction *homeAffordanceInteraction;
  SBFHomeAffordanceInteraction *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_shouldEnableGestures)
  {
    v4 = a3;
    -[UIView _sbWindowScene](self, "_sbWindowScene");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "homeAffordanceInteractionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeAffordanceInteractionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v6)
    {
      p_homeAffordanceInteraction = &self->_homeAffordanceInteraction;
      homeAffordanceInteraction = self->_homeAffordanceInteraction;
      if (homeAffordanceInteraction)
      {
        -[SBFHomeAffordanceInteraction setDelegate:](homeAffordanceInteraction, "setDelegate:", 0);
        -[SBHomeGrabberView removeInteraction:](self, "removeInteraction:", *p_homeAffordanceInteraction);
        v10 = *p_homeAffordanceInteraction;
        *p_homeAffordanceInteraction = 0;

      }
      v11 = (void *)objc_msgSend(v7, "newHomeAffordanceInteraction");
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setDelegate:", self);
        objc_msgSend(v12, "setEnabled:", self->_homeAffordanceInteractionEnabled);
        -[SBHomeGrabberView addInteraction:](self, "addInteraction:", v12);
        objc_storeStrong((id *)&self->_homeAffordanceInteraction, v12);
      }

    }
    objc_msgSend(v17, "systemPointerInteractionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemPointerInteractionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != v13)
    {
      objc_msgSend(v13, "unregisterView:", self);
      if (self->_isSystemPointerInteractionEnabled && (objc_msgSend(v14, "isViewRegistered:", self) & 1) == 0)
        objc_msgSend(v14, "registerView:delegate:", self, self);
      objc_storeWeak((id *)&self->_systemPointerInteractionManager, v14);
    }
    objc_msgSend(v17, "assistantController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assistantController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 != v15)
    {
      objc_msgSend(v15, "removeObserver:", self);
      objc_msgSend(v16, "addObserver:", self);
      objc_storeWeak((id *)&self->_assistantController, v16);
    }

  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[SBHomeGrabberView _updatePresence:style:withAnimationSettings:](self, "_updatePresence:style:withAnimationSettings:", -[SBHomeGrabberView _calculatePresence](self, "_calculatePresence", a3, a4), -[SBHomeGrabberView _calculateStyle](self, "_calculateStyle"), 0);
  -[SBHomeGrabberView _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
  -[SBHomeGrabberView _updateIdleTouchAwarenessClient](self, "_updateIdleTouchAwarenessClient");
  -[SBHomeGrabberView _updateHitTestRectVisualizationView](self, "_updateHitTestRectVisualizationView");
  -[SBHomeGrabberView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTouchHitTestBlockingView
{
  uint64_t v3;

  if (self->_touchHitTestBlockingViewBlocksTouches)
    v3 = 0;
  else
    v3 = SBFIsSAEHungryHomeAffordanceAvailable() ^ 1;
  -[UIView setHidden:](self->_touchHitTestBlockingView, "setHidden:", v3);
}

- (void)_updateIdleTouchAwarenessClient
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  int v8;
  SBHomeGrabberView *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHomeGrabberView _autohideEffectivelyEnabled](self, "_autohideEffectivelyEnabled");
  v4 = -[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled");
  if (v3)
  {
    if (v4)
      return;
    -[SBAttentionAwarenessClient resetAttentionLostTimeout](self->_idleTouchAwarenessClient, "resetAttentionLostTimeout");
    -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 1);
    ++self->_lastInitialHideToken;
    SBLogHomeAffordance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v8 = 134217984;
    v9 = self;
    v6 = "grabber=%p started observing touch idleness";
    goto LABEL_12;
  }
  if (!v4)
    return;
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
  if (self->_touchState != 1)
  {
    SBLogHomeAffordance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      return;
    }
    v8 = 134217984;
    v9 = self;
    v6 = "grabber=%p stopped observing touch idleness";
LABEL_12:
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v8, 0xCu);
    goto LABEL_13;
  }
  self->_touchState = 0;
  SBLogHomeAffordance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "grabber=%p stopped observing touch idleness - stopped asserting hidden", (uint8_t *)&v8, 0xCu);
  }

  -[SBHomeGrabberView updateStyle](self, "updateStyle");
}

- (void)_noteActiveForTouchThatShouldUnhideImmediately:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  dispatch_time_t v11;
  _QWORD block[7];
  uint8_t buf[4];
  SBHomeGrabberView *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  ++self->_lastInitialHideToken;
  if (-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled"))
  {
    -[SBFHomeGrabberSettings delayForUnhideOnTouch](self->_settings, "delayForUnhideOnTouch");
    v6 = v5;
    if ((BSFloatLessThanOrEqualToFloat() & 1) == 0
      && (!-[NSMutableSet count](self->_outstandingVisibilityTransitionTokens, "count") ? (v7 = !v3) : (v7 = 0), v7))
    {
      if (self->_touchState == 1)
      {
        self->_touchState = 2;
        SBLogHomeAffordance();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v14 = self;
          v15 = 2048;
          v16 = v6;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - preparing to stop asserting hidden after %fs", buf, 0x16u);
        }

        -[SBHomeGrabberView updateStyle](self, "updateStyle");
        v10 = self->_lastActivatingToken + 1;
        self->_lastActivatingToken = v10;
        v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__SBHomeGrabberView__noteActiveForTouchThatShouldUnhideImmediately___block_invoke;
        block[3] = &unk_1E8E9DF00;
        block[4] = self;
        block[5] = v10;
        *(double *)&block[6] = v6;
        dispatch_after(v11, MEMORY[0x1E0C80D38], block);
      }
    }
    else if (self->_touchState)
    {
      self->_touchState = 0;
      -[SBAttentionAwarenessClient resetAttentionLostTimeout](self->_idleTouchAwarenessClient, "resetAttentionLostTimeout");
      SBLogHomeAffordance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v14 = self;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden immediately", buf, 0xCu);
      }

      -[SBHomeGrabberView updateStyle](self, "updateStyle");
    }
  }
}

- (int64_t)_calculatePresence
{
  id WeakRetained;
  NSObject *v5;
  int64_t touchState;
  int v7;
  SBHomeGrabberView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_hiddenOverrides, "count"))
    return 2;
  if (!-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled") || !self->_touchState)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (objc_msgSend(WeakRetained, "shouldAllowAutoHideForHomeGrabberView:", self) & 1) == 0))
  {
    self->_touchState = 0;
    ++self->_lastInitialHideToken;
    -[SBAttentionAwarenessClient resetAttentionLostTimeout](self->_idleTouchAwarenessClient, "resetAttentionLostTimeout");
    SBLogHomeAffordance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden for delegate override", (uint8_t *)&v7, 0xCu);
    }

  }
  touchState = self->_touchState;
  if (touchState == 2)
    return 1;
  else
    return 2 * (touchState == 1);
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2()
{
  NSObject *v0;

  SBLogHomeAffordance();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_cold_1();

}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3
{
  return -[SBHomeGrabberView initWithFrame:shouldEnableGestures:](self, "initWithFrame:shouldEnableGestures:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3 shouldEnableGestures:(BOOL)a4
{
  return -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:](self, "initWithFrame:settings:shouldEnableGestures:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGrabberView.m"), 173, CFSTR("cannot call %s"), "-[SBHomeGrabberView initWithCoder:]");

  return -[SBHomeGrabberView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  id WeakRetained;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  SBHomeGrabberView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBFHomeGrabberSettings removeKeyPathObserver:](self->_settings, "removeKeyPathObserver:", self);
  if (self->_shouldEnableGestures && self->_isSystemPointerInteractionEnabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
    objc_msgSend(WeakRetained, "unregisterView:", self);

  }
  if (-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled"))
  {
    -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
    SBLogHomeAffordance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v8 = self;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "grabber=%p stopped observing touch idleness - dealloc", buf, 0xCu);
    }

  }
  -[SBAttentionAwarenessClient setDelegate:](self->_idleTouchAwarenessClient, "setDelegate:", 0);
  -[SBAttentionAwarenessClient invalidate](self->_idleTouchAwarenessClient, "invalidate");
  v5 = objc_loadWeakRetained((id *)&self->_assistantController);
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SBHomeGrabberView;
  -[SBHomeGrabberView dealloc](&v6, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)setAutoHides:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setAutoHides:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBHomeGrabberView.m"), 227, CFSTR("this call must be made on the main thread"));

  }
  if (self->_autoHides != v3)
  {
    self->_autoHides = v3;
    -[SBHomeGrabberView _updateIdleTouchAwarenessClient](self, "_updateIdleTouchAwarenessClient");
  }
}

- (void)turnOnAutoHideWithInitialDelay:(double)a3
{
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView turnOnAutoHideWithInitialDelay:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBHomeGrabberView.m"), 235, CFSTR("this call must be made on the main thread"));

  }
  if (!-[SBHomeGrabberView _autohideEffectivelyEnabled](self, "_autohideEffectivelyEnabled"))
  {
    -[SBHomeGrabberView setAutoHides:](self, "setAutoHides:", 1);
    -[SBHomeGrabberView resetAutoHideWithInitialDelay:](self, "resetAutoHideWithInitialDelay:", a3);
  }
}

uint64_t __46__SBHomeGrabberView_turnOffAutoHideWithDelay___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 488) == 2)
  {
    v2 = result;
    if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 496))
    {
      *(_QWORD *)(v1 + 488) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 480), "resetAttentionLostTimeout");
      SBLogHomeAffordance();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(v2 + 32);
        v5 = *(_QWORD *)(v2 + 48);
        v6 = 134218240;
        v7 = v4;
        v8 = 2048;
        v9 = v5;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness disabled - stopped asserting hidden after %fs", (uint8_t *)&v6, 0x16u);
      }

      return objc_msgSend(*(id *)(v2 + 32), "updateStyle");
    }
  }
  return result;
}

- (void)forgetBackgroundLuminance
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView forgetBackgroundLuminance]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBHomeGrabberView.m"), 275, CFSTR("this call must be made on the main thread"));

  }
  self->_luma = 0;
  if (!self->_ignoresLuminance)
  {
    -[MTLumaDodgePillView setBackgroundLumninanceObserver:](self->_pillView, "setBackgroundLumninanceObserver:", 0);
    -[MTLumaDodgePillView setBackgroundLumninanceObserver:](self->_pillView, "setBackgroundLumninanceObserver:", self);
    -[SBHomeGrabberView updateStyle](self, "updateStyle");
  }
}

- (void)resetAutoHide
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  SBHomeGrabberView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView resetAutoHide]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBHomeGrabberView.m"), 285, CFSTR("this call must be made on the main thread"));

  }
  ++self->_lastInitialHideToken;
  if (-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled"))
  {
    if (self->_touchState)
    {
      self->_touchState = 0;
      SBLogHomeAffordance();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v6 = 134217984;
        v7 = self;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden for manual reset", (uint8_t *)&v6, 0xCu);
      }

      -[SBHomeGrabberView updateStyle](self, "updateStyle");
    }
    -[SBAttentionAwarenessClient resetAttentionLostTimeout](self->_idleTouchAwarenessClient, "resetAttentionLostTimeout");
  }
}

- (void)resetAutoHideWithInitialDelay:(double)a3
{
  unint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  _QWORD block[7];
  uint8_t buf[4];
  SBHomeGrabberView *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView resetAutoHideWithInitialDelay:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBHomeGrabberView.m"), 298, CFSTR("this call must be made on the main thread"));

  }
  -[SBHomeGrabberView resetAutoHide](self, "resetAutoHide");
  if (BSFloatGreaterThanFloat())
  {
    -[SBFHomeGrabberSettings autoHideTime](self->_settings, "autoHideTime");
    if (BSFloatLessThanFloat())
    {
      v5 = self->_lastInitialHideToken + 1;
      self->_lastInitialHideToken = v5;
      SBLogHomeAffordance();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v12 = self;
        v13 = 2048;
        v14 = v5;
        v15 = 2048;
        v16 = a3;
        _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "grabber=%p touch idleness - preparing to start asserting hidden for initial delay with token=%lu after %fs", buf, 0x20u);
      }

      v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke;
      block[3] = &unk_1E8E9DF00;
      block[4] = self;
      block[5] = v5;
      *(double *)&block[6] = a3;
      dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    }
  }
}

void __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 4);
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 488) == 1 || a1[5] != *(_QWORD *)(v2 + 504))
  {
    SBLogHomeAffordance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke_cold_1();

  }
  else
  {
    *(_QWORD *)(v2 + 488) = 1;
    SBLogHomeAffordance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = a1[6];
      v9 = 134218496;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - started asserting hidden for initial delay with token=%lu after %fs", (uint8_t *)&v9, 0x20u);
    }

    objc_msgSend(*v3, "updateStyle");
  }
}

- (CGRect)grabberFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBHomeGrabberView bounds](self, "bounds");
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)grabberHitTestRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBFHomeAffordanceInteraction homeAffordanceHitTestRect](self->_homeAffordanceInteraction, "homeAffordanceHitTestRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setColorBias:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setColorBias:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBHomeGrabberView.m"), 356, CFSTR("this call must be made on the main thread"));

  }
  if (self->_colorBias != a3)
  {
    self->_colorBias = a3;
    if (a3 == 2)
      v5 = 1;
    else
      v5 = 2 * (a3 == 1);
    -[MTLumaDodgePillView setBackgroundLuminanceBias:](self->_pillView, "setBackgroundLuminanceBias:", v5);
    if (!self->_luma)
      -[SBHomeGrabberView updateStyleWithAnimationSettings:](self, "updateStyleWithAnimationSettings:", 0);
  }
}

- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3
{
  if (self->_homeAffordanceInteractionEnabled != a3)
  {
    self->_homeAffordanceInteractionEnabled = a3;
    -[SBHomeGrabberView _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
  }
}

- (void)setIgnoresLuminance:(BOOL)a3
{
  _BOOL4 v3;
  SBHomeGrabberView *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView setIgnoresLuminance:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBHomeGrabberView.m"), 376, CFSTR("this call must be made on the main thread"));

  }
  if (self->_ignoresLuminance != v3)
  {
    self->_ignoresLuminance = v3;
    if (v3)
      v5 = 0;
    else
      v5 = self;
    -[MTLumaDodgePillView setBackgroundLumninanceObserver:](self->_pillView, "setBackgroundLumninanceObserver:", v5);
    -[SBHomeGrabberView updateStyleWithAnimationSettings:](self, "updateStyleWithAnimationSettings:", 0);
  }
}

- (void)setHidden:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGrabberView.m"), 390, CFSTR("-setHidden: is unavailable on SBHomeGrabberView"));

}

uint64_t __68__SBHomeGrabberView__noteActiveForTouchThatShouldUnhideImmediately___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 488) == 2)
  {
    v2 = result;
    if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 496))
    {
      *(_QWORD *)(v1 + 488) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 480), "resetAttentionLostTimeout");
      SBLogHomeAffordance();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(v2 + 32);
        v5 = *(_QWORD *)(v2 + 48);
        v6 = 134218240;
        v7 = v4;
        v8 = 2048;
        v9 = v5;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden after %fs", (uint8_t *)&v6, 0x16u);
      }

      return objc_msgSend(*(id *)(v2 + 32), "updateStyle");
    }
  }
  return result;
}

- (void)_noteClick
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v1, v2, "grabber=%@ in window %@ registered a pointer click, but doesn't have a pointer click delegate.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_20();
}

- (void)_noteTap
{
  if (!self->_presence && !self->_suppressesBounce)
    -[SBFHomeAffordanceView performHintAnimation](self->_homeAffordanceView, "performHintAnimation");
}

- (unint64_t)_hintStyleForWindowScene:(id)a3
{
  void *v3;
  int v4;
  unint64_t *v5;

  objc_msgSend(a3, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  v5 = (unint64_t *)MEMORY[0x1E0DAA0C8];
  if (!v4)
    v5 = (unint64_t *)MEMORY[0x1E0DAA0C0];
  return *v5;
}

- (id)_newHomeAffordanceView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DA9E20]);
  -[SBHomeGrabberView grabberFrame](self, "grabberFrame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[UIView _sbWindowScene](self, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHintStyle:", -[SBHomeGrabberView _hintStyleForWindowScene:](self, "_hintStyleForWindowScene:", v5));

  objc_msgSend(v4, "bs_setHitTestingDisabled:", 1);
  return v4;
}

uint64_t __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setStyle:", *(_QWORD *)(a1 + 40));
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_41()
{
  NSObject *v0;

  SBLogHomeAffordance();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_41_cold_1();

}

- (void)_updateHitTestRectVisualizationView
{
  int v3;
  UIView *hitTestRectVisualizationView;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  void *v13;
  void *v14;
  UIView *v15;

  v3 = -[SBFHomeGrabberSettings visualizeHitTestRect](self->_settings, "visualizeHitTestRect");
  hitTestRectVisualizationView = self->_hitTestRectVisualizationView;
  if (v3)
    v5 = hitTestRectVisualizationView == 0;
  else
    v5 = 0;
  if (v5)
  {
    -[SBFHomeAffordanceInteraction homeAffordanceHitTestRect](self->_homeAffordanceInteraction, "homeAffordanceHitTestRect");
    v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
    v11 = self->_hitTestRectVisualizationView;
    self->_hitTestRectVisualizationView = v10;

    v12 = self->_hitTestRectVisualizationView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v14);

    -[UIView bs_setHitTestingDisabled:](self->_hitTestRectVisualizationView, "bs_setHitTestingDisabled:", 1);
    -[SBHomeGrabberView addSubview:](self, "addSubview:", self->_hitTestRectVisualizationView);
  }
  else
  {
    if (!hitTestRectVisualizationView)
      LOBYTE(v3) = 1;
    if ((v3 & 1) == 0)
    {
      -[UIView removeFromSuperview](hitTestRectVisualizationView, "removeFromSuperview");
      v15 = self->_hitTestRectVisualizationView;
      self->_hitTestRectVisualizationView = 0;

    }
  }
}

uint64_t __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_44(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", v1);
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_47(uint64_t a1)
{
  _QWORD *v1;
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[54])
  {
    v3 = objc_msgSend(v1, "_newPillView");
    v4 = (void *)*((_QWORD *)*v2 + 55);
    *((_QWORD *)*v2 + 55) = v3;

    v5 = *((_QWORD *)*v2 + 78);
    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2 * (v5 == 1);
    objc_msgSend(*((id *)*v2 + 55), "setBackgroundLuminanceBias:", v6);
    objc_msgSend(*((id *)*v2 + 55), "setStyle:", *((_QWORD *)*v2 + 68));
    v7 = (id *)*v2;
    if (!*((_BYTE *)*v2 + 609))
    {
      objc_msgSend(v7[55], "setBackgroundLumninanceObserver:");
      v7 = (id *)*v2;
    }
    v8 = objc_msgSend(v7, "_newHomeAffordanceView");
    v9 = (void *)*((_QWORD *)*v2 + 54);
    *((_QWORD *)*v2 + 54) = v8;

    objc_msgSend(*((id *)*v2 + 54), "setAlpha:", 0.0);
    objc_msgSend(*((id *)*v2 + 54), "addContentView:", *((_QWORD *)*v2 + 55));
    objc_msgSend(*v2, "addSubview:", *((_QWORD *)*v2 + 54));
    objc_msgSend(*v2, "_setSystemPointerInteractionEnabled:", 1);
    objc_msgSend(*v2, "layoutSubviews");
    SBLogHomeAffordance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1();

  }
}

- (void)_updateHomeAffordanceInteraction
{
  _BOOL8 v3;

  v3 = -[SBHomeGrabberView _isInAWindow](self, "_isInAWindow")
    && (-[SBHomeGrabberView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0
    && self->_homeAffordanceView
    && self->_style != 1
    && self->_homeAffordanceInteractionEnabled;
  -[SBFHomeAffordanceInteraction setEnabled:](self->_homeAffordanceInteraction, "setEnabled:", v3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBHomeGrabberView *v5;
  SBHomeGrabberView *v6;
  SBHomeGrabberView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeGrabberView;
  -[SBHomeGrabberView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBHomeGrabberView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  SBFHomeAffordanceView *homeAffordanceView;
  id v5;

  homeAffordanceView = self->_homeAffordanceView;
  -[UIView _sbWindowScene](self, "_sbWindowScene", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFHomeAffordanceView setHintStyle:](homeAffordanceView, "setHintStyle:", -[SBHomeGrabberView _hintStyleForWindowScene:](self, "_hintStyleForWindowScene:", v5));

}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  SBHomeGrabberView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a5, a6, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBHomeGrabberView.m"), 904, CFSTR("this call must be made on the main thread"));

  }
  if (-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled") && self->_touchState != 1)
  {
    self->_touchState = 1;
    SBLogHomeAffordance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - started asserting hidden", (uint8_t *)&v10, 0xCu);
    }

    -[SBHomeGrabberView updateStyle](self, "updateStyle");
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeGrabberView clientDidResetForUserAttention:withEvent:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBHomeGrabberView.m"), 913, CFSTR("this call must be made on the main thread"));

  }
}

- (CGRect)_pointerInteractionHitTestRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBFHomeAffordanceView frame](self->_homeAffordanceView, "frame");
  -[SBFHomeGrabberSettings hitTestOutsetSides](self->_settings, "hitTestOutsetSides");
  -[SBFHomeGrabberSettings hitTestOutsetTop](self->_settings, "hitTestOutsetTop");
  -[SBFHomeAffordanceView center](self->_homeAffordanceView, "center");
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  CGFloat y;
  CGFloat x;
  CGPoint v9;
  CGRect v10;

  y = a4.y;
  x = a4.x;
  if ((objc_msgSend(a3, "_isPencilInitiated") & 1) != 0
    || (-[SBHomeGrabberView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) != 0
    || !-[SBHomeGrabberView _isInAWindow](self, "_isInAWindow"))
  {
    return 0;
  }
  -[SBHomeGrabberView _pointerInteractionHitTestRect](self, "_pointerInteractionHitTestRect");
  v9.x = x;
  v9.y = y;
  return CGRectContainsPoint(v10, v9);
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0CEA870];
  -[SBHomeGrabberView _pointerInteractionHitTestRect](self, "_pointerInteractionHitTestRect", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionWithRect:identifier:", v14, v6, v8, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self->_homeAffordanceView);
  objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFHomeAffordanceView frame](self->_homeAffordanceView, "frame");
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", v7 + -7.0, v8 + -4.0, v9 + 14.0, v10 + 8.0, (v9 + 14.0) * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__SBHomeGrabberView_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __81__SBHomeGrabberView_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBHomeGrabberView bounds](self, "bounds", a3);
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat rect;
  CGRect v41;
  CGRect v42;
  UIEdgeInsets result;

  -[SBHomeGrabberView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  rect = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBHomeGrabberView window](self, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v21 = v20;

  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  v22 = CGRectGetMaxY(v41) - v21;
  v42.origin.x = rect;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  v23 = vabdd_f64(CGRectGetMaxY(v42), v22);
  -[UIView _sbWindowScene](self, "_sbWindowScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "assistantController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (v26)
    v27 = v23;
  else
    v27 = 0.0;
  -[SBFHomeGrabberSettings hitTestOutsetTop](self->_settings, "hitTestOutsetTop");
  v29 = v27 + v28;
  if ((-[SBFHomeGrabberSettings constrainHitTestRectToSafeAreaInset](self->_settings, "constrainHitTestRectToSafeAreaInset") & (v29 > v23)) != 0)v30 = v23;
  else
    v30 = v29;
  -[SBFHomeGrabberSettings hitTestOutsetSides](self->_settings, "hitTestOutsetSides");
  v32 = v31;
  -[SBHomeGrabberView _effectiveLumaDodgePillSettings](self, "_effectiveLumaDodgePillSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "edgeSpacing");
  v35 = v34;

  v36 = -v30;
  v37 = -v32;
  v38 = -v35;
  v39 = -v32;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (void)homeAffordanceInteractionHomeAffordanceHitTestRectDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBHomeGrabberView setNeedsLayout](self, "setNeedsLayout", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeGrabberViewDidUpdateGrabberHitTestRect:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeGrabberViewDidRecognizeSingleTap:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 1;
  -[SBHomeGrabberView _updateTouchHitTestBlockingView](self, "_updateTouchHitTestBlockingView");
}

- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeGrabberViewDidRecognizeDoubleTap:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 0;
  -[SBHomeGrabberView _updateTouchHitTestBlockingView](self, "_updateTouchHitTestBlockingView");
}

- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeGrabberViewDidFailToRecognizeDoubleTap:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 0;
  -[SBHomeGrabberView _updateTouchHitTestBlockingView](self, "_updateTouchHitTestBlockingView");
}

- (SBHomeGrabberDelegate)delegate
{
  return (SBHomeGrabberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)autoHides
{
  return self->_autoHides;
}

- (BOOL)isEdgeProtectEnabled
{
  return self->_edgeProtectEnabled;
}

- (int64_t)colorBias
{
  return self->_colorBias;
}

- (BOOL)isHomeAffordanceInteractionEnabled
{
  return self->_homeAffordanceInteractionEnabled;
}

- (BOOL)ignoresLuminance
{
  return self->_ignoresLuminance;
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return (SBHomeGrabberPointerClickDelegate *)objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
}

- (BOOL)suppressesBounce
{
  return self->_suppressesBounce;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pointerClickDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_assistantController);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_outstandingVisibilityTransitionTokens, 0);
  objc_storeStrong((id *)&self->_hiddenOverrides, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_pointerHitTestBlockingView, 0);
  objc_storeStrong((id *)&self->_touchHitTestBlockingView, 0);
  objc_storeStrong((id *)&self->_hitTestRectVisualizationView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_pillSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)initWithFrame:(uint64_t)a1 settings:(uint64_t *)a2 shouldEnableGestures:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, (uint64_t)a3, "grabber=%p initialized with pill=%p", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

void __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v0, (uint64_t)v0, "grabber=%p touch idleness - initial hide request with token=%lu was interrupted", v1);
  OUTLINED_FUNCTION_2_0();
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromMTLumaDodgePillStyle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v1, v2, "grabber=%p additive style change to %{public}@ finished", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_41_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromMTLumaDodgePillStyle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v1, v2, "grabber=%p style change to %{public}@ finished", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v0, (uint64_t)v0, "grabber=%p created pill=%p", v1);
  OUTLINED_FUNCTION_2_0();
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSBHomeGrabberViewPresence(*(_QWORD *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "grabber=%p additive presence change to %{public}@ finished", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  NSStringFromMTLumaDodgePillBackgroundLuminance();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v0, v1, "grabber=%p luma changed to %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_20();
}

@end
