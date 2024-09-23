@implementation PencilEducationElementViewController

- (PencilEducationElementViewController)initWithElementData:(id)a3
{
  id v5;
  PencilEducationElementViewController *v6;
  PencilEducationElementViewController *v7;
  void *v8;
  uint64_t v9;
  NSString *processedString;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PencilEducationElementViewController;
  v6 = -[PencilEducationElementViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementData, a3);
    objc_msgSend(v5, "textContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationElementViewController replacePlaceholdersInString:](v7, "replacePlaceholdersInString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    processedString = v7->_processedString;
    v7->_processedString = (NSString *)v9;

  }
  return v7;
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  PencilEducationElementTextField *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  _BOOL8 v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _BOOL4 v46;
  double v47;
  id v48;
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
  double v64;
  double v65;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  objc_super v103;

  v103.receiver = self;
  v103.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewDidLoad](&v103, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setSpacing:", 15.0);
  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v102 = v4;
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 42.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTextAlignment:", 1);
  v8 = (void *)MEMORY[0x24BEBB520];
  v9 = *MEMORY[0x24BDF77B0];
  -[PencilEducationElementViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v9;
  objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v100 = (void *)v11;
  objc_msgSend(v7, "setFont:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v101 = v12;
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 27.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = objc_alloc_init(PencilEducationElementTextField);
  -[PencilEducationElementTextField setBorderStyle:](v15, "setBorderStyle:", 3);
  -[PencilEducationElementTextField _setRoundedRectBackgroundCornerRadius:](v15, "_setRoundedRectBackgroundCornerRadius:", 10.0);
  v16 = (void *)MEMORY[0x24BDBCEA0];
  -[PencilEducationElementViewController elementData](self, "elementData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "languageID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localeWithLocaleIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BEBB498];
  v99 = v19;
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "defaultWritingDirectionForLanguage:", v21);

  -[PencilEducationElementViewController elementData](self, "elementData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "languageID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedDrawingBundleForLanguage(v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PencilEducationElementViewController elementData](self, "elementData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "languageID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v26;
  objc_msgSend(v26, "URLForResource:withExtension:subdirectory:localization:", CFSTR("localizationOffsets"), CFSTR("plist"), 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v30, "URLForResource:withExtension:", CFSTR("localizationOffsets"), CFSTR("plist")),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30,
        v29))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v29, 0);
    -[PencilEducationElementViewController setLocalizationOffsetDictionary:](self, "setLocalizationOffsetDictionary:", v31);

  }
  v32 = v22 == 1;
  v33 = v22 == 1;
  if (v32)
    v34 = 4;
  else
    v34 = 3;
  -[PencilEducationElementTextField setSemanticContentAttribute:](v15, "setSemanticContentAttribute:", v34);
  -[PencilEducationElementTextField setTextAlignment:](v15, "setTextAlignment:", 2 * v33);
  -[PencilEducationElementViewController setIsTextFieldRTL:](self, "setIsTextFieldRTL:", v33);
  v35 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v93 = v35;
  objc_msgSend(v35, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToConstant:", 6.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  v38 = objc_alloc_init(MEMORY[0x24BDF6880]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.counterclockwise"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImage:forState:", v39, 0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("REPLAY_BUTTON_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:forState:", v41, 0);

  -[PencilEducationElementViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "tintColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitleColor:forState:", v43, 0);

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", v96, 1024);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "titleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFont:", v97);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v97, -1);
  v45 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v45;
  v46 = -[PencilEducationElementViewController isUIRTL](self, "isUIRTL");
  v47 = 7.0;
  if (!v46)
    v47 = -7.0;
  objc_msgSend(v38, "setImageEdgeInsets:", 0.0, v47, 0.0, 0.0);
  objc_msgSend(v38, "setPreferredSymbolConfiguration:forImageInState:", v45, 0);
  objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel_replayButtonPressed_, 64);
  objc_msgSend(v38, "setHidden:", 1);
  v48 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v48, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintGreaterThanOrEqualToConstant:", 5.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  v94 = objc_alloc_init(MEMORY[0x24BDE33D0]);
  objc_msgSend(v94, "setDelegate:", self);
  -[PencilEducationElementTextField addInteraction:](v15, "addInteraction:", v94);
  objc_msgSend(v3, "addArrangedSubview:", v102);
  objc_msgSend(v3, "addArrangedSubview:", v7);
  objc_msgSend(v3, "addArrangedSubview:");
  objc_msgSend(v3, "addArrangedSubview:", v15);
  objc_msgSend(v3, "addArrangedSubview:", v35);
  objc_msgSend(v3, "addArrangedSubview:", v38);
  objc_msgSend(v3, "addArrangedSubview:", v48);
  -[PencilEducationElementViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", v3);

  objc_msgSend(v102, "widthAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:multiplier:", v53, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  objc_msgSend(v101, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  objc_msgSend(v48, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:multiplier:", v59, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  objc_msgSend(v38, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:multiplier:", v62, 1.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  LODWORD(v64) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v64);
  LODWORD(v65) = 1148846080;
  -[PencilEducationElementTextField setContentHuggingPriority:forAxis:](v15, "setContentHuggingPriority:forAxis:", 1, v65);
  -[PencilEducationElementTextField heightAnchor](v15, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToConstant:", 44.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[PencilEducationElementTextField widthAnchor](v15, "widthAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setActive:", 1);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  objc_msgSend(v3, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController view](self, "view");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  objc_msgSend(v3, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  objc_msgSend(v3, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setActive:", 1);

  LODWORD(v87) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v87);
  LODWORD(v88) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v88);
  LODWORD(v89) = 1148846080;
  -[PencilEducationElementTextField setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 1, v89);
  -[PencilEducationElementViewController setTitleLabel:](self, "setTitleLabel:", v7);
  -[PencilEducationElementViewController setTextField:](self, "setTextField:", v15);
  -[PencilEducationElementViewController setReplayButton:](self, "setReplayButton:", v38);
  -[PencilEducationElementViewController setStackView:](self, "setStackView:", v3);
  v90 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PencilEducationElementViewController setAnimationQueue:](self, "setAnimationQueue:", v90);

  -[PencilEducationElementViewController reloadStrings](self, "reloadStrings");
  -[PencilEducationElementViewController reloadAnimationQueue](self, "reloadAnimationQueue");
  v91 = objc_alloc_init(MEMORY[0x24BDE33F0]);
  -[PencilEducationElementViewController setTextInputSettings:](self, "setTextInputSettings:", v91);

  -[PencilEducationElementViewController textInputSettings](self, "textInputSettings");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "loadSettingsFromUserDefaults");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!-[PencilEducationElementViewController didRunInitialAppearActions](self, "didRunInitialAppearActions")
    || -[PencilEducationElementViewController didDisappear](self, "didDisappear"))
  {
    -[PencilEducationElementViewController setDidRunInitialAppearActions:](self, "setDidRunInitialAppearActions:", 1);
    -[PencilEducationElementViewController setDidDisappear:](self, "setDidDisappear:", 0);
    -[PencilEducationElementViewController reloadStrings](self, "reloadStrings");
    -[PencilEducationElementViewController reloadAnimationQueue](self, "reloadAnimationQueue");
    -[PencilEducationElementViewController cancelPendingReplayHiddenCommands](self, "cancelPendingReplayHiddenCommands");
    -[PencilEducationElementViewController replayButton](self, "replayButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[PencilEducationElementViewController textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PencilEducationElementViewController cancelAnimation](self, "cancelAnimation");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[PencilEducationElementViewController cancelPendingReplayHiddenCommands](self, "cancelPendingReplayHiddenCommands");
  -[PencilEducationElementViewController replayButton](self, "replayButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[PencilEducationElementViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[PencilEducationElementViewController setDidDisappear:](self, "setDidDisappear:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PencilEducationElementViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementControllerDidAppear:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PencilEducationElementViewController cancelAnimation](self, "cancelAnimation");
  v8.receiver = self;
  v8.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  -[PencilEducationElementViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PencilEducationElementViewController replayButton](self, "replayButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");

  -[PencilEducationElementViewController cancelPendingReplayHiddenCommands](self, "cancelPendingReplayHiddenCommands");
  -[PencilEducationElementViewController replayButton](self, "replayButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 0);

  -[PencilEducationElementViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v7, v9, a3, v13);

  -[PencilEducationElementViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

  -[PencilEducationElementViewController stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8));
  v21 = v20;

  -[PencilEducationElementViewController cancelPendingReplayHiddenCommands](self, "cancelPendingReplayHiddenCommands");
  -[PencilEducationElementViewController replayButton](self, "replayButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidden:", v15);

  -[PencilEducationElementViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v7, v9, v11, v13);

  return v21;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PencilEducationElementViewController elementData](self, "elementData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[PencilEducationElementViewController processedString](self, "processedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[PencilEducationElementViewController textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionRange:", 0, 0);

  -[PencilEducationElementViewController elementData](self, "elementData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placeholderTextContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholder:", v9);

}

- (void)reloadAnimationQueue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PencilEducationElementViewController animationQueue](self, "animationQueue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");
  -[PencilEducationElementViewController elementData](self, "elementData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  v5 = &unk_24F4F5FF8;
  switch(v4)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v5 = &unk_24F4F6010;
      goto LABEL_6;
    case 2:
      objc_msgSend(v8, "addObject:", &unk_24F4F6028);
      objc_msgSend(v8, "addObject:", &unk_24F4F6040);
      v5 = &unk_24F4F6058;
      goto LABEL_6;
    case 3:
      objc_msgSend(v8, "addObject:", &unk_24F4F60A0);
      v5 = &unk_24F4F60B8;
      goto LABEL_6;
    case 4:
      objc_msgSend(v8, "addObject:", &unk_24F4F6070);
      v5 = &unk_24F4F6088;
LABEL_6:
      objc_msgSend(v8, "addObject:", v5);
      break;
    default:
      break;
  }
  objc_msgSend(v8, "reverseObjectEnumerator", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeAllObjects");
  objc_msgSend(v8, "addObjectsFromArray:", v7);

}

- (void)beginAnimationIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
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
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id WeakRetained;
  id *v49;
  _QWORD v50[4];
  id v51;
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57[2];
  id location[2];

  -[PencilEducationElementViewController animationQueue](self, "animationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "unsignedIntegerValue");

  v6 = -[PencilEducationElementViewController isSecondaryAnimationForType:](self, "isSecondaryAnimationForType:", v5);
  v7 = (void *)MEMORY[0x24BDE3388];
  -[PencilEducationElementViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isDrawingInProgressForWindow:", v9);

  if (!(_DWORD)v7 || v6)
  {
    if (!-[PencilEducationElementViewController isAnimating](self, "isAnimating")
      && -[PencilEducationElementViewController hasRemainingAnimation](self, "hasRemainingAnimation"))
    {
      -[PencilEducationElementViewController setIsAnimating:](self, "setIsAnimating:", 1);
      -[PencilEducationElementViewController setIsRunningAnimationSequence:](self, "setIsRunningAnimationSequence:", 1);
      -[PencilEducationElementViewController setInProgressAnimationType:](self, "setInProgressAnimationType:", v5);
      -[PencilEducationElementViewController animationQueue](self, "animationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeLastObject");

      -[PencilEducationElementViewController drawingForAnimationType:](self, "drawingForAnimationType:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      v12 = MEMORY[0x24BDAC760];
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke;
      v56[3] = &unk_24F4E54A8;
      v49 = v57;
      objc_copyWeak(v57, location);
      v57[1] = v5;
      -[PencilEducationElementViewController setEndWritingCompletionBlock:](self, "setEndWritingCompletionBlock:", v56);
      if (v11)
      {
        v13 = -[PencilEducationElementViewController textRangeForAnimationType:](self, "textRangeForAnimationType:", v5, v57);
        v15 = v14;
        -[PencilEducationElementViewController offsetForAnimationType:](self, "offsetForAnimationType:", v5);
        v17 = v16;
        v19 = v18;
        -[PencilEducationElementViewController textFieldBoundsForRange:](self, "textFieldBoundsForRange:", v13, v15);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        -[PencilEducationElementViewController speedRatioForAnimationType:](self, "speedRatioForAnimationType:", v5);
        v29 = v28;
        v54 = 0u;
        v55 = 0u;
        v53 = 0u;
        -[PencilEducationElementViewController transformForAnimationType:drawing:bounds:](self, "transformForAnimationType:drawing:bounds:", v5, v11, v21, v23, v25, v27);
        v30 = objc_alloc(MEMORY[0x24BDE3388]);
        -[PencilEducationElementViewController textField](self, "textField");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v53;
        v52[1] = v54;
        v52[2] = v55;
        v32 = (void *)objc_msgSend(v30, "initWithDrawing:transform:sourceTextField:", v11, v52, v31);

        objc_msgSend(v32, "setSpeedRatio:", v29);
        -[PencilEducationElementViewController setDrawingReplayController:](self, "setDrawingReplayController:", v32);
        if (!v5)
        {
          -[PencilEducationElementViewController textField](self, "textField");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setIgnoreScribbleInsertText:", 1);

          -[PencilEducationElementViewController textField](self, "textField");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "_textInteraction");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_assertionController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "nonBlinkingAssertionWithReason:", CFSTR("add_text_replay"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PencilEducationElementViewController setCursorAssertion:](self, "setCursorAssertion:", v37);

        }
        -[PencilEducationElementViewController allowedCalloutActionsForType:](self, "allowedCalloutActionsForType:", v5);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PencilEducationElementViewController textField](self, "textField");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAllowedCalloutActions:", v38);

        -[PencilEducationElementViewController drawingReplayController](self, "drawingReplayController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "beginDrawingAnimationAtRange:offset:completion:", v13, v15, 0, v17, v19);

      }
      else if (v5 == (void *)8)
      {
        -[PencilEducationElementViewController textField](self, "textField", v57);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setSelectionRange:", 0, 0);

        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "handleEndAnimation");

      }
      else if (v5 == (void *)4)
      {
        -[PencilEducationElementViewController drawingReplayController](self, "drawingReplayController", v57);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "cancel");

        v42 = -[PencilEducationElementViewController textRangeForAnimationType:](self, "textRangeForAnimationType:", 4);
        -[PencilEducationElementViewController textField](self, "textField");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setSelectionRange:", v42, 0);

        v44 = objc_alloc(MEMORY[0x24BDE3388]);
        -[PencilEducationElementViewController textField](self, "textField");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v44, "initWithSourceTextField:", v45);

        -[PencilEducationElementViewController setDrawingReplayController:](self, "setDrawingReplayController:", v46);
        v50[0] = v12;
        v50[1] = 3221225472;
        v50[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_3;
        v50[3] = &unk_24F4E54D0;
        objc_copyWeak(&v51, location);
        objc_msgSend(v46, "beginInsertTextAnimationAtIndex:offset:completion:", v42, v50, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        objc_destroyWeak(&v51);

      }
      objc_destroyWeak(v49);
      objc_destroyWeak(location);

    }
  }
  else
  {
    -[PencilEducationElementViewController cancelAnimation](self, "cancelAnimation");
  }
}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[5];
  id v17[2];

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (!v7)
      {
        objc_msgSend(WeakRetained, "textField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIgnoreScribbleInsertText:", 0);

        objc_msgSend(v6, "textField");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", &stru_24F4E5CD0);

        v7 = *(_QWORD *)(a1 + 40);
      }
      if (v7 != 3)
      {
        objc_msgSend(v6, "textField");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resignFirstResponder");

      }
      objc_msgSend(v6, "cursorAssertion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      objc_msgSend(v6, "nextAnimationDelayForAnimationType:", *(_QWORD *)(a1 + 40));
      v13 = v12;
      v14 = (void *)(objc_msgSend(v6, "performAnimationAsyncIndex") + 1);
      objc_msgSend(v6, "setPerformAnimationAsyncIndex:", v14);
      objc_msgSend(v6, "setIsRunningAnimationSequence:", objc_msgSend(v6, "hasRemainingAnimation"));
      v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_2;
      block[3] = &unk_24F4E5480;
      objc_copyWeak(v17, v4);
      v17[1] = v14;
      block[4] = v6;
      dispatch_after(v15, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(v17);
    }
    objc_msgSend(v6, "setIsAnimating:", 0);
    objc_msgSend(v6, "setIsRunningAnimationSequence:", objc_msgSend(v6, "hasRemainingAnimation"));
  }

}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "performAnimationAsyncIndex") == *(_QWORD *)(a1 + 48))
    objc_msgSend(WeakRetained, "beginAnimationIfNecessary");
  else
    objc_msgSend(*(id *)(a1 + 32), "setIsRunningAnimationSequence:", objc_msgSend(*(id *)(a1 + 32), "hasRemainingAnimation"));

}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleEndAnimation");

}

- (void)handleEndAnimation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10[2];
  id location;

  -[PencilEducationElementViewController endWritingCompletionBlock](self, "endWritingCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    -[PencilEducationElementViewController textInputSettings](self, "textInputSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputStrokeFadeOutDelay");
    v6 = v5;

    v7 = (void *)(-[PencilEducationElementViewController performAnimationAsyncIndex](self, "performAnimationAsyncIndex")
                + 1);
    -[PencilEducationElementViewController setPerformAnimationAsyncIndex:](self, "setPerformAnimationAsyncIndex:", v7);
    v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__PencilEducationElementViewController_handleEndAnimation__block_invoke;
    block[3] = &unk_24F4E54F8;
    objc_copyWeak(v10, &location);
    v10[1] = v7;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PencilEducationElementViewController setIsRunningAnimationSequence:](self, "setIsRunningAnimationSequence:", -[PencilEducationElementViewController hasRemainingAnimation](self, "hasRemainingAnimation"));
  }
}

void __58__PencilEducationElementViewController_handleEndAnimation__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "performAnimationAsyncIndex") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "endWritingCompletionBlock");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v2[2](v2, 1);

    objc_msgSend(WeakRetained, "setEndWritingCompletionBlock:", 0);
    objc_msgSend(WeakRetained, "setIsRunningAnimationSequence:", objc_msgSend(WeakRetained, "hasRemainingAnimation"));
  }

}

- (BOOL)hasRemainingAnimation
{
  void *v2;
  BOOL v3;

  -[PencilEducationElementViewController animationQueue](self, "animationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[PencilEducationElementViewController elementData](self, "elementData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)replayButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10[2];
  id location;

  -[PencilEducationElementViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementControllerWillReplay:", self);

  -[PencilEducationElementViewController replayButton](self, "replayButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[PencilEducationElementViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[PencilEducationElementViewController cancelAnimation](self, "cancelAnimation");
  -[PencilEducationElementViewController reloadStrings](self, "reloadStrings");
  -[PencilEducationElementViewController reloadAnimationQueue](self, "reloadAnimationQueue");
  v7 = (void *)(-[PencilEducationElementViewController performAnimationAsyncIndex](self, "performAnimationAsyncIndex")
              + 1);
  -[PencilEducationElementViewController setPerformAnimationAsyncIndex:](self, "setPerformAnimationAsyncIndex:", v7);
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PencilEducationElementViewController_replayButtonPressed___block_invoke;
  block[3] = &unk_24F4E54F8;
  objc_copyWeak(v10, &location);
  v10[1] = v7;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __60__PencilEducationElementViewController_replayButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "performAnimationAsyncIndex") == *(_QWORD *)(a1 + 40))
    objc_msgSend(WeakRetained, "beginAnimationIfNecessary");

}

- (void)cancelPendingReplayHiddenCommands
{
  -[PencilEducationElementViewController setReplayButtonHiddenIndex:](self, "setReplayButtonHiddenIndex:", -[PencilEducationElementViewController replayButtonHiddenIndex](self, "replayButtonHiddenIndex") + 1);
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PencilEducationElementViewController setHasPencilInteraction:](self, "setHasPencilInteraction:", 0);
    -[PencilEducationElementViewController updateIsAnimatingUI](self, "updateIsAnimatingUI");
  }
}

- (void)setIsRunningAnimationSequence:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->_isRunningAnimationSequence != a3)
  {
    self->_isRunningAnimationSequence = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x24BDE3388]);
      -[PencilEducationElementViewController textField](self, "textField");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "initWithSourceTextField:", v6);
      -[PencilEducationElementViewController setDelayDrawingReplayController:](self, "setDelayDrawingReplayController:", v5);

    }
    else
    {
      -[PencilEducationElementViewController setDelayDrawingReplayController:](self, "setDelayDrawingReplayController:", 0);
    }
  }
}

- (void)setDelayDrawingReplayController:(id)a3
{
  PKDrawingReplayController *v5;
  PKDrawingReplayController **p_delayDrawingReplayController;
  PKDrawingReplayController *v7;

  v5 = (PKDrawingReplayController *)a3;
  p_delayDrawingReplayController = &self->_delayDrawingReplayController;
  if (*p_delayDrawingReplayController != v5)
  {
    v7 = v5;
    -[PKDrawingReplayController setDisablePencilInput:](*p_delayDrawingReplayController, "setDisablePencilInput:", 0);
    objc_storeStrong((id *)p_delayDrawingReplayController, a3);
    -[PKDrawingReplayController setDisablePencilInput:](*p_delayDrawingReplayController, "setDisablePencilInput:", 1);
    v5 = v7;
  }

}

- (void)updateIsAnimatingUI
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (-[PencilEducationElementViewController isAnimating](self, "isAnimating")
    || -[PencilEducationElementViewController hasRemainingAnimation](self, "hasRemainingAnimation"))
  {
    -[PencilEducationElementViewController cancelPendingReplayHiddenCommands](self, "cancelPendingReplayHiddenCommands");
    -[PencilEducationElementViewController replayButton](self, "replayButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  else
  {
    v3 = -[PencilEducationElementViewController replayButtonHiddenIndex](self, "replayButtonHiddenIndex") + 1;
    -[PencilEducationElementViewController setReplayButtonHiddenIndex:](self, "setReplayButtonHiddenIndex:", v3);
    -[PencilEducationElementViewController replayButton](self, "replayButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PencilEducationElementViewController replayButtonHiddenIndex](self, "replayButtonHiddenIndex") == v3)
    {
      if (objc_msgSend(v4, "isHidden"))
      {
        objc_msgSend(v4, "setAlpha:", 0.0);
        objc_msgSend(v4, "setHidden:", 0);
        v5 = (void *)MEMORY[0x24BDF6F90];
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __59__PencilEducationElementViewController_updateIsAnimatingUI__block_invoke;
        v9[3] = &unk_24F4E50A0;
        v10 = v4;
        objc_msgSend(v5, "animateWithDuration:animations:", v9, 0.25);

      }
      -[PencilEducationElementViewController defaultAllowedCalloutActions](self, "defaultAllowedCalloutActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PencilEducationElementViewController textField](self, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAllowedCalloutActions:", v6);

    }
  }
}

uint64_t __59__PencilEducationElementViewController_updateIsAnimatingUI__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

+ (id)keyPathsForValuesAffectingAnimationInProgress
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("isRunningAnimationSequence"), 0);
}

- (void)cancelAnimation
{
  void *v3;
  void *v4;

  -[PencilEducationElementViewController drawingReplayController](self, "drawingReplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[PencilEducationElementViewController setDrawingReplayController:](self, "setDrawingReplayController:", 0);
  -[PencilEducationElementViewController setEndWritingCompletionBlock:](self, "setEndWritingCompletionBlock:", 0);
  -[PencilEducationElementViewController animationQueue](self, "animationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PencilEducationElementViewController setIsAnimating:](self, "setIsAnimating:", 0);
  -[PencilEducationElementViewController setIsRunningAnimationSequence:](self, "setIsRunningAnimationSequence:", 0);
  -[PencilEducationElementViewController updateIsAnimatingUI](self, "updateIsAnimatingUI");
  -[PencilEducationElementViewController setPerformAnimationAsyncIndex:](self, "setPerformAnimationAsyncIndex:", -[PencilEducationElementViewController performAnimationAsyncIndex](self, "performAnimationAsyncIndex") + 1);
}

- (id)drawingForAnimationType:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if ((unint64_t)a3 > 7 || ((0xEFu >> a3) & 1) == 0)
    return 0;
  v5 = off_24F4E5540[a3];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController elementData](self, "elementData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedDrawingBundleForLanguage(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PencilEducationElementViewController elementData](self, "elementData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:subdirectory:localization:", v5, CFSTR("pkdrawingdata"), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("pkdrawingdata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3380]), "initWithData:error:", v13, &v15);

  return v14;
}

- (id)replacePlaceholdersInString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v3, "length");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{"), v6, 0, 0, v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("}"), v7, 0, 0, v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("["), v8, 0, 0, v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("]"), v9, 0, 0, v5);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (_NSRange)textRangeForAnimationType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  BOOL v16;
  NSUInteger v17;
  _BOOL4 v18;
  _BOOL4 v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  _NSRange result;

  -[PencilEducationElementViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeOfString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "rangeOfString:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "rangeOfString:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "rangeOfString:", v12);

  switch(a3)
  {
    case 0:
      v17 = 0;
      v16 = v9 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    case 1:
    case 2:
    case 4:
    case 6:
      v14 = v7 != 0x7FFFFFFFFFFFFFFFLL;
      v15 = v9 != 0x7FFFFFFFFFFFFFFFLL;
      v16 = !v14 || !v15;
      if (v14 && v15)
        v17 = v9 - v7;
      else
        v17 = 0;
LABEL_15:
      if (v16)
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 3:
    case 7:
      v18 = v11 != 0x7FFFFFFFFFFFFFFFLL;
      v19 = v13 != 0x7FFFFFFFFFFFFFFFLL;
      if (v18 && v19)
        v17 = v13 - v11;
      else
        v17 = 0;
      if (v18 && v19)
        v7 = v11;
      else
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 5:
      v22 = v9 - v7;
      v23 = v7 - 1;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 0;
        v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        v17 = 0;
      else
        v17 = v22;
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v7 = v23;
      break;
    case 8:
      v17 = 0;
      v7 = 0;
      break;
    default:
      v17 = 0;
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  v20 = v7;
  v21 = v17;
  result.length = v21;
  result.location = v20;
  return result;
}

- (CGPoint)offsetForAnimationType:(int64_t)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = 0.0;
  switch(a3)
  {
    case 5:
      goto LABEL_4;
    case 2:
      v6 = -[PencilEducationElementViewController textRangeForAnimationType:](self, "textRangeForAnimationType:", 2);
      -[PencilEducationElementViewController textFieldBoundsForRange:](self, "textFieldBoundsForRange:", v6, v7);
      v5 = v8 * 0.5;
      break;
    case 0:
LABEL_4:
      -[PencilEducationElementViewController isTextFieldRTL](self, "isTextFieldRTL");
      -[PencilEducationElementViewController isTextFieldRTL](self, "isTextFieldRTL");
      break;
  }
  -[PencilEducationElementViewController localizationOffsetsForAnimationType:](self, "localizationOffsetsForAnimationType:", a3);
  v10 = v9 + 0.0;
  v12 = v5 + v11;
  result.y = v12;
  result.x = v10;
  return result;
}

- (double)speedRatioForAnimationType:(int64_t)a3
{
  double result;

  result = 2.2;
  if (a3 == 5)
    result = 2.0;
  if (!a3)
    return 5.0;
  return result;
}

- (double)nextAnimationDelayForAnimationType:(int64_t)a3
{
  double result;

  result = 0.75;
  if ((unint64_t)(a3 - 2) <= 2)
    return dbl_22ACEA168[a3 - 2];
  return result;
}

- (double)scaleRatioForAnimationType:(int64_t)a3
{
  double result;

  result = 1.0;
  if ((unint64_t)a3 <= 7)
    return dbl_22ACEA180[a3];
  return result;
}

- (BOOL)hasCustomHeightRatioForAnimationType:(int64_t)a3
{
  double v3;

  -[PencilEducationElementViewController customHeightRatioForAnimationType:](self, "customHeightRatioForAnimationType:", a3);
  return v3 != 1.0;
}

- (double)customHeightRatioForAnimationType:(int64_t)a3
{
  double result;

  result = 0.1;
  if (a3 != 2)
    return 1.0;
  return result;
}

- (id)allowedCalloutActionsForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 3)
    return 0;
  -[PencilEducationElementViewController defaultAllowedCalloutActions](self, "defaultAllowedCalloutActions", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultAllowedCalloutActions
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("cut:"), CFSTR("copy:"), CFSTR("selectAll:"), CFSTR("paste:"), CFSTR("replace:"), 0);
}

- (BOOL)hasCustomWidthRatioForAnimationType:(int64_t)a3
{
  double v3;

  -[PencilEducationElementViewController customWidthRatioForAnimationType:](self, "customWidthRatioForAnimationType:", a3);
  return v3 != 1.0;
}

- (double)customWidthRatioForAnimationType:(int64_t)a3
{
  double result;

  result = 0.1;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
    return 1.0;
  return result;
}

- (BOOL)isSecondaryAnimationForType:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x188u >> a3);
}

- (BOOL)isTextAddedForAnimationType:(int64_t)a3
{
  return !a3 || a3 == 5;
}

- (CGAffineTransform)transformForAnimationType:(SEL)a3 drawing:(int64_t)a4 bounds:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  int64_t v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform *result;
  CGAffineTransform v22;
  CGAffineTransform v23;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a5;
  v14 = -[PencilEducationElementViewController transformDimensionAnimationType:](self, "transformDimensionAnimationType:", a4);
  if (-[PencilEducationElementViewController isTextFieldRTL](self, "isTextFieldRTL")
    && -[PencilEducationElementViewController isTextAddedForAnimationType:](self, "isTextAddedForAnimationType:", a4))
  {
    objc_msgSend(v13, "bounds");
  }
  -[PencilEducationElementViewController scaleRatioForAnimationType:](self, "scaleRatioForAnimationType:", a4);
  v16 = height * v15 - height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  -[PencilEducationElementViewController transformDrawing:toFitBounds:dimension:offset:animationType:](self, "transformDrawing:toFitBounds:dimension:offset:animationType:", v13, v14, a4, x, y, width);
  v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v17;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v23, &v22, 0.0, v16 * -0.5);
  v18 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;
  v19 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  -[PencilEducationElementViewController applyLocalizationScaleOffsetsIfNecesssaryForDrawing:animationType:transform:](self, "applyLocalizationScaleOffsetsIfNecesssaryForDrawing:animationType:transform:", v13, a4, &v22);
  v20 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;

  return result;
}

- (int64_t)transformDimensionAnimationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return qword_22ACEA1C0[a3];
}

- (CGAffineTransform)transformDrawing:(SEL)a3 toFitBounds:(id)a4 dimension:(CGRect)a5 offset:(int64_t)a6 animationType:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  CGAffineTransform *result;
  __int128 v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  y = a7.y;
  x = a7.x;
  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "bounds", a5.origin.x, a5.origin.y);
  v17 = v16;
  v19 = v18;
  v20 = -[PencilEducationElementViewController hasCustomWidthRatioForAnimationType:](self, "hasCustomWidthRatioForAnimationType:", a8);
  v21 = -[PencilEducationElementViewController hasCustomHeightRatioForAnimationType:](self, "hasCustomHeightRatioForAnimationType:", a8);
  if (v20)
  {
    -[PencilEducationElementViewController customWidthRatioForAnimationType:](self, "customWidthRatioForAnimationType:", a8);
    v23 = v22;
  }
  else
  {
    v23 = 1.0;
    if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v23 = width / v17;
  }
  if (v21)
  {
    -[PencilEducationElementViewController customHeightRatioForAnimationType:](self, "customHeightRatioForAnimationType:", a8);
    v25 = v24;
  }
  else
  {
    v25 = 1.0;
    if ((unint64_t)(a6 - 2) <= 2)
      v25 = height / v19;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (a6 == 4)
    v26 = v25;
  else
    v26 = v23;
  *(_OWORD *)&retstr->a = 0uLL;
  CGAffineTransformMakeScale(retstr, v26, v25);
  v27 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v30.c = v27;
  *(_OWORD *)&v30.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v31, &v30, x, y);
  v29 = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v31.a;
  *(_OWORD *)&retstr->c = v29;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v31.tx;
  return result;
}

- (CGAffineTransform)applyLocalizationScaleOffsetsIfNecesssaryForDrawing:(SEL)a3 animationType:(id)a4 transform:(int64_t)a5
{
  __int128 v7;
  CGAffineTransform *result;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  CGAffineTransform v19;

  v7 = *(_OWORD *)&a6->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a6->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a6->tx;
  result = (CGAffineTransform *)-[PencilEducationElementViewController localizationOffsetsForAnimationType:](self, "localizationOffsetsForAnimationType:", a5);
  v11 = 1.0;
  if (v9 != 1.0 || v10 != 1.0)
  {
    v13 = fabs(v9);
    v14 = fmax(v9, 0.1);
    if (v13 <= 0.1)
      v15 = 1.0;
    else
      v15 = v14;
    v16 = fabs(v10);
    v17 = fmax(v10, 0.1);
    if (v16 > 0.1)
      v11 = v17;
    v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v19.c = v18;
    *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformScale(retstr, &v19, v15, v11);
  }
  return result;
}

- (CGRect)textFieldBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[PencilEducationElementViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:offset:", v7, location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginningOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:offset:", v9, location + length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textRangeFromPosition:toPosition:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstRectForRange:", v11);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  if (CGRectIsInfinite(v22) || !length)
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    -[PencilEducationElementViewController textField](self, "textField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    height = v17;

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (PKPencilEducationOffset)localizationOffsetsForAnimationType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  PKPencilEducationOffset result;

  -[PencilEducationElementViewController localizationOffsetDictionary](self, "localizationOffsetDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationElementViewController localizationOffsetKeyForAnimationType:](self, "localizationOffsetKeyForAnimationType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("x"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("y"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("widthRatio"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("heightRatio"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

  }
  else
  {
    v20 = 0.0;
    v17 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
  }

  v21 = v11;
  v22 = v14;
  v23 = v17;
  v24 = v20;
  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (id)localizationOffsetKeyForAnimationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return off_24F4E5580[a3];
}

- (BOOL)isUIRTL
{
  void *v2;
  BOOL v3;

  -[PencilEducationElementViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  return v3;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  void *v5;
  void *v6;

  if (!-[PencilEducationElementViewController isAnimating](self, "isAnimating", a3, a4))
  {
    if (-[PencilEducationElementViewController hasPencilInteraction](self, "hasPencilInteraction"))
    {
      +[PencilSettingsStatisticsManager sharedInstance](PencilSettingsStatisticsManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PencilEducationElementViewController elementData](self, "elementData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordEducationPencilInputInteraction:", objc_msgSend(v6, "type"));

      -[PencilEducationElementViewController setHasPencilInteraction:](self, "setHasPencilInteraction:", 0);
    }
  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  _BOOL4 v5;

  v5 = -[PencilEducationElementViewController isAnimating](self, "isAnimating", a3, a4);
  if (v5)
    LOBYTE(v5) = -[PencilEducationElementViewController inProgressAnimationType](self, "inProgressAnimationType") == 0;
  return v5;
}

- (BOOL)_pkScribbleInteractionShouldDisableInputAssistant:(id)a3
{
  return 1;
}

- (PencilEducationElementViewControllerDelegate)delegate
{
  return (PencilEducationElementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)isRunningAnimationSequence
{
  return self->_isRunningAnimationSequence;
}

- (PencilEducationElementData)elementData
{
  return self->_elementData;
}

- (void)setElementData:(id)a3
{
  objc_storeStrong((id *)&self->_elementData, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (PencilEducationElementTextField)textField
{
  return (PencilEducationElementTextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (NSString)processedString
{
  return self->_processedString;
}

- (void)setProcessedString:(id)a3
{
  objc_storeStrong((id *)&self->_processedString, a3);
}

- (UITextCursorAssertion)cursorAssertion
{
  return self->_cursorAssertion;
}

- (void)setCursorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_cursorAssertion, a3);
}

- (PKTextInputSettings)textInputSettings
{
  return self->_textInputSettings;
}

- (void)setTextInputSettings:(id)a3
{
  objc_storeStrong((id *)&self->_textInputSettings, a3);
}

- (NSDictionary)localizationOffsetDictionary
{
  return self->_localizationOffsetDictionary;
}

- (void)setLocalizationOffsetDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_localizationOffsetDictionary, a3);
}

- (UIButton)replayButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_replayButton);
}

- (void)setReplayButton:(id)a3
{
  objc_storeWeak((id *)&self->_replayButton, a3);
}

- (PKTextInputInteraction)textInputInteraction
{
  return self->_textInputInteraction;
}

- (PKDrawingReplayController)drawingReplayController
{
  return self->_drawingReplayController;
}

- (void)setDrawingReplayController:(id)a3
{
  objc_storeStrong((id *)&self->_drawingReplayController, a3);
}

- (PKDrawingReplayController)delayDrawingReplayController
{
  return self->_delayDrawingReplayController;
}

- (NSMutableArray)animationQueue
{
  return self->_animationQueue;
}

- (void)setAnimationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_animationQueue, a3);
}

- (int64_t)inProgressAnimationType
{
  return self->_inProgressAnimationType;
}

- (void)setInProgressAnimationType:(int64_t)a3
{
  self->_inProgressAnimationType = a3;
}

- (BOOL)hasPencilInteraction
{
  return self->_hasPencilInteraction;
}

- (void)setHasPencilInteraction:(BOOL)a3
{
  self->_hasPencilInteraction = a3;
}

- (unint64_t)replayButtonHiddenIndex
{
  return self->_replayButtonHiddenIndex;
}

- (void)setReplayButtonHiddenIndex:(unint64_t)a3
{
  self->_replayButtonHiddenIndex = a3;
}

- (unint64_t)performAnimationAsyncIndex
{
  return self->_performAnimationAsyncIndex;
}

- (void)setPerformAnimationAsyncIndex:(unint64_t)a3
{
  self->_performAnimationAsyncIndex = a3;
}

- (id)endWritingCompletionBlock
{
  return self->_endWritingCompletionBlock;
}

- (void)setEndWritingCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (BOOL)didRunInitialAppearActions
{
  return self->_didRunInitialAppearActions;
}

- (void)setDidRunInitialAppearActions:(BOOL)a3
{
  self->_didRunInitialAppearActions = a3;
}

- (BOOL)isTextFieldRTL
{
  return self->_isTextFieldRTL;
}

- (void)setIsTextFieldRTL:(BOOL)a3
{
  self->_isTextFieldRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endWritingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
  objc_storeStrong((id *)&self->_delayDrawingReplayController, 0);
  objc_storeStrong((id *)&self->_drawingReplayController, 0);
  objc_storeStrong((id *)&self->_textInputInteraction, 0);
  objc_destroyWeak((id *)&self->_replayButton);
  objc_storeStrong((id *)&self->_localizationOffsetDictionary, 0);
  objc_storeStrong((id *)&self->_textInputSettings, 0);
  objc_storeStrong((id *)&self->_cursorAssertion, 0);
  objc_storeStrong((id *)&self->_processedString, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_elementData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
