@implementation SBPasscodeComplianceAlertItem

- (SBPasscodeComplianceAlertItem)initWithTitle:(id)a3 message:(id)a4 continueButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBPasscodeComplianceAlertItem *v15;
  SBPasscodeComplianceAlertItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBPasscodeComplianceAlertItem;
  v15 = -[SBAlertItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_message, a4);
    objc_storeStrong((id *)&v16->_continueButtonTitle, a5);
    objc_storeStrong((id *)&v16->_cancelButtonTitle, a6);
  }

  return v16;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  NSString *cancelButtonTitle;
  uint64_t v7;
  void *v8;
  NSString *continueButtonTitle;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", self->_title);
  objc_msgSend(v5, "setMessage:", self->_message);
  cancelButtonTitle = self->_cancelButtonTitle;
  v7 = MEMORY[0x1E0C809B0];
  if (cancelButtonTitle)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke;
    v12[3] = &unk_1E8E9DCB0;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", cancelButtonTitle, 1, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

  }
  continueButtonTitle = self->_continueButtonTitle;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v11[3] = &unk_1E8E9DCB0;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", continueButtonTitle, 0, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

}

uint64_t __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v2;

  +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_userWantsToComplyNow:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  void *v2;

  +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_userWantsToComplyNow:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_continueButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
