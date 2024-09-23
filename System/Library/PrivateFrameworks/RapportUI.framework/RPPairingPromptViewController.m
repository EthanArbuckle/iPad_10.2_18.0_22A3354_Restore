@implementation RPPairingPromptViewController

+ (id)instantiateViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.RapportUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6E00], "storyboardWithName:bundle:", CFSTR("RPPairingPrompt_iOS"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantiateViewControllerWithIdentifier:", CFSTR("PINEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "view");

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPPairingPromptViewController;
  -[RPPairingPromptViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[RPPairingPromptViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setHidden:](self->_cancelButton, "setHidden:", v4 != 0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__RPPairingPromptViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_24FD32E80;
  v5[4] = self;
  -[RPPINEntryView setTextChangedHandler:](self->_pinEntryView, "setTextChangedHandler:", v5);
  -[RPPINEntryView becomeFirstResponder](self->_pinEntryView, "becomeFirstResponder");
}

void __48__RPPairingPromptViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "length");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 == v5)
    objc_msgSend(*(id *)(a1 + 32), "handlePINEntered:", v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  id tryPasswordHandler;
  void (**v8)(_QWORD);
  id dismissHandler;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RPPairingPromptViewController;
  -[RPPairingPromptViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v5 = retryTimer;
    dispatch_source_cancel(v5);
    v6 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  -[RPPINEntryView setTextChangedHandler:](self->_pinEntryView, "setTextChangedHandler:", 0);
  tryPasswordHandler = self->_tryPasswordHandler;
  self->_tryPasswordHandler = 0;

  v8 = (void (**)(_QWORD))MEMORY[0x2348A6E58](self->_dismissHandler);
  dismissHandler = self->_dismissHandler;
  self->_dismissHandler = 0;

  if (v8)
    v8[2](v8);

}

- (void)handleCancelButton:(id)a3
{
  -[RPPairingPromptViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)handlePINEntered:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RPPINEntryView setDisabled:](self->_pinEntryView, "setDisabled:", 1);
  -[UIActivityIndicatorView startAnimating](self->_progressSpinner, "startAnimating");
  -[UIActivityIndicatorView setHidden:](self->_progressSpinner, "setHidden:", 0);
  RPUILocalizedString(CFSTR("AUTHENTICATING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_progressLabel, "setText:", v4);

  -[UILabel setHidden:](self->_progressLabel, "setHidden:", 0);
  v5 = MEMORY[0x2348A6E58](self->_tryPasswordHandler);
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

- (void)updateWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_source *retryTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  _QWORD handler[5];

  if ((a3 & 0x10000) != 0)
  {
    RPUILocalizedString(CFSTR("PAIR_RETRY_PIN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_subTitleLabel, "setText:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subTitleLabel, "setTextColor:", v7);

    -[RPPINEntryView setText:](self->_pinEntryView, "setText:", &stru_24FD32EC0);
  }
  if ((a3 & 0x20000) != 0)
  {
    -[RPPINEntryView setDisabled:](self->_pinEntryView, "setDisabled:", 1, *(_QWORD *)&a4);
    -[UIActivityIndicatorView startAnimating](self->_progressSpinner, "startAnimating");
    -[UIActivityIndicatorView setHidden:](self->_progressSpinner, "setHidden:", 0);
    v8 = mach_absolute_time();
    self->_retryDeadlineTicks = SecondsToUpTicks() + v8;
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v10 = retryTimer;
      dispatch_source_cancel(v10);
      v11 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v13 = self->_retryTimer;
    self->_retryTimer = v12;

    v14 = self->_retryTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __65__RPPairingPromptViewController_updateWithFlags_throttleSeconds___block_invoke;
    handler[3] = &unk_24FD32E38;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
  else
  {
    self->_retryDeadlineTicks = 0;
  }
  -[RPPairingPromptViewController _retryTimer](self, "_retryTimer");
}

uint64_t __65__RPPairingPromptViewController_updateWithFlags_throttleSeconds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryTimer");
}

- (void)_retryTimer
{
  uint64_t v3;
  unint64_t retryDeadlineTicks;
  OS_dispatch_source *retryTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  UILabel **p_progressLabel;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = mach_absolute_time();
  retryDeadlineTicks = self->_retryDeadlineTicks;
  if (retryDeadlineTicks > v3)
  {
    UpTicksToSecondsF();
    LODWORD(v10) = vcvtpd_s64_f64(v9);
    RPUILocalizedStringF(CFSTR("PAIR_RETRY_PROGRESS_FORMAT"), v11, v12, v13, v14, v15, v16, v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    p_progressLabel = &self->_progressLabel;
    -[UILabel setText:](*p_progressLabel, "setText:", v18);

  }
  else
  {
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v6 = retryTimer;
      dispatch_source_cancel(v6);
      v7 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    -[RPPINEntryView setDisabled:](self->_pinEntryView, "setDisabled:", 0);
    -[RPPINEntryView setText:](self->_pinEntryView, "setText:", &stru_24FD32EC0);
    -[UIActivityIndicatorView stopAnimating](self->_progressSpinner, "stopAnimating");
    -[UIActivityIndicatorView setHidden:](self->_progressSpinner, "setHidden:", 1);
    p_progressLabel = &self->_progressLabel;
  }
  -[UILabel setHidden:](*p_progressLabel, "setHidden:", retryDeadlineTicks <= v3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (id)tryPasswordHandler
{
  return self->_tryPasswordHandler;
}

- (void)setTryPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (RPPINEntryView)pinEntryView
{
  return self->_pinEntryView;
}

- (void)setPinEntryView:(id)a3
{
  objc_storeStrong((id *)&self->_pinEntryView, a3);
}

- (UIActivityIndicatorView)progressSpinner
{
  return self->_progressSpinner;
}

- (void)setProgressSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_progressSpinner, a3);
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_pinEntryView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong(&self->_tryPasswordHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

@end
