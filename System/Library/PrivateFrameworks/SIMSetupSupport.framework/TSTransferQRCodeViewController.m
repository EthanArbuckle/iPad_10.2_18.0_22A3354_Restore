@implementation TSTransferQRCodeViewController

- (TSTransferQRCodeViewController)initWithTransferCredentials:(id)a3 carrierName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TSTransferQRCodeViewController *v14;
  uint64_t v15;
  UIBarButtonItem *cancelButton;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TRANSFER_ESIM_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("qrcode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TRANSFER_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)TSTransferQRCodeViewController;
  v14 = -[TSTransferQRCodeViewController initWithTitle:detailText:icon:](&v18, sel_initWithTitle_detailText_icon_, v13, v10, v11);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transferCredentials, a3);
    objc_storeStrong((id *)&v14->_carrierName, a4);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v14, sel__userDidTapCancel);
    cancelButton = v14->_cancelButton;
    v14->_cancelButton = (UIBarButtonItem *)v15;

  }
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *transferCredentials;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v35;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)TSTransferQRCodeViewController;
  -[TSOBWelcomeController viewDidLoad](&v37, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferQRCodeViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", self->_cancelButton);

  -[NSString qrCode](self->_transferCredentials, "qrCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    transferCredentials = self->_transferCredentials;
    *(_DWORD *)buf = 138412546;
    v39 = transferCredentials;
    v40 = 2080;
    v41 = "-[TSTransferQRCodeViewController viewDidLoad]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "generate CIImage with transferCredentials: %@ @%s", buf, 0x16u);
  }

  v10 = objc_alloc(MEMORY[0x24BEBD668]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCIImage:", v7);
  v12 = (void *)objc_msgSend(v10, "initWithImage:", v11);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TSTransferQRCodeViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

  v14 = (void *)objc_opt_new();
  if (-[NSString length](self->_carrierName, "length"))
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@_CELLULAR_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, self->_carrierName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v17);
  }

  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v14, "setLineBreakMode:", 0);
  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v19);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v20);

  objc_msgSend(v14, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  -[TSTransferQRCodeViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v14);

  objc_msgSend(v14, "setIsAccessibilityElement:", 1);
  objc_msgSend(v14, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v22);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferQRCodeViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  objc_msgSend(v12, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferQRCodeViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  objc_msgSend(v14, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 15.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v14, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

}

- (void)_userDidTapCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_transferCredentials, 0);
}

@end
