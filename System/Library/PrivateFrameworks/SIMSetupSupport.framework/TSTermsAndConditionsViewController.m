@implementation TSTermsAndConditionsViewController

- (TSTermsAndConditionsViewController)initWithSourceIccid:(id)a3 mainText:(id)a4
{
  id v7;
  id v8;
  TSTermsAndConditionsViewController *v9;
  TSTermsAndConditionsViewController *v10;
  id v11;
  uint64_t v12;
  CoreTelephonyClient *client;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSTermsAndConditionsViewController;
  v9 = -[TSTermsAndConditionsViewController init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainText, a4);
    objc_storeStrong((id *)&v10->_sourceIccid, a3);
    v11 = objc_alloc(MEMORY[0x24BDC2810]);
    v12 = objc_msgSend(v11, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v10->_client;
    v10->_client = (CoreTelephonyClient *)v12;

  }
  return v10;
}

- (void)loadView
{
  UITextView *v3;
  UITextView *textView;

  v3 = (UITextView *)objc_alloc_init(MEMORY[0x24BEBDA88]);
  textView = self->_textView;
  self->_textView = v3;

  -[TSTermsAndConditionsViewController setView:](self, "setView:", self->_textView);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UITextView *textView;
  void *v19;
  UITextView *v20;
  void *v21;
  objc_super v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)TSTermsAndConditionsViewController;
  -[SSUIViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[TSTermsAndConditionsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_24DEF4290, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__cancelTransfer_);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v8 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 2, self, sel__acceptClicked_);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTermsAndConditionsViewController setTitle:](self, "setTitle:", v13);

  v25[0] = v6;
  v25[1] = v7;
  v25[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTermsAndConditionsViewController setToolbarItems:](self, "setToolbarItems:", v14);

  -[TSTermsAndConditionsViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToolbarHidden:animated:", 0, 0);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  v23 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  textView = self->_textView;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", self->_mainText, v17);
  -[UITextView setAttributedText:](textView, "setAttributedText:", v19);

  v20 = self->_textView;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v20, "setFont:", v21);

}

- (void)_acceptClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startTimer:", 1);

  -[CoreTelephonyClient handleTermsAndConditionsCompleted:consented:completion:](self->_client, "handleTermsAndConditionsCompleted:consented:completion:", self->_sourceIccid, 1, &__block_literal_global);
  -[TSTermsAndConditionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

void __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke_cold_1();

  }
}

- (void)_cancelTransfer:(id)a3
{
  id WeakRetained;
  id v5;

  -[TSTermsAndConditionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CoreTelephonyClient handleTermsAndConditionsCompleted:consented:completion:](self->_client, "handleTermsAndConditionsCompleted:consented:completion:", self->_sourceIccid, 0, &__block_literal_global_36);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("user.disagreed.terms.and.conditions"), 0, 0);

}

void __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke_cold_1();

  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 976, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 984, 1);
}

- (void)setSourceIccid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 992, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSString)mainText
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setMainText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTextView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (UIButton)acceptButton
{
  return (UIButton *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setAcceptButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (UIButton)declineButton
{
  return (UIButton *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setDeclineButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (SSSpinner)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_mainText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TSTermsAndConditionsViewController__acceptClicked___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]handleTermsAndConditionsCompleted failed : %@ @%s", v2, v3, v4, v5, v6);
}

void __54__TSTermsAndConditionsViewController__cancelTransfer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]handleTermsAndConditionsCompleted failed : %@ @%s", v2, v3, v4, v5, v6);
}

@end
