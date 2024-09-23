@implementation SBDashBoardSetupView

- (SBDashBoardSetupView)initWithFrame:(CGRect)a3 usingHomeAffordance:(BOOL)a4 coverSheetContext:(id)a5 isStoreRestricted:(BOOL)a6 isSecurityResearchDevice:(BOOL)a7
{
  _BOOL4 v9;
  double height;
  double width;
  double y;
  double x;
  id v15;
  SBDashBoardSetupView *v16;
  SBDashBoardSetupView *v17;
  void *v18;
  objc_super v20;

  v9 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBDashBoardSetupView;
  v16 = -[SBDashBoardSetupView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_isStoreRestricted = a6;
    v16->_isSecurityResearchDevice = a7;
    v16->_customDelayDuration = 4.0;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    if (a7)
    {
      -[SBDashBoardSetupView _addSecurityResearchLabels](v17, "_addSecurityResearchLabels");
    }
    else if (!-[SBDashBoardSetupView _actsLikeStoreRestricted](v17, "_actsLikeStoreRestricted"))
    {
      if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0)
        -[SBDashBoardSetupView _addActivationLockLabels](v17, "_addActivationLockLabels");
      -[SBDashBoardSetupView _addTitleLabel](v17, "_addTitleLabel");
    }
    -[SBDashBoardSetupView _addInfoButton](v17, "_addInfoButton");
    if (-[SBDashBoardSetupView _actsLikeStoreRestricted](v17, "_actsLikeStoreRestricted"))
    {
      -[SBDashBoardSetupView _addStoreRestrictedLabels](v17, "_addStoreRestrictedLabels");
    }
    else if (v9)
    {
      -[SBDashBoardSetupView _addHomeAffordanceCallToAction](v17, "_addHomeAffordanceCallToAction");
      -[SBDashBoardSetupView _addHomeAffordanceForCoverSheetContext:](v17, "_addHomeAffordanceForCoverSheetContext:", v15);
    }
    else
    {
      -[SBDashBoardSetupView _addHomeButtonCallToAction](v17, "_addHomeButtonCallToAction");
    }
    -[SBDashBoardSetupView _setupConstraints](v17, "_setupConstraints");
  }

  return v17;
}

- (void)dealloc
{
  NSObject *homeButtonCallToActionTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  homeButtonCallToActionTimer = self->_homeButtonCallToActionTimer;
  if (homeButtonCallToActionTimer)
  {
    dispatch_source_cancel(homeButtonCallToActionTimer);
    v4 = self->_homeButtonCallToActionTimer;
    self->_homeButtonCallToActionTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardSetupView;
  -[SBDashBoardSetupView dealloc](&v5, sel_dealloc);
}

- (void)setActivationInfoView:(id)a3
{
  UIView *v5;
  NSArray *activationInfoViewConstraints;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->_activationInfoView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activationInfoView, a3);
    -[SBDashBoardSetupView _adjustTitleVisibilityForInfoViews](self, "_adjustTitleVisibilityForInfoViews");
    activationInfoViewConstraints = self->_activationInfoViewConstraints;
    self->_activationInfoViewConstraints = 0;

    -[SBDashBoardSetupView _setupActivationInfoConstraintsIfNeeded](self, "_setupActivationInfoConstraintsIfNeeded");
    v5 = v7;
  }

}

- (void)setRegulatoryInfoView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_regulatoryInfoView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regulatoryInfoView, a3);
    -[UIView setHidden:](self->_activationInfoView, "setHidden:", self->_regulatoryInfoView != 0);
    -[SBDashBoardSetupView _adjustTitleVisibilityForInfoViews](self, "_adjustTitleVisibilityForInfoViews");
    v5 = v6;
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBDashBoardSetupView _updateLegibilitySettings](self, "_updateLegibilitySettings");
  }

}

- (double)setTitleString:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBCursiveTextView *cursiveTextView;
  int v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (_os_feature_enabled_impl())
    {
      objc_storeStrong((id *)&self->_currentLanguage, a4);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLForResource:withExtension:subdirectory:localization:", CFSTR("CursiveHello"), CFSTR("plist"), 0, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      cursiveTextView = self->_cursiveTextView;
      if (__sb__runningInSpringBoard())
      {
        v11 = SBFEffectiveDeviceClass();
        v12 = 64.0;
        if (v11 == 2)
          v12 = 106.0;
        -[SBCursiveTextView loadText:pointSize:](cursiveTextView, "loadText:pointSize:", v9, v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");
        v17 = 64.0;
        if (v16 == 1)
          v17 = 106.0;
        -[SBCursiveTextView loadText:pointSize:](cursiveTextView, "loadText:pointSize:", v9, v17);

      }
      -[SBCursiveTextView setAccessibilityLabel:](self->_cursiveTextView, "setAccessibilityLabel:", v6);
      -[SBCursiveTextView setAccessibilityLanguage:](self->_cursiveTextView, "setAccessibilityLanguage:", v7);
      self->_startTime = CFAbsoluteTimeGetCurrent();
      -[SBCursiveTextView duration](self->_cursiveTextView, "duration");
      v19 = v18 + 1.0;
      if (v19 >= 4.0)
        v13 = v19;
      else
        v13 = 4.0;
      self->_customDelayDuration = v13;
      -[SBDashBoardSetupView _createDisplayLink](self, "_createDisplayLink");
      -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(v9, "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAttribute:value:range:", CFSTR("NSLanguage"), v7, 0, objc_msgSend(v14, "length"));

      }
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v9);
      -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");
      v13 = 0.0;
    }

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (void)setStoreRestrictedStrings:(id)a3 bodyString:(id)a4 linkString:(id)a5 forLanguage:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v19, "length"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v19);
      objc_msgSend(v13, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttribute:value:range:", CFSTR("NSLanguage"), v12, 0, objc_msgSend(v14, "length"));

      -[UILabel setAttributedText:](self->_storeRestrictedTitleLabel, "setAttributedText:", v13);
      -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");

    }
    if (objc_msgSend(v10, "length"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v10);
      objc_msgSend(v15, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAttribute:value:range:", CFSTR("NSLanguage"), v12, 0, objc_msgSend(v16, "length"));

      -[UILabel setAttributedText:](self->_storeRestrictedBodyLabel, "setAttributedText:", v15);
      -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");

    }
    if (objc_msgSend(v11, "length"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
      objc_msgSend(v17, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAttribute:value:range:", CFSTR("NSLanguage"), v12, 0, objc_msgSend(v18, "length"));

      -[UILabel setAttributedText:](self->_storeRestrictedLinkLabel, "setAttributedText:", v17);
      -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");

    }
  }

}

- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v14, "length") && objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v10, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAttribute:value:range:", CFSTR("NSLanguage"), v9, 0, objc_msgSend(v12, "length"));

      objc_msgSend(v11, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAttribute:value:range:", CFSTR("NSLanguage"), v9, 0, objc_msgSend(v13, "length"));

    }
    -[UILabel setAttributedText:](self->_activationLockWarningLabel, "setAttributedText:", v10);
    -[UILabel setAttributedText:](self->_activationLockDetailLabel, "setAttributedText:", v11);
    -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setCallToActionString:(id)a3 forLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "length"))
  {
    if (self->_homeAffordanceCallToActionLabel)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v7, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addAttribute:value:range:", CFSTR("NSLanguage"), v6, 0, objc_msgSend(v8, "length"));

      }
      -[SBUILegibilityLabel setAttributedText:](self->_homeAffordanceCallToActionLabel, "setAttributedText:", v7);

    }
    else
    {
      -[SBUICallToActionLabel setText:forLanguage:animated:](self->_homeButtonCallToActionLabel, "setText:forLanguage:animated:", v9, v6, 0);
    }
    -[SBDashBoardSetupView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setInfoButtonVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[UIButton layer](self->_infoButton, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v19 = v8;
    objc_msgSend(v8, "presentationLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "opacity");
    v11 = v10;

    HIDWORD(v12) = 0;
    v13 = v7 ? 1.0 : 0.0;
    *(float *)&v12 = v13;
    objc_msgSend(v19, "setOpacity:", v12);
    v8 = v19;
    if (v6)
    {
      v14 = v11;
      if (v13 != v14)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBeginTime:", CACurrentMediaTime() + a5);
        objc_msgSend(v15, "setDuration:", 1.0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFromValue:", v16);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setToValue:", v17);

        objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B50]);
        if (v7)
          v18 = CFSTR("SBDashBoardSetupNormalAnimation");
        else
          v18 = CFSTR("SBDashBoardSetupResetAnimation");
        objc_msgSend(v19, "addAnimation:forKey:", v15, -[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("opacity")));

        v8 = v19;
      }
    }
  }

}

- (void)setChildIconVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[UIView layer](self->_childIconView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v19 = v8;
    objc_msgSend(v8, "presentationLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "opacity");
    v11 = v10;

    HIDWORD(v12) = 0;
    v13 = v7 ? 1.0 : 0.0;
    *(float *)&v12 = v13;
    objc_msgSend(v19, "setOpacity:", v12);
    v8 = v19;
    if (v6)
    {
      v14 = v11;
      if (v13 != v14)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBeginTime:", CACurrentMediaTime() + a5);
        objc_msgSend(v15, "setDuration:", 1.0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFromValue:", v16);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setToValue:", v17);

        objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B50]);
        if (v7)
          v18 = CFSTR("SBDashBoardSetupNormalAnimation");
        else
          v18 = CFSTR("SBDashBoardSetupResetAnimation");
        objc_msgSend(v19, "addAnimation:forKey:", v15, -[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("opacity")));

        v8 = v19;
      }
    }
  }

}

- (void)setActivationLocked:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  if (self->_activationLocked != a3)
  {
    self->_activationLocked = a3;
    if (a3 && !-[SBDashBoardSetupView _actsLikeStoreRestricted](self, "_actsLikeStoreRestricted"))
    {
      v5 = 0;
      v4 = 1;
    }
    else
    {
      v4 = 0;
      v5 = 1;
    }
    -[UILabel setHidden:](self->_titleLabel, "setHidden:", v4);
    -[UIView setHidden:](self->_childIconView, "setHidden:", v4);
    -[UIStackView setHidden:](self->_activationLockStackView, "setHidden:", v5);
  }
}

- (void)setChildIconView:(id)a3
{
  UIView **p_childIconView;
  id v6;

  p_childIconView = &self->_childIconView;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[UIView removeFromSuperview](*p_childIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_childIconView, a3);
    -[SBDashBoardSetupView addSubview:](self, "addSubview:", v6);
    -[SBDashBoardSetupView _updateBaselineAndChildIconConstraints](self, "_updateBaselineAndChildIconConstraints");
    if (self->_activationLocked || -[SBDashBoardSetupView _isShowingModalTakeoverUI](self, "_isShowingModalTakeoverUI"))
      -[UIView setHidden:](*p_childIconView, "setHidden:", 1);
  }

}

- (void)animateComponents:(unint64_t)a3 toActive:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(void);
  NSObject *v9;
  UILabel *titleLabel;
  int v11;
  void (**block)(void);

  v5 = a4;
  v8 = (void (**)(void))a5;
  if (a3)
  {
    block = v8;
    v9 = dispatch_group_create();
    if ((a3 & 1) != 0)
    {
      titleLabel = self->_titleLabel;
      if (titleLabel)
        -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", titleLabel, v5, v9);
      if (self->_cursiveTextView)
      {
        if (v5)
        {
          -[SBDashBoardSetupView _animateCursiveForTimePassed](self, "_animateCursiveForTimePassed");
          if (self->_activationLocked)
            v11 = BYSetupAssistantHasCompletedInitialRun() ^ 1;
          else
            v11 = 0;
          -[SBCursiveTextView setHidden:](self->_cursiveTextView, "setHidden:", -[SBDashBoardSetupView _isShowingModalTakeoverUI](self, "_isShowingModalTakeoverUI") | v11);
          -[UIView setHidden:](self->_childIconView, "setHidden:", -[SBDashBoardSetupView _isShowingModalTakeoverUI](self, "_isShowingModalTakeoverUI") | v11);
          -[SBDashBoardSetupView _createDisplayLink](self, "_createDisplayLink");
          -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", self->_cursiveTextView, 1, v9);
          if ((a3 & 8) != 0)
          {
LABEL_25:
            -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", self->_storeRestrictedContainer, v5, v9);
            if ((a3 & 0x10) != 0)
            {
LABEL_26:
              -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", self->_securityResearchDeviceContainer, v5, v9);
              if ((a3 & 2) != 0)
              {
LABEL_27:
                -[SBDashBoardSetupView _animateHomeButtonCallToActionToActive:withDispatchGroup:](self, "_animateHomeButtonCallToActionToActive:withDispatchGroup:", v5, v9);
                -[SBDashBoardSetupView _animateHomeAffordanceCallToActionToActive:withDispatchGroup:](self, "_animateHomeAffordanceCallToActionToActive:withDispatchGroup:", v5, v9);
                if ((a3 & 4) != 0)
                {
LABEL_28:
                  -[SBDashBoardSetupView _animateHomeAffordanceToActive:withDispatchGroup:](self, "_animateHomeAffordanceToActive:withDispatchGroup:", v5, v9);
                  if ((a3 & 0x20) == 0)
                    goto LABEL_18;
                  goto LABEL_17;
                }
LABEL_16:
                if ((a3 & 0x20) == 0)
                {
LABEL_18:
                  if (block)
                    dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

                  goto LABEL_21;
                }
LABEL_17:
                -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", self->_activationLockStackView, v5, v9);
                goto LABEL_18;
              }
LABEL_15:
              if ((a3 & 4) != 0)
                goto LABEL_28;
              goto LABEL_16;
            }
LABEL_14:
            if ((a3 & 2) != 0)
              goto LABEL_27;
            goto LABEL_15;
          }
LABEL_13:
          if ((a3 & 0x10) != 0)
            goto LABEL_26;
          goto LABEL_14;
        }
        -[SBDashBoardSetupView _removeDisplayLink](self, "_removeDisplayLink");
        -[SBDashBoardSetupView _animateView:toActive:withDispatchGroup:](self, "_animateView:toActive:withDispatchGroup:", self->_cursiveTextView, 0, v9);
        -[SBCursiveTextView setHidden:](self->_cursiveTextView, "setHidden:", 1);
        -[UIView setHidden:](self->_childIconView, "setHidden:", 1);
      }
    }
    if ((a3 & 8) != 0)
      goto LABEL_25;
    goto LABEL_13;
  }
  if (v8)
  {
    block = v8;
    v8[2]();
LABEL_21:
    v8 = block;
  }

}

- (void)layoutSubviews
{
  double v3;
  SBUILegibilityLabel *homeAffordanceCallToActionLabel;
  double v5;
  double v6;
  SBUICallToActionLabel *homeButtonCallToActionLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardSetupView;
  -[SBDashBoardSetupView layoutSubviews](&v13, sel_layoutSubviews);
  -[SBDashBoardSetupView _layoutRegulatoryInfo](self, "_layoutRegulatoryInfo");
  -[SBDashBoardSetupView _layoutActivationInfoView](self, "_layoutActivationInfoView");
  -[SBDashBoardSetupView _layoutHomeButtonCallToAction](self, "_layoutHomeButtonCallToAction");
  -[SBDashBoardSetupView _layoutHomeAffordanceCallToAction](self, "_layoutHomeAffordanceCallToAction");
  -[SBDashBoardSetupView _layoutHomeAffordance](self, "_layoutHomeAffordance");
  -[SBDashBoardSetupView bounds](self, "bounds");
  homeAffordanceCallToActionLabel = self->_homeAffordanceCallToActionLabel;
  if (homeAffordanceCallToActionLabel)
  {
    -[SBUILegibilityLabel frame](homeAffordanceCallToActionLabel, "frame");
    v6 = v5 + -33.0;
  }
  else
  {
    homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
    if (homeButtonCallToActionLabel)
    {
      -[SBUICallToActionLabel frame](homeButtonCallToActionLabel, "frame");
      v6 = v8;
    }
    else
    {
      v6 = v3;
    }
  }
  -[UIView frame](self->_activationInfoView, "frame");
  v10 = v9;
  -[UIView frame](self->_activationInfoView, "frame");
  v12 = v10 + v11 > v6;
  -[SBUILegibilityLabel setHidden:](self->_homeAffordanceCallToActionLabel, "setHidden:", v12, v10 + v11);
  -[SBUICallToActionLabel setHidden:](self->_homeButtonCallToActionLabel, "setHidden:", v12);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  NSObject *v4;
  NSObject *v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("SBDashBoardSetupDispatchGroup"), a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    dispatch_group_leave(v4);
    v4 = v5;
  }

}

- (void)_addInfoButton
{
  UIButton *v3;
  UIButton *infoButton;
  UIButton *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 3);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  infoButton = self->_infoButton;
  self->_infoButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_infoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (_os_feature_enabled_impl())
  {
    v5 = self->_infoButton;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v5, "setTintColor:", v6);

  }
  -[UIButton _setTouchInsets:](self->_infoButton, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);
  -[UIButton setAlpha:](self->_infoButton, "setAlpha:", 0.0);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_infoButton);
}

- (void)_addTitleLabel
{
  SBCursiveTextView *v3;
  id *p_cursiveTextView;
  SBCursiveTextView *cursiveTextView;
  SBCursiveTextView *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;

  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(SBCursiveTextView);
    p_cursiveTextView = (id *)&self->_cursiveTextView;
    cursiveTextView = self->_cursiveTextView;
    self->_cursiveTextView = v3;

    v6 = self->_cursiveTextView;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCursiveTextView setFillColor:](v6, "setFillColor:", v7);

  }
  else
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    p_cursiveTextView = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    v10 = self->_titleLabel;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    v12 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  }
  objc_msgSend(*p_cursiveTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", *p_cursiveTextView);
}

- (void)_addStoreRestrictedLabels
{
  UIView *v3;
  UIView *storeRestrictedContainer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *storeRestrictedTitleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  UILabel *storeRestrictedBodyLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  uint64_t v22;
  void *v23;
  UILabel *v24;
  UILabel *storeRestrictedLinkLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
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
  _QWORD v71[14];

  v71[12] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  storeRestrictedContainer = self->_storeRestrictedContainer;
  self->_storeRestrictedContainer = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_storeRestrictedContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, 46.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v6);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v70);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = v7;
  -[UIView addSubview:](self->_storeRestrictedContainer, "addSubview:", v7);
  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  storeRestrictedTitleLabel = self->_storeRestrictedTitleLabel;
  self->_storeRestrictedTitleLabel = v11;

  v13 = self->_storeRestrictedTitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v13, "setColor:", v14);

  v15 = self->_storeRestrictedTitleLabel;
  objc_msgSend(v10, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB580], 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v15, "setFont:", v16);

  -[UILabel setNumberOfLines:](self->_storeRestrictedTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_storeRestrictedTitleLabel, "setTextAlignment:", 1);
  -[UILabel setMinimumScaleFactor:](self->_storeRestrictedTitleLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_storeRestrictedTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_storeRestrictedContainer, "addSubview:", self->_storeRestrictedTitleLabel);
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  storeRestrictedBodyLabel = self->_storeRestrictedBodyLabel;
  self->_storeRestrictedBodyLabel = v17;

  v19 = self->_storeRestrictedBodyLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v19, "setColor:", v20);

  v21 = self->_storeRestrictedBodyLabel;
  v22 = *MEMORY[0x1E0CEB538];
  v69 = v10;
  objc_msgSend(v10, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v23);

  -[UILabel setNumberOfLines:](self->_storeRestrictedBodyLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_storeRestrictedBodyLabel, "setTextAlignment:", 1);
  -[UILabel setMinimumScaleFactor:](self->_storeRestrictedBodyLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_storeRestrictedBodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_storeRestrictedContainer, "addSubview:", self->_storeRestrictedBodyLabel);
  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  storeRestrictedLinkLabel = self->_storeRestrictedLinkLabel;
  self->_storeRestrictedLinkLabel = v24;

  v26 = self->_storeRestrictedLinkLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v26, "setColor:", v27);

  v28 = self->_storeRestrictedLinkLabel;
  objc_msgSend(v10, "preferredFontForTextStyle:hiFontStyle:", v22, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v28, "setFont:", v29);

  -[UILabel setNumberOfLines:](self->_storeRestrictedLinkLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_storeRestrictedLinkLabel, "setTextAlignment:", 1);
  -[UILabel setMinimumScaleFactor:](self->_storeRestrictedLinkLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_storeRestrictedLinkLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_storeRestrictedContainer, "addSubview:", self->_storeRestrictedLinkLabel);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_storeRestrictedContainer);
  v53 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v9, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_storeRestrictedContainer, "centerXAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v66;
  -[UIView topAnchor](self->_storeRestrictedContainer, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  objc_msgSend(v9, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v62;
  -[UILabel centerXAnchor](self->_storeRestrictedTitleLabel, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_storeRestrictedContainer, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v59;
  -[UILabel topAnchor](self->_storeRestrictedTitleLabel, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 20.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v56;
  -[UILabel centerXAnchor](self->_storeRestrictedBodyLabel, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_storeRestrictedContainer, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v52;
  -[UILabel topAnchor](self->_storeRestrictedBodyLabel, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_storeRestrictedTitleLabel, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 15.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v49;
  -[UILabel centerXAnchor](self->_storeRestrictedLinkLabel, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_storeRestrictedContainer, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v46;
  -[UILabel topAnchor](self->_storeRestrictedLinkLabel, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_storeRestrictedBodyLabel, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 15.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v43;
  -[UIView bottomAnchor](self->_storeRestrictedContainer, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_storeRestrictedLinkLabel, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v40;
  -[UIView widthAnchor](self->_storeRestrictedContainer, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_storeRestrictedTitleLabel, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v38);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v30;
  -[UIView widthAnchor](self->_storeRestrictedContainer, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_storeRestrictedBodyLabel, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v33;
  -[UIView widthAnchor](self->_storeRestrictedContainer, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_storeRestrictedLinkLabel, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "activateConstraints:", v37);

}

- (void)_addActivationLockLabels
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *activationLockImage;
  UIImageView *v7;
  void *v8;
  UILabel *v9;
  UILabel *activationLockWarningLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  UILabel *activationLockDetailLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  id v21;
  UILabel *v22;
  void *v23;
  UIStackView *v24;
  UIStackView *activationLockStackView;
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
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  if (!self->_activationLockStackView)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 60.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
    activationLockImage = self->_activationLockImage;
    self->_activationLockImage = v5;

    v7 = self->_activationLockImage;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7, "setTintColor:", v8);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_activationLockImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    activationLockWarningLabel = self->_activationLockWarningLabel;
    self->_activationLockWarningLabel = v9;

    v11 = self->_activationLockWarningLabel;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    v13 = self->_activationLockWarningLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 32.0, *MEMORY[0x1E0CEB5D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setNumberOfLines:](self->_activationLockWarningLabel, "setNumberOfLines:", 0);
    -[UILabel setMinimumScaleFactor:](self->_activationLockWarningLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setTextAlignment:](self->_activationLockWarningLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_activationLockWarningLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    activationLockDetailLabel = self->_activationLockDetailLabel;
    self->_activationLockDetailLabel = v15;

    v17 = self->_activationLockDetailLabel;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    v19 = self->_activationLockDetailLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](self->_activationLockDetailLabel, "setNumberOfLines:", 0);
    -[UILabel setMinimumScaleFactor:](self->_activationLockDetailLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setTextAlignment:](self->_activationLockDetailLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_activationLockDetailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v22 = self->_activationLockWarningLabel;
    v38[0] = self->_activationLockImage;
    v38[1] = v22;
    v38[2] = self->_activationLockDetailLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (UIStackView *)objc_msgSend(v21, "initWithArrangedSubviews:", v23);
    activationLockStackView = self->_activationLockStackView;
    self->_activationLockStackView = v24;

    -[UIStackView setAxis:](self->_activationLockStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_activationLockStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_activationLockStackView, "setDistribution:", 3);
    -[UIStackView setBaselineRelativeArrangement:](self->_activationLockStackView, "setBaselineRelativeArrangement:", 1);
    -[UIStackView setCustomSpacing:afterView:](self->_activationLockStackView, "setCustomSpacing:afterView:", self->_activationLockImage, 46.0);
    -[UIStackView setCustomSpacing:afterView:](self->_activationLockStackView, "setCustomSpacing:afterView:", self->_activationLockWarningLabel, 42.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_activationLockStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setHidden:](self->_activationLockStackView, "setHidden:", 1);
    -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_activationLockStackView);
    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView widthAnchor](self->_activationLockStackView, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToConstant:", 327.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    -[UIStackView centerXAnchor](self->_activationLockStackView, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v31;
    -[UIStackView centerYAnchor](self->_activationLockStackView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerYAnchor](self, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v35);

  }
}

- (void)_addSecurityResearchLabels
{
  UIView *v3;
  UIView *securityResearchDeviceContainer;
  void *v5;
  UILabel *v6;
  UILabel *securityResearchDeviceTitleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *securityResearchHeaderIcon;
  UIImageView *v17;
  void *v18;
  UILabel *v19;
  UILabel *securityResearchSubtitleLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
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
  _QWORD v56[11];

  v56[9] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  securityResearchDeviceContainer = self->_securityResearchDeviceContainer;
  self->_securityResearchDeviceContainer = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_securityResearchDeviceContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  securityResearchDeviceTitleLabel = self->_securityResearchDeviceTitleLabel;
  self->_securityResearchDeviceTitleLabel = v6;

  v8 = self->_securityResearchDeviceTitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v8, "setColor:", v9);

  v10 = self->_securityResearchDeviceTitleLabel;
  v54 = v5;
  objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB5B0], 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_securityResearchDeviceTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setMinimumScaleFactor:](self->_securityResearchDeviceTitleLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setTextAlignment:](self->_securityResearchDeviceTitleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_securityResearchDeviceTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setText:](self->_securityResearchDeviceTitleLabel, "setText:", CFSTR("Security Research Device"));
  -[UIView addSubview:](self->_securityResearchDeviceContainer, "addSubview:", self->_securityResearchDeviceTitleLabel);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 3, 46.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v55);
  securityResearchHeaderIcon = self->_securityResearchHeaderIcon;
  self->_securityResearchHeaderIcon = v15;

  v17 = self->_securityResearchHeaderIcon;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v17, "setTintColor:", v18);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_securityResearchHeaderIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_securityResearchDeviceContainer, "addSubview:", self->_securityResearchHeaderIcon);
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  securityResearchSubtitleLabel = self->_securityResearchSubtitleLabel;
  self->_securityResearchSubtitleLabel = v19;

  v21 = self->_securityResearchSubtitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v21, "setColor:", v22);

  v23 = self->_securityResearchSubtitleLabel;
  objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v23, "setFont:", v24);

  -[UILabel setNumberOfLines:](self->_securityResearchSubtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setMinimumScaleFactor:](self->_securityResearchSubtitleLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setTextAlignment:](self->_securityResearchSubtitleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_securityResearchSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setText:](self->_securityResearchSubtitleLabel, "setText:", CFSTR("Property of Apple Inc."));
  -[UIView addSubview:](self->_securityResearchDeviceContainer, "addSubview:", self->_securityResearchSubtitleLabel);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_securityResearchDeviceContainer);
  v43 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView centerXAnchor](self->_securityResearchHeaderIcon, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_securityResearchDeviceContainer, "centerXAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v51;
  -[UIView topAnchor](self->_securityResearchDeviceContainer, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView topAnchor](self->_securityResearchHeaderIcon, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v48;
  -[UILabel centerXAnchor](self->_securityResearchDeviceTitleLabel, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_securityResearchDeviceContainer, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v45;
  -[UILabel topAnchor](self->_securityResearchDeviceTitleLabel, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_securityResearchHeaderIcon, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v42, 20.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v41;
  -[UILabel centerXAnchor](self->_securityResearchSubtitleLabel, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_securityResearchDeviceContainer, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v38;
  -[UILabel topAnchor](self->_securityResearchSubtitleLabel, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_securityResearchDeviceTitleLabel, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 15.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v35;
  -[UIView bottomAnchor](self->_securityResearchDeviceContainer, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_securityResearchSubtitleLabel, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v26;
  -[UIView widthAnchor](self->_securityResearchDeviceContainer, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_securityResearchDeviceTitleLabel, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v29;
  -[UIView widthAnchor](self->_securityResearchDeviceContainer, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_securityResearchSubtitleLabel, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "activateConstraints:", v33);

}

- (void)_addHomeButtonCallToAction
{
  SBUICallToActionLabel *v3;
  SBUICallToActionLabel *homeButtonCallToActionLabel;
  SBUICallToActionLabel *v5;
  void *v6;

  v3 = (SBUICallToActionLabel *)objc_alloc_init(MEMORY[0x1E0DAC5B0]);
  homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
  self->_homeButtonCallToActionLabel = v3;

  if (_os_feature_enabled_impl())
  {
    v5 = self->_homeButtonCallToActionLabel;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUICallToActionLabel setTintColor:](v5, "setTintColor:", v6);

  }
  -[SBUICallToActionLabel bs_setHitTestingDisabled:](self->_homeButtonCallToActionLabel, "bs_setHitTestingDisabled:", 1);
  -[SBUICallToActionLabel setVisible:animated:](self->_homeButtonCallToActionLabel, "setVisible:animated:", 0, 0);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_homeButtonCallToActionLabel);
}

- (void)_addHomeAffordanceForCoverSheetContext:(id)a3
{
  objc_class *v4;
  id v5;
  SBFTouchPassThroughView *v6;
  SBFTouchPassThroughView *homeAffordanceContainer;
  CSHomeAffordanceView *v8;
  CSHomeAffordanceView *homeAffordanceView;

  v4 = (objc_class *)MEMORY[0x1E0DA9F28];
  v5 = a3;
  v6 = (SBFTouchPassThroughView *)objc_alloc_init(v4);
  homeAffordanceContainer = self->_homeAffordanceContainer;
  self->_homeAffordanceContainer = v6;

  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_homeAffordanceContainer);
  v8 = (CSHomeAffordanceView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BBC8]), "initWithCoverSheetContext:", v5);

  homeAffordanceView = self->_homeAffordanceView;
  self->_homeAffordanceView = v8;

  -[CSHomeAffordanceView setStyle:](self->_homeAffordanceView, "setStyle:", 1);
  -[SBFTouchPassThroughView addSubview:](self->_homeAffordanceContainer, "addSubview:", self->_homeAffordanceView);
}

- (void)_addHomeAffordanceCallToAction
{
  UIView *v3;
  UIView *homeAffordanceCallToActionContainer;
  void *v5;
  SBUILegibilityLabel *v6;
  SBUILegibilityLabel *homeAffordanceCallToActionLabel;
  SBUILegibilityLabel *v8;
  void *v9;
  id v10;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  homeAffordanceCallToActionContainer = self->_homeAffordanceCallToActionContainer;
  self->_homeAffordanceCallToActionContainer = v3;

  -[UIView bs_setHitTestingDisabled:](self->_homeAffordanceCallToActionContainer, "bs_setHitTestingDisabled:", 1);
  -[UIView setAlpha:](self->_homeAffordanceCallToActionContainer, "setAlpha:", 0.0);
  -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_homeAffordanceCallToActionContainer);
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB588]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 32770);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (SBUILegibilityLabel *)objc_alloc_init(MEMORY[0x1E0DAC5D8]);
  homeAffordanceCallToActionLabel = self->_homeAffordanceCallToActionLabel;
  self->_homeAffordanceCallToActionLabel = v6;

  v8 = self->_homeAffordanceCallToActionLabel;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v10, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](v8, "setFont:", v9);

  -[SBUILegibilityLabel setNumberOfLines:](self->_homeAffordanceCallToActionLabel, "setNumberOfLines:", 0);
  -[SBUILegibilityLabel setTextAlignment:](self->_homeAffordanceCallToActionLabel, "setTextAlignment:", 1);
  -[SBUILegibilityLabel bs_setHitTestingDisabled:](self->_homeAffordanceCallToActionLabel, "bs_setHitTestingDisabled:", 1);
  -[UIView addSubview:](self->_homeAffordanceCallToActionContainer, "addSubview:", self->_homeAffordanceCallToActionLabel);

}

- (id)_titleView
{
  void *titleLabel;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
    titleLabel = self->_cursiveTextView;
  return titleLabel;
}

- (void)_updateBaselineAndChildIconConstraints
{
  void *childIconView;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *titleYOffsetConstraint;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  void *v25;
  _BOOL4 v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  if (self->_titleYOffsetConstraint)
    -[SBDashBoardSetupView removeConstraint:](self, "removeConstraint:");
  childIconView = self->_childIconView;
  -[SBDashBoardSetupView _titleView](self, "_titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastBaselineAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardSetupView centerYAnchor](self, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (childIconView)
  {
    if (v7)
    {
      v9 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      childIconView = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(childIconView, "userInterfaceIdiom") == 1;
    }
    v11 = 32.0;
    if (!v9)
      v11 = 14.0;
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v11);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleYOffsetConstraint = self->_titleYOffsetConstraint;
    self->_titleYOffsetConstraint = v12;

    if ((v8 & 1) == 0)
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", self->_titleYOffsetConstraint);
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](self->_childIconView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView leadingAnchor](self, "leadingAnchor");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, 30.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v37;
    -[UIView trailingAnchor](self->_childIconView, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView trailingAnchor](self, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v16;
    objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", -30.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v17;
    -[UIView centerXAnchor](self->_childIconView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v20;
    -[UIView centerYAnchor](self->_childIconView, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerYAnchor](self, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = __sb__runningInSpringBoard();
    v24 = v23;
    v38 = v14;
    v25 = (void *)v15;
    if (v23)
    {
      v26 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v33, "userInterfaceIdiom") == 1;
    }
    v27 = -90.0;
    if (v26)
      v27 = -110.0;
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v29);

    if ((v24 & 1) == 0)
  }
  else
  {
    if (v7)
    {
      v10 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      childIconView = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(childIconView, "userInterfaceIdiom") == 1;
    }
    v30 = -16.0;
    if (v10)
      v30 = 0.0;
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v30);
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v32 = self->_titleYOffsetConstraint;
    self->_titleYOffsetConstraint = v31;

    if ((v8 & 1) == 0)
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", self->_titleYOffsetConstraint);
  }
}

- (void)_setupConstraints
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
  UIView *storeRestrictedContainer;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *securityResearchDeviceContainer;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
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
  _QWORD v54[4];
  _QWORD v55[5];

  v55[4] = *MEMORY[0x1E0C80C00];
  -[SBDashBoardSetupView _titleView](self, "_titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView leadingAnchor](self, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 30.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", v7);

    objc_msgSend(v4, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView trailingAnchor](self, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v9, -30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", v10);

    objc_msgSend(v4, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", v13);

    -[SBDashBoardSetupView _updateBaselineAndChildIconConstraints](self, "_updateBaselineAndChildIconConstraints");
  }
  storeRestrictedContainer = self->_storeRestrictedContainer;
  if (storeRestrictedContainer && self->_storeRestrictedTitleLabel)
  {
    v42 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](storeRestrictedContainer, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView leadingAnchor](self, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50, 30.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v48;
    -[UIView trailingAnchor](self->_storeRestrictedContainer, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView trailingAnchor](self, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, -30.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v15;
    -[UILabel centerXAnchor](self->_storeRestrictedTitleLabel, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v18;
    -[UILabel centerYAnchor](self->_storeRestrictedTitleLabel, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView centerYAnchor](self, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v22);

  }
  if (self->_securityResearchDeviceTitleLabel)
  {
    securityResearchDeviceContainer = self->_securityResearchDeviceContainer;
    if (securityResearchDeviceContainer)
    {
      v43 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leadingAnchor](securityResearchDeviceContainer, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView leadingAnchor](self, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v51, 30.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v49;
      -[UIView trailingAnchor](self->_securityResearchDeviceContainer, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView trailingAnchor](self, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45, -30.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v24;
      -[UILabel centerXAnchor](self->_securityResearchDeviceTitleLabel, "centerXAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v27;
      -[UILabel centerYAnchor](self->_securityResearchDeviceTitleLabel, "centerYAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView centerYAnchor](self, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54[3] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "activateConstraints:", v31);

    }
  }
  if (self->_infoButton)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass())
      {
        v32 = 15.0;
        if (SBFEffectiveDeviceClass() != 1)
          goto LABEL_19;
      }
      v32 = 15.0;
      if (SBFEffectiveHomeButtonType() != 2)
        goto LABEL_19;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "userInterfaceIdiom"))
    {

      v32 = 15.0;
    }
    else
    {
      v34 = SBFEffectiveHomeButtonType();

      v32 = 15.0;
      if (v34 == 2)
LABEL_18:
        v32 = 30.0;
    }
LABEL_19:
    -[UIButton trailingAnchor](self->_infoButton, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView trailingAnchor](self, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -v32;
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", v38);

    -[UIButton bottomAnchor](self->_infoButton, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView bottomAnchor](self, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupView addConstraint:](self, "addConstraint:", v41);

  }
}

- (void)_setupActivationInfoConstraintsIfNeeded
{
  UIView *activationInfoView;
  NSArray *activationInfoViewConstraints;
  double v5;
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
  NSArray *v16;
  NSArray *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  activationInfoView = self->_activationInfoView;
  activationInfoViewConstraints = self->_activationInfoViewConstraints;
  if (activationInfoView)
  {
    if (!activationInfoViewConstraints)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](activationInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v5 = 120.0;
        }
        else if (SBFEffectiveHomeButtonType() == 2)
        {
          v5 = 200.0;
        }
        else
        {
          v5 = 120.0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "userInterfaceIdiom"))
        {
          v5 = 120.0;
        }
        else if (SBFEffectiveHomeButtonType() == 2)
        {
          v5 = 200.0;
        }
        else
        {
          v5 = 120.0;
        }

      }
      -[UIView centerXAnchor](self->_activationInfoView, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView centerXAnchor](self, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView topAnchor](self->_activationInfoView, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardSetupView topAnchor](self, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButton topAnchor](self->_infoButton, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_activationInfoView, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = v9;
      v18[1] = v12;
      v18[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v17 = self->_activationInfoViewConstraints;
      self->_activationInfoViewConstraints = v16;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_activationInfoViewConstraints);
    }
  }
  else if (activationInfoViewConstraints)
  {
    self->_activationInfoViewConstraints = 0;

  }
}

- (void)_layoutRegulatoryInfo
{
  UIView *regulatoryInfoView;
  void *v4;

  regulatoryInfoView = self->_regulatoryInfoView;
  if (regulatoryInfoView)
  {
    -[UIView superview](regulatoryInfoView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_regulatoryInfoView);
  }
}

- (void)_layoutActivationInfoView
{
  UIView *activationInfoView;
  void *v4;

  activationInfoView = self->_activationInfoView;
  if (activationInfoView)
  {
    -[UIView superview](activationInfoView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[SBDashBoardSetupView addSubview:](self, "addSubview:", self->_activationInfoView);
    -[SBDashBoardSetupView _setupActivationInfoConstraintsIfNeeded](self, "_setupActivationInfoConstraintsIfNeeded");
  }
}

- (void)_layoutHomeButtonCallToAction
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  if (self->_homeButtonCallToActionLabel)
  {
    -[SBDashBoardSetupView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SBUICallToActionLabel frame](self->_homeButtonCallToActionLabel, "frame");
    objc_msgSend(MEMORY[0x1E0DA9DE0], "suggestedFrameForCallToActionLabel:yOffset:inBounds:", self->_homeButtonCallToActionLabel, CGRectGetHeight(v11) + 15.0, v4, v6, v8, v10);
    -[SBUICallToActionLabel setFrame:](self->_homeButtonCallToActionLabel, "setFrame:");
  }
}

- (void)_layoutHomeAffordanceCallToAction
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_homeAffordanceCallToActionLabel)
  {
    -[SBDashBoardSetupView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[UIView setFrame:](self->_homeAffordanceCallToActionContainer, "setFrame:");
    -[SBUILegibilityLabel sizeThatFits:](self->_homeAffordanceCallToActionLabel, "sizeThatFits:", 200.0, 1.79769313e308);
    v8 = v7;
    SBRectWithSize();
    -[SBUILegibilityLabel setBounds:](self->_homeAffordanceCallToActionLabel, "setBounds:");
    -[SBUILegibilityLabel setCenter:](self->_homeAffordanceCallToActionLabel, "setCenter:", v4 * 0.5, v6 - v8 * 0.5 + -11.0);
  }
}

- (void)_layoutHomeAffordance
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MidX;
  double Height;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;

  if (self->_homeAffordanceView)
  {
    -[SBDashBoardSetupView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SBFTouchPassThroughView setFrame:](self->_homeAffordanceContainer, "setFrame:");
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    MidX = CGRectGetMidX(v16);
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    Height = CGRectGetHeight(v17);
    -[CSHomeAffordanceView bounds](self->_homeAffordanceView, "bounds");
    v14 = Height + v13 * -0.5;
    -[CSHomeAffordanceView suggestedEdgeSpacing](self->_homeAffordanceView, "suggestedEdgeSpacing");
    -[CSHomeAffordanceView setCenter:](self->_homeAffordanceView, "setCenter:", MidX, v14 - v15);
  }
}

- (void)_animateView:(id)a3 toActive:(BOOL)a4 withDispatchGroup:(id)a5
{
  _BOOL4 v5;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _QWORD v17[5];

  v5 = a4;
  v17[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a3, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v5)
    {
      dispatch_group_enter(v8);
      -[SBDashBoardSetupView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v9);
      -[SBDashBoardSetupView _removeNormalAnimationForKeyPath:onLayer:](self, "_removeNormalAnimationForKeyPath:onLayer:", CFSTR("opacity"), v9);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyTimes:", &unk_1E91CF268);
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "opacity");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = &unk_1E91CFAA8;
      v17[2] = &unk_1E91CFAA8;
      v17[3] = &unk_1E91CFAB8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValues:", v13);

      objc_msgSend(v10, "setCalculationMode:", CFSTR("linear"));
      objc_msgSend(v10, "setDuration:", self->_customDelayDuration);
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("SBDashBoardSetupDispatchGroup"));
      objc_msgSend(v10, "keyPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAnimation:forKey:", v10, objc_msgSend(CFSTR("SBDashBoardSetupNormalAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), v14));

      LODWORD(v15) = 0;
      objc_msgSend(v9, "setOpacity:", v15);

    }
    else
    {
      -[SBDashBoardSetupView _addResetAnimationForKeyPath:onLayer:dispatchGroup:](self, "_addResetAnimationForKeyPath:onLayer:dispatchGroup:", CFSTR("opacity"), v9, v8);
      LODWORD(v16) = 1.0;
      objc_msgSend(v9, "setOpacity:", v16);
    }
  }

}

- (void)_animateHomeButtonCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  SBUICallToActionLabel *homeButtonCallToActionLabel;
  uint64_t v9;
  id *v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *homeButtonCallToActionTimer;
  dispatch_time_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  OS_dispatch_source *v19;
  SBUICallToActionLabel *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD handler[4];
  NSObject *v26;
  id v27;
  id location;
  _QWORD v29[4];
  NSObject *v30;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_homeButtonCallToActionLabel)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      dispatch_group_enter(v7);
      homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
      v9 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke;
      v29[3] = &unk_1E8E9DED8;
      v10 = (id *)&v30;
      v11 = v7;
      v30 = v11;
      -[SBUICallToActionLabel fadeInImmediately:completion:](homeButtonCallToActionLabel, "fadeInImmediately:completion:", 1, v29);
      objc_initWeak(&location, self);
      v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      homeButtonCallToActionTimer = self->_homeButtonCallToActionTimer;
      self->_homeButtonCallToActionTimer = v12;

      v14 = dispatch_time(0, (uint64_t)((self->_customDelayDuration + -1.0) * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_homeButtonCallToActionTimer, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
      v15 = self->_homeButtonCallToActionTimer;
      handler[0] = v9;
      handler[1] = 3221225472;
      handler[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_2;
      handler[3] = &unk_1E8E9F280;
      objc_copyWeak(&v27, &location);
      v16 = v11;
      v26 = v16;
      dispatch_source_set_event_handler(v15, handler);
      v17 = self->_homeButtonCallToActionTimer;
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_4;
      v23[3] = &unk_1E8E9DED8;
      v24 = v16;
      dispatch_source_set_cancel_handler(v17, v23);
      dispatch_resume((dispatch_object_t)self->_homeButtonCallToActionTimer);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = self->_homeButtonCallToActionTimer;
      if (v18)
      {
        dispatch_source_cancel(v18);
        v19 = self->_homeButtonCallToActionTimer;
        self->_homeButtonCallToActionTimer = 0;

      }
      dispatch_group_enter(v7);
      v20 = self->_homeButtonCallToActionLabel;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_5;
      v21[3] = &unk_1E8E9DED8;
      v10 = (id *)&v22;
      v22 = v7;
      -[SBUICallToActionLabel fadeOutWithDuration:completion:](v20, "fadeOutWithDuration:completion:", v21, 0.0);
    }

  }
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[70];
    WeakRetained[70] = 0;

    v5 = (void *)v3[69];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_3;
    v6[3] = &unk_1E8E9DED8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "fadeOutWithDuration:completion:", v6, 1.0);

  }
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_animateHomeAffordanceCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
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
  _QWORD v18[6];

  v4 = a3;
  v18[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[UIView layer](self->_homeAffordanceCallToActionContainer, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      dispatch_group_enter(v6);
      -[SBDashBoardSetupView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v7);
      -[SBDashBoardSetupView _removeNormalAnimationForKeyPath:onLayer:](self, "_removeNormalAnimationForKeyPath:onLayer:", CFSTR("opacity"), v7);
      -[SBDashBoardSetupView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v7);
      -[SBDashBoardSetupView _removeNormalAnimationForKeyPath:onLayer:](self, "_removeNormalAnimationForKeyPath:onLayer:", CFSTR("position.y"), v7);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setKeyTimes:", &unk_1E91CF280);
      objc_msgSend(v8, "setValues:", &unk_1E91CF298);
      objc_msgSend(v8, "setCalculationMode:", CFSTR("cubic"));
      objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime() + 1.0);
      objc_msgSend(v8, "setDuration:", self->_customDelayDuration);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("SBDashBoardSetupDispatchGroup"));
      objc_msgSend(v8, "keyPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimation:forKey:", v8, objc_msgSend(CFSTR("SBDashBoardSetupNormalAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), v9));

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyTimes:", &unk_1E91CF2B0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -16.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -30.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -33.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -33.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[4] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValues:", v15);

      objc_msgSend(v10, "setCalculationMode:", CFSTR("cubic"));
      objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime() + 1.0);
      objc_msgSend(v10, "setDuration:", self->_customDelayDuration);
      objc_msgSend(v10, "setAdditive:", 1);
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setValue:forKey:", v6, CFSTR("SBDashBoardSetupDispatchGroup"));
      objc_msgSend(v10, "keyPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimation:forKey:", v10, objc_msgSend(CFSTR("SBDashBoardSetupNormalAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), v16));

    }
    else
    {
      -[SBDashBoardSetupView _addResetAnimationForKeyPath:onLayer:dispatchGroup:](self, "_addResetAnimationForKeyPath:onLayer:dispatchGroup:", CFSTR("opacity"), v7, v6);
      -[SBDashBoardSetupView _addResetAnimationForKeyPath:onLayer:dispatchGroup:](self, "_addResetAnimationForKeyPath:onLayer:dispatchGroup:", CFSTR("position.y"), v7, v6);
    }
  }

}

- (void)_animateHomeAffordanceToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];

  v4 = a3;
  v16[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SBFTouchPassThroughView layer](self->_homeAffordanceContainer, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      -[SBDashBoardSetupView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v7);
      -[SBDashBoardSetupView _removeNormalAnimationForKeyPath:onLayer:](self, "_removeNormalAnimationForKeyPath:onLayer:", CFSTR("position.y"), v7);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setKeyTimes:", &unk_1E91CF2C8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -5.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -15.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -2.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[4] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValues:", v14);

      objc_msgSend(v8, "setCalculationMode:", CFSTR("cubic"));
      objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime() + 1.0);
      objc_msgSend(v8, "setDuration:", self->_customDelayDuration);
      objc_msgSend(v8, "setAdditive:", 1);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("SBDashBoardSetupDispatchGroup"));
      objc_msgSend(v8, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimation:forKey:", v8, objc_msgSend(CFSTR("SBDashBoardSetupNormalAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), v15));

    }
    else
    {
      -[SBDashBoardSetupView _addResetAnimationForKeyPath:onLayer:dispatchGroup:](self, "_addResetAnimationForKeyPath:onLayer:dispatchGroup:", CFSTR("position.y"), v7, v6);
    }
  }

}

- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4 dispatchGroup:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v8, "valueForKeyPath:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (v9)
    dispatch_group_enter(v9);
  -[SBDashBoardSetupView _removeNormalAnimationForKeyPath:onLayer:](self, "_removeNormalAnimationForKeyPath:onLayer:", v21, v8);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDuration:", 0.25);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v20);

  objc_msgSend(v17, "setValue:forKey:", v9, CFSTR("SBDashBoardSetupDispatchGroup"));
  objc_msgSend(v8, "addAnimation:forKey:", v17, objc_msgSend(CFSTR("SBDashBoardSetupResetAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), v21));

}

- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "removeAnimationForKey:", objc_msgSend(CFSTR("SBDashBoardSetupResetAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), a3));

}

- (void)_removeNormalAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "removeAnimationForKey:", objc_msgSend(CFSTR("SBDashBoardSetupNormalAnimation"), "stringByAppendingFormat:", CFSTR("-%@"), a3));

}

- (void)_createDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  id v7;
  CAFrameRateRange v8;

  if (self->_displayLink)
    -[SBDashBoardSetupView _removeDisplayLink](self, "_removeDisplayLink");
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
  v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v3;

  v5 = self->_displayLink;
  v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
  -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1114135);
  v6 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

}

- (void)_removeDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)_onDisplayLink:(id)a3
{
  if (self->_displayLink == a3)
    -[SBDashBoardSetupView _animateCursiveForTimePassed](self, "_animateCursiveForTimePassed");
}

- (void)_animateCursiveForTimePassed
{
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  *(float *)&Current = Current - self->_startTime;
  -[SBCursiveTextView setTime:](self->_cursiveTextView, "setTime:", Current);
  if (BSFloatGreaterThanFloat())
    -[SBDashBoardSetupView _removeDisplayLink](self, "_removeDisplayLink");
}

- (BOOL)_isShowingModalTakeoverUI
{
  return self->_activationInfoView || self->_regulatoryInfoView != 0;
}

- (void)_adjustTitleVisibilityForInfoViews
{
  _BOOL4 v3;
  UILabel *titleLabel;
  UIView *childIconView;
  _BOOL8 activationLocked;

  v3 = -[SBDashBoardSetupView _isShowingModalTakeoverUI](self, "_isShowingModalTakeoverUI");
  titleLabel = self->_titleLabel;
  if (v3)
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
    -[SBCursiveTextView setHidden:](self->_cursiveTextView, "setHidden:", 1);
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    -[UIView setHidden:](self->_storeRestrictedContainer, "setHidden:", 1);
    -[UIView setHidden:](self->_securityResearchDeviceContainer, "setHidden:", 1);
    -[UIStackView setHidden:](self->_activationLockStackView, "setHidden:", 1);
    childIconView = self->_childIconView;
    activationLocked = 1;
  }
  else
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", self->_activationLocked);
    -[SBCursiveTextView setHidden:](self->_cursiveTextView, "setHidden:", self->_activationLocked);
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", self->_activationLocked);
    -[UIView setHidden:](self->_storeRestrictedContainer, "setHidden:", 0);
    -[UIView setHidden:](self->_securityResearchDeviceContainer, "setHidden:", 0);
    -[UIStackView setHidden:](self->_activationLockStackView, "setHidden:", !self->_activationLocked);
    childIconView = self->_childIconView;
    activationLocked = self->_activationLocked;
  }
  -[UIView setHidden:](childIconView, "setHidden:", activationLocked);
}

- (void)_updateLegibilitySettings
{
  int v3;
  _UILegibilitySettings *legibilitySettings;
  SBCursiveTextView *cursiveTextView;
  void *v6;
  UIButton *infoButton;
  void *v8;
  SBUICallToActionLabel *homeButtonCallToActionLabel;
  void *v10;
  UILabel *titleLabel;
  UILabel *storeRestrictedTitleLabel;
  void *v13;
  UILabel *storeRestrictedBodyLabel;
  void *v15;
  UIImageView *activationLockImage;
  void *v17;
  UILabel *activationLockWarningLabel;
  void *v19;
  UILabel *activationLockDetailLabel;
  void *v21;
  UILabel *securityResearchDeviceTitleLabel;
  void *v23;
  UIImageView *securityResearchHeaderIcon;
  void *v25;
  UILabel *securityResearchSubtitleLabel;
  id v27;

  -[SBUILegibilityLabel setLegibilitySettings:](self->_homeAffordanceCallToActionLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUICallToActionLabel setLegibilitySettings:](self->_homeButtonCallToActionLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[CSHomeAffordanceView setLegibilitySettings:](self->_homeAffordanceView, "setLegibilitySettings:", self->_legibilitySettings);
  v3 = _os_feature_enabled_impl();
  legibilitySettings = self->_legibilitySettings;
  if (v3)
  {
    cursiveTextView = self->_cursiveTextView;
    -[_UILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCursiveTextView setFillColor:](cursiveTextView, "setFillColor:", v6);

    infoButton = self->_infoButton;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](infoButton, "setTintColor:", v8);

    homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUICallToActionLabel setTintColor:](homeButtonCallToActionLabel, "setTintColor:", v10);
  }
  else
  {
    titleLabel = self->_titleLabel;
    -[_UILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](titleLabel, "setTextColor:", v10);
  }

  storeRestrictedTitleLabel = self->_storeRestrictedTitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](storeRestrictedTitleLabel, "setColor:", v13);

  storeRestrictedBodyLabel = self->_storeRestrictedBodyLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](storeRestrictedBodyLabel, "setColor:", v15);

  activationLockImage = self->_activationLockImage;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](activationLockImage, "setTintColor:", v17);

  activationLockWarningLabel = self->_activationLockWarningLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](activationLockWarningLabel, "setTextColor:", v19);

  activationLockDetailLabel = self->_activationLockDetailLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](activationLockDetailLabel, "setTextColor:", v21);

  securityResearchDeviceTitleLabel = self->_securityResearchDeviceTitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](securityResearchDeviceTitleLabel, "setColor:", v23);

  securityResearchHeaderIcon = self->_securityResearchHeaderIcon;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](securityResearchHeaderIcon, "setTintColor:", v25);

  securityResearchSubtitleLabel = self->_securityResearchSubtitleLabel;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](securityResearchSubtitleLabel, "setColor:", v27);

}

- (BOOL)_actsLikeStoreRestricted
{
  return self->_isStoreRestricted && !self->_isSecurityResearchDevice;
}

- (CSHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceView, a3);
}

- (UIView)activationInfoView
{
  return self->_activationInfoView;
}

- (UIView)regulatoryInfoView
{
  return self->_regulatoryInfoView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (BOOL)isActivationLocked
{
  return self->_activationLocked;
}

- (UIView)childIconView
{
  return self->_childIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childIconView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoView, 0);
  objc_storeStrong((id *)&self->_activationInfoView, 0);
  objc_storeStrong((id *)&self->_titleYOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_cursiveTextView, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_activationInfoViewConstraints, 0);
  objc_storeStrong((id *)&self->_homeButtonCallToActionTimer, 0);
  objc_storeStrong((id *)&self->_homeButtonCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_homeAffordanceCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_homeAffordanceCallToActionContainer, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceContainer, 0);
  objc_storeStrong((id *)&self->_securityResearchSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_securityResearchHeaderIcon, 0);
  objc_storeStrong((id *)&self->_securityResearchDeviceContainer, 0);
  objc_storeStrong((id *)&self->_securityResearchDeviceTitleLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedContainer, 0);
  objc_storeStrong((id *)&self->_storeRestrictedLinkLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedBodyLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedTitleLabel, 0);
  objc_storeStrong((id *)&self->_activationLockDetailLabel, 0);
  objc_storeStrong((id *)&self->_activationLockWarningLabel, 0);
  objc_storeStrong((id *)&self->_activationLockImage, 0);
  objc_storeStrong((id *)&self->_activationLockStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
