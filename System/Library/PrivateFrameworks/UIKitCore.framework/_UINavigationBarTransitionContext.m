@implementation _UINavigationBarTransitionContext

- (void)setRTL:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)isRTL
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)setCompact:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)compact
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setAllowLargeTitles:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)allowLargeTitles
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)setTwoPart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)twoPart
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setBeginWithLargeTitle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)beginWithLargeTitle
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)setEndWithLargeTitle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)endWithLargeTitle
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)setObservedScrollViewOffsetIsApplicable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)observedScrollViewOffsetIsApplicable
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)setSharesContentViewLayouts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)sharesContentViewLayouts
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (void)setBeginWithTransparencyAllowed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)beginWithTransparencyAllowed
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (void)setEndWithTransparencyAllowed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)endWithTransparencyAllowed
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (void)setPushOperation:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)isPushOperation
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setBackgroundView:(id)a3 isBarBackground:(BOOL)a4
{
  _BOOL4 v4;
  __int16 v6;

  v4 = a4;
  objc_storeStrong((id *)&self->_backgroundView, a3);
  if (v4)
    v6 = 2048;
  else
    v6 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContext;
  -[_UINavigationBarTransitionContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ from=%p to=%p"), v4, self->_fromLayout, self->_toLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldSlideBarBackground
{
  void *v2;
  int v3;

  if (self->_apiVersion < 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[_UINavigationBarTransitionContext navigationBar](self, "navigationBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_shouldCrossFadeBackgroundVisility") ^ 1;

  }
  return v3;
}

+ (id)contextForTransition:(int64_t)a3 withIdiom:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;

  v9 = a5;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UINavigationBarTransitionContext.m"), 214, CFSTR("_UINavigationBarTransitionDefault is not valid as a requested transition"));

      goto LABEL_4;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      v12 = (objc_class *)objc_opt_class();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UINavigationBarTransitionContext.m"), 218, CFSTR("Unknown transition %li"), a3);

LABEL_4:
      v12 = 0;
      break;
  }
  v13 = objc_alloc_init(v12);
  v14 = v13;
  if (a4 == 6)
    *((_WORD *)v13 + 80) |= 0x10u;
  *((_OWORD *)v13 + 8) = xmmword_186679460;
  objc_msgSend(v13, "setCompletionHandler:", v9);

  return v14;
}

- (void)recordUpdates:(id)a3
{
  void (**v4)(void);
  _UINavigationBarLayout *v5;
  _UINavigationBarContentViewLayout *contentViewLayout;
  _UINavigationBarLayout *v7;
  _UINavigationBarLargeTitleViewLayout *largeTitleViewLayout;
  _UINavigationBarLayout *v9;
  _UINavigationBarContentViewLayout *v10;
  _UINavigationBarLayout *v11;
  _UINavigationBarLargeTitleViewLayout *v12;
  void (**v13)(void);
  _UINavigationBarContentView *contentView;
  _UINavigationBarContentViewLayout *v15;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarContentViewLayout *toContentLayout;
  _UINavigationBarContentViewLayout *v19;
  _UINavigationBarLargeTitleView *largeTitleView;
  _UINavigationBarLargeTitleViewLayout *v21;
  _UINavigationBarLayout *v22;
  _UINavigationBarLayout *v23;
  _UINavigationBarLargeTitleViewLayout *toLargeTitleLayout;
  _UINavigationBarLargeTitleViewLayout *v25;
  void (**v26)(void);

  v4 = (void (**)(void))a3;
  v26 = v4;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    v13 = v4;
    contentView = self->_contentView;
    if (contentView)
    {
      -[_UINavigationBarContentView layout](contentView, "layout");
      v15 = (_UINavigationBarContentViewLayout *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        fromLayout = self->_fromLayout;
        if (fromLayout && (v15 = fromLayout->_contentViewLayout) != 0
          || (toLayout = self->_toLayout) != 0 && (v15 = toLayout->_contentViewLayout) != 0)
        {
          -[_UINavigationBarContentView adoptLayout:](self->_contentView, "adoptLayout:", v15);
        }
        else
        {
          -[_UINavigationBarContentView adoptNewLayout](self->_contentView, "adoptNewLayout");
          -[_UINavigationBarContentView layout](self->_contentView, "layout");
          v15 = (_UINavigationBarContentViewLayout *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_storeStrong((id *)&self->_fromContentLayout, v15);
      -[_UINavigationBarLayout setContentViewLayout:]((id *)&self->_fromLayout->super.isa, v15);
      toContentLayout = self->_toContentLayout;
      self->_toContentLayout = v15;
      v19 = v15;

      -[_UINavigationBarLayout setContentViewLayout:]((id *)&self->_toLayout->super.isa, v19);
      v13 = v26;
    }
    largeTitleView = self->_largeTitleView;
    if (largeTitleView)
    {
      -[_UINavigationBarLargeTitleView layout](largeTitleView, "layout");
      v21 = (_UINavigationBarLargeTitleViewLayout *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v22 = self->_fromLayout;
        if (v22 && (v21 = v22->_largeTitleViewLayout) != 0
          || (v23 = self->_toLayout) != 0 && (v21 = v23->_largeTitleViewLayout) != 0)
        {
          -[_UINavigationBarLargeTitleView adoptLayout:](self->_largeTitleView, "adoptLayout:", v21);
        }
        else
        {
          -[_UINavigationBarLargeTitleView adoptNewLayout](self->_largeTitleView, "adoptNewLayout");
          -[_UINavigationBarLargeTitleView layout](self->_largeTitleView, "layout");
          v21 = (_UINavigationBarLargeTitleViewLayout *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_storeStrong((id *)&self->_fromLargeTitleLayout, v21);
      -[_UINavigationBarLayout setLargeTitleViewLayout:]((id *)&self->_fromLayout->super.isa, v21);
      toLargeTitleLayout = self->_toLargeTitleLayout;
      self->_toLargeTitleLayout = v21;
      v25 = v21;

      -[_UINavigationBarLayout setLargeTitleViewLayout:]((id *)&self->_toLayout->super.isa, v25);
      v13 = v26;
    }
    ((void (*)(void (**)(void)))v13[2])(v13);
  }
  else
  {
    -[_UINavigationBarLayout recordFromStateForTransition:](self->_fromLayout, "recordFromStateForTransition:", self);
    v5 = self->_fromLayout;
    if (v5)
      contentViewLayout = v5->_contentViewLayout;
    else
      contentViewLayout = 0;
    objc_storeStrong((id *)&self->_fromContentLayout, contentViewLayout);
    v7 = self->_fromLayout;
    if (v7)
      largeTitleViewLayout = v7->_largeTitleViewLayout;
    else
      largeTitleViewLayout = 0;
    objc_storeStrong((id *)&self->_fromLargeTitleLayout, largeTitleViewLayout);
    -[_UINavigationBarLayout prepareToRecordToState:](self->_toLayout, "prepareToRecordToState:", self);
    v26[2]();
    if (-[_UINavigationBarContentViewLayout titleAlignment](self->_fromContentLayout, "titleAlignment") == 1)
      -[_UINavigationBarContentViewLayout replaceTitleViewWithSnapshot](self->_fromContentLayout, "replaceTitleViewWithSnapshot");
    -[_UINavigationBarContentViewLayout replaceLeadingBarWithSnapshot](self->_fromContentLayout, "replaceLeadingBarWithSnapshot");
    -[_UINavigationBarContentViewLayout replaceTrailingBarWithSnapshot](self->_fromContentLayout, "replaceTrailingBarWithSnapshot");
    -[_UINavigationBarLayout recordToStateForTransition:](self->_toLayout, "recordToStateForTransition:", self);
    v9 = self->_toLayout;
    if (v9)
      v10 = v9->_contentViewLayout;
    else
      v10 = 0;
    objc_storeStrong((id *)&self->_toContentLayout, v10);
    v11 = self->_toLayout;
    if (v11)
      v12 = v11->_largeTitleViewLayout;
    else
      v12 = 0;
    objc_storeStrong((id *)&self->_toLargeTitleLayout, v12);
  }

}

- (void)prepare
{
  __int16 flags;
  _UINavigationBarLayout *fromLayout;
  double backgroundAlpha;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v7;
  double width;
  int v9;
  double v10;
  double v11;
  double v12;

  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
    *(_WORD *)&self->_flags = flags & 0xFF9F;
  fromLayout = self->_fromLayout;
  if (fromLayout)
  {
    backgroundAlpha = self->_backgroundAlpha;
    if (fromLayout->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      fromLayout->_requestedBackgroundViewAlpha = backgroundAlpha;
      -[_UINavigationBarLayout _updateLayoutOutputs](fromLayout, "_updateLayoutOutputs");
      fromLayout = self->_fromLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)fromLayout);
  toLayout = self->_toLayout;
  if (toLayout && toLayout->_layoutSize.width != 0.0)
    goto LABEL_13;
  v7 = self->_fromLayout;
  if (v7)
    width = v7->_layoutSize.width;
  else
    width = 0.0;
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)toLayout, width, 10000.0);
  v9 = *(_WORD *)&self->_flags & 0x48;
  v10 = -[_UINavigationBarLayout layoutHeights]((uint64_t)self->_toLayout);
  if (v9 == 8)
    v11 = v10;
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->_toLayout, width, v11);
  toLayout = self->_toLayout;
  if (toLayout)
  {
LABEL_13:
    v12 = self->_backgroundAlpha;
    if (toLayout->_requestedBackgroundViewAlpha != v12)
    {
      toLayout->_requestedBackgroundViewAlpha = v12;
      -[_UINavigationBarLayout _updateLayoutOutputs](toLayout, "_updateLayoutOutputs");
      toLayout = self->_toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)toLayout);
  -[_UINavigationBarLayout interleaveViewsWithLayout:inNavigationBar:]((uint64_t)self->_fromLayout, self->_toLayout, self->_navigationBar);
}

- (BOOL)shouldPerformTwoPartCrossfadeTransition
{
  _UINavigationBarLayout *toLayout;
  double v3;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *fromLayout;

  if ((*(_WORD *)&self->_flags & 0x600) == 0)
    return 0;
  toLayout = self->_toLayout;
  v3 = 0.0;
  chromelessTransitionProgress = 0.0;
  if (toLayout)
    chromelessTransitionProgress = toLayout->_chromelessTransitionProgress;
  fromLayout = self->_fromLayout;
  if (fromLayout)
    v3 = fromLayout->_chromelessTransitionProgress;
  return chromelessTransitionProgress != v3;
}

- (void)_animateBackgroundView
{
  _UINavigationBarLayout *toLayout;
  uint64_t v4;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  _UINavigationBarLayout *v7;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v10;
  _QWORD v11[5];

  -[UIView setFrame:](self->_backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->_toLayout));
  toLayout = self->_toLayout;
  if (toLayout)
  {
    v4 = 184;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      v4 = 192;
    toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v4);
  }
  v5 = toLayout;
  v6 = v5;
  v7 = self->_toLayout;
  computedBackgroundViewAlpha = 0.0;
  chromelessTransitionProgress = 0.0;
  if (v7)
    chromelessTransitionProgress = v7->_chromelessTransitionProgress;
  -[_UINavigationBarLayout setBackgroundTransitionProgress:](v5, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
  v10 = self->_toLayout;
  if (v10)
    computedBackgroundViewAlpha = v10->_computedBackgroundViewAlpha;
  -[_UINavigationBarLayout setBackgroundAlpha:](v6, "setBackgroundAlpha:", computedBackgroundViewAlpha);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
    -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", v6);
  if (-[_UINavigationBarTransitionContext shouldPerformTwoPartCrossfadeTransition](self, "shouldPerformTwoPartCrossfadeTransition"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59___UINavigationBarTransitionContext__animateBackgroundView__block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    _UIBarsTwoPartCrossfadeTransitionProgress(v11, 0, chromelessTransitionProgress);
  }
  else
  {
    if ((*(_WORD *)&self->_flags & 0x800) != 0)
      -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
    -[UINavigationBar _updatePaletteBackgroundIfNecessary](self->_navigationBar, "_updatePaletteBackgroundIfNecessary");
  }

}

- (void)setAllLargeTitleLayoutsVisible
{
  -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->_toLargeTitleLayout, "setContentHidden:", 0);
  -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->_fromLargeTitleLayout, "setContentHidden:", 0);
}

- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3
{
  uint64_t v4;

  v4 = 72;
  if (a3)
    v4 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "finalizeStateFromTransition:", self);
  -[_UINavigationBarContentView clearTransitionContext](self->_contentView, "clearTransitionContext");
  -[_UINavigationBarLargeTitleView clearTransitionContext](self->_largeTitleView, "clearTransitionContext");
}

- (void)complete
{
  __int16 flags;
  _UINavigationBarLayout *toLayout;
  BOOL v5;
  uint64_t v6;
  _UINavigationBarLayout *v7;

  -[_UINavigationBarTransitionContext _resetContentAndLargeTitleViewCompleted:](self, "_resetContentAndLargeTitleViewCompleted:", 1);
  -[_UINavigationBarTransitionContext setAllLargeTitleLayoutsVisible](self, "setAllLargeTitleLayoutsVisible");
  -[_UINavigationBarLayout removeViewsNotInLayout:]((uint64_t)self->_fromLayout, self->_toLayout);
  flags = (__int16)self->_flags;
  if ((flags & 0x800) != 0)
  {
    toLayout = self->_toLayout;
    if (toLayout)
    {
      v5 = (flags & 4) == 0;
      v6 = 184;
      if (v5)
        v6 = 192;
      toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v6);
    }
    v7 = toLayout;
    -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", v7);

    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
  -[_UINavigationBarTransitionContext _resetPalettes]((uint64_t)self);
}

- (void)_resetPalettes
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;

  if (a1)
  {
    v2 = *(_QWORD **)(a1 + 72);
    if (v2)
      v2 = (_QWORD *)v2[32];
    v3 = v2;
    objc_msgSend(v3, "setTransitioning:", 0);

    v4 = *(_QWORD **)(a1 + 72);
    if (v4)
      v4 = (_QWORD *)v4[32];
    v5 = v4;
    objc_msgSend(v5, "setAlpha:", 1.0);

    v6 = *(_QWORD **)(a1 + 72);
    if (v6)
      v6 = (_QWORD *)v6[33];
    v7 = v6;
    objc_msgSend(v7, "setTransitioning:", 0);

    v8 = *(_QWORD **)(a1 + 72);
    if (v8)
      v8 = (_QWORD *)v8[33];
    v9 = v8;
    objc_msgSend(v9, "setAlpha:", 1.0);

    v10 = *(_QWORD **)(a1 + 80);
    if (v10)
      v10 = (_QWORD *)v10[32];
    v11 = v10;
    objc_msgSend(v11, "setTransitioning:", 0);

    v12 = *(_QWORD **)(a1 + 80);
    if (v12)
      v12 = (_QWORD *)v12[32];
    v13 = v12;
    objc_msgSend(v13, "setAlpha:", 1.0);

    v14 = *(_QWORD **)(a1 + 80);
    if (v14)
      v14 = (_QWORD *)v14[33];
    v15 = v14;
    objc_msgSend(v15, "setTransitioning:", 0);

    v16 = *(_QWORD **)(a1 + 80);
    if (v16)
      v16 = (_QWORD *)v16[33];
    v17 = v16;
    objc_msgSend(v17, "setAlpha:", 1.0);

  }
}

- (void)cancel
{
  __int16 flags;
  _UINavigationBarLayout *fromLayout;
  BOOL v5;
  uint64_t v6;
  _UINavigationBarLayout *v7;

  -[_UINavigationBarTransitionContext _resetContentAndLargeTitleViewCompleted:](self, "_resetContentAndLargeTitleViewCompleted:", 0);
  -[_UINavigationBarTransitionContext setAllLargeTitleLayoutsVisible](self, "setAllLargeTitleLayoutsVisible");
  -[_UINavigationBarLayout removeViewsNotInLayout:]((uint64_t)self->_toLayout, self->_fromLayout);
  flags = (__int16)self->_flags;
  if ((flags & 0x800) != 0)
  {
    fromLayout = self->_fromLayout;
    if (fromLayout)
    {
      v5 = (flags & 4) == 0;
      v6 = 184;
      if (v5)
        v6 = 192;
      fromLayout = *(_UINavigationBarLayout **)((char *)&fromLayout->super.isa + v6);
    }
    v7 = fromLayout;
    -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", v7);

    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
  -[_UINavigationBarTransitionContext _resetPalettes]((uint64_t)self);
}

- (id)prepareForInterruption
{
  return &__block_literal_global_66;
}

- (UIView)viewFadingInFromCustomAlpha
{
  void *v3;
  void *v4;
  void *v5;

  if (-[_UINavigationBarTransitionContext transition](self, "transition") != 2)
    goto LABEL_5;
  -[_UINavigationBarContentViewLayout backButton](self->_toContentLayout, "backButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[_UINavigationBarContentViewLayout backButton](self->_fromContentLayout, "backButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UINavigationBarContentViewLayout backButton](self->_toContentLayout, "backButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIView *)v3;
    }
LABEL_5:
    v3 = 0;
  }
  return (UIView *)v3;
}

- (UIView)viewUsingEaseInCurve
{
  return 0;
}

+ (CAMediaTimingFunction)fadeInFunction
{
  if (qword_1ECD7B6D8 != -1)
    dispatch_once(&qword_1ECD7B6D8, &__block_literal_global_19_0);
  return (CAMediaTimingFunction *)(id)_MergedGlobals_69_0;
}

+ (CAMediaTimingFunction)fadeOutFunction
{
  if (qword_1ECD7B6E8 != -1)
    dispatch_once(&qword_1ECD7B6E8, &__block_literal_global_21);
  return (CAMediaTimingFunction *)(id)qword_1ECD7B6E0;
}

- (void)_addClippingView:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = *(void **)(a1 + 168);
    v8 = v4;
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v6;

      v5 = *(void **)(a1 + 168);
    }
    objc_msgSend(v5, "addObject:", v8);
    v4 = v8;
  }

}

- (uint64_t)_removeAllClippingViews
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(result + 168);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 168), "removeAllObjects");
  }
  return result;
}

- (void)_preparePalettes
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  _QWORD *v13;

  if (a1)
  {
    v2 = (_QWORD *)a1[9];
    if (v2)
      v2 = (_QWORD *)v2[32];
    v3 = v2;
    v4 = (_QWORD *)a1[10];
    if (v4)
      v4 = (_QWORD *)v4[32];
    v5 = v4;
    v6 = a1[10];
    if (v6)
      v7 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v6, *(void **)(v6 + 64), 90);
    else
      v7 = 0.0;
    objc_msgSend(a1, "_prepareTransitionFromPalette:toPalette:toPaletteFrame:", v3, v5, v7);

    v8 = (_QWORD *)a1[9];
    if (v8)
      v8 = (_QWORD *)v8[33];
    v13 = v8;
    v9 = (_QWORD *)a1[10];
    if (v9)
      v9 = (_QWORD *)v9[33];
    v10 = v9;
    v11 = a1[10];
    if (v11)
      v12 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v11, *(void **)(v11 + 72), 30);
    else
      v12 = 0.0;
    objc_msgSend(a1, "_prepareTransitionFromPalette:toPalette:toPaletteFrame:", v13, v10, v12);

  }
}

- (void)_animatePalettes
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD *v41;

  if (a1)
  {
    v2 = (_QWORD *)a1[9];
    if (v2)
      v2 = (_QWORD *)v2[32];
    v3 = v2;
    v4 = a1[9];
    if (v4)
    {
      v5 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v4, *(void **)(v4 + 64), 90);
      v7 = v6;
      v9 = v8;
      v11 = v10;
    }
    else
    {
      v7 = 0.0;
      v9 = 0.0;
      v11 = 0.0;
      v5 = 0.0;
    }
    v12 = (_QWORD *)a1[10];
    if (v12)
      v12 = (_QWORD *)v12[32];
    v13 = v12;
    v14 = a1[10];
    if (v14)
    {
      v15 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v14, *(void **)(v14 + 64), 90);
      v17 = v16;
      v19 = v18;
      v21 = v20;
    }
    else
    {
      v17 = 0.0;
      v19 = 0.0;
      v21 = 0.0;
      v15 = 0.0;
    }
    objc_msgSend(a1, "_animateFromPalette:fromPaletteFrame:toPalette:toPaletteFrame:", v3, v13, v5, v7, v9, v11, v15, v17, v19, v21);

    v22 = (_QWORD *)a1[9];
    if (v22)
      v22 = (_QWORD *)v22[33];
    v41 = v22;
    v23 = a1[9];
    if (v23)
    {
      v24 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v23, *(void **)(v23 + 72), 30);
      v26 = v25;
      v28 = v27;
      v30 = v29;
    }
    else
    {
      v26 = 0.0;
      v28 = 0.0;
      v30 = 0.0;
      v24 = 0.0;
    }
    v31 = (_QWORD *)a1[10];
    if (v31)
      v31 = (_QWORD *)v31[33];
    v32 = v31;
    v33 = a1[10];
    if (v33)
    {
      v34 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](v33, *(void **)(v33 + 72), 30);
      v36 = v35;
      v38 = v37;
      v40 = v39;
    }
    else
    {
      v36 = 0.0;
      v38 = 0.0;
      v40 = 0.0;
      v34 = 0.0;
    }
    objc_msgSend(a1, "_animateFromPalette:fromPaletteFrame:toPalette:toPaletteFrame:", v41, v32, v24, v26, v28, v30, v34, v36, v38, v40);

  }
}

- (unint64_t)_animationOptions
{
  if (-[UINavigationBar _canPreemptTransition](self->_navigationBar, "_canPreemptTransition"))
    return 327746;
  else
    return 327744;
}

- (void)_animateAsTwoPartsWithOverlap:(double)a3 partOne:(id)a4 partTwo:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  double v14;

  v8 = (unint64_t)a4;
  v9 = (unint64_t)a5;
  if (v8 | v9)
  {
    v10 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83___UINavigationBarTransitionContext__animateAsTwoPartsWithOverlap_partOne_partTwo___block_invoke;
    v11[3] = &unk_1E16B63A0;
    v11[4] = self;
    v12 = (id)v8;
    v14 = a3 * 0.5;
    v13 = (id)v9;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v10, v11, 0, 0.0, 0.0);

  }
}

- (void)_animateInProcessAsTwoPartsWithKeyframeID:(id)a3 overlap:(double)a4 partOne:(id)a5 partTwo:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[4];
  id v15;
  _UINavigationBarTransitionContext *v16;
  id v17;
  id v18;
  double v19;

  v10 = a3;
  v11 = (unint64_t)a5;
  v12 = (unint64_t)a6;
  if (v11 | v12)
  {
    v13 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103___UINavigationBarTransitionContext__animateInProcessAsTwoPartsWithKeyframeID_overlap_partOne_partTwo___block_invoke;
    v14[3] = &unk_1E16B63C8;
    v17 = (id)v11;
    v15 = v10;
    v16 = self;
    v19 = a4 * 0.5;
    v18 = (id)v12;
    +[UIView _animateInProcessKeyframesAlongsideTransitionWithOptions:animations:](UIView, "_animateInProcessKeyframesAlongsideTransitionWithOptions:animations:", v13, v14);

  }
}

- (void)_animateAsTwoPartsWithOverlapIfNecessaryPartOne:(id)a3 partTwo:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);

  v7 = (void (**)(_QWORD))a3;
  v6 = (void (**)(_QWORD))a4;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlap:partOne:partTwo:](self, "_animateAsTwoPartsWithOverlap:partOne:partTwo:", v7, v6, self->_twoPartAnimationOverlapDuration);
  }
  else
  {
    if (v7)
      v7[2](v7);
    if (v6)
      v6[2](v6);
  }

}

- (void)_animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:(id)a3 fractionComplete:(double)a4 partOne:(id)a5 partTwo:(id)a6
{
  void (**v10)(_QWORD, double);
  void (**v11)(_QWORD, double);
  id v12;

  v12 = a3;
  v10 = (void (**)(_QWORD, double))a5;
  v11 = (void (**)(_QWORD, double))a6;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    -[_UINavigationBarTransitionContext _animateInProcessAsTwoPartsWithKeyframeID:overlap:partOne:partTwo:](self, "_animateInProcessAsTwoPartsWithKeyframeID:overlap:partOne:partTwo:", v12, v10, v11, self->_twoPartAnimationOverlapDuration);
  }
  else
  {
    if (v10)
      v10[2](v10, a4);
    if (v11)
      v11[2](v11, a4);
  }

}

- (void)_animateAsTwoPartsWithoutOverlap:(id)a3 partTwo:(id)a4
{
  -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlap:partOne:partTwo:](self, "_animateAsTwoPartsWithOverlap:partOne:partTwo:", a3, a4, -0.7);
}

- (void)_updateIncomingLayoutWidthToMatchOutgoingLayout
{
  _UINavigationBarLayout *toLayout;
  double width;
  double height;
  _UINavigationBarLayout *fromLayout;

  toLayout = self->_toLayout;
  width = 0.0;
  height = 0.0;
  if (toLayout)
    height = toLayout->_layoutSize.height;
  fromLayout = self->_fromLayout;
  if (fromLayout)
    width = fromLayout->_layoutSize.width;
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)toLayout, width, height);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  self->_navigationBar = (UINavigationBar *)a3;
}

- (_UINavigationBarItemStack)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (int64_t)apiVersion
{
  return self->_apiVersion;
}

- (void)setApiVersion:(int64_t)a3
{
  self->_apiVersion = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void)setBackgroundAlpha:(double)a3
{
  self->_backgroundAlpha = a3;
}

- (_UINavigationBarModernPromptView)promptView
{
  return self->_promptView;
}

- (void)setPromptView:(id)a3
{
  objc_storeStrong((id *)&self->_promptView, a3);
}

- (_UINavigationBarContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (_UIBarBackground)backgroundView
{
  return self->_backgroundView;
}

- (_UINavigationBarLargeTitleView)largeTitleView
{
  return self->_largeTitleView;
}

- (void)setLargeTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleView, a3);
}

- (UIView)tabBarHostedView
{
  return self->_tabBarHostedView;
}

- (void)setTabBarHostedView:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarHostedView, a3);
}

- (CGPoint)startingContentOffsetForObservedScrollView
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingContentOffsetForObservedScrollView.x;
  y = self->_startingContentOffsetForObservedScrollView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingContentOffsetForObservedScrollView:(CGPoint)a3
{
  self->_startingContentOffsetForObservedScrollView = a3;
}

- (_UINavigationBarLayout)fromLayout
{
  return self->_fromLayout;
}

- (void)setFromLayout:(id)a3
{
  objc_storeStrong((id *)&self->_fromLayout, a3);
}

- (_UINavigationBarLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
  objc_storeStrong((id *)&self->_toLayout, a3);
}

- (UIView)transitionOverlayView
{
  return self->_transitionOverlayView;
}

- (void)setTransitionOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_clippingViews, 0);
  objc_storeStrong((id *)&self->_toLargeTitleLayout, 0);
  objc_storeStrong((id *)&self->_fromLargeTitleLayout, 0);
  objc_storeStrong((id *)&self->_toContentLayout, 0);
  objc_storeStrong((id *)&self->_fromContentLayout, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_storeStrong((id *)&self->_tabBarHostedView, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
