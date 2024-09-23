@implementation VTUIVoiceTriggerConfirmationViewController

- (VTUIVoiceTriggerConfirmationViewController)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VTUIVoiceTriggerConfirmationViewController *v17;
  VTUIVoiceTriggerConfirmationViewController *v18;
  objc_super v20;

  v4 = a3;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSetupForMultipleTriggerPhrases");
  if (v6)
    v7 = CFSTR("TEXT_TITLE_JUST_SAY_BOTH");
  else
    v7 = CFSTR("TEXT_TITLE_JUST_SAY_HEYSIRI");
  v8 = CFSTR("TEXT_MAIN_READY_MIXED");
  if (!v6)
    v8 = CFSTR("TEXT_MAIN_READY");
  v9 = v8;
  v10 = v7;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiLocalizedStringForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "VTUIDeviceSpecificString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)VTUIVoiceTriggerConfirmationViewController;
  v17 = -[VTUIVoiceTriggerConfirmationViewController initWithTitle:detailText:icon:](&v20, sel_initWithTitle_detailText_icon_, v12, v13, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v4);
    -[VTUIVoiceTriggerConfirmationViewController _setupContent](v18, "_setupContent");
  }

  return v18;
}

- (void)_setupContent
{
  int v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  VTUIButton *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  VTUIButton *continueButton;
  VTUIButton *v12;
  VTUIButton *v13;
  void *v14;
  id v15;
  void *v16;
  VTUIButton *laterButton;
  void *v18;
  id v19;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v19, "shouldSetupForMultipleTriggerPhrases");
  v4 = CFSTR("BUTTON_LISTEN_FOR_HEYSIRI");
  if (v3)
    v4 = CFSTR("BUTTON_LISTEN_FOR_BOTH");
  v5 = (void *)MEMORY[0x24BE6E3E8];
  v6 = v4;
  objc_msgSend(v5, "boldButton");
  v7 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "VTUIDeviceSpecificString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[VTUIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", WeakRetained, sel_siriVTConfirmationViewContinuePressed_, 64);

  -[VTUIVoiceTriggerConfirmationViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v7);

  continueButton = self->_continueButton;
  self->_continueButton = v7;
  v12 = v7;

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v13 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_NOT_NOW"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  -[VTUIButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", v15, sel_siriVTConfirmationViewLaterPressed_, 64);

  -[VTUIVoiceTriggerConfirmationViewController buttonTray](self, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", v13);

  laterButton = self->_laterButton;
  self->_laterButton = v13;

  -[VTUIVoiceTriggerConfirmationViewController buttonTray](self, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPrivacyLinkForBundles:", &unk_24F34DCE8);

}

- (VTUIButton)laterButton
{
  return self->_laterButton;
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
