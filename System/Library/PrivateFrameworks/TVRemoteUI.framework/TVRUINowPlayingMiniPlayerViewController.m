@implementation TVRUINowPlayingMiniPlayerViewController

- (TVRUINowPlayingMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TVRUINowPlayingMiniPlayerViewController *v4;
  TVRUIDarkStyleProvider *v5;
  TVRUIStyleProvider *styleProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  v4 = -[TVRUINowPlayingMiniPlayerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

    -[TVRUINowPlayingMiniPlayerViewController _setupSystemMonitor](v4, "_setupSystemMonitor");
  }
  return v4;
}

- (void)_setupSystemMonitor
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  uint64_t v6;
  CUSystemMonitor *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x24BE29840]);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v3;

  objc_initWeak(&location, self);
  v5 = self->_systemMonitor;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke;
  v10[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v11, &location);
  -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v10);
  v7 = self->_systemMonitor;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke_2;
  v8[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v9, &location);
  -[CUSystemMonitor activateWithCompletion:](v7, "activateWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "onScreenLockChanged");
    WeakRetained = v2;
  }

}

void __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _TVRUINowPlayingLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "onScreenLockChanged");

}

- (void)onScreenLockChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _TVRUINowPlayingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUINowPlayingMiniPlayerViewController systemMonitor](self, "systemMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "screenLocked");
    v6 = CFSTR("unlocked");
    if (v5)
      v6 = CFSTR("locked");
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Updating actionButton menu because screen is now %@", (uint8_t *)&v9, 0xCu);

  }
  -[TVRUINowPlayingMiniPlayerViewController actionButtonMenu](self, "actionButtonMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v7);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  -[TVRUINowPlayingMiniPlayerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TVRUINowPlayingMiniPlayerViewController configureHierarchy](self, "configureHierarchy");
}

+ (double)minimizedPlayerHeight
{
  return 88.0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  -[TVRUINowPlayingMiniPlayerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController updateFromNowPlayingInfo:](self, "updateFromNowPlayingInfo:", v4);

}

- (void)configureHierarchy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
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
  id v44;
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
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  void *v178;
  id v179;
  void *v180;
  _QWORD v181[4];
  id v182;
  id location;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  uint64_t v188;
  _QWORD v189[19];
  _QWORD v190[29];
  _QWORD v191[5];
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1D8], 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:", v3);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v171);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", &stru_24DE30718, v5, 0, &__block_literal_global_18);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v169, v170);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setTintColor:", v6);

  objc_msgSend(v178, "setOverrideUserInterfaceStyle:", 2);
  -[TVRUINowPlayingMiniPlayerViewController actionButtonMenu](self, "actionButtonMenu");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setMenu:", v168);
  objc_msgSend(v178, "setShowsMenuAsPrimaryAction:", 1);
  v7 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v7, "setContentMode:", 1);
  objc_msgSend(v7, "_setContinuousCornerRadius:", 8.0);
  v180 = v7;
  objc_msgSend(v7, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v167);
  objc_msgSend(v9, "_setContinuousCornerRadius:", 8.0);
  v173 = v9;
  objc_msgSend(v9, "setClipsToBounds:", 1);
  v10 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setContentMode:", 2);
  objc_msgSend(v10, "_setContinuousCornerRadius:", 8.0);
  v174 = v10;
  objc_msgSend(v10, "setClipsToBounds:", 1);
  v179 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  v176 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v176, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1E0], 1024);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "setFont:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "setTextColor:", v12);

  objc_msgSend(v176, "setNumberOfLines:", 2);
  objc_msgSend(v176, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v176, "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v176, "setContentHuggingPriority:forAxis:", 1, v13);
  objc_msgSend(v179, "addSubview:", v176);
  v175 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v175, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE200], 1280);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setFont:", v14);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setTextColor:", v15);

  objc_msgSend(v175, "setNumberOfLines:", 2);
  objc_msgSend(v175, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v175, "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v16) = 1148846080;
  objc_msgSend(v175, "setContentHuggingPriority:forAxis:", 1, v16);
  objc_msgSend(v179, "addSubview:", v175);
  -[TVRUINowPlayingMiniPlayerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v191[0] = v174;
  v191[1] = v173;
  v191[2] = v180;
  v191[3] = v179;
  v191[4] = v178;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v191, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v184, v192, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v185;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v185 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
        objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v17, "addSubview:", v22);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v184, v192, 16);
    }
    while (v19);
  }

  objc_msgSend(v17, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 0.0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1132068864;
  objc_msgSend(v172, "setPriority:", v24);
  objc_msgSend(v174, "leadingAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "leadingAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToAnchor:", v163);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v161;
  objc_msgSend(v174, "trailingAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "trailingAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "constraintEqualToAnchor:", v159);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v155;
  objc_msgSend(v174, "topAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "topAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToAnchor:", v151);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v149;
  objc_msgSend(v174, "bottomAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "bottomAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:", v145);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v143;
  objc_msgSend(v173, "leadingAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "leadingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintEqualToAnchor:", v139);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v137;
  objc_msgSend(v173, "trailingAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "trailingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintEqualToAnchor:", v133);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v131;
  objc_msgSend(v173, "topAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v127);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v190[6] = v125;
  objc_msgSend(v173, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v121);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v190[7] = v119;
  objc_msgSend(v180, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:constant:", v115, 20.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v190[8] = v113;
  objc_msgSend(v180, "centerYAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v109);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v190[9] = v107;
  objc_msgSend(v180, "heightAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToConstant:", 66.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v190[10] = v103;
  objc_msgSend(v180, "widthAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "heightAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:multiplier:", v99, 1.77777778);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v190[11] = v97;
  objc_msgSend(v178, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v93, -20.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v190[12] = v91;
  objc_msgSend(v178, "centerYAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v87);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v190[13] = v85;
  objc_msgSend(v178, "widthAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToConstant:", 30.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v190[14] = v81;
  objc_msgSend(v178, "heightAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "widthAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v190[15] = v75;
  objc_msgSend(v17, "heightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 16.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v190[16] = v71;
  objc_msgSend(v17, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v190[17] = v68;
  v190[18] = v172;
  objc_msgSend(v179, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 12.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v190[19] = v65;
  objc_msgSend(v179, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "imageView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v190[20] = v61;
  objc_msgSend(v179, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v190[21] = v58;
  objc_msgSend(v176, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v190[22] = v55;
  objc_msgSend(v176, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v190[23] = v52;
  objc_msgSend(v176, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v190[24] = v49;
  objc_msgSend(v175, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v190[25] = v46;
  objc_msgSend(v175, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v190[26] = v26;
  objc_msgSend(v175, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v190[27] = v29;
  objc_msgSend(v175, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v190[28] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v190, 29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController setStandardLayoutConstraints:](self, "setStandardLayoutConstraints:", v33);

  objc_msgSend(v180, "topAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v164);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v162;
  objc_msgSend(v180, "leadingAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:constant:", v158, 20.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v156;
  objc_msgSend(v180, "heightAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToConstant:", 66.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v152;
  objc_msgSend(v180, "widthAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "heightAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "constraintEqualToAnchor:multiplier:", v148, 1.77777778);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v189[3] = v146;
  objc_msgSend(v178, "trailingAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v142, -20.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v189[4] = v140;
  objc_msgSend(v178, "centerYAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "centerYAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "constraintEqualToAnchor:", v136);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v189[5] = v134;
  objc_msgSend(v178, "widthAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToConstant:", 30.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v189[6] = v130;
  objc_msgSend(v178, "heightAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "widthAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v126);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v189[7] = v124;
  objc_msgSend(v179, "topAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "bottomAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:constant:", v120, 2.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v189[8] = v118;
  objc_msgSend(v179, "leadingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:constant:", v114, 12.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v189[9] = v112;
  objc_msgSend(v179, "trailingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:constant:", v108, -10.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v189[10] = v106;
  objc_msgSend(v179, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v102);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v189[11] = v100;
  objc_msgSend(v176, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v96);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v189[12] = v94;
  objc_msgSend(v176, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v90);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v189[13] = v88;
  objc_msgSend(v176, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v84);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v189[14] = v82;
  objc_msgSend(v175, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v78, 2.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v189[15] = v76;
  objc_msgSend(v175, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v189[16] = v35;
  objc_msgSend(v175, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v189[17] = v38;
  objc_msgSend(v175, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v189[18] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v189, 19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController setStackedTextLayoutConstraints:](self, "setStackedTextLayoutConstraints:", v42);

  -[TVRUINowPlayingMiniPlayerViewController setImageView:](self, "setImageView:", v180);
  -[TVRUINowPlayingMiniPlayerViewController setTitleLabel:](self, "setTitleLabel:", v176);
  -[TVRUINowPlayingMiniPlayerViewController setSecondaryLabel:](self, "setSecondaryLabel:", v175);
  -[TVRUINowPlayingMiniPlayerViewController setActionButton:](self, "setActionButton:", v178);
  -[TVRUINowPlayingMiniPlayerViewController setNarrowAspectImageView:](self, "setNarrowAspectImageView:", v174);
  -[TVRUINowPlayingMiniPlayerViewController setNarrowAspectImageVisualEffectView:](self, "setNarrowAspectImageVisualEffectView:", v173);
  objc_initWeak(&location, self);
  v188 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v188, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v181[0] = MEMORY[0x24BDAC760];
  v181[1] = 3221225472;
  v181[2] = __61__TVRUINowPlayingMiniPlayerViewController_configureHierarchy__block_invoke_2;
  v181[3] = &unk_24DE2C468;
  objc_copyWeak(&v182, &location);
  v44 = (id)-[TVRUINowPlayingMiniPlayerViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v43, v181);

  -[TVRUINowPlayingMiniPlayerViewController _updateContraintsForStackedLayout:](self, "_updateContraintsForStackedLayout:", -[TVRUINowPlayingMiniPlayerViewController _currentTraitsSizeCategoryRequiresStackedLayout](self, "_currentTraitsSizeCategoryRequiresStackedLayout"));
  objc_destroyWeak(&v182);
  objc_destroyWeak(&location);

}

void __61__TVRUINowPlayingMiniPlayerViewController_configureHierarchy__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsUpdateConstraints");

    WeakRetained = v3;
  }

}

- (void)updateViewConstraints
{
  _BOOL8 v3;
  objc_super v4;

  v3 = -[TVRUINowPlayingMiniPlayerViewController _currentTraitsSizeCategoryRequiresStackedLayout](self, "_currentTraitsSizeCategoryRequiresStackedLayout");
  if (v3 != -[TVRUINowPlayingMiniPlayerViewController _isCurrentlyStackedLayout](self, "_isCurrentlyStackedLayout"))
    -[TVRUINowPlayingMiniPlayerViewController _updateContraintsForStackedLayout:](self, "_updateContraintsForStackedLayout:", v3);
  v4.receiver = self;
  v4.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  -[TVRUINowPlayingMiniPlayerViewController updateViewConstraints](&v4, sel_updateViewConstraints);
}

- (id)actionButtonMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id location;
  _QWORD v76[4];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.up.right.square"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController urlForProductPageKind:](self, "urlForProductPageKind:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController urlForProductPageKind:](self, "urlForProductPageKind:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController urlForProductPageKind:](self, "urlForProductPageKind:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoEpisode"), &stru_24DE30718, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke;
  v72[3] = &unk_24DE2CD00;
  objc_copyWeak(&v74, &location);
  v46 = v3;
  v73 = v46;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v54, 0, v72);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoShow"), &stru_24DE30718, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v9;
  v69[1] = 3221225472;
  v69[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_2;
  v69[3] = &unk_24DE2CD00;
  objc_copyWeak(&v71, &location);
  v45 = v4;
  v70 = v45;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, v54, 0, v69);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoMovie"), &stru_24DE30718, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v9;
  v66[1] = 3221225472;
  v66[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_3;
  v66[3] = &unk_24DE2CD00;
  objc_copyWeak(&v68, &location);
  v16 = v5;
  v67 = v16;
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v54, 0, v66);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoSportingEvent"), &stru_24DE30718, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v9;
  v63[1] = 3221225472;
  v63[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_4;
  v63[3] = &unk_24DE2CD00;
  objc_copyWeak(&v65, &location);
  v44 = v16;
  v64 = v44;
  objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v19, v54, 0, v63);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TVRUIShareEpisode"), &stru_24DE30718, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v9;
  v61[1] = 3221225472;
  v61[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_5;
  v61[3] = &unk_24DE2C440;
  objc_copyWeak(&v62, &location);
  objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v22, v53, 0, v61);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TVRUIShareShow"), &stru_24DE30718, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v9;
  v59[1] = 3221225472;
  v59[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_6;
  v59[3] = &unk_24DE2C440;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v25, v53, 0, v59);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TVRUIShareMovie"), &stru_24DE30718, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v9;
  v57[1] = 3221225472;
  v57[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_7;
  v57[3] = &unk_24DE2C440;
  objc_copyWeak(&v58, &location);
  objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v28, v53, 0, v57);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("TVRUIShareSportingEvent"), &stru_24DE30718, CFSTR("Localizable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v9;
  v55[1] = 3221225472;
  v55[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_8;
  v55[3] = &unk_24DE2C440;
  objc_copyWeak(&v56, &location);
  objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", v32, v53, 0, v55);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "metadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v35, "kind");
  switch(v36)
  {
    case 1:
      v79[0] = v50;
      v79[1] = v29;
      v37 = v79;
      break;
    case 2:
      -[TVRUINowPlayingMiniPlayerViewController systemMonitor](self, "systemMonitor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "screenLocked");

      if (!v39)
      {
        v76[0] = v52;
        v76[1] = v51;
        v37 = v76;
        v40 = 4;
        v76[2] = v48;
        v76[3] = v47;
        goto LABEL_9;
      }
      v77[0] = v52;
      v77[1] = v51;
      v37 = v77;
      break;
    case 4:
      v78[0] = v49;
      v78[1] = v33;
      v37 = v78;
      break;
    default:
      v41 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_11;
  }
  v40 = 2;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);

  return v42;
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "openURL:", *(_QWORD *)(a1 + 32));

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "openURL:", *(_QWORD *)(a1 + 32));

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "openURL:", *(_QWORD *)(a1 + 32));

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "openURL:", *(_QWORD *)(a1 + 32));

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shareEpisode");

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shareShow");

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sharePrimary");

}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sharePrimary");

}

- (void)setNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  TVRCNowPlayingInfo *nowPlayingInfo;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo metadata](self->_nowPlayingInfo, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canonicalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[TVRUINowPlayingMiniPlayerViewController setCanonicalIDOfReplacedPlaceholderImage:](self, "setCanonicalIDOfReplacedPlaceholderImage:", 0);
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = (TVRCNowPlayingInfo *)v4;
  v11 = v4;

  -[TVRUINowPlayingMiniPlayerViewController updateFromNowPlayingInfo:](self, "updateFromNowPlayingInfo:", v11);
}

- (void)updateFromNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  double v35;
  double v36;
  void *v37;
  void *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "tvrui_hasUnknownCanonicalID");
    if (objc_msgSend(v5, "kind") == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TVRUISeasonEpisodeTitleBrief"), &stru_24DE30718, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tvrui_localizedTitleWithFormatString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUINowPlayingMiniPlayerViewController titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      objc_msgSend(v5, "tvrui_secondaryTitle");
    }
    else
    {
      -[TVRUINowPlayingMiniPlayerViewController titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", 0);

      objc_msgSend(v5, "title");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingMiniPlayerViewController secondaryLabel](self, "secondaryLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(v4, "tvrui_artworkImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingMiniPlayerViewController imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v14);

    objc_msgSend(v14, "size");
    v18 = v16 * v17 <= 0.0 || v16 >= v17;
    -[TVRUINowPlayingMiniPlayerViewController narrowAspectImageVisualEffectView](self, "narrowAspectImageVisualEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", v18);

    if (v18)
      v20 = 0;
    else
      v20 = v14;
    -[TVRUINowPlayingMiniPlayerViewController narrowAspectImageView](self, "narrowAspectImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v20);

    -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", v6);

    -[TVRUINowPlayingMiniPlayerViewController actionButtonMenu](self, "actionButtonMenu");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMenu:", v23);

    v25 = objc_msgSend(v4, "tvrui_mediaIsStopped");
    if (v25)
    {
      -[TVRUINowPlayingMiniPlayerViewController styleProvider](self, "styleProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "inactiveMediaTextColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[TVRUINowPlayingMiniPlayerViewController titleLabel](self, "titleLabel", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v28;
    -[TVRUINowPlayingMiniPlayerViewController secondaryLabel](self, "secondaryLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "setTextColor:", v27);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v32);
    }

    if (v25)
    {
      -[TVRUINowPlayingMiniPlayerViewController styleProvider](self, "styleProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "inactiveMediaImageViewAlpha");
      v36 = v35;
    }
    else
    {
      v36 = 1.0;
    }
    -[TVRUINowPlayingMiniPlayerViewController imageView](self, "imageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAlpha:", v36);

    if (v25)
    objc_msgSend(v4, "imageDataIsPlaceholder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");

    if (v39)
      -[TVRUINowPlayingMiniPlayerViewController _requestImageIfNeededForNowPlayingInfo:](self, "_requestImageIfNeededForNowPlayingInfo:", v4);

  }
}

- (void)openProductPageForKind:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TVRUINowPlayingMiniPlayerViewController urlForProductPageKind:](self, "urlForProductPageKind:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[TVRUINowPlayingMiniPlayerViewController openURL:](self, "openURL:", v4);
    v4 = v5;
  }

}

- (id)urlForProductPageKind:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (a3 == 1 || a3 == 3)
    {
      objc_msgSend(v5, "productPageURL");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a3 == 2)
    {
      objc_msgSend(v5, "showProductPageURL");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (void *)v6;
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (void)openURL:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TVRUINowPlayingMiniPlayerViewController sharingProvider](self, "sharingProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:", v4);

  }
}

- (void)shareEpisode
{
  TVRUINowPlayingInfoActivityItem *v3;
  void *v4;
  void *v5;
  void *v6;
  TVRUINowPlayingInfoActivityItem *v7;

  v3 = [TVRUINowPlayingInfoActivityItem alloc];
  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRUINowPlayingInfoActivityItem initWithNowPlayingInfo:shareShow:](v3, "initWithNowPlayingInfo:shareShow:", v4, 0);

  -[TVRUINowPlayingMiniPlayerViewController sharingProvider](self, "sharingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareItem:presentingViewController:sourceView:", v7, self, v6);

}

- (void)shareShow
{
  TVRUINowPlayingInfoActivityItem *v3;
  void *v4;
  void *v5;
  void *v6;
  TVRUINowPlayingInfoActivityItem *v7;

  v3 = [TVRUINowPlayingInfoActivityItem alloc];
  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRUINowPlayingInfoActivityItem initWithNowPlayingInfo:shareShow:](v3, "initWithNowPlayingInfo:shareShow:", v4, 1);

  -[TVRUINowPlayingMiniPlayerViewController sharingProvider](self, "sharingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareItem:presentingViewController:sourceView:", v7, self, v6);

}

- (void)sharePrimary
{
  TVRUINowPlayingInfoActivityItem *v3;
  void *v4;
  void *v5;
  void *v6;
  TVRUINowPlayingInfoActivityItem *v7;

  v3 = [TVRUINowPlayingInfoActivityItem alloc];
  -[TVRUINowPlayingMiniPlayerViewController nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRUINowPlayingInfoActivityItem initWithNowPlayingInfo:shareShow:](v3, "initWithNowPlayingInfo:shareShow:", v4, 0);

  -[TVRUINowPlayingMiniPlayerViewController sharingProvider](self, "sharingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareItem:presentingViewController:sourceView:", v7, self, v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout
{
  void *v2;
  NSString *v3;

  -[TVRUINowPlayingMiniPlayerViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x24BEBE068]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_updateContraintsForStackedLayout:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD1628];
  if (a3)
  {
    -[TVRUINowPlayingMiniPlayerViewController stackedTextLayoutConstraints](self, "stackedTextLayoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v5);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingMiniPlayerViewController standardLayoutConstraints](self, "standardLayoutConstraints");
  }
  else
  {
    -[TVRUINowPlayingMiniPlayerViewController standardLayoutConstraints](self, "standardLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v7);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingMiniPlayerViewController stackedTextLayoutConstraints](self, "stackedTextLayoutConstraints");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");

}

- (BOOL)_isCurrentlyStackedLayout
{
  void *v2;
  void *v3;

  -[TVRUINowPlayingMiniPlayerViewController stackedTextLayoutConstraints](self, "stackedTextLayoutConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isActive");
  return (char)v2;
}

- (void)_requestImageIfNeededForNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "tvrui_effectiveCanonicalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageURLTemplate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[TVRUINowPlayingMiniPlayerViewController canonicalIDOfReplacedPlaceholderImage](self, "canonicalIDOfReplacedPlaceholderImage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v6, "isEqualToString:", v9);

        if ((v10 & 1) == 0)
        {
          -[TVRUINowPlayingMiniPlayerViewController canonicalIDOfCurrentlyRequestingImage](self, "canonicalIDOfCurrentlyRequestingImage");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11
            || (v12 = (void *)v11,
                -[TVRUINowPlayingMiniPlayerViewController canonicalIDOfCurrentlyRequestingImage](self, "canonicalIDOfCurrentlyRequestingImage"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v6, "isEqualToString:", v13), v13, v12, (v14 & 1) == 0))
          {
            -[TVRUINowPlayingMiniPlayerViewController setCanonicalIDOfCurrentlyRequestingImage:](self, "setCanonicalIDOfCurrentlyRequestingImage:", v6);
            objc_msgSend(MEMORY[0x24BEB40A0], "imageTemplateWithString:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "urlForSize:", 400.0, 225.0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            -[TVRUINowPlayingMiniPlayerViewController urlSession](self, "urlSession");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke;
            v19[3] = &unk_24DE2C2D8;
            objc_copyWeak(&v21, &location);
            v20 = v6;
            objc_msgSend(v17, "dataTaskWithURL:completionHandler:", v16, v19);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "resume");
            objc_destroyWeak(&v21);
            objc_destroyWeak(&location);

          }
        }
      }

    }
  }

}

void __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke_2;
  block[3] = &unk_24DE2D830;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", *(_QWORD *)(a1 + 32));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
    v3 = *(void **)(a1 + 40);
    objc_msgSend(WeakRetained, "canonicalIDOfCurrentlyRequestingImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if (v2 && v5)
    {
      objc_msgSend(WeakRetained, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v2);

      objc_msgSend(WeakRetained, "setCanonicalIDOfReplacedPlaceholderImage:", *(_QWORD *)(a1 + 40));
    }
    if (v5)
      objc_msgSend(WeakRetained, "setCanonicalIDOfCurrentlyRequestingImage:", 0);

  }
}

- (NSURLSession)urlSession
{
  NSURLSession *urlSession;
  void *v4;
  NSURLSession *v5;
  NSURLSession *v6;

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlSession;
    self->_urlSession = v5;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TVRUINowPlayingMiniPlayerViewController systemMonitor](self, "systemMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  -[TVRUINowPlayingMiniPlayerViewController dealloc](&v4, sel_dealloc);
}

- (TVRUISharingProviding)sharingProvider
{
  return (TVRUISharingProviding *)objc_loadWeakRetained((id *)&self->_sharingProvider);
}

- (void)setSharingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sharingProvider, a3);
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (id)updateTabsHandler
{
  return self->_updateTabsHandler;
}

- (void)setUpdateTabsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIVisualEffectView)narrowAspectImageVisualEffectView
{
  return self->_narrowAspectImageVisualEffectView;
}

- (void)setNarrowAspectImageVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_narrowAspectImageVisualEffectView, a3);
}

- (UIImageView)narrowAspectImageView
{
  return self->_narrowAspectImageView;
}

- (void)setNarrowAspectImageView:(id)a3
{
  objc_storeStrong((id *)&self->_narrowAspectImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_standardLayoutConstraints, a3);
}

- (NSArray)stackedTextLayoutConstraints
{
  return self->_stackedTextLayoutConstraints;
}

- (void)setStackedTextLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackedTextLayoutConstraints, a3);
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSString)canonicalIDOfCurrentlyRequestingImage
{
  return self->_canonicalIDOfCurrentlyRequestingImage;
}

- (void)setCanonicalIDOfCurrentlyRequestingImage:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalIDOfCurrentlyRequestingImage, a3);
}

- (NSString)canonicalIDOfReplacedPlaceholderImage
{
  return self->_canonicalIDOfReplacedPlaceholderImage;
}

- (void)setCanonicalIDOfReplacedPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalIDOfReplacedPlaceholderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalIDOfReplacedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_canonicalIDOfCurrentlyRequestingImage, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_stackedTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_narrowAspectImageView, 0);
  objc_storeStrong((id *)&self->_narrowAspectImageVisualEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_updateTabsHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_destroyWeak((id *)&self->_sharingProvider);
}

@end
