@implementation VTUIVoiceSelectionViewController

- (id)_initWithTitle:(id)a3 detailText:(id)a4 recognitionLanguage:(id)a5 compact:(BOOL)a6 allowsRandomSelection:(BOOL)a7 forSelectionStyle:(int64_t)a8 barButtonItemForContinue:(id)a9 dataManager:(id)a10 customVoicePreviewer:(id)a11 delegate:(id)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  VTUIVoiceSelectionViewController *v23;
  VTUIVoiceSelectionViewController *v24;
  void *v25;
  void *v26;
  id v29;
  objc_super v30;

  v12 = a7;
  v13 = a6;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v29 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v30.receiver = self;
  v30.super_class = (Class)VTUIVoiceSelectionViewController;
  v23 = -[VTUIVoiceSelectionViewController init](&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_continueBarButton, a9);
    v24->_allowsRandomSelection = v12;
    objc_storeWeak((id *)&v24->_delegate, v22);
    -[VTUIVoiceSelectionViewController _setupWithTitle:detailText:allowsRandomSelection:compact:forSelectionStyle:](v24, "_setupWithTitle:detailText:allowsRandomSelection:compact:forSelectionStyle:", v17, v18, v12, v13, a8);
    -[VTUIVoiceSelectionViewController _setupContentForRecognitionLanguage:dataManager:customVoicePreviewer:](v24, "_setupContentForRecognitionLanguage:dataManager:customVoicePreviewer:", v19, v20, v21);
    -[VTUIVoiceSelectionViewController _setupButtons](v24, "_setupButtons");
    if (v13)
    {
      -[VTUIVoiceSelectionViewController view](v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v26);

    }
  }

  return v24;
}

- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7
{
  _BOOL8 v9;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  VTUIVoiceSelectionViewController *v18;

  v9 = a4;
  v12 = (objc_class *)MEMORY[0x24BEA85F0];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  v18 = -[VTUIVoiceSelectionViewController initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:](self, "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:", v16, v9, v15, v17, v14, v13);

  return v18;
}

- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 dataManager:(id)a6 customVoicePreviewer:(id)a7 delegate:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  VTUIVoiceSelectionViewController *v21;

  v11 = a4;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[VTUIVoiceSelectionViewController _getTitle](self, "_getTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionViewController _getDetailedText](self, "_getDetailedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[VTUIVoiceSelectionViewController _initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:](self, "_initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:", v19, v20, v18, 0, v11, 0, v17, v16, v15, v14);

  return v21;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 customVoicePreviewer:(id)a5 delegate:(id)a6
{
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a4;
  v10 = (objc_class *)MEMORY[0x24BEA85F0];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  v15 = -[VTUIVoiceSelectionViewController initCompactWithRecognitionLanguage:allowsRandomSelection:dataManager:customVoicePreviewer:delegate:](self, "initCompactWithRecognitionLanguage:allowsRandomSelection:dataManager:customVoicePreviewer:delegate:", v13, v7, v14, v12, v11);

  return v15;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[VTUIVoiceSelectionViewController _getTitle](self, "_getTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionViewController _getDetailedText](self, "_getDetailedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VTUIVoiceSelectionViewController _initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:](self, "_initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:", v16, v17, v15, 1, v9, 0, 0, v14, v13, v12);

  return v18;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 forSelectionStyle:(int64_t)a7 delegate:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v11 = a4;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  -[VTUIVoiceSelectionViewController _getTitle](self, "_getTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionViewController _getDetailedText](self, "_getDetailedText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VTUIVoiceSelectionViewController _initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:](self, "_initWithTitle:detailText:recognitionLanguage:compact:allowsRandomSelection:forSelectionStyle:barButtonItemForContinue:dataManager:customVoicePreviewer:delegate:", v18, v19, v17, 1, v11, a7, 0, v16, v15, v14);

  return v20;
}

- (void)_setupWithTitle:(id)a3 detailText:(id)a4 allowsRandomSelection:(BOOL)a5 compact:(BOOL)a6 forSelectionStyle:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  VTUIVoiceSelectionProximityView *v13;
  void *voiceSelectionContainer;
  VTUIVoiceSelectionView *v15;
  void *v16;
  id v17;

  v9 = a5;
  v17 = a3;
  v12 = a4;
  if (a6)
  {
    v13 = -[VTUIVoiceSelectionProximityView initWithTitle:allowsRandomVoiceSelection:forSelectionStyle:]([VTUIVoiceSelectionProximityView alloc], "initWithTitle:allowsRandomVoiceSelection:forSelectionStyle:", v17, v9, a7);
    voiceSelectionContainer = self->_voiceSelectionContainer;
    self->_voiceSelectionContainer = (VTUIVoiceSelectionContaining *)v13;
  }
  else
  {
    v15 = -[VTUIVoiceSelectionView initWithAllowsRandomVoiceSelection:showContinueButton:]([VTUIVoiceSelectionView alloc], "initWithAllowsRandomVoiceSelection:showContinueButton:", v9, self->_continueBarButton == 0);
    -[VTUIEnrollmentBaseView setTitle:](v15, "setTitle:", v17);
    if (v12)
      -[VTUIEnrollmentBaseView setSubtitle:](v15, "setSubtitle:", v12);
    -[VTUIEnrollmentBaseView setTitle:](v15, "setTitle:", v17);
    -[VTUIEnrollmentBaseView setSubtitle:](v15, "setSubtitle:", v12);
    objc_storeStrong((id *)&self->_voiceSelectionContainer, v15);
    v16 = (void *)MEMORY[0x24BEBD4B8];
    v13 = v15;
    objc_msgSend(v16, "systemBackgroundColor");
    voiceSelectionContainer = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIVoiceSelectionProximityView setBackgroundColor:](v13, "setBackgroundColor:", voiceSelectionContainer);

  }
  -[VTUIVoiceSelectionViewController setView:](self, "setView:", v13);

}

- (id)_getTitle
{
  void *v2;
  void *v3;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "VTUIDeviceSpecificString:", CFSTR("SELECT_VOICE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getDetailedText
{
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE17DC0], "currentAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowGM");
  v4 = CFSTR("DESCRIPTION_VOICE_SELECTION");
  if (v3)
    v4 = CFSTR("GM_DESCRIPTION_VOICE_SELECTION");
  v5 = v4;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "VTUIDeviceSpecificString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setupButtons
{
  void *v3;
  void *v4;
  UIBarButtonItem *continueBarButton;
  id v6;

  if (self->_allowsRandomSelection)
  {
    -[VTUIVoiceSelectionViewController chooseForMeButton](self, "chooseForMeButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__chooseForMeButtonClicked, 64);

  }
  -[VTUIVoiceSelectionContaining dismissButton](self->_voiceSelectionContainer, "dismissButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__dismissButtonClicked, 64);

  continueBarButton = self->_continueBarButton;
  if (continueBarButton)
  {
    -[UIBarButtonItem setTarget:](continueBarButton, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_continueBarButton, "setAction:", sel__continueButtonClicked);
    -[UIBarButtonItem setEnabled:](self->_continueBarButton, "setEnabled:", 0);
  }
  else
  {
    -[VTUIVoiceSelectionViewController continueButton](self, "continueButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__continueButtonClicked, 64);

  }
}

- (void)_setupContentForRecognitionLanguage:(id)a3 dataManager:(id)a4 customVoicePreviewer:(id)a5
{
  id v8;
  id v9;
  VTUIVoiceSelectionOptionsView *v10;
  id v11;
  void *v12;
  SUICVoiceSelectionPresenter *v13;
  SUICVoiceSelectionPresenter *voiceSelectionPresenter;
  VTUIVoiceSelectionOptionsView *voiceOptionsView;
  VTUIVoiceSelectionOptionsView *v16;
  id v17;

  v17 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(VTUIVoiceSelectionOptionsView);
  if (v17)
    v11 = v17;
  else
    v11 = objc_alloc_init(MEMORY[0x24BEA85B8]);
  v12 = v11;
  v13 = (SUICVoiceSelectionPresenter *)objc_msgSend(objc_alloc(MEMORY[0x24BEA85F8]), "initWithDataManaging:view:delegate:voicePreviewing:recognitionLanguage:", v8, v10, self, v11, v9);

  voiceSelectionPresenter = self->_voiceSelectionPresenter;
  self->_voiceSelectionPresenter = v13;

  voiceOptionsView = self->_voiceOptionsView;
  self->_voiceOptionsView = v10;
  v16 = v10;

  -[VTUIVoiceSelectionContaining setContentView:](self->_voiceSelectionContainer, "setContentView:", v16);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *voiceOptionsViewHeightConstraint;
  void *v9;
  void *v10;
  objc_super v11;
  NSLayoutConstraint *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)VTUIVoiceSelectionViewController;
  -[VTUIVoiceSelectionViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  if (self->_voiceOptionsViewHeightConstraint)
  {
    v3 = (void *)MEMORY[0x24BDD1628];
    v13[0] = self->_voiceOptionsViewHeightConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v4);

  }
  -[VTUIVoiceSelectionOptionsView heightAnchor](self->_voiceOptionsView, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionOptionsView sizeThatFits:](self->_voiceOptionsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  objc_msgSend(v5, "constraintEqualToConstant:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  voiceOptionsViewHeightConstraint = self->_voiceOptionsViewHeightConstraint;
  self->_voiceOptionsViewHeightConstraint = v7;

  v9 = (void *)MEMORY[0x24BDD1628];
  v12 = self->_voiceOptionsViewHeightConstraint;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VTUIVoiceSelectionViewController;
  -[VTUIVoiceSelectionViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[VTUIVoiceSelectionViewController chooseForMeButton](self, "chooseForMeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionViewController chooseForMeButton](self, "chooseForMeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v6, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIVoiceSelectionViewController;
  -[VTUIVoiceSelectionViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SUICVoiceSelectionPresenter stopVoicePreview](self->_voiceSelectionPresenter, "stopVoicePreview");
}

- (void)_continueButtonClicked
{
  OUTLINED_FUNCTION_0_0(&dword_229EF7000, a1, a3, "%s voice selection nil when continue button was enabled", a5, a6, a7, a8, 2u);
}

- (void)_chooseForMeButtonClicked
{
  SUICVoiceSelectionPresenter *voiceSelectionPresenter;
  _QWORD v4[4];
  id v5;
  id location;

  self->shouldReportSelectionOnRandomVoicePlayBackCompletion = 1;
  objc_initWeak(&location, self);
  voiceSelectionPresenter = self->_voiceSelectionPresenter;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke;
  v4[3] = &unk_24F33E1E8;
  objc_copyWeak(&v5, &location);
  -[SUICVoiceSelectionPresenter selectRandomVoiceWithCompletion:](voiceSelectionPresenter, "selectRandomVoiceWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  _BYTE *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (WeakRetained[1032])
      {
        objc_msgSend(WeakRetained, "_informDelegateVoiceWasSelected:randomlySelected:", v3, 1);
      }
      else
      {
        v14 = VTUILogContextFacility;
        if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315394;
          v16 = "-[VTUIVoiceSelectionViewController _chooseForMeButtonClicked]_block_invoke";
          v17 = 2112;
          v18 = v3;
          _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ voice already reported due to continue press before playback completion", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    else
    {
      v6 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
        __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v5[1032] = 0;
  }

}

- (void)_informDelegateVoiceWasSelected:(id)a3 randomlySelected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[VTUIVoiceSelectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[VTUIVoiceSelectionViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
    objc_msgSend(v9, "voiceSelectionController:didSelectVoice:randomlySelected:", self, v6, v4);
  else
    objc_msgSend(v9, "voiceSelectionController:didSelectVoice:", self, v6);

}

- (void)_dismissButtonClicked
{
  VTUIVoiceSelectionViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "voiceSelectionControllerRequestsDismissal:", self);

  }
}

- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VTUIVoiceSelectionContaining updateContainerConstraintsForOrientationChangeToSize:](self->_voiceSelectionContainer, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
}

- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4
{
  AFVoiceInfo *v5;
  UIBarButtonItem *continueBarButton;
  void *v7;
  AFVoiceInfo *currentVoiceSelection;

  v5 = (AFVoiceInfo *)a4;
  continueBarButton = self->_continueBarButton;
  if (continueBarButton)
  {
    -[UIBarButtonItem setEnabled:](continueBarButton, "setEnabled:", v5 != 0);
  }
  else
  {
    -[VTUIVoiceSelectionViewController continueButton](self, "continueButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v5 != 0);

  }
  currentVoiceSelection = self->_currentVoiceSelection;
  self->_currentVoiceSelection = v5;

}

- (id)continueButton
{
  return (id)-[VTUIVoiceSelectionContaining continueButton](self->_voiceSelectionContainer, "continueButton");
}

- (id)chooseForMeButton
{
  return (id)-[VTUIVoiceSelectionContaining chooseRandomVoiceButton](self->_voiceSelectionContainer, "chooseRandomVoiceButton");
}

- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VTUIVoiceSelectionContaining setShouldHideCompactBackgroundCardView:](self->_voiceSelectionContainer, "setShouldHideCompactBackgroundCardView:", v3);
}

- (VTUIVoiceSelectionViewControllerDelegate)delegate
{
  return (VTUIVoiceSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continueBarButton, 0);
  objc_storeStrong((id *)&self->_currentVoiceSelection, 0);
  objc_storeStrong((id *)&self->_voiceSelectionContainer, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_voiceOptionsViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_voiceOptionsView, 0);
  objc_storeStrong((id *)&self->_voiceSelectionPresenter, 0);
}

void __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_229EF7000, a1, a3, "%s Random voice was nil", a5, a6, a7, a8, 2u);
}

@end
