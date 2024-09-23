@implementation SiriSharedUISmartDialogView

- (SiriSharedUISmartDialogView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4
{
  return -[SiriSharedUISmartDialogView initWithFrame:](self, "initWithFrame:", a3, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SiriSharedUISmartDialogView)initWithFrame:(CGRect)a3
{
  SiriSharedUISmartDialogView *v3;
  SiriSharedUISmartDialogView *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUISmartDialogView;
  v3 = -[SiriSharedUISmartDialogView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    v3->_state = 2;
    -[SiriSharedUISmartDialogView _setupSubviews](v3, "_setupSubviews");
    -[SiriSharedUISmartDialogView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 0;
    objc_msgSend(v5, "setOpacity:", v6);
    objc_msgSend(v5, "setCornerRadius:", 23.5);
    objc_msgSend(v5, "setMasksToBounds:", 0);

  }
  return v4;
}

- (SiriSharedUISmartDialogView)initWithResultView:(id)a3
{
  id v4;
  SiriSharedUISmartDialogView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUISmartDialogView;
  v5 = -[SiriSharedUISmartDialogView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(v4, "snippetView");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUISmartDialogView setConversationSnippetViews:](v5, "setConversationSnippetViews:", v8);

    }
    v5->_state = 2;
    -[SiriSharedUISmartDialogView _setupSubviews](v5, "_setupSubviews");
    -[SiriSharedUISmartDialogView layer](v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);
    objc_msgSend(v9, "setCornerRadius:", 23.5);

  }
  return v5;
}

- (SiriSharedUISmartDialogView)initWithSuggestionView:(id)a3
{
  id v4;
  SiriSharedUISmartDialogView *v5;
  SiriSharedUISmartDialogView *v6;
  void *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUISmartDialogView;
  v5 = -[SiriSharedUISmartDialogView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    if (v4)
      -[SiriSharedUISmartDialogView _setSuggestionView:](v5, "_setSuggestionView:", v4);
    -[SiriSharedUISmartDialogView _setupSubviews](v6, "_setupSubviews");
    -[SiriSharedUISmartDialogView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);

    v6->_state = 0;
  }

  return v6;
}

- (void)_setupSubviews
{
  PLPlatterView *v3;
  PLPlatterView *platterView;
  void *v5;
  void *v6;
  SiriSharedUIStandardView *v7;
  UIView *containerView;
  UIView *v9;
  void *v10;
  void *v11;
  SiriSharedUIStandardScrollView *v12;
  SiriSharedUIStandardScrollView *scrollView;
  double v14;
  SiriSharedUICompactUserUtteranceView *v15;
  SiriSharedUICompactUserUtteranceView *userUtteranceView;
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v17;
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *smartDialogContainer;
  UIView *v19;
  UIView *smartDialogView;
  SiriSharedUIStandardView *v21;
  UIView *snippetContainerView;
  uint64_t v23;

  objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithStyle:", 0);
  v3 = (PLPlatterView *)objc_claimAutoreleasedReturnValue();
  platterView = self->_platterView;
  self->_platterView = v3;

  -[PLPlatterView layer](self->_platterView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  -[PLPlatterView backgroundView](self->_platterView, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", 23.5);
  -[SiriSharedUISmartDialogView addSubview:](self, "addSubview:", self->_platterView);
  v7 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v7->super;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  v9 = self->_containerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[PLPlatterView customContentView](self->_platterView, "customContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_containerView);

  v12 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v12;

  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[SiriSharedUIStandardScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[SiriSharedUIStandardScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[SiriSharedUIStandardScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 2);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_scrollView);
  -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
  v15 = -[SiriSharedUICompactUserUtteranceView initWithContentInsets:cornerRadius:]([SiriSharedUICompactUserUtteranceView alloc], "initWithContentInsets:cornerRadius:", 20.0, 24.0, 0.0, 24.0, v14);
  userUtteranceView = self->_userUtteranceView;
  self->_userUtteranceView = v15;

  -[SiriSharedUICompactUserUtteranceView setDelegate:](self->_userUtteranceView, "setDelegate:", self);
  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_userUtteranceView);
  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_suggestionView);
  v17 = -[SiriSharedUISmartDialogContainer initWithDelegate:]([_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer alloc], "initWithDelegate:", self);
  smartDialogContainer = self->_smartDialogContainer;
  self->_smartDialogContainer = v17;

  -[SiriSharedUISmartDialogContainer view](self->_smartDialogContainer, "view");
  v19 = (UIView *)objc_claimAutoreleasedReturnValue();
  smartDialogView = self->_smartDialogView;
  self->_smartDialogView = v19;

  -[UIView setHidden:](self->_smartDialogView, "setHidden:", 1);
  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_smartDialogView);
  v21 = objc_alloc_init(SiriSharedUIStandardView);
  snippetContainerView = self->_snippetContainerView;
  self->_snippetContainerView = &v21->super;

  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_snippetContainerView);
  -[SiriSharedUISmartDialogView setCurrentExpandablePlatterStyle:](self, "setCurrentExpandablePlatterStyle:", 0);
  v23 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v23);
}

- (id)contentContainerView
{
  return self->_scrollView;
}

- (void)setPopoverViewController:(id)a3
{
  -[SiriSharedUISmartDialogContainer setPopoverViewController:](self->_smartDialogContainer, "setPopoverViewController:", a3);
}

- (void)prepareForDrillInAnimation
{
  void *v3;
  void *v4;

  -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[PLPlatterView backgroundView](self->_platterView, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", 0);
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
  _BOOL4 v10;
  id v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  _BOOL4 runningPrepareForUpdates;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  -[SiriSharedUISmartDialogView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "conversationViewShouldAlwaysShowSpeechFeedback:", self);

  v15 = 0;
  if (((v14 ^ 1) & 1) == 0 && v8)
    v15 = !self->_waitingForFinalSpeechHypothesis;
  v16 = (v9 || v7 || v10) & (v14 ^ 1);
  v17 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315906;
    v29 = "-[SiriSharedUISmartDialogView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHyp"
          "othesis:latencyViewModel:updateBlock:]";
    v30 = 1024;
    v31 = runningPrepareForUpdates;
    v32 = 1024;
    v33 = v15;
    v34 = 1024;
    v35 = v16;
    _os_log_impl(&dword_1DE0BF000, v17, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForASRUpdating: %d, meetsRequirementsForContentUpdating: %d", buf, 0x1Eu);
  }
  if (self->_runningPrepareForUpdates || (v15 | v16) == 0)
  {
    if (v12)
    {
      if (self->_runningPrepareForUpdates)
      {
        -[SiriSharedUISmartDialogView prepareForUpdatesPendingCompletionBlocks](self, "prepareForUpdatesPendingCompletionBlocks");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v12, "copy");
        v22 = _Block_copy(v21);
        objc_msgSend(v20, "addObject:", v22);

      }
      else
      {
        (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
      }
    }
  }
  else
  {
    self->_runningPrepareForUpdates = 1;
    if (v15)
      self->_waitingForFinalSpeechHypothesis = 1;
    if (v12)
    {
      -[SiriSharedUISmartDialogView prepareForUpdatesPendingCompletionBlocks](self, "prepareForUpdatesPendingCompletionBlocks");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v12, "copy");
      v25 = _Block_copy(v24);
      objc_msgSend(v23, "addObject:", v25);

    }
    objc_initWeak((id *)buf, self);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke;
    v26[3] = &unk_1EA89CCF8;
    objc_copyWeak(&v27, (id *)buf);
    -[SiriSharedUISmartDialogView animateFadeOutWithCompletion:](self, "animateFadeOutWithCompletion:", v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

}

void __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke(uint64_t a1)
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
      v7 = "-[SiriSharedUISmartDialogView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHy"
           "pothesis:latencyViewModel:updateBlock:]_block_invoke";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    -[SiriSharedUIAnimationContext setAnimationDuration:](v4, "setAnimationDuration:", 0.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_10;
    v5[3] = &unk_1EA89CC58;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v5, v4, 0);

  }
}

uint64_t __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_10(uint64_t a1)
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
    -[SiriSharedUISmartDialogView animateAppearanceIfNeeded](self, "animateAppearanceIfNeeded");
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
  if (-[SiriSharedUISmartDialogView layerHasOpacity](self, "layerHasOpacity"))
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SiriSharedUISmartDialogView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of conversationView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x1E0CD28B0];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke;
    v14 = &unk_1EA89CD20;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    objc_msgSend(v6, "setCompletionBlock:", &v11);
    -[SiriSharedUISmartDialogView animatingLayer](self, "animatingLayer", v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUISmartDialogView _conversationDisappearAnimation](self, "_conversationDisappearAnimation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("conversationDisappearance"));

    -[SiriSharedUISmartDialogView animatingLayer](self, "animatingLayer");
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

void __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
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
    block[2] = __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_1EA89CC58;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
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
  else if (!-[SiriSharedUISmartDialogView layerHasOpacity](self, "layerHasOpacity"))
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SiriSharedUISmartDialogView animateAppearanceIfNeeded]";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[SiriSharedUISmartDialogView animatingLayer](self, "animatingLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUISmartDialogView _conversationAppearAnimation](self, "_conversationAppearAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("conversationAppearance"));

    -[SiriSharedUISmartDialogView animatingLayer](self, "animatingLayer");
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
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *smartDialogContainer;
  void *v4;

  smartDialogContainer = self->_smartDialogContainer;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISmartDialogContainer updateHeaderWithText:color:](smartDialogContainer, "updateHeaderWithText:color:", &stru_1EA89F868, v4);

  -[SiriSharedUISmartDialogContainer updateBodyWithText:](self->_smartDialogContainer, "updateBodyWithText:", CFSTR("\n"));
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

  -[SiriSharedUISmartDialogView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationViewShouldAlwaysShowSpeechFeedback:", self);

  if (v4)
    v5 = 4;
  else
    v5 = 3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriSharedUISmartDialogView frame](self, "frame");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", v5, v8, -[SiriSharedUISmartDialogView _animatedPresentationType](self, "_animatedPresentationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_conversationDisappearAnimation
{
  return +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 2, 0, -[SiriSharedUISmartDialogView _animatedPresentationType](self, "_animatedPresentationType"));
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

  -[SiriSharedUISmartDialogView animatingLayer](self, "animatingLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 > 0.0;

  return v4;
}

- (id)animatingLayer
{
  SiriSharedUISmartDialogView *v2;
  void *v3;
  float v4;
  float v5;

  v2 = self;
  -[SiriSharedUISmartDialogView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  v5 = v4;

  if (v5 != 0.0)
    v2 = (SiriSharedUISmartDialogView *)v2->_scrollView;
  -[SiriSharedUISmartDialogView layer](v2, "layer");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transitionToResult
{
  self->_state = 2;
  -[UIView setHidden:](self->_suggestionView, "setHidden:", 1);
}

- (BOOL)ongoingASR
{
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  BOOL v4;
  void *v5;

  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  if (!speechRecognitionHypothesis
    || (-[SRUIFSpeechRecognitionHypothesis isFinal](speechRecognitionHypothesis, "isFinal") & 1) != 0)
  {
    return 0;
  }
  -[SRUIFSpeechRecognitionHypothesis backingAceObject](self->_speechRecognitionHypothesis, "backingAceObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (BOOL)hasResult
{
  return !-[SiriSharedUISmartDialogContainer shouldBeHidden](self->_smartDialogContainer, "shouldBeHidden")
      || -[NSArray count](self->_conversationSnippetViews, "count") != 0;
}

- (UIView)suggestionView
{
  UIView *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_suggestionView;
  else
    v3 = 0;
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int64_t state;
  uint64_t v7;
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
  uint64_t *v18;
  double v19;
  double v20;
  UIView **p_smartDialogView;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  state = self->_state;
  if (!state)
  {
    v7 = 704;
    goto LABEL_5;
  }
  if (state == 1)
  {
    v7 = 424;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v7), "sizeThatFits:", a3.width, a3.height);
    goto LABEL_36;
  }
  -[SiriSharedUILatencyView sizeThatFits:](self->_latencyView, "sizeThatFits:", a3.width, a3.height);
  v11 = v10;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", width, height);
  v13 = v12;
  -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", width + -48.0, height);
  v15 = v14;
  -[SiriSharedUISmartDialogView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", width, height);
  v17 = v16;
  if (self->_isInAmbient)
  {
    if (self->_isInAmbientInteractivity)
      v18 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v18 = &SiriSharedUICompactAmbientContentScaleAmount;
    v17 = v16 * *(double *)v18;
  }
  if (v11 <= 0.0)
    v19 = 0.0;
  else
    v19 = v11 + 0.0;
  if (v13 <= 0.0)
  {
    p_smartDialogView = &self->_smartDialogView;
    v22 = -[UIView isHidden](self->_smartDialogView, "isHidden");
    v23 = 20.0;
  }
  else
  {
    if (self->_alwaysShowSpeech)
    {
      v19 = v19 + v13;
      if (-[UIView isHidden](self->_smartDialogView, "isHidden"))
      {
        -[SiriSharedUISmartDialogView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
        v19 = v19 + v20;
      }
    }
    p_smartDialogView = &self->_smartDialogView;
    v22 = -[UIView isHidden](self->_smartDialogView, "isHidden");
    v23 = 12.0;
  }
  v24 = v15 + v23 + v19;
  if (v22)
    v25 = v19;
  else
    v25 = v24;
  if (v17 <= 0.0)
  {
    v28 = v25 + 20.0;
  }
  else
  {
    if (-[UIView isHidden](*p_smartDialogView, "isHidden") && v13 == 0.0)
    {
      -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
      v27 = v25 + v26;
    }
    else if (-[UIView isHidden](*p_smartDialogView, "isHidden"))
    {
      v27 = v25;
    }
    else
    {
      v27 = v25 + 16.0;
    }
    -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
    v28 = v27 + v17 + v29;
  }
  if (!self->_currentExpandablePlatterStyle)
  {
    -[SiriSharedUISmartDialogView dropletContainerDelegate](self, "dropletContainerDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dropletContentMaximumContainerHeight");
    v32 = v31;

    if (v28 >= v32)
      v28 = v32;
  }
  v8 = width;
  v9 = v28;
LABEL_36:
  result.height = v9;
  result.width = v8;
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
  void *v22;
  double Width;
  double v24;
  double v25;
  double *v26;
  double v27;
  double v28;
  double MaxY;
  double v30;
  _BOOL4 v31;
  double v32;
  double v33;
  SiriSharedUICompactUserUtteranceView *userUtteranceView;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  double v44;
  uint64_t v45;
  void *v46;
  NSDictionary *conversationSnippetVibrancyViews;
  void *v48;
  UIView *v49;
  double v50;
  double v51;
  double v53;
  double v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  UIView *v58;
  UIView *snippetContainerView;
  double v60;
  UIView *hintVibrancyView;
  BOOL v62;
  void *v63;
  double v64;
  double v65;
  CGFloat x;
  double v67;
  CGFloat y;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat height;
  double v73;
  double v74;
  double v75;
  double v76;
  unint64_t v77;
  double v78;
  uint64_t *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  id obj;
  NSArray *obja;
  double v98;
  double v99;
  CGAffineTransform v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[9];
  objc_super v106;
  _BYTE v107[128];
  uint64_t v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v108 = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)SiriSharedUISmartDialogView;
  -[SiriSharedUISmartDialogView layoutSubviews](&v106, sel_layoutSubviews);
  -[SiriSharedUISmartDialogView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriSharedUISmartDialogView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __45__SiriSharedUISmartDialogView_layoutSubviews__block_invoke;
    v105[3] = &unk_1EA89CD48;
    v105[4] = self;
    *(double *)&v105[5] = v4;
    *(double *)&v105[6] = v6;
    *(double *)&v105[7] = v8;
    *(double *)&v105[8] = v10;
    -[SiriSharedUISmartDialogView animationContextForFrameAndLayoutUpdate](self, "animationContextForFrameAndLayoutUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v105, v12, 0);

  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  scrollView = self->_scrollView;
  -[UIView bounds](self->_containerView, "bounds");
  -[SiriSharedUIStandardScrollView setFrame:](scrollView, "setFrame:");
  -[UIView setFrame:](self->_suggestionView, "setFrame:", v4, v6, v8, v10);
  -[SiriSharedUILatencyView sizeThatFits:](self->_latencyView, "sizeThatFits:", v8, v10);
  v15 = v14;
  v17 = v16;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", v8, v10);
  v98 = v18;
  v20 = v19;
  -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", v8 + -48.0, 1.79769313e308);
  v94 = v21;
  obj = v22;
  v109.origin.x = v4;
  v109.origin.y = v6;
  v109.size.width = v8;
  v109.size.height = v10;
  Width = CGRectGetWidth(v109);
  v110.origin.x = v4;
  v110.origin.y = v6;
  v87 = v8;
  v110.size.width = v8;
  v110.size.height = v10;
  v90 = CGRectGetWidth(v110);
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
  v93 = v24;
  v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v92 = *MEMORY[0x1E0C9D820];
  v26 = (double *)MEMORY[0x1E0C9D648];
  if (v15 == *MEMORY[0x1E0C9D820] && v17 == v25)
  {
    -[SiriSharedUILatencyView setFrame:](self->_latencyView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v27 = 0.0;
    v28 = 0.0;
    MaxY = 0.0;
  }
  else
  {
    -[SiriSharedUILatencyView setFrame:](self->_latencyView, "setFrame:", Width * 0.5 - v15 * 0.5, 0.0, v15, v17);
    -[SiriSharedUILatencyView frame](self->_latencyView, "frame");
    MaxY = CGRectGetMaxY(v111);
    -[SiriSharedUILatencyView frame](self->_latencyView, "frame");
    v28 = CGRectGetMaxY(v112);
    -[SiriSharedUILatencyView frame](self->_latencyView, "frame");
    v27 = CGRectGetMaxY(v113);
    -[SiriSharedUILatencyView frame](self->_latencyView, "frame");
    v93 = CGRectGetMaxY(v114);
  }
  v30 = v92;
  v31 = v20 == v25 && v98 == v92;
  if (v31)
  {
    -[SiriSharedUICompactUserUtteranceView setFrame:](self->_userUtteranceView, "setFrame:", *v26, v26[1], v26[2], v26[3]);
    v32 = v25;
  }
  else
  {
    if (-[SiriSharedUISmartDialogView hasResult](self, "hasResult"))
      v33 = v28;
    else
      v33 = v10 * 0.5 - v20 * 0.5 + -10.0;
    if (-[NSArray count](self->_serverUtterances, "count") || !self->_hasHintConversationSnippets)
    {
      userUtteranceView = self->_userUtteranceView;
    }
    else
    {
      userUtteranceView = self->_userUtteranceView;
      -[SiriSharedUISmartDialogView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
      v20 = v20 + v35;
    }
    v32 = v25;
    -[SiriSharedUICompactUserUtteranceView setFrame:](userUtteranceView, "setFrame:", 0.0, v33, v98, v20);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    MaxY = CGRectGetMaxY(v115);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    v27 = CGRectGetMaxY(v116);
    -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
    v36 = CGRectGetMaxY(v117);
    -[SiriSharedUISmartDialogView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
    v93 = v36 + v37;
  }
  if (-[UIView isHidden](self->_smartDialogView, "isHidden"))
  {
    -[UIView setFrame:](self->_smartDialogView, "setFrame:", *v26, v26[1], v26[2], v26[3]);
  }
  else
  {
    v38 = 12.0;
    if (v31)
      v38 = 20.0;
    -[UIView setFrame:](self->_smartDialogView, "setFrame:", v90 * 0.5 - v94 * 0.5, v38 + v27, v94, *(double *)&obj);
    -[UIView frame](self->_smartDialogView, "frame");
    MaxY = CGRectGetMaxY(v118);
    -[UIView frame](self->_smartDialogView, "frame");
    v93 = CGRectGetMaxY(v119);
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v85 = 560;
  obja = self->_conversationSnippetViews;
  v39 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v102;
    v89 = v26[1];
    v91 = *v26;
    v42 = v26[3];
    v88 = v26[2];
    v99 = 0.0;
    v43 = 0x1F0430000uLL;
    v44 = 0.0;
    do
    {
      v45 = 0;
      v95 = v40;
      do
      {
        if (*(_QWORD *)v102 != v41)
          objc_enumerationMutation(obja);
        v46 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v45);
        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        -[SiriSharedUISmartDialogView _keyForSnippet:](self, "_keyForSnippet:", v46, v85);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](conversationSnippetVibrancyViews, "objectForKey:", v48);
        v49 = (UIView *)objc_claimAutoreleasedReturnValue();

        -[SiriSharedUISmartDialogView _sizeOfSnippet:](self, "_sizeOfSnippet:", v46);
        if (v50 == v30 && v51 == v32)
        {
          objc_msgSend(v46, "setFrame:", v91, v89, v88, v42);
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v43 + 1804)), "setFrame:", v91, v89, v88, v42);
          -[UIView setFrame:](v49, "setFrame:", v91, v89, v88, v42);
        }
        else
        {
          v53 = v50;
          v54 = v51;
          v55 = v41;
          objc_msgSend(v46, "setFrame:", 0.0, v44, v50, v51);
          v56 = v43;
          v57 = *(int *)(v43 + 1804);
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v57), "superview");
          v58 = (UIView *)objc_claimAutoreleasedReturnValue();
          snippetContainerView = self->_snippetContainerView;

          if (v58 == snippetContainerView)
            objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v57), "setFrame:", 0.0, v44, v53, v54);
          v60 = v32;
          -[UIView setFrame:](v49, "setFrame:", 0.0, v44, v53, v54);
          -[UIView setHidden:](v49, "setHidden:", self->_isInAmbient);
          hintVibrancyView = self->_hintVibrancyView;
          if (hintVibrancyView)
            v62 = hintVibrancyView == v49;
          else
            v62 = 0;
          if (v62)
          {
            -[UIView layer](v49, "layer");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v64) = 1.0;
            objc_msgSend(v63, "setOpacity:", v64);

          }
          objc_msgSend(v46, "frame");
          x = v65;
          y = v67;
          v70 = v69;
          height = v71;
          v43 = v56;
          if (self->_isInAmbient)
          {
            v73 = 1.0;
            if (!self->_isInAmbientInteractivity)
              v73 = 2.0;
            CGAffineTransformMakeScale(&v100, v73, v73);
            v120.origin.x = x;
            v120.origin.y = y;
            v120.size.width = v70;
            v120.size.height = height;
            v121 = CGRectApplyAffineTransform(v120, &v100);
            x = v121.origin.x;
            y = v121.origin.y;
            v70 = v121.size.width;
            height = v121.size.height;
          }
          v41 = v55;
          v122.origin.x = x;
          v122.origin.y = y;
          v122.size.width = v70;
          v122.size.height = height;
          v74 = CGRectGetMaxY(v122);
          -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
          v44 = v74 + v75;
          v123.origin.x = x;
          v123.origin.y = y;
          v123.size.width = v70;
          v123.size.height = height;
          v30 = v92;
          MaxY = v93 + CGRectGetMaxY(v123);
          v76 = v99;
          if (v99 < v53)
            v76 = v53;
          v99 = v76;
          v32 = v60;
          v40 = v95;
        }

        ++v45;
      }
      while (v40 != v45);
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
    }
    while (v40);
  }
  else
  {
    v99 = 0.0;
    v44 = 0.0;
  }

  if (self->_isInAmbient)
  {
    v77 = 0x1F0430000;
    v78 = v99;
    if (self->_allowAutomaticConversationSnippetViewScaling)
    {
      v79 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
      if (!self->_isInAmbientInteractivity)
        v79 = &SiriSharedUICompactAmbientContentScaleAmount;
      v78 = v99 * *(double *)v79;
    }
  }
  else
  {
    v77 = 0x1F0430000uLL;
    v78 = v99;
  }
  if (!-[UIView isHidden](self->_smartDialogView, "isHidden", v85))
  {
    -[SiriSharedUISmartDialogView serverUtteranceContentInsets](self, "serverUtteranceContentInsets");
    v93 = v93 + v80;
    if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v86), "count"))
      MaxY = MaxY + 20.0;
  }
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
  if (*((_BYTE *)&self->super.super.super.super.isa + *(int *)(v77 + 1796)))
  {
    -[SiriSharedUISmartDialogView bounds](self, "bounds");
    v78 = v82;
    v83 = 0.0;
  }
  else
  {
    v83 = v81;
  }
  -[UIView setFrame:](self->_snippetContainerView, "setFrame:", v83, v93, v78, v44);
  -[SiriSharedUIStandardScrollView setContentSize:](self->_scrollView, "setContentSize:", v87, MaxY);
  if (!self->_currentExpandablePlatterStyle)
  {
    -[SiriSharedUIStandardScrollView frame](self->_scrollView, "frame");
    -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", MaxY > v84);
  }
}

uint64_t __45__SiriSharedUISmartDialogView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_resetExpansionStateForNewContent
{
  id v3;

  if (-[SiriSharedUISmartDialogView transitionToExpandablePlatterStyle:](self, "transitionToExpandablePlatterStyle:", 1))
  {
    -[SiriSharedUISmartDialogView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "conversationViewDidResetExpandedState:", self);

  }
}

- (void)setServerUtterances:(id)a3
{
  NSArray *v4;
  NSArray *serverUtterances;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __CFString *v16;
  _BOOL8 v17;
  const __CFString *v18;
  UIView *smartDialogView;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  serverUtterances = self->_serverUtterances;
  if (serverUtterances != v4 && !-[NSArray isEqualToArray:](serverUtterances, "isEqualToArray:", v4))
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    v7 = self->_serverUtterances;
    self->_serverUtterances = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_serverUtterances, "count"))
    {
      -[SiriSharedUISmartDialogView transitionToResult](self, "transitionToResult");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = self->_serverUtterances;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "text", (_QWORD)v28);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v12);
      }

      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n\n"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    if (-[__CFString length](v16, "length", (_QWORD)v28))
      v17 = 0;
    else
      v17 = -[SiriSharedUISmartDialogContainer shouldBeHidden](self->_smartDialogContainer, "shouldBeHidden");
    -[UIView setHidden:](self->_smartDialogView, "setHidden:", v17);
    -[SiriSharedUISmartDialogContainer updateHeaderWithText:color:](self->_smartDialogContainer, "updateHeaderWithText:color:", &stru_1EA89F868, v8);
    if (v17)
      v18 = &stru_1EA89F868;
    else
      v18 = v16;
    -[SiriSharedUISmartDialogContainer updateBodyWithText:](self->_smartDialogContainer, "updateBodyWithText:", v18);
    smartDialogView = self->_smartDialogView;
    v20 = SiriSharedUILanguageSemanticContentAttribute();
    SiriSharedUIRecursiveSetSemanticContentAttribute(smartDialogView, v20);
    -[SiriSharedUISmartDialogView _resetExpansionStateForNewContent](self, "_resetExpansionStateForNewContent");
    if (!v17)
    {
      -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
      if (!CGRectEqualToRect(v34, *MEMORY[0x1E0C9D648]))
      {
        -[SiriSharedUISmartDialogView bounds](self, "bounds");
        -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", v21, v22);
        v24 = v23;
        v26 = v25;
        -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
        MinX = CGRectGetMinX(v35);
        -[SiriSharedUICompactUserUtteranceView frame](self->_userUtteranceView, "frame");
        -[UIView setFrame:](self->_smartDialogView, "setFrame:", MinX, CGRectGetMaxY(v36), v24, v26);
        -[UIView layoutIfNeeded](self->_smartDialogView, "layoutIfNeeded");
      }
    }
    -[SiriSharedUISmartDialogView _reloadConversationSnippetViewsIfHint](self, "_reloadConversationSnippetViewsIfHint");
    -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);

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
          if (-[SiriSharedUISmartDialogView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v8, (_QWORD)v12))
          {
            conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
            -[SiriSharedUISmartDialogView _keyForSnippet:](self, "_keyForSnippet:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKey:](conversationSnippetVibrancyViews, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[SiriSharedUISmartDialogView _adjustHintCornerRadiusForSnippetView:vibrancyView:](self, "_adjustHintCornerRadiusForSnippetView:vibrancyView:", v8, v11);
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
  void *v7;
  int v8;
  int v9;
  SiriSharedUICompactUserUtteranceView *userUtteranceView;

  v4 = a3;
  v5 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(v4, "copy");
  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  self->_speechRecognitionHypothesis = v5;

  if (-[SiriSharedUISmartDialogView ongoingASR](self, "ongoingASR")
    || (-[SiriSharedUISmartDialogView latencyViewModel](self, "latencyViewModel"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "shouldDisplay"),
        v7,
        v8))
  {
    self->_state = 1;
  }
  -[SiriSharedUICompactUserUtteranceView setSpeechRecognitionHypothesis:](self->_userUtteranceView, "setSpeechRecognitionHypothesis:", v4);
  v9 = objc_msgSend(v4, "isFinal");

  if (v9)
    self->_waitingForFinalSpeechHypothesis = 0;
  userUtteranceView = self->_userUtteranceView;
  -[SiriSharedUISmartDialogView _maxSnippetWidth](self, "_maxSnippetWidth");
  -[SiriSharedUICompactUserUtteranceView setMaxWidth:](userUtteranceView, "setMaxWidth:");
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (void)setSpeechRecognitionHypothesisForSuggestion:(id)a3
{
  SRUIFSpeechRecognitionHypothesis *v4;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesisForSuggestion;

  v4 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(a3, "copy");
  speechRecognitionHypothesisForSuggestion = self->_speechRecognitionHypothesisForSuggestion;
  self->_speechRecognitionHypothesisForSuggestion = v4;

}

- (void)setSmartDialogPlugin:(id)a3
{
  SAUIPluginSnippet *v5;
  SAUIPluginSnippet *v6;

  v5 = (SAUIPluginSnippet *)a3;
  if (self->_smartDialogPlugin != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_smartDialogPlugin, a3);
    -[SiriSharedUISmartDialogContainer updateWithSmartDialogPluginView:](self->_smartDialogContainer, "updateWithSmartDialogPluginView:", v6);
    -[UIView setHidden:](self->_smartDialogView, "setHidden:", -[SiriSharedUISmartDialogContainer shouldBeHidden](self->_smartDialogContainer, "shouldBeHidden"));
    if (v6)
      -[SiriSharedUISmartDialogView transitionToResult](self, "transitionToResult");
    -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
    v5 = v6;
  }

}

- (void)setSmartDialogCard:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_smartDialogCard, a3);
  -[SiriSharedUISmartDialogContainer updateWithSmartDialogCard:](self->_smartDialogContainer, "updateWithSmartDialogCard:", v5);
  -[UIView setHidden:](self->_smartDialogView, "setHidden:", -[SiriSharedUISmartDialogContainer shouldBeHidden](self->_smartDialogContainer, "shouldBeHidden"));
  if (v5)
    -[SiriSharedUISmartDialogView transitionToResult](self, "transitionToResult");
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);

}

- (BOOL)onlyContainsSnippet
{
  return !-[NSArray count](self->_serverUtterances, "count") && !self->_alwaysShowSpeech;
}

- (void)setLatencyViewModel:(id)a3
{
  BOOL v4;
  void *v5;
  int v6;
  SiriSharedUILatencyViewModel *v7;
  SiriSharedUILatencyViewModel *latencyViewModel;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v4 = -[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_latencyViewModel, "isEqualToViewModel:", v11);
  v5 = v11;
  if (!v4)
  {
    v6 = objc_msgSend(v11, "viewShouldUpdateFromOldModel:", self->_latencyViewModel);
    v7 = (SiriSharedUILatencyViewModel *)objc_msgSend(v11, "copy");
    latencyViewModel = self->_latencyViewModel;
    self->_latencyViewModel = v7;

    if (-[SiriSharedUISmartDialogView ongoingASR](self, "ongoingASR")
      || (-[SiriSharedUISmartDialogView latencyViewModel](self, "latencyViewModel"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "shouldDisplay"),
          v9,
          v10))
    {
      self->_state = 1;
    }
    v5 = v11;
    if (v6)
    {
      -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
      v5 = v11;
    }
  }

}

- (void)updateUserUtteranceVisibilityIfNeeded
{
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesisForSuggestion;
  SRUIFSpeechRecognitionHypothesis *v4;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  SRUIFSpeechRecognitionHypothesis *v6;
  SRUIFSpeechRecognitionHypothesis *v7;

  if (self->_alwaysShowSpeech)
  {
    speechRecognitionHypothesisForSuggestion = self->_speechRecognitionHypothesisForSuggestion;
    if (speechRecognitionHypothesisForSuggestion)
    {
      v4 = (SRUIFSpeechRecognitionHypothesis *)-[SRUIFSpeechRecognitionHypothesis copy](speechRecognitionHypothesisForSuggestion, "copy");
      speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
      self->_speechRecognitionHypothesis = v4;

      v6 = self->_speechRecognitionHypothesisForSuggestion;
      self->_speechRecognitionHypothesisForSuggestion = 0;

      if (self->_alwaysShowSpeech
        || -[SiriSharedUILatencyViewModel shouldDisplay](self->_latencyViewModel, "shouldDisplay"))
      {
        -[SiriSharedUICompactUserUtteranceView setSpeechRecognitionHypothesis:](self->_userUtteranceView, "setSpeechRecognitionHypothesis:", self->_speechRecognitionHypothesis);
      }
      self->_waitingForFinalSpeechHypothesis = 0;
      -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
    }
  }
  else
  {
    if (-[SiriSharedUILatencyViewModel shouldDisplay](self->_latencyViewModel, "shouldDisplay"))
      v7 = self->_speechRecognitionHypothesis;
    else
      v7 = 0;
    -[SiriSharedUICompactUserUtteranceView setSpeechRecognitionHypothesis:](self->_userUtteranceView, "setSpeechRecognitionHypothesis:", v7);
  }
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

  v2 = 16.0;
  v3 = 20.0;
  if (self->_isInAmbient)
    v3 = 16.0;
  v4 = 4.0;
  if (!self->_isInAmbient)
  {
    v4 = 0.0;
    v2 = 24.0;
  }
  v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (BOOL)_hasNoDialog
{
  _BOOL4 v3;
  double v4;
  double v5;

  v3 = -[UIView isHidden](self->_smartDialogView, "isHidden");
  if (v3)
  {
    -[SiriSharedUICompactUserUtteranceView bounds](self->_userUtteranceView, "bounds");
    LOBYTE(v3) = v5 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v4 == *MEMORY[0x1E0C9D820];
  }
  return v3;
}

- (UIEdgeInsets)snippetContentInsets
{
  double v2;
  double v3;
  BOOL v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  if (self->_isInAmbient)
  {
    v2 = 16.0;
    v3 = 4.0;
  }
  else
  {
    v5 = -[SiriSharedUISmartDialogView _hasNoDialog](self, "_hasNoDialog");
    v3 = 0.0;
    v2 = 0.0;
    if (!v5)
    {
      if (self->_hasHintConversationSnippets)
        v3 = 0.0;
      else
        v3 = 6.0;
      v2 = v3;
    }
  }
  v6 = v2;
  v7 = v2;
  result.right = v7;
  result.bottom = v3;
  result.left = v6;
  result.top = v2;
  return result;
}

- (void)setSnippetBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_snippetBackgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_snippetBackgroundView = &self->_snippetBackgroundView;
  if (*p_snippetBackgroundView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](*p_snippetBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)p_snippetBackgroundView, a3);
    v5 = v7;
  }

}

- (void)setConversationSnippetViews:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *conversationSnippetViews;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  SiriSharedUICompactConversationSnippetVibrancyView *v25;
  void *v26;
  double v27;
  void *v28;
  UIView *snippetContainerView;
  UIView *snippetBackgroundView;
  NSDictionary *conversationSnippetVibrancyViews;
  void *v32;
  NSDictionary *v33;
  NSArray *obj;
  uint64_t v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_conversationSnippetViews, "isEqualToArray:", v4))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v5 = self->_conversationSnippetViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v47 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v7);
    }

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __59__SiriSharedUISmartDialogView_setConversationSnippetViews___block_invoke;
    v45[3] = &unk_1EA89CD70;
    v45[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v11;
    v12 = (NSArray *)objc_msgSend(v11, "copy");
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v12;

    if (-[NSArray count](self->_conversationSnippetViews, "count"))
      -[SiriSharedUISmartDialogView transitionToResult](self, "transitionToResult");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[NSDictionary allValues](self->_conversationSnippetVibrancyViews, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "removeFromSuperview");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = self->_conversationSnippetViews;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (!v19)
    {
      LOBYTE(v36) = 1;
      goto LABEL_45;
    }
    v20 = v19;
    v35 = *(_QWORD *)v38;
    v36 = 1;
    while (1)
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
        v23 = SiriSharedUILanguageSemanticContentAttribute();
        SiriSharedUIRecursiveSetSemanticContentAttribute(v22, v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
          objc_msgSend(v22, "viewInsetsInConversationView:");
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v36 &= objc_msgSend(v22, "shouldAutomaticallyScaleContentInAmbient");
        v24 = -[SiriSharedUISmartDialogView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v22);
        if (!-[SiriSharedUISmartDialogView _shouldAddVibrancyForSnippet:](self, "_shouldAddVibrancyForSnippet:", v22)
          && !v24)
        {
          v25 = 0;
          goto LABEL_35;
        }
        if (!v24)
        {
          v25 = -[SiriSharedUICompactConversationSnippetVibrancyView initWithStyle:]([SiriSharedUICompactConversationSnippetVibrancyView alloc], "initWithStyle:", 0);
          if (!v25)
            goto LABEL_35;
LABEL_34:
          -[SiriSharedUISmartDialogView _keyForSnippet:](self, "_keyForSnippet:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v33, "setObject:forKey:", v25, v28);

          goto LABEL_35;
        }
        self->_hasHintConversationSnippets = 1;
        v25 = -[SiriSharedUICompactConversationSnippetVibrancyView initWithStyle:]([SiriSharedUICompactConversationSnippetVibrancyView alloc], "initWithStyle:", 1);
        -[UIView frame](self->_snippetContainerView, "frame");
        -[SiriSharedUICompactConversationSnippetVibrancyView setFrame:](v25, "setFrame:");
        -[SiriSharedUICompactConversationSnippetVibrancyView layer](v25, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = 0;
        objc_msgSend(v26, "setOpacity:", v27);

        objc_storeStrong((id *)&self->_hintVibrancyView, v25);
        objc_storeStrong((id *)&self->_hintSnippetView, v22);
        if (v25)
          goto LABEL_34;
LABEL_35:
        snippetContainerView = self->_snippetContainerView;
        if (snippetContainerView)
        {
          -[UIView addSubview:](snippetContainerView, "addSubview:", v22);
          -[UIView insertSubview:belowSubview:](self->_snippetContainerView, "insertSubview:belowSubview:", self->_snippetBackgroundView, v22);
          snippetBackgroundView = self->_snippetBackgroundView;
          -[UIView frame](self->_snippetContainerView, "frame");
          -[UIView setFrame:](snippetBackgroundView, "setFrame:");
        }
        else
        {
          -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", v22);
        }
        if (v24)
          -[SiriSharedUISmartDialogView _adjustHintCornerRadiusForSnippetView:vibrancyView:](self, "_adjustHintCornerRadiusForSnippetView:vibrancyView:", v22, v25);
        else
          -[SiriSharedUISmartDialogView _adjustCornerRadiusForSnippetView:vibrancyView:](self, "_adjustCornerRadiusForSnippetView:vibrancyView:", v22, v25);
        objc_msgSend(v22, "setClipsToBounds:", 1);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (!v20)
      {
LABEL_45:

        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        self->_conversationSnippetVibrancyViews = v33;

        -[SiriSharedUISmartDialogView setAllowAutomaticConversationSnippetViewScaling:](self, "setAllowAutomaticConversationSnippetViewScaling:", v36 & 1);
        -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
        self->_didSetConversationSnippets = 1;

        break;
      }
    }
  }

}

uint64_t __59__SiriSharedUISmartDialogView_setConversationSnippetViews___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isConversationSnippetHintType:", a2);
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SiriSharedUISmartDialogView setConversationSnippetViews:]_block_invoke";
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions removing hint from smart dialog since we're in SAE presentation", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2 ^ 1u;
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
  -[SiriSharedUISmartDialogView frame](self, "frame");
  Height = CGRectGetHeight(v5);
  return self->_automaticallyCollapseWhenResultIsScrolled
      && -[SiriSharedUISmartDialogView contentSupportsCollapsingForHeight:](self, "contentSupportsCollapsingForHeight:", Height);
}

- (void)snippetContentDidUpdate
{
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (void)snippetContentDidUpdateForHint
{
  uint64_t v3;

  if (-[NSArray count](self->_serverUtterances, "count")
    || -[NSArray count](self->_conversationSnippetViews, "count") > 1
    || self->_speechRecognitionHypothesis)
  {
    -[SiriSharedUISmartDialogView _prepareHintForAnimation](self, "_prepareHintForAnimation");
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", v3);
}

- (void)_prepareHintForAnimation
{
  double v3;
  double v4;
  double v5;
  CGRect v7;

  -[SiriSharedUISmartDialogView _sizeOfSnippet:](self, "_sizeOfSnippet:", self->_hintSnippetView);
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
  CGSize result;

  -[SiriSharedUISmartDialogView _maxSnippetWidth](self, "_maxSnippetWidth");
  -[SiriSharedUISmartDialogView sizeThatFits:](self, "sizeThatFits:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_maxSnippetWidth
{
  _BOOL4 IsPad;
  double v4;
  double v5;
  _BOOL4 v6;
  double *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  IsPad = SiriSharedUIDeviceIsPad();
  if (self->_isInAmbient)
  {
    v4 = 2.0;
    v5 = 52.0;
  }
  else
  {
    v6 = SiriSharedUIDeviceIsPad();
    v7 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
    if (!v6)
      v7 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
    v5 = *v7;
    v4 = 1.0;
  }
  if (IsPad)
    v8 = 500.0;
  else
    v8 = 556.0;
  v9 = v8 * v4;
  -[SiriSharedUISmartDialogView dropletContainerDelegate](self, "dropletContainerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dropletContentMaximumContainerWidth");
  v12 = v11 + v5 * -2.0;

  if (v9 >= v12)
    return v12;
  else
    return v9;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  int64_t currentExpandablePlatterStyle;
  double currentExpandedGestureHeight;
  double v7;
  CGSize result;

  -[SiriSharedUISmartDialogView _fittingSize](self, "_fittingSize");
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
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
}

- (void)updateContentSizeWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[SiriSharedUISmartDialogView _fittingSize](self, "_fittingSize");
  v6 = v5;
  v8 = v7;
  -[SiriSharedUISmartDialogView _updateSubviewContentInsets](self, "_updateSubviewContentInsets");
  v9 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[SiriSharedUISmartDialogView updateContentSizeWithAnimation:]";
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_1DE0BF000, v9, OS_LOG_TYPE_DEFAULT, "%s #smartDialog updateContentSizeWithAnimation: %f %f", (uint8_t *)&v11, 0x20u);
  }
  if (self->_state)
  {
    -[SiriSharedUISmartDialogView dropletContainerDelegate](self, "dropletContainerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dropletContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  }
  -[SiriSharedUISmartDialogView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3
{
  if (self->_allowAutomaticConversationSnippetViewScaling != a3)
  {
    self->_allowAutomaticConversationSnippetViewScaling = a3;
    -[SiriSharedUISmartDialogView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_isInAmbient != a3)
  {
    v3 = a3;
    self->_isInAmbient = a3;
    -[SiriSharedUISmartDialogView _updateSubviewContentInsets](self, "_updateSubviewContentInsets");
    -[SiriSharedUICompactUserUtteranceView setIsInAmbient:](self->_userUtteranceView, "setIsInAmbient:", v3);
    -[SiriSharedUISmartDialogContainer setIsInAmbient:](self->_smartDialogContainer, "setIsInAmbient:", v3);
    -[SiriSharedUISmartDialogView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
    -[PLPlatterView backgroundView](self->_platterView, "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", self->_isInAmbient);

  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivity = a3;
    -[SiriSharedUICompactUserUtteranceView setIsInAmbientInteractivity:](self->_userUtteranceView, "setIsInAmbientInteractivity:");
    -[SiriSharedUISmartDialogView _updateAmbientSnippetScaling](self, "_updateAmbientSnippetScaling");
  }
}

- (void)_updateSubviewContentInsets
{
  SiriSharedUICompactUserUtteranceView *userUtteranceView;

  userUtteranceView = self->_userUtteranceView;
  -[SiriSharedUISmartDialogView userUtteranceContentInsets](self, "userUtteranceContentInsets");
  -[SiriSharedUICompactUserUtteranceView setContentInsets:](userUtteranceView, "setContentInsets:");
}

- (void)_updateAmbientSnippetScaling
{
  uint64_t *v2;
  UIView *snippetContainerView;
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
    snippetContainerView = self->_snippetContainerView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    v4 = &v10;
    v5 = snippetContainerView;
  }
  else
  {
    v5 = self->_snippetContainerView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v6;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4 = (CGAffineTransform *)&v7;
  }
  -[UIView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
}

- (void)setShowCollapsedUI:(BOOL)a3
{
  if (self->_showingCollapsedUI != a3)
    self->_showingCollapsedUI = a3;
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
    -[SiriSharedUISmartDialogView setShowCollapsedUI:](self, "setShowCollapsedUI:", 1);
    -[SiriSharedUISmartDialogView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationViewDidTransitionToCollapsedState:", self);

  }
  else
  {
    -[SiriSharedUISmartDialogView setShowCollapsedUI:](self, "setShowCollapsedUI:", 0);
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
        -[SiriSharedUISmartDialogView delegate](self, "delegate");
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

  currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle != a3 && currentExpandablePlatterStyle != 0)
  {
    if (a3 == 4)
    {
      -[SiriSharedUISmartDialogView setNeedsLayout](self, "setNeedsLayout");
    }
    else if (a3 == 1)
    {
      -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0);
    }
    -[SiriSharedUISmartDialogView setCurrentExpandablePlatterStyle:](self, "setCurrentExpandablePlatterStyle:", a3);
    -[SiriSharedUISmartDialogView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  return currentExpandablePlatterStyle != 0;
}

- (void)userUtteranceViewTapped:(id)a3
{
  void *v4;
  SiriSharedUIInteractionDelegate **p_interactionDelegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  if (-[SRUIFSpeechRecognitionHypothesis isFinal](self->_speechRecognitionHypothesis, "isFinal", a3))
  {
    -[SRUIFSpeechRecognitionHypothesis userUtterance](self->_speechRecognitionHypothesis, "userUtterance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestTextInterpretation");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    p_interactionDelegate = &self->_interactionDelegate;
    WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_interactionDelegate);
      objc_msgSend(v8, "siriViewControllerShouldRequestTextInputWithUtterance:", v9);

    }
  }
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

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v5 = a3;
  -[SiriSharedUISmartDialogView delegate](self, "delegate");
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
  -[SiriSharedUISmartDialogView _fittingSize](self, "_fittingSize");
  v6 = v5;
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
  v8 = v6 - v7;
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
  v10 = v8 - v9;
  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity)
      v11 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    else
      v11 = &SiriSharedUICompactAmbientContentScaleAmount;
    v10 = v10 / *(double *)v11;
  }
  -[SiriSharedUISmartDialogView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v4, v10, 1.79769313e308);
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
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
  v7 = v6;
  -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
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
        -[SiriSharedUISmartDialogView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), v15, height, (_QWORD)v24);
        v11 = fmax(v11, v19);
        v10 = v10 + v17 + v20;
        -[SiriSharedUISmartDialogView snippetContentInsets](self, "snippetContentInsets");
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
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t *v9;
  double v10;

  v6 = a4;
  v7 = a3;
  v8 = -[SiriSharedUISmartDialogView _hasNoDialog](self, "_hasNoDialog");
  v9 = &SiriSharedUICompactPlatterCornerRadius;
  if (!v8)
    v9 = &SiriSharedUICompactConversationViewSnippetCornerRadius;
  v10 = *(double *)v9;
  objc_msgSend(v7, "_setContinuousCornerRadius:", *(double *)v9);

  objc_msgSend(v6, "_setContinuousCornerRadius:", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView setContinuousCornerRadius:](self->_snippetBackgroundView, "setContinuousCornerRadius:", v10);
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

  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "conversationViewDidUpdatePresentedContentHeight:", self);

}

- (void)smartDialogSizeDidChangeWithSize:(CGSize)a3
{
  -[SiriSharedUISmartDialogView updateContentSizeWithAnimation:](self, "updateContentSizeWithAnimation:", 0, a3.width, a3.height);
}

- (void)setInteractionDelegate:(id)a3
{
  SiriSharedUIInteractionDelegate **p_interactionDelegate;
  id v5;

  p_interactionDelegate = &self->_interactionDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_interactionDelegate, v5);
  -[SiriSharedUISmartDialogContainer setInteractionDelegate:](self->_smartDialogContainer, "setInteractionDelegate:", v5);

}

- (void)triggerSmartDialogAnimationWithDelay:(double)a3
{
  -[SiriSharedUISmartDialogContainer triggerSmartDialogAnimationWithDelay:](self->_smartDialogContainer, "triggerSmartDialogAnimationWithDelay:", a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
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

- (BOOL)alwaysShowSpeech
{
  return self->_alwaysShowSpeech;
}

- (void)setAlwaysShowSpeech:(BOOL)a3
{
  self->_alwaysShowSpeech = a3;
}

- (UIView)snippetBackgroundView
{
  return self->_snippetBackgroundView;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
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

- (UIView)snippetContainerView
{
  return self->_snippetContainerView;
}

- (void)setSnippetContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_snippetContainerView, a3);
}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)_smartDialogContainer
{
  return self->_smartDialogContainer;
}

- (void)_setSmartDialogContainer:(id)a3
{
  objc_storeStrong((id *)&self->_smartDialogContainer, a3);
}

- (UIView)_smartDialogView
{
  return self->_smartDialogView;
}

- (void)_setSmartDialogView:(id)a3
{
  objc_storeStrong((id *)&self->_smartDialogView, a3);
}

- (UIView)_suggestionView
{
  return self->_suggestionView;
}

- (void)_setSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionView, a3);
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
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_smartDialogView, 0);
  objc_storeStrong((id *)&self->_smartDialogContainer, 0);
  objc_storeStrong((id *)&self->_snippetContainerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_snippetBackgroundView, 0);
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
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesisForSuggestion, 0);
  objc_storeStrong((id *)&self->_smartDialogPlugin, 0);
  objc_storeStrong((id *)&self->_smartDialogCard, 0);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_hintSnippetView, 0);
  objc_storeStrong((id *)&self->_hintVibrancyView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetVibrancyViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_userUtteranceView, 0);
  objc_storeStrong((id *)&self->_latencyView, 0);
}

@end
