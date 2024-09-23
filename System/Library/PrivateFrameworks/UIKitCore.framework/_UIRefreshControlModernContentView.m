@implementation _UIRefreshControlModernContentView

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52___UIRefreshControlModernContentView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[UIView frame](self->_textLabel, "frame", a3.width, a3.height);
  if (v5 <= 0.0)
  {
    v7 = 60.0;
  }
  else
  {
    -[UIView frame](self->_textLabel, "frame");
    v7 = v6 + 62.0 + 5.0;
  }
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (id)_effectiveTintColorWithAlpha:(double)a3
{
  void *v4;
  void *v5;

  -[_UIRefreshControlModernContentView _effectiveTintColor](self, "_effectiveTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_effectiveTintColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_UIRefreshControlContentView tintColor](self, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_setUnbloomedAppearance
{
  _UIRefreshControlSeedView *seed;
  uint64_t v3;

  seed = self->_seed;
  -[_UIRefreshControlModernContentView _unbloomedSeedTransform](self, "_unbloomedSeedTransform");
  -[UIView setTransform:](seed, "setTransform:", &v3);
}

- (CGAffineTransform)_unbloomedSeedTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (void)setImpactIntensity:(double)a3
{
  self->_impactIntensity = a3;
}

- (void)_reveal
{
  void *v3;
  double v4;
  _QWORD v5[5];

  -[UIView layer](self->_replicatorView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setSpeed:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45___UIRefreshControlModernContentView__reveal__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 1.0, 0.0);
  -[_UIRefreshControlModernContentView _updateTimeOffsetOfRelevantLayers](self, "_updateTimeOffsetOfRelevantLayers");
}

- (void)_updateTimeOffsetOfRelevantLayers
{
  double v3;
  double v4;
  void *v5;
  UILabel *textLabel;

  if (!self->_hasFinishedRevealing)
  {
    -[_UIRefreshControlModernContentView _currentTimeOffset](self, "_currentTimeOffset");
    v4 = v3;
    -[UIView layer](self->_replicatorView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeOffset:", v4);

  }
  textLabel = self->_textLabel;
  -[_UIRefreshControlModernContentView _percentageShowing](self, "_percentageShowing");
  -[UIView setAlpha:](textLabel, "setAlpha:");
}

- (double)_currentTimeOffset
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double result;

  -[_UIRefreshControlContentView refreshControl](self, "refreshControl");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[_UIRefreshControlContentView refreshControl](self, "refreshControl"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "refreshControlState"),
        v5,
        v4,
        result = 0.0,
        v6 == 1))
  {
    -[_UIRefreshControlModernContentView _percentageShowing](self, "_percentageShowing");
    if (result >= 1.0)
      return 0.999999881;
  }
  return result;
}

- (double)_percentageShowing
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double result;

  -[_UIRefreshControlContentView refreshControl](self, "refreshControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visibleHeight");
  v5 = v4;

  -[_UIRefreshControlModernContentView maximumSnappingHeight](self, "maximumSnappingHeight");
  result = v5 / v6;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (double)maximumSnappingHeight
{
  double v3;
  double v4;
  double v5;

  -[UIView frame](self->_textLabel, "frame");
  v4 = (v3 + 100.0) * 1.125;
  -[_UIRefreshControlModernContentView _maximumSnappingHeightScalingForScrollViewHeight](self, "_maximumSnappingHeightScalingForScrollViewHeight");
  return v5 * v4;
}

- (double)_maximumSnappingHeightScalingForScrollViewHeight
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[_UIRefreshControlContentView refreshControl](self, "refreshControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollViewHeight");
  v4 = v3;

  result = v4 / 568.0;
  if (v4 < 372.0)
    return 0.654929577;
  return result;
}

- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen
{
  return 5.0;
}

- (void)setCurrentPopStiffness:(double)a3
{
  self->_currentPopStiffness = a3;
}

- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIRefreshControlModernContentView;
  -[_UIRefreshControlContentView willTransitionFromState:toState:](&v8, sel_willTransitionFromState_toState_);
  if (a3 == 6 || a3 != 1 && a4 == 1)
  {
    -[_UIRefreshControlModernContentView _resetToRevealingState](self, "_resetToRevealingState");
  }
  else if (a4 == 3)
  {
    -[_UIRefreshControlModernContentView _spin](self, "_spin");
  }
  -[UIView layer](self->_textLabel, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

}

- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v13;

  switch(a4)
  {
    case 0:
      goto LABEL_8;
    case 1:
      if (a3 == 4)
        goto LABEL_9;
      -[_UIRefreshControlModernContentView _updateTimeOffsetOfRelevantLayers](self, "_updateTimeOffsetOfRelevantLayers");
      goto LABEL_16;
    case 2:
      -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isActive");

      if ((v8 & 1) == 0)
      {
        -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activateWithCompletionBlock:", 0);

      }
      -[_UIRefreshControlModernContentView _snappingMagic](self, "_snappingMagic");
      goto LABEL_8;
    case 3:
      if (a3)
      {
LABEL_8:
        if (a3 == 4)
LABEL_9:
          -[_UIRefreshControlModernContentView _resetToRevealingState](self, "_resetToRevealingState");
      }
      else
      {
        -[_UIRefreshControlModernContentView _tickDueToProgrammaticRefresh](self, "_tickDueToProgrammaticRefresh");
      }
LABEL_16:
      v13.receiver = self;
      v13.super_class = (Class)_UIRefreshControlModernContentView;
      -[_UIRefreshControlContentView didTransitionFromState:toState:](&v13, sel_didTransitionFromState_toState_, a3, a4);
      return;
    case 4:
      -[_UIRefreshControlModernContentView _goAway](self, "_goAway");
      goto LABEL_13;
    case 5:
      if (a3 == 4)
        -[_UIRefreshControlModernContentView _resetToRevealingState](self, "_resetToRevealingState");
LABEL_13:
      -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isActive");

      if (v11)
      {
        -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deactivate");

      }
      goto LABEL_16;
    case 6:
      goto LABEL_9;
    default:
      goto LABEL_16;
  }
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIRefreshControlModernContentView;
  -[_UIRefreshControlContentView setTintColor:](&v4, sel_setTintColor_, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRefreshControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImpactFeedbackGenerator *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIRefreshControlModernContentView;
  v4 = a3;
  -[_UIRefreshControlContentView setRefreshControl:](&v11, sel_setRefreshControl_, v4);
  objc_msgSend(v4, "_scrollView", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    +[_UIImpactFeedbackGeneratorConfiguration refreshConfiguration](_UIImpactFeedbackGeneratorConfiguration, "refreshConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("refresh"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[UIFeedbackGenerator initWithConfiguration:view:]([UIImpactFeedbackGenerator alloc], "initWithConfiguration:view:", v9, v5);
    -[_UIRefreshControlContentView setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", v10);

  }
}

- (_UIRefreshControlModernContentView)initWithFrame:(CGRect)a3
{
  _UIRefreshControlModernContentView *v3;
  UILabel *v4;
  UILabel *textLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UIView *v12;
  UIView *replicatorContainer;
  _UIRefreshControlModernReplicatorView *v14;
  _UIRefreshControlModernReplicatorView *replicatorView;
  _UIRefreshControlSeedView *v16;
  _UIRefreshControlSeedView *seed;
  void *v18;
  _UIRefreshControlModernContentView *v19;
  void *v20;
  _QWORD v22[4];
  _UIRefreshControlModernContentView *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UIRefreshControlModernContentView;
  v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UILabel);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    v6 = v3->_textLabel;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = v3->_textLabel;
    +[UIColor labelColor](UIColor, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 1);
    v10 = v3->_textLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    v12 = objc_alloc_init(UIView);
    replicatorContainer = v3->_replicatorContainer;
    v3->_replicatorContainer = v12;

    v14 = objc_alloc_init(_UIRefreshControlModernReplicatorView);
    replicatorView = v3->_replicatorView;
    v3->_replicatorView = v14;

    v16 = objc_alloc_init(_UIRefreshControlSeedView);
    seed = v3->_seed;
    v3->_seed = v16;

    -[UIView layer](v3->_seed, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsEdgeAntialiasing:", 1);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __52___UIRefreshControlModernContentView_initWithFrame___block_invoke;
    v22[3] = &unk_1E16B1B28;
    v19 = v3;
    v23 = v19;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
    -[UIView addSubview:](v3->_replicatorView, "addSubview:", v3->_seed);
    -[UIView layer](v3->_replicatorView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInstanceCount:", 8);

    -[UIView addSubview:](v3->_replicatorContainer, "addSubview:", v3->_replicatorView);
    -[UIView addSubview:](v19, "addSubview:", v3->_replicatorContainer);
    -[_UIRefreshControlModernContentView _resetToRevealingState](v19, "_resetToRevealingState");
    -[_UIRefreshControlModernContentView _updateTimeOffsetOfRelevantLayers](v19, "_updateTimeOffsetOfRelevantLayers");
    -[UIView addSubview:](v19, "addSubview:", v3->_textLabel);

  }
  return v3;
}

- (void)_resetToRevealingState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60___UIRefreshControlModernContentView__resetToRevealingState__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  self->_hasFinishedRevealing = 0;
  -[_UIRefreshControlModernContentView _reveal](self, "_reveal");
}

- (int64_t)style
{
  return 2;
}

- (void)_tickDueToProgrammaticRefresh
{
  -[_UIRefreshControlModernContentView _cleanUpAfterRevealing](self, "_cleanUpAfterRevealing");
  -[_UIRefreshControlModernContentView _setSpunAppearance](self, "_setSpunAppearance");
  -[_UIRefreshControlModernContentView _tick](self, "_tick");
}

- (void)_removeAllAnimations
{
  id v2;

  -[UIView layer](self->_replicatorView, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

}

- (void)_cleanUpAfterRevealing
{
  double v2;
  id v3;

  self->_hasFinishedRevealing = 1;
  -[UIView layer](self->_replicatorView, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v3, "setSpeed:", v2);

}

- (void)_setSpunAppearance
{
  UIView *replicatorContainer;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGAffineTransform v11;

  replicatorContainer = self->_replicatorContainer;
  CGAffineTransformMakeRotation(&v11, 3.13159265);
  -[UIView setTransform:](replicatorContainer, "setTransform:", &v11);
  -[UIView layer](self->_replicatorView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = *(_DWORD *)"\nף=";
  objc_msgSend(v4, "setInstanceAlphaOffset:", v5);

  os_variant_has_internal_diagnostics();
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v7);

  v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[UIView layer](self->_replicatorView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRefreshControlModernContentView _effectiveTintColorWithAlpha:](self, "_effectiveTintColorWithAlpha:", 0.0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setInstanceColor:", objc_msgSend(v10, "CGColor"));

  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);

}

- (void)_setBloomedAppearance
{
  _UIRefreshControlSeedView *seed;
  uint64_t v3;

  seed = self->_seed;
  -[_UIRefreshControlModernContentView _bloomedSeedTransform](self, "_bloomedSeedTransform");
  -[UIView setTransform:](seed, "setTransform:", &v3);
}

- (CGAffineTransform)_bloomedSeedTransform
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGAffineTransform *result;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[_UIRefreshControlModernContentView _unbloomedSeedTransform](self, "_unbloomedSeedTransform");
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, 1.2, 1.2);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, 0.0, -2.0);
  v4 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  v9 = v13;
  CGAffineTransformConcat(&v11, &t1, &v9);
  v5 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  v6 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  v9 = v12;
  result = CGAffineTransformConcat(&v11, &t1, &v9);
  v8 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (void)_unbloom
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46___UIRefreshControlModernContentView__unbloom__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.15, 0.0);
}

- (void)_bloom
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44___UIRefreshControlModernContentView__bloom__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44___UIRefreshControlModernContentView__bloom__block_invoke_2;
  v2[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v3, v2, 0.05, 0.0);
}

- (void)_spin
{
  double v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  _QWORD v19[5];

  -[_UIRefreshControlModernContentView _cleanUpAfterRevealing](self, "_cleanUpAfterRevealing");
  -[_UIRefreshControlModernContentView currentPopStiffness](self, "currentPopStiffness");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43___UIRefreshControlModernContentView__spin__block_invoke;
  v19[3] = &unk_1E16B1B28;
  v19[4] = self;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 196612, v19, 0, 4.0, 0.0, 1.0, v3, 5000.0, 0.0);
  -[_UIRefreshControlModernContentView _tick](self, "_tick");
  -[_UIRefreshControlModernContentView _bloom](self, "_bloom");
  -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRefreshControlModernContentView impactIntensity](self, "impactIntensity");
    v8 = v7;
    -[_UIRefreshControlContentView refreshControl](self, "refreshControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView center](self, "center");
    v12 = v11;
    v14 = v13;
    -[UIView superview](self, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
    objc_msgSend(v6, "impactOccurredWithIntensity:atLocation:", v8, v16, v17);

    -[_UIRefreshControlContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deactivate");

  }
}

- (void)_tick
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43___UIRefreshControlModernContentView__tick__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 117638156, v2, 0, 1.0, 0.0);
}

- (void)_goAway
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45___UIRefreshControlModernContentView__goAway__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.3, 0.0);
}

- (void)_snappingMagic
{
  id v2;

  -[_UIRefreshControlContentView refreshControl](self, "refreshControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRefreshControlState:", 3);

}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  if (self->_horizontallyCenteredFramesNeedUpdate || v8 != left)
  {
    self->_horizontallyCenteredFramesNeedUpdate = 1;
LABEL_7:
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_8;
  }
  self->_horizontallyCenteredFramesNeedUpdate = v9 != right;
  if (v9 != right)
    goto LABEL_7;
LABEL_8:
  v11.receiver = self;
  v11.super_class = (Class)_UIRefreshControlModernContentView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (void)setAttributedTitle:(id)a3
{
  -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:", a3);
  -[UIView sizeToFit](self->_textLabel, "sizeToFit");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  self->_animationsAreValid = 0;
}

- (id)attributedTitle
{
  return -[UILabel attributedText](self->_textLabel, "attributedText");
}

- (BOOL)areAnimationsValid
{
  return self->_areAnimationsValid;
}

- (void)setAreAnimationsValid:(BOOL)a3
{
  self->_areAnimationsValid = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (double)currentPopStiffness
{
  return self->_currentPopStiffness;
}

- (double)impactIntensity
{
  return self->_impactIntensity;
}

- (BOOL)horizontallyCenteredFramesNeedUpdate
{
  return self->_horizontallyCenteredFramesNeedUpdate;
}

- (void)setHorizontallyCenteredFramesNeedUpdate:(BOOL)a3
{
  self->_horizontallyCenteredFramesNeedUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_replicatorContainer, 0);
}

@end
