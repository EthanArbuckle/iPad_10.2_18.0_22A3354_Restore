@implementation TSPRXSIMTransferCompleteViewController

- (TSPRXSIMTransferCompleteViewController)init
{
  TSPRXSIMTransferCompleteViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TSPRXSIMTransferCompleteViewController *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;
  _QWORD v49[7];

  v49[5] = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)TSPRXSIMTransferCompleteViewController;
  v2 = -[TSPRXSIMTransferCompleteViewController init](&v48, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRXCARD_SOURCE_COMPLETE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXSIMTransferCompleteViewController setTitle:](v2, "setTitle:", v4);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PRXCARD_SOURCE_COMPLETE_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXSIMTransferCompleteViewController setSubtitle:](v2, "setSubtitle:", v6);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark.circle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v44);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TSPRXSIMTransferCompleteViewController contentView](v2, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    objc_initWeak(&location, v2);
    v10 = (void *)MEMORY[0x24BE7B3C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __46__TSPRXSIMTransferCompleteViewController_init__block_invoke;
    v45[3] = &unk_24DEF2C30;
    objc_copyWeak(&v46, &location);
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (id)-[TSPRXSIMTransferCompleteViewController addAction:](v2, "addAction:", v43);
    -[TSPRXSIMTransferCompleteViewController contentView](v2, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    if (v16 >= v18)
      v16 = v18;
    v30 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v7, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXSIMTransferCompleteViewController contentView](v2, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "mainContentGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v38;
    objc_msgSend(v7, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXSIMTransferCompleteViewController contentView](v2, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "mainContentGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v33;
    objc_msgSend(v7, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSPRXSIMTransferCompleteViewController contentView](v2, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mainContentGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v21;
    objc_msgSend(v7, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16 * 0.275;
    objc_msgSend(v22, "constraintEqualToConstant:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v24;
    objc_msgSend(v7, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v27);

    v28 = v2;
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __46__TSPRXSIMTransferCompleteViewController_init__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "viewControllerDidComplete:", v3);

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
}

@end
