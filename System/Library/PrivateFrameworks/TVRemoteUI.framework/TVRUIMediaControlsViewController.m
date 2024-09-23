@implementation TVRUIMediaControlsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIMediaControlsViewController;
  -[TVRUIMediaControlsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[TVRUIMediaControlsViewController _createButtons](self, "_createButtons");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[TVRUIMediaControlsViewController _setupTipsControllerIfNeeded](self, "_setupTipsControllerIfNeeded");
}

- (void)_createButtons
{
  TVRUIButton *v3;
  void *v4;
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
  TVRUICaptionsButton *v16;
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
  TVRUIButton *v27;
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
  TVRUIButton *v49;
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
  uint64_t v60;
  void *v61;
  TVRUIButton *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  NSObject *v71;
  uint64_t v72;
  TVRUIChannelButton *v73;
  void *v74;
  TVRUIChannelButton *v75;
  TVRUIChannelButton *channelButton;
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
  NSArray *v88;
  NSArray *buttons;
  id v90;
  void *v91;
  UIStackView *v92;
  UIStackView *buttonStackView;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
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
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[16];
  _BYTE v189[128];
  _QWORD v190[9];

  v190[7] = *MEMORY[0x24BDAC8D0];
  v3 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 6, 1, 1);
  -[TVRUIMediaControlsViewController setSkipForwardButton:](self, "setSkipForwardButton:", v3);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableHighlightEffect:", 1);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", 0);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 0.0);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__skipForwardTapped_);
  objc_msgSend(v12, "setCancelsTouchesInView:", 0);
  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v12;
  objc_msgSend(v13, "addGestureRecognizer:", v12);

  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__skipForwardLongPress_);
  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)v14;
  objc_msgSend(v15, "addGestureRecognizer:", v14);

  v16 = -[TVRUICaptionsButton initWithCaptionsEnabled:buttonLocation:]([TVRUICaptionsButton alloc], "initWithCaptionsEnabled:buttonLocation:", 0, 1);
  -[TVRUIMediaControlsViewController setCaptionsButton:](self, "setCaptionsButton:", v16);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisableHighlightEffect:", 1);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBorderColor:", 0);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderWidth:", 0.0);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 1);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__captionsTapped_);
  objc_msgSend(v25, "setCancelsTouchesInView:", 0);
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v25;
  objc_msgSend(v26, "addGestureRecognizer:", v25);

  v27 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 9992, 1, 1);
  -[TVRUIMediaControlsViewController setInfoButton:](self, "setInfoButton:", v27);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDisableHighlightEffect:", 1);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBorderColor:", 0);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBorderWidth:", 0.0);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", 1);

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel__infoButtonTapped_, 64);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE250], 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImage:forState:", v37, 0);
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "primaryTextAndGlyphColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTintColor:", v40);

  objc_msgSend(v38, "setOverrideUserInterfaceStyle:", 2);
  -[TVRUIMediaControlsViewController _overflowButtonMenu](self, "_overflowButtonMenu");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setMenu:", v41);

  objc_msgSend(v38, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v38, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[TVRUIMediaControlsViewController setOverflowButton:](self, "setOverflowButton:", v38);
  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBorderColor:", 0);

  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBorderWidth:", 0.0);

  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", 1);

  v49 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 7, 1, 1);
  -[TVRUIMediaControlsViewController setSkipBackwardButton:](self, "setSkipBackwardButton:", v49);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDisableHighlightEffect:", 1);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBorderColor:", 0);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setBorderWidth:", 0.0);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setHidden:", 1);

  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__skipBackwardTapped_);
  objc_msgSend(v58, "setCancelsTouchesInView:", 0);
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v58;
  objc_msgSend(v59, "addGestureRecognizer:", v58);

  v60 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__skipBackwardLongPress_);
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = (void *)v60;
  objc_msgSend(v61, "addGestureRecognizer:", v60);

  v62 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", 28, 0, 1);
  -[TVRUIMediaControlsViewController setGuideButton:](self, "setGuideButton:", v62);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 1);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addTarget:action:forControlEvents:", self, sel__buttonReleased_, 448);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPageButtonText"), &stru_24DE30718, CFSTR("Localizable"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = -[TVRUIStyleProvider maxPagingTitleLength](self->_styleProvider, "maxPagingTitleLength");
  if (objc_msgSend(v69, "length") > v70)
  {
    _TVRUIViewControllerLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
      -[TVRUIButtonPanelView initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:].cold.1((uint64_t)v69, v70, v71);

    objc_msgSend(v69, "substringWithRange:", 0, 4);
    v72 = objc_claimAutoreleasedReturnValue();

    v69 = (void *)v72;
  }
  v73 = [TVRUIChannelButton alloc];
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v69;
  v75 = -[TVRUIChannelButton initWithTitle:styleProvider:](v73, "initWithTitle:styleProvider:", v69, v74);
  channelButton = self->_channelButton;
  self->_channelButton = v75;

  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIChannelButton setButtonEventDelegate:](self->_channelButton, "setButtonEventDelegate:", v77);

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setAlpha:", 0.0);

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setHidden:", 1);

  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v81;
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v82;
  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v83;
  -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v84;
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v85;
  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v86;
  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v190[6] = v87;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v190, 7);
  v88 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttons = self->_buttons;
  self->_buttons = v88;

  v90 = objc_alloc(MEMORY[0x24BEBD978]);
  -[TVRUIMediaControlsViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "frame");
  v92 = (UIStackView *)objc_msgSend(v90, "initWithFrame:");
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v92;

  -[UIStackView setDistribution:](self->_buttonStackView, "setDistribution:", 4);
  -[UIStackView setAlignment:](self->_buttonStackView, "setAlignment:", 3);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TVRUIMediaControlsViewController view](self, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addSubview:", self->_buttonStackView);

  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  -[TVRUIMediaControlsViewController buttons](self, "buttons");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v185;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v185 != v98)
          objc_enumerationMutation(v95);
        v100 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v99);
        -[TVRUIMediaControlsViewController buttonStackView](self, "buttonStackView");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "addArrangedSubview:", v100);

        ++v99;
      }
      while (v97 != v99);
      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
    }
    while (v97);
  }

  v149 = (void *)MEMORY[0x24BDD1628];
  -[TVRUIMediaControlsViewController buttonStackView](self, "buttonStackView");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "leadingAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController view](self, "view");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "leadingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "constraintEqualToAnchor:constant:", v174, 10.0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v188[0] = v173;
  -[TVRUIMediaControlsViewController buttonStackView](self, "buttonStackView");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "trailingAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController view](self, "view");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "trailingAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToAnchor:constant:", v169, -10.0);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v188[1] = v168;
  -[TVRUIMediaControlsViewController buttonStackView](self, "buttonStackView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "topAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController view](self, "view");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "topAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToAnchor:", v164);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v188[2] = v163;
  -[TVRUIMediaControlsViewController buttonStackView](self, "buttonStackView");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "bottomAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController view](self, "view");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "bottomAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:", v159);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v188[3] = v158;
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "widthAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "mediaControlsButtonSize");
  objc_msgSend(v155, "constraintEqualToConstant:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v188[4] = v154;
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "heightAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "mediaControlsButtonSize");
  objc_msgSend(v151, "constraintEqualToConstant:", v102);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v188[5] = v150;
  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "widthAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "mediaControlsButtonSize");
  objc_msgSend(v146, "constraintEqualToConstant:");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v188[6] = v145;
  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "heightAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "mediaControlsButtonSize");
  objc_msgSend(v142, "constraintEqualToConstant:", v103);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v188[7] = v141;
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "widthAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "captionButtonSize");
  objc_msgSend(v138, "constraintEqualToConstant:");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v188[8] = v137;
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "heightAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "captionButtonSize");
  objc_msgSend(v134, "constraintEqualToConstant:", v104);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v188[9] = v133;
  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "widthAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "mediaControlsButtonSize");
  objc_msgSend(v130, "constraintEqualToConstant:");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v188[10] = v129;
  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "heightAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "mediaControlsButtonSize");
  objc_msgSend(v126, "constraintEqualToConstant:", v105);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v188[11] = v125;
  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "widthAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "mediaControlsButtonSize");
  objc_msgSend(v122, "constraintEqualToConstant:");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v188[12] = v121;
  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "heightAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "mediaControlsButtonSize");
  objc_msgSend(v118, "constraintEqualToConstant:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v188[13] = v107;
  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "widthAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "mediaControlsButtonSize");
  objc_msgSend(v109, "constraintEqualToConstant:");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v188[14] = v111;
  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "heightAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController styleProvider](self, "styleProvider");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "mediaControlsButtonSize");
  objc_msgSend(v113, "constraintEqualToConstant:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v188[15] = v116;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v188, 16);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "activateConstraints:", v117);

}

- (id)_overflowButtonMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBD528];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke;
  v9[3] = &unk_24DE2D1F8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v3, "elementWithUncachedProvider:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD748];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
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
  id *location;
  id *locationa;
  char v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v24 = objc_msgSend(WeakRetained, "_captionsButtonIsVisible");
    objc_msgSend(v5, "captionsButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "captionsEnabled");

    objc_msgSend(v5, "infoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabled");

    objc_msgSend(v5, "styleProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconForButtonType:", 9992);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "captionsButtonIcon:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TVRUIViewInfo"), &stru_24DE30718, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_2;
    v29[3] = &unk_24DE2C440;
    location = &v30;
    objc_copyWeak(&v30, (id *)(a1 + 40));
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, v26, 0, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v9 & 1) == 0)
      objc_msgSend(v15, "setAttributes:", 1, &v30);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v7)
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TVRUIDisableCaptions"), &stru_24DE30718, CFSTR("Localizable"));
    else
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TVRUIEnableCaptions"), &stru_24DE30718, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BEBD388];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_3;
    v27[3] = &unk_24DE2C440;
    objc_copyWeak(&v28, (id *)(a1 + 40));
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v17, v25, 0, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v24 & 1) == 0)
      objc_msgSend(v19, "setAttributes:", 1);
    v31[0] = v20;
    v31[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2, location);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v21);

    objc_destroyWeak(&v28);
    objc_destroyWeak(locationa);

  }
  else
  {
    v3[2](v3, (void *)MEMORY[0x24BDBD1A8]);
  }

}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_infoButtonTapped:", 0);

}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_captionsTapped:", 0);

}

- (void)setAvailableButtons:(unint64_t)a3 enabledButtons:(unint64_t)a4
{
  unint64_t v7;
  _QWORD v8[5];

  if (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") != a3)
  {
    -[TVRUIMediaControlsViewController setAvailableButtons:](self, "setAvailableButtons:", a3);
    -[TVRUIMediaControlsViewController setEnabledButtons:](self, "setEnabledButtons:", a4);
    v7 = -[TVRUIMediaControlsViewController availableButtons](self, "availableButtons");
    if (a3 || !v7)
    {
      -[TVRUIMediaControlsViewController _updateButtonAvailability](self, "_updateButtonAvailability");
      -[TVRUIMediaControlsViewController _updateButtonVisibilityWithCompletionHandler:](self, "_updateButtonVisibilityWithCompletionHandler:", 0);
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __71__TVRUIMediaControlsViewController_setAvailableButtons_enabledButtons___block_invoke;
      v8[3] = &unk_24DE2C198;
      v8[4] = self;
      -[TVRUIMediaControlsViewController _updateButtonVisibilityWithCompletionHandler:](self, "_updateButtonVisibilityWithCompletionHandler:", v8);
    }
  }
}

uint64_t __71__TVRUIMediaControlsViewController_setAvailableButtons_enabledButtons___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonAvailability");
}

- (void)_updateInfoTipVisibility
{
  id v3;

  if (-[TVRUIMediaControlsViewController enabled](self, "enabled")
    && -[TVRUIMediaControlsViewController isInfoButtonAvailable](self, "isInfoButtonAvailable")
    && (-[TVRUIMediaControlsViewController enabledButtons](self, "enabledButtons") & 8) != 0)
  {
    -[TVRUIMediaControlsViewController infoTipManager](self, "infoTipManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activate");
  }
  else
  {
    -[TVRUIMediaControlsViewController infoTipManager](self, "infoTipManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate:completion:", 1, 0);
  }

}

- (BOOL)_captionsButtonIsVisible
{
  return (-[TVRUIMediaControlsViewController enabledButtons](self, "enabledButtons") >> 1) & 1;
}

- (BOOL)_shouldShowOverflowButton
{
  return -[TVRUIMediaControlsViewController _enabledButtonCount](self, "_enabledButtonCount") >= 5
      && -[TVRUIMediaControlsViewController isInfoButtonAvailable](self, "isInfoButtonAvailable");
}

- (void)_setupTipsControllerIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  TVRUITipManager *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[TVRUIMediaControlsViewController infoTipManager](self, "infoTipManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _TVRUITipsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Creating Info Tip Manager for: %@", (uint8_t *)&v8, 0xCu);

    }
    v7 = -[TVRUITipManager initWithTipSourceViewProvider:tipType:]([TVRUITipManager alloc], "initWithTipSourceViewProvider:tipType:", self, 0);
    -[TVRUIMediaControlsViewController setInfoTipManager:](self, "setInfoTipManager:", v7);

  }
}

- (void)updateButton:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  if ((-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") & a3) != 0)
  {
    if (v4)
      v7 = -[TVRUIMediaControlsViewController enabledButtons](self, "enabledButtons") | a3;
    else
      v7 = -[TVRUIMediaControlsViewController enabledButtons](self, "enabledButtons") & ~a3;
    -[TVRUIMediaControlsViewController setEnabledButtons:](self, "setEnabledButtons:", v7);
    -[TVRUIMediaControlsViewController _updateButtonVisibilityWithCompletionHandler:](self, "_updateButtonVisibilityWithCompletionHandler:", 0);
  }
}

- (BOOL)isChannelButtonExpanded
{
  void *v2;
  char v3;

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (void)updateCaptionState:(BOOL)a3 buttonDisabled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCaptionsEnabled:", v5);

  -[TVRUIMediaControlsViewController updateButton:enabled:](self, "updateButton:enabled:", 2, !v4);
  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v5;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "enableCaptions %{BOOL}d, buttonDisabled: %{BOOL}d", (uint8_t *)v9, 0xEu);
  }

}

- (void)updatePlaybackRate:(id)a3
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(a3, "doubleValue");
  if (!a3
    || ((v6 = fabs(v5 + -1.0), v7 = fabs(v5), v6 >= 0.00000011920929) ? (v8 = v7 < 0.00000011920929) : (v8 = 1), v8))
  {
    -[TVRUIMediaControlsViewController setWantsFastForwardButton:](self, "setWantsFastForwardButton:", 0);
    -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateButtonType:", 6);

    -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v12 = 7;
  }
  else
  {
    -[TVRUIMediaControlsViewController setWantsFastForwardButton:](self, "setWantsFastForwardButton:", 1, v7);
    -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateButtonType:", 9995);

    -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v12 = 9996;
  }
  objc_msgSend(v11, "_updateButtonType:", v12);

}

- (void)collapseChannelButton
{
  id v2;

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapse");

}

- (BOOL)isInfoButtonAvailable
{
  return (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") >> 3) & 1;
}

- (void)_updateButtonAvailability
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v3 = (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") & 1) == 0;
  -[TVRUIMediaControlsViewController skipBackwardButton](self, "skipBackwardButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[TVRUIMediaControlsViewController skipForwardButton](self, "skipForwardButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") & 2) == 0;
  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  v8 = (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") & 4) == 0;
  -[TVRUIMediaControlsViewController guideButton](self, "guideButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8);

  v11 = -[TVRUIMediaControlsViewController isInfoButtonAvailable](self, "isInfoButtonAvailable") ^ 1;
  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

  if (-[TVRUIMediaControlsViewController _shouldShowOverflowButton](self, "_shouldShowOverflowButton"))
  {
    -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v16 = 0;
  }
  else
  {
    -[TVRUIMediaControlsViewController overflowButton](self, "overflowButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v16 = 1;
  }
  objc_msgSend(v15, "setHidden:", v16);

}

- (unint64_t)_enabledButtonCount
{
  uint64_t v3;
  uint64_t i;

  v3 = 0;
  for (i = 0; i != 32; ++i)
    v3 += (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") >> i) & 1;
  return (-[TVRUIMediaControlsViewController availableButtons](self, "availableButtons") & 1) + v3;
}

- (void)_updateButtonVisibilityWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = -[TVRUIMediaControlsViewController enabled](self, "enabled") ^ 1;
  -[TVRUIMediaControlsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  v7 = -[TVRUIMediaControlsViewController enabled](self, "enabled");
  -[TVRUIMediaControlsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", v7);

  v9 = (void *)MEMORY[0x24BEBDB00];
  v12 = v4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke;
  v13[3] = &unk_24DE2C198;
  v13[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_24DE2D220;
  v11[4] = self;
  v10 = v4;
  objc_msgSend(v9, "animateWithDuration:animations:completion:", v13, v11, 0.2);

}

void __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  int v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;

  v3 = objc_msgSend(*(id *)(a1 + 32), "enabledButtons");
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      v4 = 0;
      v5 = 1.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "disabledButtonAlpha");
      v5 = v6;
      v4 = 1;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "skipBackwardButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  if (v4)
  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      v8 = 0;
      v9 = 1.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "disabledButtonAlpha");
      v9 = v10;
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "skipForwardButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  if (v8)
  v12 = objc_msgSend(*(id *)(a1 + 32), "availableButtons");
  v13 = objc_msgSend(*(id *)(a1 + 32), "enabledButtons");
  if ((v13 & 2) != 0)
    v14 = objc_msgSend(*(id *)(a1 + 32), "enabled");
  else
    v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "captionsButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v14);

  if (objc_msgSend(*(id *)(a1 + 32), "enabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "captionsButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEnabled");

    if ((v17 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "captionsButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCaptionsEnabled:", 0);

    }
  }
  if ((v13 & 2) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      LODWORD(v19) = 0;
      v20 = 0;
      v21 = 1.0;
      goto LABEL_27;
    }
  }
  else if ((v12 & 2) == 0)
  {
    LODWORD(v19) = 0;
    v20 = 0;
    v21 = 0.0;
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "styleProvider");
  v12 = objc_claimAutoreleasedReturnValue();
  v19 = (v13 >> 1) & 1;
  v20 = (v13 & 2) == 0;
  objc_msgSend((id)v12, "disabledButtonAlpha");
  v21 = v22;
LABEL_27:
  objc_msgSend(*(id *)(a1 + 32), "captionsButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v21);

  if (v20)
  if ((_DWORD)v19)

  v24 = objc_msgSend(*(id *)(a1 + 32), "enabledButtons");
  if ((v24 & 4) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      v25 = 0;
      v26 = 1.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "disabledButtonAlpha");
      v26 = v27;
      v25 = 1;
    }
  }
  else
  {
    v25 = 0;
    v26 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "guideButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", v26);

  if (v25)
  if ((v24 & 4) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      v29 = 0;
      v30 = 1.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24, "disabledButtonAlpha");
      v30 = v31;
      v29 = 1;
    }
  }
  else
  {
    v29 = 0;
    v30 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "channelButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlpha:", v30);

  if (v29)
  v33 = objc_msgSend(*(id *)(a1 + 32), "availableButtons");
  v34 = objc_msgSend(*(id *)(a1 + 32), "enabledButtons");
  if ((v34 & 8) != 0)
  {
    v33 = objc_msgSend(*(id *)(a1 + 32), "enabled");
    objc_msgSend(*(id *)(a1 + 32), "infoButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setEnabled:", v33);

    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      LODWORD(v36) = 0;
      v37 = 0;
      v38 = 1.0;
      goto LABEL_51;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "infoButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEnabled:", 0);

    if ((v33 & 8) == 0)
    {
      LODWORD(v36) = 0;
      v37 = 0;
      v38 = 0.0;
      goto LABEL_51;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "styleProvider");
  v33 = objc_claimAutoreleasedReturnValue();
  v36 = (v34 >> 3) & 1;
  v37 = (v34 & 8) == 0;
  objc_msgSend((id)v33, "disabledButtonAlpha");
  v38 = v40;
LABEL_51:
  objc_msgSend(*(id *)(a1 + 32), "infoButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAlpha:", v38);

  if (v37)
  if ((_DWORD)v36)

  v42 = objc_msgSend(*(id *)(a1 + 32), "_shouldShowOverflowButton");
  objc_msgSend(*(id *)(a1 + 32), "overflowButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEnabled:", v42);

  if ((_DWORD)v42)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
    {
      LODWORD(v42) = 0;
      v44 = 1.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "disabledButtonAlpha");
      v44 = v45;
      LODWORD(v42) = 1;
    }
  }
  else
  {
    v44 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "overflowButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAlpha:", v44);

  if ((_DWORD)v42)
}

uint64_t __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateInfoTipVisibility");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_skipForwardTapped:(id)a3
{
  uint64_t v4;

  if (-[TVRUIMediaControlsViewController wantsFastForwardButton](self, "wantsFastForwardButton", a3))
    v4 = 15;
  else
    v4 = 6;
  -[TVRUIMediaControlsViewController _sendButtonTapped:](self, "_sendButtonTapped:", v4);
}

- (void)_fastForwardTapped:(id)a3
{
  -[TVRUIMediaControlsViewController _sendButtonTapped:](self, "_sendButtonTapped:", 15);
}

- (void)_skipForwardLongPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[TVRUIMediaControlsViewController _sendButtonPressed:](self, "_sendButtonPressed:", 15);
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    -[TVRUIMediaControlsViewController _sendButtonReleased:](self, "_sendButtonReleased:", 15);
  }

}

- (void)_infoButtonTapped:(id)a3
{
  -[TVRUIMediaControlsViewController _sendButtonTapped:](self, "_sendButtonTapped:", 9992);
}

- (void)_skipBackwardTapped:(id)a3
{
  uint64_t v4;

  if (-[TVRUIMediaControlsViewController wantsFastForwardButton](self, "wantsFastForwardButton", a3))
    v4 = 14;
  else
    v4 = 7;
  -[TVRUIMediaControlsViewController _sendButtonTapped:](self, "_sendButtonTapped:", v4);
}

- (void)_skipBackwardLongPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[TVRUIMediaControlsViewController _sendButtonPressed:](self, "_sendButtonPressed:", 14);
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    -[TVRUIMediaControlsViewController _sendButtonReleased:](self, "_sendButtonReleased:", 14);
  }

}

- (void)_captionsTapped:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  _QWORD v7[5];
  char v8;

  -[TVRUIMediaControlsViewController captionsButton](self, "captionsButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "captionsEnabled");

  if (v5)
    v6 = 18;
  else
    v6 = 17;
  -[TVRUIMediaControlsViewController _sendButtonTapped:](self, "_sendButtonTapped:", v6);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TVRUIMediaControlsViewController__captionsTapped___block_invoke;
  v7[3] = &unk_24DE2D248;
  v7[4] = self;
  v8 = v5;
  objc_msgSend(MEMORY[0x24BDE57D8], "bs_performAfterSynchronizedCommit:", v7);
}

void __52__TVRUIMediaControlsViewController__captionsTapped___block_invoke(uint64_t a1)
{
  _BOOL8 v1;
  id v2;

  v1 = *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(*(id *)(a1 + 32), "captionsButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaptionsEnabled:", v1);

}

- (void)_sendButtonTapped:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 0, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_sendButtonPressed:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_sendButtonReleased:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_buttonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_buttonReleased:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIMediaControlsViewController buttonActionsDelegate](self, "buttonActionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("enabled");
    if (self->_enabled)
      v7 = CFSTR("enabled");
    else
      v7 = CFSTR("disabled");
    if (!v3)
      v6 = CFSTR("disabled");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Setting media controls from %@ to %@", (uint8_t *)&v8, 0x16u);
  }

  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[TVRUIMediaControlsViewController _updateButtonAvailability](self, "_updateButtonAvailability");
    -[TVRUIMediaControlsViewController _updateButtonVisibilityWithCompletionHandler:](self, "_updateButtonVisibilityWithCompletionHandler:", 0);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_channelUpButtonView
{
  void *v2;
  void *v3;

  -[TVRUIMediaControlsViewController channelButton](self, "channelButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_channelUpButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIView)tipSourceView
{
  void *v2;
  void *v3;

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGRect)tipSourceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TVRUIMediaControlsViewController infoButton](self, "infoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)permittedArrowDirections
{
  return 2;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)buttonActionsDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonActionsDelegate);
}

- (void)setButtonActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonActionsDelegate, a3);
}

- (unint64_t)availableButtons
{
  return self->_availableButtons;
}

- (void)setAvailableButtons:(unint64_t)a3
{
  self->_availableButtons = a3;
}

- (unint64_t)enabledButtons
{
  return self->_enabledButtons;
}

- (void)setEnabledButtons:(unint64_t)a3
{
  self->_enabledButtons = a3;
}

- (TVRUIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipForwardButton, a3);
}

- (TVRUIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipBackwardButton, a3);
}

- (TVRUICaptionsButton)captionsButton
{
  return self->_captionsButton;
}

- (void)setCaptionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_captionsButton, a3);
}

- (TVRUIButton)guideButton
{
  return self->_guideButton;
}

- (void)setGuideButton:(id)a3
{
  objc_storeStrong((id *)&self->_guideButton, a3);
}

- (TVRUIChannelButton)channelButton
{
  return self->_channelButton;
}

- (void)setChannelButton:(id)a3
{
  objc_storeStrong((id *)&self->_channelButton, a3);
}

- (TVRUIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (UIButton)overflowButton
{
  return self->_overflowButton;
}

- (void)setOverflowButton:(id)a3
{
  objc_storeStrong((id *)&self->_overflowButton, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (BOOL)wantsFastForwardButton
{
  return self->_wantsFastForwardButton;
}

- (void)setWantsFastForwardButton:(BOOL)a3
{
  self->_wantsFastForwardButton = a3;
}

- (TVRUITipManager)infoTipManager
{
  return self->_infoTipManager;
}

- (void)setInfoTipManager:(id)a3
{
  objc_storeStrong((id *)&self->_infoTipManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoTipManager, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_overflowButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_channelButton, 0);
  objc_storeStrong((id *)&self->_guideButton, 0);
  objc_storeStrong((id *)&self->_captionsButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end
