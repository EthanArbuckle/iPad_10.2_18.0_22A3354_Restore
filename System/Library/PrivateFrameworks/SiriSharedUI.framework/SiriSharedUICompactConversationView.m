@implementation SiriSharedUICompactConversationView

- (SiriSharedUICompactConversationView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4
{
  return -[SiriSharedUICompactConversationView initWithFrame:](self, "initWithFrame:", a3, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SiriSharedUICompactConversationView)initWithFrame:(CGRect)a3
{
  SiriSharedUICompactConversationView *v3;
  SiriSharedUICompactConversationView *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUICompactConversationView;
  v3 = -[SiriSharedUICompactConversationView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[SiriSharedUICompactConversationView _setupSubviews](v3, "_setupSubviews");
    -[SiriSharedUICompactConversationView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 0;
    objc_msgSend(v5, "setOpacity:", v6);

  }
  return v4;
}

- (void)_setupSubviews
{
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v3;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *expandablePlatterGesture;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v5;
  PLPlatterView *v6;
  PLPlatterView *platterView;
  SiriSharedUIAdaptiveGrabberView *v8;
  SiriSharedUIAdaptiveGrabberView *v9;
  SiriSharedUIAdaptiveGrabberView *grabberView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SiriSharedUIStandardView *v17;
  UIView *containerView;
  UIView *v19;
  void *v20;
  void *v21;
  SiriSharedUIStandardScrollView *v22;
  SiriSharedUIStandardScrollView *scrollView;
  double v24;
  SiriSharedUICompactUserUtteranceView *v25;
  SiriSharedUICompactUserUtteranceView *userUtteranceView;
  SiriSharedUICompactServerUtteranceView *v27;
  SiriSharedUICompactServerUtteranceView *serverUtteranceView;
  SiriSharedUIStandardView *v29;
  UIView *conversationSnippetContainerView;
  uint64_t v31;

  v3 = -[SiriSharedUIExpandablePlatterPanGestureRecognizer initWithExpansionDelegate:]([SiriSharedUIExpandablePlatterPanGestureRecognizer alloc], "initWithExpansionDelegate:", self);
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setCollapsedHeight:](v3, "setCollapsedHeight:", 60.0);
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setInitialHeight:](v3, "setInitialHeight:", 300.0);
  -[SiriSharedUICompactConversationView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  expandablePlatterGesture = self->_expandablePlatterGesture;
  self->_expandablePlatterGesture = v3;
  v5 = v3;

  objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithBlurEffectStyle:", 9);
  v6 = (PLPlatterView *)objc_claimAutoreleasedReturnValue();
  platterView = self->_platterView;
  self->_platterView = v6;

  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", 23.5);
  -[SiriSharedUICompactConversationView addSubview:](self, "addSubview:", self->_platterView);
  v8 = [SiriSharedUIAdaptiveGrabberView alloc];
  v9 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  grabberView = self->_grabberView;
  self->_grabberView = v9;

  -[SiriSharedUIAdaptiveGrabberView sizeToFit](self->_grabberView, "sizeToFit");
  -[SiriSharedUIAdaptiveGrabberView setStyle:animated:](self->_grabberView, "setStyle:animated:", 0, 0);
  -[SiriSharedUICompactConversationView addSubview:](self, "addSubview:", self->_grabberView);
  -[SiriSharedUIAdaptiveGrabberView setTranslatesAutoresizingMaskIntoConstraints:](self->_grabberView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriSharedUIAdaptiveGrabberView centerXAnchor](self->_grabberView, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactConversationView centerXAnchor](self, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SiriSharedUIAdaptiveGrabberView topAnchor](self->_grabberView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactConversationView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  v17 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v17->super;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  v19 = self->_containerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[PLPlatterView customContentView](self->_platterView, "customContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_containerView);

  v22 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v22;

  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[SiriSharedUIStandardScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[SiriSharedUIStandardScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 2);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_scrollView);
  -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
  v25 = -[SiriSharedUICompactUserUtteranceView initWithContentInsets:cornerRadius:]([SiriSharedUICompactUserUtteranceView alloc], "initWithContentInsets:cornerRadius:", 16.0, 16.0, 0.0, 16.0, v24);
  userUtteranceView = self->_userUtteranceView;
  self->_userUtteranceView = v25;

  -[SiriSharedUICompactUserUtteranceView setDelegate:](self->_userUtteranceView, "setDelegate:", self);
  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_userUtteranceView);
  v27 = -[SiriSharedUICompactServerUtteranceView initWithContentInsets:delegate:]([SiriSharedUICompactServerUtteranceView alloc], "initWithContentInsets:delegate:", self, 16.0, 16.0, 16.0, 16.0);
  serverUtteranceView = self->_serverUtteranceView;
  self->_serverUtteranceView = v27;

  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_serverUtteranceView);
  v29 = objc_alloc_init(SiriSharedUIStandardView);
  conversationSnippetContainerView = self->_conversationSnippetContainerView;
  self->_conversationSnippetContainerView = &v29->super;

  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_conversationSnippetContainerView);
  -[SiriSharedUICompactConversationView setCurrentExpandablePlatterStyle:](self, "setCurrentExpandablePlatterStyle:", 1);
  v31 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v31);
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

- (void)prepareForUpdatesToServerUtterance:(BOOL)a3 conversationSnippetViews:(BOOL)a4 speechRecognitionHypothesis:(BOOL)a5 latencyViewModel:(BOOL)a6 updateBlock:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  _BOOL4 runningPrepareForUpdates;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conversationViewShouldAlwaysShowSpeechFeedback:", self);

  v14 = 0;
  if (((v13 ^ 1) & 1) == 0 && v7)
    v14 = !self->_waitingForFinalSpeechHypothesis;
  v15 = (v9 || v8) & (v13 ^ 1);
  v16 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315906;
    v28 = "-[SiriSharedUICompactConversationView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecogn"
          "itionHypothesis:latencyViewModel:updateBlock:]";
    v29 = 1024;
    v30 = runningPrepareForUpdates;
    v31 = 1024;
    v32 = v14;
    v33 = 1024;
    v34 = v15;
    _os_log_impl(&dword_1DE0BF000, v16, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForASRUpdating: %d, meetsRequirementsForContentUpdating: %d", buf, 0x1Eu);
  }
  if (self->_runningPrepareForUpdates || (v14 | v15) == 0)
  {
    if (v11)
    {
      if (self->_runningPrepareForUpdates)
      {
        -[SiriSharedUICompactConversationView prepareForUpdatesPendingCompletionBlocks](self, "prepareForUpdatesPendingCompletionBlocks");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v11, "copy");
        v21 = _Block_copy(v20);
        objc_msgSend(v19, "addObject:", v21);

      }
      else
      {
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
      }
    }
  }
  else
  {
    self->_runningPrepareForUpdates = 1;
    if (v14)
      self->_waitingForFinalSpeechHypothesis = 1;
    if (v11)
    {
      -[SiriSharedUICompactConversationView prepareForUpdatesPendingCompletionBlocks](self, "prepareForUpdatesPendingCompletionBlocks");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v11, "copy");
      v24 = _Block_copy(v23);
      objc_msgSend(v22, "addObject:", v24);

    }
    objc_initWeak((id *)buf, self);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke;
    v25[3] = &unk_1EA89CCF8;
    objc_copyWeak(&v26, (id *)buf);
    -[SiriSharedUICompactConversationView animateFadeOutWithCompletion:](self, "animateFadeOutWithCompletion:", v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

}

void __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke(uint64_t a1)
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
    *((_BYTE *)WeakRetained + 491) = 0;
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[SiriSharedUICompactConversationView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecog"
           "nitionHypothesis:latencyViewModel:updateBlock:]_block_invoke";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    -[SiriSharedUIAnimationContext setAnimationDuration:](v4, "setAnimationDuration:", 0.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_11;
    v5[3] = &unk_1EA89CC58;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v5, v4, 0);

  }
}

uint64_t __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_11(uint64_t a1)
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

- (void)didCompleteAnimatedFadeOut
{
  self->_runningAnimatedFadeOut = 0;
  if (self->_requestedAppearanceAnimation)
  {
    -[SiriSharedUICompactConversationView animateAppearanceIfNeeded](self, "animateAppearanceIfNeeded");
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
  if (-[SiriSharedUICompactConversationView layerHasOpacity](self, "layerHasOpacity"))
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SiriSharedUICompactConversationView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of conversationView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x1E0CD28B0];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke;
    v14 = &unk_1EA89CD20;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    objc_msgSend(v6, "setCompletionBlock:", &v11);
    -[SiriSharedUICompactConversationView layer](self, "layer", v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactConversationView _conversationDisappearAnimation](self, "_conversationDisappearAnimation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("conversationDisappearance"));

    -[SiriSharedUICompactConversationView layer](self, "layer");
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

void __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
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
    block[2] = __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_1EA89CC58;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteAnimatedFadeOut");
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
  if (self->_runningAnimatedFadeOut)
  {
    self->_requestedAppearanceAnimation = 1;
  }
  else if (!-[SiriSharedUICompactConversationView layerHasOpacity](self, "layerHasOpacity"))
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SiriSharedUICompactConversationView animateAppearanceIfNeeded]";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[SiriSharedUICompactConversationView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactConversationView _conversationAppearAnimation](self, "_conversationAppearAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("conversationAppearance"));

    -[SiriSharedUICompactConversationView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setOpacity:", v7);

    if (self->_isInAmbient)
      +[SiriSharedUICAFiltering applyGaussianBlurFilterToView:](SiriSharedUICAFiltering, "applyGaussianBlurFilterToView:", self);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)animateForDrillIn
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__SiriSharedUICompactConversationView_animateForDrillIn__block_invoke;
  v2[3] = &unk_1EA89CEB8;
  v2[4] = self;
  -[SiriSharedUICompactConversationView animateFadeOutWithCompletion:](self, "animateFadeOutWithCompletion:", v2);
}

uint64_t __56__SiriSharedUICompactConversationView_animateForDrillIn__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "didCompleteAnimatedFadeOut");
  return result;
}

- (id)_conversationAppearAnimation
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationViewShouldAlwaysShowSpeechFeedback:", self);

  if (v4)
    v5 = 4;
  else
    v5 = 3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriSharedUICompactConversationView frame](self, "frame");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", v5, v8, -[SiriSharedUICompactConversationView _animatedPresentationType](self, "_animatedPresentationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_conversationDisappearAnimation
{
  return +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 2, 0, -[SiriSharedUICompactConversationView _animatedPresentationType](self, "_animatedPresentationType"));
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (BOOL)layerHasOpacity
{
  void *v2;
  float v3;
  BOOL v4;

  -[SiriSharedUICompactConversationView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 > 0.0;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t *v12;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:");
  v7 = v6;
  -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", width, height);
  v9 = v8;
  -[SiriSharedUICompactConversationView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", width, height);
  v11 = v10;
  if (self->_isInAmbient)
  {
    if (self->_isInAmbientInteractivity)
      v12 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v12 = &SiriSharedUICompactAmbientContentScaleAmount;
    v11 = v10 * *(double *)v12;
  }
  v13 = 0.0;
  if (v7 > 0.0)
  {
    v13 = v7 + 0.0;
    if (v9 == 0.0)
    {
      -[SiriSharedUICompactConversationView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
      v13 = v13 + v14;
    }
  }
  v15 = -0.0;
  if (v9 > 0.0)
    v15 = v9;
  v16 = v15 + v13;
  if (v11 > 0.0)
  {
    if (v9 == 0.0 && v7 == 0.0)
    {
      -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
      v16 = v16 + v17;
    }
    -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
    v16 = v16 + v11 + v18;
  }
  if (!self->_currentExpandablePlatterStyle)
  {
    -[SiriSharedUICompactConversationView delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "maximumHeightForConversationView:", self);
    v21 = v20;

    if (v16 >= v21)
      v16 = v21;
  }
  v22 = width;
  v23 = v16;
  result.height = v23;
  result.width = v22;
  return result;
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
  SiriSharedUIStandardScrollView *scrollView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  double MaxY;
  double v29;
  SiriSharedUICompactUserUtteranceView *userUtteranceView;
  double v31;
  double v32;
  double v33;
  SiriSharedUICompactServerUtteranceView *serverUtteranceView;
  NSArray *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  double v41;
  uint64_t i;
  void *v43;
  NSDictionary *conversationSnippetVibrancyViews;
  void *v45;
  UIView *v46;
  double v47;
  double v48;
  double v50;
  double v51;
  double v52;
  double v53;
  UIView *hintVibrancyView;
  BOOL v55;
  void *v56;
  double v57;
  double v58;
  CGFloat x;
  double v60;
  CGFloat y;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat height;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  double v71;
  uint64_t *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  double rect;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGAffineTransform v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[9];
  objc_super v96;
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v98 = *MEMORY[0x1E0C80C00];
  v96.receiver = self;
  v96.super_class = (Class)SiriSharedUICompactConversationView;
  -[SiriSharedUICompactConversationView layoutSubviews](&v96, sel_layoutSubviews);
  -[SiriSharedUICompactConversationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriSharedUICompactConversationView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __53__SiriSharedUICompactConversationView_layoutSubviews__block_invoke;
    v95[3] = &unk_1EA89CD48;
    v95[4] = self;
    *(double *)&v95[5] = v4;
    *(double *)&v95[6] = v6;
    *(double *)&v95[7] = v8;
    *(double *)&v95[8] = v10;
    -[SiriSharedUICompactConversationView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v95, v12, 0);

  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", -[SiriSharedUICompactConversationView _useShadowForPlatter](self, "_useShadowForPlatter"));
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  scrollView = self->_scrollView;
  -[UIView bounds](self->_containerView, "bounds");
  -[SiriSharedUIStandardScrollView setFrame:](scrollView, "setFrame:");
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", v8, v10);
  v15 = v14;
  v17 = v16;
  -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", v8, 1.79769313e308);
  v99.size.height = v10;
  v19 = v18;
  v21 = v20;
  v80 = v6;
  v81 = v4;
  v99.origin.x = v4;
  v99.origin.y = v6;
  v99.size.width = v8;
  rect = v99.size.height;
  Width = CGRectGetWidth(v99);
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  v88 = v23;
  v24 = *MEMORY[0x1E0C9D820];
  v25 = (double *)MEMORY[0x1E0C9D648];
  v79 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v15 == *MEMORY[0x1E0C9D820] && v17 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v26 = Width * 0.5 - v19 * 0.5;
    -[SiriSharedUICompactUserUtteranceView setFrame:](self->_userUtteranceView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v27 = 0.0;
    MaxY = 0.0;
  }
  else
  {
    v29 = 0.0;
    if (!-[NSArray count](self->_serverUtterances, "count")
      && !-[NSArray count](self->_conversationSnippetViews, "count"))
    {
      v29 = rect * 0.5 - v17 * 0.5 + -8.0;
    }
    if (-[NSArray count](self->_serverUtterances, "count") || !self->_hasHintConversationSnippets)
    {
      userUtteranceView = self->_userUtteranceView;
    }
    else
    {
      userUtteranceView = self->_userUtteranceView;
      -[SiriSharedUICompactConversationView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
      v17 = v17 + v31;
    }
    v26 = 0.0;
    -[SiriSharedUICompactUserUtteranceView setFrame:](userUtteranceView, "setFrame:", 0.0, v29, v15, v17);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    MaxY = CGRectGetMaxY(v100);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    v27 = CGRectGetMaxY(v101);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    v32 = CGRectGetMaxY(v102);
    -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
    v88 = v32 + v33;
    if (-[SiriSharedUIStandardView isSemanticContentAttributeRightToLeft](self->_serverUtteranceView, "isSemanticContentAttributeRightToLeft"))
    {
      v103.origin.y = v80;
      v103.origin.x = v81;
      v103.size.width = v8;
      v103.size.height = rect;
      v26 = CGRectGetWidth(v103) - v19;
    }
  }
  serverUtteranceView = self->_serverUtteranceView;
  if (v19 == v24 && v21 == v79)
  {
    -[SiriSharedUICompactServerUtteranceView setFrame:](serverUtteranceView, "setFrame:", *v25, v25[1], v25[2], v25[3]);
  }
  else
  {
    -[SiriSharedUICompactServerUtteranceView setFrame:](serverUtteranceView, "setFrame:", v26, v27, v19, v21);
    -[SiriSharedUICompactServerUtteranceView frame](self->_serverUtteranceView, "frame");
    MaxY = CGRectGetMaxY(v104);
    -[SiriSharedUICompactServerUtteranceView frame](self->_serverUtteranceView, "frame");
    v88 = CGRectGetMaxY(v105);
  }
  v83 = v8;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v35 = self->_conversationSnippetViews;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  v37 = v79;
  if (v36)
  {
    v38 = v36;
    v39 = 0;
    v40 = *(_QWORD *)v92;
    v86 = v25[1];
    v87 = *v25;
    v84 = v25[3];
    v85 = v25[2];
    v89 = 0.0;
    v41 = 0.0;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v92 != v40)
          objc_enumerationMutation(v35);
        v43 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        -[SiriSharedUICompactConversationView _keyForSnippet:](self, "_keyForSnippet:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](conversationSnippetVibrancyViews, "objectForKey:", v45);
        v46 = (UIView *)objc_claimAutoreleasedReturnValue();

        -[SiriSharedUICompactConversationView _sizeOfSnippet:](self, "_sizeOfSnippet:", v43);
        if (v47 == v24 && v48 == v37)
        {
          objc_msgSend(v43, "setFrame:", v87, v86, v85, v84);
          -[UIView setFrame:](v46, "setFrame:", v87, v86, v85, v84);
        }
        else
        {
          v50 = v47;
          v51 = v48;
          v52 = v37;
          v53 = v24;
          objc_msgSend(v43, "setFrame:", 0.0, v41, v47, v48);
          -[UIView setFrame:](v46, "setFrame:", 0.0, v41, v50, v51);
          hintVibrancyView = self->_hintVibrancyView;
          if (hintVibrancyView)
            v55 = hintVibrancyView == v46;
          else
            v55 = 0;
          if (v55)
          {
            -[UIView layer](v46, "layer");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v57) = 1.0;
            objc_msgSend(v56, "setOpacity:", v57);

          }
          objc_msgSend(v43, "frame");
          x = v58;
          y = v60;
          v63 = v62;
          height = v64;
          if (self->_isInAmbient)
          {
            v66 = 1.0;
            if (!self->_isInAmbientInteractivity)
              v66 = 2.0;
            CGAffineTransformMakeScale(&v90, v66, v66);
            v106.origin.x = x;
            v106.origin.y = y;
            v106.size.width = v63;
            v106.size.height = height;
            v107 = CGRectApplyAffineTransform(v106, &v90);
            x = v107.origin.x;
            y = v107.origin.y;
            v63 = v107.size.width;
            height = v107.size.height;
          }
          v108.origin.x = x;
          v108.origin.y = y;
          v108.size.width = v63;
          v108.size.height = height;
          v67 = CGRectGetMaxY(v108);
          -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
          v41 = v67 + v68;
          v109.origin.x = x;
          v109.origin.y = y;
          v109.size.width = v63;
          v109.size.height = height;
          MaxY = v88 + CGRectGetMaxY(v109);
          v69 = v89;
          if (v89 < v50)
            v69 = v50;
          v89 = v69;
          if (v39)
          {
            v39 = 1;
          }
          else
          {
            v110.origin.y = v80;
            v110.origin.x = v81;
            v110.size.height = rect;
            v110.size.width = v83;
            v39 = floor(MaxY) > floor(CGRectGetHeight(v110));
          }
          v24 = v53;
          v37 = v52;
        }

      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v38);
  }
  else
  {
    v39 = 0;
    v89 = 0.0;
    v41 = 0.0;
  }

  if (self->_isInAmbient)
  {
    v70 = 0x1F0430000;
    v71 = v89;
    if (self->_allowAutomaticConversationSnippetViewScaling)
    {
      v72 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
      if (!self->_isInAmbientInteractivity)
        v72 = &SiriSharedUICompactAmbientContentScaleAmount;
      v71 = v89 * *(double *)v72;
    }
  }
  else
  {
    v70 = 0x1F0430000uLL;
    v71 = v89;
  }
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  if (*((_BYTE *)&self->super.super.super.super.isa + *(int *)(v70 + 2196)))
  {
    -[SiriSharedUICompactConversationView bounds](self, "bounds");
    v71 = v74;
    v75 = 0.0;
  }
  else
  {
    v75 = v73;
  }
  -[UIView setFrame:](self->_conversationSnippetContainerView, "setFrame:", v75, v88, v71, v41);
  -[SiriSharedUIStandardScrollView setContentSize:](self->_scrollView, "setContentSize:", v83, MaxY);
  if (!self->_currentExpandablePlatterStyle)
  {
    -[SiriSharedUIStandardScrollView frame](self->_scrollView, "frame");
    -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", MaxY > v76);
  }
  if (v39)
    v77 = 40.0;
  else
    v77 = 0.0;
  -[SiriSharedUIStandardScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, v77, 0.0);
  -[SiriSharedUICompactConversationView _updateExpandableDrawerUI](self, "_updateExpandableDrawerUI");
  -[SiriSharedUICompactConversationView stackContainerDelegate](self, "stackContainerDelegate");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "stackableContentDidLayout:", self);

}

uint64_t __53__SiriSharedUICompactConversationView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateExpandableDrawerUI
{
  double v3;
  double v4;
  double v5;
  int64_t currentExpandablePlatterStyle;
  _BOOL4 v7;
  double v8;
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v11;

  -[SiriSharedUIStandardScrollView contentSize](self->_scrollView, "contentSize");
  v4 = v3;
  -[SiriSharedUICompactConversationView frame](self, "frame");
  currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  v7 = currentExpandablePlatterStyle == 3 || self->_currentlyTrackingGesture;
  v8 = floor(v4);
  if (v8 > floor(v5))
    v7 = 1;
  v9 = currentExpandablePlatterStyle != 4;
  v10 = currentExpandablePlatterStyle != 4 && v7;
  -[SiriSharedUIAdaptiveGrabberView setHidden:](self->_grabberView, "setHidden:", v10 ^ 1);
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setEnabled:](self->_expandablePlatterGesture, "setEnabled:", v10);
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setScrollViewContentHeight:](self->_expandablePlatterGesture, "setScrollViewContentHeight:", v4);
  v11 = v8 > 200.0 && v9;
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setAllowExpandedState:](self->_expandablePlatterGesture, "setAllowExpandedState:", v11);
}

- (void)_resetExpansionStateForNewContent
{
  id v3;

  if (-[SiriSharedUICompactConversationView transitionToExpandablePlatterStyle:](self, "transitionToExpandablePlatterStyle:", 1))
  {
    -[SiriSharedUICompactConversationView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "conversationViewDidResetExpandedState:", self);

  }
}

- (void)setServerUtterances:(id)a3
{
  NSArray *v4;
  NSArray *serverUtterances;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  SiriSharedUICompactServerUtteranceView *serverUtteranceView;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double MaxY;
  NSArray *v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v4 = (NSArray *)a3;
  serverUtterances = self->_serverUtterances;
  if (serverUtterances != v4)
  {
    v26 = v4;
    v6 = -[NSArray isEqualToArray:](serverUtterances, "isEqualToArray:", v4);
    v4 = v26;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v26, "copy");
      v8 = self->_serverUtterances;
      self->_serverUtterances = v7;

      -[SiriSharedUICompactServerUtteranceView setUtterances:](self->_serverUtteranceView, "setUtterances:", self->_serverUtterances);
      serverUtteranceView = self->_serverUtteranceView;
      v10 = SiriSharedUILanguageSemanticContentAttribute();
      SiriSharedUIRecursiveSetSemanticContentAttribute(serverUtteranceView, v10);
      -[SiriSharedUICompactConversationView _resetExpansionStateForNewContent](self, "_resetExpansionStateForNewContent");
      if (v26
        && (-[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame"),
            !CGRectEqualToRect(v27, *MEMORY[0x1E0C9D648])))
      {
        -[SiriSharedUICompactConversationView bounds](self, "bounds");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", v16, v18);
        v21 = v20;
        v23 = v22;
        -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
        MinX = CGRectGetMinX(v28);
        -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
        MaxY = CGRectGetMaxY(v29);
        if (-[SiriSharedUIStandardView isSemanticContentAttributeRightToLeft](self->_serverUtteranceView, "isSemanticContentAttributeRightToLeft"))
        {
          v30.origin.x = v13;
          v30.origin.y = v15;
          v30.size.width = v17;
          v30.size.height = v19;
          MinX = CGRectGetWidth(v30) - v21;
        }
        -[SiriSharedUICompactServerUtteranceView setFrame:](self->_serverUtteranceView, "setFrame:", MinX, MaxY, v21, v23);
        -[SiriSharedUICompactServerUtteranceView layoutIfNeeded](self->_serverUtteranceView, "layoutIfNeeded");
        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
      -[SiriSharedUICompactConversationView _reloadConversationSnippetViewsIfHint](self, "_reloadConversationSnippetViewsIfHint");
      -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", v11);
      v4 = v26;
    }
  }

}

- (void)_reloadConversationSnippetViewsIfHint
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSDictionary *conversationSnippetVibrancyViews;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_didSetConversationSnippets)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_conversationSnippetViews;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (-[SiriSharedUICompactConversationView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v8, (_QWORD)v12))
          {
            conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
            -[SiriSharedUICompactConversationView _keyForSnippet:](self, "_keyForSnippet:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKey:](conversationSnippetVibrancyViews, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[SiriSharedUICompactConversationView _adjustHintCornerRadiusForSnippetView:vibrancyView:](self, "_adjustHintCornerRadiusForSnippetView:vibrancyView:", v8, v11);
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  id v4;
  SRUIFSpeechRecognitionHypothesis *v5;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  int v7;

  v4 = a3;
  v5 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(v4, "copy");
  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  self->_speechRecognitionHypothesis = v5;

  -[SiriSharedUICompactUserUtteranceView setSpeechRecognitionHypothesis:](self->_userUtteranceView, "setSpeechRecognitionHypothesis:", v4);
  v7 = objc_msgSend(v4, "isFinal");

  if (v7)
    self->_waitingForFinalSpeechHypothesis = 0;
  -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (BOOL)_isConversationSnippetHintType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isHint");
  else
    v4 = 0;

  return v4;
}

- (UIEdgeInsets)serverUtteranceContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_isInAmbient)
  {
    v2 = 6.0;
    if (!self->_speechRecognitionHypothesis)
      v2 = 16.0;
    v3 = 4.0;
  }
  else
  {
    v2 = 16.0;
    v3 = 16.0;
  }
  v4 = 16.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)userUtteranceContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_isInAmbient)
    v2 = 4.0;
  else
    v2 = 0.0;
  v3 = 16.0;
  v4 = 16.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)snippetContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_isInAmbient)
  {
    v2 = 16.0;
    v3 = 4.0;
  }
  else
  {
    if (self->_hasHintConversationSnippets)
      v3 = 0.0;
    else
      v3 = 8.0;
    v2 = v3;
  }
  v4 = v2;
  v5 = v2;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (void)setConversationSnippetViews:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  NSArray *conversationSnippetViews;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  SiriSharedUICompactConversationSnippetVibrancyView *v24;
  void *v25;
  double v26;
  void *v27;
  UIView *conversationSnippetContainerView;
  NSDictionary *conversationSnippetVibrancyViews;
  NSDictionary *v30;
  NSArray *obj;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_conversationSnippetViews, "isEqualToArray:", v4))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = self->_conversationSnippetViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v7);
    }

    v10 = (NSArray *)objc_msgSend(v4, "copy");
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v10;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSDictionary allValues](self->_conversationSnippetVibrancyViews, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "removeFromSuperview");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = self->_conversationSnippetViews;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (!v17)
    {
      LOBYTE(v32) = 1;
      goto LABEL_45;
    }
    v18 = v17;
    v19 = *(_QWORD *)v34;
    v32 = 1;
    while (1)
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
        v22 = SiriSharedUILanguageSemanticContentAttribute();
        SiriSharedUIRecursiveSetSemanticContentAttribute(v21, v22);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
          objc_msgSend(v21, "viewInsetsInConversationView:");
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v32 &= objc_msgSend(v21, "shouldAutomaticallyScaleContentInAmbient");
        v23 = -[SiriSharedUICompactConversationView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v21);
        if (!-[SiriSharedUICompactConversationView _shouldAddVibrancyForSnippet:](self, "_shouldAddVibrancyForSnippet:", v21)&& !v23)
        {
          v24 = 0;
          goto LABEL_33;
        }
        if (!v23)
        {
          v24 = -[SiriSharedUICompactConversationSnippetVibrancyView initWithStyle:]([SiriSharedUICompactConversationSnippetVibrancyView alloc], "initWithStyle:", 0);
          if (!v24)
            goto LABEL_33;
LABEL_32:
          -[SiriSharedUICompactConversationView _keyForSnippet:](self, "_keyForSnippet:", v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v30, "setObject:forKey:", v24, v27);

          goto LABEL_33;
        }
        self->_hasHintConversationSnippets = 1;
        v24 = -[SiriSharedUICompactConversationSnippetVibrancyView initWithStyle:]([SiriSharedUICompactConversationSnippetVibrancyView alloc], "initWithStyle:", 1);
        -[UIView frame](self->_conversationSnippetContainerView, "frame");
        -[SiriSharedUICompactConversationSnippetVibrancyView setFrame:](v24, "setFrame:");
        -[SiriSharedUICompactConversationSnippetVibrancyView layer](v24, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = 0;
        objc_msgSend(v25, "setOpacity:", v26);

        objc_storeStrong((id *)&self->_hintVibrancyView, v24);
        objc_storeStrong((id *)&self->_hintSnippetView, v21);
        if (v24)
          goto LABEL_32;
LABEL_33:
        conversationSnippetContainerView = self->_conversationSnippetContainerView;
        if (conversationSnippetContainerView)
        {
          -[UIView addSubview:](conversationSnippetContainerView, "addSubview:", v21);
          if (v24)
            -[UIView addSubview:](self->_conversationSnippetContainerView, "addSubview:", v24);
        }
        else
        {
          -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", v21);
          if (v24)
            -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", v24);
        }
        if (v23)
          -[SiriSharedUICompactConversationView _adjustHintCornerRadiusForSnippetView:vibrancyView:](self, "_adjustHintCornerRadiusForSnippetView:vibrancyView:", v21, v24);
        else
          -[SiriSharedUICompactConversationView _adjustCornerRadiusForSnippetView:vibrancyView:](self, "_adjustCornerRadiusForSnippetView:vibrancyView:", v21, v24);
        objc_msgSend(v21, "setClipsToBounds:", 1);

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (!v18)
      {
LABEL_45:

        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        self->_conversationSnippetVibrancyViews = v30;

        -[SiriSharedUICompactConversationView setAllowAutomaticConversationSnippetViewScaling:](self, "setAllowAutomaticConversationSnippetViewScaling:", v32 & 1);
        -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
        self->_didSetConversationSnippets = 1;
        break;
      }
    }
  }

}

- (BOOL)contentSupportsCollapsingForHeight:(double)a3
{
  return 10.0 + 60.0 < a3;
}

- (BOOL)willAutomaticallyCollapseWhenResultIsScrolled
{
  double Height;
  CGRect v5;

  if (self->_isInAmbient)
    return 0;
  -[SiriSharedUICompactConversationView frame](self, "frame");
  Height = CGRectGetHeight(v5);
  return self->_automaticallyCollapseWhenResultIsScrolled
      && -[SiriSharedUICompactConversationView contentSupportsCollapsingForHeight:](self, "contentSupportsCollapsingForHeight:", Height);
}

- (void)snippetContentDidUpdate
{
  -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (void)snippetContentDidUpdateForHint
{
  uint64_t v3;

  if (-[NSArray count](self->_serverUtterances, "count")
    || -[NSArray count](self->_conversationSnippetViews, "count") > 1
    || self->_speechRecognitionHypothesis)
  {
    -[SiriSharedUICompactConversationView _prepareHintForAnimation](self, "_prepareHintForAnimation");
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", v3);
}

- (void)_prepareHintForAnimation
{
  double v3;
  double v4;
  double v5;
  CGRect v7;

  -[SiriSharedUICompactConversationView _sizeOfSnippet:](self, "_sizeOfSnippet:", self->_hintSnippetView);
  v5 = v4;
  if (v4 != *MEMORY[0x1E0C9D820] || v3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIView frame](self->_hintVibrancyView, "frame");
    if (CGRectEqualToRect(v7, *MEMORY[0x1E0C9D648]))
    {
      -[UIView setFrame:](self->_hintVibrancyView, "setFrame:", 0.0, 0.0, v5, 0.0);
      -[UIView setFrame:](self->_hintSnippetView, "setFrame:", 0.0, 0.0, v5, 0.0);
      -[UIView layoutIfNeeded](self->_hintSnippetView, "layoutIfNeeded");
      -[UIView layoutIfNeeded](self->_hintVibrancyView, "layoutIfNeeded");
    }
  }
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
  -[SiriSharedUICompactConversationView stackContainerDelegate](self, "stackContainerDelegate", 556.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackableContentMaximumContainerWidth");
  v9 = v8 + v6 * -2.0;

  if (v4 >= v9)
    v10 = v9;
  else
    v10 = v4;
  -[SiriSharedUICompactConversationView sizeThatFits:](self, "sizeThatFits:", v10, 1.79769313e308);
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  int64_t currentExpandablePlatterStyle;
  double currentExpandedGestureHeight;
  double v7;
  CGSize result;

  -[SiriSharedUICompactConversationView _fittingSize](self, "_fittingSize");
  currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle == 2)
  {
    currentExpandedGestureHeight = 60.0;
  }
  else
  {
    currentExpandedGestureHeight = self->_currentExpandedGestureHeight;
    if (currentExpandedGestureHeight <= 0.0)
    {
      if (currentExpandablePlatterStyle)
      {
        currentExpandedGestureHeight = v4;
        if (!self->_isInAmbient)
        {
          currentExpandedGestureHeight = 200.0;
          if (v4 < 200.0)
            currentExpandedGestureHeight = v4;
        }
      }
      else
      {
        currentExpandedGestureHeight = v4;
      }
    }
  }
  v7 = currentExpandedGestureHeight;
  result.height = v7;
  result.width = v3;
  return result;
}

- (void)relayout
{
  -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
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
  -[SiriSharedUICompactConversationView _fittingSize](self, "_fittingSize");
  v6 = v5;
  v8 = v7;
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer setInitialHeight:](self->_expandablePlatterGesture, "setInitialHeight:", v7);
  -[SiriSharedUICompactConversationView _updateSubviewContentInsets](self, "_updateSubviewContentInsets");
  -[SiriSharedUICompactConversationView stackContainerDelegate](self, "stackContainerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  -[SiriSharedUICompactConversationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3
{
  if (self->_allowAutomaticConversationSnippetViewScaling != a3)
  {
    self->_allowAutomaticConversationSnippetViewScaling = a3;
    -[SiriSharedUICompactConversationView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_isInAmbient != a3)
  {
    v3 = a3;
    self->_isInAmbient = a3;
    -[SiriSharedUICompactConversationView _updateSubviewContentInsets](self, "_updateSubviewContentInsets");
    -[SiriSharedUICompactUserUtteranceView setIsInAmbient:](self->_userUtteranceView, "setIsInAmbient:", v3);
    -[SiriSharedUICompactServerUtteranceView setIsInAmbient:](self->_serverUtteranceView, "setIsInAmbient:", v3);
    -[SiriSharedUICompactConversationView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
    -[PLPlatterView backgroundView](self->_platterView, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", self->_isInAmbient);

    -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", -[SiriSharedUICompactConversationView _useShadowForPlatter](self, "_useShadowForPlatter"));
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_isInAmbientInteractivity != a3)
  {
    v3 = a3;
    self->_isInAmbientInteractivity = a3;
    -[SiriSharedUICompactUserUtteranceView setIsInAmbientInteractivity:](self->_userUtteranceView, "setIsInAmbientInteractivity:");
    -[SiriSharedUICompactServerUtteranceView setIsInAmbientInteractivity:](self->_serverUtteranceView, "setIsInAmbientInteractivity:", v3);
    -[SiriSharedUICompactConversationView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
  }
}

- (void)_updateSubviewContentInsets
{
  SiriSharedUICompactUserUtteranceView *userUtteranceView;
  SiriSharedUICompactServerUtteranceView *serverUtteranceView;

  userUtteranceView = self->_userUtteranceView;
  -[SiriSharedUICompactConversationView userUtteranceContentInsets](self, "userUtteranceContentInsets");
  -[SiriSharedUICompactUserUtteranceView setContentInsets:](userUtteranceView, "setContentInsets:");
  serverUtteranceView = self->_serverUtteranceView;
  -[SiriSharedUICompactConversationView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
  -[SiriSharedUICompactServerUtteranceView setContentInsets:](serverUtteranceView, "setContentInsets:");
}

- (void)_updateAmbientSnippetScaling
{
  uint64_t *v2;
  UIView *conversationSnippetContainerView;
  CGAffineTransform *v4;
  UIView *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;

  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity)
      v2 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v2 = &SiriSharedUICompactAmbientContentScaleAmount;
    conversationSnippetContainerView = self->_conversationSnippetContainerView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    v4 = &v10;
    v5 = conversationSnippetContainerView;
  }
  else
  {
    v5 = self->_conversationSnippetContainerView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v6;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4 = (CGAffineTransform *)&v7;
  }
  -[UIView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
}

- (BOOL)_useShadowForPlatter
{
  CGRect v4;

  -[SiriSharedUICompactConversationView bounds](self, "bounds");
  return CGRectGetHeight(v4) > 0.0 && !self->_isInAmbient;
}

- (void)setShowCollapsedUI:(BOOL)a3
{
  if (self->_showingCollapsedUI != a3)
  {
    self->_showingCollapsedUI = a3;
    -[SiriSharedUIAdaptiveGrabberView setStyle:animated:](self->_grabberView, "setStyle:animated:", a3, 1);
  }
}

- (void)setCurrentExpandablePlatterStyle:(int64_t)a3
{
  void *v4;
  SiriSharedUIStandardScrollView *scrollView;
  uint64_t v7;
  id v8;

  self->_currentExpandablePlatterStyle = a3;
  if (a3 == 2)
  {
    -[SiriSharedUICompactConversationView setShowCollapsedUI:](self, "setShowCollapsedUI:", 1);
    -[SiriSharedUICompactConversationView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationViewDidTransitionToCollapsedState:", self);

  }
  else
  {
    -[SiriSharedUICompactConversationView setShowCollapsedUI:](self, "setShowCollapsedUI:", 0);
    switch(a3)
    {
      case 1:
        self->_automaticallyCollapseWhenResultIsScrolled = 1;
        goto LABEL_8;
      case 4:
        self->_automaticallyCollapseWhenResultIsScrolled = 0;
        scrollView = self->_scrollView;
        v7 = 1;
        goto LABEL_9;
      case 3:
        self->_automaticallyCollapseWhenResultIsScrolled = 0;
        -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
        -[SiriSharedUICompactConversationView delegate](self, "delegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "conversationViewDidTransitionToExpandedState:", self);

        return;
    }
  }
  self->_automaticallyCollapseWhenResultIsScrolled = 0;
LABEL_8:
  scrollView = self->_scrollView;
  v7 = 0;
LABEL_9:
  -[SiriSharedUIStandardScrollView setScrollEnabled:](scrollView, "setScrollEnabled:", v7);
}

- (BOOL)transitionToExpandablePlatterStyle:(int64_t)a3
{
  int64_t currentExpandablePlatterStyle;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *expandablePlatterGesture;
  SiriSharedUICompactConversationView *v8;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v9;
  uint64_t v10;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v11;

  currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle != a3 && currentExpandablePlatterStyle != 0)
  {
    switch(a3)
    {
      case 1:
        -[SiriSharedUICompactConversationView _resetExpandablePlatterGestureState](self, "_resetExpandablePlatterGestureState");
        -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
        break;
      case 2:
        expandablePlatterGesture = self->_expandablePlatterGesture;
        -[SiriSharedUIExpandablePlatterPanGestureRecognizer collapsedHeight](expandablePlatterGesture, "collapsedHeight");
        v8 = self;
        v9 = expandablePlatterGesture;
        v10 = 2;
        goto LABEL_9;
      case 3:
        v11 = self->_expandablePlatterGesture;
        -[SiriSharedUIExpandablePlatterPanGestureRecognizer expandedHeight](v11, "expandedHeight");
        v8 = self;
        v9 = v11;
        v10 = 3;
LABEL_9:
        -[SiriSharedUICompactConversationView expandablePlatterGesture:didCompleteTransitionToStyle:phaseHeight:](v8, "expandablePlatterGesture:didCompleteTransitionToStyle:phaseHeight:", v9, v10);
        break;
      case 4:
        -[SiriSharedUICompactConversationView setNeedsLayout](self, "setNeedsLayout");
        break;
      default:
        break;
    }
    -[SiriSharedUICompactConversationView setCurrentExpandablePlatterStyle:](self, "setCurrentExpandablePlatterStyle:", a3);
    -[SiriSharedUICompactConversationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  return currentExpandablePlatterStyle != 0;
}

- (void)userUtteranceViewTapped:(id)a3
{
  id v4;

  -[SiriSharedUICompactConversationView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tapToEditRequestedFromView:", self);

}

- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidAppear:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "backingAceObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "backingAceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "conversationView:viewDidAppearForAceObject:", self, v7);

  }
}

- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidDisappear:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "backingAceObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "backingAceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "conversationView:viewDidDisappearForAceObject:", self, v7);

  }
}

- (void)serverUtteranceView:(id)a3 utteranceViewDidAppear:(id)a4
{
  SiriSharedUICompactConversationViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "conversationView:viewDidAppearForAceObject:", self, v6);

}

- (void)serverUtteranceView:(id)a3 utteranceViewDidDisappear:(id)a4
{
  SiriSharedUICompactConversationViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "conversationView:viewDidDisappearForAceObject:", self, v6);

}

- (id)parserSpeakableObjectProviderForServerUtterance:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parserSpeakableObjectProviderForConversationView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)expandablePlatterGesture:(id)a3 didCompleteTransitionToStyle:(int64_t)a4 phaseHeight:(double)a5
{
  double v7;
  double v8;
  void *v9;
  void *v10;

  -[SiriSharedUICompactConversationView setCurrentExpandablePlatterStyle:](self, "setCurrentExpandablePlatterStyle:", a4);
  self->_currentExpandedGestureHeight = a5;
  -[SiriSharedUICompactConversationView frame](self, "frame");
  v8 = v7;
  -[SiriSharedUICompactConversationView stackContainerDelegate](self, "stackContainerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 1, v8, a5);

  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversationView:didUpdateHeightDuringExpansionTransition:didCompleteGesture:", self, 1, a5);

  -[SiriSharedUICompactConversationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)expandablePlatterGesture:(id)a3 trackingGestureDidUpdateHeight:(double)a4
{
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  -[SiriSharedUIExpandablePlatterPanGestureRecognizer collapsedHeight](self->_expandablePlatterGesture, "collapsedHeight", a3);
  -[SiriSharedUICompactConversationView setShowCollapsedUI:](self, "setShowCollapsedUI:", v6 >= a4);
  self->_currentExpandedGestureHeight = a4;
  -[SiriSharedUICompactConversationView frame](self, "frame");
  v8 = v7;
  -[SiriSharedUICompactConversationView stackContainerDelegate](self, "stackContainerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 0, v8, a4);

  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversationView:didUpdateHeightDuringExpansionTransition:didCompleteGesture:", self, 0, a4);

  -[SiriSharedUICompactConversationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateExpandedHeight
{
  void *v3;
  double v4;
  double v5;

  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expectedExpandedHeightForConversationView:", self);
  v5 = v4;

  if (v5 > 0.0)
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer setExpandedHeight:](self->_expandablePlatterGesture, "setExpandedHeight:", v5);
}

- (void)expandablePlatterGestureDidBeginWithRecognizer:(id)a3
{
  id v4;
  CGRect v5;

  -[SiriSharedUICompactConversationView _updateExpandedHeight](self, "_updateExpandedHeight", a3);
  self->_currentlyTrackingGesture = 1;
  -[SiriSharedUICompactConversationView frame](self, "frame");
  self->_currentExpandedGestureHeight = CGRectGetHeight(v5);
  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationViewDidBeginExpandTransition:", self);

}

- (void)_resetExpandablePlatterGestureState
{
  self->_currentlyTrackingGesture = 0;
  self->_currentExpandedGestureHeight = 0.0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v5 = a3;
  -[SiriSharedUICompactConversationView delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v10, "conversationViewContentScrolled:toContentOffset:", self, v7, v9);
}

- (CGSize)_sizeOfSnippet:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  -[SiriSharedUICompactConversationView bounds](self, "bounds");
  v6 = v5;
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  v8 = v6 - v7;
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  v10 = v8 - v9;
  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity)
      v11 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v11 = &SiriSharedUICompactAmbientContentScaleAmount;
    v10 = v10 / *(double *)v11;
  }
  -[SiriSharedUICompactConversationView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v4, v10, 1.79769313e308);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v29 = *MEMORY[0x1E0C80C00];
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  v7 = v6;
  -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
  v9 = v8;
  v11 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_conversationSnippetViews;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = width - v7 - v9;
    v16 = *(_QWORD *)v25;
    v17 = 0.0;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v12);
        -[SiriSharedUICompactConversationView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), v15, height, (_QWORD)v24);
        v11 = fmax(v11, v19);
        v10 = v10 + v17 + v20;
        -[SiriSharedUICompactConversationView snippetContentInsets](self, "snippetContentInsets");
        v17 = v21;
        ++v18;
      }
      while (v14 != v18);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v22 = v11;
  v23 = v10;
  result.height = v23;
  result.width = v22;
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

- (BOOL)_shouldAddVibrancyForSnippet:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "suppressVibrantBackground") ^ 1;
  }
  else
  {
    objc_msgSend(v3, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      LOBYTE(v4) = 1;
    }

  }
  return v4;
}

- (id)_keyForSnippet:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
}

- (void)_adjustCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(a3, "_setContinuousCornerRadius:", 17.5);
  objc_msgSend(v5, "_setContinuousCornerRadius:", 17.5);

}

- (void)_adjustHintCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4
{
  NSArray *serverUtterances;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  serverUtterances = self->_serverUtterances;
  v7 = a4;
  v8 = a3;
  if (-[NSArray count](serverUtterances, "count") || -[NSArray count](self->_conversationSnippetViews, "count") > 1)
  {
    v9 = 12;
  }
  else if (self->_speechRecognitionHypothesis)
  {
    v9 = 12;
  }
  else
  {
    v9 = 15;
  }
  objc_msgSend(v8, "_setContinuousCornerRadius:", 23.5);
  objc_msgSend(v7, "_setContinuousCornerRadius:", 23.5);
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setMaskedCorners:", v9);
  objc_msgSend(v7, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMaskedCorners:", v9);
}

- (void)userUtteranceViewContentHeightDidUpdate:(id)a3
{
  id WeakRetained;

  -[SiriSharedUICompactConversationView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "conversationViewDidUpdatePresentedContentHeight:", self);

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

- (NSArray)conversationSnippetViews
{
  return self->_conversationSnippetViews;
}

- (BOOL)isCurrentlyTrackingGesture
{
  return self->_currentlyTrackingGesture;
}

- (SiriSharedUICompactConversationViewDelegate)delegate
{
  return (SiriSharedUICompactConversationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)userUtterance
{
  return self->_userUtterance;
}

- (void)setUserUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (void)setLatencyViewModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
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

- (BOOL)useLowerPriorityHeightConstraint
{
  return self->useLowerPriorityHeightConstraint;
}

- (void)setUseLowerPriorityHeightConstraint:(BOOL)a3
{
  self->useLowerPriorityHeightConstraint = a3;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, a3);
}

- (SiriSharedUIDropletContentDelegate)dropletContainerDelegate
{
  return (SiriSharedUIDropletContentDelegate *)objc_loadWeakRetained((id *)&self->dropletContainerDelegate);
}

- (void)setDropletContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->dropletContainerDelegate, a3);
}

- (SiriSharedUIStandardScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)showingCollapsedUI
{
  return self->_showingCollapsedUI;
}

- (void)setShowingCollapsedUI:(BOOL)a3
{
  self->_showingCollapsedUI = a3;
}

- (int64_t)currentExpandablePlatterStyle
{
  return self->_currentExpandablePlatterStyle;
}

- (SiriSharedUIExpandablePlatterPanGestureRecognizer)expandablePlatterGesture
{
  return self->_expandablePlatterGesture;
}

- (void)setExpandablePlatterGesture:(id)a3
{
  objc_storeStrong((id *)&self->_expandablePlatterGesture, a3);
}

- (UIView)conversationSnippetContainerView
{
  return self->_conversationSnippetContainerView;
}

- (void)setConversationSnippetContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_conversationSnippetContainerView, a3);
}

- (SiriSharedUICompactServerUtteranceView)_serverUtteranceView
{
  return self->_serverUtteranceView;
}

- (void)_setServerUtteranceView:(id)a3
{
  objc_storeStrong((id *)&self->_serverUtteranceView, a3);
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)allowAutomaticConversationSnippetViewScaling
{
  return self->_allowAutomaticConversationSnippetViewScaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUtteranceView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetContainerView, 0);
  objc_storeStrong((id *)&self->_expandablePlatterGesture, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->dropletContainerDelegate);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->customAttachmentConstraints, 0);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_hintSnippetView, 0);
  objc_storeStrong((id *)&self->_hintVibrancyView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetVibrancyViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_userUtteranceView, 0);
}

@end
