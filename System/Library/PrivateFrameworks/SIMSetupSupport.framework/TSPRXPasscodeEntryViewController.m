@implementation TSPRXPasscodeEntryViewController

- (TSPRXPasscodeEntryViewController)initWithBtDevice:(id)a3 passcodeType:(int)a4
{
  id v7;
  TSPRXPasscodeEntryViewController *v8;
  TSPRXPasscodeEntryViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  TSPRXPasscodeEntryViewController *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TSPRXPasscodeEntryViewController;
  v8 = -[TSPRXPasscodeEntryViewController init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_btDevice, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PRXCARD_AUTHENTICATION_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXPasscodeEntryViewController setTitle:](v9, "setTitle:", v11);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PRXCARD_AUTHENTICATION_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXPasscodeEntryViewController setSubtitle:](v9, "setSubtitle:", v13);

    -[TSPRXPasscodeEntryViewController setDismissalType:](v9, "setDismissalType:", 3);
    -[PRXPasscodeEntryViewController setNumberOfDigits:](v9, "setNumberOfDigits:", 6);
    v14 = a4 + 1;
    if ((a4 + 1) <= 0xA)
    {
      if (((1 << v14) & 0x7C1) != 0)
      {
        _TSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[TSPRXPasscodeEntryViewController initWithBtDevice:passcodeType:].cold.1(a4, v15);

        goto LABEL_12;
      }
      if (((1 << v14) & 0x24) != 0)
      {
        v16 = v9;
        v17 = 4;
LABEL_11:
        -[PRXPasscodeEntryViewController setNumberOfDigits:](v16, "setNumberOfDigits:", v17);
        goto LABEL_12;
      }
      if (a4 == 3)
      {
        v16 = v9;
        v17 = 8;
        goto LABEL_11;
      }
    }
LABEL_12:
    objc_initWeak(&location, v9);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __66__TSPRXPasscodeEntryViewController_initWithBtDevice_passcodeType___block_invoke;
    v19[3] = &unk_24DEF3330;
    objc_copyWeak(&v20, &location);
    -[PRXPasscodeEntryViewController setTextEntryCompletionHandler:](v9, "setTextEntryCompletionHandler:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__TSPRXPasscodeEntryViewController_initWithBtDevice_passcodeType___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePINCodeUpdate:", v3);

}

- (void)retry
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TSPRXPasscodeEntryViewController_retry__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __41__TSPRXPasscodeEntryViewController_retry__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "passcodeEntryView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setText:", &stru_24DEF4290);

}

- (void)_handlePINCodeUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2080;
    v9 = "-[TSPRXPasscodeEntryViewController _handlePINCodeUpdate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "auth code = %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  -[SSProximityDevice verifyPIN:](self->_btDevice, "verifyPIN:", v4);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSProximityDevice)btDevice
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setBtDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithBtDevice:(int)a1 passcodeType:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a1;
  v3 = 2080;
  v4 = "-[TSPRXPasscodeEntryViewController initWithBtDevice:passcodeType:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]unsupported passcode type : %d @%s", (uint8_t *)v2, 0x12u);
}

@end
