@implementation ICPasswordEntryViewController

- (ICPasswordEntryViewController)initWithNibName:(id)a3 bundle:(id)a4 note:(id)a5 intent:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  ICPasswordEntryViewController *v14;
  objc_super v16;

  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB34D0];
  v12 = a3;
  objc_msgSend(v11, "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)ICPasswordEntryViewController;
  v14 = -[ICPasswordEntryViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v12, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_note, a5);
    v14->_intent = a6;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICPasswordEntryViewController;
  -[ICPasswordEntryViewController dealloc](&v4, sel_dealloc);
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[ICPasswordEntryViewController applyEntryViewMode](self, "applyEntryViewMode");
  }
}

- (void)applyEntryViewMode
{
  unint64_t mode;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  mode = self->_mode;
  if (mode == 1)
  {
    -[ICPasswordEntryViewController titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[ICPasswordEntryViewController largeUnlockButton](self, "largeUnlockButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v8 = 1;
  }
  else
  {
    if (mode)
      return;
    -[ICPasswordEntryViewController titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    v5 = -[ICPasswordEntryViewController intent](self, "intent") != 0;
    -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    -[ICPasswordEntryViewController largeUnlockButton](self, "largeUnlockButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (void)viewDidLoad
{
  void *v2;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICPasswordEntryViewController;
  -[ICPasswordEntryViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_dynamicWhiteBlackColor");
  }
  else
  {
    -[ICPasswordEntryViewController backgroundView](self, "backgroundView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  if ((v7 & 1) == 0)
  {

    v8 = v2;
  }

  v10 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  }
  else
  {
    -[ICPasswordEntryViewController lockImage](self, "lockImage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tintColor");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController lockImage](self, "lockImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v12);

  if ((v11 & 1) == 0)
  {

    v12 = v2;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_accessibilitySetIsSpeakThisElement:", 1);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitleColor:forState:", 0, 0);

    objc_msgSend(MEMORY[0x1E0DC3520], "ic_filledTintedButtonConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConfiguration:", v18);

  }
  -[ICPasswordEntryViewController largeUnlockButton](self, "largeUnlockButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIsAccessibilityElement:", 0);

  -[ICPasswordEntryViewController applyEntryViewMode](self, "applyEntryViewMode");
}

- (void)beginAuthentication
{
  id v3;

  -[ICPasswordEntryViewController unlockButton](self, "unlockButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController unlockPasswordButtonPressed:](self, "unlockPasswordButtonPressed:", v3);

}

- (void)unlockPasswordButtonPressed:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[ICPasswordEntryViewController intent](self, "intent");
  -[ICPasswordEntryViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAuthenticationPrompt promptForIntent:object:](ICAuthenticationPrompt, "promptForIntent:object:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICAuthentication shared](ICAuthentication, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordEntryViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__ICPasswordEntryViewController_unlockPasswordButtonPressed___block_invoke;
  v11[3] = &unk_1E5C1DD08;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend(v8, "authenticateWithPrompt:displayWindow:completionHandler:", v7, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __61__ICPasswordEntryViewController_unlockPasswordButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void (**v28)(id, _QWORD);

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (a2 != 2 || !WeakRetained)
    goto LABEL_12;
  v6 = (void *)MEMORY[0x1E0D63AB8];
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "shouldAuthenticateWithDevicePasswordForObject:", v8) & 1) != 0)
  {
    v9 = objc_loadWeakRetained(v4);
    objc_msgSend(v9, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resolvedLockedNotesMode");

    if (v12 == 1)
    {
      +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained(v4);
      objc_msgSend(v14, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained(v4);
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v13;
      v20 = v15;
      v21 = 1;
LABEL_10:
      objc_msgSend(v19, "presentDivergedModeAlertForNote:mode:window:completionHandler:", v20, v21, v18, 0);

      goto LABEL_11;
    }
  }
  else
  {

  }
  v22 = (void *)MEMORY[0x1E0D63AB8];
  v13 = objc_loadWeakRetained(v4);
  objc_msgSend(v13, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "shouldAuthenticateWithCustomPasswordForObject:", v14))
  {
    v23 = objc_loadWeakRetained(v4);
    objc_msgSend(v23, "note");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "account");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "resolvedLockedNotesMode");

    if (v26 != 2)
      goto LABEL_12;
    +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained(v4);
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    v20 = v15;
    v21 = 2;
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "passwordEntryCompletionHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "passwordEntryCompletionHandler");
    v28 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v28[2](v28, a2);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (BOOL)isAnimatingOut
{
  return self->_isAnimatingOut;
}

- (void)setIsAnimatingOut:(BOOL)a3
{
  self->_isAnimatingOut = a3;
}

- (id)passwordEntryCompletionHandler
{
  return self->_passwordEntryCompletionHandler;
}

- (void)setPasswordEntryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (ICTextBackgroundView)backgroundView
{
  return (ICTextBackgroundView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (UIImageView)lockImage
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_lockImage);
}

- (void)setLockImage:(id)a3
{
  objc_storeWeak((id *)&self->_lockImage, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UIButton)unlockButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_unlockButton);
}

- (void)setUnlockButton:(id)a3
{
  objc_storeWeak((id *)&self->_unlockButton, a3);
}

- (UIButton)largeUnlockButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_largeUnlockButton);
}

- (void)setLargeUnlockButton:(id)a3
{
  objc_storeWeak((id *)&self->_largeUnlockButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_largeUnlockButton);
  objc_destroyWeak((id *)&self->_unlockButton);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_lockImage);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_passwordEntryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
