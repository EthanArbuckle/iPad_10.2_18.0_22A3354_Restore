@implementation SFShareAudioErrorViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *error;
  objc_super v10;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)SFShareAudioErrorViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->super._titleLabel, "setText:", v6);

  SFLocalizedStringEx();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_infoLabel, "setText:", v7);

  if (IsAppleInternalBuild())
  {
    error = self->_error;
    NSPrintF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_internalLabel, "setText:", v8, error);

    -[UILabel setHidden:](self->_internalLabel, "setHidden:", 0);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioErrorViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)eventDismiss:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFShareAudioViewController reportError:](self->super._mainController, "reportError:", self->_error);

}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UILabel)internalLabel
{
  return self->_internalLabel;
}

- (void)setInternalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_internalLabel, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_internalLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end
