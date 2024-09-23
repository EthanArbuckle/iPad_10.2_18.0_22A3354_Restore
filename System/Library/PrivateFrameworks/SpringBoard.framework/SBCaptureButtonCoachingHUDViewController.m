@implementation SBCaptureButtonCoachingHUDViewController

- (SBCaptureButtonCoachingHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBCaptureButtonCoachingHUDViewController *v4;
  SBCaptureButtonCoachingHUDViewController *v5;
  void *v6;
  uint64_t v7;
  SBSystemActionCoachingSettings *settings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  v4 = -[SBCaptureButtonCoachingHUDViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_rotating = 0;
    v4->_stateTransitionAnimationCount = 0;
    v4->_state = 0;
    +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coachingSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBSystemActionCoachingSettings *)v7;

    v5->_coachingLabelTextNeedsUpdate = 1;
    v5->_coachingLabelOrientation = 1;
    -[SBCaptureButtonCoachingHUDViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v5);
  }
  return v5;
}

- (void)setCoachingText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeState:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *coachingText;
  NSString *v12;
  NSString *glyphPackageName;
  NSString *v14;
  NSString *glyphLandscapeState;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = (NSString *)objc_msgSend(a3, "copy");
  coachingText = self->_coachingText;
  self->_coachingText = v10;

  v12 = (NSString *)objc_msgSend(v9, "copy");
  glyphPackageName = self->_glyphPackageName;
  self->_glyphPackageName = v12;

  v14 = (NSString *)objc_msgSend(v8, "copy");
  glyphLandscapeState = self->_glyphLandscapeState;
  self->_glyphLandscapeState = v14;

  self->_coachingLabelTextNeedsUpdate = 1;
  -[SBCaptureButtonCoachingHUDViewController viewIfLoaded](self, "viewIfLoaded");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  NSString *glyphLandscapeState;
  dispatch_time_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;
  _QWORD v22[6];
  _QWORD block[5];

  v5 = a4;
  v8 = a5;
  -[SBCaptureButtonCoachingHUDViewController _animationSettingsForTransitionFromState:toState:]((id *)&self->super.super.super.super.isa, self->_state, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  if (a3 && !self->_state)
  {
    if ((unint64_t)(self->_coachingLabelOrientation - 3) > 1)
      glyphLandscapeState = 0;
    else
      glyphLandscapeState = self->_glyphLandscapeState;
    -[SBCaptureButtonCoachingHUDViewController _resetGlyphViewToState:]((uint64_t)self, glyphLandscapeState);
    v12 = dispatch_time(0, 100000000);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);
    -[SBOrientationTransformWrapperViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    -[SBOrientationTransformWrapperViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutIfNeeded");

    -[SBCaptureButtonCoachingHUDViewController setIsAttached:]((uint64_t)self, 1);
  }
  if (v5)
    v15 = 3;
  else
    v15 = 2;
  self->_state = a3;
  ++self->_stateTransitionAnimationCount;
  -[SBCaptureButtonCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "captureButtonCoachingHUDViewController:didBeginTransitionToState:", self, a3);

  v17 = (void *)MEMORY[0x1E0CEABB0];
  v21 = a3;
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_2;
  v22[3] = &unk_1E8E9DE88;
  v22[4] = self;
  v22[5] = a3;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_13;
  v19[3] = &unk_1E8E9E7F8;
  v19[4] = self;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v9, v15, v22, v19);

}

- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:
{
  id v3;

  if (a1)
  {
    if (a3 == 2)
    {
      objc_msgSend(a1[127], "expansionSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 1)
    {
      v3 = a1[127];
      if (a2 == 2)
        objc_msgSend(v3, "contractionSettings");
      else
        objc_msgSend(v3, "presentationSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
        return (id *)0;
      objc_msgSend(a1[127], "dismissalSettings");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_resetGlyphViewToState:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    v3 = *(void **)(a1 + 1096);
    v4 = a2;
    objc_msgSend(v3, "setState:animated:", 0, 0);
    objc_msgSend(*(id *)(a1 + 1096), "removeFromSuperview");
    v5 = *(void **)(a1 + 1096);
    *(_QWORD *)(a1 + 1096) = 0;

    -[SBCaptureButtonCoachingHUDViewController _makeGlyphView]((SBCaptureButtonCoachingHUDGlyphView *)a1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 1096);
    *(_QWORD *)(a1 + 1096) = v6;

    objc_msgSend(*(id *)(a1 + 1112), "addSubview:", *(_QWORD *)(a1 + 1096));
    -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView]((id *)a1);
    objc_msgSend(*(id *)(a1 + 1096), "setState:animated:", v4, 0);

    objc_msgSend(*(id *)(a1 + 1096), "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonCoachingHUDViewController _resetAndPauseTimingOnLayerTree:](a1, v8);

  }
}

void __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v1 + 1096), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](v1, v2);

}

- (void)_playTimingOnLayerTree:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    -[SBCaptureButtonCoachingHUDViewController _resumeLayer:](a1, v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "sublayers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](a1, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setIsAttached:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 994) != a2)
    {
      *(_BYTE *)(a1 + 994) = a2;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 968));
      objc_msgSend(WeakRetained, "updateAttachmentStateForHUDViewController:", a1);

    }
  }
}

- (void)_updateCoachingLabelTextIfNeeded
{
  void *v2;
  void *v3;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 993))
    {
      objc_msgSend((id)a1, "viewIfLoaded");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        if (*(_QWORD *)(a1 + 1008) || !*(_QWORD *)(a1 + 1032))
        {
          objc_msgSend(*(id *)(a1 + 1120), "setText:", *(_QWORD *)(a1 + 1040));
          *(_BYTE *)(a1 + 993) = 0;
        }
      }
    }
  }
}

void __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  id v12;

  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingContentView](*(_QWORD *)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingButtonHighlight](*(id **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabelWrapperView](*(void **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel](*(id **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView](*(id **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if (v2 && (unint64_t)(*(_QWORD *)(v2 + 1008) - 1) <= 1)
  {
    if (*(_BYTE *)(v2 + 992))
      v3 = 0.0;
    else
      v3 = 1.0;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4)
      return;
    objc_msgSend(*(id *)(v2 + 1080), "setAlpha:", 0.0);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 1088);
    objc_msgSend(*(id *)(v9 + 1072), "bounds");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setAlpha:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &unk_1E91CF928;
  }
  else
  {
    v5 = *(void **)(v2 + 1080);
    objc_msgSend(*(id *)(v2 + 1016), "dimmingAlpha");
    objc_msgSend(v5, "setAlpha:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setAlpha:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &unk_1E91CF938;
  }
  objc_msgSend(v6, "setValue:forKeyPath:", v8, CFSTR("filters.gaussianBlur.inputRadius"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = v3;
  objc_msgSend(v12, "setShadowOpacity:", v11);

}

- (uint64_t)_layoutCoachingContentView
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 1072), "bounds");
    v2 = *(void **)(v1 + 1088);
    UIRectGetCenter();
    objc_msgSend(v2, "setCenter:");
    v3 = *(void **)(v1 + 1088);
    BSRectWithSize();
    return objc_msgSend(v3, "setBounds:");
  }
  return result;
}

- (id)_layoutCoachingButtonHighlight
{
  id *v1;
  void *v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    v3 = -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(v1[134], "bounds");
    v17.origin.x = v3;
    v17.origin.y = v5;
    v17.size.width = v7;
    v17.size.height = v9;
    CGRectGetHeight(v17);
    v18.origin.x = v3;
    v18.origin.y = v5;
    v18.size.width = v7;
    v18.size.height = v9;
    CGRectGetMinY(v18);
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v16, 0, sizeof(v16));
    v10 = v1[126];
    v11 = 0.0;
    if (v10 == (id)2)
      v11 = -2.0;
    if (!v10)
      v11 = -3.0;
    CGAffineTransformMakeTranslation(&v16, v11, 0.0);
    v12 = v1[138];
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    v13 = v1[138];
    BSRectWithSize();
    objc_msgSend(v13, "setBounds:");
    v14 = v1[138];
    v15 = v16;
    return (id *)objc_msgSend(v14, "setTransform:", &v15);
  }
  return result;
}

- (void)_layoutCoachingLabelWrapperView
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  CGFloat v8;
  double v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);
    -[SBCaptureButtonCoachingHUDViewController _coachingLabelWrapperViewSize](v1);
    v4 = v3;
    v6 = v5;
    objc_msgSend(*((id *)v1 + 134), "bounds");
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v26, 0, sizeof(v26));
    v7 = *((_QWORD *)v1 + 126);
    v8 = 0.0;
    if (v7 <= 2)
      v8 = dbl_1D0E8B3E0[v7];
    CGAffineTransformMakeScale(&v26, v8, v8);
    memset(&v25, 0, sizeof(v25));
    v9 = -2.0;
    if (v7 != 2)
      v9 = 0.0;
    if (!v7)
      v9 = -3.0;
    CGAffineTransformMakeTranslation(&v25, v9, 0.0);
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v24.c = v10;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&t1.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tx = *(_OWORD *)&v24.tx;
    t2 = v26;
    CGAffineTransformConcat(&v24, &t1, &t2);
    t2 = v24;
    v22 = v25;
    CGAffineTransformConcat(&t1, &t2, &v22);
    *(_OWORD *)&v24.tx = *(_OWORD *)&t1.tx;
    UIRectGetCenter();
    v12 = v11;
    v14 = v13;
    objc_msgSend(*((id *)v1 + 139), "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anchorPoint");
    v17 = v16;
    v19 = v18;

    objc_msgSend(*((id *)v1 + 139), "setCenter:", v12 + (v17 + -0.5) * v4, v14 + (v19 + -0.5) * v6);
    v20 = (void *)*((_QWORD *)v1 + 139);
    BSRectWithSize();
    objc_msgSend(v20, "setBounds:");
    v21 = (void *)*((_QWORD *)v1 + 139);
    v26 = t1;
    return (void *)objc_msgSend(v21, "setTransform:", &v26);
  }
  return result;
}

- (id)_layoutCoachingLabel
{
  id *v1;
  void *v2;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  id v14;
  id v15;
  id v16;
  CGFloat tx;
  CGFloat ty;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    objc_msgSend(v1[139], "bounds");
    v3 = v1[140];
    -[SBCaptureButtonCoachingHUDViewController _coachingLabelWrapperViewSize](v1);
    objc_msgSend(v3, "sizeThatFits:");
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    memset(&v25, 0, sizeof(v25));
    SBFTransformFromOrientationToOrientation();
    memset(&v24, 0, sizeof(v24));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v24, v12, 0.0);
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t1.c = v13;
    *(_OWORD *)&t1.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    t2 = v25;
    CGAffineTransformConcat(&v21, &t1, &t2);
    v22 = *(_OWORD *)&v21.a;
    v23 = *(_OWORD *)&v21.c;
    t1 = v21;
    t2 = v24;
    CGAffineTransformConcat(&v21, &t1, &t2);
    v23 = *(_OWORD *)&v21.c;
    tx = v21.tx;
    ty = v21.ty;
    v25 = v21;
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.width = v9;
    v26.size.height = v11;
    CGRectApplyAffineTransform(v26, &v25);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    v14 = v1[140];
    UIRectGetCenter();
    objc_msgSend(v14, "setCenter:");
    v15 = v1[140];
    BSRectWithSize();
    objc_msgSend(v15, "setBounds:");
    v16 = v1[140];
    *(_OWORD *)&v25.a = *(_OWORD *)&v21.a;
    *(_OWORD *)&v25.c = *(_OWORD *)&v21.c;
    v25.tx = tx;
    v25.ty = ty;
    objc_msgSend(v16, "setTransform:", &v25);
    return (id *)objc_msgSend(v1[140], "setTextAlignment:", 2 * ((char *)v1[133] - 3 > (char *)1));
  }
  return result;
}

- (id)_layoutGlyphView
{
  id *v1;
  void *v2;
  double v3;
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  id v15;
  id v16;
  id v17;
  CGFloat tx;
  CGFloat ty;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    objc_msgSend(v1[139], "bounds");
    objc_msgSend(v1[140], "bounds");
    objc_msgSend(v1[140], "bounds");
    v4 = v1[133];
    if (v4 != (id)4 && v4 != (id)3)
      objc_msgSend(v1[140], "bounds", (v3 + -40.0) * 0.5);
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    memset(&v26, 0, sizeof(v26));
    SBFTransformFromOrientationToOrientation();
    memset(&v25, 0, sizeof(v25));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v25, v13, 0.0);
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    t2 = v26;
    CGAffineTransformConcat(&v22, &t1, &t2);
    v23 = *(_OWORD *)&v22.a;
    v24 = *(_OWORD *)&v22.c;
    t1 = v22;
    t2 = v25;
    CGAffineTransformConcat(&v22, &t1, &t2);
    v23 = *(_OWORD *)&v22.a;
    tx = v22.tx;
    ty = v22.ty;
    v26 = v22;
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    CGRectApplyAffineTransform(v27, &v26);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    v15 = v1[137];
    UIRectGetCenter();
    objc_msgSend(v15, "setCenter:");
    v16 = v1[137];
    BSRectWithSize();
    objc_msgSend(v16, "setBounds:");
    v17 = v1[137];
    *(_OWORD *)&v26.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v26.c = *(_OWORD *)&v22.c;
    v26.tx = tx;
    v26.ty = ty;
    return (id *)objc_msgSend(v17, "setTransform:", &v26);
  }
  return result;
}

- (double)_viewContentAlphaForCurrentState
{
  double result;

  result = 0.0;
  if (a1 && (unint64_t)(*(_QWORD *)(a1 + 1008) - 1) <= 1 && !*(_BYTE *)(a1 + 992))
    return 1.0;
  return result;
}

uint64_t __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_13(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  --*(_QWORD *)(a1[4] + 1032);
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 1032) || (v3 = *(_QWORD *)(v2 + 1008), v3 != a1[6]))
  {
    v4 = 0;
  }
  else
  {
    if (!v3)
      -[SBCaptureButtonCoachingHUDViewController setIsAttached:](v2, 0);
    v4 = 1;
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *contentView;
  UIView *v6;
  UIView *dimmingView;
  id v8;
  UIView *v9;
  UIView *coachingContentView;
  void *v11;
  void *v12;
  void *v13;
  SBCaptureButtonCoachingHUDButtonHighlight *v14;
  SBCaptureButtonCoachingHUDButtonHighlight *coachingButtonHighlightView;
  SBCaptureButtonCoachingHUDLabelWrapperView *v16;
  SBCaptureButtonCoachingHUDLabelWrapperView *coachingLabelWrapperView;
  SBCaptureButtonCoachingHUDLabel *v18;
  SBCaptureButtonCoachingHUDLabel *coachingLabel;
  SBCaptureButtonCoachingHUDGlyphView *v20;
  SBCaptureButtonCoachingHUDGlyphView *glyphView;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  -[SBCaptureButtonCoachingHUDViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[SBOrientationTransformWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCounterTransformView:", 1);
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  -[SBSystemActionCoachingHUDViewController _makeContentView](self);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;

  objc_msgSend(v3, "addContentView:", self->_contentView);
  -[SBSystemActionCoachingHUDViewController _makeDimmingView]((uint64_t)self);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v6;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_dimmingView);
  v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIView bounds](self->_contentView, "bounds");
  v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
  coachingContentView = self->_coachingContentView;
  self->_coachingContentView = v9;

  -[UIView layer](self->_coachingContentView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonCoachingHUDViewController _makeGaussianBlurFilter]((uint64_t)self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilters:", v13);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_coachingContentView);
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingButtonHighlight]((uint64_t)self);
  v14 = (SBCaptureButtonCoachingHUDButtonHighlight *)objc_claimAutoreleasedReturnValue();
  coachingButtonHighlightView = self->_coachingButtonHighlightView;
  self->_coachingButtonHighlightView = v14;

  -[UIView addSubview:](self->_coachingContentView, "addSubview:", self->_coachingButtonHighlightView);
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingLabelWrapperView]((uint64_t)self);
  v16 = (SBCaptureButtonCoachingHUDLabelWrapperView *)objc_claimAutoreleasedReturnValue();
  coachingLabelWrapperView = self->_coachingLabelWrapperView;
  self->_coachingLabelWrapperView = v16;

  -[UIView addSubview:](self->_coachingContentView, "addSubview:", self->_coachingLabelWrapperView);
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingLabel]((uint64_t)self);
  v18 = (SBCaptureButtonCoachingHUDLabel *)objc_claimAutoreleasedReturnValue();
  coachingLabel = self->_coachingLabel;
  self->_coachingLabel = v18;

  -[SBCaptureButtonCoachingHUDLabelWrapperView addSubview:](self->_coachingLabelWrapperView, "addSubview:", self->_coachingLabel);
  -[SBCaptureButtonCoachingHUDViewController _makeGlyphView]((SBCaptureButtonCoachingHUDGlyphView *)self);
  v20 = (SBCaptureButtonCoachingHUDGlyphView *)objc_claimAutoreleasedReturnValue();
  glyphView = self->_glyphView;
  self->_glyphView = v20;

  -[SBCaptureButtonCoachingHUDLabelWrapperView addSubview:](self->_coachingLabelWrapperView, "addSubview:", self->_glyphView);
}

- (id)_makeGaussianBlurFilter
{
  void *v1;
  uint64_t v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v1, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
    objc_msgSend(v1, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D60]);
    objc_msgSend(v1, "setValue:forKey:", &unk_1E91CF928, *MEMORY[0x1E0CD2D90]);
    v2 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v1, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D70]);
    objc_msgSend(v1, "setValue:forKey:", v2, *MEMORY[0x1E0CD2D58]);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (SBCaptureButtonCoachingHUDButtonHighlight)_makeCoachingButtonHighlight
{
  SBCaptureButtonCoachingHUDButtonHighlight *v2;
  SBCaptureButtonCoachingHUDButtonHighlight *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;

  if (a1)
  {
    v2 = [SBCaptureButtonCoachingHUDButtonHighlight alloc];
    v3 = -[SBCaptureButtonCoachingHUDButtonHighlight initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SBCaptureButtonCoachingHUDButtonHighlight setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("capture-button-coaching-button"));
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonCoachingHUDButtonHighlight setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SBCaptureButtonCoachingHUDButtonHighlight layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    LODWORD(v7) = 0;
    objc_msgSend(v5, "setShadowOpacity:", v7);
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);
    objc_msgSend(*(id *)(a1 + 1016), "coachingButtonShadowRadius");
    objc_msgSend(v5, "setShadowRadius:");
    objc_msgSend(v5, "setCornerRadius:", 2.5);
    objc_msgSend(v5, "setAnchorPoint:", 1.0, 0.5);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SBCaptureButtonCoachingHUDLabelWrapperView)_makeCoachingLabelWrapperView
{
  SBCaptureButtonCoachingHUDLabelWrapperView *v2;
  SBCaptureButtonCoachingHUDLabelWrapperView *v3;
  SBCaptureButtonCoachingHUDLabelWrapperView *v4;
  double v5;
  void *v6;

  if (a1)
  {
    v2 = [SBCaptureButtonCoachingHUDLabelWrapperView alloc];
    v3 = -[SBCaptureButtonCoachingHUDLabelWrapperView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v4 = v3;
    v5 = 0.0;
    if ((unint64_t)(*(_QWORD *)(a1 + 1008) - 1) <= 1 && !*(_BYTE *)(a1 + 992))
      v5 = 1.0;
    -[SBCaptureButtonCoachingHUDLabelWrapperView setAlpha:](v3, "setAlpha:", v5);
    -[SBCaptureButtonCoachingHUDLabelWrapperView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnchorPoint:", 1.0, 0.5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SBCaptureButtonCoachingHUDLabel)_makeCoachingLabel
{
  SBCaptureButtonCoachingHUDLabel *v2;
  SBCaptureButtonCoachingHUDLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;

  if (a1)
  {
    v2 = [SBCaptureButtonCoachingHUDLabel alloc];
    v3 = -[SBCaptureButtonCoachingHUDLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SBCaptureButtonCoachingHUDLabel setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("capture-button-coaching-label"));
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 19.0, *MEMORY[0x1E0CEB5F0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonCoachingHUDLabel setFont:](v3, "setFont:", v4);

    -[SBCaptureButtonCoachingHUDLabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
    -[SBCaptureButtonCoachingHUDLabel setTextAlignment:](v3, "setTextAlignment:", 2);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonCoachingHUDLabel setTextColor:](v3, "setTextColor:", v5);

    -[SBCaptureButtonCoachingHUDLabel layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(*(id *)(a1 + 1016), "coachingLabelShadowOpacity");
    *(float *)&v8 = v8;
    objc_msgSend(v6, "setShadowOpacity:", v8);
    objc_msgSend(*(id *)(a1 + 1016), "coachingLabelShadowRadius");
    objc_msgSend(v6, "setShadowRadius:");

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SBCaptureButtonCoachingHUDGlyphView)_makeGlyphView
{
  SBCaptureButtonCoachingHUDGlyphView *v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    if (a1[2].super.super._subviewCache)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "URLForResource:withExtension:", v1[2].super.super._subviewCache, CFSTR("ca"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = -[BSUICAPackageView initWithURL:]([SBCaptureButtonCoachingHUDGlyphView alloc], "initWithURL:", v3);
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  -[SBCaptureButtonCoachingHUDViewController viewIsAppearing:](&v8, sel_viewIsAppearing_, a3);
  -[SBOrientationTransformWrapperViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  objc_msgSend(v4, "setContainerOrientation:", v6);
  objc_msgSend(v4, "setContentOrientation:", 1);
  if (self && self->_coachingLabelOrientation != v6)
  {
    self->_coachingLabelOrientation = v6;
    if ((unint64_t)(v6 - 3) < 2)
      v7 = 1;
    else
      v7 = 4;
    -[SBCaptureButtonCoachingHUDLabel setTextAlignment:](self->_coachingLabel, "setTextAlignment:", v7);
  }
  -[SBCaptureButtonCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
  -[SBCaptureButtonCoachingHUDViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 0, 0, 0);

}

- (uint64_t)setCoachingLabelOrientation:(uint64_t)result
{
  uint64_t v2;

  if (result && *(_QWORD *)(result + 1064) != a2)
  {
    *(_QWORD *)(result + 1064) = a2;
    if ((unint64_t)(a2 - 3) < 2)
      v2 = 1;
    else
      v2 = 4;
    return objc_msgSend(*(id *)(result + 1120), "setTextAlignment:", v2);
  }
  return result;
}

- (void)_updateLiveRenderingAssertionIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = objc_msgSend(a1, "_appearState") != 0;
    else
      v5 = 0;
    v6 = a1[128];
    if (v6)
    {
      v7 = objc_msgSend(a1[128], "isAcquired");
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v7 = 0;
      if (!v5)
        goto LABEL_11;
    }
    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1[128], "invalidate");
      v8 = (void *)MEMORY[0x1E0D00F48];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", v4, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acquireWithExplanation:observer:attributes:", v10, 0, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[128];
      a1[128] = (id)v15;

LABEL_16:
      return;
    }
LABEL_11:
    if (v6)
      v17 = v5;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      objc_msgSend(a1[128], "invalidate");
      v18 = a1[128];
      a1[128] = 0;

    }
    goto LABEL_16;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  -[SBCaptureButtonCoachingHUDViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBCaptureButtonCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  -[SBCaptureButtonCoachingHUDViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBCaptureButtonCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutDimmingView]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingContentView]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingButtonHighlight]((id *)&self->super.super.super.super.isa);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabelWrapperView](self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel]((id *)&self->super.super.super.super.isa);
  -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView]((id *)&self->super.super.super.super.isa);
}

- (uint64_t)_layoutDimmingView
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 1072), "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = *(void **)(v1 + 1080);
    UIRectGetCenter();
    objc_msgSend(v10, "setCenter:");
    return objc_msgSend(*(id *)(v1 + 1080), "setBounds:", v3, v5, v7, v9);
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  _QWORD v13[6];
  _QWORD v14[5];
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  v7 = a4;
  -[SBCaptureButtonCoachingHUDViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "captureButtonCoachingHUDViewControllerWillRotate:", self);

  self->_rotating = 1;
  SBFWindowForViewControllerTransition();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_toWindowOrientation");

  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E8E9DED8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.2);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E8EB6F60;
  v13[4] = self;
  v13[5] = v10;
  v12[0] = v11;
  v12[1] = 3221225472;
  v12[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v12[3] = &unk_1E8EAC0A0;
  v12[4] = self;
  v12[5] = v10;
  v12[6] = 0x3FC999999999999ALL;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);

}

uint64_t __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 0.0;
  if ((unint64_t)(*(_QWORD *)(v1 + 1008) - 1) <= 1 && !*(_BYTE *)(v1 + 992))
    v2 = 1.0;
  return objc_msgSend(*(id *)(v1 + 1088), "setAlpha:", v2);
}

void __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContainerOrientation:", *(_QWORD *)(a1 + 40));

}

uint64_t __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  _QWORD v11[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 992) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if ((unint64_t)(*(_QWORD *)(a1 + 40) - 3) > 1)
    v3 = 0;
  else
    v3 = *(void **)(v2 + 1056);
  -[SBCaptureButtonCoachingHUDViewController _resetGlyphViewToState:](v2, v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v4 + 1064) != v5)
    {
      *(_QWORD *)(v4 + 1064) = v5;
      if ((unint64_t)(v5 - 3) < 2)
        v6 = 1;
      else
        v6 = 4;
      objc_msgSend(*(id *)(v4 + 1120), "setTextAlignment:", v6);
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel]((id *)v4);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  v9 = *(double *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v11[3] = &unk_1E8E9DED8;
  v11[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v11, v9);
}

void __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if ((unint64_t)(*(_QWORD *)(v2 + 1008) - 1) <= 1 && !*(_BYTE *)(v2 + 992))
    v3 = 1.0;
  objc_msgSend(*(id *)(v2 + 1088), "setAlpha:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v4 + 1096), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](v4, v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)physicalButtonSceneTargets
{
  return 0;
}

- (BOOL)definesAnimatedDismissal
{
  return 1;
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
  -[SBCaptureButtonCoachingHUDViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 0, 1, a3);
}

- (int64_t)triggerButton
{
  return 9;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 0;
}

- (BOOL)isHUDAttached
{
  return self->_isAttached;
}

- (void)setPositionOffset:(CGPoint)a3
{
  UIView *coachingContentView;
  CGAffineTransform v5;

  if (self->_positionOffset.x != a3.x || self->_positionOffset.y != a3.y)
  {
    self->_positionOffset = a3;
    coachingContentView = self->_coachingContentView;
    CGAffineTransformMakeTranslation(&v5, -a3.x, -a3.y);
    -[UIView setTransform:](coachingContentView, "setTransform:", &v5);
  }
}

- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController
{
  if (a1)
    a1 = -[SBUIAnimationPropertyAnimator initWithPropertyAnimatorGenerator:]([SBUIAnimationPropertyAnimator alloc], "initWithPropertyAnimatorGenerator:", &__block_literal_global_310);
  return a1;
}

- (void)_resetAndPauseTimingOnLayerTree:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    -[SBCaptureButtonCoachingHUDViewController _pauseAndResetLayer:](a1, v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "sublayers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[SBCaptureButtonCoachingHUDViewController _resetAndPauseTimingOnLayerTree:](a1, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_pauseAndResetLayer:(uint64_t)a1
{
  double v2;
  double v3;
  id v4;

  if (a1)
  {
    v4 = a2;
    objc_msgSend(v4, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v3 = v2;
    LODWORD(v2) = 0;
    objc_msgSend(v4, "setSpeed:", v2);
    objc_msgSend(v4, "setTimeOffset:", v3);
    objc_msgSend(v4, "setTimeOffset:", 0.0);

  }
}

- (void)_resumeLayer:(uint64_t)a1
{
  double v2;
  double v3;
  double v4;
  id v5;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "timeOffset");
    v3 = v2;
    LODWORD(v2) = 1.0;
    objc_msgSend(v5, "setSpeed:", v2);
    objc_msgSend(v5, "setTimeOffset:", 0.0);
    objc_msgSend(v5, "setBeginTime:", 0.0);
    objc_msgSend(v5, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    objc_msgSend(v5, "setBeginTime:", v4 - v3);

  }
}

id __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2;
  v11[3] = &unk_1E8E9DED8;
  v5 = v2;
  v12 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithDuration:curve:animations:", 3, v11, 0.001);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3;
  v9[3] = &unk_1E8EA2880;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "addCompletion:", v9);

  return v6;
}

void __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  objc_msgSend(v2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (double)_xTranslationTransformForCurrentState
{
  uint64_t v2;
  double v3;
  double result;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1008);
    v3 = 0.0;
    if (v2 == 2)
      v3 = -2.0;
    if (!v2)
      v3 = -3.0;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, v3, 0.0);
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

- (double)_captureButtonFrame
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return *MEMORY[0x1E0C9D648];
  +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel](SBButtonBezelGeometryInfo, "buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonHWRectForButton:inView:", 9, v6);
  v8 = v7;

  return v8;
}

- (void)_coachingLabelWrapperViewSize
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");

    objc_msgSend(v1, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");

    objc_msgSend(v1, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");

    objc_msgSend(v1, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");

    objc_msgSend(v1, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    if ((unint64_t)(v5 - 1) <= 1)
      -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);

    BSFloatRoundForScale();
    return (void *)BSFloatRoundForScale();
  }
  return result;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  return (SBHUDAttachmentDelegate *)objc_loadWeakRetained((id *)&self->_attachmentDelegate);
}

- (void)setAttachmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentDelegate, a3);
}

- (SBCaptureButtonCoachingHUDViewControllerDelegate)delegate
{
  return (SBCaptureButtonCoachingHUDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (uint64_t)settings
{
  if (result)
    return *(_QWORD *)(result + 1016);
  return result;
}

- (uint64_t)liveRenderingAssertion
{
  if (result)
    return *(_QWORD *)(result + 1024);
  return result;
}

- (BOOL)isRotating
{
  if (result)
    return *(_BYTE *)(result + 992) != 0;
  return result;
}

- (uint64_t)stateTransitionAnimationCount
{
  if (result)
    return *(_QWORD *)(result + 1032);
  return result;
}

- (BOOL)coachingLabelTextNeedsUpdate
{
  if (result)
    return *(_BYTE *)(result + 993) != 0;
  return result;
}

- (uint64_t)coachingText
{
  if (result)
    return *(_QWORD *)(result + 1040);
  return result;
}

- (uint64_t)glyphPackageName
{
  if (result)
    return *(_QWORD *)(result + 1048);
  return result;
}

- (uint64_t)glyphLandscapeState
{
  if (result)
    return *(_QWORD *)(result + 1056);
  return result;
}

- (uint64_t)coachingLabelOrientation
{
  if (result)
    return *(_QWORD *)(result + 1064);
  return result;
}

- (uint64_t)contentView
{
  if (result)
    return *(_QWORD *)(result + 1072);
  return result;
}

- (uint64_t)dimmingView
{
  if (result)
    return *(_QWORD *)(result + 1080);
  return result;
}

- (uint64_t)coachingContentView
{
  if (result)
    return *(_QWORD *)(result + 1088);
  return result;
}

- (uint64_t)glyphView
{
  if (result)
    return *(_QWORD *)(result + 1096);
  return result;
}

- (uint64_t)coachingButtonHighlightView
{
  if (result)
    return *(_QWORD *)(result + 1104);
  return result;
}

- (uint64_t)coachingLabelWrapperView
{
  if (result)
    return *(_QWORD *)(result + 1112);
  return result;
}

- (uint64_t)coachingLabel
{
  if (result)
    return *(_QWORD *)(result + 1120);
  return result;
}

- (BOOL)isAttached
{
  if (result)
    return *(_BYTE *)(result + 994) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabelWrapperView, 0);
  objc_storeStrong((id *)&self->_coachingButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_coachingContentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_glyphLandscapeState, 0);
  objc_storeStrong((id *)&self->_glyphPackageName, 0);
  objc_storeStrong((id *)&self->_coachingText, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

@end
