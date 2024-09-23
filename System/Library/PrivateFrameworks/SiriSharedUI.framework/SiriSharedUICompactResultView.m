@implementation SiriSharedUICompactResultView

- (SiriSharedUICompactResultView)initWithFrame:(CGRect)a3
{
  SiriSharedUICompactResultView *v3;
  uint64_t v4;
  UIButton *overlayButton;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUICompactResultView;
  v3 = -[SiriSharedUICompactResultView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    overlayButton = v3->_overlayButton;
    v3->_overlayButton = (UIButton *)v4;

    -[SiriSharedUICompactResultView _overlayButton](v3, "_overlayButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v3, sel__overlayButtonWasTouchedUpInside_, 64);

  }
  return v3;
}

- (void)setSnippetView:(id)a3 completion:(id)a4
{
  SiriSharedUIContentPlatterView *v7;
  id v8;
  SiriSharedUIContentPlatterView **p_snippetView;
  SiriSharedUIContentPlatterView *snippetView;
  void *v11;
  SiriSharedUIContentPlatterView *v12;
  uint64_t v13;
  SiriSharedUIContentPlatterView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  SiriSharedUIContentPlatterView *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = (SiriSharedUIContentPlatterView *)a3;
  v8 = a4;
  p_snippetView = &self->_snippetView;
  snippetView = self->_snippetView;
  if (snippetView != v7)
  {
    v31 = snippetView;
    objc_storeStrong((id *)&self->_snippetView, a3);
    self->_snippetNeedsSizing = 1;
    -[SiriSharedUIContentPlatterView layer](*p_snippetView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    -[SiriSharedUIContentPlatterView setIsInAmbient:](*p_snippetView, "setIsInAmbient:", self->_isInAmbient);
    -[SiriSharedUICompactResultView setShowDimmingView:animated:](self, "setShowDimmingView:animated:", 0, 0);
    -[SiriSharedUIContentPlatterView removeFromSuperview](*p_snippetView, "removeFromSuperview");
    v12 = *p_snippetView;
    v13 = SiriSharedUILanguageSemanticContentAttribute();
    SiriSharedUIRecursiveSetSemanticContentAttribute(v12, v13);
    if (!self->_isInAmbient)
    {
      v14 = *p_snippetView;
      -[SiriSharedUICompactResultView dismissalGestureRecognizer](self, "dismissalGestureRecognizer", v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIContentPlatterView setDismissalGestureRecognizer:](v14, "setDismissalGestureRecognizer:", v15);

    }
    v33 = v8;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[SiriSharedUIContentPlatterView contentViews](v7, "contentViews", v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      v20 = 1;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v20 &= objc_msgSend(v22, "shouldAutomaticallyScaleContentInAmbient");
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v18);
    }
    else
    {
      LOBYTE(v20) = 1;
    }

    -[SiriSharedUICompactResultView setAllowAutomaticContentViewsScaling:](self, "setAllowAutomaticContentViewsScaling:", v20 & 1);
    -[SiriSharedUIContentPlatterView setDelegate:](*p_snippetView, "setDelegate:", self);
    -[SiriSharedUICompactResultView addSubview:](self, "addSubview:", *p_snippetView);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v23 = (void *)MEMORY[0x1E0CD28B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __59__SiriSharedUICompactResultView_setSnippetView_completion___block_invoke;
    v34[3] = &unk_1EA89CC80;
    v24 = v32;
    v35 = v24;
    v8 = v33;
    v36 = v33;
    objc_msgSend(v23, "setCompletionBlock:", v34);
    -[SiriSharedUIContentPlatterView layer](*p_snippetView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactResultView _snippetInsertAnimation](self, "_snippetInsertAnimation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAnimation:forKey:", v26, CFSTR("snippetInsert"));

    if (self->_isInAmbient)
      +[SiriSharedUICAFiltering applyGaussianBlurFilterToView:](SiriSharedUICAFiltering, "applyGaussianBlurFilterToView:", *p_snippetView);
    objc_msgSend(v24, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactResultView _snippetRemovalAnimation](self, "_snippetRemovalAnimation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAnimation:forKey:", v28, CFSTR("snippetInsert"));

    objc_msgSend(v24, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 0;
    objc_msgSend(v29, "setOpacity:", v30);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[SiriSharedUICompactResultView snippetContentDidUpdate](self, "snippetContentDidUpdate");

  }
}

uint64_t __59__SiriSharedUICompactResultView_setSnippetView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  SiriSharedUIContentPlatterView *snippetView;
  id v7;

  v3 = a3;
  self->_isInAmbient = a3;
  -[SiriSharedUIContentPlatterView setIsInAmbient:](self->_snippetView, "setIsInAmbient:");
  v5 = !v3;
  -[SiriSharedUIContentPlatterView setScrollEnabled:](self->_snippetView, "setScrollEnabled:", !v3);
  snippetView = self->_snippetView;
  if (v5)
  {
    -[SiriSharedUICompactResultView dismissalGestureRecognizer](self, "dismissalGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterView setDismissalGestureRecognizer:](snippetView, "setDismissalGestureRecognizer:");
  }
  else
  {
    -[SiriSharedUIContentPlatterView dismissalGestureRecognizer](self->_snippetView, "dismissalGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterView removeGestureRecognizer:](snippetView, "removeGestureRecognizer:");
  }

}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivity = a3;
  -[SiriSharedUIContentPlatterView setIsInAmbientInteractivity:](self->_snippetView, "setIsInAmbientInteractivity:");
}

- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3
{
  self->_allowAutomaticContentViewsScaling = a3;
  -[SiriSharedUIContentPlatterView setAllowAutomaticContentViewsScaling:](self->_snippetView, "setAllowAutomaticContentViewsScaling:");
}

- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  void *v8;
  SiriSharedUIAnimationContext *v9;
  SiriSharedUIAnimationContext *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[2];
  BOOL v17;
  id location;

  v4 = a4;
  v5 = a3;
  if (-[SiriSharedUIContentPlatterView isHidden](self->_snippetView, "isHidden") == a3)
  {
    if (v5)
      v7 = 1.0;
    else
      v7 = 0.0;
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __61__SiriSharedUICompactResultView_setShowSnippetView_animated___block_invoke;
    v15 = &unk_1EA89D030;
    objc_copyWeak(v16, &location);
    v16[1] = *(id *)&v7;
    v17 = v5;
    v8 = _Block_copy(&v12);
    v9 = objc_alloc_init(SiriSharedUIAnimationContext);
    v10 = v9;
    v11 = 0.2;
    if (!v4)
      v11 = 0.0;
    -[SiriSharedUIAnimationContext setAnimationDuration:](v9, "setAnimationDuration:", v11, v12, v13, v14, v15);
    -[SiriSharedUIAnimationContext setAnimationOptions:](v10, "setAnimationOptions:", 1);
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v8, v10, 0);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __61__SiriSharedUICompactResultView_setShowSnippetView_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "snippetView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 40));

    objc_msgSend(v5, "snippetView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", *(_BYTE *)(a1 + 48) == 0);

    WeakRetained = v5;
  }

}

- (void)setShowDimmingView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[SiriSharedUICompactResultView darkenIntensity](self, "darkenIntensity");
  if ((((v7 != 1.0) ^ v5) & 1) == 0)
  {
    v8 = 0.0;
    if (v5)
      v8 = 1.0;
    -[SiriSharedUICompactResultView setDarkenIntensity:animated:](self, "setDarkenIntensity:animated:", v4, v8);
    -[SiriSharedUICompactResultView _overlayButton](self, "_overlayButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
      -[SiriSharedUICompactResultView addSubview:](self, "addSubview:", v9);
    else
      objc_msgSend(v9, "removeFromSuperview");

  }
}

- (void)setDarkenIntensity:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  SiriSharedUIAnimationContext *v7;
  SiriSharedUIAnimationContext *v8;
  double v9;
  _QWORD aBlock[4];
  id v11[2];
  id location;

  v4 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__SiriSharedUICompactResultView_setDarkenIntensity_animated___block_invoke;
  aBlock[3] = &unk_1EA89D058;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v6 = _Block_copy(aBlock);
  v7 = objc_alloc_init(SiriSharedUIAnimationContext);
  v8 = v7;
  v9 = 0.2;
  if (!v4)
    v9 = 0.0;
  -[SiriSharedUIAnimationContext setAnimationDuration:](v7, "setAnimationDuration:", v9);
  -[SiriSharedUIAnimationContext setAnimationOptions:](v8, "setAnimationOptions:", 1);
  +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v6, v8, 0);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__SiriSharedUICompactResultView_setDarkenIntensity_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setDarkenIntensity:", *(double *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)snippetContentDidUpdate
{
  -[SiriSharedUICompactResultView relayout](self, "relayout");
  -[SiriSharedUIContentPlatterView setNeedsLayout](self->_snippetView, "setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SiriSharedUICompactResultView _maxSizeForSnippet](self, "_maxSizeForSnippet");
  v4 = v3;
  v6 = v5;
  -[SiriSharedUICompactResultView frame](self, "frame");
  if (v4 >= v7)
    v9 = v7;
  else
    v9 = v4;
  if (v6 >= v8)
    v10 = v8;
  else
    v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setNeedsLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUICompactResultView;
  -[SiriSharedUICompactResultView setNeedsLayout](&v4, sel_setNeedsLayout);
  -[SiriSharedUICompactResultView snippetView](self, "snippetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SiriSharedUIContentPlatterView *snippetView;
  double v18;
  double v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)SiriSharedUICompactResultView;
  -[SiriSharedUICompactResultView layoutSubviews](&v26, sel_layoutSubviews);
  if (self->_snippetNeedsSizing)
    -[SiriSharedUICompactResultView snippetContentDidUpdate](self, "snippetContentDidUpdate");
  -[SiriSharedUICompactResultView _maxSizeForSnippet](self, "_maxSizeForSnippet");
  v4 = v3;
  v6 = v5;
  -[SiriSharedUICompactResultView bounds](self, "bounds");
  Height = CGRectGetHeight(v27);
  if (Height < v6)
    v6 = Height;
  -[SiriSharedUICompactResultView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsetsForResultView:", self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[SiriSharedUIContentPlatterView setContentInsets:](self->_snippetView, "setContentInsets:", v10, v12, v14, v16);
  snippetView = self->_snippetView;
  if (snippetView)
  {
    -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", v4, v6);
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity)
      v20 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v20 = &SiriSharedUICompactAmbientContentScaleAmount;
    v19 = v19 * *(double *)v20;
  }
  if (v6 >= v19)
    v6 = v19;
  if (v4 >= v18)
    v4 = v18;
  -[SiriSharedUICompactResultView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__SiriSharedUICompactResultView_layoutSubviews__block_invoke;
    v25[3] = &unk_1EA89D080;
    v25[4] = self;
    *(double *)&v25[5] = v4;
    *(double *)&v25[6] = v6;
    -[SiriSharedUICompactResultView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v25, v22, 0);

  }
  else
  {
    -[SiriSharedUIContentPlatterView setFrame:](self->_snippetView, "setFrame:", 0.0, 0.0, v4, v6);
  }
  -[SiriSharedUICompactResultView _overlayButton](self, "_overlayButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactResultView bounds](self, "bounds");
  objc_msgSend(v23, "setFrame:");

  -[SiriSharedUICompactResultView stackContainerDelegate](self, "stackContainerDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stackableContentDidLayout:", self);

}

uint64_t __47__SiriSharedUICompactResultView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)relayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  SiriSharedUIContentPlatterView *snippetView;
  double v8;
  void *v9;
  uint64_t *v10;
  CGSize *p_previousContentSize;
  CGFloat v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGSize v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_snippetView)
  {
    -[SiriSharedUICompactResultView _maxSizeForSnippet](self, "_maxSizeForSnippet");
    if (v3 != 0.0)
    {
      v5 = v3;
      v6 = v4;
      snippetView = self->_snippetView;
      if (snippetView)
        -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", v3, v4);
      else
        v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
      {
        if (self->_isInAmbientInteractivity)
          v10 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
        else
          v10 = &SiriSharedUICompactAmbientContentScaleAmount;
        v8 = v8 * *(double *)v10;
      }
      if (v6 >= v8)
        v6 = v8;
      p_previousContentSize = &self->_previousContentSize;
      v12 = self->_previousContentSize.height - self->_previousSeparatorContentHeight;
      -[SiriSharedUIContentPlatterView heightForContentSeparators](self->_snippetView, "heightForContentSeparators");
      if (v12 <= 0.0 && v6 - v13 > 0.0)
      {
        -[SiriSharedUICompactResultView snippetView](self, "snippetView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUICompactResultView _snippetInsertAnimation](self, "_snippetInsertAnimation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAnimation:forKey:", v16, CFSTR("snippetInsert"));

      }
      if (v5 == p_previousContentSize->width && v6 == self->_previousContentSize.height)
        v18 = 0;
      else
        v18 = -[SiriSharedUICompactResultView _isSnippetAnimatingInsertionOrRemoval](self, "_isSnippetAnimatingInsertionOrRemoval") ^ 1;
      p_previousContentSize->width = v5;
      self->_previousContentSize.height = v6;
      -[SiriSharedUIContentPlatterView heightForContentSeparators](self->_snippetView, "heightForContentSeparators");
      self->_previousSeparatorContentHeight = v19;
      -[SiriSharedUIContentPlatterView heightForContentSeparators](self->_snippetView, "heightForContentSeparators");
      if (v6 == v20)
        v6 = 0.0;
      self->_snippetNeedsSizing = 0;
      -[SiriSharedUICompactResultView stackContainerDelegate](self, "stackContainerDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v18, v5, v6);

      -[SiriSharedUICompactResultView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      v22 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v31.width = v5;
        v31.height = v6;
        NSStringFromCGSize(v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 136315394;
        v27 = "-[SiriSharedUICompactResultView relayout]";
        v28 = 2112;
        v29 = v24;
        _os_log_impl(&dword_1DE0BF000, v23, OS_LOG_TYPE_DEFAULT, "%s #compact relayout with contentSize: %@ ", (uint8_t *)&v26, 0x16u);

      }
      if (v6 > 0.0
        || v6 == 0.0 && !-[SiriSharedUICompactResultView _snippetViewIsLoading](self, "_snippetViewIsLoading"))
      {
        -[SiriSharedUICompactResultView delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "resultViewContentDidLoad:", self);

      }
    }
  }
  else
  {
    -[SiriSharedUICompactResultView frame](self, "frame");
    if (CGRectGetHeight(v32) != 0.0)
    {
      -[SiriSharedUICompactResultView stackContainerDelegate](self, "stackContainerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      -[SiriSharedUICompactResultView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
}

- (BOOL)_snippetViewIsLoading
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SiriSharedUIContentPlatterView contentViews](self->_snippetView, "contentViews");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isLoading", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (CGSize)_maxSizeForSnippet
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SiriSharedUICompactResultView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumHeightForResultView:", self);
  v5 = v4;

  v6 = 2.0;
  if (!self->_isInAmbient)
    v6 = 1.0;
  v7 = 556.0 * v6;
  v8 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
  if (!self->_isInAmbient)
    v8 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
  v9 = *v8;
  -[SiriSharedUICompactResultView stackContainerDelegate](self, "stackContainerDelegate", 556.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stackableContentMaximumContainerWidth");
  v12 = v11 + v9 * -2.0;

  if (v7 >= v12)
    v13 = v12;
  else
    v13 = v7;
  v14 = v5;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  SiriSharedUIContentPlatterView *snippetView;
  double v11;
  uint64_t *v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SiriSharedUICompactResultView _maxSizeForSnippet](self, "_maxSizeForSnippet");
  v7 = v6;
  v9 = v8;
  snippetView = self->_snippetView;
  if (snippetView)
    -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", width, height);
  else
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity)
      v12 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v12 = &SiriSharedUICompactAmbientContentScaleAmount;
    v11 = v11 * *(double *)v12;
  }
  if (v9 < v11)
    v11 = v9;
  v13 = v7;
  result.height = v11;
  result.width = v13;
  return result;
}

- (void)_overlayButtonWasTouchedUpInside:(id)a3
{
  id v4;

  -[SiriSharedUICompactResultView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultViewDarkenedContentWasTapped:", self);

}

- (void)contentPlatterView:(id)a3 didScrollWithContentOffset:(CGPoint)a4
{
  id v5;

  if (a4.y > 0.0)
  {
    -[SiriSharedUICompactResultView delegate](self, "delegate", a3, a4.x);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultViewContentDidScroll:", self);

  }
}

- (void)contentPlatterViewScrolledToContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  -[SiriSharedUICompactResultView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultViewContentScrolled:toContentOffset:", self, x, y);

}

- (void)contentPlatterViewScrollDidBegin
{
  id v3;

  -[SiriSharedUICompactResultView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultViewContentScrolling:didBegin:", self, 1);

}

- (void)contentPlatterViewScrollDidEnd
{
  id v3;

  -[SiriSharedUICompactResultView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultViewContentScrolling:didBegin:", self, 0);

}

- (BOOL)_isSnippetAnimatingInsertionOrRemoval
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[SiriSharedUIContentPlatterView layer](self->_snippetView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("snippetInsert"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[SiriSharedUIContentPlatterView layer](self->_snippetView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationForKey:", CFSTR("snippetRemoval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (id)_snippetInsertAnimation
{
  void *v3;
  double v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriSharedUICompactResultView frame](self, "frame");
  objc_msgSend(v3, "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 0, v5, -[SiriSharedUICompactResultView _animatedPresentationType](self, "_animatedPresentationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_snippetRemovalAnimation
{
  return +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 1, 0, -[SiriSharedUICompactResultView _animatedPresentationType](self, "_animatedPresentationType"));
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)setDarkenIntensity:(double)a3
{
  SiriSharedUIContentPlatterView *snippetView;

  if (self->_darkenIntensity != a3)
  {
    self->_darkenIntensity = a3;
    snippetView = self->_snippetView;
    -[SiriSharedUICompactResultView darkenIntensity](self, "darkenIntensity");
    -[SiriSharedUIContentPlatterView setDarkenIntensity:](snippetView, "setDarkenIntensity:");
  }
}

- (int64_t)attachmentType
{
  return self->attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->attachmentType = a3;
}

- (double)attachmentYOffset
{
  return self->attachmentYOffset;
}

- (void)setAttachmentYOffset:(double)a3
{
  self->attachmentYOffset = a3;
}

- (SiriSharedUICompactResultViewDelegate)delegate
{
  return (SiriSharedUICompactResultViewDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->dismissalGestureRecognizer;
}

- (void)setDismissalGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->dismissalGestureRecognizer, a3);
}

- (SiriSharedUIContentPlatterView)snippetView
{
  return self->_snippetView;
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  return (SiriSharedUIStackableContentDelegate *)objc_loadWeakRetained((id *)&self->stackContainerDelegate);
}

- (void)setStackContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->stackContainerDelegate, a3);
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
  objc_storeStrong((id *)&self->stackConstraints, a3);
}

- (NSArray)customAttachmentConstraints
{
  return self->customAttachmentConstraints;
}

- (void)setCustomAttachmentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->customAttachmentConstraints, a3);
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, a3);
}

- (double)darkenIntensity
{
  return self->_darkenIntensity;
}

- (BOOL)snippetNeedsSizing
{
  return self->_snippetNeedsSizing;
}

- (void)setSnippetNeedsSizing:(BOOL)a3
{
  self->_snippetNeedsSizing = a3;
}

- (UIButton)_overlayButton
{
  return self->_overlayButton;
}

- (void)setOverlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_overlayButton, a3);
}

- (CGSize)previousContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousContentSize.width;
  height = self->_previousContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (double)previousSeparatorContentHeight
{
  return self->_previousSeparatorContentHeight;
}

- (void)setPreviousSeparatorContentHeight:(double)a3
{
  self->_previousSeparatorContentHeight = a3;
}

- (BOOL)allowAutomaticContentViewsScaling
{
  return self->_allowAutomaticContentViewsScaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->customAttachmentConstraints, 0);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_storeStrong((id *)&self->dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
