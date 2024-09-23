@implementation TVRUIUpNextViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TVRUIUpNextViewController;
  -[TVRUIUpNextViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[TVRUIUpNextViewController _configureHierarchy](self, "_configureHierarchy");
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController setInfos:](self, "setInfos:", v4);

  -[TVRUIUpNextViewController _refreshUIAnimated:](self, "_refreshUIAnimated:", 0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __40__TVRUIUpNextViewController_viewDidLoad__block_invoke;
  v10 = &unk_24DE2C8F0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("TVRUIUpNextInfosDidChangeNotification"), 0, 0, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController setInfosDidChangeNotificationObserver:](self, "setInfosDidChangeNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __40__TVRUIUpNextViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__TVRUIUpNextViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_24DE2C198;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __40__TVRUIUpNextViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "upNextProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInfos:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_refreshUIAnimated:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRUIUpNextViewController;
  -[TVRUIUpNextViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController setDidAppearTimestamp:](self, "setDidAppearTimestamp:", v4);

  -[TVRUIUpNextViewController _updateEmptyStateAndActivityIndicatorForCurrentState](self, "_updateEmptyStateAndActivityIndicatorForCurrentState");
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasFetchedInfos");

  if ((v6 & 1) == 0)
  {
    v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__TVRUIUpNextViewController_viewWillAppear___block_invoke;
    block[3] = &unk_24DE2C198;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __44__TVRUIUpNextViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEmptyStateAndActivityIndicatorForCurrentState");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TVRUIUpNextViewController infosDidChangeNotificationObserver](self, "infosDidChangeNotificationObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextViewController infosDidChangeNotificationObserver](self, "infosDidChangeNotificationObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  -[TVRUIUpNextViewController refreshTimer](self, "refreshTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7.receiver = self;
  v7.super_class = (Class)TVRUIUpNextViewController;
  -[TVRUIUpNextViewController dealloc](&v7, sel_dealloc);
}

- (void)_configureHierarchy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  UICollectionViewDiffableDataSource *dataSource;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
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
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  TVREventHaptic *v71;
  TVREventHaptic *eventHaptic;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id obj;
  id v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  TVRUIUpNextViewController *v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  _QWORD v143[4];
  id v144;
  _QWORD v145[4];
  id v146;
  _QWORD v147[4];
  id v148;
  _QWORD aBlock[4];
  id v150;
  id location;
  uint64_t v152;
  _QWORD v153[10];
  _QWORD v154[10];
  _QWORD v155[2];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD450]);
  v130 = self;
  -[TVRUIUpNextViewController _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  obj = v5;
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setPrefetchingEnabled:", 0);
  objc_msgSend(v5, "setDelegate:", v130);
  objc_initWeak(&location, v130);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke;
  aBlock[3] = &unk_24DE2C918;
  objc_copyWeak(&v150, &location);
  v7 = _Block_copy(aBlock);
  v8 = (void *)MEMORY[0x24BEBD460];
  v9 = objc_opt_class();
  v147[0] = MEMORY[0x24BDAC760];
  v147[1] = 3221225472;
  v147[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_2;
  v147[3] = &unk_24DE2C940;
  v10 = v7;
  v148 = v10;
  objc_msgSend(v8, "registrationWithCellClass:configurationHandler:", v9, v147);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD460];
  v13 = objc_opt_class();
  v145[0] = MEMORY[0x24BDAC760];
  v145[1] = 3221225472;
  v145[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_3;
  v145[3] = &unk_24DE2C940;
  v76 = v10;
  v146 = v76;
  objc_msgSend(v12, "registrationWithCellClass:configurationHandler:", v13, v145);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBD460];
  v16 = objc_opt_class();
  v143[0] = MEMORY[0x24BDAC760];
  v143[1] = 3221225472;
  v143[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_4;
  v143[3] = &unk_24DE2C968;
  objc_copyWeak(&v144, &location);
  objc_msgSend(v15, "registrationWithCellClass:configurationHandler:", v16, v143);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BEBD480]);
  v139[0] = MEMORY[0x24BDAC760];
  v139[1] = 3221225472;
  v139[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_5;
  v139[3] = &unk_24DE2C990;
  v77 = v17;
  v140 = v77;
  v75 = v14;
  v141 = v75;
  v74 = v11;
  v142 = v74;
  v19 = objc_msgSend(v18, "initWithCollectionView:cellProvider:", obj, v139);
  dataSource = v130->_dataSource;
  v130->_dataSource = (UICollectionViewDiffableDataSource *)v19;

  -[TVRUIUpNextViewController view](v130, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", obj);
  v129 = v21;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "setHidden:", 1);
  objc_msgSend(v129, "addSubview:", v22);
  v122 = v22;
  v23 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "setHidden:", 1);
  v126 = v23;
  v24 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v24);
  v124 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v25 = *MEMORY[0x24BEBB5C0];
  v26 = *MEMORY[0x24BEBE078];
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE248], *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setFont:", v27);

  objc_msgSend(v124, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TVRUIUpNextEmptyTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setText:", v29);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setTextColor:", v30);

  v127 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE218], v25, 0, v26, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setFont:", v31);

  objc_msgSend(v127, "setTextAlignment:", 1);
  objc_msgSend(v127, "setNumberOfLines:", 2);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("TVRUIUpNextEmptySubheading"), &stru_24DE30718, CFSTR("Localizable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setText:", v33);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setTextColor:", v34);

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v155[0] = v124;
  v155[1] = v127;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v135, v156, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v136 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v39, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v24, "addSubview:", v39);
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v135, v156, 16);
    }
    while (v36);
  }

  v73 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v24, "centerXAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "centerXAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v118);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v116;
  objc_msgSend(v24, "centerYAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "centerYAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v112, -80.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v110;
  objc_msgSend(v24, "widthAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "widthAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v106, -40.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v104;
  objc_msgSend(v124, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v100);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v98;
  objc_msgSend(v124, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v94);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v154[4] = v92;
  objc_msgSend(v124, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v154[5] = v86;
  objc_msgSend(v127, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "bottomAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v82, 10.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v154[6] = v80;
  objc_msgSend(v127, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v154[7] = v41;
  objc_msgSend(v127, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v154[8] = v44;
  objc_msgSend(v127, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v154[9] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "activateConstraints:", v48);

  objc_msgSend(v129, "addSubview:", v126);
  v79 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v122, "centerYAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "centerYAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:constant:", v125, -80.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v121;
  objc_msgSend(v122, "centerXAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "centerXAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v115;
  objc_msgSend(v126, "topAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "topAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v111);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v153[2] = v109;
  objc_msgSend(v126, "leadingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v105);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v153[3] = v103;
  objc_msgSend(v126, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v99);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v153[4] = v97;
  objc_msgSend(v126, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "safeAreaLayoutGuide");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bottomAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v91);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v153[5] = v89;
  objc_msgSend(obj, "topAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v85);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v153[6] = v83;
  objc_msgSend(obj, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "safeAreaLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v153[7] = v51;
  objc_msgSend(obj, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v153[8] = v54;
  objc_msgSend(obj, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v153[9] = v57;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v153, 10);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "activateConstraints:", v58);

  objc_storeStrong((id *)&v130->_collectionView, obj);
  objc_storeStrong((id *)&v130->_activityIndicatorView, v122);
  objc_storeStrong((id *)&v130->_emptyStateView, v126);
  if (-[TVRUIUpNextViewController mode](v130, "mode") == 1)
  {
    -[TVRUIUpNextViewController setIsVisibleInParentUI:](v130, "setIsVisibleInParentUI:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextViewController view](v130, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setBackgroundColor:", v59);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("Up Next"), &stru_24DE30718, CFSTR("Localizable"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextViewController navigationItem](v130, "navigationItem");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setTitle:", v62);

    v64 = objc_alloc(MEMORY[0x24BEBD410]);
    v65 = (void *)MEMORY[0x24BEBD388];
    v133[0] = MEMORY[0x24BDAC760];
    v133[1] = 3221225472;
    v133[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_6;
    v133[3] = &unk_24DE2C440;
    objc_copyWeak(&v134, &location);
    objc_msgSend(v65, "actionWithHandler:", v133);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v64, "initWithBarButtonSystemItem:primaryAction:", 0, v66);
    -[TVRUIUpNextViewController navigationItem](v130, "navigationItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setRightBarButtonItem:", v67);

    objc_destroyWeak(&v134);
  }
  +[_TVRUIUpNextViewControllerCell setIsStackedLayout:](_TVRUIUpNextViewControllerCell, "setIsStackedLayout:", -[TVRUIUpNextViewController _currentTraitsSizeCategoryRequiresStackedLayout](v130, "_currentTraitsSizeCategoryRequiresStackedLayout"));
  v152 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v152, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = MEMORY[0x24BDAC760];
  v131[1] = 3221225472;
  v131[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_7;
  v131[3] = &unk_24DE2C468;
  objc_copyWeak(&v132, &location);
  v70 = (id)-[TVRUIUpNextViewController registerForTraitChanges:withHandler:](v130, "registerForTraitChanges:withHandler:", v69, v131);

  v71 = objc_alloc_init(TVREventHaptic);
  eventHaptic = v130->_eventHaptic;
  v130->_eventHaptic = v71;

  objc_destroyWeak(&v132);
  objc_destroyWeak(&v144);

  objc_destroyWeak(&v150);
  objc_destroyWeak(&location);

}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;
  id v16;

  v16 = a3;
  v7 = (id *)(a1 + 32);
  v8 = a4;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "infos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = objc_msgSend(v16, "item") != v13 - 1;
  }
  else
  {
    v14 = 1;
  }
  objc_msgSend(v9, "setShowsSeparator:", v14);
  v15 = objc_loadWeakRetained(v7);
  objc_msgSend(v9, "setDelegate:", v15);

  objc_msgSend(v9, "setUpNextInfo:", v8);
}

uint64_t __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "upNextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestMore");

  objc_msgSend(v5, "animate");
}

id __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "section") == 1)
  {
    objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", a1[4], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[_TVRUIUpNextViewControllerCell isStackedLayout](_TVRUIUpNextViewControllerCell, "isStackedLayout"))
    {
      v11 = a1[5];
    }
    else
    {
      v11 = a1[6];
    }
    objc_msgSend(v9, "upNextInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v11, v8, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    +[_TVRUIUpNextViewControllerCell setIsStackedLayout:](_TVRUIUpNextViewControllerCell, "setIsStackedLayout:", objc_msgSend(WeakRetained, "_currentTraitsSizeCategoryRequiresStackedLayout"));
    objc_msgSend(v5, "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "snapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applySnapshotUsingReloadData:", v3);

    WeakRetained = v5;
  }

}

- (id)_layout
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BEBD468]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__TVRUIUpNextViewController__layout__block_invoke;
  v5[3] = &unk_24DE2C9B8;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __36__TVRUIUpNextViewController__layout__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
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
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rowHeight");
  if (v4 == 0.0)
    v5 = 88.0;
  else
    v5 = v4;

  if (a2 == 1)
    v5 = 32.0;
  v6 = (void *)MEMORY[0x24BEBD328];
  objc_msgSend(MEMORY[0x24BEBD300], "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD300], "estimatedDimension:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithWidthDimension:heightDimension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD318], "itemWithLayoutSize:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD328];
  objc_msgSend(MEMORY[0x24BEBD300], "fractionalWidthDimension:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD300], "estimatedDimension:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD310];
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "verticalGroupWithLayoutSize:subitems:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD320], "sectionWithGroup:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterGroupSpacing:", 2.0);

  return v18;
}

- (void)_refreshAsNeededIfVisible
{
  id v3;

  if (-[TVRUIUpNextViewController isVisibleInParentUI](self, "isVisibleInParentUI"))
  {
    -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshIfNeeded");

  }
}

- (void)_refreshUIAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  char v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  TVRUIUpNextViewController *v55;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v52 = a3;
  v74 = *MEMORY[0x24BDAC8D0];
  -[TVRUIUpNextViewController _updateEmptyStateAndActivityIndicatorForCurrentState](self, "_updateEmptyStateAndActivityIndicatorForCurrentState");
  v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[TVRUIUpNextViewController infos](self, "infos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v67 != v8)
          objc_enumerationMutation(v5);
        +[_TVRUIUpNextItem itemWithUpNextInfo:](_TVRUIUpNextItem, "itemWithUpNextInfo:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIUpNextViewController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v13, "indexOfSectionIdentifier:", CFSTR("itemsSection")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v13, "itemIdentifiersInSectionWithIdentifier:", CFSTR("itemsSection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54 = v13;
  v55 = self;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v63 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v21, "upNextInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mediaInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v18);
  }
  v53 = v16;

  v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v11;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v59;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v59 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
        objc_msgSend(v29, "upNextInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "mediaInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v29, "upNextInfo");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timestamp");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "upNextInfo");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "timestamp");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v35)
          {
            v39 = objc_msgSend(v37, "isEqualToNumber:", v35);

            if ((v39 & 1) == 0)
              goto LABEL_26;
          }
          else
          {

            if (v38)
LABEL_26:
              objc_msgSend(v56, "addObject:", v29);
          }

        }
        ++v28;
      }
      while (v26 != v28);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      v26 = v40;
    }
    while (v40);
  }

  v41 = objc_alloc_init(MEMORY[0x24BEBD348]);
  objc_msgSend(v41, "appendSectionsWithIdentifiers:", &unk_24DE4DBF8);
  objc_msgSend(v41, "appendItemsWithIdentifiers:", obj);
  -[TVRUIUpNextViewController dataSource](v55, "dataSource");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "snapshot");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v41, "isEqual:", v43);

  objc_msgSend(v41, "reconfigureItemsWithIdentifiers:", v56);
  v45 = objc_msgSend(v56, "count");
  if (objc_msgSend(obj, "count"))
  {
    -[TVRUIUpNextViewController upNextProvider](v55, "upNextProvider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "hasMoreInfo");

    if (v47)
    {
      objc_msgSend(v41, "appendSectionsWithIdentifiers:", &unk_24DE4DC10);
      +[_TVRUIUpNextItem moreItem](_TVRUIUpNextItem, "moreItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "appendItemsWithIdentifiers:", v49);

    }
  }
  if (v45)
    v50 = 0;
  else
    v50 = v44;
  if ((v50 & 1) == 0)
  {
    -[TVRUIUpNextViewController dataSource](v55, "dataSource");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "applySnapshot:animatingDifferences:", v41, v52);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout
{
  void *v2;
  NSString *v3;

  -[TVRUIUpNextViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x24BEBE068]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_updateEmptyStateAndActivityIndicatorForCurrentState
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFetchedInfos");

  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[TVRUIUpNextViewController didAppearTimestamp](self, "didAppearTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = fabs(v9);

  if (v10 < 1.75)
    v11 = 1;
  else
    v11 = v4;
  -[TVRUIUpNextViewController activityIndicatorView](self, "activityIndicatorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
    objc_msgSend(v12, "stopAnimating");
  else
    objc_msgSend(v12, "startAnimating");

  if (v7)
    v14 = 1;
  else
    v14 = v4 ^ 1;
  -[TVRUIUpNextViewController activityIndicatorView](self, "activityIndicatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v11);

  -[TVRUIUpNextViewController emptyStateView](self, "emptyStateView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v14);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  block[3] = &unk_24DE2C830;
  v8 = v6;
  v29 = v8;
  v9 = v7;
  v30 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[TVRUIUpNextViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifierForIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "upNextInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "kind");
    objc_msgSend(v12, "actionURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BEB40B8];
    v24 = v8;
    if (v17)
    {
      objc_msgSend(v12, "actionURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playItemWithURL:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB40B8], "playItemWithMediaIdentifier:kind:", v15, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TVRUIUpNextViewController eventHaptic](self, "eventHaptic", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playSelectionEventHaptic");

    -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v26[3] = &unk_24DE2C9E0;
    v23 = v15;
    v27 = v23;
    objc_msgSend(v22, "playItem:completion:", v20, v26);

    if (-[TVRUIUpNextViewController mode](self, "mode") == 1)
      -[TVRUIUpNextViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

    v8 = v25;
  }

}

uint64_t __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _TVRUINowPlayingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_cold_1();

}

- (void)markItemAsWatched:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke;
  v8[3] = &unk_24DE2C9E0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "markAsWatchedWithMediaIdentifier:completion:", v7, v8);

}

void __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRUINowPlayingLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1();

  }
}

- (void)removeItemFromUpNext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "tvruiupnextvc_favoritesIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke;
  v7[3] = &unk_24DE2C9E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeItemWithMediaIdentifier:completion:", v6, v7);

}

void __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRUINowPlayingLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_cold_1();

  }
}

- (void)requestImageForInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchImageForUpNextInfo:completion:", v7, v6);

}

- (void)shareEpisodeForInfo:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  TVRUIUpNextActivityItem *v8;
  void *v9;
  void *v10;
  TVRUIUpNextActivityItem *v11;

  v6 = a4;
  v7 = a3;
  v8 = [TVRUIUpNextActivityItem alloc];
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TVRUIUpNextActivityItem initWithUpNextInfo:upNextProvider:shareShow:](v8, "initWithUpNextInfo:upNextProvider:shareShow:", v7, v9, 0);

  -[TVRUIUpNextViewController sharingProvider](self, "sharingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shareItem:presentingViewController:sourceView:", v11, self, v6);

}

- (void)shareShowForInfo:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  TVRUIUpNextActivityItem *v8;
  void *v9;
  void *v10;
  TVRUIUpNextActivityItem *v11;

  v6 = a4;
  v7 = a3;
  v8 = [TVRUIUpNextActivityItem alloc];
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TVRUIUpNextActivityItem initWithUpNextInfo:upNextProvider:shareShow:](v8, "initWithUpNextInfo:upNextProvider:shareShow:", v7, v9, 1);

  -[TVRUIUpNextViewController sharingProvider](self, "sharingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shareItem:presentingViewController:sourceView:", v11, self, v6);

}

- (void)sharePrimaryForInfo:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  TVRUIUpNextActivityItem *v8;
  void *v9;
  void *v10;
  TVRUIUpNextActivityItem *v11;

  v6 = a4;
  v7 = a3;
  v8 = [TVRUIUpNextActivityItem alloc];
  -[TVRUIUpNextViewController upNextProvider](self, "upNextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TVRUIUpNextActivityItem initWithUpNextInfo:upNextProvider:shareShow:](v8, "initWithUpNextInfo:upNextProvider:shareShow:", v7, v9, 0);

  -[TVRUIUpNextViewController sharingProvider](self, "sharingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shareItem:presentingViewController:sourceView:", v11, self, v6);

}

- (void)openURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVRUIUpNextViewController sharingProvider](self, "sharingProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:", v4);

}

- (TVRUISharingProviding)sharingProvider
{
  return (TVRUISharingProviding *)objc_loadWeakRetained((id *)&self->_sharingProvider);
}

- (void)setSharingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sharingProvider, a3);
}

- (TVRUIUpNextProviding)upNextProvider
{
  return (TVRUIUpNextProviding *)objc_loadWeakRetained((id *)&self->_upNextProvider);
}

- (void)setUpNextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_upNextProvider, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isVisibleInParentUI
{
  return self->_isVisibleInParentUI;
}

- (void)setIsVisibleInParentUI:(BOOL)a3
{
  self->_isVisibleInParentUI = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UIView)emptyStateView
{
  return self->_emptyStateView;
}

- (NSArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
  objc_storeStrong((id *)&self->_infos, a3);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSObject)infosDidChangeNotificationObserver
{
  return self->_infosDidChangeNotificationObserver;
}

- (void)setInfosDidChangeNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_infosDidChangeNotificationObserver, a3);
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimer, a3);
}

- (NSDate)didAppearTimestamp
{
  return self->_didAppearTimestamp;
}

- (void)setDidAppearTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_didAppearTimestamp, a3);
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_didAppearTimestamp, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_infosDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_upNextProvider);
  objc_destroyWeak((id *)&self->_sharingProvider);
}

@end
