@implementation WLTransferCancellationViewController

- (WLTransferCancellationViewController)initWithWelcomeController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WLTransferCancellationViewController *v15;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  WLLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CANCELLATION_DETAIL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40.receiver = self;
  v40.super_class = (Class)WLTransferCancellationViewController;
  v15 = -[WLTransferCancellationViewController initWithTitle:detailText:icon:contentLayout:](&v40, sel_initWithTitle_detailText_icon_contentLayout_, v9, v11, v14, 2);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_welcomeController, a3);
    v39 = v8;
    if (objc_msgSend(v8, "isEnabled"))
    {
      objc_storeStrong((id *)&v15->_context, a4);
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:forState:", v17, 0);

      objc_msgSend(v16, "addTarget:action:forControlEvents:", v15, sel__detailTapped_, 64);
      -[WLTransferCancellationViewController contentView](v15, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v16);

      v33 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v16, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLTransferCancellationViewController contentView](v15, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v34;
      objc_msgSend(v16, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLTransferCancellationViewController contentView](v15, "contentView");
      v38 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v21;
      objc_msgSend(v16, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLTransferCancellationViewController contentView](v15, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "activateConstraints:", v26);

      v7 = v38;
    }
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitle:forState:", v28, 0);

    objc_msgSend(v27, "addTarget:action:forControlEvents:", v15, sel__reset, 64);
    -[WLTransferCancellationViewController buttonTray](v15, "buttonTray");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addButton:", v27);

    -[OBBaseWelcomeController navigationItem](v15, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHidesBackButton:animated:", 1, 0);

    v8 = v39;
  }

  return v15;
}

- (void)_reset
{
  void (**resetBlock)(void);

  resetBlock = (void (**)(void))self->_resetBlock;
  if (resetBlock)
    resetBlock[2]();
}

- (void)_detailTapped:(id)a3
{
  void *v4;
  WLDetailViewController *v5;

  v5 = -[WLDetailViewController initWithContext:]([WLDetailViewController alloc], "initWithContext:", self->_context);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[WLTransferCancellationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)resetBlock
{
  return self->_resetBlock;
}

- (void)setResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
