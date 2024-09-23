@implementation UICoverSheetButton

- (UICoverSheetButton)initWithFrame:(CGRect)a3
{
  UICoverSheetButton *v3;
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
  UIView *v15;
  void *v16;
  UIView *containerView;
  UIVisualEffectView *v18;
  UIVisualEffectView *backgroundEffectView;
  void *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  void *v24;
  UIImageView *contentView;
  uint64_t v26;
  NSArray *backgroundEffects;
  uint64_t v28;
  NSArray *selectedBackgroundEffects;
  _UIClickInteraction *v30;
  _UIClickInteraction *clickInteraction;
  int v32;
  UICoverSheetButton *v33;
  int v35;
  objc_super v36;
  CGRect v37;

  v36.receiver = self;
  v36.super_class = (Class)UICoverSheetButton;
  v3 = -[UIControl initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v3, "setTintColor:", v4);

    +[UIColor darkTextColor](UIColor, "darkTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICoverSheetButton setSelectedTintColor:](v3, "setSelectedTintColor:", v5);

    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    *(_OWORD *)&v3->_edgeInsets.top = 0u;
    *(_OWORD *)&v3->_edgeInsets.bottom = 0u;
    v3->_shouldUseContinuousCorners = 0;
    -[UIView bounds](v3, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v7, v9, v11, v13);
    -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
    +[UIColor clearColor](UIColor, "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setOpaque:](v15, "setOpaque:", 0);
    -[UIView setClipsToBounds:](v15, "setClipsToBounds:", 0);
    -[UIView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v3, "addSubview:", v15);
    containerView = v3->_containerView;
    v3->_containerView = v15;

    v18 = -[UIVisualEffectView initWithFrame:]([UIVisualEffectView alloc], "initWithFrame:", v8, v10, v12, v14);
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    -[UIVisualEffectView _setCornerRadius:](v18, "_setCornerRadius:", CGRectGetWidth(v37) * 0.5);
    -[UIView setClipsToBounds:](v18, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v18, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v18);
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = v18;

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.03125, 0.03125, 0.03125, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_backgroundEffectView, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

    -[UIVisualEffectView contentView](v3->_backgroundEffectView, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 0.0);

    v23 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v8, v10, v12, v14);
    +[UIColor clearColor](UIColor, "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UIView setOpaque:](v23, "setOpaque:", 0);
    -[UIView setClipsToBounds:](v23, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v23, "setContentMode:", 3);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v23);
    contentView = v3->_contentView;
    v3->_contentView = v23;

    -[UICoverSheetButton _backgroundEffectsWithBrightness:](v3, "_backgroundEffectsWithBrightness:", -0.13);
    v26 = objc_claimAutoreleasedReturnValue();
    backgroundEffects = v3->_backgroundEffects;
    v3->_backgroundEffects = (NSArray *)v26;

    -[UICoverSheetButton _backgroundEffectsWithBrightness:](v3, "_backgroundEffectsWithBrightness:", 0.65);
    v28 = objc_claimAutoreleasedReturnValue();
    selectedBackgroundEffects = v3->_selectedBackgroundEffects;
    v3->_selectedBackgroundEffects = (NSArray *)v28;

    v30 = objc_alloc_init(_UIClickInteraction);
    -[_UIClickInteraction setDelegate:](v30, "setDelegate:", v3);
    clickInteraction = v3->_clickInteraction;
    v3->_clickInteraction = v30;

    -[UIView addInteraction:](v3, "addInteraction:", v3->_clickInteraction);
    -[_UIClickInteraction setDriverCancelsTouchesInView:](v3->_clickInteraction, "setDriverCancelsTouchesInView:", 0);
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v32 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v35 = _UIInternalPreference_PrototypeHideCoverSheetButtons;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_PrototypeHideCoverSheetButtons)
      {
        while (v32 >= v35)
        {
          _UIInternalPreferenceSync(v32, &_UIInternalPreference_PrototypeHideCoverSheetButtons, (uint64_t)CFSTR("PrototypeHideCoverSheetButtons"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v35 = _UIInternalPreference_PrototypeHideCoverSheetButtons;
          if (v32 == _UIInternalPreference_PrototypeHideCoverSheetButtons)
            goto LABEL_5;
        }
        if (byte_1EDDA8214)
          -[UIView setHidden:](v3, "setHidden:", 1);
      }
    }
LABEL_5:
    v33 = v3;
  }

  return v3;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageContentMode:(int64_t)a3
{
  -[UIImageView setContentMode:](self->_contentView, "setContentMode:", a3);
}

- (int64_t)imageContentMode
{
  return -[UIView contentMode](self->_contentView, "contentMode");
}

- (void)setShouldUseContinuousCorners:(BOOL)a3
{
  if (-[UICoverSheetButton shouldUseContinuousCorners](self, "shouldUseContinuousCorners") != a3)
  {
    self->_shouldUseContinuousCorners = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIControl isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UICoverSheetButton;
    -[UIControl setSelected:](&v5, sel_setSelected_, v3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UICoverSheetButton layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
  }
}

- (void)setPronounced:(BOOL)a3
{
  if (-[UICoverSheetButton isPronounced](self, "isPronounced") != a3)
  {
    self->_pronounced = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UICoverSheetButton layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3;
  double v4;
  CGSize result;

  v3 = vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom), (float64x2_t)vdupq_n_s64(0x4049000000000000uLL));
  v4 = v3.f64[1];
  result.height = v3.f64[0];
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  void *v4;
  int *v5;
  UIImageView **p_contentView;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  double highlightProgress;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIVisualEffectView *backgroundEffectView;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  _QWORD v50[5];
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v51.receiver = self;
  v51.super_class = (Class)UICoverSheetButton;
  -[UIView layoutSubviews](&v51, sel_layoutSubviews);
  if (!self->_interactive)
    -[UICoverSheetButton isPronounced](self, "isPronounced");
  v3 = -[UIControl isSelected](self, "isSelected");
  if (v3)
  {
    -[UICoverSheetButton selectedImage](self, "selectedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = &OBJC_IVAR___UICoverSheetButton__selectedBackgroundEffects;
    p_contentView = &self->_contentView;
    -[UIImageView setImage:](self->_contentView, "setImage:", v4);
    -[UICoverSheetButton selectedTintColor](self, "selectedTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_contentView, "setTintColor:", v7);

  }
  else
  {
    -[UICoverSheetButton image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = &OBJC_IVAR___UICoverSheetButton__backgroundEffects;
    p_contentView = &self->_contentView;
    -[UIImageView setImage:](self->_contentView, "setImage:", v4);
    -[UIView setTintColor:](self->_contentView, "setTintColor:", 0);
  }
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __36__UICoverSheetButton_layoutSubviews__block_invoke;
  v50[3] = &unk_1E16B1B28;
  v50[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v50);
  -[UIVisualEffectView setBackgroundEffects:](self->_backgroundEffectView, "setBackgroundEffects:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  -[UIView bounds](self->_containerView, "bounds");
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  highlightProgress = self->_highlightProgress;
  v13 = CGRectGetWidth(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v14 = v13 + highlightProgress * (CGRectGetWidth(v53) * 1.6 - v13);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v15 = CGRectGetHeight(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v49 = highlightProgress;
  v16 = v15 + highlightProgress * (CGRectGetHeight(v55) * 1.6 - v15);
  v17 = x + width * 0.5;
  v18 = y + height * 0.5;
  -[UIView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  UIRectCenteredAboutPointScale(0.0, 0.0, v14, v16, v17, v18, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[UIView setFrame:](self->_backgroundEffectView, "setFrame:", v22, v24, v26, v28);
  -[UIView frame](self->_backgroundEffectView, "frame");
  v29 = CGRectGetWidth(v56);
  -[UIView frame](self->_backgroundEffectView, "frame");
  v30 = CGRectGetHeight(v57);
  if (v29 < v30)
    v30 = v29;
  v31 = v30 * 0.5;
  backgroundEffectView = self->_backgroundEffectView;
  if (self->_shouldUseContinuousCorners)
    -[UIVisualEffectView _setContinuousCornerRadius:](backgroundEffectView, "_setContinuousCornerRadius:", v31);
  else
    -[UIVisualEffectView _setCornerRadius:](backgroundEffectView, "_setCornerRadius:", v31);
  -[UIImageView sizeThatFits:](*p_contentView, "sizeThatFits:", width, height);
  v34 = v33 + v49 * (v33 * 1.6 - v33);
  v36 = v35 + v49 * (v35 * 1.6 - v35);
  -[UIView traitCollection](self, "traitCollection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "displayScale");
  UIRectCenteredAboutPointScale(0.0, 0.0, v34, v36, v17, v18, v38);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  -[UIImageView setFrame:](*p_contentView, "setFrame:", v40, v42, v44, v46);
  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAlpha:", v49 * 0.5 + 0.0);

  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", v3);

}

uint64_t __36__UICoverSheetButton_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
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

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "edgeInsets");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", v3 + v13, v5 + v10, v7 - (v13 + v11), v9 - (v10 + v12));
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4;
  _UIPercentDrivenInteractionEffect *v5;
  _UIPercentDrivenInteractionEffect *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [_UIPercentDrivenInteractionEffect alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__UICoverSheetButton_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E16C75A0;
  objc_copyWeak(&v9, &location);
  v6 = -[_UIPercentDrivenInteractionEffect initWithProgressBlock:](v5, "initWithProgressBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __57__UICoverSheetButton_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "progress");
  v5 = v4;
  v6 = objc_msgSend(v3, "ended");

  objc_msgSend(WeakRetained, "_animateEffectUpdateWithProgress:ended:", v6, v5);
}

- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4
{
  double v4;
  _QWORD v5[6];

  v4 = a3 + a3 + 18.0;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke;
  v5[3] = &unk_1E16B1888;
  if (a4)
    v4 = v4 + 4.0;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v5, 0, 500.0, v4);
}

uint64_t __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke(uint64_t a1)
{
  _QWORD v3[6];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke_2;
  v3[3] = &unk_1E16B1888;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke_2(uint64_t a1)
{
  double v2;

  v2 = *(double *)(a1 + 40);
  if (v2 > 1.2)
    v2 = 1.2;
  *(double *)(*(_QWORD *)(a1 + 32) + 528) = v2;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  _UIClickInteraction *clickInteraction;
  void *v6;
  void *v7;

  clickInteraction = self->_clickInteraction;
  if (clickInteraction == a3)
  {
    self->_interactive = 1;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UICoverSheetButton layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
    -[UICoverSheetButton _interactionDurationStat](self, "_interactionDurationStat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTimingForObject:", self);

    -[UICoverSheetButton _firstActivationDurationStat](self, "_firstActivationDurationStat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTimingForObject:", self);

  }
  return clickInteraction == a3;
}

- (void)clickInteractionDidClickUp:(id)a3
{
  id v4;

  if (self->_clickInteraction == a3)
  {
    -[UICoverSheetButton setSelected:](self, "setSelected:", -[UIControl isSelected](self, "isSelected") ^ 1);
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
    if (self->_interactive)
    {
      self->_didActivateDuringInteraction = 1;
      -[UICoverSheetButton _firstActivationDurationStat](self, "_firstActivationDurationStat");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordTimingForObject:", self);

    }
  }
}

- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction
{
  if (self->_interactive)
  {
    if (self->_maxForceDuringInteraction >= maxForceDuringInteraction)
      maxForceDuringInteraction = self->_maxForceDuringInteraction;
    self->_maxForceDuringInteraction = maxForceDuringInteraction;
  }
}

- (void)clickInteractionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_clickInteraction == a3)
  {
    -[UICoverSheetButton _interactionCountStatWithActivation:](self, "_interactionCountStatWithActivation:", self->_didActivateDuringInteraction);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incrementValueBy:", 1);

    -[UICoverSheetButton _maxForceStatWithActivation:](self, "_maxForceStatWithActivation:", self->_didActivateDuringInteraction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordDistributionValue:", self->_maxForceDuringInteraction);

    self->_interactive = 0;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UICoverSheetButton layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
    -[UICoverSheetButton _interactionDurationStat](self, "_interactionDurationStat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordTimingForObject:", self);

    -[UICoverSheetButton _firstActivationDurationStat](self, "_firstActivationDurationStat");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelTimingForObject:", self);

  }
}

- (unint64_t)_clickInteractionDefaultDriverType:(id)a3
{
  void *v3;
  uint64_t v4;

  -[UIView traitCollection](self, "traitCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability");

  if (v4 == 2)
    return 4;
  else
    return 3;
}

- (void)layoutIfNeededAnimated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v2, 0, 0.0, 0.0);
}

uint64_t __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor blackColor](UIColor, "blackColor", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVisualEffect effectCompositingColor:withMode:alpha:](UIVisualEffect, "effectCompositingColor:withMode:alpha:", v5, 1010, 0.12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UICoverSheetButtonLuminanceMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColorEffect colorEffectLuminanceMap:blendingAmount:](UIColorEffect, "colorEffectLuminanceMap:blendingAmount:", v7, 0.7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 2.8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  +[UIColorEffect colorEffectBrightness:](UIColorEffect, "colorEffectBrightness:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setBackgroundEffectViewGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_backgroundEffectView, "_setGroupName:", a3);
}

- (id)_interactionCountStatWithActivation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[UICoverSheetButton statisticsIdentifier](self, "statisticsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_UIStatistics coverSheetButtonInteractionCountWithActivation:category:](_UIStatistics, "coverSheetButtonInteractionCountWithActivation:category:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_interactionDurationStat
{
  void *v2;
  void *v3;

  -[UICoverSheetButton statisticsIdentifier](self, "statisticsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[_UIStatistics coverSheetButtonInteractionDurationWithCategory:](_UIStatistics, "coverSheetButtonInteractionDurationWithCategory:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_firstActivationDurationStat
{
  void *v2;
  void *v3;

  -[UICoverSheetButton statisticsIdentifier](self, "statisticsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[_UIStatistics coverSheetButtonFirstActivationDurationWithCategory:](_UIStatistics, "coverSheetButtonFirstActivationDurationWithCategory:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_maxForceStatWithActivation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[UICoverSheetButton statisticsIdentifier](self, "statisticsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_UIStatistics coverSheetButtonMaximumForceWithActivation:category:](_UIStatistics, "coverSheetButtonMaximumForceWithActivation:category:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPronounced
{
  return self->_pronounced;
}

- (BOOL)isLatching
{
  return self->_latching;
}

- (void)setLatching:(BOOL)a3
{
  self->_latching = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTintColor, a3);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)shouldUseContinuousCorners
{
  return self->_shouldUseContinuousCorners;
}

- (NSString)localizedAccessoryTitle
{
  return self->_localizedAccessoryTitle;
}

- (void)setLocalizedAccessoryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSString)backgroundEffectViewGroupName
{
  return self->_backgroundEffectViewGroupName;
}

- (NSString)statisticsIdentifier
{
  return self->_statisticsIdentifier;
}

- (void)setStatisticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundEffectViewGroupName, 0);
  objc_storeStrong((id *)&self->_localizedAccessoryTitle, 0);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
