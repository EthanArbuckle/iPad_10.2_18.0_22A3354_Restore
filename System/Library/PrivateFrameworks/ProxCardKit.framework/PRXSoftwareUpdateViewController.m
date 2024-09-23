@implementation PRXSoftwareUpdateViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PRXSoftwareUpdateViewController;
  -[PRXCardContentViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_24CC320A8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContentViewController setTitle:](self, "setTitle:", v4);

  v5 = PRXIsPad();
  v6 = CFSTR("SOFTWARE_UPDATE_SUBTITLE_IOS");
  if (v5)
    v6 = CFSTR("SOFTWARE_UPDATE_SUBTITLE_IPADOS");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_24CC320A8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContentViewController setSubtitle:](self, "setSubtitle:", v9);

  -[PRXCardContentViewController setDismissalType:](self, "setDismissalType:", 3);
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHECK_FOR_UPDATE"), &stru_24CC320A8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke;
  v17 = &unk_24CC31F30;
  objc_copyWeak(&v18, &location);
  +[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v11, 0, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PRXCardContentViewController addAction:](self, "addAction:", v12, v14, v15, v16, v17);
  -[PRXSoftwareUpdateViewController installSettingsIcon](self, "installSettingsIcon");

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_0);

}

void __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2()
{
  void *v0;
  id *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = (uint64_t)&v14;
  v16 = 0x2020000000;
  v1 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  v17 = (void *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    v2 = (void *)FrontBoardServicesLibrary();
    v1 = (id *)dlsym(v2, "FBSOpenApplicationOptionKeyUnlockDevice");
    *(_QWORD *)(v15 + 24) = v1;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = (uint64_t)v1;
  }
  _Block_object_dispose(&v14, 8);
  if (!v1)
    goto LABEL_10;
  v3 = *v1;
  v23 = v3;
  v4 = MEMORY[0x24BDBD1C8];
  v25[0] = MEMORY[0x24BDBD1C8];
  v14 = 0;
  v15 = (uint64_t)&v14;
  v16 = 0x2020000000;
  v5 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  v17 = (void *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    v6 = (void *)FrontBoardServicesLibrary();
    v5 = (id *)dlsym(v6, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    *(_QWORD *)(v15 + 24) = v5;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
LABEL_10:
    __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2_cold_1();
    __break(1u);
  }
  v24 = *v5;
  v25[1] = v4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = v24;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v25, &v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getLSApplicationWorkspaceClass_softClass;
  v22 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = (uint64_t)__getLSApplicationWorkspaceClass_block_invoke;
    v17 = &unk_24CC31F58;
    v18 = &v19;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v11, "defaultWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v12, "openSensitiveURL:withOptions:error:", v0, v9, &v13);

}

- (void)installSettingsIcon
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[19];

  v77[17] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  -[PRXCardContentViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addLayoutGuide:", v3);

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("Settings"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v76);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PRXCardContentViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 19.0);

  -[PRXCardContentViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v7);

  v11 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24CC3E078, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v13);

  objc_msgSend(v11, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") | 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v75, 25.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v15);

  objc_msgSend(v7, "addSubview:", v11);
  if (-[PRXSoftwareUpdateViewController offsetIcon](self, "offsetIcon"))
    v16 = 30.0 - 20.0;
  else
    v16 = 0.0;
  -[PRXCardContentViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mainContentGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v72;
  objc_msgSend(v3, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v18;
  objc_msgSend(v18, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, v16);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v68;
  objc_msgSend(v3, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v65;
  objc_msgSend(v5, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v77[3] = v62;
  objc_msgSend(v5, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -11.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v77[4] = v58;
  objc_msgSend(v5, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 11.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v77[5] = v54;
  v61 = v5;
  objc_msgSend(v5, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v77[6] = v50;
  objc_msgSend(v5, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 104.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v77[7] = v48;
  objc_msgSend(v5, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v77[8] = v45;
  objc_msgSend(v7, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v3;
  objc_msgSend(v3, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v77[9] = v41;
  v19 = v7;
  objc_msgSend(v7, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v77[10] = v38;
  objc_msgSend(v7, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", 38.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v77[11] = v36;
  objc_msgSend(v7, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v77[12] = v33;
  objc_msgSend(v11, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v77[13] = v30;
  objc_msgSend(v11, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v77[14] = v21;
  v44 = v11;
  objc_msgSend(v11, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v77[15] = v24;
  objc_msgSend(v11, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v77[16] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "activateConstraints:", v28);

}

- (BOOL)offsetIcon
{
  return self->_offsetIcon;
}

- (void)setOffsetIcon:(BOOL)a3
{
  self->_offsetIcon = a3;
}

uint64_t __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2_cold_1()
{
  dlerror();
  abort_report_np();
  return __getLSApplicationWorkspaceClass_block_invoke_cold_1();
}

@end
