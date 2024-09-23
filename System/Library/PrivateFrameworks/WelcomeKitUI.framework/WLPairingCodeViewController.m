@implementation WLPairingCodeViewController

- (WLPairingCodeViewController)initWithPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5 welcomeController:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WLPairingCodeViewController *v17;
  WLPairingCodeViewController *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  WLPairingCodeViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;
  _QWORD v62[6];

  v62[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v60 = a5;
  v59 = a6;
  WLLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61.receiver = self;
  v61.super_class = (Class)WLPairingCodeViewController;
  v17 = -[WLPairingCodeViewController initWithTitle:detailText:icon:contentLayout:](&v61, sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, v16, 2);

  if (v17)
  {
    v58 = v11;
    objc_storeStrong((id *)&v17->_wifiPSK, a4);
    objc_storeStrong((id *)&v17->_ssid, a5);
    v18 = v17;
    objc_storeStrong((id *)&v17->_welcomeController, a6);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v10);
    if (objc_msgSend(v10, "length") != 1)
    {
      v20 = 0;
      v21 = *MEMORY[0x24BDF6608];
      v22 = 1;
      do
      {
        v23 = v20 + 1;
        if (3 * (v22 / 3) - 1 == v20)
          v24 = 20.0;
        else
          v24 = 5.0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAttribute:value:range:", v21, v25, v20, 1);

        ++v22;
        ++v20;
      }
      while (v23 < objc_msgSend(v10, "length") - 1);
    }
    v26 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v26, "setAttributedText:", v19);
    objc_msgSend(v26, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v27);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", v28);

    objc_msgSend(MEMORY[0x24BDF6A70], "monospacedSystemFontOfSize:weight:", 32.0, *MEMORY[0x24BDF7880]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v29);

    objc_msgSend(v26, "setTextAlignment:", 1);
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "setAccessibilityIdentifier:", CFSTR("PairingCode"));
    v30 = v18;
    -[WLPairingCodeViewController contentView](v18, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v26);

    v49 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v26, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLPairingCodeViewController contentView](v18, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v54;
    objc_msgSend(v26, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLPairingCodeViewController contentView](v18, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v50;
    objc_msgSend(v26, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLPairingCodeViewController contentView](v18, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v45;
    objc_msgSend(v26, "lastBaselineAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLPairingCodeViewController contentView](v18, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "userInterfaceIdiom");
    v37 = 96.0;
    if (v36 == 1)
      v37 = 106.0;
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v39);

    objc_msgSend(v26, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLPairingCodeViewController contentView](v30, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    v17 = v30;
    v11 = v58;
  }

  return v17;
}

- (void)_appleInternalOptionsTapped:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  _QWORD v6[5];

  if (objc_msgSend(MEMORY[0x24BEC2810], "isInternal", a3))
  {
    -[WLPairingCodeViewController getLocalImportOptionsHandler](self, "getLocalImportOptionsHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[OBLinkTrayButton setEnabled:](self->_appleInternalOptionsButton, "setEnabled:", 0);
      -[WLPairingCodeViewController getLocalImportOptionsHandler](self, "getLocalImportOptionsHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke;
      v6[3] = &unk_24E1490C0;
      v6[4] = self;
      ((void (**)(_QWORD, _QWORD *))v5)[2](v5, v6);

    }
  }
}

void __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v3[5];
  char v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_2;
  v3[3] = &unk_24E149098;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = a3;
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v2 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSID: %@\nPSK: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", CFSTR("WiFi Info"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v5);

  v6 = (void *)MEMORY[0x24BDF67E8];
  if (*(_BYTE *)(a1 + 40))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_3;
    v14[3] = &unk_24E149070;
    v14[4] = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("Don't Build Local Content");
    v8 = v14;
LABEL_5:
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v11);

    goto LABEL_6;
  }
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_4;
  v13[3] = &unk_24E149070;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Build Local Content"), 0, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v10);

  if (*(_BYTE *)(a1 + 41))
  {
    v6 = (void *)MEMORY[0x24BDF67E8];
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_5;
    v12[3] = &unk_24E149070;
    v12[4] = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("Import Local Content");
    v8 = v12;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setEnabled:", 1);

}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStashDataLocally:", 0);
}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStashDataLocally:", 1);
}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_importLocalContent");
}

- (void)_setStashDataLocally:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[WLPairingCodeViewController stashDataLocallyHandler](self, "stashDataLocallyHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WLPairingCodeViewController stashDataLocallyHandler](self, "stashDataLocallyHandler");
    v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (void)_importLocalContent
{
  void *v3;
  void (**v4)(void);

  -[WLPairingCodeViewController importLocalContentHandler](self, "importLocalContentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WLPairingCodeViewController importLocalContentHandler](self, "importLocalContentHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLPairingCodeViewController;
  -[WLOnboardingViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
}

- (void)cancel
{
  void (**cancellationBlock)(id, _QWORD *);
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (self->_cancellationBlock)
  {
    objc_initWeak(&location, self);
    cancellationBlock = (void (**)(id, _QWORD *))self->_cancellationBlock;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__WLPairingCodeViewController_cancel__block_invoke;
    v6[3] = &unk_24E1490E8;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WLPairingCodeViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

void __37__WLPairingCodeViewController_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showActivityIndicatorView");

}

- (void)showActivityIndicatorView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v5, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v5);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  WLPairingCodeViewController *v8;
  void (**viewWillDismissBlock)(void);
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLPairingCodeViewController;
  -[WLPairingCodeViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  -[WLPairingCodeViewController viewWillDisappearBlock](self, "viewWillDisappearBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WLPairingCodeViewController viewWillDisappearBlock](self, "viewWillDisappearBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[WLPairingCodeViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v8 = (WLPairingCodeViewController *)objc_claimAutoreleasedReturnValue();

  if (v8 == self
    && ((-[WLPairingCodeViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0
     || -[WLPairingCodeViewController isBeingDismissed](self, "isBeingDismissed")))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock)
      viewWillDismissBlock[2]();
  }

}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (id)viewWillDisappearBlock
{
  return self->_viewWillDisappearBlock;
}

- (void)setViewWillDisappearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (id)getLocalImportOptionsHandler
{
  return self->_getLocalImportOptionsHandler;
}

- (void)setGetLocalImportOptionsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (id)stashDataLocallyHandler
{
  return self->_stashDataLocallyHandler;
}

- (void)setStashDataLocallyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (id)importLocalContentHandler
{
  return self->_importLocalContentHandler;
}

- (void)setImportLocalContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (id)viewWillDismissBlock
{
  return self->_viewWillDismissBlock;
}

- (void)setViewWillDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDismissBlock, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong(&self->_importLocalContentHandler, 0);
  objc_storeStrong(&self->_stashDataLocallyHandler, 0);
  objc_storeStrong(&self->_getLocalImportOptionsHandler, 0);
  objc_storeStrong(&self->_viewWillDisappearBlock, 0);
  objc_storeStrong((id *)&self->_appleInternalOptionsButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
}

@end
