@implementation SBVoiceControlViewController

- (SBVoiceControlViewController)initWithSource:(id)a3
{
  id v5;
  SBVoiceControlViewController *v6;
  SBVoiceControlViewController *v7;
  id *p_source;
  uint64_t v9;
  NSString *avAudioRouteName;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  int v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBVoiceControlViewController;
  v6 = -[SBVoiceControlViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_source = (id *)&v6->_source;
    objc_storeStrong((id *)&v6->_source, a3);
    v9 = objc_msgSend(*p_source, "sourceType");
    if (v9)
    {
      if (v9 != 1)
      {
        if (v9 == 2)
        {
          avAudioRouteName = v7->_avAudioRouteName;
          v7->_avAudioRouteName = (NSString *)CFSTR("Headphone");

          v7->_isHeadsetButtonPressedDown = 1;
        }
        goto LABEL_13;
      }
      objc_msgSend(*p_source, "bluetoothDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBVoiceControlViewController _setAVAudioRouteUID:](v7, "_setAVAudioRouteUID:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0D47FC8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if ((v14 & 1) != 0)
      {
        v15 = CFSTR("Headphone");
      }
      else
      {
        -[SBVoiceControlViewController _setPrefersProximityDetectionEnabled:](v7, "_setPrefersProximityDetectionEnabled:", 1);
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "proximityState");

        v15 = CFSTR("Speaker");
        if (v17)
          v15 = CFSTR("Receiver");
      }
      v18 = v7->_avAudioRouteName;
      v7->_avAudioRouteName = &v15->isa;

    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CEB458];
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__deviceProximityStateDidChangeNotification_, v20, v21);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_session)
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC7458]);
    -[VSRecognitionSession setDelegate:](self->_session, "setDelegate:", 0);
    v5 = (id)-[VSRecognitionSession cancel](self->_session, "cancel");
  }
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D48048], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D47FD8], 0);
  v6 = *MEMORY[0x1E0CEB458];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v6, v7);

  -[NSTimer invalidate](self->_delayedConfirmationActionTimer, "invalidate");
  -[SUICFlamesView setDelegate:](self->_flamesView, "setDelegate:", 0);
  -[SiriUISuggestionsView setDelegate:](self->_suggestionsView, "setDelegate:", 0);

  v8.receiver = self;
  v8.super_class = (Class)SBVoiceControlViewController;
  -[SBVoiceControlViewController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  SUICFlamesView *flamesView;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)SBVoiceControlViewController;
  -[SBVoiceControlViewController viewDidLayoutSubviews](&v34, sel_viewDidLayoutSubviews);
  -[SBVoiceControlViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_contentView, "setFrame:", v5, v7, v9, v11);
  -[SBVoiceControlViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  if (v14 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");

  }
  -[UIView bounds](self->_contentView, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = *MEMORY[0x1E0C9D648];
  -[UILabel font](self->_titleLabel, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  CGRectGetMinY(v35);
  -[SBVoiceControlViewController _titleBaseline](self, "_titleBaseline");
  objc_msgSend(v25, "descender");
  objc_msgSend(v25, "lineHeight");
  UIRoundToScale();
  v27 = v26;
  objc_msgSend(v25, "lineHeight");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v24, v27, v21, v28);
  -[UILabel font](self->_subtitleLabel, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36.origin.x = v17;
  v36.origin.y = v19;
  v36.size.width = v21;
  v36.size.height = v23;
  CGRectGetMinY(v36);
  -[SBVoiceControlViewController _subtitleBaseline](self, "_subtitleBaseline");
  objc_msgSend(v29, "descender");
  objc_msgSend(v29, "lineHeight");
  UIRoundToScale();
  v31 = v30;
  objc_msgSend(v29, "lineHeight");
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v24, v31, v21, v32);
  flamesView = self->_flamesView;
  -[SBVoiceControlViewController _flamesViewFrame](self, "_flamesViewFrame");
  -[SUICFlamesView setFrame:](flamesView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *contentView;
  UIView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  UILabel *v18;
  UILabel *titleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  UILabel *subtitleLabel;
  UILabel *v27;
  void *v28;
  SiriUISuggestionsView *v29;
  SiriUISuggestionsView *suggestionsView;
  SiriUISuggestionsView *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  SUICFlamesView *v42;
  SUICFlamesView *flamesView;
  SUICFlamesView *v44;
  id v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)SBVoiceControlViewController;
  -[SBVoiceControlViewController viewDidLoad](&v48, sel_viewDidLoad);
  -[SBVoiceControlViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
  contentView = self->_contentView;
  self->_contentView = v9;

  v11 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  objc_msgSend(v4, "addSubview:", self->_contentView);
  -[UIView bounds](self->_contentView, "bounds");
  v14 = v13;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 36.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v18;

  -[UILabel setFont:](self->_titleLabel, "setFont:", v17);
  v20 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v20, "setTextColor:", v21);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v22 = self->_titleLabel;
  -[SBVoiceControlViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("JIBBLER"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v23);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v25;

  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v24);
  v27 = self->_subtitleLabel;
  -[UILabel textColor](self->_titleLabel, "textColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v27, "setTextColor:", v28);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_subtitleLabel);
  v29 = (SiriUISuggestionsView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7A08]), "initWithFrame:", 0.0, 0.0, v14, v16 + -95.0 + -20.0);
  suggestionsView = self->_suggestionsView;
  self->_suggestionsView = v29;

  v31 = self->_suggestionsView;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVoiceControlViewController.m"), 185, CFSTR("can't create Siri UI suggestions view -- was the appropriate framework mastered onto this device?"));

    v31 = self->_suggestionsView;
  }
  -[SiriUISuggestionsView setDelegate:](v31, "setDelegate:", self);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_suggestionsView);
  v32 = objc_alloc(MEMORY[0x1E0DA7A28]);
  -[SBVoiceControlViewController _flamesViewFrame](self, "_flamesViewFrame");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (SUICFlamesView *)objc_msgSend(v32, "initWithFrame:screen:fidelity:", v41, 0, v34, v36, v38, v40);
  flamesView = self->_flamesView;
  self->_flamesView = v42;

  v44 = self->_flamesView;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVoiceControlViewController.m"), 191, CFSTR("can't create Siri UI feedback view -- was the appropriate framework mastered onto this device?"));

    v44 = self->_flamesView;
  }
  -[SUICFlamesView setMode:](v44, "setMode:", 1);
  -[SUICFlamesView setDelegate:](self->_flamesView, "setDelegate:", self);
  -[SUICFlamesView setNeedsLayout](self->_flamesView, "setNeedsLayout");
  -[SUICFlamesView setState:](self->_flamesView, "setState:", 1);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_flamesView);
  -[SBVoiceControlViewController _setFeedbackVisible:animated:](self, "_setFeedbackVisible:animated:", 0, 0);
  v45 = -[SBVoiceControlViewController _newRecognitionSession](self, "_newRecognitionSession");
  -[SBVoiceControlViewController _setSession:](self, "_setSession:", v45);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBVoiceControlViewController;
  -[SBVoiceControlViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBVoiceControlViewController _startSession](self, "_startSession");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *delayedConfirmationActionTimer;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBVoiceControlViewController;
  -[SBVoiceControlViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_delayedConfirmationActionTimer, "invalidate");
  delayedConfirmationActionTimer = self->_delayedConfirmationActionTimer;
  self->_delayedConfirmationActionTimer = 0;

  v5 = (id)-[VSRecognitionSession cancel](self->_session, "cancel");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)nextSuggestionsForSuggestionsView:(id)a3 maxSuggestions:(unint64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = -[VSRecognitionSession keywordCount](self->_session, "keywordCount", a3);
  if (v6 >= 1)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= a4)
    {
      if (!a4)
      {
LABEL_8:
        self->_startingKeywordIndex = (self->_startingKeywordIndex + a4) % v7;
        return v8;
      }
    }
    else
    {
      self->_startingKeywordIndex = 0;
      a4 = v7;
    }
    v9 = 0;
    do
    {
      -[VSRecognitionSession keywordAtIndex:](self->_session, "keywordAtIndex:", (v9 + self->_startingKeywordIndex) % (uint64_t)v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

      ++v9;
    }
    while (a4 != v9);
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
  return v8;
}

- (float)audioLevelForFlamesView:(id)a3
{
  float v4;
  float result;

  if (!-[VSRecognitionSession isActivelyRecognizing](self->_session, "isActivelyRecognizing", a3))
    return -120.0;
  -[VSRecognitionSession inputLevelDB](self->_session, "inputLevelDB");
  if (v4 == 0.0)
    return -120.0;
  -[VSRecognitionSession inputLevelDB](self->_session, "inputLevelDB");
  return result;
}

- (void)recognitionSessionDidBeginAction:(id)a3
{
  if (objc_msgSend(a3, "isRecognizing"))
  {
    -[SBVoiceControlViewController _setFeedbackVisible:animated:](self, "_setFeedbackVisible:animated:", 1, 1);
    -[SiriUISuggestionsView startSuggesting](self->_suggestionsView, "startSuggesting");
  }
  else
  {
    self->_wasRecognizing = 0;
  }
}

- (void)recognitionSession:(id)a3 didCompleteActionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  SystemSoundID v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[SBVoiceControlViewController _setFeedbackVisible:animated:](self, "_setFeedbackVisible:animated:", 0, 1);
  -[SiriUISuggestionsView stopSuggesting](self->_suggestionsView, "stopSuggesting");
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC7448]) & 1) != 0)
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == -4002)
      {
LABEL_14:
        -[SBVoiceControlViewController _handleButtonUpCancel](self, "_handleButtonUpCancel");
        goto LABEL_25;
      }
    }
    else
    {

    }
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBVoiceControlViewController recognitionSession:didCompleteActionWithError:].cold.1();

    if (!self->_wasRecognizing)
      goto LABEL_14;
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "isFinished") & 1) != 0)
  {
    if (!-[VSRecognitionSession isValid](self->_session, "isValid"))
    {
      -[SBVoiceControlViewController _requestDismissal](self, "_requestDismissal");
      goto LABEL_25;
    }
    -[SBVoiceControlViewController _configureRoutingIfNeeded](self, "_configureRoutingIfNeeded");
    if (self->_wasRecognizing)
    {
LABEL_13:
      -[SBVoiceControlViewController _performNoMatchFound](self, "_performNoMatchFound");
      goto LABEL_25;
    }
    -[SBVoiceControlViewController _continueWithRecognitionAction](self, "_continueWithRecognitionAction");
  }
  else
  {
    -[SBVoiceControlViewController _configureRoutingIfNeeded](self, "_configureRoutingIfNeeded");
    objc_msgSend(v6, "displayResultString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[SBVoiceControlViewController _setTitleText:](self, "_setTitleText:", v11);
    objc_msgSend(v6, "displayStatusString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVoiceControlViewController _setStatusText:](self, "_setStatusText:", v12);

    if (self->_wasRecognizing)
    {
      objc_initWeak(&location, self);
      if (objc_msgSend(v6, "nextActionWillRecognize"))
        v13 = 1115;
      else
        v13 = 1111;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke;
      v14[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v15, &location);
      AudioServicesPlaySystemSoundWithCompletion(v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SBVoiceControlViewController _speakFeedbackText](self, "_speakFeedbackText");
    }

  }
LABEL_25:

}

void __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke_2;
  v1[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  _SBVoiceControlDispatchMain(v1);
  objc_destroyWeak(&v2);
}

void __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_speakFeedbackText");

}

- (void)recognitionSession:(id)a3 didFinishSpeakingFeedbackStringWithError:(id)a4
{
  VSRecognitionSession *v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = (VSRecognitionSession *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_session == v6)
  {
    if (v7)
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBVoiceControlViewController recognitionSession:didFinishSpeakingFeedbackStringWithError:].cold.1();

    }
    -[SBVoiceControlViewController _continueWithRecognitionAction](self, "_continueWithRecognitionAction");
  }

}

- (void)recognitionSession:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

    goto LABEL_5;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", v6);
  v10 = objc_msgSend(v9, "isValid");

  if (!v10)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_52;
    v17[3] = &unk_1E8E9F1C0;
    v18 = v7;
    v11 = v7;
    objc_msgSend(v16, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], v17);

    v15 = v18;
    goto LABEL_6;
  }
  v11 = (id)objc_opt_new();
  v12 = *MEMORY[0x1E0D22DA8];
  v21[0] = *MEMORY[0x1E0D22D88];
  v21[1] = v12;
  v22[0] = MEMORY[0x1E0C9AAB0];
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrontBoardOptions:", v13);

  objc_msgSend(v11, "setSensitive:", 1);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke;
  v19[3] = &unk_1E8EC0B30;
  v20 = v7;
  v15 = v7;
  objc_msgSend(v14, "openURL:configuration:completionHandler:", v6, v11, v19);

LABEL_6:
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0DC7448];
      v14 = *MEMORY[0x1E0CB3388];
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -4007, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }

}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_52(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_52_cold_1(v4);

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC7448], -4007, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }
}

- (BOOL)recognitionSessionWillBeginAction:(id)a3
{
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = -[VSRecognitionSession isRecognizing](self->_session, "isRecognizing");
  if (v5)
  {
    -[SBVoiceControlViewController _configureRoutingIfNeeded](self, "_configureRoutingIfNeeded");
    self->_wasRecognizing = 1;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke;
    v7[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v8, &location);
    AudioServicesPlaySystemSoundWithCompletion(0x456u, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5 ^ 1;
}

void __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke_2;
  v1[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  _SBVoiceControlDispatchMain(v1);
  objc_destroyWeak(&v2);
}

void __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_continueRecognitionAction");

}

- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3
{
  if (a3)
  {
    if (self->_isHeadsetButtonPressedDown
      && -[VSRecognitionSession hasDeferredAction](self->_session, "hasDeferredAction"))
    {
      -[SBVoiceControlViewController _continueRecognitionAction](self, "_continueRecognitionAction");
    }
  }
  else
  {
    -[SBVoiceControlViewController _handleButtonUpCancel](self, "_handleButtonUpCancel");
  }
  self->_isHeadsetButtonPressedDown = 0;
}

- (BOOL)handleHomeButtonPress
{
  -[SBVoiceControlViewController _handleButtonUpCancel](self, "_handleButtonUpCancel");
  return 1;
}

- (void)performDismissalTransitionAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke;
    v11[3] = &unk_1E8E9DED8;
    v11[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke_2;
    v9[3] = &unk_1E8E9F1C0;
    v10 = v6;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v11, v9, 0.3);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 0.0);
}

uint64_t __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)performPresentationTransitionAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke;
    v12[3] = &unk_1E8E9DED8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_2;
    v11[3] = &unk_1E8E9DED8;
    v11[4] = self;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_3;
    v9[3] = &unk_1E8E9F1C0;
    v10 = v6;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v11, v9, 0.3);

  }
  else
  {
    -[UIView setAlpha:](self->_contentView, "setAlpha:", 1.0);
    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 0.0);
}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)resetSessionWithSource:(id)a3
{
  if (objc_msgSend(a3, "sourceType") == 2)
    self->_isHeadsetButtonPressedDown = 1;
  -[SBVoiceControlViewController _resetSession](self, "_resetSession");
}

- (void)_avSystemControllerPickableRoutesDidChangeNotification:(id)a3
{
  void *v4;

  -[SBVoiceControlViewController _currentPreferredRouteDictionary](self, "_currentPreferredRouteDictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SBVoiceControlViewController _requestDismissal](self, "_requestDismissal");
}

- (void)_avSystemControllerHeadphoneJackIsConnectedDidChangeNotification:(id)a3
{
  void *v4;

  -[SBVoiceControlViewController _currentPreferredRouteDictionary](self, "_currentPreferredRouteDictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SBVoiceControlViewController _requestDismissal](self, "_requestDismissal");
}

- (void)_deviceProximityStateDidChangeNotification:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  NSString *avAudioRouteName;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "proximityState");
  v6 = CFSTR("Speaker");
  if (v5)
    v6 = CFSTR("Receiver");
  v12 = v6;

  v7 = v12;
  avAudioRouteName = self->_avAudioRouteName;
  if (avAudioRouteName != (NSString *)v12)
  {
    v9 = -[NSString isEqualToString:](avAudioRouteName, "isEqualToString:", v12);
    v7 = v12;
    if (!v9)
    {
      v10 = (NSString *)-[__CFString copy](v12, "copy");
      v11 = self->_avAudioRouteName;
      self->_avAudioRouteName = v10;

      -[SBVoiceControlViewController _setNeedsRoutingUpdate](self, "_setNeedsRoutingUpdate");
      v7 = v12;
    }
  }

}

- (void)_recognitionSessionKeywordsDidChangeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__SBVoiceControlViewController__recognitionSessionKeywordsDidChangeNotification___block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  _SBVoiceControlDispatchMain(v3);
}

uint64_t __81__SBVoiceControlViewController__recognitionSessionKeywordsDidChangeNotification___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "stopSuggesting");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "startSuggesting");
}

- (id)_availableRouteDictionaries
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D48030]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureRoutingIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error changing route: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_continueRecognitionAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error continuing action: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_continueWithRecognitionAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error beginning next action: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __62__SBVoiceControlViewController__continueWithRecognitionAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performConfirmationAction");

}

- (id)_currentPreferredRouteDictionary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  -[SBVoiceControlViewController _availableRouteDictionaries](self, "_availableRouteDictionaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", *MEMORY[0x1E0D47FC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (-[SBVoiceControlViewController shouldDisableVoiceControlForBluetoothRequests](self, "shouldDisableVoiceControlForBluetoothRequests"))
  {
    v7 = 0;
  }
  else if (-[SBVoiceControlPresentationSource sourceType](self->_source, "sourceType"))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6 ^ 1u;
  }
  -[SBVoiceControlViewController _preferredRouteDictionaryWithAvailableRouteDictionaries:preferredAVAudioRouteName:preferredAVAudioRouteUID:shouldPreferBluetooth:](self, "_preferredRouteDictionaryWithAvailableRouteDictionaries:preferredAVAudioRouteName:preferredAVAudioRouteUID:shouldPreferBluetooth:", v3, self->_avAudioRouteName, self->_avAudioRouteUID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_flamesViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self->_contentView, "bounds");
  v4 = v3 + -95.0;
  v5 = 95.0;
  v6 = 0.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v6;
  return result;
}

- (void)_handleButtonUpCancel
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = (id)-[VSRecognitionSession cancelMaintainingKeepAlive:](self->_session, "cancelMaintainingKeepAlive:", 1);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke;
  v4[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v5, &location);
  AudioServicesPlaySystemSoundWithCompletion(0x458u, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 270000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke_2;
  block[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestDismissal");

}

- (BOOL)_hasPickableBluetoothDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickableRoutesForCategory:", CFSTR("VoiceCommand_WithBluetooth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    v7 = (_QWORD *)MEMORY[0x1E0D481E0];
    v8 = (_QWORD *)MEMORY[0x1E0D48020];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "objectForKey:", *v7, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *v8);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_localizedStringForKey:(id)a3
{
  id v4;
  NSDictionary *localizationKeys;
  void *v6;
  const void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;

  v4 = a3;
  localizationKeys = self->_localizationKeys;
  if (!localizationKeys)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const void *)VSRecognitionModelCopyResourceURL();

    if (v7)
    {
      v8 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v7);
      v9 = self->_localizationKeys;
      self->_localizationKeys = v8;

      CFRelease(v7);
    }
    localizationKeys = self->_localizationKeys;
    if (!localizationKeys)
    {
      self->_localizationKeys = (NSDictionary *)MEMORY[0x1E0C9AA70];

      localizationKeys = self->_localizationKeys;
    }
  }
  -[NSDictionary objectForKey:](localizationKeys, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v4, &stru_1E8EC7EC0, CFSTR("Jibbler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_newRecognitionSession
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC7408]);
  objc_msgSend(v3, "setDebugDumpEnabled:", -[SBVoiceControlViewController isVoiceControlLoggingEnabled](self, "isVoiceControlLoggingEnabled"));
  objc_msgSend(v3, "setSensitiveActionsEnabled:", -[SBVoiceControlViewController shouldAllowSensitiveActions](self, "shouldAllowSensitiveActions"));
  if (-[SBVoiceControlViewController shouldDisableHandlerActions](self, "shouldDisableHandlerActions"))
    objc_msgSend(v3, "setPerformRecognitionHandlerActions:", 0);
  objc_msgSend(v3, "setInputLevelUpdateInterval:", 0.1);
  objc_msgSend(v3, "setKeywordPhase:", 5);
  v4 = -[SBVoiceControlViewController _hasPickableBluetoothDevice](self, "_hasPickableBluetoothDevice");
  if (v4 || -[SBVoiceControlPresentationSource sourceType](self->_source, "sourceType") != 1)
  {
    objc_msgSend(v3, "setBluetoothInputAllowed:", v4);
  }
  else
  {
    -[SBVoiceControlPresentationSource bluetoothDevice](self->_source, "bluetoothDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBluetoothInputAllowed:", v5 != 0);

  }
  return v3;
}

- (void)_performConfirmationAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error performing confirmation action: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_performNoMatchFound
{
  void *v3;
  id v4;
  _QWORD inCompletionBlock[4];
  id v6;
  id v7;
  id location;

  -[SBVoiceControlViewController _setTitleText:](self, "_setTitleText:", 0);
  -[SBVoiceControlViewController _setStatusText:](self, "_setStatusText:", 0);
  -[SBVoiceControlViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("NO_MATCH_FOUND"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  inCompletionBlock[0] = MEMORY[0x1E0C809B0];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __52__SBVoiceControlViewController__performNoMatchFound__block_invoke;
  inCompletionBlock[3] = &unk_1E8E9F280;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  AudioServicesPlaySystemSoundWithCompletion(0x45Cu, inCompletionBlock);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __52__SBVoiceControlViewController__performNoMatchFound__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__SBVoiceControlViewController__performNoMatchFound__block_invoke_2;
  v2[3] = &unk_1E8E9F280;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  _SBVoiceControlDispatchMain(v2);

  objc_destroyWeak(&v4);
}

void __52__SBVoiceControlViewController__performNoMatchFound__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_speakText:", *(_QWORD *)(a1 + 32));

}

- (id)_popNextRecognitionAudioInputPath
{
  void *v3;
  NSUInteger v4;
  NSArray *nextRecognitionAudioInputPaths;
  NSArray *v6;

  -[NSArray lastObject](self->_nextRecognitionAudioInputPaths, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray count](self->_nextRecognitionAudioInputPaths, "count");
  nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  if (v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray subarrayWithRange:](nextRecognitionAudioInputPaths, "subarrayWithRange:", 0, -[NSArray count](self->_nextRecognitionAudioInputPaths, "count") - 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  }
  self->_nextRecognitionAudioInputPaths = v6;

  return v3;
}

- (id)_preferredRouteDictionaryWithAvailableRouteDictionaries:(id)a3 preferredAVAudioRouteName:(id)a4 preferredAVAudioRouteUID:(id)a5 shouldPreferBluetooth:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  _BOOL8 v24;
  void *v25;
  int v26;
  id v27;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  if (!(v10 | v11))
    goto LABEL_30;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v13)
  {

LABEL_30:
    v15 = 0;
    v27 = 0;
    goto LABEL_31;
  }
  v14 = v13;
  v29 = v9;
  v15 = 0;
  v16 = *(_QWORD *)v32;
  v30 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if (v11)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "objectForKey:", *MEMORY[0x1E0D481F8]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "hasPrefix:", v11))
        {
          v27 = v18;

          goto LABEL_26;
        }

      }
      if (!v15)
      {
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D480C8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v10 && v20 && (objc_msgSend(v20, "isEqualToString:", v10) & 1) != 0)
          goto LABEL_18;
        if (!v6)
          goto LABEL_19;
        v22 = v12;
        v23 = v10;
        v24 = v6;
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D481E0]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D48020]);

        if (!v26)
        {
          v15 = 0;
          v6 = v24;
          v10 = v23;
          v12 = v22;
          v16 = v30;
          goto LABEL_21;
        }
        v6 = v24;
        v10 = v23;
        v12 = v22;
        v16 = v30;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("HeadsetBT")) & 1) != 0
          || objc_msgSend(v21, "isEqualToString:", CFSTR("HeadphonesBT")))
        {
LABEL_18:
          v15 = v18;
        }
        else
        {
LABEL_19:
          v15 = 0;
        }
LABEL_21:

        continue;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
      continue;
    break;
  }
  v27 = 0;
LABEL_26:

  v9 = v29;
  if (!v27 && v15)
  {
    v15 = v15;
    v27 = v15;
  }
LABEL_31:

  return v27;
}

- (void)_requestDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "voiceControlViewControllerRequestsDismissal:", self);

}

- (void)_resetSession
{
  id v3;
  id v4;

  -[SBVoiceControlViewController _setFeedbackVisible:animated:](self, "_setFeedbackVisible:animated:", 0, 1);
  -[SiriUISuggestionsView stopSuggesting](self->_suggestionsView, "stopSuggesting");
  v3 = (id)-[VSRecognitionSession cancel](self->_session, "cancel");
  -[SBVoiceControlViewController _setTitleText:](self, "_setTitleText:", 0);
  -[SBVoiceControlViewController _setStatusText:](self, "_setStatusText:", 0);
  v4 = -[SBVoiceControlViewController _newRecognitionSession](self, "_newRecognitionSession");
  -[SBVoiceControlViewController _setSession:](self, "_setSession:", v4);
  -[SBVoiceControlViewController _startSession](self, "_startSession");
  -[SiriUISuggestionsView startSuggesting](self->_suggestionsView, "startSuggesting");

}

- (void)_setAVAudioRouteUID:(id)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *avAudioRouteUID;
  id v8;
  id v9;

  v8 = a3;
  if (objc_msgSend(v8, "containsString:", CFSTR("-")))
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "rangeOfString:", CFSTR("-")));
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v4;
  }
  else
  {
    v5 = v8;
  }
  v9 = v5;
  v6 = (NSString *)objc_msgSend(v5, "copy");
  avAudioRouteUID = self->_avAudioRouteUID;
  self->_avAudioRouteUID = v6;

}

- (void)_setFeedbackVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  v5 = a3;
  -[SBVoiceControlViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SBVoiceControlViewController__setFeedbackVisible_animated___block_invoke;
    v8[3] = &unk_1E8E9F508;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, 0.25);
    if (v5)
      return;
LABEL_8:
    -[SiriUISuggestionsView stopSuggesting](self->_suggestionsView, "stopSuggesting");
    return;
  }
  if (v5)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[SUICFlamesView setAlpha:](self->_flamesView, "setAlpha:", v7);
  -[SiriUISuggestionsView setAlpha:](self->_suggestionsView, "setAlpha:", v7);
  if (!v5)
    goto LABEL_8;
}

uint64_t __61__SBVoiceControlViewController__setFeedbackVisible_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  else
    v4 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", v4);
}

- (void)_setNeedsRoutingUpdate
{
  self->_hasConfiguredRouting = 0;
}

- (void)_setPrefersProximityDetectionEnabled:(BOOL)a3
{
  id WeakRetained;

  if (self->_prefersProximityDetectionEnabled != a3)
  {
    self->_prefersProximityDetectionEnabled = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "voiceControlViewControllerPrefersProximityDetectionEnabledDidChange:", self);

  }
}

- (void)_setSession:(id)a3
{
  VSRecognitionSession *v5;
  VSRecognitionSession **p_session;
  VSRecognitionSession *session;
  _QWORD *v8;
  void *v9;
  void *v10;
  VSRecognitionSession *v11;

  v5 = (VSRecognitionSession *)a3;
  p_session = &self->_session;
  session = self->_session;
  v11 = v5;
  if (session != v5)
  {
    v8 = (_QWORD *)MEMORY[0x1E0DC7458];
    if (session)
    {
      -[VSRecognitionSession setDelegate:](session, "setDelegate:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *v8, *p_session);

    }
    objc_storeStrong((id *)&self->_session, a3);
    if (*p_session)
    {
      -[VSRecognitionSession setDelegate:](*p_session, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__recognitionSessionKeywordsDidChangeNotification_, *v8, *p_session);

    }
  }

}

- (void)_setStatusText:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBVoiceControlViewController *v12;
  _QWORD v13[5];
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v4 = a3;
  if (v4)
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v4);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v16.c = v5;
    *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformMakeTranslation(&v16, 0.0, -10.0);
  }
  else
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v16.c = v6;
    *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__SBVoiceControlViewController__setStatusText___block_invoke;
  v13[3] = &unk_1E8EA4AE0;
  v13[4] = self;
  v15 = v16;
  v14 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__SBVoiceControlViewController__setStatusText___block_invoke_2;
  v10[3] = &unk_1E8E9DEB0;
  v11 = v14;
  v12 = self;
  v9 = v14;
  objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 327680, v13, v10, 0.25, 0.0);

}

uint64_t __47__SBVoiceControlViewController__setStatusText___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  double v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  v3 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v3;
  v10 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setTransform:", &v8);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  v5 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v5;
  v10 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v4, "setTransform:", &v8);
  v6 = 1.0;
  if (!*(_QWORD *)(a1 + 40))
    v6 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setAlpha:", v6);
}

uint64_t __47__SBVoiceControlViewController__setStatusText___block_invoke_2(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 1056), "setText:", 0);
  return result;
}

- (void)_setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
  {
    -[SBVoiceControlViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("JIBBLER"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (void)_speakFeedbackText
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error speaking text (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_speakText:(id)a3
{
  void *v4;
  NSObject *v5;

  -[VSRecognitionSession beginSpeakingString:](self->_session, "beginSpeakingString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBVoiceControlViewController _speakFeedbackText].cold.1();

    -[SBVoiceControlViewController _continueWithRecognitionAction](self, "_continueWithRecognitionAction");
  }

}

- (void)_startSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error starting recognition: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (double)_titleBaseline
{
  return dbl_1D0E8BF20[(unint64_t)(-[SBVoiceControlViewController interfaceOrientation](self, "interfaceOrientation")- 1) < 2];
}

- (double)_subtitleBaseline
{
  return dbl_1D0E8BF30[(unint64_t)(-[SBVoiceControlViewController interfaceOrientation](self, "interfaceOrientation")- 1) < 2];
}

- (NSArray)nextRecognitionAudioInputPaths
{
  return self->_nextRecognitionAudioInputPaths;
}

- (void)setNextRecognitionAudioInputPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (BOOL)prefersProximityDetectionEnabled
{
  return self->_prefersProximityDetectionEnabled;
}

- (BOOL)shouldAllowSensitiveActions
{
  return self->_shouldAllowSensitiveActions;
}

- (void)setShouldAllowSensitiveActions:(BOOL)a3
{
  self->_shouldAllowSensitiveActions = a3;
}

- (BOOL)shouldDisableHandlerActions
{
  return self->_shouldDisableHandlerActions;
}

- (void)setShouldDisableHandlerActions:(BOOL)a3
{
  self->_shouldDisableHandlerActions = a3;
}

- (BOOL)shouldDisableVoiceControlForBluetoothRequests
{
  return self->_shouldDisableVoiceControlForBluetoothRequests;
}

- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3
{
  self->_shouldDisableVoiceControlForBluetoothRequests = a3;
}

- (BOOL)isVoiceControlLoggingEnabled
{
  return self->_voiceControlLoggingEnabled;
}

- (void)setVoiceControlLoggingEnabled:(BOOL)a3
{
  self->_voiceControlLoggingEnabled = a3;
}

- (SBVoiceControlViewControllerDelegate)voiceControlDelegate
{
  return (SBVoiceControlViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
}

- (void)setVoiceControlDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_voiceControlDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceControlDelegate);
  objc_storeStrong((id *)&self->_nextRecognitionAudioInputPaths, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localizationKeys, 0);
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_delayedConfirmationActionTimer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_avAudioRouteUID, 0);
  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
}

- (void)recognitionSession:didCompleteActionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error during session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)recognitionSession:didFinishSpeakingFeedbackStringWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Speech finished with an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "VoiceControl: failed dial request with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_52_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "VoiceControl: failed to openURL", v1, 2u);
}

@end
