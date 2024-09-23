@implementation PencilHandwritingEducationElementViewController

- (PencilHandwritingEducationElementViewController)initWithElementData:(id)a3
{
  id v5;
  PencilHandwritingEducationElementViewController *v6;
  PencilHandwritingEducationElementViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PencilHandwritingEducationElementViewController;
  v6 = -[PencilHandwritingEducationElementViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elementData, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController dealloc](&v4, sel_dealloc);
}

- (void)initStackView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setSpacing:", 15.0);
  -[PencilHandwritingEducationElementViewController setStackView:](self, "setStackView:", v3);

}

- (void)initTitleLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTextAlignment:", 1);
  v3 = (void *)MEMORY[0x24BEBB520];
  v4 = *MEMORY[0x24BDF77B0];
  -[PencilHandwritingEducationElementViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFont:", v6);
  -[PencilHandwritingEducationElementViewController setTitleLabel:](self, "setTitleLabel:", v7);

}

- (void)initCanvasView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDE3378]);
  objc_msgSend(v5, "_tiledView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAutoRefineEnabled:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  -[PencilHandwritingEducationElementViewController setCanvasView:](self, "setCanvasView:", v5);

}

- (void)initTextLine
{
  void *v3;
  TextLineLayer *v4;

  v4 = objc_alloc_init(TextLineLayer);
  -[TextLineLayer setLineWidth:](v4, "setLineWidth:", 1.0);
  -[TextLineLayer setCenterOffset:](v4, "setCenterOffset:", 12.5);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TextLineLayer setLineColor:](v4, "setLineColor:", v3);

  -[TextLineLayer setZPosition:](v4, "setZPosition:", -1.0);
  -[TextLineLayer setInsets:](v4, "setInsets:", 0.0, 24.0, 0.0, 24.0);
  -[PencilHandwritingEducationElementViewController setTextLineLayer:](self, "setTextLineLayer:", v4);

}

- (void)initPlayer
{
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
  _QWORD v13[5];

  PencilPairingUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("autoRefineSample"), CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2610], "playerWithPlayerItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDB26D0];
  objc_msgSend(v6, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__PencilHandwritingEducationElementViewController_initPlayer__block_invoke;
  v13[3] = &unk_24F4E59C8;
  v13[4] = self;
  objc_msgSend(v7, "videoCompositionWithAsset:applyingCIFiltersWithHandler:", v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVideoComposition:", v10);

  -[PencilHandwritingEducationElementViewController setPlayer:](self, "setPlayer:", v6);
  objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVideoGravity:", *MEMORY[0x24BDB1C78]);
  -[PencilHandwritingEducationElementViewController setPlayerLayer:](self, "setPlayerLayer:", v12);

}

uint64_t __61__PencilHandwritingEducationElementViewController_initPlayer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processVideoRequest:", a2);
}

- (void)initCanvasMaskLayer
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setCornerRadius:", 10.0);
  objc_msgSend(v3, "setBlurRadius:", 8.0);
  objc_msgSend(v3, "setInsets:", 5.0, 5.0, 50.0, 24.0);
  -[PencilHandwritingEducationElementViewController setCanvasMaskLayer:](self, "setCanvasMaskLayer:", v3);

}

- (void)initReplayButton
{
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
  double v13;
  id v14;

  v14 = objc_alloc_init(MEMORY[0x24BDF6880]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.counterclockwise"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:forState:", v3, 0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REPLAY_BUTTON_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v5, 0);

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(v14, "setTitleColor:forState:", v7, 0);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B0], 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v9, -1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "layoutDirection") == 1)
    v13 = 7.0;
  else
    v13 = -7.0;

  objc_msgSend(v14, "setImageEdgeInsets:", 0.0, v13, 0.0, 0.0);
  objc_msgSend(v14, "setHidden:", 1);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_replayButtonPressed_, 64);
  -[PencilHandwritingEducationElementViewController setReplayButton:](self, "setReplayButton:", v14);

}

- (void)initClearButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark.circle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v3, 0);

  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v8, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_clearButtonPressed_, 64);
  objc_msgSend(v8, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 24.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[PencilHandwritingEducationElementViewController setClearButton:](self, "setClearButton:", v8);
}

- (void)startObservingNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB1FA8];
  -[PencilHandwritingEducationElementViewController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_playerItemDidFinish_, v3, v5);

  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  double v30;
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
  double v42;
  double v43;
  double v44;
  double v45;
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
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewDidLoad](&v75, sel_viewDidLoad);
  -[PencilHandwritingEducationElementViewController initStackView](self, "initStackView");
  -[PencilHandwritingEducationElementViewController initTitleLabel](self, "initTitleLabel");
  -[PencilHandwritingEducationElementViewController initCanvasView](self, "initCanvasView");
  -[PencilHandwritingEducationElementViewController initTextLine](self, "initTextLine");
  -[PencilHandwritingEducationElementViewController initPlayer](self, "initPlayer");
  -[PencilHandwritingEducationElementViewController initCanvasMaskLayer](self, "initCanvasMaskLayer");
  -[PencilHandwritingEducationElementViewController initReplayButton](self, "initReplayButton");
  -[PencilHandwritingEducationElementViewController initClearButton](self, "initClearButton");
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  v6 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:", 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PencilHandwritingEducationElementViewController stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController canvasView](self, "canvasView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  v74 = v3;
  objc_msgSend(v9, "addArrangedSubview:", v3);
  objc_msgSend(v9, "addArrangedSubview:", v10);
  objc_msgSend(v9, "addArrangedSubview:", v11);
  v73 = v6;
  objc_msgSend(v9, "addArrangedSubview:", v6);
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v9);

  objc_msgSend(v9, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v9, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v9, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  objc_msgSend(v9, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  LODWORD(v30) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  objc_msgSend(v12, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:multiplier:", v32, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v6, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v35, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  objc_msgSend(v11, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", 250.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  objc_msgSend(v11, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  LODWORD(v42) = 1148846080;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 1, v42);
  LODWORD(v43) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v43);
  v72 = v10;
  LODWORD(v44) = 1148846080;
  objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 1, v44);
  LODWORD(v45) = 1148846080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v45);
  -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "insertSublayer:above:", v71, v47);

  -[PencilHandwritingEducationElementViewController textLineLayer](self, "textLineLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  objc_msgSend(v48, "setFrame:");

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "insertSublayer:atIndex:", v48, 0);

  -[PencilHandwritingEducationElementViewController canvasMaskLayer](self, "canvasMaskLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bounds");
  objc_msgSend(v52, "setFrame:");

  objc_msgSend(v11, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setMask:", v52);

  -[PencilHandwritingEducationElementViewController replayButton](self, "replayButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", v55);

  objc_msgSend(v55, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 31.5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  objc_msgSend(v55, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[PencilHandwritingEducationElementViewController clearButton](self, "clearButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSubview:", v63);

  objc_msgSend(v63, "rightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, -24.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  objc_msgSend(v63, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, -11.5);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setActive:", 1);

  -[PencilHandwritingEducationElementViewController reloadStrings](self, "reloadStrings");
  -[PencilHandwritingEducationElementViewController startObservingNotifications](self, "startObservingNotifications");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[PencilHandwritingEducationElementViewController didRunInitialAppearActions](self, "didRunInitialAppearActions")|| -[PencilHandwritingEducationElementViewController didDisappear](self, "didDisappear"))
  {
    -[PencilHandwritingEducationElementViewController setDidRunInitialAppearActions:](self, "setDidRunInitialAppearActions:", 1);
    -[PencilHandwritingEducationElementViewController setDidDisappear:](self, "setDidDisappear:", 0);
    -[PencilHandwritingEducationElementViewController reloadStrings](self, "reloadStrings");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PencilHandwritingEducationElementViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementControllerDidAppear:", self);

  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "play");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, 0);
  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
  -[PencilHandwritingEducationElementViewController setDidDisappear:](self, "setDidDisappear:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PencilHandwritingEducationElementViewController;
  -[PencilHandwritingEducationElementViewController viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, "setFrame:", v7, v9 + -8.0, v11, v13);
  objc_msgSend(v3, "setNeedsDisplay");
  -[PencilHandwritingEducationElementViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v14, "convertRect:fromView:", v4);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[PencilHandwritingEducationElementViewController textLineLayer](self, "textLineLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[PencilHandwritingEducationElementViewController textLineLayer](self, "textLineLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsDisplay");

  -[PencilHandwritingEducationElementViewController canvasMaskLayer](self, "canvasMaskLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  objc_msgSend(v25, "setFrame:");

  -[PencilHandwritingEducationElementViewController canvasMaskLayer](self, "canvasMaskLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsDisplay");

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
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, a3, v13);

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  -[PencilHandwritingEducationElementViewController stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8));
  v18 = v17;

  -[PencilHandwritingEducationElementViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v7, v9, v11, v13);

  return v18;
}

- (void)processVideoRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGContext *CurrentContext;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  float v29;
  CGFloat v30;
  CGFloat v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  CGSize v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v4 = a3;
  objc_msgSend(v4, "sourceImage");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = (_QWORD *)MEMORY[0x24BDBF960];
  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x24BDBF658], "colorInvertFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v37, *v7);
    objc_msgSend(v8, "outputImage");
    v9 = objc_claimAutoreleasedReturnValue();

    v37 = (id)v9;
  }
  -[PencilHandwritingEducationElementViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDBF658], "lightenBlendModeFilter");
  else
    objc_msgSend(MEMORY[0x24BDBF658], "multiplyBlendModeFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PencilHandwritingEducationElementViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "extent");
  v15 = v14;
  v17 = v16;
  v38.width = v14;
  v38.height = v16;
  UIGraphicsBeginImageContext(v38);
  objc_msgSend(v13, "setFill");
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v15;
  v39.size.height = v17;
  UIRectFill(v39);
  -[PencilHandwritingEducationElementViewController textLineLayer](self, "textLineLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;
  objc_msgSend(v37, "extent");
  v24 = v23;
  objc_msgSend(v18, "bounds");
  v26 = v22 * (v24 / v25);

  objc_msgSend(v18, "lineWidth");
  v28 = v27 * v26;
  objc_msgSend(v37, "extent");
  v29 = CGRectGetMidY(v40) + v26 * 20.5 + v28 * -0.5;
  v30 = floorf(v29);
  objc_msgSend(v37, "extent");
  v31 = CGRectGetWidth(v41) + v26 * -48.0;
  UIGraphicsPushContext(CurrentContext);
  objc_msgSend(v18, "lineColor");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v32, "CGColor"));

  CGContextSetLineWidth(CurrentContext, v28);
  v42.origin.x = v26 * 24.0;
  v42.origin.y = v30;
  v42.size.width = v31;
  v42.size.height = v28;
  CGContextFillRect(CurrentContext, v42);
  UIGraphicsPopContext();
  v33 = (void *)MEMORY[0x24BDBF660];
  UIGraphicsGetImageFromCurrentImageContext();
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "imageWithCGImage:", objc_msgSend(v34, "CGImage"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  objc_msgSend(v11, "setValue:forKey:", v37, *v7);
  objc_msgSend(v11, "setValue:forKey:", v35, *MEMORY[0x24BDBF928]);
  objc_msgSend(v11, "outputImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithImage:context:", v36, 0);

}

- (void)replayButtonPressed:(id)a3
{
  void *v4;
  __int128 v5;
  uint64_t v6;

  -[PencilHandwritingEducationElementViewController reloadStrings](self, "reloadStrings", a3);
  -[PencilHandwritingEducationElementViewController clearCanvas](self, "clearCanvas");
  -[PencilHandwritingEducationElementViewController setReplayButtonHidden:animated:](self, "setReplayButtonHidden:animated:", 1, 1);
  -[PencilHandwritingEducationElementViewController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDC0D88];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(v4, "seekToTime:", &v5);
  -[PencilHandwritingEducationElementViewController showPlayer:](self, "showPlayer:", 0);
  objc_msgSend(v4, "play");

}

- (void)clearButtonPressed:(id)a3
{
  -[PencilHandwritingEducationElementViewController clearCanvas](self, "clearCanvas", a3);
  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController stopPlayer](self, "stopPlayer");
    -[PencilHandwritingEducationElementViewController hidePlayer:](self, "hidePlayer:", 1);
  }
  -[PencilHandwritingEducationElementViewController setReplayButtonHidden:animated:](self, "setReplayButtonHidden:animated:", 0, 1);
}

- (void)updateButtonTray:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setHidden:", 1);
  objc_msgSend(v12, "removeAllButtons");
  -[PencilHandwritingEducationElementViewController elementData](self, "elementData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTO_REFINE_TURN_ON_BUTTON_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_turnOnPressed_, 64);
    objc_msgSend(v12, "addButton:", v6);
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTO_REFINE_NOT_NOW_BUTTON_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v11, 0);

    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_notNowPressed_, 64);
    objc_msgSend(v12, "addButton:", v9);
    objc_msgSend(v12, "setHidden:", 0);

  }
}

- (void)turnOnPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PencilHandwritingEducationElementViewController elementData](self, "elementData", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (!v5)
  {
    +[PencilSettings sharedPencilSettings](PencilSettings, "sharedPencilSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoRefineEnabled:", 1);

    -[PencilHandwritingEducationElementViewController setDidEnableAutoRefine:](self, "setDidEnableAutoRefine:", 1);
    -[PencilHandwritingEducationElementViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "elementControllerShouldDismiss:", self);

  }
}

- (void)notNowPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PencilHandwritingEducationElementViewController elementData](self, "elementData", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (!v5)
  {
    +[PencilSettings sharedPencilSettings](PencilSettings, "sharedPencilSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoRefineEnabled:", 0);

    -[PencilHandwritingEducationElementViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "elementControllerShouldDismiss:", self);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadStrings
{
  void *v3;
  void *v4;
  id v5;

  -[PencilHandwritingEducationElementViewController elementData](self, "elementData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationElementViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v3);

}

- (void)clearCanvas
{
  void *v2;
  id v3;

  -[PencilHandwritingEducationElementViewController canvasView](self, "canvasView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDrawing:", v2);

  objc_msgSend(v3, "setNeedsDisplay");
}

- (BOOL)hasRemainingAnimation
{
  return 0;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[PencilHandwritingEducationElementViewController elementData](self, "elementData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)animationInProgress
{
  return !-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden");
}

- (void)cancelAnimation
{
  void *v3;
  id v4;

  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pause");

    -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)beginAnimation
{
  id v3;

  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "play");

  }
}

- (BOOL)isPlayerHidden
{
  void *v2;
  void *v3;
  float v4;
  BOOL v5;

  -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "opacity");
    v5 = v4 != 1.0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)stopPlayer
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  -[PencilHandwritingEducationElementViewController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");
  v3 = *MEMORY[0x24BDC0D88];
  v4 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(v2, "seekToTime:", &v3);

}

- (void)hidePlayer:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6F90];
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke;
  v9[3] = &unk_24F4E50A0;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke_2;
  v7[3] = &unk_24F4E59F0;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v9, v7, 0.25);

}

uint64_t __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
}

uint64_t __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

- (void)showPlayer:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[PencilHandwritingEducationElementViewController playerLayer](self, "playerLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PencilHandwritingEducationElementViewController canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationElementViewController textLineLayer](self, "textLineLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSublayer:above:", v4, v8);

  }
  v9 = (void *)MEMORY[0x24BDF6F90];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__PencilHandwritingEducationElementViewController_showPlayer___block_invoke;
  v11[3] = &unk_24F4E50A0;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.25);

}

uint64_t __62__PencilHandwritingEducationElementViewController_showPlayer___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
}

- (void)setReplayButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;
  char v15;

  v4 = a4;
  v5 = a3;
  -[PencilHandwritingEducationElementViewController replayButton](self, "replayButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isHidden") != v5)
  {
    if (objc_msgSend(v6, "isHidden"))
    {
      objc_msgSend(v6, "setAlpha:", 0.0);
      objc_msgSend(v6, "setHidden:", 0);
    }
    if (v4)
      v7 = 0.25;
    else
      v7 = 0.0;
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__PencilHandwritingEducationElementViewController_setReplayButtonHidden_animated___block_invoke;
    v13[3] = &unk_24F4E5160;
    v14 = v6;
    v15 = v5;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __82__PencilHandwritingEducationElementViewController_setReplayButtonHidden_animated___block_invoke_2;
    v10[3] = &unk_24F4E5A18;
    v11 = v14;
    v12 = v5;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v13, v10, v7);

  }
}

uint64_t __82__PencilHandwritingEducationElementViewController_setReplayButtonHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __82__PencilHandwritingEducationElementViewController_setReplayButtonHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)playerItemDidFinish:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__PencilHandwritingEducationElementViewController_playerItemDidFinish___block_invoke;
  block[3] = &unk_24F4E50A0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __71__PencilHandwritingEducationElementViewController_playerItemDidFinish___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setReplayButtonHidden:animated:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "clearButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)applicationWillResignActive:(id)a3
{
  id v4;

  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden", a3))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;

  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden", a3))
  {
    -[PencilHandwritingEducationElementViewController player](self, "player");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "play");

  }
}

- (void)canvasViewDidBeginUsingTool:(id)a3
{
  -[PencilHandwritingEducationElementViewController setReplayButtonHidden:animated:](self, "setReplayButtonHidden:animated:", 1, 1);
  if (!-[PencilHandwritingEducationElementViewController isPlayerHidden](self, "isPlayerHidden"))
  {
    -[PencilHandwritingEducationElementViewController stopPlayer](self, "stopPlayer");
    -[PencilHandwritingEducationElementViewController hidePlayer:](self, "hidePlayer:", 0);
  }
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__PencilHandwritingEducationElementViewController_canvasViewDrawingDidChange___block_invoke;
  block[3] = &unk_24F4E50A0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __78__PencilHandwritingEducationElementViewController_canvasViewDrawingDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;
  objc_msgSend(*(id *)(a1 + 32), "clearButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

}

- (PencilHandwritingEducationElementViewControllerDelegate)delegate
{
  return (PencilHandwritingEducationElementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PencilHandwritingEducationElementData)elementData
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
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (TextLineLayer)textLineLayer
{
  return self->_textLineLayer;
}

- (void)setTextLineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textLineLayer, a3);
}

- (CALayer)canvasMaskLayer
{
  return self->_canvasMaskLayer;
}

- (void)setCanvasMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_canvasMaskLayer, a3);
}

- (BOOL)didEnableAutoRefine
{
  return self->_didEnableAutoRefine;
}

- (void)setDidEnableAutoRefine:(BOOL)a3
{
  self->_didEnableAutoRefine = a3;
}

- (UIButton)replayButton
{
  return self->_replayButton;
}

- (void)setReplayButton:(id)a3
{
  objc_storeStrong((id *)&self->_replayButton, a3);
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);
  objc_storeStrong((id *)&self->_canvasMaskLayer, 0);
  objc_storeStrong((id *)&self->_textLineLayer, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_elementData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
