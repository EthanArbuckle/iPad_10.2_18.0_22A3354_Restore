@implementation PXSharedLibraryAssistantWelcomeViewController

- (PXSharedLibraryAssistantWelcomeViewController)initWithLegacyDevicesFallbackMonitor:(id)a3 legacyDevicesRemoteController:(id)a4
{
  id v7;
  id v8;
  PXSharedLibraryAssistantWelcomeViewController *v9;
  PXSharedLibraryAssistantWelcomeViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  v9 = -[PXSharedLibraryAssistantWelcomeViewController initWithTitle:detailText:icon:contentLayout:](&v12, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E5149688, 0, 0, 4);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyDevicesFallbackMonitor, a3);
    -[PXSharedLibraryLegacyDevicesFallbackMonitor registerChangeObserver:context:](v10->_legacyDevicesFallbackMonitor, "registerChangeObserver:context:", v10, PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext);
    objc_storeStrong((id *)&v10->_legacyDevicesRemoteController, a4);
    -[PXSharedLibraryLegacyDevicesRemoteController registerChangeObserver:context:](v10->_legacyDevicesRemoteController, "registerChangeObserver:context:", v10, PXSharedLibraryLegacyDevicesRemoteControllerObservationContext);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UITextView *v20;
  UITextView *textView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  OBBoldTrayButton *v32;
  OBBoldTrayButton *startButton;
  OBBoldTrayButton *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[4];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  -[OBBaseWelcomeController viewDidLoad](&v50, sel_viewDidLoad);
  -[PXSharedLibraryAssistantWelcomeViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Welcome_Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v3;
  objc_msgSend(v3, "setTitle:", v4);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Welcome_Subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetailText:", v5);

  v6 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibrarySetup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSharedLibraryAssistantWelcomeViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "addSubview:", v8);
  v11 = (void *)MEMORY[0x1E0CB3718];
  v48 = v8;
  objc_msgSend(v8, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  objc_msgSend(v9, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v14;
  objc_msgSend(v8, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v18);

  -[PXSharedLibraryAssistantWelcomeViewController secondaryContentView](self, "secondaryContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  v20 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v20;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSharedLibraryAssistantWelcomeViewController secondaryContentView](self, "secondaryContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_textView);

  v41 = (void *)MEMORY[0x1E0CB3718];
  -[UITextView topAnchor](self->_textView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v44, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v43;
  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v24;
  -[UITextView leadingAnchor](self->_textView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v19;
  objc_msgSend(v19, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v27;
  -[UITextView trailingAnchor](self->_textView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v31);

  -[PXSharedLibraryAssistantWelcomeViewController _updateTextView](self, "_updateTextView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v32 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  startButton = self->_startButton;
  self->_startButton = v32;

  v34 = self->_startButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Start"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v34, "setTitle:forState:", v35, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_startButton, "addTarget:action:forControlEvents:", self, sel_startButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantWelcomeViewController buttonTray](self, "buttonTray");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addButton:", self->_startButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_startButtonTapped_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantWelcomeViewController addKeyCommand:](self, "addKeyCommand:", v37);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_NotNow"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:forState:", v39, 0);

  objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantWelcomeViewController buttonTray](self, "buttonTray");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addButton:", v38);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  -[PXSharedLibraryAssistantWelcomeViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXSharedLibraryAssistantWelcomeViewController _updateTextView](self, "_updateTextView");
}

- (double)_contentViewHeight
{
  return 228.0;
}

- (void)_updateTextView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout())
    v5 = 4;
  else
    v5 = 1;
  objc_msgSend(v4, "setAlignment:", v5);
  v13[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1178];
  v14[0] = v6;
  v14[1] = v4;
  v8 = *MEMORY[0x1E0DC1140];
  v13[1] = v7;
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryLearnMoreStringWithKey(CFSTR("PXSharedLibrarySetupAssistant_Welcome_Body"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_attributedStringByAddingAttributes:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v12);

}

- (void)startButtonTapped:(id)a3
{
  PXSharedLibraryLegacyDevicesRemoteController *legacyDevicesRemoteController;

  legacyDevicesRemoteController = self->_legacyDevicesRemoteController;
  if (legacyDevicesRemoteController)
    -[PXSharedLibraryLegacyDevicesRemoteController beginRemoteUIRequestWithPresenter:](legacyDevicesRemoteController, "beginRemoteUIRequestWithPresenter:", self);
  else
    -[PXSharedLibraryAssistantWelcomeViewController _checkLegacyDeviceMonitorAndAttemptStepForward](self, "_checkLegacyDeviceMonitorAndAttemptStepForward");
}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantWelcomeViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PXSharedLibraryAssistantWelcomeViewController cancelButtonTapped:]";
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle %s", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v4, "cancelAssistantForAssistantViewController:", self);

}

- (BOOL)_isLegacyDevicesFallbackMonitorEnabledAndReady
{
  PXSharedLibraryLegacyDevicesFallbackMonitor *legacyDevicesFallbackMonitor;

  legacyDevicesFallbackMonitor = self->_legacyDevicesFallbackMonitor;
  return !legacyDevicesFallbackMonitor
      || -[PXSharedLibraryLegacyDevicesFallbackMonitor state](legacyDevicesFallbackMonitor, "state") != 0;
}

- (void)_checkLegacyDeviceMonitorAndAttemptStepForward
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PXSharedLibraryAssistantWelcomeViewController _isLegacyDevicesFallbackMonitorEnabledAndReady](self, "_isLegacyDevicesFallbackMonitorEnabledAndReady"))
  {
    -[PXSharedLibraryAssistantWelcomeViewController _forceStepForward](self, "_forceStepForward");
  }
  else
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Begin waiting for legacy devices discovery... [Sender Setup]", v4, 2u);
    }

    self->_wantsToStepForward = 1;
    -[OBBoldTrayButton showsBusyIndicator](self->_startButton, "showsBusyIndicator");
  }
}

- (void)_forceStepForward
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantWelcomeViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[PXSharedLibraryAssistantWelcomeViewController _forceStepForward]";
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "stepForwardInAssistantForAssistantViewControllerAsCurrentViewController:", self);

}

- (void)_legacyDevicesFallbackMonitorChangedState
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PXSharedLibraryAssistantWelcomeViewController _isLegacyDevicesFallbackMonitorEnabledAndReady](self, "_isLegacyDevicesFallbackMonitorEnabledAndReady")&& self->_wantsToStepForward)
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Finished waiting for legacy devices discovery [Sender Setup]", v4, 2u);
    }

    -[OBBoldTrayButton hidesBusyIndicator](self->_startButton, "hidesBusyIndicator");
    -[PXSharedLibraryAssistantWelcomeViewController _forceStepForward](self, "_forceStepForward");
  }
}

- (void)_legacyDevicesRemoteControllerChangedState
{
  switch(-[PXSharedLibraryLegacyDevicesRemoteController state](self->_legacyDevicesRemoteController, "state"))
  {
    case 0:
    case 2:
      -[OBBoldTrayButton hidesBusyIndicator](self->_startButton, "hidesBusyIndicator");
      break;
    case 1:
      -[OBBoldTrayButton showsBusyIndicator](self->_startButton, "showsBusyIndicator");
      break;
    case 3:
      -[OBBoldTrayButton hidesBusyIndicator](self->_startButton, "hidesBusyIndicator");
      -[PXSharedLibraryAssistantWelcomeViewController _forceStepForward](self, "_forceStepForward");
      break;
    case 4:
      -[OBBoldTrayButton hidesBusyIndicator](self->_startButton, "hidesBusyIndicator");
      -[PXSharedLibraryAssistantWelcomeViewController _checkLegacyDeviceMonitorAndAttemptStepForward](self, "_checkLegacyDeviceMonitorAndAttemptStepForward");
      break;
    default:
      return;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PXSharedLibraryAssistantWelcomeViewController _legacyDevicesFallbackMonitorChangedState](self, "_legacyDevicesFallbackMonitorChangedState");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXSharedLibraryLegacyDevicesRemoteControllerObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantWelcomeViewController.m"), 231, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PXSharedLibraryAssistantWelcomeViewController _legacyDevicesRemoteControllerChangedState](self, "_legacyDevicesRemoteControllerChangedState");
LABEL_7:
      v9 = v11;
    }
  }

}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_startButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_legacyDevicesRemoteController, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
}

@end
