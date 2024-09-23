@implementation SiriSharedUICompactAdditionalContentView

- (SiriSharedUICompactAdditionalContentView)initWithFrame:(CGRect)a3 platterCategory:(int64_t)a4
{
  SiriSharedUICompactAdditionalContentView *v5;
  SiriSharedUICompactAdditionalContentView *v6;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUICompactAdditionalContentView;
  v5 = -[SiriSharedUICompactAdditionalContentView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[SiriSharedUICompactAdditionalContentView _setupSubviews](v5, "_setupSubviews");
    -[SiriSharedUICompactAdditionalContentView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setOpacity:", v8);

  }
  v6->_platterCategory = a4;
  return v6;
}

- (void)_setupSubviews
{
  PLPlatterView *v3;
  PLPlatterView *platterView;
  SiriSharedUIStandardView *v5;
  UIView *containerView;
  UIView *v7;
  void *v8;
  void *v9;
  SiriSharedUIStandardView *v10;
  UIView *snippetContainerView;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithBlurEffectStyle:", 8);
  v3 = (PLPlatterView *)objc_claimAutoreleasedReturnValue();
  platterView = self->_platterView;
  self->_platterView = v3;

  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", 23.5);
  -[SiriSharedUICompactAdditionalContentView addSubview:](self, "addSubview:", self->_platterView);
  v5 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v5->super;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  v7 = self->_containerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[PLPlatterView customContentView](self->_platterView, "customContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_containerView);

  v10 = objc_alloc_init(SiriSharedUIStandardView);
  snippetContainerView = self->_snippetContainerView;
  self->_snippetContainerView = &v10->super;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_snippetContainerView);
  v12 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v12);
}

- (void)layoutSubviews
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v27;
  double MaxY;
  double v29;
  void *v30;
  CGFloat rect;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[9];
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)SiriSharedUICompactAdditionalContentView;
  -[SiriSharedUICompactAdditionalContentView layoutSubviews](&v42, sel_layoutSubviews);
  -[SiriSharedUICompactAdditionalContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriSharedUICompactAdditionalContentView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __58__SiriSharedUICompactAdditionalContentView_layoutSubviews__block_invoke;
    v41[3] = &unk_1EA89CD48;
    v41[4] = self;
    *(double *)&v41[5] = v4;
    *(double *)&v41[6] = v6;
    *(double *)&v41[7] = v8;
    *(double *)&v41[8] = v10;
    -[SiriSharedUICompactAdditionalContentView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v41, v12, 0);

  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", CGRectGetHeight(v45) > 0.0);
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = self->_snippetViews;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v14)
  {
    v15 = v14;
    rect = v10;
    v32 = v4;
    v16 = 0;
    v18 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v36 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(_QWORD *)v38;
    v20 = 0.0;
    v21 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v13);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[SiriSharedUICompactAdditionalContentView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v23, v8, 1.79769313e308);
        if (v24 == v18 && v25 == v17)
        {
          objc_msgSend(v23, "setFrame:", v36, v35, v34, v33);
        }
        else
        {
          v27 = v24;
          objc_msgSend(v23, "setFrame:", 0.0, v21, v24, v25);
          objc_msgSend(v23, "frame");
          v21 = CGRectGetMaxY(v46) + 0.0;
          objc_msgSend(v23, "frame");
          MaxY = CGRectGetMaxY(v47);
          if (v20 < v27)
            v20 = v27;
          if (v16)
          {
            v16 = 1;
          }
          else
          {
            v29 = floor(MaxY + 0.0);
            v48.origin.y = v6;
            v48.origin.x = v32;
            v48.size.width = v8;
            v48.size.height = rect;
            MaxY = floor(CGRectGetHeight(v48));
            v16 = v29 > MaxY;
          }
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16, MaxY);
    }
    while (v15);
  }
  else
  {
    v20 = 0.0;
    v21 = 0.0;
  }

  -[UIView setFrame:](self->_snippetContainerView, "setFrame:", 0.0, 0.0, v20, v21);
  -[SiriSharedUICompactAdditionalContentView stackContainerDelegate](self, "stackContainerDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stackableContentDidLayout:", self);

}

uint64_t __58__SiriSharedUICompactAdditionalContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setSnippetViews:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  NSArray *snippetViews;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  UIView *snippetContainerView;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_snippetViews, "isEqualToArray:", v4))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_snippetViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v10 = (NSArray *)objc_msgSend(v4, "copy");
    snippetViews = self->_snippetViews;
    self->_snippetViews = v10;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_snippetViews;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          v18 = SiriSharedUILanguageSemanticContentAttribute();
          SiriSharedUIRecursiveSetSemanticContentAttribute(v17, v18);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "viewInsetsInConversationView:", 0.0, 0.0, 0.0, 0.0, (_QWORD)v20);
          snippetContainerView = self->_snippetContainerView;
          if (snippetContainerView)
            -[UIView addSubview:](snippetContainerView, "addSubview:", v17);
          -[SiriSharedUICompactAdditionalContentView _adjustCornerRadiusForSnippetView:](self, "_adjustCornerRadiusForSnippetView:", v17, (_QWORD)v20);
          objc_msgSend(v17, "setClipsToBounds:", 1);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

    -[SiriSharedUICompactAdditionalContentView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
  }

}

- (void)_adjustCornerRadiusForSnippetView:(id)a3
{
  objc_msgSend(a3, "_setContinuousCornerRadius:", 17.5);
}

- (id)prepareForUpdatesPendingCompletionBlocks
{
  NSMutableArray *prepareForUpdatesPendingCompletionBlocks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  if (!prepareForUpdatesPendingCompletionBlocks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prepareForUpdatesPendingCompletionBlocks;
    self->_prepareForUpdatesPendingCompletionBlocks = v4;

    prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  }
  return prepareForUpdatesPendingCompletionBlocks;
}

- (CGSize)portraitContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView bounds](self->_containerView, "bounds");
  v3 = v2;
  v5 = v4 + 8.0 * 2.0;
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)animateAppearanceIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_snippetViews, "count"))
  {
    if (self->_runningAnimatedFadeOut)
    {
      self->_requestedAppearanceAnimation = 1;
    }
    else if (!-[SiriSharedUICompactAdditionalContentView layerHasOpacity](self, "layerHasOpacity"))
    {
      v3 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[SiriSharedUICompactAdditionalContentView animateAppearanceIfNeeded]";
        _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of platterView", (uint8_t *)&v8, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[SiriSharedUICompactAdditionalContentView layer](self, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUICompactAdditionalContentView _conversationAppearAnimation](self, "_conversationAppearAnimation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("additionalContentAppearance"));

      -[SiriSharedUICompactAdditionalContentView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 1.0;
      objc_msgSend(v6, "setOpacity:", v7);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (id)_conversationAppearAnimation
{
  void *v3;
  double v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriSharedUICompactAdditionalContentView frame](self, "frame");
  objc_msgSend(v3, "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 3, v5, -[SiriSharedUICompactAdditionalContentView _animatedPresentationType](self, "_animatedPresentationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_conversationDisappearAnimation
{
  return +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 2, 0, -[SiriSharedUICompactAdditionalContentView _animatedPresentationType](self, "_animatedPresentationType"));
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)prepareForUpdatesToSnippetViews:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 runningPrepareForUpdates;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315650;
    v11 = "-[SiriSharedUICompactAdditionalContentView prepareForUpdatesToSnippetViews:]";
    v12 = 1024;
    v13 = runningPrepareForUpdates;
    v14 = 1024;
    v15 = 1;
    _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForContentUpdating: %d", buf, 0x18u);
  }
  if (!self->_runningPrepareForUpdates && v3)
  {
    self->_runningPrepareForUpdates = 1;
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke;
    v8[3] = &unk_1EA89CCF8;
    objc_copyWeak(&v9, (id *)buf);
    -[SiriSharedUICompactAdditionalContentView animateFadeOutWithCompletion:](self, "animateFadeOutWithCompletion:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  SiriSharedUIAnimationContext *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 442) = 0;
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[SiriSharedUICompactAdditionalContentView prepareForUpdatesToSnippetViews:]_block_invoke";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    -[SiriSharedUIAnimationContext setAnimationDuration:](v4, "setAnimationDuration:", 0.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke_13;
    v5[3] = &unk_1EA89CC58;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v5, v4, 0);

  }
}

uint64_t __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke_13(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "prepareForUpdatesPendingCompletionBlocks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "prepareForUpdatesPendingCompletionBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "updateContentSizeWithAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)snippetContentDidUpdate
{
  -[SiriSharedUICompactAdditionalContentView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
}

- (void)didCompleteAnimatedFadeOut
{
  self->_runningAnimatedFadeOut = 0;
  if (self->_requestedAppearanceAnimation)
  {
    -[SiriSharedUICompactAdditionalContentView animateAppearanceIfNeeded](self, "animateAppearanceIfNeeded");
    self->_requestedAppearanceAnimation = 0;
  }
}

- (void)animateFadeOutWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SiriSharedUICompactAdditionalContentView layerHasOpacity](self, "layerHasOpacity"))
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SiriSharedUICompactAdditionalContentView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of platterView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x1E0CD28B0];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke;
    v14 = &unk_1EA89CD20;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    objc_msgSend(v6, "setCompletionBlock:", &v11);
    -[SiriSharedUICompactAdditionalContentView layer](self, "layer", v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactAdditionalContentView _conversationDisappearAnimation](self, "_conversationDisappearAnimation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("additionalContentDisappearance"));

    -[SiriSharedUICompactAdditionalContentView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_1EA89CC58;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteAnimatedFadeOut");
}

- (BOOL)layerHasOpacity
{
  void *v2;
  float v3;
  BOOL v4;

  -[SiriSharedUICompactAdditionalContentView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 > 0.0;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[SiriSharedUICompactAdditionalContentView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", a3.width, a3.height);
  if (v4 <= 0.0)
    v5 = 0.0;
  else
    v5 = v4 + 0.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_snippetViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[SiriSharedUICompactAdditionalContentView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), width, height, (_QWORD)v17);
        v7 = fmax(v7, v13);
        v6 = v6 + v14 + 0.0;
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = v7;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)relayout
{
  -[SiriSharedUICompactAdditionalContentView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (void)updateContentSizeWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = a3;
  -[SiriSharedUICompactAdditionalContentView _fittingSize](self, "_fittingSize");
  v6 = v5;
  v8 = v7;
  -[SiriSharedUICompactAdditionalContentView stackContainerDelegate](self, "stackContainerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  -[SiriSharedUICompactAdditionalContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)_fittingSize
{
  double v3;
  double v4;
  double *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = 2.0;
  if (!self->_isInAmbient)
    v3 = 1.0;
  v4 = 556.0 * v3;
  v5 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
  if (!self->_isInAmbient)
    v5 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
  v6 = *v5;
  -[SiriSharedUICompactAdditionalContentView stackContainerDelegate](self, "stackContainerDelegate", 556.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackableContentMaximumContainerWidth");
  v9 = v8 + v6 * -2.0;

  if (v4 >= v9)
    v10 = v9;
  else
    v10 = v4;
  -[SiriSharedUICompactAdditionalContentView sizeThatFits:](self, "sizeThatFits:", v10, 1.79769313e308);
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 forSnippet:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewContentSize");
    v9 = v8;

  }
  else
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
    width = v10;
    v9 = v11;
  }

  v12 = width;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
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

- (SiriSharedUICompactAdditionalContentViewDelegate)delegate
{
  return (SiriSharedUICompactAdditionalContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
  objc_storeStrong((id *)&self->stackConstraints, a3);
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  return (SiriSharedUIStackableContentDelegate *)objc_loadWeakRetained((id *)&self->stackContainerDelegate);
}

- (void)setStackContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->stackContainerDelegate, a3);
}

- (NSArray)snippetViews
{
  return self->_snippetViews;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, a3);
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (UIView)snippetContainerView
{
  return self->_snippetContainerView;
}

- (void)setSnippetContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_snippetContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetContainerView, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->_snippetViews, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
