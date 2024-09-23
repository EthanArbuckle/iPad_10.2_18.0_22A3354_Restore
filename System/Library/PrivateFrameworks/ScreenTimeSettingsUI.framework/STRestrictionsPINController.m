@implementation STRestrictionsPINController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[8];
  _QWORD v21[5];
  id v22;
  id v23;

  v3 = a3;
  -[STRestrictionsPINController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PreventDismissalWhenDone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicePINController setShouldDismissWhenDone:](self, "setShouldDismissWhenDone:", objc_msgSend(v6, "BOOLValue") ^ 1);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PINOptionsTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PINOptionsHandler"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerForKey:", CFSTR("PasscodeRecoveryAttempts"));

    if (-[DevicePINController isBlocked](self, "isBlocked") && v11 >= 1)
    {
      -[DevicePINController unblockTime](self, "unblockTime");
      v13 = v12;
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v15 = v13 - v14;
      v16 = (void *)MEMORY[0x24BDBCF40];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __46__STRestrictionsPINController_viewWillAppear___block_invoke;
      v21[3] = &unk_24DB87870;
      v21[4] = self;
      v22 = v7;
      v23 = v9;
      objc_msgSend(v16, "timerWithTimeInterval:repeats:block:", 0, v21, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTimer:forMode:", v17, *MEMORY[0x24BDBCA90]);

    }
    else
    {
      -[STRestrictionsPINController _setOptionsTitle:optionsHandler:](self, "_setOptionsTitle:optionsHandler:", v7, v9);
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STRestrictionsPINController.viewWillAppear", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)STRestrictionsPINController;
  -[DevicePINController viewWillAppear:](&v19, sel_viewWillAppear_, v3);

}

void __46__STRestrictionsPINController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setOptionsTitle:optionsHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pane");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPane:", v2);
  objc_msgSend(v2, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", objc_msgSend(*(id *)(a1 + 32), "simplePIN"), objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"), objc_msgSend(*(id *)(a1 + 32), "isNumericPIN"), 0, 1);

}

- (void)_setOptionsTitle:(id)a3 optionsHandler:(id)a4
{
  id v6;
  STRestrictionsPINController *v7;
  STRestrictionsPINController *v8;
  id v9;
  _QWORD v10[4];
  STRestrictionsPINController *v11;
  id v12;

  v6 = a4;
  -[DevicePINController setPasscodeOptionsTitle:](self, "setPasscodeOptionsTitle:", a3);
  v7 = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__STRestrictionsPINController__setOptionsTitle_optionsHandler___block_invoke;
  v10[3] = &unk_24DB87898;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  -[DevicePINController setPasscodeOptionsHandler:](v8, "setPasscodeOptionsHandler:", v10);

}

uint64_t __63__STRestrictionsPINController__setOptionsTitle_optionsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (id)pinInstructionsPrompt
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = *(int *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75668]);
  if (v3 <= 3
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_24DB878E0[v3], *(unsigned int *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75670])), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STRestrictionsPINController;
    -[PSRestrictionsPINController pinInstructionsPrompt](&v9, sel_pinInstructionsPrompt);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)validatePIN:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[DevicePINController pinDelegate](self, "pinDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validatePIN:forPINController:", v4, self);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInteger:forKey:", 0, CFSTR("PasscodeRecoveryAttempts"));

  }
  return v6;
}

- (void)setPIN:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DevicePINController pinDelegate](self, "pinDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DevicePINController pinDelegate](self, "pinDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPIN:forPINController:", v7, self);

  }
}

- (void)recoveryAuthenticationSucceededForPasscode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[DevicePINController isBlocked](self, "isBlocked"))
  {
    -[DevicePINController attemptValidationWithPIN:](self, "attemptValidationWithPIN:", v5);
    -[PSDetailController pane](self, "pane");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showError:error:isBlocked:animate:", 0, 0, 0, 0);

  }
  -[DevicePINController pinEntered:](self, "pinEntered:", v5);

}

- (void)recoveryAuthenticationFailed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("PasscodeRecoveryAttempts"));
  if (-[DevicePINController isBlocked](self, "isBlocked"))
    objc_msgSend(v5, "setInteger:forKey:", ++v6, CFSTR("PasscodeRecoveryAttempts"));
  else
    -[DevicePINController pinEntered:](self, "pinEntered:", 0);
  if (v6 >= 1)
  {
    objc_msgSend(v4, "setHidden:", 1);
    -[DevicePINController unblockTime](self, "unblockTime");
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v10 = v8 - v9;
    v11 = (void *)MEMORY[0x24BDBCF40];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__STRestrictionsPINController_recoveryAuthenticationFailed___block_invoke;
    v14[3] = &unk_24DB878C0;
    v15 = v4;
    objc_msgSend(v11, "timerWithTimeInterval:repeats:block:", 0, v14, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTimer:forMode:", v12, *MEMORY[0x24BDBCA90]);

  }
}

uint64_t __60__STRestrictionsPINController_recoveryAuthenticationFailed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

@end
