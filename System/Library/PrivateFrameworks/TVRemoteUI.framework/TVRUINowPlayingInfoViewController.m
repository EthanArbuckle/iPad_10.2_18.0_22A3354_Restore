@implementation TVRUINowPlayingInfoViewController

- (TVRUINowPlayingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TVRUINowPlayingInfoViewController *v4;
  TVRUIDarkStyleProvider *v5;
  TVRUIStyleProvider *styleProvider;
  TVREventHaptic *v7;
  TVREventHaptic *eventHaptic;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingInfoViewController;
  v4 = -[TVRUINowPlayingInfoViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

    v7 = objc_alloc_init(TVREventHaptic);
    eventHaptic = v4->_eventHaptic;
    v4->_eventHaptic = v7;

  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUINowPlayingInfoViewController;
  -[TVRUINowPlayingInfoViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TVRUINowPlayingInfoViewController configureHierarchy](self, "configureHierarchy");
}

- (void)configureHierarchy
{
  id v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  void *v38;
  double v39;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
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
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  id v185;
  void *v186;
  void *v187;
  id v188;
  void *v189;
  id v190;
  _QWORD v192[4];
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[4];
  id v203;
  _QWORD v204[4];
  id v205;
  id location;
  uint64_t v207;
  _QWORD v208[4];
  _QWORD v209[3];
  _QWORD v210[9];
  _QWORD v211[11];
  _QWORD v212[18];
  _QWORD v213[6];
  _BYTE v214[128];
  _QWORD v215[2];
  _BYTE v216[128];
  uint64_t v217;

  v217 = *MEMORY[0x24BDAC8D0];
  -[TVRUINowPlayingInfoViewController view](self, "view");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BEBD918]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v183 = v2;
  objc_msgSend(v182, "addSubview:", v2);
  objc_msgSend(MEMORY[0x24BEBD438], "grayButtonConfiguration");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRUIFromBeginning"), &stru_24DE30718, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setTitle:", v4);

  objc_msgSend(v181, "setTitleAlignment:", 2);
  objc_msgSend(v181, "setTitleTextAttributesTransformer:", &__block_literal_global_0);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("play.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setImage:", v5);

  objc_msgSend(v181, "setImagePadding:", 6.0);
  objc_msgSend(v181, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 8.0);

  objc_msgSend(v181, "setButtonSize:", 1);
  objc_msgSend(MEMORY[0x24BEBD438], "grayButtonConfiguration");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TVRUIDetails"), &stru_24DE30718, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setTitle:", v8);

  objc_msgSend(v180, "setTitleAlignment:", 2);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.up.forward.app.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setImage:", v9);

  objc_msgSend(v180, "setImagePadding:", 6.0);
  objc_msgSend(v180, "setTitleTextAttributesTransformer:", &__block_literal_global_20);
  objc_msgSend(v180, "background");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 8.0);

  objc_msgSend(v180, "setButtonSize:", 1);
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x24BEBD388];
  v204[0] = MEMORY[0x24BDAC760];
  v204[1] = 3221225472;
  v204[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_3;
  v204[3] = &unk_24DE2C440;
  objc_copyWeak(&v205, &location);
  objc_msgSend(v11, "actionWithHandler:", v204);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD388];
  v202[0] = MEMORY[0x24BDAC760];
  v202[1] = 3221225472;
  v202[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_4;
  v202[3] = &unk_24DE2C440;
  objc_copyWeak(&v203, &location);
  objc_msgSend(v12, "actionWithHandler:", v202);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  v184 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v13 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  v185 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v188 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v189 = v13;
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v181, v178);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v180, v177);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  v215[0] = v187;
  v215[1] = v186;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v215, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v198, v216, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v199;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v199 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTintColor:", v19);

        objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__animateButtonToHighlightState_, 1);
        objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__animateButtonFromHighlightState_, 448);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v198, v216, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE200], 1024);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setFont:", v20);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setTextColor:", v21);

  objc_msgSend(v189, "setEditable:", 0);
  objc_msgSend(v189, "textContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLineFragmentPadding:", 0.0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setFont:", v23);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setTextColor:", v24);

  objc_msgSend(v189, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setBackgroundColor:", v25);

  objc_msgSend(v189, "textContainerInset");
  objc_msgSend(v189, "setTextContainerInset:", 0.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1F0], 1024);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "setFont:", v27);
  objc_msgSend(v185, "setTextColor:", v26);
  objc_msgSend(v185, "setNumberOfLines:", 0);
  objc_msgSend(v188, "setFont:", v27);
  objc_msgSend(v188, "setTextColor:", v26);
  v176 = objc_retainAutorelease(v26);
  v28 = objc_msgSend(v176, "CGColor");
  objc_msgSend(v188, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBorderColor:", v28);

  objc_msgSend(v188, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBorderWidth:", 1.0);

  objc_msgSend(v188, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCornerRadius:", 4.0);

  objc_msgSend(v190, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v183, "addSubview:", v190);
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v213[0] = v184;
  v213[1] = v189;
  v213[2] = v185;
  v213[3] = v188;
  v213[4] = v187;
  v213[5] = v186;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v213, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v194, v214, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v195;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v195 != v34)
          objc_enumerationMutation(v32);
        v36 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * j);
        objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v190, "addSubview:", v36);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = v36;
          objc_msgSend(v37, "setAdjustsFontForContentSizeCategory:", 1);

        }
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v194, v214, 16);
    }
    while (v33);
  }

  objc_msgSend(v189, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 40.0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v39) = 1132068864;
  objc_msgSend(v179, "setPriority:", v39);
  v83 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v182, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "topAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v171);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = v166;
  objc_msgSend(v182, "bottomAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "bottomAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v158);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v212[1] = v154;
  objc_msgSend(v182, "leadingAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintEqualToAnchor:", v148);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v212[2] = v145;
  objc_msgSend(v182, "trailingAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "trailingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "constraintEqualToAnchor:", v139);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v212[3] = v136;
  objc_msgSend(v183, "topAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "topAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:", v130);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v212[4] = v127;
  objc_msgSend(v183, "bottomAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v121);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v212[5] = v118;
  objc_msgSend(v183, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v113);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v212[6] = v111;
  objc_msgSend(v183, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v107);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v212[7] = v105;
  objc_msgSend(v190, "widthAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "widthAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:constant:", v102, -40.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v212[8] = v101;
  objc_msgSend(v190, "centerXAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "centerXAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v212[9] = v98;
  objc_msgSend(v184, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, 10.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v212[10] = v95;
  objc_msgSend(v184, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, 10.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v212[11] = v92;
  objc_msgSend(v184, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v90, -10.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v212[12] = v89;
  objc_msgSend(v189, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 10.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v212[13] = v86;
  objc_msgSend(v189, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v212[14] = v41;
  objc_msgSend(v189, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v212[15] = v44;
  v212[16] = v179;
  objc_msgSend(v185, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v212[17] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v212, 18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "activateConstraints:", v48);

  objc_msgSend(v187, "topAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "bottomAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "constraintEqualToAnchor:constant:", v167, 20.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v163;
  objc_msgSend(v187, "leadingAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:constant:", v159, 10.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v152;
  objc_msgSend(v187, "trailingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "leadingAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v146, -10.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v211[2] = v143;
  objc_msgSend(v187, "heightAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintGreaterThanOrEqualToConstant:", 40.0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v211[3] = v137;
  objc_msgSend(v187, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v131, -30.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v211[4] = v128;
  objc_msgSend(v186, "topAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "bottomAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v122, 20.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v211[5] = v119;
  objc_msgSend(v186, "trailingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:constant:", v114, -10.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v211[6] = v112;
  objc_msgSend(v186, "heightAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintGreaterThanOrEqualToConstant:", 40.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v211[7] = v108;
  objc_msgSend(v186, "widthAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "widthAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v104);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v211[8] = v49;
  objc_msgSend(v186, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -30.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v211[9] = v52;
  objc_msgSend(v190, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v211[10] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v211, 11);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingInfoViewController setStandardLayoutConstraints:](self, "setStandardLayoutConstraints:", v56);

  objc_msgSend(v187, "topAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "bottomAnchor");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "constraintEqualToAnchor:constant:", v168, 20.0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v210[0] = v164;
  objc_msgSend(v187, "leadingAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:constant:", v156, 10.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v210[1] = v153;
  objc_msgSend(v187, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "constraintEqualToAnchor:constant:", v147, -10.0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v210[2] = v144;
  objc_msgSend(v187, "heightAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintGreaterThanOrEqualToConstant:", 40.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v210[3] = v138;
  objc_msgSend(v186, "topAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "bottomAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintEqualToAnchor:constant:", v132, 20.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v210[4] = v129;
  objc_msgSend(v186, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v123, 10.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v210[5] = v120;
  objc_msgSend(v186, "trailingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:constant:", v57, -10.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v210[6] = v58;
  objc_msgSend(v186, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintGreaterThanOrEqualToConstant:", 40.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v210[7] = v60;
  objc_msgSend(v186, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, -30.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v210[8] = v63;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v210, 9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingInfoViewController setStackedLayoutConstraints:](self, "setStackedLayoutConstraints:", v64);

  objc_msgSend(v185, "leadingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:constant:", v169, 10.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v209[0] = v65;
  objc_msgSend(v188, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v209[1] = v68;
  objc_msgSend(v188, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 10.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v209[2] = v71;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v209, 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingInfoViewController setSingleLineInfoLayoutConstraints:](self, "setSingleLineInfoLayoutConstraints:", v72);

  objc_msgSend(v185, "leadingAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "leadingAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "constraintEqualToAnchor:constant:", v170, 10.0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v208[0] = v165;
  objc_msgSend(v185, "trailingAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "trailingAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToAnchor:constant:", v157, -10.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v208[1] = v73;
  objc_msgSend(v188, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 10.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v208[2] = v76;
  objc_msgSend(v188, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v208[3] = v79;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v208, 4);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingInfoViewController setDoubleLineInfoLayoutConstraints:](self, "setDoubleLineInfoLayoutConstraints:", v80);

  -[TVRUINowPlayingInfoViewController setTitleLabel:](self, "setTitleLabel:", v184);
  -[TVRUINowPlayingInfoViewController setDetailsTextView:](self, "setDetailsTextView:", v189);
  -[TVRUINowPlayingInfoViewController setInfoLabel:](self, "setInfoLabel:", v185);
  -[TVRUINowPlayingInfoViewController setRatingsLabel:](self, "setRatingsLabel:", v188);
  -[TVRUINowPlayingInfoViewController setPlayFromStartButton:](self, "setPlayFromStartButton:", v187);
  -[TVRUINowPlayingInfoViewController setDetailsButton:](self, "setDetailsButton:", v186);
  -[TVRUINowPlayingInfoViewController setScrollView:](self, "setScrollView:", v183);
  -[TVRUINowPlayingInfoViewController setDetailsTextHeightConstraint:](self, "setDetailsTextHeightConstraint:", v179);
  v207 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v207, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = MEMORY[0x24BDAC760];
  v192[1] = 3221225472;
  v192[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_5;
  v192[3] = &unk_24DE2C468;
  objc_copyWeak(&v193, &location);
  v82 = (id)-[TVRUINowPlayingInfoViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v81, v192);

  -[TVRUINowPlayingInfoViewController _updateContraintsForStackedLayout:](self, "_updateContraintsForStackedLayout:", -[TVRUINowPlayingInfoViewController _currentTraitsSizeCategoryRequiresStackedLayout](self, "_currentTraitsSizeCategoryRequiresStackedLayout"));
  -[TVRUINowPlayingInfoViewController _updateConstraintsForInfoLineUsingDoubleLineLayout:](self, "_updateConstraintsForInfoLineUsingDoubleLineLayout:", -[TVRUINowPlayingInfoViewController _infoLineRequiresDoubleLayout](self, "_infoLineRequiresDoubleLayout"));
  objc_destroyWeak(&v193);

  objc_destroyWeak(&v203);
  objc_destroyWeak(&v205);
  objc_destroyWeak(&location);

}

id __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1F0], 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BEBB360]);

  return v2;
}

id __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1F0], 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BEBB360]);

  return v2;
}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "commandHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "_playHaptic");
      objc_msgSend(v4, "commandHandler");
      v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 7, MEMORY[0x24BDBD1B8]);

      WeakRetained = v4;
    }
  }

}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "openProductPage");
    WeakRetained = v2;
  }

}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_5(uint64_t a1)
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
  void *v4;
  double v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  objc_super v10;

  v3 = -[TVRUINowPlayingInfoViewController _currentTraitsSizeCategoryRequiresStackedLayout](self, "_currentTraitsSizeCategoryRequiresStackedLayout");
  if (v3 != -[TVRUINowPlayingInfoViewController _isCurrentlyStackedLayout](self, "_isCurrentlyStackedLayout"))
    -[TVRUINowPlayingInfoViewController _updateContraintsForStackedLayout:](self, "_updateContraintsForStackedLayout:", v3);
  -[TVRUINowPlayingInfoViewController detailsTextView](self, "detailsTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoview_computedHeight");
  v6 = v5;

  if (v6 > 0.0)
  {
    if (v3 && v6 > 250.0)
      v6 = 250.0;
    -[TVRUINowPlayingInfoViewController detailsTextHeightConstraint](self, "detailsTextHeightConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

  }
  v8 = -[TVRUINowPlayingInfoViewController _isCurrentlyDoubleInfoLineLayout](self, "_isCurrentlyDoubleInfoLineLayout");
  v9 = -[TVRUINowPlayingInfoViewController _infoLineRequiresDoubleLayout](self, "_infoLineRequiresDoubleLayout");
  if (v8 != v9)
    -[TVRUINowPlayingInfoViewController _updateConstraintsForInfoLineUsingDoubleLineLayout:](self, "_updateConstraintsForInfoLineUsingDoubleLineLayout:", v9);
  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingInfoViewController;
  -[TVRUINowPlayingInfoViewController updateViewConstraints](&v10, sel_updateViewConstraints);
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
    -[TVRUINowPlayingInfoViewController stackedLayoutConstraints](self, "stackedLayoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v5);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingInfoViewController standardLayoutConstraints](self, "standardLayoutConstraints");
  }
  else
  {
    -[TVRUINowPlayingInfoViewController standardLayoutConstraints](self, "standardLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v7);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingInfoViewController stackedLayoutConstraints](self, "stackedLayoutConstraints");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");

}

- (void)_updateConstraintsForInfoLineUsingDoubleLineLayout:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD1628];
  if (a3)
  {
    -[TVRUINowPlayingInfoViewController doubleLineInfoLayoutConstraints](self, "doubleLineInfoLayoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v5);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingInfoViewController singleLineInfoLayoutConstraints](self, "singleLineInfoLayoutConstraints");
  }
  else
  {
    -[TVRUINowPlayingInfoViewController singleLineInfoLayoutConstraints](self, "singleLineInfoLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v7);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[TVRUINowPlayingInfoViewController doubleLineInfoLayoutConstraints](self, "doubleLineInfoLayoutConstraints");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");

}

- (BOOL)_isCurrentlyStackedLayout
{
  void *v2;
  void *v3;

  -[TVRUINowPlayingInfoViewController stackedLayoutConstraints](self, "stackedLayoutConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isActive");
  return (char)v2;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
  v5 = a3;
  -[TVRUINowPlayingInfoViewController updateFromNowPlayingInfo:](self, "updateFromNowPlayingInfo:", v5);

}

- (void)updateFromNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  TVRUINowPlayingInfoViewController *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[128];
  _QWORD v57[5];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "kind") == 2)
      objc_msgSend(v6, "tvrui_secondaryTitle");
    else
      objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoViewController titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(v6, "extendedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoViewController detailsTextView](self, "detailsTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_msgSend(v6, "infoview_formattedInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoViewController infoLabel](self, "infoLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(v6, "ratingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    -[TVRUINowPlayingInfoViewController ratingsLabel](self, "ratingsLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "setHidden:", 0);

      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "ratingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@ "), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUINowPlayingInfoViewController ratingsLabel](self, "ratingsLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

    }
    else
    {
      objc_msgSend(v15, "setText:", 0);

      -[TVRUINowPlayingInfoViewController ratingsLabel](self, "ratingsLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidden:", 1);
    }

    -[TVRUINowPlayingInfoViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsUpdateConstraints");

  }
  v46 = v4;
  v22 = objc_msgSend(v4, "tvrui_mediaIsStopped");
  if (v22)
  {
    -[TVRUINowPlayingInfoViewController styleProvider](self, "styleProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inactiveMediaTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[TVRUINowPlayingInfoViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v25;
  -[TVRUINowPlayingInfoViewController detailsTextView](self, "detailsTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v26;
  -[TVRUINowPlayingInfoViewController ratingsLabel](self, "ratingsLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v27;
  -[TVRUINowPlayingInfoViewController playFromStartButton](self, "playFromStartButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v28;
  v45 = self;
  -[TVRUINowPlayingInfoViewController detailsButton](self, "detailsButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        v35 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(v35, "setTextColor:", v24);
        else
          objc_msgSend(v35, "setTintColor:", v24);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v32);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[TVRUINowPlayingInfoViewController infoLabel](v45, "infoLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v36;
  -[TVRUINowPlayingInfoViewController ratingsLabel](v45, "ratingsLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        if (v22)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "setTextColor:", v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setTextColor:", v44);

        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v40);
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

  -[TVRUINowPlayingInfoViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x24BEBE078]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_playHaptic
{
  id v2;

  -[TVRUINowPlayingInfoViewController eventHaptic](self, "eventHaptic");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playSelectionEventHaptic");

}

- (BOOL)_isCurrentlyDoubleInfoLineLayout
{
  void *v2;
  void *v3;

  -[TVRUINowPlayingInfoViewController doubleLineInfoLayoutConstraints](self, "doubleLineInfoLayoutConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isActive");
  return (char)v2;
}

- (BOOL)_infoLineRequiresDoubleLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  BOOL result;

  -[TVRUINowPlayingInfoViewController detailsTextView](self, "detailsTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  result = v5 != 0.0
        && (-[TVRUINowPlayingInfoViewController infoLabel](self, "infoLabel"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "sizeThatFits:", v5, 1.79769313e308),
            v8 = v7,
            v6,
            v8 != 0.0)
        && v8 / v5 > 0.8;
  return result;
}

- (void)openProductPage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TVRUINowPlayingInfoViewController nowPlayingInfo](self, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "productPageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TVRUINowPlayingInfoViewController sharingProvider](self, "sharingProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:", v4);

  }
}

- (void)_animateButtonToHighlightState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[TVRUINowPlayingInfoViewController setUserInteractionInProgress:](self, "setUserInteractionInProgress:", 1);
  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__TVRUINowPlayingInfoViewController__animateButtonToHighlightState___block_invoke;
  v7[3] = &unk_24DE2C198;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.2);

}

uint64_t __68__TVRUINowPlayingInfoViewController__animateButtonToHighlightState___block_invoke(uint64_t a1)
{
  CGAffineTransform v3;
  CGAffineTransform v4;

  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  v3 = v4;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v3);
}

- (void)_animateButtonFromHighlightState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[TVRUINowPlayingInfoViewController setUserInteractionInProgress:](self, "setUserInteractionInProgress:", 0);
  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__TVRUINowPlayingInfoViewController__animateButtonFromHighlightState___block_invoke;
  v7[3] = &unk_24DE2C198;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.2);

}

uint64_t __70__TVRUINowPlayingInfoViewController__animateButtonFromHighlightState___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (TVRUISharingProviding)sharingProvider
{
  return (TVRUISharingProviding *)objc_loadWeakRetained((id *)&self->_sharingProvider);
}

- (void)setSharingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sharingProvider, a3);
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)userInteractionInProgress
{
  return self->_userInteractionInProgress;
}

- (void)setUserInteractionInProgress:(BOOL)a3
{
  self->_userInteractionInProgress = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)detailsTextView
{
  return self->_detailsTextView;
}

- (void)setDetailsTextView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsTextView, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UILabel)ratingsLabel
{
  return self->_ratingsLabel;
}

- (void)setRatingsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ratingsLabel, a3);
}

- (UIButton)playFromStartButton
{
  return self->_playFromStartButton;
}

- (void)setPlayFromStartButton:(id)a3
{
  objc_storeStrong((id *)&self->_playFromStartButton, a3);
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (void)setDetailsButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailsButton, a3);
}

- (NSArray)stackedLayoutConstraints
{
  return self->_stackedLayoutConstraints;
}

- (void)setStackedLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, a3);
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_standardLayoutConstraints, a3);
}

- (NSArray)singleLineInfoLayoutConstraints
{
  return self->_singleLineInfoLayoutConstraints;
}

- (void)setSingleLineInfoLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_singleLineInfoLayoutConstraints, a3);
}

- (NSArray)doubleLineInfoLayoutConstraints
{
  return self->_doubleLineInfoLayoutConstraints;
}

- (void)setDoubleLineInfoLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_doubleLineInfoLayoutConstraints, a3);
}

- (NSLayoutConstraint)detailsTextHeightConstraint
{
  return self->_detailsTextHeightConstraint;
}

- (void)setDetailsTextHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailsTextHeightConstraint, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_detailsTextHeightConstraint, 0);
  objc_storeStrong((id *)&self->_doubleLineInfoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_singleLineInfoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_playFromStartButton, 0);
  objc_storeStrong((id *)&self->_ratingsLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_detailsTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_destroyWeak((id *)&self->_sharingProvider);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

@end
