@implementation WFSecureConfirmationAlert

- (WFSecureConfirmationAlert)init
{
  WFSecureConfirmationAlert *v2;
  WFSecureConfirmationAlert *v3;
  uint64_t v4;
  WFAlertButton *cancelButton;
  uint64_t v6;
  WFAlertButton *continueButton;
  WFSecureConfirmationAlert *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFSecureConfirmationAlert;
  v2 = -[WFSecureConfirmationAlert init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFSecureConfirmationAlert configuredCancelButton](v2, "configuredCancelButton");
    v4 = objc_claimAutoreleasedReturnValue();
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (WFAlertButton *)v4;

    -[WFSecureConfirmationAlert configuredContinueButton](v3, "configuredContinueButton");
    v6 = objc_claimAutoreleasedReturnValue();
    continueButton = v3->_continueButton;
    v3->_continueButton = (WFAlertButton *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)setCancellationHandler:(id)a3
{
  void *v4;
  id cancellationHandler;
  WFAlertButton *v6;
  WFAlertButton *cancelButton;

  v4 = (void *)objc_msgSend(a3, "copy");
  cancellationHandler = self->_cancellationHandler;
  self->_cancellationHandler = v4;

  -[WFSecureConfirmationAlert configuredCancelButton](self, "configuredCancelButton");
  v6 = (WFAlertButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v6;

}

- (void)setFailureHandler:(id)a3
{
  void *v4;
  id failureHandler;
  WFAlertButton *v6;
  WFAlertButton *continueButton;

  v4 = (void *)objc_msgSend(a3, "copy");
  failureHandler = self->_failureHandler;
  self->_failureHandler = v4;

  -[WFSecureConfirmationAlert configuredContinueButton](self, "configuredContinueButton");
  v6 = (WFAlertButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v6;

}

- (void)setSuccessHandler:(id)a3
{
  void *v4;
  id successHandler;
  WFAlertButton *v6;
  WFAlertButton *continueButton;

  v4 = (void *)objc_msgSend(a3, "copy");
  successHandler = self->_successHandler;
  self->_successHandler = v4;

  -[WFSecureConfirmationAlert configuredContinueButton](self, "configuredContinueButton");
  v6 = (WFAlertButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v6;

}

- (id)buttons
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[WFSecureConfirmationAlert cancelButton](self, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[WFSecureConfirmationAlert continueButton](self, "continueButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)configuredCancelButton
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WFSecureConfirmationAlert_configuredCancelButton__block_invoke;
  v3[3] = &unk_1E7AF94B0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D13DE8], "cancelButtonWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)configuredContinueButton
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0D13DE8];
  WFLocalizedStringWithKey(CFSTR("AlertContinue"), CFSTR("Continue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke;
  v7[3] = &unk_1E7AF94B0;
  v7[4] = self;
  objc_msgSend(v3, "buttonWithTitle:style:preferred:handler:", v4, 0, 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (WFAlertButton)cancelButton
{
  return self->_cancelButton;
}

- (WFAlertButton)continueButton
{
  return self->_continueButton;
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (id)successHandler
{
  return self->_successHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_successHandler, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

void __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v2 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke_2;
  v4[3] = &unk_1E7AF5958;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "requestUnlockIfNeeded:", v4);

}

void __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "successHandler"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "successHandler");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failureHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    objc_msgSend(*(id *)(a1 + 32), "failureHandler");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v4;
  (*(void (**)(void))(v4 + 16))();

}

void __51__WFSecureConfirmationAlert_configuredCancelButton__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "cancellationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancellationHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

@end
