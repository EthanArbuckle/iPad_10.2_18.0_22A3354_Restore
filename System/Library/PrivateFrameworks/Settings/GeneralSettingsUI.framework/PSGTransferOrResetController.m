@implementation PSGTransferOrResetController

- (void)viewDidLoad
{
  void *v3;
  PSGTransferListController *v4;
  PSGTransferListController *transferListController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PSGResetOrEraseListController *v13;
  PSGResetOrEraseListController *resetOrEraseListController;
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
  void (**v33)(_QWORD);
  id v34;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  _QWORD aBlock[5];
  objc_super v71;
  _QWORD v72[9];

  v72[7] = *MEMORY[0x24BDAC8D0];
  v71.receiver = self;
  v71.super_class = (Class)PSGTransferOrResetController;
  -[PSGTransferOrResetController viewDidLoad](&v71, sel_viewDidLoad);
  PSG_LocalizedStringForGeneral(CFSTR("TRANSFER_OR_RESET_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController setTitle:](self, "setTitle:", v3);

  v4 = objc_alloc_init(PSGTransferListController);
  transferListController = self->__transferListController;
  self->__transferListController = v4;

  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController addChildViewController:](self, "addChildViewController:", v8);

  -[PSGTransferOrResetController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v11);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PSGTransferOrResetController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_24F9C7C88;
  aBlock[4] = self;
  v34 = _Block_copy(aBlock);
  v13 = objc_alloc_init(PSGResetOrEraseListController);
  resetOrEraseListController = self->__resetOrEraseListController;
  self->__resetOrEraseListController = v13;

  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController addChildViewController:](self, "addChildViewController:", v17);

  -[PSGTransferOrResetController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v20);

  v69[0] = v12;
  v69[1] = 3221225472;
  v69[2] = __43__PSGTransferOrResetController_viewDidLoad__block_invoke_2;
  v69[3] = &unk_24F9C7C88;
  v69[4] = self;
  v33 = (void (**)(_QWORD))_Block_copy(v69);
  v32 = (void *)MEMORY[0x24BDD1628];
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v63;
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v57;
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v51;
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v44;
  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v38;
  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v23;
  -[PSGTransferOrResetController _resetOrEraseListController](self, "_resetOrEraseListController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v30);

  if (v33)
    v33[2](v33);

  v31 = v34;
  if (v34)
  {
    (*((void (**)(void))v34 + 2))();
    v31 = v34;
  }

}

void __43__PSGTransferOrResetController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_transferListController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

}

void __43__PSGTransferOrResetController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetOrEraseListController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)PSGTransferOrResetController;
  -[PSGTransferOrResetController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/Reset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("TRANSFER_OR_RESET_TITLE"), CFSTR("General"), v6, v8);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "sf_isiPad"))
    v11 = CFSTR("com.apple.graphic-icon.transfer-or-reset-ipad");
  else
    v11 = CFSTR("com.apple.graphic-icon.transfer-or-reset-iphone");
  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGTransferOrResetController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v11, v9, v13, v4);

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PSGTransferOrResetController _transferListController](self, "_transferListController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleURL:withCompletion:", v7, v6);

}

- (PSGTransferListController)_transferListController
{
  return self->__transferListController;
}

- (void)set_transferListController:(id)a3
{
  objc_storeStrong((id *)&self->__transferListController, a3);
}

- (PSGResetOrEraseListController)_resetOrEraseListController
{
  return self->__resetOrEraseListController;
}

- (void)set_resetOrEraseListController:(id)a3
{
  objc_storeStrong((id *)&self->__resetOrEraseListController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resetOrEraseListController, 0);
  objc_storeStrong((id *)&self->__transferListController, 0);
}

@end
