@implementation VKTextLiftingView

- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4
{
  return -[VKTextLiftingView initWithImage:cutoutPath:baselineAngle:](self, "initWithImage:cutoutPath:baselineAngle:", a3, a4, 0.0);
}

- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4 baselineAngle:(double)a5
{
  id v9;
  id v10;
  VKTextLiftingView *v11;
  VKTextLiftingView *v12;
  void *v13;
  id v14;
  UIVisualEffectView *v15;
  UIVisualEffectView *highlightView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImageView *imageView;
  void *v24;
  void *v25;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VKTextLiftingView;
  v11 = -[VKTextLiftingView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    objc_storeStrong((id *)&v12->_cutoutPath, a4);
    v12->_baselineAngle = a5;
    -[VKTextLiftingView layer](v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", 0.0, 15.0);
    objc_msgSend(v13, "setShadowRadius:", 45.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    v15 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABE8]);
    highlightView = v12->__highlightView;
    v12->__highlightView = v15;

    -[UIVisualEffectView setUserInteractionEnabled:](v12->__highlightView, "setUserInteractionEnabled:", 0);
    -[UIVisualEffectView layer](v12->__highlightView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsHitTesting:", 0);

    objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectBrightness:", 0.1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v12->__highlightView, "setBackgroundEffects:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](v12->__highlightView, "setBackgroundColor:", v20);

    -[UIVisualEffectView setAlpha:](v12->__highlightView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPath:", -[UIBezierPath CGPath](v12->_cutoutPath, "CGPath"));
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v12->_image);
    imageView = v12->__imageView;
    v12->__imageView = (UIImageView *)v22;

    -[UIImageView layer](v12->__imageView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMask:", v21);

    -[UIImageView layer](v12->__imageView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsEdgeAntialiasing:", 1);

    -[UIImageView setUserInteractionEnabled:](v12->__imageView, "setUserInteractionEnabled:", 1);
    -[UIImageView addSubview:](v12->__imageView, "addSubview:", v12->__highlightView);
    -[UIImageView bounds](v12->__imageView, "bounds");
    -[UIVisualEffectView setFrame:](v12->__highlightView, "setFrame:");
    v12->_maxScale = 1.0;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v12->_contentInsets.top = _Q0;
    *(_OWORD *)&v12->_contentInsets.bottom = _Q0;
    v12->_presentsMenuForLiftedText = 1;
    v12->_presentsQuickActions = 0;

  }
  return v12;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKTextLiftingView;
  -[VKTextLiftingView didMoveToSuperview](&v7, sel_didMoveToSuperview);
  -[VKTextLiftingView imageInteraction](self, "imageInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKTextLiftingView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VKTextLiftingView _applyInteractionToImageViewIfReady](self, "_applyInteractionToImageViewIfReady");
    }
    else
    {
      -[VKTextLiftingView _imageView](self, "_imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKTextLiftingView imageInteraction](self, "imageInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeInteraction:", v6);

    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  const CGPath *v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  char v17;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[UIImageView convertPoint:fromView:](self->__imageView, "convertPoint:fromView:", self);
  v8 = v7;
  v10 = v9;
  -[VKTextLiftingView hitTestPath](self, "hitTestPath");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const CGPath *)objc_msgSend(v11, "CGPath");
  v13 = objc_msgSend(v11, "usesEvenOddFillRule");
  v19.x = v8;
  v19.y = v10;
  v14 = CGPathContainsPoint(v12, 0, v19, v13);
  -[VKTextLiftingView actionInfoView](self, "actionInfoView");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    objc_msgSend((id)v15, "frame");
    v20.x = x;
    v20.y = y;
    LOBYTE(v15) = CGRectContainsPoint(v21, v20);
  }
  v17 = v14 | v15;

  return v17;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  _OWORD v12[6];

  -[VKTextLiftingView _contentBounds](self, "_contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKTextLiftingView _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenter:", VKMCenterOfRect(v4, v6, v8, v10));
  -[VKTextLiftingView _imageTransformInBounds:](self, "_imageTransformInBounds:", v4, v6, v8, v10);
  v12[0] = v12[3];
  v12[1] = v12[4];
  v12[2] = v12[5];
  objc_msgSend(v11, "setTransform:", v12);

}

- (UIBezierPath)hitTestPath
{
  UIBezierPath *hitTestPath;
  void *v4;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v9;
  CGFloat MidY;
  UIBezierPath *v11;
  UIBezierPath *v12;
  CGAffineTransform v14;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  hitTestPath = self->_hitTestPath;
  if (!hitTestPath)
  {
    -[VKTextLiftingView cutoutPath](self, "cutoutPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    v22 = CGRectInset(v21, -20.0, -20.0);
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, v22.size.width / width, v22.size.height / height);
    memset(&v19, 0, sizeof(v19));
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v9 = -CGRectGetMidX(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MidY = CGRectGetMidY(v24);
    CGAffineTransformMakeTranslation(&v19, v9, -MidY);
    memset(&v18, 0, sizeof(v18));
    t1 = v19;
    t2 = v20;
    CGAffineTransformConcat(&v17, &t1, &t2);
    t1 = v19;
    CGAffineTransformInvert(&v14, &t1);
    CGAffineTransformConcat(&v18, &v17, &v14);
    v11 = (UIBezierPath *)objc_msgSend(v4, "copy");
    t1 = v18;
    -[UIBezierPath applyTransform:](v11, "applyTransform:", &t1);
    v12 = self->_hitTestPath;
    self->_hitTestPath = v11;

    hitTestPath = self->_hitTestPath;
  }
  return hitTestPath;
}

- (void)setImageInteraction:(id)a3
{
  VKCImageAnalysisInteraction *v5;
  void *v6;
  void *v7;
  VKCImageAnalysisInteraction *v8;

  v5 = (VKCImageAnalysisInteraction *)a3;
  if (self->_imageInteraction != v5)
  {
    v8 = v5;
    -[VKTextLiftingView _imageView](self, "_imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_imageInteraction)
      objc_msgSend(v6, "removeInteraction:");
    objc_storeStrong((id *)&self->_imageInteraction, a3);
    -[VKTextLiftingView _applyInteractionToImageViewIfReady](self, "_applyInteractionToImageViewIfReady");

    v5 = v8;
  }

}

- (UIView)actionInfoView
{
  void *v2;
  void *v3;

  -[VKTextLiftingView imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionInfoViewIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  id v4;

  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    -[VKTextLiftingView imageInteraction](self, "imageInteraction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredQuickActionButtonHeight:", a3);

  }
}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  void *v4;
  id quickActionConfigurationUpdateHandler;

  if (self->_quickActionConfigurationUpdateHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
    self->_quickActionConfigurationUpdateHandler = v4;

    -[VKTextLiftingView _applyConfigurationUpdateHandlerToQuickActions](self, "_applyConfigurationUpdateHandlerToQuickActions");
  }
}

- (void)performLiftAnimation
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  _QWORD v22[9];
  _QWORD v23[5];
  CGAffineTransform v24;
  CGAffineTransform v25;

  if (!-[VKTextLiftingView _hasLifted](self, "_hasLifted"))
  {
    -[VKTextLiftingView _hasLifted:](self, "_hasLifted:", 1);
    -[VKTextLiftingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[VKTextLiftingView image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

    -[VKTextLiftingView _imageView](self, "_imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextLiftingView addSubview:](self, "addSubview:", v16);
    CGAffineTransformMakeScale(&v25, v8 / v13, v10 / v15);
    v24 = v25;
    objc_msgSend(v16, "setTransform:", &v24);
    objc_msgSend(v16, "setCenter:", VKMCenterOfRect(v4, v6, v8, v10));
    -[VKTextLiftingView setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextLiftingView _springAnimationForKeyPath:fromValue:toValue:](self, "_springAnimationForKeyPath:fromValue:toValue:", CFSTR("shadowOpacity"), &unk_1E94951F8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKTextLiftingView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAnimation:forKey:", v18, CFSTR("liftShadow"));

    -[VKTextLiftingView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 0.5;
    objc_msgSend(v20, "setShadowOpacity:", v21);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke;
    v23[3] = &unk_1E94625B8;
    v23[4] = self;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke_2;
    v22[3] = &unk_1E9465A58;
    v22[4] = self;
    *(CGFloat *)&v22[5] = v4;
    *(CGFloat *)&v22[6] = v6;
    *(double *)&v22[7] = v8;
    *(double *)&v22[8] = v10;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v23, v22, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
    -[VKTextLiftingView _applyInteractionToImageViewIfReady](self, "_applyInteractionToImageViewIfReady");

  }
}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateAlongsideTextLiftingForView:", *(_QWORD *)(a1 + 32));

}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[5];
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLiftingAnimationDidEndForView:", *(_QWORD *)(a1 + 32));

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasFadedOut") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(*(id *)(a1 + 32), "imageInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "baseView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textSelectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "presentsMenuForLiftedText"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        objc_msgSend(v6, "setUseFullDocumentRangeForEmptySelection:", 1);
        objc_msgSend(v6, "becomeFirstResponder");
        v25 = 0u;
        v26 = 0u;
        v24 = 0u;
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v7, "_contentBounds");
        if (v7)
        {
          objc_msgSend(v7, "_imageTransformInBounds:");
        }
        else
        {
          v25 = 0u;
          v26 = 0u;
          v24 = 0u;
        }
        objc_msgSend(*(id *)(a1 + 32), "cutoutPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        v23[0] = v24;
        v23[1] = v25;
        v23[2] = v26;
        objc_msgSend(v9, "applyTransform:", v23);
        objc_msgSend(v9, "bounds");
        v14 = VKMCenterRectOverRect(v10, v11, v12, v13, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "showMenuFromView:rect:", *(_QWORD *)(a1 + 32), v14, v16, v18, v20);

        objc_msgSend(*(id *)(a1 + 32), "_setPresentedMenuForLiftedText:", 1);
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "presentsQuickActions"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke_3;
      v22[3] = &unk_1E94625B8;
      v22[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v22, 0.2);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "actionInfoView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)fadeOutAndRemoveFromSuperview
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
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!-[VKTextLiftingView _hasFadedOut](self, "_hasFadedOut"))
  {
    -[VKTextLiftingView _hasFadedOut:](self, "_hasFadedOut:", 1);
    -[VKTextLiftingView imageInteraction](self, "imageInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetSelection");

    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VKTextLiftingView _presentedMenuForLiftedText](self, "_presentedMenuForLiftedText"))
    {
      if (objc_msgSend(v4, "isMenuVisible"))
        objc_msgSend(v4, "hideMenu");
    }
    -[VKTextLiftingView _gaussianBlurFilterWithRadius:](self, "_gaussianBlurFilterWithRadius:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextLiftingView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("filters.%@.inputRadius"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKTextLiftingView _springAnimationForKeyPath:fromValue:toValue:](self, "_springAnimationForKeyPath:fromValue:toValue:", v10, &unk_1E94951F8, &unk_1E9495208);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextLiftingView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("dismissBlur"));

    -[VKTextLiftingView setNeedsLayout](self, "setNeedsLayout");
    v13[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke;
    v14[3] = &unk_1E94625B8;
    v14[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke_2;
    v13[3] = &unk_1E9462658;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v14, v13, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

  }
}

void __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "actionInfoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateAlongsideFadeOutForTextLiftingView:", *(_QWORD *)(a1 + 32));

}

void __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fadeOutAnimationDidEndForView:", *(_QWORD *)(a1 + 32));

}

- (id)_gaussianBlurFilterWithRadius:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CD2780]);
  v5 = (void *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2C88]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, *MEMORY[0x1E0C9E258]);

  objc_msgSend(v5, "setName:", CFSTR("gaussianBlur"));
  return v5;
}

- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMass:", 2.0);
  objc_msgSend(v10, "setStiffness:", 300.0);
  objc_msgSend(v10, "setDamping:", 50.0);
  objc_msgSend(v10, "setDuration:", 0.8);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  return v10;
}

- (void)_applyInteractionToImageViewIfReady
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VKTextLiftingView imageInteraction](self, "imageInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VKTextLiftingView _hasLifted](self, "_hasLifted");
  v4 = v7;
  if (v3 && v7)
  {
    if (self->_presentsQuickActions)
    {
      objc_msgSend(v7, "setActionInfoLiveTextButtonDisabled:", 1);
      objc_msgSend(v7, "setActionInfoViewHidden:", 0);
      objc_msgSend(v7, "setDeriveQuickActionsVisibilityFromState:", 0);
      objc_msgSend(v7, "setWantsTranslucentActionInfoButtons:", 0);
      -[VKTextLiftingView preferredQuickActionButtonHeight](self, "preferredQuickActionButtonHeight");
      objc_msgSend(v7, "setPreferredQuickActionButtonHeight:");
    }
    -[VKTextLiftingView _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addInteraction:", v7);

    v4 = v7;
    if (self->_presentsQuickActions)
    {
      objc_msgSend(v7, "actionInfoViewIfExists");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[VKTextLiftingView addSubview:](self, "addSubview:", v6);
        -[VKTextLiftingView _applyConfigurationUpdateHandlerToQuickActions](self, "_applyConfigurationUpdateHandlerToQuickActions");
        objc_msgSend(v6, "edgeInsets");
        objc_msgSend(v6, "setEdgeInsets:", 0.0);
        objc_msgSend(v6, "setAutomaticVisualRectLayoutDisabled:", 1);
        objc_msgSend(v6, "setAlignQuickActionsWithVerticalCenter:", 1);
        objc_msgSend(v6, "setShouldAnimateQuickActionVisibilityChanges:", 1);
        objc_msgSend(v6, "setAlpha:", 0.0);
        objc_msgSend(v6, "set_quickActionsHidden:", 0);
      }

      v4 = v7;
    }
  }

}

- (void)_applyConfigurationUpdateHandlerToQuickActions
{
  void *v3;
  id v4;

  -[VKTextLiftingView quickActionConfigurationUpdateHandler](self, "quickActionConfigurationUpdateHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKTextLiftingView imageInteraction](self, "imageInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQuickActionConfigurationUpdateHandler:", v4);

}

- (CGRect)_contentBounds
{
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[VKTextLiftingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKTextLiftingView contentInsets](self, "contentInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIBezierPath)_rotatedCutoutPath
{
  UIBezierPath *rotatedCutoutPath;
  void *v4;
  UIBezierPath *v5;
  UIBezierPath *v6;
  UIBezierPath *v7;
  double v8;
  CGAffineTransform v10;

  rotatedCutoutPath = self->__rotatedCutoutPath;
  if (!rotatedCutoutPath)
  {
    -[VKTextLiftingView cutoutPath](self, "cutoutPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBezierPath *)objc_msgSend(v4, "copy");
    v6 = self->__rotatedCutoutPath;
    self->__rotatedCutoutPath = v5;

    v7 = self->__rotatedCutoutPath;
    -[VKTextLiftingView baselineAngle](self, "baselineAngle");
    CGAffineTransformMakeRotation(&v10, -v8);
    -[UIBezierPath applyTransform:](v7, "applyTransform:", &v10);
    rotatedCutoutPath = self->__rotatedCutoutPath;
  }
  return rotatedCutoutPath;
}

- (CGAffineTransform)_imageTransformInBounds:(SEL)a3
{
  double height;
  double width;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  __int128 v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGAffineTransform *result;
  __int128 v36;
  double v37;
  double v38;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;

  height = a4.size.height;
  width = a4.size.width;
  -[VKTextLiftingView _rotatedCutoutPath](self, "_rotatedCutoutPath", a4.origin.x, a4.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextLiftingView baselineAngle](self, "baselineAngle");
  v10 = v9;
  objc_msgSend(v8, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "bounds");
  v19 = VKMCenterOfRect(v15, v16, v17, v18);
  v36 = v20;
  v37 = v19;
  CGAffineTransformMakeRotation(&v45, v10);
  *(_QWORD *)&v38 = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v45.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v45.c, *(double *)&v36), *(float64x2_t *)&v45.a, v37));
  -[VKTextLiftingView maxScale](self, "maxScale");
  v22 = fmin(v21, fmin(width / v12, height / v14));
  if (-[VKTextLiftingView _hasFadedOut](self, "_hasFadedOut"))
    v22 = v22 * 1.5;
  -[VKTextLiftingView image](self, "image", v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "size");
  v24 = VKMRectWithSize();
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = VKMCenterOfRect(v24, v26, v28, v30);
  v33 = VKMSubtractPoints(v31, v32, v38);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeTranslation(&v44, v33, v34);
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeRotation(&v43, -v10);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeScale(&v42, v22, v22);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v44;
  t2 = v43;
  CGAffineTransformConcat(&v41, &t1, &t2);
  t1 = v42;
  CGAffineTransformConcat(retstr, &v41, &t1);

  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (UIBezierPath)cutoutPath
{
  return self->_cutoutPath;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setHitTestPath:(id)a3
{
  objc_storeStrong((id *)&self->_hitTestPath, a3);
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (BOOL)presentsMenuForLiftedText
{
  return self->_presentsMenuForLiftedText;
}

- (void)setPresentsMenuForLiftedText:(BOOL)a3
{
  self->_presentsMenuForLiftedText = a3;
}

- (BOOL)presentsQuickActions
{
  return self->_presentsQuickActions;
}

- (void)setPresentsQuickActions:(BOOL)a3
{
  self->_presentsQuickActions = a3;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (VKTextLiftingViewDelegate)delegate
{
  return (VKTextLiftingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIVisualEffectView)_highlightView
{
  return self->__highlightView;
}

- (BOOL)_hasLifted
{
  return self->__hasLifted;
}

- (void)_hasLifted:(BOOL)a3
{
  self->__hasLifted = a3;
}

- (BOOL)_hasFadedOut
{
  return self->__hasFadedOut;
}

- (void)_hasFadedOut:(BOOL)a3
{
  self->__hasFadedOut = a3;
}

- (BOOL)_presentedMenuForLiftedText
{
  return self->__presentedMenuForLiftedText;
}

- (void)_setPresentedMenuForLiftedText:(BOOL)a3
{
  self->__presentedMenuForLiftedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_storeStrong((id *)&self->_hitTestPath, 0);
  objc_storeStrong((id *)&self->_cutoutPath, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->__rotatedCutoutPath, 0);
}

@end
