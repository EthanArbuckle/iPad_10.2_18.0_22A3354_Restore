@implementation PXSharedLibraryAssistantCameraViewController

- (PXSharedLibraryAssistantCameraViewController)init
{
  void *v3;
  void *v4;
  PXSharedLibraryAssistantCameraViewController *v5;
  objc_super v7;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_CameraRules_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_CameraRules_Description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  v5 = -[PXSharedLibraryAssistantCameraViewController initWithTitle:detailText:icon:contentLayout:](&v7, sel_initWithTitle_detailText_icon_contentLayout_, v3, v4, 0, 4);

  return v5;
}

- (void)viewDidLoad
{
  PXSharedLibraryAssistantCameraHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
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
  UITextView *v18;
  UITextView *textView;
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  void *v34;
  PXSharedLibraryAssistantCameraHeaderView *v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  -[OBBaseWelcomeController viewDidLoad](&v36, sel_viewDidLoad);
  v3 = objc_alloc_init(PXSharedLibraryAssistantCameraHeaderView);
  -[PXSharedLibraryAssistantCameraHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSharedLibraryAssistantCameraHeaderView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  -[PXSharedLibraryAssistantCameraViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantCameraViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  v29 = (void *)MEMORY[0x1E0CB3718];
  -[PXSharedLibraryAssistantCameraHeaderView topAnchor](v3, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v31;
  -[PXSharedLibraryAssistantCameraHeaderView leadingAnchor](v3, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v7;
  v35 = v3;
  -[PXSharedLibraryAssistantCameraHeaderView trailingAnchor](v3, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v34 = v4;
  objc_msgSend(v4, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v11;
  -[PXSharedLibraryAssistantCameraHeaderView bottomAnchor](v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantCameraViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  v18 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v18;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 2.0, 0.0, 2.0, 0.0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineFragmentPadding:", 0.0);

  -[PXSharedLibraryAssistantCameraViewController secondaryContentView](self, "secondaryContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "px_addFullBoundsSubview:", self->_textView);

  -[PXSharedLibraryAssistantCameraViewController _updateTextView](self, "_updateTextView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_CameraRules_ButtonTitle_ShareAutomatically"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v23, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_primaryButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantCameraViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", v22);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_primaryButtonTapped_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantCameraViewController addKeyCommand:](self, "addKeyCommand:", v25);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_CameraRules_ButtonTitle_ShareManually"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:forState:", v27, 0);

  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_secondaryButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantCameraViewController buttonTray](self, "buttonTray");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addButton:", v26);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  v4 = a3;
  -[PXSharedLibraryAssistantCameraViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantCameraViewController traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (v6 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "isEqual:", v8);

    if ((v10 & 1) == 0)
      -[PXSharedLibraryAssistantCameraViewController _updateTextView](self, "_updateTextView");
  }
}

- (void)_updateTextView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout())
    v5 = 4;
  else
    v5 = 1;
  objc_msgSend(v4, "setAlignment:", v5);
  v10[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x1E0DC1178];
  v11[0] = v6;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryLearnMoreString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_attributedStringByAddingAttributes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v9);
}

- (void)primaryButtonTapped:(id)a3
{
  -[PXSharedLibraryAssistantCameraViewController _completeWithAutoSharedEnabled:](self, "_completeWithAutoSharedEnabled:", 1);
}

- (void)secondaryButtonTapped:(id)a3
{
  -[PXSharedLibraryAssistantCameraViewController _completeWithAutoSharedEnabled:](self, "_completeWithAutoSharedEnabled:", 0);
}

- (void)_completeWithAutoSharedEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PXPreferencesSetCameraAutoShareEnabled(a3);
  PXPreferencesSetCameraSharingPreferencesState(1);
  -[PXSharedLibraryAssistantCameraViewController completionHandler](self, "completionHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    -[PXSharedLibraryAssistantCameraViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[PXSharedLibraryAssistantCameraViewController _completeWithAutoSharedEnabled:]";
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v6, "stepForwardInAssistantForAssistantViewController:", self);

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

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
