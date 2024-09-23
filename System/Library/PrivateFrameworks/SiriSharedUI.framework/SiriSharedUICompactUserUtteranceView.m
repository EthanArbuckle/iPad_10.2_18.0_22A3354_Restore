@implementation SiriSharedUICompactUserUtteranceView

- (SiriSharedUICompactUserUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  SiriSharedUICompactUserUtteranceView *v9;
  SiriSharedUICompactUserUtteranceView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIVisualEffectView *backgroundView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SiriSharedUICompactUserUtteranceView *v24;
  void *v25;
  SiriSharedUICompactUserUtteranceView *v26;
  SUICStreamingTextView *streamingTextView;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v32.receiver = self;
  v32.super_class = (Class)SiriSharedUICompactUserUtteranceView;
  v9 = -[SiriSharedUICompactUserUtteranceView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_contentInsets.top = top;
    v9->_contentInsets.left = left;
    v9->_contentInsets.bottom = bottom;
    v9->_contentInsets.right = right;
    v11 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectForBlurEffect:style:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v13);
    -[SiriSharedUICompactUserUtteranceView _setBackgroundView:](v10, "_setBackgroundView:", v14);

    backgroundView = v10->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](backgroundView, "setBackgroundColor:", v16);

    -[SiriSharedUICompactUserUtteranceView _backgroundView](v10, "_backgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", a4);

    -[SiriSharedUICompactUserUtteranceView _backgroundView](v10, "_backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaskedCorners:", 3);

    -[SiriSharedUICompactUserUtteranceView _createStreamingTextViewForEmojisOnly:](v10, "_createStreamingTextViewForEmojisOnly:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactUserUtteranceView _setStreamingTextView:](v10, "_setStreamingTextView:", v21);

    if (AFDeviceSupportsSystemAssistantExperience())
      -[SUICStreamingTextView setEditTextSymbol:](v10->_streamingTextView, "setEditTextSymbol:", CFSTR("pencil"));
    else
      -[SiriSharedUICompactUserUtteranceView addSubview:](v10, "addSubview:", v10->_backgroundView);
    -[SiriSharedUICompactUserUtteranceView _createStreamingTextViewForEmojisOnly:](v10, "_createStreamingTextViewForEmojisOnly:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactUserUtteranceView _setEmojiMaskStreamingTextView:](v10, "_setEmojiMaskStreamingTextView:", v22);

    if (AFDeviceSupportsSystemAssistantExperience())
    {
      -[SiriSharedUICompactUserUtteranceView traitCollection](v10, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "userInterfaceStyle") == 1)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
      v24 = (SiriSharedUICompactUserUtteranceView *)objc_claimAutoreleasedReturnValue();

      -[SUICStreamingTextView setStartTextColor:](v10->_streamingTextView, "setStartTextColor:", v24);
      -[SUICStreamingTextView setEndTextColor:](v10->_streamingTextView, "setEndTextColor:", v24);
      streamingTextView = v10->_streamingTextView;
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1438]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICStreamingTextView setFont:](streamingTextView, "setFont:", v28);

      -[SiriSharedUICompactUserUtteranceView _streamingTextView](v10, "_streamingTextView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v10;
    }
    else
    {
      -[UIVisualEffectView contentView](v10->_backgroundView, "contentView");
      v24 = (SiriSharedUICompactUserUtteranceView *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUICompactUserUtteranceView _streamingTextView](v10, "_streamingTextView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
    }
    -[SiriSharedUICompactUserUtteranceView addSubview:](v26, "addSubview:", v25);

    -[SiriSharedUICompactUserUtteranceView _emojiMaskStreamingTextView](v10, "_emojiMaskStreamingTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactUserUtteranceView addSubview:](v10, "addSubview:", v29);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v10, sel__handleTap_);
    -[SiriSharedUICompactUserUtteranceView addGestureRecognizer:](v10, "addGestureRecognizer:", v30);

  }
  return v10;
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  id WeakRetained;
  SRUIFSpeechRecognitionHypothesis *v5;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _BOOL8 v11;
  id v12;
  id v13;

  v13 = a3;
  if (self->_speechRecognitionHypothesis)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "userUtteranceView:speechRecognitionHypothesisDidDisappear:", self, self->_speechRecognitionHypothesis);

  }
  v5 = (SRUIFSpeechRecognitionHypothesis *)objc_msgSend(v13, "copy");
  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  self->_speechRecognitionHypothesis = v5;

  objc_msgSend(v13, "userUtterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestTextInterpretation");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1EA89F868;
  -[SiriSharedUICompactUserUtteranceView _setStreamingText:](self, "_setStreamingText:", v10);

  if (objc_msgSend(v13, "isFinal"))
    v11 = !self->_isInAmbient;
  else
    v11 = 0;
  -[SUICStreamingTextView setShowEditTextImage:](self->_streamingTextView, "setShowEditTextImage:", v11);
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "userUtteranceView:speechRecognitionHypothesisDidAppear:", self, self->_speechRecognitionHypothesis);

  -[SiriSharedUICompactUserUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  UIEdgeInsets *p_contentInsets;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SiriSharedUICompactUserUtteranceView _streamingTextView](self, "_streamingTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    p_contentInsets = &self->_contentInsets;
    v10 = width - self->_contentInsets.left - self->_contentInsets.right;
    v11 = height - self->_contentInsets.top - self->_contentInsets.bottom;
    -[SiriSharedUICompactUserUtteranceView _streamingTextView](self, "_streamingTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", v10, v11);
    v14 = v13;
    v16 = v15;

    if (AFDeviceSupportsSystemAssistantExperience())
      width = fmax(v14 + p_contentInsets->left + p_contentInsets->right, 50.0);
    v17 = v16 + p_contentInsets->top + p_contentInsets->bottom + 0.0;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIVisualEffectView *backgroundView;
  void *v8;
  uint64_t v9;
  double left;
  double right;
  double v12;
  double v13;
  double v14;
  double v15;
  double top;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SiriSharedUICompactUserUtteranceView;
  -[SiriSharedUICompactUserUtteranceView layoutSubviews](&v19, sel_layoutSubviews);
  -[SiriSharedUICompactUserUtteranceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  backgroundView = self->_backgroundView;
  -[SiriSharedUICompactUserUtteranceView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");
  -[SUICStreamingTextView text](self->_streamingTextView, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    left = self->_contentInsets.left;
    right = self->_contentInsets.right;
    if (AFDeviceSupportsSystemAssistantExperience())
      v12 = self->_maxWidth - self->_contentInsets.left - self->_contentInsets.right;
    else
      v12 = v4 - left - right;
    -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", v12, v6);
    v14 = v13;
    top = self->_contentInsets.top;
    v15 = self->_contentInsets.left;
    -[SiriSharedUICompactUserUtteranceView _streamingTextView](self, "_streamingTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v15, top, v12, v14);

    -[SiriSharedUICompactUserUtteranceView _emojiMaskStreamingTextView](self, "_emojiMaskStreamingTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v15, top, v12, v14);

  }
}

- (id)_createStreamingTextViewForEmojisOnly:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  double v10;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DA7A38]);
  -[SiriSharedUICompactUserUtteranceView _fontForStreamingTextView](self, "_fontForStreamingTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);
  objc_msgSend(v5, "setAnimationDuration:", 0.3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v10 = 0.0;
  if (IsAccessibilityCategory)
    v10 = 0.5;
  objc_msgSend(v5, "setHyphenationFactor:", v10);
  if (v3)
    objc_msgSend(v5, "setRenderEmojisOnly:", 1);
  else
    objc_msgSend(v5, "setRenderEmojis:", 0);

  return v5;
}

- (void)_handleTap:(id)a3
{
  os_log_t *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 3)
  {
    v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SiriSharedUICompactUserUtteranceView _handleTap:]";
      _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: tap to edit experience requested", (uint8_t *)&v8, 0xCu);
    }
    if (self->_isInAmbient)
    {
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[SiriSharedUICompactUserUtteranceView _handleTap:]";
        _os_log_impl(&dword_1DE0BF000, v6, OS_LOG_TYPE_DEFAULT, "%s #compact: tap to edit ignored due to ambient mode", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      -[SiriSharedUICompactUserUtteranceView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userUtteranceViewTapped:", self);

    }
  }
}

- (id)_fontForStreamingTextView
{
  id v3;
  void *v4;
  id v5;

  v3 = (id)*MEMORY[0x1E0DC4A88];
  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
  {
    v5 = (id)*MEMORY[0x1E0DC4B50];

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", v5, 1280);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", v3, 256);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_setStreamingText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = (void *)v28[5];
    v28[5] = (uint64_t)v7;

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    v9 = objc_msgSend(v6, "length");
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke;
    v14 = &unk_1EA89CB08;
    v16 = v19;
    v17 = &v21;
    v10 = v6;
    v15 = v10;
    v18 = &v27;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, &v11);
    if (v22[5])
      objc_msgSend((id)v28[5], "addObject:", v11, v12, v13, v14);
    if (!objc_msgSend((id)v28[5], "count", v11, v12, v13, v14) && objc_msgSend(v10, "length"))
      objc_msgSend((id)v28[5], "addObject:", v10);
    -[SUICStreamingTextView setWords:](self->_streamingTextView, "setWords:", v28[5]);
    -[SUICStreamingTextView setWords:](self->_emojiMaskStreamingTextView, "setWords:", v28[5]);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v21, 8);

  }
  _Block_object_dispose(&v27, 8);

}

void __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v11 = a2;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length") != 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v12, "appendString:");
  v13 = a3 - a5;
  if (a3 != a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, a3 - a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v14);

  }
  objc_msgSend(v12, "appendString:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v12);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  v17 = a6 - (v13 + a4);
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke_2;
    v22[3] = &unk_1EA89CAE0;
    v22[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v21, "enumerateSubstringsInRange:options:usingBlock:", a3 + a4, v17, 1026, v22);
  }

}

uint64_t __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", a2);
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    -[SiriSharedUICompactUserUtteranceView _updateAmbientAppearance](self, "_updateAmbientAppearance");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivity = a3;
    -[SiriSharedUICompactUserUtteranceView _updateAmbientAppearance](self, "_updateAmbientAppearance");
  }
}

- (void)_updateAmbientAppearance
{
  _BOOL8 v3;
  SUICStreamingTextView *streamingTextView;
  void *v5;
  SUICStreamingTextView *emojiMaskStreamingTextView;
  void *v7;
  SUICStreamingTextView *v8;
  void *v9;
  SUICStreamingTextView *v10;
  id v11;

  if (-[SRUIFSpeechRecognitionHypothesis isFinal](self->_speechRecognitionHypothesis, "isFinal"))
    v3 = !self->_isInAmbient;
  else
    v3 = 0;
  -[SUICStreamingTextView setShowEditTextImage:](self->_streamingTextView, "setShowEditTextImage:", v3);
  streamingTextView = self->_streamingTextView;
  -[SiriSharedUICompactUserUtteranceView _fontForStreamingTextView](self, "_fontForStreamingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICStreamingTextView setFont:](streamingTextView, "setFont:", v5);

  emojiMaskStreamingTextView = self->_emojiMaskStreamingTextView;
  -[SiriSharedUICompactUserUtteranceView _fontForStreamingTextView](self, "_fontForStreamingTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICStreamingTextView setFont:](emojiMaskStreamingTextView, "setFont:", v7);

  v8 = self->_streamingTextView;
  -[SUICStreamingTextView words](v8, "words");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICStreamingTextView setWords:](v8, "setWords:", v9);

  v10 = self->_emojiMaskStreamingTextView;
  -[SUICStreamingTextView words](v10, "words");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SUICStreamingTextView setWords:](v10, "setWords:", v11);

}

- (SiriSharedUICompactUserUtteranceViewDelegate)delegate
{
  return (SiriSharedUICompactUserUtteranceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (SUICStreamingTextView)_streamingTextView
{
  return self->_streamingTextView;
}

- (void)_setStreamingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_streamingTextView, a3);
}

- (SUICStreamingTextView)_emojiMaskStreamingTextView
{
  return self->_emojiMaskStreamingTextView;
}

- (void)_setEmojiMaskStreamingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_emojiMaskStreamingTextView, a3);
}

- (SUICStreamingTextView)_editableStreamingTextView
{
  return self->_editableStreamingTextView;
}

- (void)_setEditableStreamingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_editableStreamingTextView, a3);
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (UIVisualEffectView)_backgroundView
{
  return self->_backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editableStreamingTextView, 0);
  objc_storeStrong((id *)&self->_emojiMaskStreamingTextView, 0);
  objc_storeStrong((id *)&self->_streamingTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userUtteranceEditingDataManager, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
}

@end
