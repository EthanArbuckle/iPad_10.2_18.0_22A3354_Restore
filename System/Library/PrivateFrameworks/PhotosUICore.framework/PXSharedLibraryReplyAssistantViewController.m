@implementation PXSharedLibraryReplyAssistantViewController

- (void)_setIsWaitingToStepForward:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXSharedLibraryReplyAssistantViewController setWantsToStepForward:](self, "setWantsToStepForward:");
  -[PXSharedLibraryReplyAssistantViewController setupButton](self, "setupButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "showsBusyIndicator");
  else
    objc_msgSend(v5, "hidesBusyIndicator");

}

- (BOOL)_canStepForward
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXSharedLibraryReplyAssistantViewController legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "state") != 0;
  else
    v4 = 1;

  return v4;
}

- (void)_stepForward
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryReplyAssistantViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[PXSharedLibraryReplyAssistantViewController(Internal) _stepForward]";
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "stepForwardInAssistantForAssistantViewController:", self);

}

- (void)acceptAndContinue
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PXSharedLibraryReplyAssistantViewController _canStepForward](self, "_canStepForward"))
  {
    -[PXSharedLibraryReplyAssistantViewController _stepForward](self, "_stepForward");
  }
  else
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Begin waiting for legacy devices discovery... [Receiver Setup]", v4, 2u);
    }

    -[PXSharedLibraryReplyAssistantViewController _setIsWaitingToStepForward:](self, "_setIsWaitingToStepForward:", 1);
  }
}

- (void)declineInvitation
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[PXSharedLibraryReplyAssistantViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXSharedLibraryReplyAssistantViewController_Internal__declineInvitation__block_invoke;
  v7[3] = &unk_1E5138B50;
  v7[4] = self;
  v7[5] = a2;
  PXSharedLibraryDeclineInvitation(v5, v6, CFSTR("Assistant"), v7);

}

- (void)legacyDevicesFallbackMonitorChangedState
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PXSharedLibraryReplyAssistantViewController _canStepForward](self, "_canStepForward")
    && -[PXSharedLibraryReplyAssistantViewController wantsToStepForward](self, "wantsToStepForward"))
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Finished waiting for legacy devices discovery [Receiver Setup]", v4, 2u);
    }

    -[PXSharedLibraryReplyAssistantViewController _setIsWaitingToStepForward:](self, "_setIsWaitingToStepForward:", 0);
    -[PXSharedLibraryReplyAssistantViewController _stepForward](self, "_stepForward");
  }
}

void __74__PXSharedLibraryReplyAssistantViewController_Internal__declineInvitation__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assistantViewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      PXAssertGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315138;
        v6 = "-[PXSharedLibraryReplyAssistantViewController(Internal) declineInvitation]_block_invoke";
        _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v5, 0xCu);
      }

    }
    objc_msgSend(v3, "completeAssistantForAssistantViewController:", *(_QWORD *)(a1 + 32));

  }
}

- (PXSharedLibraryReplyAssistantViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantViewController+iOS.m"), 38, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryReplyAssistantViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (PXSharedLibraryReplyAssistantViewController)initWithViewModel:(id)a3 legacyDevicesFallbackMonitor:(id)a4
{
  id v8;
  id v9;
  PXSharedLibraryReplyAssistantViewController *v10;
  PXSharedLibraryReplyAssistantViewController *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryReplyAssistantViewController+iOS.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  v10 = -[PXSharedLibraryReplyAssistantViewController initWithTitle:detailText:icon:contentLayout:](&v14, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E5149688, 0, 0, 2);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewModel, a3);
    objc_storeStrong((id *)&v11->_legacyDevicesFallbackMonitor, a4);
    -[PXSharedLibraryLegacyDevicesFallbackMonitor registerChangeObserver:context:](v11->_legacyDevicesFallbackMonitor, "registerChangeObserver:context:", v11, PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext_282242);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  -[OBBaseWelcomeController viewDidLoad](&v16, sel_viewDidLoad);
  -[PXSharedLibraryReplyAssistantViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_Intro_Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PXSharedLibraryReplyAssistantViewController _updateImage](self, "_updateImage");
  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v5;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSharedLibraryReplyAssistantViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_addFullBoundsSubview:", self->_textView);

  -[PXSharedLibraryReplyAssistantViewController _updateTextView](self, "_updateTextView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_Intro_ButtonTitle_Start"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_setupButtonTapped_, 0x2000);
  -[PXSharedLibraryReplyAssistantViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v8);

  -[PXSharedLibraryReplyAssistantViewController setSetupButton:](self, "setSetupButton:", v8);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_setupButtonTapped_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryReplyAssistantViewController addKeyCommand:](self, "addKeyCommand:", v11);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_Intro_ButtonTitle_Decline"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v13, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_declineButtonTapped_, 0x2000);
  -[PXSharedLibraryReplyAssistantViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v12);

  -[PXSharedLibraryReplyAssistantViewController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowFullWidthIcon:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  -[PXSharedLibraryReplyAssistantViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryReplyAssistantViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryReplyAssistantViewController _updateImage](self, "_updateImage");
  -[PXSharedLibraryReplyAssistantViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      -[PXSharedLibraryReplyAssistantViewController _updateTextView](self, "_updateTextView");
  }

}

- (void)_updateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[PXSharedLibraryReplyAssistantViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibraryReplyAssistantViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PXSharedLibraryReplyAssistantViewController__updateImage__block_invoke;
    v8[3] = &unk_1E5144E48;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    PXSharedLibraryRequestInvitationImageForOwner(v7, v6, v8, 84.0, 84.0);

  }
}

- (void)_updateTextView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout())
    v5 = 4;
  else
    v5 = 1;
  objc_msgSend(v4, "setAlignment:", v5);
  v6 = *MEMORY[0x1E0DC1140];
  v27[0] = *MEMORY[0x1E0DC1178];
  v27[1] = v6;
  v28[0] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = *MEMORY[0x1E0DC1138];
  v9 = v25;
  v10 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "owner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryReplyAssistantAttributedSubtitle(v17, v12, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  PXSharedLibraryLearnMoreString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_attributedStringByAddingAttributes:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v22, "appendAttributedString:", v19);
  objc_msgSend(v22, "appendAttributedString:", v21);
  objc_msgSend(v22, "addAttributes:range:", v8, 0, objc_msgSend(v22, "length"));
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v22);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext_282242 == a5)
    -[PXSharedLibraryReplyAssistantViewController legacyDevicesFallbackMonitorChangedState](self, "legacyDevicesFallbackMonitorChangedState", a3);
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (OBBoldTrayButton)setupButton
{
  return self->_setupButton;
}

- (void)setSetupButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupButton, a3);
}

- (BOOL)wantsToStepForward
{
  return self->_wantsToStepForward;
}

- (void)setWantsToStepForward:(BOOL)a3
{
  self->_wantsToStepForward = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

void __59__PXSharedLibraryReplyAssistantViewController__updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "headerView");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setIcon:accessibilityLabel:](v7, "setIcon:accessibilityLabel:", v5, 0);
  }
  else
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Error getting image of owner %@ (%@)", (uint8_t *)&v9, 0x16u);
    }
  }

}

@end
