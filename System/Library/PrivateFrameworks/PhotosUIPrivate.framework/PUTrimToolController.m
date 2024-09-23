@implementation PUTrimToolController

- (PUTrimToolController)initWithPlayerWrapper:(id)a3 playButtonEnabled:(BOOL)a4 slomoEnabled:(BOOL)a5 portraitVideoEnabled:(BOOL)a6
{
  id v11;
  PUTrimToolController *v12;
  PUTrimToolController *v13;
  uint64_t v14;
  PFCoalescer *updateVideoCoalescer;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUTrimToolController;
  v12 = -[PUTrimToolController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    v12->_playButtonEnabled = a4;
    objc_storeStrong((id *)&v12->_playerWrapper, a3);
    v13->_slomoEnabled = a5;
    v13->_isPortraitVideo = a6;
    v13->_currentlyInteractingElement = 0;
    objc_msgSend(MEMORY[0x1E0D71080], "setCoalescerWithLabel:target:queue:action:", CFSTR("PUTrimToolController._updateVideoCoalescer"), v13, MEMORY[0x1E0C80D38], &__block_literal_global_98944);
    v14 = objc_claimAutoreleasedReturnValue();
    updateVideoCoalescer = v13->_updateVideoCoalescer;
    v13->_updateVideoCoalescer = (PFCoalescer *)v14;

    -[PUTrimToolController px_enableExtendedTraitCollection](v13, "px_enableExtendedTraitCollection");
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[PUTrimToolController registerForTraitChanges:withAction:](v13, "registerForTraitChanges:withAction:", v16, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v13;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  -[PUTrimToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "PITrimAdjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v5, "PILivePhotoKeyFrameAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "containsObject:", v7))
    {
      objc_msgSend(v5, "PISlomoAdjustmentKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsObject:", v8);

      if ((v9 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[PUTrimToolController _updateScrubberTimes](self, "_updateScrubberTimes");
LABEL_6:

}

- (void)viewDidLoad
{
  PXLivePhotoTrimScrubberSpec *v3;
  PXLivePhotoTrimScrubberSpec *spec;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  PXLivePhotoTrimScrubberSpec *v9;
  void *v10;
  PXLivePhotoTrimScrubber *v11;
  PXLivePhotoTrimScrubber *trimScrubber;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PXLivePhotoTrimScrubber *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
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
  id v64;
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
  PXFocusTimelineView *v81;
  PXFocusTimelineView *focusTimelineView;
  void *v83;
  PXFocusTimelineAction *focusTimelineAction;
  double v85;
  double v86;
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
  UIView *v99;
  UIView *trimScrubberTimelineOverlayView;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  UIButton *v109;
  UIButton *trimScrubberTimelineOverlayButton;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
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
  uint64_t v139;
  UILabel *v140;
  UILabel *debugTimeCodeLabel;
  UILabel *v142;
  UILabel *debugPlayerTimeLabel;
  UILabel *v144;
  UILabel *debugOriginalTimeLabel;
  UILabel *v146;
  UILabel *debugTrimToolStateLabel;
  UILabel *v148;
  UILabel *debugTrimToolPlayheadStyleLabel;
  void *v150;
  UIView *v151;
  UIView *debugStartRectView;
  void *v153;
  UIView *v154;
  UIView *debugEndRectView;
  void *v156;
  void *v157;
  UIView *v158;
  UIView *debugStartOffsetView;
  void *v160;
  UIView *v161;
  UIView *debugEndOffsetView;
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
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  int v203;
  void *v204;
  void *v205;
  void *v206;
  PXLivePhotoTrimScrubber *v207;
  void *v208;
  objc_super v209;
  _QWORD v210[6];

  v210[4] = *MEMORY[0x1E0C80C00];
  v209.receiver = self;
  v209.super_class = (Class)PUTrimToolController;
  -[PUTrimToolController viewDidLoad](&v209, sel_viewDidLoad);
  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "setPlayerObserver:", self);
  v3 = (PXLivePhotoTrimScrubberSpec *)objc_alloc_init(MEMORY[0x1E0D7B588]);
  spec = self->_spec;
  self->_spec = v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoEditingAdjustmentsBarDisabledColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubberSpec setDisabledOverlayColor:](self->_spec, "setDisabledOverlayColor:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D7BB68]);
  v8 = objc_opt_class();
  v9 = self->_spec;
  -[PUTrimToolController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (PXLivePhotoTrimScrubber *)objc_msgSend(v7, "initWithFilmStripViewClass:spec:traitCollection:", v8, v9, v10);
  trimScrubber = self->_trimScrubber;
  self->_trimScrubber = v11;

  -[PXLivePhotoTrimScrubber setAllowZoom:](self->_trimScrubber, "setAllowZoom:", -[PUTrimToolController playButtonEnabled](self, "playButtonEnabled"));
  -[PXLivePhotoTrimScrubber setDelegate:](self->_trimScrubber, "setDelegate:", self);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "showVideoScrubberDebugOverlay");

  v203 = v14;
  -[PXLivePhotoTrimScrubber setShowVideoScrubberDebugOverlay:](self->_trimScrubber, "setShowVideoScrubberDebugOverlay:", v14);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = self->_trimScrubber;
  -[PXLivePhotoTrimScrubber setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v18);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", 5.0);

  objc_msgSend(v19, "setClipsToBounds:", 1);
  objc_msgSend(v15, "photoEditingTrimControllerBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v21);

  v22 = 0.0;
  objc_msgSend(v19, "setAlpha:", 0.0);
  objc_storeStrong((id *)&self->_auxilaryContainerView, v19);
  objc_msgSend(v16, "addSubview:", self->_auxilaryContainerView);
  v204 = (void *)v18;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v18);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", 5.0);

  objc_msgSend(v23, "setClipsToBounds:", 1);
  objc_msgSend(v15, "photoEditingTrimControllerBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v25);

  objc_storeStrong((id *)&self->_scrubberPlayButtonContainerView, v23);
  objc_msgSend(v16, "addSubview:", v23);
  objc_msgSend(v23, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v17);

  objc_msgSend(v23, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber topAnchor](v17, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  objc_msgSend(v23, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber bottomAnchor](v17, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  objc_msgSend(v23, "rightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber rightAnchor](v17, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  objc_msgSend(v23, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  objc_msgSend(v23, "rightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  objc_msgSend(v19, "leftAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  objc_msgSend(v19, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  if (self->_playButtonEnabled)
    v22 = *MEMORY[0x1E0D7C3D8];
  objc_msgSend(v19, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", v22);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v19, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = v16;
  objc_msgSend(v16, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  v206 = v19;
  objc_msgSend(v19, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 3.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  v207 = v17;
  if (self->_playButtonEnabled)
  {
    -[PUTrimToolController playPauseButton](self, "playPauseButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v56);

    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v23, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    objc_msgSend(v23, "leftAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leftAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 0.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setActive:", 1);

    v64 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v64, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToConstant:", 1.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setActive:", 1);

    objc_msgSend(v23, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addSubview:", v64);

    objc_msgSend(v64, "leftAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 47.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    objc_msgSend(v64, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setActive:", 1);

    objc_msgSend(v64, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBackgroundColor:", v77);

    -[PXLivePhotoTrimScrubber leftAnchor](v17, "leftAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "rightAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, 0.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", 1);

  }
  else
  {
    objc_msgSend(v23, "leftAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber leftAnchor](v17, "leftAnchor");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v64);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setActive:", 1);
  }

  if (-[PUTrimToolController isSlomoEnabled](self, "isSlomoEnabled"))
  {
    -[PUTrimToolController _updateSlomoViewAnimated:](self, "_updateSlomoViewAnimated:", 0);
  }
  else if (-[PUTrimToolController isPortraitVideo](self, "isPortraitVideo"))
  {
    v81 = (PXFocusTimelineView *)objc_alloc_init(MEMORY[0x1E0D7BB60]);
    focusTimelineView = self->_focusTimelineView;
    self->_focusTimelineView = v81;

    -[PXFocusTimelineView setClipsToBounds:](self->_focusTimelineView, "setClipsToBounds:", 1);
    -[PXFocusTimelineView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusTimelineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXFocusTimelineView setDelegate:](self->_focusTimelineView, "setDelegate:", self);
    objc_msgSend(v206, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addSubview:", self->_focusTimelineView);

    objc_msgSend(v206, "setAlpha:", 1.0);
    focusTimelineAction = self->_focusTimelineAction;
    self->_focusTimelineAction = 0;

    v85 = *MEMORY[0x1E0D7C3D0] * 0.5;
    if (self->_playButtonEnabled)
      v86 = 66.0;
    else
      v86 = 24.0;
    -[PXFocusTimelineView leftAnchor](self->_focusTimelineView, "leftAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "leftAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, v86 - v85);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setActive:", 1);

    -[PXFocusTimelineView rightAnchor](self->_focusTimelineView, "rightAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "rightAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, v85 + -18.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setActive:", 1);

    -[PXFocusTimelineView topAnchor](self->_focusTimelineView, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    -[PXFocusTimelineView bottomAnchor](self->_focusTimelineView, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setActive:", 1);

    v99 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    trimScrubberTimelineOverlayView = self->_trimScrubberTimelineOverlayView;
    self->_trimScrubberTimelineOverlayView = v99;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "colorWithAlphaComponent:", 0.6);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_trimScrubberTimelineOverlayView, "setBackgroundColor:", v102);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_trimScrubberTimelineOverlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](self->_trimScrubberTimelineOverlayView, "setHidden:", 1);
    -[UIView setAlpha:](self->_trimScrubberTimelineOverlayView, "setAlpha:", 0.0);
    -[PXLivePhotoTrimScrubber addSubview:](v17, "addSubview:", self->_trimScrubberTimelineOverlayView);
    v196 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](self->_trimScrubberTimelineOverlayView, "leadingAnchor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber leadingAnchor](v17, "leadingAnchor");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "constraintEqualToAnchor:", v200);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v210[0] = v199;
    -[UIView trailingAnchor](self->_trimScrubberTimelineOverlayView, "trailingAnchor");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber trailingAnchor](v17, "trailingAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "constraintEqualToAnchor:", v197);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v210[1] = v195;
    -[UIView topAnchor](self->_trimScrubberTimelineOverlayView, "topAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber topAnchor](v17, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "constraintEqualToAnchor:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v210[2] = v104;
    -[UIView bottomAnchor](self->_trimScrubberTimelineOverlayView, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber bottomAnchor](v17, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v210[3] = v107;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 4);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "activateConstraints:", v108);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v109 = (UIButton *)objc_claimAutoreleasedReturnValue();
    trimScrubberTimelineOverlayButton = self->_trimScrubberTimelineOverlayButton;
    self->_trimScrubberTimelineOverlayButton = v109;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "colorWithAlphaComponent:", 0.4);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](self->_trimScrubberTimelineOverlayButton, "setBackgroundColor:", v112);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_trimScrubberTimelineOverlayButton, "setTintColor:", v113);

    -[UIButton layer](self->_trimScrubberTimelineOverlayButton, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
    v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v116 = objc_msgSend(v115, "CGColor");
    -[UIButton layer](self->_trimScrubberTimelineOverlayButton, "layer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setBorderColor:", v116);

    -[UIButton layer](self->_trimScrubberTimelineOverlayButton, "layer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setBorderWidth:", 1.0);

    -[UIButton addTarget:action:forControlEvents:](self->_trimScrubberTimelineOverlayButton, "addTarget:action:forControlEvents:", self, sel__handleScrubberTimelineOverlayButton_, 64);
    -[UIView addSubview:](self->_trimScrubberTimelineOverlayView, "addSubview:", self->_trimScrubberTimelineOverlayButton);
  }
  v119 = objc_alloc_init(MEMORY[0x1E0D7B9B8]);
  objc_msgSend(v119, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v120 = v208;
  objc_msgSend(v208, "addSubview:", v119);
  objc_msgSend(v119, "leftAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "leftAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setActive:", 1);

  objc_msgSend(v119, "rightAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "rightAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setActive:", 1);

  objc_msgSend(v119, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "topAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setActive:", 1);

  objc_msgSend(v119, "heightAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToConstant:", 12.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setActive:", 1);

  objc_msgSend(v23, "topAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "bottomAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToAnchor:constant:", v133, 5.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setActive:", 1);

  v135 = (void *)objc_opt_new();
  v136 = (void *)objc_opt_new();
  -[PUTrimToolController setSnapStripSpec:](self, "setSnapStripSpec:", v136);

  -[PUTrimToolController snapStripSpec](self, "snapStripSpec");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setSpec:", v137);

  objc_msgSend(v135, "setTrimScrubber:", self->_trimScrubber);
  objc_msgSend(v135, "setSnapStripView:", v119);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setAllowStartEndTimeSnapIndicators:", objc_msgSend(v138, "loopBounceTrimAllowed"));

  -[PUTrimToolController setSnapStripController:](self, "setSnapStripController:", v135);
  if (v203)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedDigitSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1440]);
    v139 = objc_claimAutoreleasedReturnValue();
    v140 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugTimeCodeLabel = self->_debugTimeCodeLabel;
    self->_debugTimeCodeLabel = v140;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugTimeCodeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](self->_debugTimeCodeLabel, "setFont:", v139);
    v142 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugPlayerTimeLabel = self->_debugPlayerTimeLabel;
    self->_debugPlayerTimeLabel = v142;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugPlayerTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](self->_debugPlayerTimeLabel, "setFont:", v139);
    v144 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugOriginalTimeLabel = self->_debugOriginalTimeLabel;
    self->_debugOriginalTimeLabel = v144;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugOriginalTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](self->_debugOriginalTimeLabel, "setFont:", v139);
    v146 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugTrimToolStateLabel = self->_debugTrimToolStateLabel;
    self->_debugTrimToolStateLabel = v146;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugTrimToolStateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v202 = (void *)v139;
    -[UILabel setFont:](self->_debugTrimToolStateLabel, "setFont:", v139);
    v148 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugTrimToolPlayheadStyleLabel = self->_debugTrimToolPlayheadStyleLabel;
    self->_debugTrimToolPlayheadStyleLabel = v148;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugTrimToolPlayheadStyleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_debugTrimToolPlayheadStyleLabel, "setTextColor:", v150);

    -[UILabel setFont:](self->_debugTrimToolPlayheadStyleLabel, "setFont:", v139);
    v151 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    debugStartRectView = self->_debugStartRectView;
    self->_debugStartRectView = v151;

    objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_debugStartRectView, "setBackgroundColor:", v153);

    v154 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    debugEndRectView = self->_debugEndRectView;
    self->_debugEndRectView = v154;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "colorWithAlphaComponent:", 0.5);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_debugEndRectView, "setBackgroundColor:", v157);

    v158 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    debugStartOffsetView = self->_debugStartOffsetView;
    self->_debugStartOffsetView = v158;

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_debugStartOffsetView, "setBackgroundColor:", v160);

    v161 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    debugEndOffsetView = self->_debugEndOffsetView;
    self->_debugEndOffsetView = v161;

    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_debugEndOffsetView, "setBackgroundColor:", v163);

    objc_msgSend(v208, "addSubview:", self->_debugTimeCodeLabel);
    objc_msgSend(v208, "addSubview:", self->_debugPlayerTimeLabel);
    objc_msgSend(v208, "addSubview:", self->_debugOriginalTimeLabel);
    objc_msgSend(v208, "addSubview:", self->_debugTrimToolStateLabel);
    objc_msgSend(v208, "addSubview:", self->_debugTrimToolPlayheadStyleLabel);
    objc_msgSend(v208, "addSubview:", self->_debugStartRectView);
    objc_msgSend(v208, "addSubview:", self->_debugEndRectView);
    objc_msgSend(v208, "addSubview:", self->_debugStartOffsetView);
    objc_msgSend(v208, "addSubview:", self->_debugEndOffsetView);
    -[UILabel leadingAnchor](self->_debugTimeCodeLabel, "leadingAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_debugTrimToolStateLabel, "leadingAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToAnchor:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setActive:", 1);

    -[UILabel bottomAnchor](self->_debugTimeCodeLabel, "bottomAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](self->_debugTrimToolStateLabel, "topAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:constant:", v168, -4.0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setActive:", 1);

    -[UILabel trailingAnchor](self->_debugPlayerTimeLabel, "trailingAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_debugTrimToolPlayheadStyleLabel, "trailingAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintEqualToAnchor:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "setActive:", 1);

    -[UILabel bottomAnchor](self->_debugPlayerTimeLabel, "bottomAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_debugTimeCodeLabel, "bottomAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "constraintEqualToAnchor:", v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setActive:", 1);

    -[UILabel trailingAnchor](self->_debugOriginalTimeLabel, "trailingAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_debugPlayerTimeLabel, "trailingAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:", v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setActive:", 1);

    -[UILabel bottomAnchor](self->_debugOriginalTimeLabel, "bottomAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](self->_debugPlayerTimeLabel, "topAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "constraintEqualToAnchor:constant:", v180, -4.0);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "setActive:", 1);

    -[UILabel leadingAnchor](self->_debugTrimToolStateLabel, "leadingAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "leadingAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "constraintEqualToAnchor:constant:", v183, 10.0);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "setActive:", 1);

    v120 = v208;
    -[UILabel bottomAnchor](self->_debugTrimToolStateLabel, "bottomAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "topAnchor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintEqualToAnchor:", v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setActive:", 1);

    -[UILabel trailingAnchor](self->_debugTrimToolPlayheadStyleLabel, "trailingAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "trailingAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "constraintEqualToAnchor:constant:", v189, -10.0);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "setActive:", 1);

    -[UILabel bottomAnchor](self->_debugTrimToolPlayheadStyleLabel, "bottomAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "topAnchor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "constraintEqualToAnchor:", v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setActive:", 1);

    -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
    -[PUTrimToolController _updateDebugPlayerTimeLabel](self, "_updateDebugPlayerTimeLabel");
    -[PUTrimToolController _updateDebugTrimToolStateLabel](self, "_updateDebugTrimToolStateLabel");
    -[PUTrimToolController _updateDebugPlayheadStyleLabel](self, "_updateDebugPlayheadStyleLabel");

  }
  -[PUTrimToolController _updateScrubberContents](self, "_updateScrubberContents");
  -[PUTrimToolController _updatePlayheadStyle](self, "_updatePlayheadStyle");
  -[PUTrimToolController _updateScrubberPresentedPlayhead](self, "_updateScrubberPresentedPlayhead");

}

- (void)trimScrubber:(id)a3 debugStartRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PUTrimToolController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIView setFrame:](self->_debugStartRectView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugEndRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PUTrimToolController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIView setFrame:](self->_debugEndRectView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugStartOffset:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PUTrimToolController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIView setFrame:](self->_debugStartOffsetView, "setFrame:", v12, v14, v16, v18);
}

- (void)trimScrubber:(id)a3 debugEndOffset:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PUTrimToolController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIView setFrame:](self->_debugEndOffsetView, "setFrame:", v12, v14, v16, v18);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTrimToolController;
  -[PUTrimToolController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUTrimToolController _updatePlayheadStyle](self, "_updatePlayheadStyle");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUTrimToolController;
  -[PUTrimToolController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PUTrimToolController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber setUseMiniScrubber:](self->_trimScrubber, "setUseMiniScrubber:", objc_msgSend(v3, "verticalSizeClass") == 1);

  v4 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  -[PUTrimToolController snapStripController](self, "snapStripController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSnapStripView");

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v4);
  v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PUTrimToolController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v5 = objc_msgSend(a4, "verticalSizeClass", a3);
  -[PUTrimToolController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "verticalSizeClass");

  if (v5 != v7)
  {
    -[PUTrimToolController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "verticalSizeClass") == 1;

    -[PXLivePhotoTrimScrubber setUseMiniScrubber:](self->_trimScrubber, "setUseMiniScrubber:", v9);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  PXFocusTimelineAction *focusTimelineAction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUTrimToolController;
  -[PUTrimToolController touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  focusTimelineAction = self->_focusTimelineAction;
  if (focusTimelineAction)
  {
    if (!-[PXFocusTimelineAction kind](focusTimelineAction, "kind"))
      -[PUTrimToolController _hideScrubberTimelineOverlay](self, "_hideScrubberTimelineOverlay");
  }
}

- (void)livePhotoRenderDidChange:(BOOL)a3
{
  id v3;

  if (a3)
  {
    self->_needsUpdateRenderForVisualChanges = 1;
    -[PUTrimToolController playerWrapper](self, "playerWrapper");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateComposition");

  }
}

- (void)setPlaceholderImage:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableVideoFilmstrip");

  if ((v5 & 1) == 0)
    -[PXLivePhotoTrimScrubber setPlaceholderImage:](self->_trimScrubber, "setPlaceholderImage:", v6);

}

- (UIImage)placeholderImage
{
  return (UIImage *)-[PXLivePhotoTrimScrubber placeholderImage](self->_trimScrubber, "placeholderImage");
}

- (void)_createRendererIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[PUTrimToolController renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D71990]);
    -[PUTrimToolController editSource](self, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithEditSource:", v5);

    -[PUTrimToolController setRenderer:](self, "setRenderer:", v6);
  }
}

- (void)setOriginalStartTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_originalStartTime;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  int64_t var3;
  CMTime time2;
  CMTime time1;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  p_originalStartTime = &self->_originalStartTime;
  time1 = (CMTime)self->_originalStartTime;
  time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_originalStartTime->epoch = a3->var3;
    *(_OWORD *)&p_originalStartTime->value = v6;
    v9 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PXLivePhotoTrimScrubber setOriginalStartTime:](self->_trimScrubber, "setOriginalStartTime:", &v9);
    if ((a3->var2 & 1) != 0)
    {
      time1 = (CMTime)*a3;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubber setSnapTrimStartTimes:](self->_trimScrubber, "setSnapTrimStartTimes:", v8);

    }
    else
    {
      -[PXLivePhotoTrimScrubber setSnapTrimStartTimes:](self->_trimScrubber, "setSnapTrimStartTimes:", 0);
    }
  }
}

- (void)setOriginalEndTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_originalEndTime;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  int64_t var3;
  CMTime time2;
  CMTime time1;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  p_originalEndTime = &self->_originalEndTime;
  time1 = (CMTime)self->_originalEndTime;
  time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_originalEndTime->epoch = a3->var3;
    *(_OWORD *)&p_originalEndTime->value = v6;
    v9 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PXLivePhotoTrimScrubber setOriginalEndTime:](self->_trimScrubber, "setOriginalEndTime:", &v9);
    if ((a3->var2 & 1) != 0)
    {
      time1 = (CMTime)*a3;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubber setSnapTrimEndTimes:](self->_trimScrubber, "setSnapTrimEndTimes:", v8);

    }
    else
    {
      -[PXLivePhotoTrimScrubber setSnapTrimEndTimes:](self->_trimScrubber, "setSnapTrimEndTimes:", 0);
    }
  }
}

- (UIButton)playPauseButton
{
  UIButton *playPauseButton;
  id v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;

  playPauseButton = self->_playPauseButton;
  if (!playPauseButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoEditingToolbarToolButtonColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v5, "setTintColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUVideoEditPlayButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v5, "setImage:forState:", v9, 0);
    -[UIButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__handlePlayPauseButton_, 64);
    v10 = self->_playPauseButton;
    self->_playPauseButton = v5;

    -[PUTrimToolController _updatePlayPauseButton](self, "_updatePlayPauseButton");
    playPauseButton = self->_playPauseButton;
  }
  return playPauseButton;
}

- (id)_playPauseButtonIfLoaded
{
  return self->_playPauseButton;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playheadTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_trimScrubber;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE keyTime](result, "keyTime");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setPlayheadTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[PUTrimToolController setPlayheadTime:forceSeek:](self, "setPlayheadTime:forceSeek:", &v3, 0);
}

- (void)setPlayheadTime:(id *)a3 forceSeek:(BOOL)a4
{
  _BOOL8 v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v4 = a4;
  v6 = *a3;
  -[PXLivePhotoTrimScrubber setKeyTime:](self->_trimScrubber, "setKeyTime:", &v6);
  -[PUTrimToolController _seekToTimeForElement:exact:forceSeek:](self, "_seekToTimeForElement:exact:forceSeek:", 4, 1, v4);
}

- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4
{
  -[PUTrimToolController _seekToTimeForElement:exact:forceSeek:](self, "_seekToTimeForElement:exact:forceSeek:", a3, a4, 0);
}

- (void)_seekToTimeForElement:(int64_t)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  PXLivePhotoTrimScrubber *trimScrubber;
  PXLivePhotoTrimScrubber *v10;
  void *v11;
  CMTime v12;
  CMTime lhs;
  CMTime rhs;
  CMTime time1;
  CMTime time2;
  CMTime v17;

  v5 = a5;
  v6 = a4;
  memset(&v17, 0, sizeof(v17));
  trimScrubber = self->_trimScrubber;
  if (trimScrubber)
    -[PXLivePhotoTrimScrubber timeForElement:](trimScrubber, "timeForElement:", a3);
  if (a3 == 4)
  {
    lhs = v17;
    -[PUTrimToolController _currentPlayerScaledTimeFromOriginalTime:](self, "_currentPlayerScaledTimeFromOriginalTime:", &lhs);
LABEL_11:
    v17 = time1;
    goto LABEL_12;
  }
  if (a3 == 3)
  {
    v10 = self->_trimScrubber;
    if (v10)
      -[PXLivePhotoTrimScrubber trimEndTime](v10, "trimEndTime");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = v17;
    if (!CMTimeCompare(&time1, &time2))
    {
      -[PUTrimToolController _frameDuration](self, "_frameDuration");
      lhs = v17;
      CMTimeSubtract(&time1, &lhs, &rhs);
      goto LABEL_11;
    }
  }
LABEL_12:
  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  time1 = v17;
  objc_msgSend(v11, "seekToTime:untrimmed:exact:forceSeek:", &time1, (unint64_t)(a3 - 1) < 2, v6, v5);

  v12 = v17;
  -[PUTrimToolController setDebugPlayerTime:](self, "setDebugPlayerTime:", &v12);
}

- (void)willShowTrimTool
{
  self->_isActive = 1;
}

- (void)willHideTrimTool
{
  self->_isActive = 0;
  -[PUTrimToolController _dismissKeyFramePickerAndResetToStillFrame](self, "_dismissKeyFramePickerAndResetToStillFrame");
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
  -[PUTrimToolController _dismissKeyFramePickerAndResetToStillFrame](self, "_dismissKeyFramePickerAndResetToStillFrame");
  -[PUTrimToolController _resetScrubberToStillPhotoFrame](self, "_resetScrubberToStillPhotoFrame");
}

- (void)_dismissKeyFramePickerAndResetToStillFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[PUTrimToolController setLivePhotoKeyFramePickerAppearanceTimer:](self, "setLivePhotoKeyFramePickerAppearanceTimer:", 0);
    -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[PUTrimToolController _resetScrubberToStillPhotoFrame](self, "_resetScrubberToStillPhotoFrame");
  }
  -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__PUTrimToolController__dismissKeyFramePickerAndResetToStillFrame__block_invoke;
    v8[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isSlomoEnabled
{
  return self->_slomoEnabled;
}

- (void)setSlomoEnabled:(BOOL)a3
{
  if (self->_slomoEnabled != a3)
  {
    self->_slomoEnabled = a3;
    -[PUTrimToolController _updateSlomoViewAnimated:](self, "_updateSlomoViewAnimated:", 1);
  }
}

- (void)trimScrubber:(id)a3 didTapElement:(int64_t)a4
{
  uint64_t v5;

  if (-[PUTrimToolController internalState](self, "internalState", a3, a4) != 6)
  {
    if (-[PUTrimToolController _showKeyFrameSelection](self, "_showKeyFrameSelection"))
      v5 = 6;
    else
      v5 = 0;
    -[PUTrimToolController setInternalState:](self, "setInternalState:", v5);
  }
}

- (void)trimScrubber:(id)a3 didTapTimelineAtTime:(id *)a4
{
  void *v6;
  int v7;
  __int128 v8;
  int64_t var3;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "tapTimelineToSeek");

  if (v7)
  {
    v8 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PUTrimToolController setPlayheadTime:](self, "setPlayheadTime:", &v8);
  }
}

- (BOOL)trimScrubber:(id)a3 canBeginInteractivelyEditingElement:(int64_t)a4
{
  return a4 != 0;
}

- (void)trimScrubber:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = 0;
  self->_currentlyInteractingElement = a4;
  v8 = 1;
  v17 = v6;
  if ((unint64_t)(a4 - 1) < 2)
  {
    v9 = 2;
  }
  else if (a4 == 4)
  {
    v8 = 0;
    v7 = 1;
    v9 = 4;
  }
  else
  {
    if (a4 != 3)
      goto LABEL_8;
    v7 = 0;
    v9 = 5;
  }
  -[PUTrimToolController setInternalState:](self, "setInternalState:", v9);
LABEL_8:
  -[PUTrimToolController _seekToTimeForElement:exact:forceSeek:](self, "_seekToTimeForElement:exact:forceSeek:", a4, v8, v7);
  -[PUTrimToolController snapStripController](self, "snapStripController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSnapStripView");

  -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[PUTrimToolController setLivePhotoKeyFramePickerAppearanceTimer:](self, "setLivePhotoKeyFramePickerAppearanceTimer:", 0);
  }
  -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  -[PUTrimToolController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trimToolController:didBeginInteractivelyEditingElement:", self, a4);

  -[PUTrimToolController setIsPerformingLiveInteraction:](self, "setIsPerformingLiveInteraction:", 1);
  -[PUTrimToolController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trimToolController:didChangeIsPerformingLiveInteraction:", self, -[PUTrimToolController isPerformingLiveInteraction](self, "isPerformingLiveInteraction"));

}

- (void)trimScrubber:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4 successful:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  PXLivePhotoTrimScrubber *trimScrubber;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  PXLivePhotoTrimScrubber *v20;
  int32_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  CMTime v26;
  CMTime time2;
  _QWORD v28[4];
  id v29[2];
  CMTime v30;
  CMTime location[2];

  v5 = a5;
  v8 = a3;
  if (a4 != 3)
  {
    -[PUTrimToolController _playPauseButtonIfLoaded](self, "_playPauseButtonIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 4)
    {
      if (v10)
      {
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "pauseAfterMovingPlayhead");

        if (v12)
        {
          -[PUTrimToolController playerWrapper](self, "playerWrapper");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pause");

        }
        -[PUTrimToolController _seekToTimeForElement:exact:forceSeek:](self, "_seekToTimeForElement:exact:forceSeek:", 4, 1, 1);
      }
    }
  }
  memset(&location[1], 0, sizeof(CMTime));
  trimScrubber = self->_trimScrubber;
  if (trimScrubber)
    -[PXLivePhotoTrimScrubber timeForElement:](trimScrubber, "timeForElement:", a4);
  if ((unint64_t)(a4 - 1) > 1)
  {
    if ((unint64_t)(a4 - 3) <= 1)
    {
      if (v5)
      {
        memset(location, 0, 24);
        v20 = self->_trimScrubber;
        if (v20)
          -[PXLivePhotoTrimScrubber keyTime](v20, "keyTime");
        -[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime");
        v26 = location[0];
        v21 = CMTimeCompare(&v26, &time2);
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "requireTapToShowMakePosterFrame");

        v24 = 0;
        if (v21 && (v23 & 1) == 0)
        {
          if (-[PUTrimToolController _showKeyFrameSelection](self, "_showKeyFrameSelection"))
            v24 = 6;
          else
            v24 = 0;
        }
        goto LABEL_22;
      }
      -[PUTrimToolController _resetScrubberToStillPhotoFrame](self, "_resetScrubberToStillPhotoFrame");
    }
    v24 = 0;
LABEL_22:
    location[0] = location[1];
    -[PUTrimToolController _didCompleteInteractiveEditForElement:atTime:state:](self, "_didCompleteInteractiveEditForElement:atTime:state:", a4, location, v24);
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  -[PUTrimToolController _updateCompositionController](self, "_updateCompositionController");
  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  location[0] = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  objc_msgSend(v15, "seekToTime:", location);

  objc_initWeak((id *)location, self);
  v16 = (void *)MEMORY[0x1E0D52290];
  v17 = MEMORY[0x1E0C80D38];
  v18 = MEMORY[0x1E0C80D38];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__PUTrimToolController_trimScrubber_didEndInteractivelyEditingElement_successful___block_invoke;
  v28[3] = &unk_1E58AA0B0;
  objc_copyWeak(v29, (id *)location);
  v29[1] = (id)a4;
  v30 = location[1];
  objc_msgSend(v16, "commitAndNotifyOnQueue:withBlock:", v17, v28);

  -[PUTrimToolController snapStripController](self, "snapStripController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateSnapStripView");

  -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
  objc_destroyWeak(v29);
  objc_destroyWeak((id *)location);
LABEL_23:
  -[PUTrimToolController setIsPerformingLiveInteraction:](self, "setIsPerformingLiveInteraction:", 0);
  -[PUTrimToolController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trimToolController:didChangeIsPerformingLiveInteraction:", self, -[PUTrimToolController isPerformingLiveInteraction](self, "isPerformingLiveInteraction"));

}

- (void)_didCompleteInteractiveEditForElement:(int64_t)a3 atTime:(id *)a4 state:(unint64_t)a5
{
  unint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  __int128 v13;
  int64_t var3;

  v9 = a3 - 1;
  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v9 <= 1 && (isKindOfClass & 1) != 0)
  {
    v13 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PUTrimToolController setPlayheadTime:forceSeek:](self, "setPlayheadTime:forceSeek:", &v13, 1);
  }
  self->_currentlyInteractingElement = 0;
  -[PUTrimToolController setInternalState:](self, "setInternalState:", a5);
  -[PUTrimToolController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trimToolController:didEndInteractivelyEditingElement:", self, a3);

}

- (void)trimScrubber:(id)a3 didChangeTimeForElement:(int64_t)a4
{
  void *v6;

  if (objc_msgSend(a3, "currentlyInteractingElement"))
  {
    -[PUTrimToolController _seekToTimeForElement:exact:](self, "_seekToTimeForElement:exact:", a4, 1);
    -[PUTrimToolController snapStripController](self, "snapStripController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSnapStripView");

    -[PUTrimToolController _updateTimeCodeOverlay](self, "_updateTimeCodeOverlay");
  }
}

- (void)trimScrubberAssetDurationDidChange:(id)a3
{
  id v3;

  -[PUTrimToolController snapStripController](self, "snapStripController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSnapStripView");

}

- (void)trimScrubber:(id)a3 didZoomToMinimumValue:(double)a4 maximumValue:(double)a5
{
  -[PXSlowMotionEditor setZoomMinValue:maxValue:](self->_slomoView, "setZoomMinValue:maxValue:", a3);
  if (-[PUTrimToolController isPortraitVideo](self, "isPortraitVideo"))
    -[PXFocusTimelineView setZoomMinValue:maxValue:](self->_focusTimelineView, "setZoomMinValue:maxValue:", a4, a5);
  -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
}

- (void)trimScrubberDidUnzoom:(id)a3
{
  PXSlowMotionEditor *slomoView;
  double v5;

  slomoView = self->_slomoView;
  -[PXSlowMotionEditor maxValue](slomoView, "maxValue", a3);
  -[PXSlowMotionEditor setZoomMinValue:maxValue:](slomoView, "setZoomMinValue:maxValue:", 0.0, v5);
  if (-[PUTrimToolController isPortraitVideo](self, "isPortraitVideo"))
    -[PXFocusTimelineView unzoom](self->_focusTimelineView, "unzoom");
  -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
}

- (void)trimScrubberPausePlayer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PUTrimToolController _playPauseButtonIfLoaded](self, "_playPauseButtonIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUTrimToolController playerWrapper](self, "playerWrapper");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");

  }
}

- (void)trimScrubberDidLayoutSubviews:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PUTrimToolController_trimScrubberDidLayoutSubviews___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (double)scrubberHeight
{
  double result;

  -[PXLivePhotoTrimScrubberSpec scrubberHeight](self->_spec, "scrubberHeight");
  return result;
}

- (void)releaseAVObjects
{
  PXTrimToolPlayerWrapper *playerWrapper;
  AVAsset *currentVideoAsset;
  AVVideoComposition *currentVideoComposition;

  -[PXLivePhotoTrimScrubber _releaseAVObjects](self->_trimScrubber, "_releaseAVObjects");
  -[PXTrimToolPlayerWrapper setPlayerObserver:](self->_playerWrapper, "setPlayerObserver:", 0);
  playerWrapper = self->_playerWrapper;
  self->_playerWrapper = 0;

  currentVideoAsset = self->_currentVideoAsset;
  self->_currentVideoAsset = 0;

  currentVideoComposition = self->_currentVideoComposition;
  self->_currentVideoComposition = 0;

}

- (void)setUnadjustedStillImageTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_unadjustedStillImageTime;
  __int128 v6;
  void *v7;
  $95D729B680665BEAEFA1D6FCA8238556 unadjustedStillImageTime;
  CMTime time1;

  p_unadjustedStillImageTime = &self->_unadjustedStillImageTime;
  time1 = *(CMTime *)a3;
  unadjustedStillImageTime = self->_unadjustedStillImageTime;
  if (CMTimeCompare(&time1, (CMTime *)&unadjustedStillImageTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_unadjustedStillImageTime->epoch = a3->var3;
    *(_OWORD *)&p_unadjustedStillImageTime->value = v6;
    -[PUTrimToolController _updateScrubberContents](self, "_updateScrubberContents");
    -[PUTrimToolController snapStripController](self, "snapStripController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSnapStripView");

  }
}

- (void)setCompositionController:(id)a3
{
  PICompositionController *v5;
  PICompositionController *v6;

  v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    -[PUTrimToolController _updatePlayheadStyle](self, "_updatePlayheadStyle");
    -[PUTrimToolController _updateScrubberContents](self, "_updateScrubberContents");
    -[PUTrimToolController _updatePlayerWrapperTrim](self, "_updatePlayerWrapperTrim");
    -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
    -[PUTrimToolController _updateSnapStripController](self, "_updateSnapStripController");
    v5 = v6;
  }

}

- (void)setEditSource:(id)a3
{
  PLEditSource *v5;
  void *v6;
  PXLivePhotoTrimScrubber *trimScrubber;
  CMTime *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;

  v5 = (PLEditSource *)a3;
  if (self->_editSource != v5)
  {
    objc_storeStrong((id *)&self->_editSource, a3);
    -[PUTrimToolController currentEditSource](self, "currentEditSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CMTimeMake(&v21, 1, 2);
      trimScrubber = self->_trimScrubber;
      v20 = v21;
      v8 = &v20;
    }
    else
    {
      CMTimeMake(&v19, 1, 1);
      trimScrubber = self->_trimScrubber;
      v18 = v19;
      v8 = &v18;
    }
    -[PXLivePhotoTrimScrubber setMinimumTrimLength:](trimScrubber, "setMinimumTrimLength:", v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        -[PUTrimToolController _updatePlayheadStyle](self, "_updatePlayheadStyle");

        goto LABEL_15;
      }
      objc_msgSend(v6, "videoEditSource");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0C8AF90];
      objc_msgSend(v9, "videoURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetWithURL:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "duration");
      }
      else
      {
        v16 = 0uLL;
        v17 = 0;
      }
      v14 = v16;
      v15 = v17;
      -[PUTrimToolController setUnadjustedAssetDuration:](self, "setUnadjustedAssetDuration:", &v14);

    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  id v7;

  if (self->_disabled != a3)
  {
    v3 = a3;
    self->_disabled = a3;
    v5 = !a3;
    -[PUTrimToolController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v5);

    -[PXLivePhotoTrimScrubber setDisabled:](self->_trimScrubber, "setDisabled:", v3);
    -[PUTrimToolController snapStripController](self, "snapStripController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSnapStripView");

  }
}

- (int64_t)currentlyInteractingElement
{
  return self->_currentlyInteractingElement;
}

- (void)enableFocusTimeline:(BOOL)a3
{
  BOOL v4;

  self->_portraitVideoEnabled = a3;
  v4 = !a3;
  -[PXFocusTimelineView setDimmed:](self->_focusTimelineView, "setDimmed:", !a3);
  if (v4)
    -[PUTrimToolController _hideScrubberTimelineOverlay](self, "_hideScrubberTimelineOverlay");
  else
    -[PUTrimToolController _updateScrubberFocusEventTimes](self, "_updateScrubberFocusEventTimes");
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  -[PXFocusTimelineView enableUIForCinematographyScriptLoad:](self->_focusTimelineView, "enableUIForCinematographyScriptLoad:", a3);
}

- (void)showFocusTimeline:(BOOL)a3
{
  double v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  -[UIVisualEffectView setAlpha:](self->_auxilaryContainerView, "setAlpha:", v3);
}

- (void)updateFocusTimeline
{
  -[PXFocusTimelineView updateTimeline](self->_focusTimelineView, "updateTimeline");
}

- (void)resetTimeline
{
  -[PXFocusTimelineView resetTimeline](self->_focusTimelineView, "resetTimeline");
}

- (void)updateFocusTimelineWithTimeRange:(id *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v4[0] = *(_OWORD *)&a3->var0.var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var1.var1;
  -[PXFocusTimelineView setTimeRange:](self->_focusTimelineView, "setTimeRange:", v4);
}

- (void)updateFocusTimelineWithEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5
{
  PXFocusTimelineView *focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  focusTimelineView = self->_focusTimelineView;
  v6 = *a3;
  -[PXFocusTimelineView addFocusEvent:userInitiated:shouldAnimate:](focusTimelineView, "addFocusEvent:userInitiated:shouldAnimate:", &v6, a4, a5);
}

- (void)didUpdateFocusEventsWithTimes:(id)a3
{
  objc_storeStrong((id *)&self->_focusEventTimes, a3);
  -[PUTrimToolController _updateScrubberFocusEventTimes](self, "_updateScrubberFocusEventTimes");
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  PXFocusTimelineView *focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  focusTimelineView = self->_focusTimelineView;
  v4 = *a3;
  -[PXFocusTimelineView objectTrackingStartedAtTime:](focusTimelineView, "objectTrackingStartedAtTime:", &v4);
}

- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  PXFocusTimelineView *focusTimelineView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  focusTimelineView = self->_focusTimelineView;
  v5 = *a3;
  -[PXFocusTimelineView updateObjectTrackingProgressAtTime:shouldStop:](focusTimelineView, "updateObjectTrackingProgressAtTime:shouldStop:", &v5, a4);
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  -[PXFocusTimelineView objectTrackingFinishedWithSuccess:](self->_focusTimelineView, "objectTrackingFinishedWithSuccess:", a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentStillFrameTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v6;
  int64_t v7;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = -[PUTrimToolController adjustedStillFrameTime](self, "adjustedStillFrameTime");
  if ((retstr->var2 & 1) == 0)
  {
    result = -[PUTrimToolController unadjustedStillImageTime](self, "unadjustedStillImageTime");
    *(_OWORD *)&retstr->var0 = v6;
    retstr->var3 = v7;
  }
  return result;
}

- (void)setAdjustedStillFrameTime:(id *)a3
{
  void *v5;
  unsigned int var2;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  int64_t var3;
  CMTime time1;
  CMTime time2;

  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUTrimToolController unadjustedStillImageTime](self, "unadjustedStillImageTime");
    time1 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      var2 = a3->var2;
      -[PUTrimToolController compositionController](self, "compositionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = *MEMORY[0x1E0D71378];
      if ((var2 & 1) != 0)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __50__PUTrimToolController_setAdjustedStillFrameTime___block_invoke;
        v13[3] = &__block_descriptor_56_e49_v16__0__PILivePhotoKeyFrameAdjustmentController_8l;
        v14 = *(_OWORD *)&a3->var0;
        var3 = a3->var3;
        objc_msgSend(v7, "modifyAdjustmentWithKey:modificationBlock:", v9, v13);
      }
      else
      {
        objc_msgSend(v7, "removeAdjustmentWithKey:", v9);
      }
    }
    else
    {
      -[PUTrimToolController compositionController](self, "compositionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTrimToolController compositionController](self, "compositionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "adjustmentConstants");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "PILivePhotoKeyFrameAdjustmentKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAdjustmentWithKey:", v12);

    }
  }
  else
  {
    -[PUTrimToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    time1 = (CMTime)*a3;
    -[PUTrimToolController _setPosterFrameTime:onCompositionController:](self, "_setPosterFrameTime:onCompositionController:", &time1, v8);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedStillFrameTime
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v12;

  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[PUTrimToolController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v7, "videoPosterFrameAdjustmentController");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v12;
    if (v12)
    {
      objc_msgSend(v12, "posterFrameTime");
      goto LABEL_6;
    }
LABEL_7:
    v10 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v10 + 16);
    goto LABEL_8;
  }
  objc_msgSend(v7, "livePhotoKeyFrameAdjustmentController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (!v12)
    goto LABEL_7;
  objc_msgSend(v12, "keyFrameTime");
LABEL_6:
  v9 = v12;
LABEL_8:

  return result;
}

- (void)_setState:(unint64_t)a3
{
  id v5;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[PUTrimToolController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trimToolControllerDidChange:state:", self, a3);

  }
}

- (void)setPlayheadStyle:(unint64_t)a3
{
  if (self->_playheadStyle != a3)
  {
    self->_playheadStyle = a3;
    -[PUTrimToolController _updateScrubberPresentedPlayhead](self, "_updateScrubberPresentedPlayhead");
    -[PUTrimToolController _updatePlayerWrapperTimeObserver](self, "_updatePlayerWrapperTimeObserver");
    -[PUTrimToolController _updateDebugPlayheadStyleLabel](self, "_updateDebugPlayheadStyleLabel");
  }
}

- (void)setInternalState:(unint64_t)a3
{
  if (self->_internalState != a3)
  {
    self->_internalState = a3;
    -[PUTrimToolController _updatePublicState](self, "_updatePublicState");
    -[PUTrimToolController _updatePlayheadStyle](self, "_updatePlayheadStyle");
    -[PUTrimToolController _updateDebugTrimToolStateLabel](self, "_updateDebugTrimToolStateLabel");
    -[PUTrimToolController _updateTimeCodeOverlay](self, "_updateTimeCodeOverlay");
  }
}

- (BOOL)_allowsKeyFrameCreation
{
  void *v2;
  void *v3;
  char v4;
  char v5;

  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowMakePosterFrameForVideo");

  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  v5 = objc_opt_isKindOfClass() | v4;

  return v5 & 1;
}

- (BOOL)_showKeyFrameSelection
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = -[PUTrimToolController _allowsKeyFrameCreation](self, "_allowsKeyFrameCreation");
  if (v3)
  {
    -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PUTrimToolController livePhotoKeyFramePickerAppearanceTimer](self, "livePhotoKeyFramePickerAppearanceTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      -[PUTrimToolController setLivePhotoKeyFramePickerAppearanceTimer:](self, "setLivePhotoKeyFramePickerAppearanceTimer:", 0);
    }
    -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

      -[PUTrimToolController setLivePhotoKeyFramePicker:](self, "setLivePhotoKeyFramePicker:", 0);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__PUTrimToolController__showKeyFrameSelection__block_invoke;
    v10[3] = &unk_1E58AA0F8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController setLivePhotoKeyFramePickerAppearanceTimer:](self, "setLivePhotoKeyFramePickerAppearanceTimer:", v8);

  }
  return v3;
}

- (void)_setPosterFrameTime:(id *)a3 onCompositionController:(id)a4
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;
  int64_t var3;
  CMTime time2;
  CMTime time1;

  v5 = a4;
  if ((a3->var2 & 1) != 0
    && (time1 = (CMTime)*a3, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2)))
  {
    v6 = *MEMORY[0x1E0D71478];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PUTrimToolController__setPosterFrameTime_onCompositionController___block_invoke;
    v7[3] = &__block_descriptor_56_e48_v16__0__PIVideoPosterFrameAdjustmentController_8l;
    v8 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v7);
  }
  else
  {
    objc_msgSend(v5, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71478]);
  }

}

- (void)setDebugPlayerTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_debugPlayerTime;
  __int128 v6;
  CMTime v7;
  CMTime time1;

  p_debugPlayerTime = &self->_debugPlayerTime;
  time1 = (CMTime)self->_debugPlayerTime;
  v7 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v7))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_debugPlayerTime->epoch = a3->var3;
    *(_OWORD *)&p_debugPlayerTime->value = v6;
    -[PUTrimToolController _updateDebugPlayerTimeLabel](self, "_updateDebugPlayerTimeLabel");
  }
}

- (void)_updateDebugTimeCodeLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double Seconds;
  void *v8;
  void *v9;
  Float64 v10;
  void *v11;
  void *v12;
  double v13;
  Float64 v14;
  PXLivePhotoTrimScrubber *trimScrubber;
  Float64 v16;
  PXLivePhotoTrimScrubber *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime time;

  -[PUTrimToolController debugTimeCodeLabel](self, "debugTimeCodeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[PUTrimToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trimAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "startTime");
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(v6, "endTime");
      v21 = CMTimeGetSeconds(&v27);
      objc_msgSend(v4, "appendFormat:", CFSTR("Trim(s:%.1f,e:%.1f,d:%.1f)"), *(_QWORD *)&Seconds, *(_QWORD *)&v21, v21 - Seconds);
    }
    else
    {
      -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "duration");
      else
        memset(&v26, 0, sizeof(v26));
      v10 = CMTimeGetSeconds(&v26);

      objc_msgSend(v4, "appendFormat:", CFSTR("Trim(s:%.1f,e:%.1f,d:%.1f)"), 0, *(_QWORD *)&v10, *(_QWORD *)&v10);
    }
    -[PUTrimToolController compositionController](self, "compositionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "slomoAdjustmentController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "startTime");
      v13 = CMTimeGetSeconds(&v25);
      objc_msgSend(v12, "endTime");
      v14 = CMTimeGetSeconds(&v24);
      objc_msgSend(v4, "appendFormat:", CFSTR(" Slo(s:%.1f,e:%.1f,d:%.1f)"), *(_QWORD *)&v13, *(_QWORD *)&v14, v14 - v13);
    }
    trimScrubber = self->_trimScrubber;
    if (trimScrubber)
      -[PXLivePhotoTrimScrubber viewportMinTime](trimScrubber, "viewportMinTime");
    else
      memset(&v23, 0, sizeof(v23));
    v16 = CMTimeGetSeconds(&v23);
    v17 = self->_trimScrubber;
    if (v17)
      -[PXLivePhotoTrimScrubber viewportMaxTime](v17, "viewportMaxTime");
    else
      memset(&v22, 0, sizeof(v22));
    objc_msgSend(v4, "appendFormat:", CFSTR("VP(%.1f, %.1f)"), *(_QWORD *)&v16, CMTimeGetSeconds(&v22));
    -[PUTrimToolController debugTimeCodeLabel](self, "debugTimeCodeLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController debugTimeCodeLabel](self, "debugTimeCodeLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

  }
}

- (void)_updateDebugPlayerTimeLabel
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
  CMTime v27;
  CMTime v28;
  _BYTE v29[24];
  CMTime v30;
  CMTime time;
  int v32;
  CMTime v33;

  -[PUTrimToolController debugPlayerTimeLabel](self, "debugPlayerTimeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    memset(&v33, 0, sizeof(v33));
    -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&v33, 0, sizeof(v33));

    -[PUTrimToolController debugPlayerTime](self, "debugPlayerTime");
    if ((v32 & 0x1D) == 1 && (v33.flags & 0x1D) == 1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[PUTrimToolController debugPlayerTime](self, "debugPlayerTime");
      CMTimeGetSeconds(&time);
      PXTrimTimeCodeStringFromSecondsAndRound();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v33;
      CMTimeGetSeconds(&v30);
      PXTrimTimeCodeStringFromSecondsAndRound();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("P:%@/%@"), v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTrimToolController debugPlayerTimeLabel](self, "debugPlayerTimeLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      memset(&v30, 0, sizeof(v30));
      -[PUTrimToolController debugPlayerTime](self, "debugPlayerTime");
      -[PUTrimToolController _originalTimeFromCurrentPlayerScaledTime:](self, "_originalTimeFromCurrentPlayerScaledTime:", v29);
      memset(&v28, 0, sizeof(v28));
      v27 = v33;
      -[PUTrimToolController _originalTimeFromCurrentPlayerScaledTime:](self, "_originalTimeFromCurrentPlayerScaledTime:", &v27);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v27 = v30;
      CMTimeGetSeconds(&v27);
      PXTrimTimeCodeStringFromSecondsAndRound();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v28;
      CMTimeGetSeconds(&v27);
      PXTrimTimeCodeStringFromSecondsAndRound();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("O:%@/%@"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTrimToolController debugOriginalTimeLabel](self, "debugOriginalTimeLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      PXTrimTimeCodeStringFromSecondsAndRound();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("P:%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTrimToolController debugPlayerTimeLabel](self, "debugPlayerTimeLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      v20 = (void *)MEMORY[0x1E0CB3940];
      PXTrimTimeCodeStringFromSecondsAndRound();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("O:%@"), v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTrimToolController debugOriginalTimeLabel](self, "debugOriginalTimeLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController debugPlayerTimeLabel](self, "debugPlayerTimeLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v23);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController debugOriginalTimeLabel](self, "debugOriginalTimeLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v25);

  }
}

- (void)_updateDebugTrimToolStateLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    switch(-[PUTrimToolController state](self, "state"))
    {
      case 0uLL:
        -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setText:", CFSTR("Paused"));

        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1uLL:
        -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", CFSTR("Playing"));

        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2uLL:
        v6 = -[PUTrimToolController internalState](self, "internalState");
        if (v6 - 2 > 3)
          v7 = CFSTR("Unknown");
        else
          v7 = off_1E58AA240[v6 - 2];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Interacting(%@)"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v10);

        objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3uLL:
        -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", CFSTR("Picking"));

        objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = (id)v5;
        -[PUTrimToolController debugTrimToolStateLabel](self, "debugTrimToolStateLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTextColor:", v13);

        break;
      default:
        return;
    }
  }
}

- (void)_updateDebugPlayheadStyleLabel
{
  void *v3;
  unint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;

  -[PUTrimToolController debugTrimToolPlayheadStyleLabel](self, "debugTrimToolPlayheadStyleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PUTrimToolController playheadStyle](self, "playheadStyle");
    switch(v4)
    {
      case 2uLL:
        -[PUTrimToolController debugTrimToolPlayheadStyleLabel](self, "debugTrimToolPlayheadStyleLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v6 = CFSTR("Loupe");
        goto LABEL_9;
      case 1uLL:
        -[PUTrimToolController debugTrimToolPlayheadStyleLabel](self, "debugTrimToolPlayheadStyleLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v6 = CFSTR("Bar");
        goto LABEL_9;
      case 0uLL:
        -[PUTrimToolController debugTrimToolPlayheadStyleLabel](self, "debugTrimToolPlayheadStyleLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v6 = CFSTR("None");
LABEL_9:
        objc_msgSend(v5, "setText:", v6);

        break;
    }
  }
}

- (void)_updatePublicState
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PUTrimToolController internalState](self, "internalState");
  if (v3 > 6)
    v4 = 2;
  else
    v4 = qword_1AB0F0160[v3];
  -[PUTrimToolController _setState:](self, "_setState:", v4);
}

- (void)_updatePlayheadStyle
{
  void *v3;
  char isKindOfClass;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;

  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (-[PUTrimToolController internalState](self, "internalState") == 2)
    {
      v6 = 0;
    }
    else
    {
      -[PUTrimToolController compositionController](self, "compositionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "autoLoopAdjustmentController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "flavor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = PIAutoLoopFlavorFromString() == 0;

        v6 = 2 * v11;
      }
      else
      {
        v6 = 0;
      }

    }
    goto LABEL_15;
  }
  v5 = -[PUTrimToolController state](self, "state");
  if (v5 < 2)
  {
LABEL_6:
    v6 = 1;
LABEL_15:
    -[PUTrimToolController setPlayheadStyle:](self, "setPlayheadStyle:", v6);
    return;
  }
  if (v5 == 3)
  {
    v6 = 2;
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    if (-[PUTrimToolController internalState](self, "internalState") != 4)
    {
      v6 = -[PUTrimToolController internalState](self, "internalState") == 5;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
}

- (void)_updateSnapStripController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PUTrimToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "livePortraitBehaviorController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v6, "hasLivePortrait");
  -[PUTrimToolController snapStripSpec](self, "snapStripSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLivePortraitStyle:", v4);

}

- (void)_updatePlayerWrapperTimeObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUTrimToolController__updatePlayerWrapperTimeObserver__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateScrubberPresentedPlayhead
{
  unint64_t v3;

  v3 = -[PUTrimToolController playheadStyle](self, "playheadStyle");
  if (v3 <= 2)
    -[PXLivePhotoTrimScrubber setPlayheadStyle:](self->_trimScrubber, "setPlayheadStyle:", v3);
}

- (void)_updateTimeCodeOverlay
{
  _BOOL4 v3;
  void *v4;
  char isKindOfClass;
  PUTimeCodeOverlayView *timeCodeOverlayView;
  PUTimeCodeOverlayView *v7;
  PUTimeCodeOverlayView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *timeCodeHorizontalConstraint;
  Float64 v17;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  double MinX;
  double v21;
  double v22;
  PUTimeCodeOverlayView *v23;
  NSLayoutConstraint *v24;
  uint64_t v25;
  PXLivePhotoTrimScrubber *trimScrubber;
  Float64 v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  CMTime v32;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = -[PUTrimToolController internalState](self, "internalState") == 2
    || -[PUTrimToolController internalState](self, "internalState") == 3
    || -[PUTrimToolController internalState](self, "internalState") == 4
    || -[PUTrimToolController internalState](self, "internalState") == 5;
  -[PUTrimToolController editSource](self, "editSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  timeCodeOverlayView = self->_timeCodeOverlayView;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    if (!timeCodeOverlayView)
    {
      v7 = objc_alloc_init(PUTimeCodeOverlayView);
      v8 = self->_timeCodeOverlayView;
      self->_timeCodeOverlayView = v7;

      -[PUTrimToolController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_timeCodeOverlayView);

      -[PXLivePhotoTrimScrubber topAnchor](self->_trimScrubber, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTimeCodeOverlayView bottomAnchor](self->_timeCodeOverlayView, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 4.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);

      -[PUTimeCodeOverlayView centerXAnchor](self->_timeCodeOverlayView, "centerXAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubber leftAnchor](self->_trimScrubber, "leftAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      timeCodeHorizontalConstraint = self->_timeCodeHorizontalConstraint;
      self->_timeCodeHorizontalConstraint = v15;

      -[NSLayoutConstraint setActive:](self->_timeCodeHorizontalConstraint, "setActive:", 1);
    }
    if (-[PUTrimToolController internalState](self, "internalState") == 3)
    {
      if (-[PUTrimToolController slomoDraggingStartHandle](self, "slomoDraggingStartHandle"))
      {
        -[PXSlowMotionEditor startValue](self->_slomoView, "startValue");
        CMTimeMakeWithSeconds(&v32, v17, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
        value = v32.value;
        flags = v32.flags;
        timescale = v32.timescale;
        epoch = v32.epoch;
        -[PXSlowMotionEditor startHandleFrame](self->_slomoView, "startHandleFrame");
        MinX = CGRectGetMinX(v36);
        -[PXLivePhotoTrimScrubberSpec handleWidth](self->_spec, "handleWidth");
        v22 = -5.0;
      }
      else
      {
        -[PXSlowMotionEditor endValue](self->_slomoView, "endValue");
        CMTimeMakeWithSeconds(&v32, v27, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
        value = v32.value;
        flags = v32.flags;
        timescale = v32.timescale;
        epoch = v32.epoch;
        -[PXSlowMotionEditor endHandleFrame](self->_slomoView, "endHandleFrame");
        MinX = CGRectGetMinX(v37);
        -[PXLivePhotoTrimScrubberSpec handleWidth](self->_spec, "handleWidth");
        v22 = -6.0;
      }
      v28 = MinX + v21 + v22;
    }
    else
    {
      v25 = -[PXLivePhotoTrimScrubber currentlyInteractingElement](self->_trimScrubber, "currentlyInteractingElement");
      trimScrubber = self->_trimScrubber;
      if (trimScrubber)
      {
        -[PXLivePhotoTrimScrubber timeForElement:](trimScrubber, "timeForElement:", v25);
        flags = v32.flags;
        epoch = v32.epoch;
        trimScrubber = self->_trimScrubber;
      }
      else
      {
        epoch = 0;
        flags = 0;
        memset(&v32, 0, sizeof(v32));
      }
      v32.epoch = epoch;
      value = v32.value;
      timescale = v32.timescale;
      v32.flags = flags;
      -[PXLivePhotoTrimScrubber horizontalOffsetForTime:](trimScrubber, "horizontalOffsetForTime:", &v32);
      v28 = v29;
    }
    if ((flags & 0x1D) != 1)
    {
      value = *MEMORY[0x1E0CA2E68];
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v28 = 0.0;
    }
    v32.value = value;
    v32.timescale = timescale;
    v32.flags = flags;
    v32.epoch = epoch;
    -[PUTimeCodeOverlayView setDisplayedTimeInterval:](self->_timeCodeOverlayView, "setDisplayedTimeInterval:", CMTimeGetSeconds(&v32));
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "showFrameNumberOnVideoScrubber");

    if (v31)
    {
      -[PUTrimToolController _frameRate](self, "_frameRate");
      -[PUTimeCodeOverlayView setFrameRate:](self->_timeCodeOverlayView, "setFrameRate:");
    }
    -[NSLayoutConstraint setConstant:](self->_timeCodeHorizontalConstraint, "setConstant:", v28);
  }
  else if (timeCodeOverlayView)
  {
    -[PUTimeCodeOverlayView removeFromSuperview](timeCodeOverlayView, "removeFromSuperview");
    v23 = self->_timeCodeOverlayView;
    self->_timeCodeOverlayView = 0;

    v24 = self->_timeCodeHorizontalConstraint;
    self->_timeCodeHorizontalConstraint = 0;

  }
}

- (void)_updateCompositionController
{
  void *v3;
  PXLivePhotoTrimScrubber *v4;
  PXLivePhotoTrimScrubber *v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  PUTrimToolController *v17;
  uint64_t v18;
  CMTime v19;
  __int128 v20;
  CMTimeEpoch v21;
  CMTime v22;
  BOOL v23;
  CMTime v24;
  CMTime time2;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  CMTime v33;
  CMTime rhs;
  CMTime lhs;
  CMTime v36;
  CMTime time1;
  CMTime v38;
  CMTimeRange start;
  CMTime time;
  CMTime end;
  CMTimeRange v42;
  CMTime v43;
  __int128 v44;
  CMTimeEpoch v45;

  -[PUTrimToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willModifyAdjustment");

  v4 = self->_trimScrubber;
  v5 = v4;
  v44 = 0uLL;
  v45 = 0;
  if (v4)
  {
    -[PXLivePhotoTrimScrubber trimStartTime](v4, "trimStartTime");
    memset(&v43, 0, sizeof(v43));
    -[PXLivePhotoTrimScrubber trimEndTime](v5, "trimEndTime");
  }
  else
  {
    memset(&v43, 0, sizeof(v43));
  }
  memset(&v42, 0, sizeof(v42));
  *(_OWORD *)&start.start.value = v44;
  start.start.epoch = v45;
  end = v43;
  CMTimeRangeFromTimeToTime(&v42, &start.start, &end);
  memset(&end, 0, sizeof(end));
  if (v5)
    -[PXLivePhotoTrimScrubber keyTime](v5, "keyTime");
  else
    memset(&time, 0, sizeof(time));
  start = v42;
  CMTimeClampToRange(&end, &time, &start);
  v38 = end;
  -[PXLivePhotoTrimScrubber setKeyTime:](v5, "setKeyTime:", &v38);
  if (v5)
    -[PXLivePhotoTrimScrubber keyTime](v5, "keyTime");
  else
    memset(&time1, 0, sizeof(time1));
  start.start = v43;
  if (!CMTimeCompare(&time1, &start.start))
  {
    memset(&start, 0, 24);
    -[PUTrimToolController _frameDuration](self, "_frameDuration");
    if (v5)
      -[PXLivePhotoTrimScrubber keyTime](v5, "keyTime");
    else
      memset(&lhs, 0, sizeof(lhs));
    rhs = start.start;
    CMTimeSubtract(&v36, &lhs, &rhs);
    v33 = v36;
    -[PXLivePhotoTrimScrubber setKeyTime:](v5, "setKeyTime:", &v33);
    if (v5)
    {
      -[PXLivePhotoTrimScrubber keyTime](v5, "keyTime");
    }
    else
    {
      v31 = 0uLL;
      v32 = 0;
    }
    v29 = v31;
    v30 = v32;
    -[PXLivePhotoTrimScrubber setKeyTime:](v5, "setKeyTime:", &v29);
  }
  -[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime");
  start = v42;
  v6 = CMTimeRangeContainsTime(&start, &v28);
  rhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (!v6)
  {
    memset(&v27, 0, sizeof(v27));
    -[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime");
    start = v42;
    CMTimeClampToRange(&v27, &v26, &start);
    rhs = v27;
    start.start = v27;
    time2 = v43;
    if (!CMTimeCompare(&start.start, &time2))
    {
      memset(&start, 0, 24);
      -[PUTrimToolController _frameDuration](self, "_frameDuration");
      time2 = rhs;
      v24 = start.start;
      CMTimeSubtract(&rhs, &time2, &v24);
    }
  }
  v7 = v6 == 0;
  v8 = -[PXLivePhotoTrimScrubber trimStatus](v5, "trimStatus");
  -[PUTrimToolController _createRendererIfNeeded](self, "_createRendererIfNeeded");
  -[PUTrimToolController renderer](self, "renderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController currentEditSource](self, "currentEditSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController compositionController](self, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__PUTrimToolController__updateCompositionController__block_invoke;
  v15[3] = &unk_1E58AA1A8;
  v23 = v7;
  v19 = rhs;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v20 = v44;
  v21 = v45;
  v22 = v43;
  v12 = v10;
  objc_msgSend(v9, "applySourceChangesToCompositionAsynchronously:source:withBlock:completionBlock:", v11, v12, v15, 0);

  -[PUTrimToolController _updatePlayerWrapperTrim](self, "_updatePlayerWrapperTrim");
  -[PUTrimToolController _updateSnappingDots](self, "_updateSnappingDots");
  -[PUTrimToolController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("PHOTOEDIT_TRIM_ACTION_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didModifyAdjustmentWithLocalizedName:", v14);

}

- (void)_updatePlayerWrapperTrim
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTime rhs;
  CMTime lhs;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  -[PUTrimToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trimAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v13 = *MEMORY[0x1E0CA2E40];
  v14 = v5;
  v15 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  if (objc_msgSend(v4, "enabled"))
  {
    v7 = 0uLL;
    *(_QWORD *)&v8 = 0;
    if (v4)
    {
      objc_msgSend(v4, "startTime");
      memset(&v12, 0, sizeof(v12));
      objc_msgSend(v4, "endTime");
    }
    else
    {
      memset(&v12, 0, sizeof(v12));
    }
    v13 = v7;
    *(_QWORD *)&v14 = v8;
    lhs = v12;
    *(_OWORD *)&rhs.value = v7;
    rhs.epoch = v8;
    CMTimeSubtract((CMTime *)((char *)&v14 + 8), &lhs, &rhs);
  }
  -[PUTrimToolController playerWrapper](self, "playerWrapper", v7, (_QWORD)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v14;
  v9 = v15;
  objc_msgSend(v6, "applyTrimTimeRange:", &v7);

}

- (void)_updateScrubberContents
{
  PXLivePhotoTrimScrubber *trimScrubber;
  void *v4;
  void *v5;

  trimScrubber = self->_trimScrubber;
  -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController currentVideoComposition](self, "currentVideoComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLivePhotoTrimScrubber setAsset:videoComposition:](trimScrubber, "setAsset:videoComposition:", v4, v5);

  -[PUTrimToolController _updateScrubberTimes](self, "_updateScrubberTimes");
  -[PUTrimToolController _updateSnapStripController](self, "_updateSnapStripController");
}

- (void)_updateScrubberTimes
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
  uint64_t v13;
  PXLivePhotoTrimScrubber *trimScrubber;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  PXLivePhotoTrimScrubber *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  PXLivePhotoTrimScrubber *v24;
  PXLivePhotoTrimScrubber *v25;
  int v26;
  double Seconds;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime time;
  int v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  CMTime time2;
  CMTime time1;
  char v47;
  __int128 v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  uint64_t v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  __int128 v58;
  uint64_t v59;
  CMTime v60;
  CMTime v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  -[PUTrimToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trimAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0uLL;
  v63 = 0;
  if (!v4)
  {
    v62 = *MEMORY[0x1E0CA2E68];
    v63 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    memset(&v61, 0, sizeof(v61));
LABEL_7:
    -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "duration");
    else
      memset(&v60, 0, sizeof(v60));
    v61 = v60;

    goto LABEL_11;
  }
  objc_msgSend(v4, "startTime");
  if ((BYTE12(v62) & 1) == 0)
  {
    v62 = *MEMORY[0x1E0CA2E68];
    v63 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  memset(&v61, 0, sizeof(v61));
  objc_msgSend(v4, "endTime");
  if (!((unsigned __int128)0 >> 96))
    goto LABEL_7;
LABEL_11:
  v58 = v62;
  v59 = v63;
  -[PXLivePhotoTrimScrubber setTrimStartTime:](self->_trimScrubber, "setTrimStartTime:", &v58);
  v57 = v61;
  -[PXLivePhotoTrimScrubber setTrimEndTime:](self->_trimScrubber, "setTrimEndTime:", &v57);
  memset(&v60, 0, sizeof(v60));
  -[PUTrimToolController originalStartTime](self, "originalStartTime");
  v56 = v60;
  -[PXLivePhotoTrimScrubber setOriginalStartTime:](self->_trimScrubber, "setOriginalStartTime:", &v56);
  if ((v60.flags & 1) != 0)
  {
    v55 = v60;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v55);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber setSnapTrimStartTimes:](self->_trimScrubber, "setSnapTrimStartTimes:", v8);

  }
  else
  {
    -[PXLivePhotoTrimScrubber setSnapTrimStartTimes:](self->_trimScrubber, "setSnapTrimStartTimes:", 0);
  }
  memset(&v55, 0, sizeof(v55));
  -[PUTrimToolController originalEndTime](self, "originalEndTime");
  v54 = v55;
  -[PXLivePhotoTrimScrubber setOriginalEndTime:](self->_trimScrubber, "setOriginalEndTime:", &v54);
  if ((v55.flags & 1) != 0)
  {
    v53 = v55;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v53);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber setSnapTrimEndTimes:](self->_trimScrubber, "setSnapTrimEndTimes:", v10);

  }
  else
  {
    -[PXLivePhotoTrimScrubber setSnapTrimEndTimes:](self->_trimScrubber, "setSnapTrimEndTimes:", 0);
  }
  -[PUTrimToolController compositionController](self, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mediaType");

  if (v13 != 2 && (-[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime"), (v50 & 1) != 0))
    -[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime");
  else
    -[PUTrimToolController playheadTime](self, "playheadTime");
  trimScrubber = self->_trimScrubber;
  v48 = v51;
  v49 = v52;
  -[PXLivePhotoTrimScrubber setKeyTime:](trimScrubber, "setKeyTime:", &v48);
  v15 = -[PUTrimToolController playheadStyle](self, "playheadStyle");
  if (v15 == 1)
    v16 = 1;
  else
    v16 = 2 * (v15 == 2);
  -[PXLivePhotoTrimScrubber setPlayheadStyle:](self->_trimScrubber, "setPlayheadStyle:", v16);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "disableVideoFilmstrip");

  if ((v18 & 1) == 0)
  {
    v19 = self->_trimScrubber;
    -[PUTrimToolController playerWrapper](self, "playerWrapper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "loupePlayerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLivePhotoTrimScrubber setLoupePlayerView:](v19, "setLoupePlayerView:", v21);

  }
  -[PUTrimToolController _updateSnappingDots](self, "_updateSnappingDots");
  -[PUTrimToolController suggestedKeyFrameTime](self, "suggestedKeyFrameTime");
  if ((v47 & 1) == 0)
    goto LABEL_33;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "showSuggestedKeyFrame");

  if (!v23)
    goto LABEL_33;
  v24 = self->_trimScrubber;
  if (v24)
    -[PXLivePhotoTrimScrubber suggestedKeyTime](v24, "suggestedKeyTime");
  else
    memset(&time1, 0, sizeof(time1));
  -[PUTrimToolController suggestedKeyFrameTime](self, "suggestedKeyFrameTime");
  if (CMTimeCompare(&time1, &time2))
  {
    -[PUTrimToolController suggestedKeyFrameTime](self, "suggestedKeyFrameTime");
    v25 = self->_trimScrubber;
    v41 = v43;
    v42 = v44;
    -[PXLivePhotoTrimScrubber setSuggestedKeyTime:](v25, "setSuggestedKeyTime:", &v41);
    v26 = 1;
  }
  else
  {
LABEL_33:
    v26 = 0;
  }
  if (-[PUTrimToolController isSlomoEnabled](self, "isSlomoEnabled"))
  {
    -[PXSlowMotionEditor setMinValue:](self->_slomoView, "setMinValue:", 0.0);
    -[PUTrimToolController unadjustedAssetDuration](self, "unadjustedAssetDuration");
    Seconds = 1.0;
    if ((v40 & 0x1D) == 1)
    {
      -[PUTrimToolController unadjustedAssetDuration](self, "unadjustedAssetDuration", 1.0);
      Seconds = CMTimeGetSeconds(&time);
    }
    -[PXSlowMotionEditor setMaxValue:](self->_slomoView, "setMaxValue:", Seconds);
    -[PUTrimToolController compositionController](self, "compositionController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "slomoAdjustmentController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v53, 0, sizeof(v53));
    if (v29)
    {
      objc_msgSend(v29, "startTime");
      if ((v53.flags & 0x1D) == 1)
      {
        v38 = v53;
        -[PXSlowMotionEditor setStartValue:](self->_slomoView, "setStartValue:", CMTimeGetSeconds(&v38));
      }
      memset(&v38, 0, sizeof(v38));
      objc_msgSend(v29, "endTime");
      if ((v38.flags & 0x1D) == 1)
      {
        v37 = v38;
        -[PXSlowMotionEditor setEndValue:](self->_slomoView, "setEndValue:", CMTimeGetSeconds(&v37));
      }
    }
    else
    {
      memset(&v38, 0, sizeof(v38));
    }
    -[PUTrimToolController slomoTimeForPlayheadUpdate](self, "slomoTimeForPlayheadUpdate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[PUTrimToolController slomoTimeForPlayheadUpdate](self, "slomoTimeForPlayheadUpdate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;

      CMTimeMakeWithSeconds(&v36, v33, 600);
      v35 = v36;
      -[PUTrimToolController setPlayheadTime:](self, "setPlayheadTime:", &v35);
    }
    -[PUTrimToolController setSlomoTimeForPlayheadUpdate:](self, "setSlomoTimeForPlayheadUpdate:", 0);

  }
  if (v26)
  {
    -[PUTrimToolController snapStripController](self, "snapStripController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "updateSnapStripView");

  }
}

- (void)_updateScrubberFocusEventTimes
{
  NSArray *v3;
  char v4;
  NSArray *v5;
  NSArray *focusEventTimes;

  focusEventTimes = self->_focusEventTimes;
  -[PXLivePhotoTrimScrubber focusEventTimes](self->_trimScrubber, "focusEventTimes");
  v3 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  if (focusEventTimes == v3)
  {

  }
  else
  {
    v4 = -[NSArray isEqual:](focusEventTimes, "isEqual:", v3);

    if ((v4 & 1) == 0)
    {
      if (-[NSArray count](self->_focusEventTimes, "count") && self->_isPortraitVideo && self->_portraitVideoEnabled)
        v5 = self->_focusEventTimes;
      else
        v5 = 0;
      -[PXLivePhotoTrimScrubber setFocusEventTimes:](self->_trimScrubber, "setFocusEventTimes:", v5);
      -[PUTrimToolController _updateSnappingDots](self, "_updateSnappingDots");
      -[PUTrimToolController _hideScrubberTimelineOverlay](self, "_hideScrubberTimelineOverlay");
    }
  }
}

- (void)_updateSnappingDots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v9[48];
  _BYTE v10[48];

  if (-[PUTrimToolController _allowsKeyFrameCreation](self, "_allowsKeyFrameCreation"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 2);
    -[PUTrimToolController unadjustedStillImageTime](self, "unadjustedStillImageTime");
    if ((v10[36] & 0x1D) == 1)
    {
      v4 = (void *)MEMORY[0x1E0CB3B18];
      -[PUTrimToolController unadjustedStillImageTime](self, "unadjustedStillImageTime");
      objc_msgSend(v4, "valueWithCMTime:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    -[PUTrimToolController adjustedStillFrameTime](self, "adjustedStillFrameTime");
    if ((v9[36] & 0x1D) == 1)
    {
      v6 = (void *)MEMORY[0x1E0CB3B18];
      -[PUTrimToolController adjustedStillFrameTime](self, "adjustedStillFrameTime");
      objc_msgSend(v6, "valueWithCMTime:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubber setSnapKeyTimes:](self->_trimScrubber, "setSnapKeyTimes:", v8);

    }
  }
}

- (void)_updateVideo
{
  void *v3;
  _QWORD v4[5];

  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PUTrimToolController__updateVideo__block_invoke;
  v4[3] = &unk_1E58AA1D0;
  v4[4] = self;
  objc_msgSend(v3, "requestAssetWithCompletion:", v4);

}

- (void)_updateSlomoViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  PXSlowMotionEditor *v5;
  PXSlowMotionEditor *slomoView;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[5];

  v3 = a3;
  if (-[PUTrimToolController isSlomoEnabled](self, "isSlomoEnabled"))
  {
    if (!self->_slomoView)
    {
      v5 = (PXSlowMotionEditor *)objc_alloc_init(MEMORY[0x1E0D7BB78]);
      slomoView = self->_slomoView;
      self->_slomoView = v5;

      -[PXSlowMotionEditor setClipsToBounds:](self->_slomoView, "setClipsToBounds:", 1);
      -[PXSlowMotionEditor setTranslatesAutoresizingMaskIntoConstraints:](self->_slomoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PXSlowMotionEditor setDelegate:](self->_slomoView, "setDelegate:", self);
      -[PXSlowMotionEditor setRegionEditorStyle:](self->_slomoView, "setRegionEditorStyle:", 1);
      -[PXSlowMotionEditor setTrimHandleWidth:](self->_slomoView, "setTrimHandleWidth:", 0.0);
      -[UIVisualEffectView contentView](self->_auxilaryContainerView, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_slomoView);

      -[PXSlowMotionEditor leftAnchor](self->_slomoView, "leftAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView leftAnchor](self->_auxilaryContainerView, "leftAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 66.0;
      if (!self->_playButtonEnabled)
        v10 = 24.0;
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 1);

      -[PXSlowMotionEditor rightAnchor](self->_slomoView, "rightAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView rightAnchor](self->_auxilaryContainerView, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -18.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActive:", 1);

      -[PXSlowMotionEditor centerYAnchor](self->_slomoView, "centerYAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView centerYAnchor](self->_auxilaryContainerView, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActive:", 1);

    }
    -[PUTrimToolController _updateScrubberTimes](self, "_updateScrubberTimes");
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUTrimToolController__updateSlomoViewAnimated___block_invoke;
  aBlock[3] = &unk_1E58ABD10;
  aBlock[4] = self;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v18, 0.2);
  else
    (*((void (**)(void *))v18 + 2))(v18);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_frameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  int64_t var3;
  __int128 v13;
  int64_t v14;

  v13 = 0uLL;
  v14 = 0;
  result = -[PUTrimToolController cachedFrameDuration](self, "cachedFrameDuration");
  if ((BYTE12(v13) & 1) != 0)
  {
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var3 = v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D75130];
    v7 = *MEMORY[0x1E0C8A808];
    -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tracksWithMediaType:forAsset:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
    retstr->var0 = 0;
    objc_msgSend(MEMORY[0x1E0D52348], "minimumFrameDurationForAssetTrack:", v10);
    v11 = *(_OWORD *)&retstr->var0;
    var3 = retstr->var3;
    -[PUTrimToolController setCachedFrameDuration:](self, "setCachedFrameDuration:", &v11);

  }
  return result;
}

- (double)_frameRate
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  -[PUTrimToolController cachedFrameRate](self, "cachedFrameRate");
  v4 = v3;
  if (v3 == 0.0)
  {
    v5 = (void *)MEMORY[0x1E0D75130];
    v6 = *MEMORY[0x1E0C8A808];
    -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tracksWithMediaType:forAsset:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nominalFrameRate");
    v4 = v10;

    -[PUTrimToolController setCachedFrameRate:](self, "setCachedFrameRate:", v4);
  }
  return v4;
}

- (void)_resetScrubberToStillPhotoFrame
{
  PXLivePhotoTrimScrubber *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = self->_trimScrubber;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  -[PUTrimToolController currentStillFrameTime](self, "currentStillFrameTime");
  -[PUTrimToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0uLL;
  v13 = 0;
  if (v5)
  {
    objc_msgSend(v5, "startTime");
    v10 = 0uLL;
    v11 = 0;
    objc_msgSend(v5, "endTime");
    if ((BYTE12(v12) & 1) != 0)
    {
      v8 = v12;
      v9 = v13;
      -[PXLivePhotoTrimScrubber setTrimStartTime:](v3, "setTrimStartTime:", &v8);
    }
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
  }
  if ((BYTE12(v10) & 1) != 0)
  {
    v6 = v10;
    v7 = v11;
    -[PXLivePhotoTrimScrubber setTrimEndTime:](v3, "setTrimEndTime:", &v6);
  }

}

- (CGRect)_presentationRectFromLoupeRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[PXLivePhotoTrimScrubber loupeRect](self->_trimScrubber, "loupeRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXLivePhotoTrimScrubber superview](self->_trimScrubber, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", self->_trimScrubber, v4, v6);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_livePhotoKeyFramePickerDidDismiss:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;

  v4 = a3;
  -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUTrimToolController setInternalState:](self, "setInternalState:", 0);
    -[PUTrimToolController setLivePhotoKeyFramePicker:](self, "setLivePhotoKeyFramePicker:", 0);
    if (-[PXLivePhotoTrimScrubber currentlyInteractingElement](self->_trimScrubber, "currentlyInteractingElement") != 3)
    {
      -[PUTrimToolController currentEditSource](self, "currentEditSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        -[PUTrimToolController _resetScrubberToStillPhotoFrame](self, "_resetScrubberToStillPhotoFrame");
    }
    -[PUTrimToolController snapStripController](self, "snapStripController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSnapStripView");

  }
}

- (void)_updatePlayPauseButton
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUTrimToolController _playPauseButtonIfLoaded](self, "_playPauseButtonIfLoaded");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUTrimToolController playerWrapper](self, "playerWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isReadyToPlay"))
    {
      objc_msgSend(v7, "setEnabled:", 1);
      if (objc_msgSend(v3, "isPlaying"))
        v4 = CFSTR("PUVideoEditPauseButton");
      else
        v4 = CFSTR("PUVideoEditPlayButton");
      objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageWithRenderingMode:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setImage:forState:", v6, 0);
    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 0);
    }

  }
}

- (void)_handlePlayPauseButton:(id)a3
{
  id v3;

  -[PUTrimToolController playerWrapper](self, "playerWrapper", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPlaying"))
    objc_msgSend(v3, "pause");
  else
    objc_msgSend(v3, "play");

}

- (void)play
{
  id v2;

  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)pause
{
  id v2;

  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)stepByCount:(int64_t)a3
{
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  _BYTE v10[24];

  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController playheadTime](self, "playheadTime");
  objc_msgSend(v5, "stepByCount:playheadTime:", a3, v10);
  v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PUTrimToolController_stepByCount___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentPlayerScaledTimeFromOriginalTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;
  void *v9;
  void *v10;
  Float64 Seconds;
  float v12;
  CMTime v13;
  CMTime lhs;
  CMTime rhs;
  CMTime time;

  *retstr = *a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PUTrimToolController isSlomoEnabled](self, "isSlomoEnabled");
  if ((_DWORD)result && (a4->var2 & 0x1D) == 1)
  {
    -[PUTrimToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trimAdjustmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "startTime");
      lhs = (CMTime)*a4;
      CMTimeSubtract(&time, &lhs, &rhs);
      *(CMTime *)a4 = time;
    }
    -[PUTrimToolController _slomoMapperForCurrentConfiguration](self, "_slomoMapperForCurrentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(float *)&Seconds = Seconds;
      objc_msgSend(v10, "scaledTimeForOriginalTime:", Seconds);
      CMTimeMakeWithSeconds(&time, v12, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
      *(CMTime *)retstr = time;
    }
    if (v9)
    {
      objc_msgSend(v9, "startTime");
      lhs = (CMTime)*retstr;
      CMTimeAdd(&time, &lhs, &v13);
      *(CMTime *)retstr = time;
    }

  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_originalTimeFromCurrentPlayerScaledTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;
  void *v9;
  void *v10;
  Float64 Seconds;
  float v12;
  CMTime v13;
  CMTime lhs;
  CMTime rhs;
  CMTime time;

  *retstr = *a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PUTrimToolController isSlomoEnabled](self, "isSlomoEnabled");
  if ((_DWORD)result && (a4->var2 & 0x1D) == 1)
  {
    -[PUTrimToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trimAdjustmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "startTime");
      lhs = (CMTime)*a4;
      CMTimeSubtract(&time, &lhs, &rhs);
      *(CMTime *)a4 = time;
    }
    -[PUTrimToolController _slomoMapperForCurrentConfiguration](self, "_slomoMapperForCurrentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(float *)&Seconds = Seconds;
      objc_msgSend(v10, "originalTimeForScaledTime:", Seconds);
      CMTimeMakeWithSeconds(&time, v12, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
      *(CMTime *)retstr = time;
    }
    if (v9)
    {
      objc_msgSend(v9, "startTime");
      lhs = (CMTime)*retstr;
      CMTimeAdd(&time, &lhs, &v13);
      *(CMTime *)retstr = time;
    }

  }
  return result;
}

- (id)_slomoMapperForCurrentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Seconds;
  double v11;
  double v12;
  void *v13;
  CMTimeRange v15;
  CMTimeRange otherRange;
  CMTimeRange time;
  CMTime rhs;
  CMTime v19;
  __int128 v20;
  CMTimeEpoch v21;
  CMTime end;
  CMTime start;
  CMTimeRange v24;

  -[PUTrimToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slomoAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v24, 0, sizeof(v24));
  if (v4)
  {
    objc_msgSend(v4, "startTime");
    objc_msgSend(v4, "endTime");
  }
  else
  {
    memset(&start, 0, sizeof(start));
    memset(&end, 0, sizeof(end));
  }
  CMTimeRangeFromTimeToTime(&v24, &start, &end);
  v20 = 0uLL;
  v21 = 0;
  -[PUTrimToolController currentVideoAsset](self, "currentVideoAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "duration");
  }
  else
  {
    v20 = 0uLL;
    v21 = 0;
  }

  -[PUTrimToolController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trimAdjustmentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    memset(&v19, 0, sizeof(v19));
    objc_msgSend(v8, "startTime");
    *(_OWORD *)&v15.start.value = *(_OWORD *)&v24.start.value;
    v15.start.epoch = v24.start.epoch;
    rhs = v19;
    CMTimeSubtract(&time.start, &v15.start, &rhs);
    *(_OWORD *)&v24.start.value = *(_OWORD *)&time.start.value;
    v24.start.epoch = time.start.epoch;
    *(_OWORD *)&time.start.value = *MEMORY[0x1E0CA2E68];
    time.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&v15.start.value = *MEMORY[0x1E0CA2E30];
    v15.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    CMTimeRangeMake(&otherRange, &time.start, &v15.start);
    v15 = v24;
    CMTimeRangeGetIntersection(&time, &v15, &otherRange);
    v24 = time;
  }
  v9 = (void *)MEMORY[0x1E0D75298];
  *(_OWORD *)&time.start.value = v20;
  time.start.epoch = v21;
  Seconds = CMTimeGetSeconds(&time.start);
  objc_msgSend(v4, "rate");
  *(float *)&v12 = v11;
  time = v24;
  objc_msgSend(v9, "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &time, 1, Seconds, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)compositionDidUpdateForPlayerWrapper:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)playerStatusChangedForPlayerWrapper:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (void)playerWrapper:(id)a3 timeChanged:(id *)a4
{
  px_dispatch_on_main_queue();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController _livePhotoKeyFramePickerDidDismiss:](self, "_livePhotoKeyFramePickerDidDismiss:", v6);

  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)userDidRequestToMakeKeyPhoto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PXLivePhotoTrimScrubber *trimScrubber;
  void *v8;
  void *v9;
  void *v10;
  PXLivePhotoTrimScrubber *v11;
  int32_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  CMTime time2;
  CMTime time1;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = a3;
  -[PUTrimToolController livePhotoKeyFramePicker](self, "livePhotoKeyFramePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUTrimToolController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willModifyAdjustment");

    trimScrubber = self->_trimScrubber;
    if (trimScrubber)
    {
      -[PXLivePhotoTrimScrubber keyTime](trimScrubber, "keyTime");
    }
    else
    {
      v23 = 0uLL;
      v24 = 0;
    }
    v21 = v23;
    v22 = v24;
    -[PUTrimToolController setAdjustedStillFrameTime:](self, "setAdjustedStillFrameTime:", &v21);
    -[PUTrimToolController _updateCompositionController](self, "_updateCompositionController");
    -[PUTrimToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTrimToolController updateLivePortraitForKeyFrameChange:](self, "updateLivePortraitForKeyFrameChange:", v8);

    -[PUTrimToolController _updateScrubberTimes](self, "_updateScrubberTimes");
    -[PUTrimToolController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("PHOTOEDIT_MAKE_KEY_FRAME_ACTION_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didModifyAdjustmentWithLocalizedName:", v10);

    v11 = self->_trimScrubber;
    if (v11)
      -[PXLivePhotoTrimScrubber keyTime](v11, "keyTime");
    else
      memset(&time1, 0, sizeof(time1));
    -[PUTrimToolController unadjustedStillImageTime](self, "unadjustedStillImageTime");
    v12 = CMTimeCompare(&time1, &time2);
    -[PUTrimToolController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "removeCropToolGainMap");
    else
      objc_msgSend(v13, "addCropToolGainMapIfNeeded");

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__PUTrimToolController_userDidRequestToMakeKeyPhoto___block_invoke;
    v15[3] = &unk_1E58AB210;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)updateLivePortraitForKeyFrameChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUTrimToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "livePortraitBehaviorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "applySideEffectsForAction:compositionController:", 5, v6);

}

- (void)slowMotionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  -[PUTrimToolController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willModifyAdjustment");

  -[PUTrimToolController setInternalState:](self, "setInternalState:", 3);
  -[PXLivePhotoTrimScrubber setPlayheadStyle:](self->_trimScrubber, "setPlayheadStyle:", 0);
  -[PUTrimToolController setSlomoDraggingStartHandle:](self, "setSlomoDraggingStartHandle:", v4);
  -[PUTrimToolController _updateTimeCodeOverlay](self, "_updateTimeCodeOverlay");
  -[PUTrimToolController _dismissKeyFramePickerAndResetToStillFrame](self, "_dismissKeyFramePickerAndResetToStillFrame");
}

- (void)slowMotionEditorDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PUTrimToolController setInternalState:](self, "setInternalState:", 0);
  -[PUTrimToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D71450];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PUTrimToolController_slowMotionEditorDidEndEditing___block_invoke;
  v8[3] = &unk_1E58AA220;
  v8[4] = self;
  objc_msgSend(v4, "modifyAdjustmentWithKey:modificationBlock:", v5, v8);

  -[PUTrimToolController _updateCompositionController](self, "_updateCompositionController");
  -[PUTrimToolController _updateDebugTimeCodeLabel](self, "_updateDebugTimeCodeLabel");
  PLSAggregateDictionaryAddValueForScalarKey();
  -[PUTrimToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("PHOTOEDIT_SLOMO_ACTION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didModifyAdjustmentWithLocalizedName:", v7);

}

- (void)slowMotionEditorStartValueChanged:(id)a3
{
  Float64 v4;
  void *v5;
  void *v6;
  CMTime v7;
  CMTime v8;

  -[PXSlowMotionEditor startValue](self->_slomoView, "startValue", a3);
  CMTimeMakeWithSeconds(&v8, v4, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
  v7 = v8;
  -[PUTrimToolController setPlayheadTime:](self, "setPlayheadTime:", &v7);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PXSlowMotionEditor startValue](self->_slomoView, "startValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController setSlomoTimeForPlayheadUpdate:](self, "setSlomoTimeForPlayheadUpdate:", v6);

  -[PUTrimToolController _updateTimeCodeOverlay](self, "_updateTimeCodeOverlay");
}

- (void)slowMotionEditorEndValueChanged:(id)a3
{
  Float64 v4;
  void *v5;
  void *v6;
  CMTime v7;
  CMTime v8;

  -[PXSlowMotionEditor endValue](self->_slomoView, "endValue", a3);
  CMTimeMakeWithSeconds(&v8, v4, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
  v7 = v8;
  -[PUTrimToolController setPlayheadTime:](self, "setPlayheadTime:", &v7);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PXSlowMotionEditor endValue](self->_slomoView, "endValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController setSlomoTimeForPlayheadUpdate:](self, "setSlomoTimeForPlayheadUpdate:", v6);

  -[PUTrimToolController _updateTimeCodeOverlay](self, "_updateTimeCodeOverlay");
}

- (BOOL)slowMotionEditorRequestForceZoom:(id)a3
{
  _BOOL4 v4;
  PXSlowMotionEditor *slomoView;
  Float64 v6;
  PXLivePhotoTrimScrubber *trimScrubber;
  CMTime v9;

  v4 = -[PUTrimToolController slomoDraggingStartHandle](self, "slomoDraggingStartHandle", a3);
  slomoView = self->_slomoView;
  if (v4)
    -[PXSlowMotionEditor startValue](slomoView, "startValue");
  else
    -[PXSlowMotionEditor endValue](slomoView, "endValue");
  trimScrubber = self->_trimScrubber;
  CMTimeMakeWithSeconds(&v9, v6, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
  return -[PXLivePhotoTrimScrubber tryZoomAtTime:](trimScrubber, "tryZoomAtTime:", &v9);
}

- (void)slowMotionEditorRequestForceUnzoom:(id)a3
{
  -[PXLivePhotoTrimScrubber unzoom](self->_trimScrubber, "unzoom", a3);
}

- (void)_handleScrubberTimelineOverlayButton:(id)a3
{
  PXFocusTimelineAction *focusTimelineAction;
  uint64_t v5;
  void *v6;
  PXFocusTimelineAction *v7;
  _QWORD v8[3];

  focusTimelineAction = self->_focusTimelineAction;
  if (focusTimelineAction)
  {
    v5 = -[PXFocusTimelineAction kind](focusTimelineAction, "kind", a3);
    if (v5 == 1)
    {
      self->_objectTrackingShouldStop = 1;
    }
    else if (!v5)
    {
      -[PUTrimToolController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_focusTimelineAction;
      if (v7)
        -[PXFocusTimelineAction time](v7, "time");
      else
        memset(v8, 0, sizeof(v8));
      objc_msgSend(v6, "removeFocusDecisionAtTime:", v8);

    }
    -[PUTrimToolController _hideScrubberTimelineOverlay](self, "_hideScrubberTimelineOverlay");
  }
}

- (void)_updateScrubberTimelineOverlayButtonOffset
{
  double v3;
  double v4;
  double v5;
  double MidY;
  PXLivePhotoTrimScrubber *trimScrubber;
  PXFocusTimelineAction *focusTimelineAction;
  double v9;
  void *v10;
  _QWORD v11[3];
  CGRect v12;

  if (-[PUTrimToolController isPortraitVideo](self, "isPortraitVideo") && self->_focusTimelineAction)
  {
    if (-[PXLivePhotoTrimScrubber useMiniScrubber](self->_trimScrubber, "useMiniScrubber"))
      v3 = 1.0;
    else
      v3 = 4.0;
    -[PUTrimToolController scrubberHeight](self, "scrubberHeight");
    v5 = v4 + v3 * -2.0;
    -[PXLivePhotoTrimScrubber frame](self->_trimScrubber, "frame");
    MidY = CGRectGetMidY(v12);
    trimScrubber = self->_trimScrubber;
    focusTimelineAction = self->_focusTimelineAction;
    if (focusTimelineAction)
      -[PXFocusTimelineAction time](focusTimelineAction, "time");
    else
      memset(v11, 0, sizeof(v11));
    -[PXLivePhotoTrimScrubber offsetForTime:](trimScrubber, "offsetForTime:", v11);
    -[UIButton setFrame:](self->_trimScrubberTimelineOverlayButton, "setFrame:", v9 - v5 * 0.5, MidY - v5 * 0.5, v5, v5);
    -[UIButton layer](self->_trimScrubberTimelineOverlayButton, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", v5 * 0.5);

  }
}

- (void)_hideScrubberTimelineOverlay
{
  PXFocusTimelineAction *focusTimelineAction;
  void *v4;
  _QWORD v5[5];

  if (!-[UIView isHidden](self->_trimScrubberTimelineOverlayView, "isHidden"))
  {
    focusTimelineAction = self->_focusTimelineAction;
    self->_focusTimelineAction = 0;

    -[PUTrimToolController playPauseButton](self, "playPauseButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

    -[PUTrimToolController _updateScrubberPresentedPlayhead](self, "_updateScrubberPresentedPlayhead");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__PUTrimToolController__hideScrubberTimelineOverlay__block_invoke;
    v5[3] = &unk_1E58ABD10;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.2);
  }
}

- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5
{
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[3];

  v7 = a4;
  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pause");

  -[PUTrimToolController playerWrapper](self, "playerWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "time");
  else
    memset(v16, 0, sizeof(v16));
  objc_msgSend(v9, "seekToTime:", v16);

  if (objc_msgSend(v7, "kind") == 2)
  {
    -[PUTrimToolController _hideScrubberTimelineOverlay](self, "_hideScrubberTimelineOverlay");
  }
  else
  {
    objc_storeStrong((id *)&self->_focusTimelineAction, a4);
    self->_objectTrackingShouldStop = 0;
    if (objc_msgSend(v7, "kind"))
      v10 = CFSTR("xmark");
    else
      v10 = CFSTR("trash");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithSymbolConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_trimScrubberTimelineOverlayButton, "setImage:forState:", v13, 0);
    -[PUTrimToolController _updateScrubberTimelineOverlayButtonOffset](self, "_updateScrubberTimelineOverlayButtonOffset");
    -[PXLivePhotoTrimScrubber setPlayheadStyle:](self->_trimScrubber, "setPlayheadStyle:", 0);
    -[UIView setHidden:](self->_trimScrubberTimelineOverlayView, "setHidden:", 0);
    -[PUTrimToolController playPauseButton](self, "playPauseButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 0);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__PUTrimToolController_focusTimeline_presentAction_locationInTimeline___block_invoke;
    v15[3] = &unk_1E58ABD10;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v15, 0.2);

  }
}

- (void)focusTimeline:(id)a3 updateTrackingProgressShouldStop:(BOOL *)a4
{
  if (self->_objectTrackingShouldStop)
    *a4 = 1;
}

- (id)axDescriptionForFocusEventATime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[PUTrimToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  objc_msgSend(v4, "axDescriptionForFocusDecisionAtTime:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PUTrimToolControllerDelegate)delegate
{
  return (PUTrimToolControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXTrimToolPlayerWrapper)playerWrapper
{
  return self->_playerWrapper;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1328);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1352);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1376);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1400);
  return self;
}

- (void)setSuggestedKeyFrameTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_suggestedKeyFrameTime.value = *(_OWORD *)&a3->var0;
  self->_suggestedKeyFrameTime.epoch = var3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (BOOL)isPerformingLiveInteraction
{
  return self->_isPerformingLiveInteraction;
}

- (void)setIsPerformingLiveInteraction:(BOOL)a3
{
  self->_isPerformingLiveInteraction = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)isPortraitVideo
{
  return self->_isPortraitVideo;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (UIVisualEffectView)auxilaryContainerView
{
  return self->_auxilaryContainerView;
}

- (void)setAuxilaryContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_auxilaryContainerView, a3);
}

- (UIVisualEffectView)scrubberPlayButtonContainerView
{
  return self->_scrubberPlayButtonContainerView;
}

- (void)setScrubberPlayButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberPlayButtonContainerView, a3);
}

- (NSLayoutConstraint)scrubberContainerToAuxiliaryContainerConstraint
{
  return self->_scrubberContainerToAuxiliaryContainerConstraint;
}

- (void)setScrubberContainerToAuxiliaryContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberContainerToAuxiliaryContainerConstraint, a3);
}

- (NSLayoutConstraint)scrubberContainerToSuperviewConstraint
{
  return self->_scrubberContainerToSuperviewConstraint;
}

- (void)setScrubberContainerToSuperviewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberContainerToSuperviewConstraint, a3);
}

- (PULivePhotoKeyFrameSelectionViewController)livePhotoKeyFramePicker
{
  return (PULivePhotoKeyFrameSelectionViewController *)objc_loadWeakRetained((id *)&self->_livePhotoKeyFramePicker);
}

- (void)setLivePhotoKeyFramePicker:(id)a3
{
  objc_storeWeak((id *)&self->_livePhotoKeyFramePicker, a3);
}

- (NSTimer)livePhotoKeyFramePickerAppearanceTimer
{
  return self->_livePhotoKeyFramePickerAppearanceTimer;
}

- (void)setLivePhotoKeyFramePickerAppearanceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoKeyFramePickerAppearanceTimer, a3);
}

- (PLPhotoEditRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (AVAsset)currentVideoAsset
{
  return self->_currentVideoAsset;
}

- (AVVideoComposition)currentVideoComposition
{
  return self->_currentVideoComposition;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1424);
  return self;
}

- (void)setCachedFrameDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_cachedFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_cachedFrameDuration.epoch = var3;
}

- (double)cachedFrameRate
{
  return self->_cachedFrameRate;
}

- (void)setCachedFrameRate:(double)a3
{
  self->_cachedFrameRate = a3;
}

- (PXLivePhotoTrimScrubberSnapStripController)snapStripController
{
  return self->_snapStripController;
}

- (void)setSnapStripController:(id)a3
{
  objc_storeStrong((id *)&self->_snapStripController, a3);
}

- (PULivePhotoTrimScrubberSnapStripControllerSpec)snapStripSpec
{
  return self->_snapStripSpec;
}

- (void)setSnapStripSpec:(id)a3
{
  objc_storeStrong((id *)&self->_snapStripSpec, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1448);
  return self;
}

- (void)setUnadjustedAssetDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_unadjustedAssetDuration.value = *(_OWORD *)&a3->var0;
  self->_unadjustedAssetDuration.epoch = var3;
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- (unint64_t)internalState
{
  return self->_internalState;
}

- (BOOL)slomoDraggingStartHandle
{
  return self->_slomoDraggingStartHandle;
}

- (void)setSlomoDraggingStartHandle:(BOOL)a3
{
  self->_slomoDraggingStartHandle = a3;
}

- (BOOL)playButtonEnabled
{
  return self->_playButtonEnabled;
}

- (NSNumber)slomoTimeForPlayheadUpdate
{
  return self->_slomoTimeForPlayheadUpdate;
}

- (void)setSlomoTimeForPlayheadUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_slomoTimeForPlayheadUpdate, a3);
}

- (UILabel)debugTimeCodeLabel
{
  return self->_debugTimeCodeLabel;
}

- (void)setDebugTimeCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugTimeCodeLabel, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)debugPlayerTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1472);
  return self;
}

- (UILabel)debugPlayerTimeLabel
{
  return self->_debugPlayerTimeLabel;
}

- (void)setDebugPlayerTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugPlayerTimeLabel, a3);
}

- (UILabel)debugOriginalTimeLabel
{
  return self->_debugOriginalTimeLabel;
}

- (void)setDebugOriginalTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugOriginalTimeLabel, a3);
}

- (UILabel)debugTrimToolStateLabel
{
  return self->_debugTrimToolStateLabel;
}

- (void)setDebugTrimToolStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugTrimToolStateLabel, a3);
}

- (UILabel)debugTrimToolPlayheadStyleLabel
{
  return self->_debugTrimToolPlayheadStyleLabel;
}

- (void)setDebugTrimToolPlayheadStyleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugTrimToolPlayheadStyleLabel, a3);
}

- (UIView)debugStartRectView
{
  return self->_debugStartRectView;
}

- (void)setDebugStartRectView:(id)a3
{
  objc_storeStrong((id *)&self->_debugStartRectView, a3);
}

- (UIView)debugEndRectView
{
  return self->_debugEndRectView;
}

- (void)setDebugEndRectView:(id)a3
{
  objc_storeStrong((id *)&self->_debugEndRectView, a3);
}

- (UIView)debugStartOffsetView
{
  return self->_debugStartOffsetView;
}

- (void)setDebugStartOffsetView:(id)a3
{
  objc_storeStrong((id *)&self->_debugStartOffsetView, a3);
}

- (UIView)debugEndOffsetView
{
  return self->_debugEndOffsetView;
}

- (void)setDebugEndOffsetView:(id)a3
{
  objc_storeStrong((id *)&self->_debugEndOffsetView, a3);
}

- (PXFocusTimelineView)focusTimelineView
{
  return self->_focusTimelineView;
}

- (void)setFocusTimelineView:(id)a3
{
  objc_storeStrong((id *)&self->_focusTimelineView, a3);
}

- (UIView)trimScrubberTimelineOverlayView
{
  return self->_trimScrubberTimelineOverlayView;
}

- (void)setTrimScrubberTimelineOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayView, a3);
}

- (UIButton)trimScrubberTimelineOverlayButton
{
  return self->_trimScrubberTimelineOverlayButton;
}

- (void)setTrimScrubberTimelineOverlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayButton, a3);
}

- (PXFocusTimelineAction)focusTimelineAction
{
  return self->_focusTimelineAction;
}

- (void)setFocusTimelineAction:(id)a3
{
  objc_storeStrong((id *)&self->_focusTimelineAction, a3);
}

- (BOOL)objectTrackingShouldStop
{
  return self->_objectTrackingShouldStop;
}

- (void)setObjectTrackingShouldStop:(BOOL)a3
{
  self->_objectTrackingShouldStop = a3;
}

- (BOOL)portraitVideoEnabled
{
  return self->_portraitVideoEnabled;
}

- (void)setPortraitVideoEnabled:(BOOL)a3
{
  self->_portraitVideoEnabled = a3;
}

- (NSArray)focusEventTimes
{
  return self->_focusEventTimes;
}

- (void)setFocusEventTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_focusTimelineAction, 0);
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayButton, 0);
  objc_storeStrong((id *)&self->_trimScrubberTimelineOverlayView, 0);
  objc_storeStrong((id *)&self->_focusTimelineView, 0);
  objc_storeStrong((id *)&self->_debugEndOffsetView, 0);
  objc_storeStrong((id *)&self->_debugStartOffsetView, 0);
  objc_storeStrong((id *)&self->_debugEndRectView, 0);
  objc_storeStrong((id *)&self->_debugStartRectView, 0);
  objc_storeStrong((id *)&self->_debugTrimToolPlayheadStyleLabel, 0);
  objc_storeStrong((id *)&self->_debugTrimToolStateLabel, 0);
  objc_storeStrong((id *)&self->_debugOriginalTimeLabel, 0);
  objc_storeStrong((id *)&self->_debugPlayerTimeLabel, 0);
  objc_storeStrong((id *)&self->_debugTimeCodeLabel, 0);
  objc_storeStrong((id *)&self->_slomoTimeForPlayheadUpdate, 0);
  objc_storeStrong((id *)&self->_snapStripSpec, 0);
  objc_storeStrong((id *)&self->_snapStripController, 0);
  objc_storeStrong((id *)&self->_currentVideoComposition, 0);
  objc_storeStrong((id *)&self->_currentVideoAsset, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFramePickerAppearanceTimer, 0);
  objc_destroyWeak((id *)&self->_livePhotoKeyFramePicker);
  objc_storeStrong((id *)&self->_scrubberContainerToSuperviewConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberContainerToAuxiliaryContainerConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberPlayButtonContainerView, 0);
  objc_storeStrong((id *)&self->_auxilaryContainerView, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_playerWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_updateVideoCoalescer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_timeCodeHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_timeCodeOverlayView, 0);
  objc_storeStrong((id *)&self->_slomoView, 0);
  objc_storeStrong((id *)&self->_trimScrubber, 0);
}

uint64_t __71__PUTrimToolController_focusTimeline_presentAction_locationInTimeline___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setAlpha:", 1.0);
}

uint64_t __52__PUTrimToolController__hideScrubberTimelineOverlay__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setHidden:", 1);
}

void __54__PUTrimToolController_slowMotionEditorDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  Float64 v5;
  Float64 v6;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  v4 = a2;
  objc_msgSend(v3, "startValue");
  CMTimeMakeWithSeconds(&v10, v5, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
  v9 = v10;
  objc_msgSend(v4, "setStartTime:", &v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "endValue");
  CMTimeMakeWithSeconds(&v8, v6, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
  v7 = v8;
  objc_msgSend(v4, "setEndTime:", &v7);

}

void __53__PUTrimToolController_userDidRequestToMakeKeyPhoto___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_livePhotoKeyFramePickerDidDismiss:", *(_QWORD *)(a1 + 32));

}

uint64_t __50__PUTrimToolController_playerWrapper_timeChanged___block_invoke(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v2 = (__int128 *)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 56);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "currentlyInteractingElement"))
  {
    v12 = 0uLL;
    v13 = 0;
    v3 = *(void **)(a1 + 32);
    v10 = v14;
    v11 = v15;
    objc_msgSend(v3, "_originalTimeFromCurrentPlayerScaledTime:", &v10);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
    v8 = v12;
    v9 = v13;
    objc_msgSend(v4, "setKeyTime:", &v8);
  }
  v6 = *v2;
  v7 = *((_QWORD *)v2 + 2);
  return objc_msgSend(*(id *)(a1 + 32), "setDebugPlayerTime:", &v6);
}

uint64_t __60__PUTrimToolController_playerStatusChangedForPlayerWrapper___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
    objc_msgSend(*(id *)(a1 + 32), "setInternalState:", objc_msgSend(*(id *)(a1 + 40), "isPlaying"));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlayPauseButton");
}

void __61__PUTrimToolController_compositionDidUpdateForPlayerWrapper___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[985])
    goto LABEL_2;
  objc_msgSend(v2, "currentVideoAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v2 = *(_BYTE **)(a1 + 32);
LABEL_2:
    v2[985] = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "update");
  }
}

uint64_t __36__PUTrimToolController_stepByCount___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "currentTime");
  else
    memset(v4, 0, sizeof(v4));
  return objc_msgSend(v1, "playerWrapper:timeChanged:", v2, v4);
}

uint64_t __55__PUTrimToolController__resetScrubberToStillPhotoFrame__block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "setKeyTime:", &v2);
}

uint64_t __49__PUTrimToolController__updateSlomoViewAnimated___block_invoke(uint64_t a1)
{
  int v2;
  double v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isSlomoEnabled");
  v3 = 0.0;
  if (v2)
    v3 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAlpha:", v3);
}

void __36__PUTrimToolController__updateVideo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  px_dispatch_on_main_queue();

}

void __36__PUTrimToolController__updateVideo__block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;

  if (a1[4])
  {
    objc_msgSend(a1[5], "currentVideoComposition");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 == a1[6])
    {
      objc_msgSend(a1[5], "currentVideoAsset");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = a1[4];

      if (v4 == v5)
        return;
    }
    else
    {

    }
    objc_storeStrong((id *)a1[5] + 145, a1[6]);
    objc_storeStrong((id *)a1[5] + 144, a1[4]);
    v6 = a1[5];
    v7 = *MEMORY[0x1E0CA2E18];
    v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v6, "setCachedFrameDuration:", &v7);
    objc_msgSend(a1[5], "setCachedFrameRate:", 0.0);
    objc_msgSend(a1[5], "_updateScrubberContents");
    objc_msgSend(a1[5], "_updateDebugTimeCodeLabel");
    objc_msgSend(a1[5], "_updateDebugPlayerTimeLabel");
    *((_BYTE *)a1[5] + 985) = 1;
  }
}

void __52__PUTrimToolController__updateCompositionController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[5];
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D71260], "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 128))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 68) & 1) != 0)
      {
        v9 = *MEMORY[0x1E0D71378];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_2;
        v23[3] = &unk_1E58AA140;
        v24 = *(_OWORD *)(a1 + 56);
        v25 = *(_QWORD *)(a1 + 72);
        v23[4] = &v26;
        objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v9, v23);
      }
      else
      {
        objc_msgSend(v3, "livePhotoKeyFrameAdjustmentController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          *((_BYTE *)v27 + 24) = 1;
        objc_msgSend(v3, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71378]);
      }
    }
    else
    {
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowMakePosterFrameForVideo");

      if (v7)
      {
        v8 = *(void **)(a1 + 40);
        v21 = *(_OWORD *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 72);
        objc_msgSend(v8, "_setPosterFrameTime:onCompositionController:", &v21, v3);
      }
    }
    if (*((_BYTE *)v27 + 24))
      objc_msgSend(*(id *)(a1 + 40), "updateLivePortraitForKeyFrameChange:", v3);
    _Block_object_dispose(&v26, 8);
  }
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    if ((*(_BYTE *)(a1 + 92) & 1) != 0 && (*(_BYTE *)(a1 + 116) & 1) != 0)
    {
      v14 = *MEMORY[0x1E0D71470];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_3;
      v16[3] = &__block_descriptor_80_e36_v16__0__PITrimAdjustmentController_8l;
      v17 = *(_OWORD *)(a1 + 80);
      v18 = *(_QWORD *)(a1 + 96);
      v19 = *(_OWORD *)(a1 + 104);
      v20 = *(_QWORD *)(a1 + 120);
      objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v14, v16);
    }
    else
    {
      objc_msgSend(v3, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71470]);
    }
  }
  else
  {
    objc_msgSend(v4, "PITrimAdjustmentKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAdjustmentWithKey:", v10);

  }
  objc_msgSend(v4, "PITrimAdjustmentKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentControllerForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "PITrimAdjustmentKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__PUTrimToolController__updateCompositionController__block_invoke_4;
    v15[3] = &__block_descriptor_40_e32_v16__0__PIAdjustmentController_8l;
    v15[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v13, v15);

  }
}

void __52__PUTrimToolController__updateCompositionController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  CMTime time2;
  CMTime time1;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "keyFrameTime");
  else
    memset(&time1, 0, sizeof(time1));
  time2 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &time2))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "setKeyFrameTime:", &v5);

}

void __52__PUTrimToolController__updateCompositionController__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v3 = a2;
  objc_msgSend(v3, "setStartTime:", &v6);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "setEndTime:", &v4);

}

uint64_t __52__PUTrimToolController__updateCompositionController__block_invoke_4(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(a2, "setEnabled:", v2 == 2);
  return result;
}

void __56__PUTrimToolController__updatePlayerWrapperTimeObserver__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "playheadStyle");
  objc_msgSend(*(id *)(a1 + 32), "playerWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
    objc_msgSend(v3, "startPeriodicTimeObserver");
  else
    objc_msgSend(v3, "stopPeriodicTimeObserver");

}

uint64_t __68__PUTrimToolController__setPosterFrameTime_onCompositionController___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setPosterFrameTime:", &v3);
}

void __46__PUTrimToolController__showKeyFrameSelection__block_invoke(uint64_t a1)
{
  PULivePhotoKeyFrameSelectionViewController *v2;
  void *v3;
  __CFString *v4;
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
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032))
  {
    v2 = objc_alloc_init(PULivePhotoKeyFrameSelectionViewController);
    objc_msgSend(*(id *)(a1 + 32), "currentEditSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = CFSTR("PHOTOEDIT_MAKE_POSTER_FRAME");
    else
      v4 = CFSTR("PHOTOEDIT_MAKE_KEY_FRAME");
    PULocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoKeyFrameSelectionViewController setSelectionTitle:](v2, "setSelectionTitle:", v5);

    -[PULivePhotoKeyFrameSelectionViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 7);
    -[PULivePhotoKeyFrameSelectionViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_presentationRectFromLoupeRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PULivePhotoKeyFrameSelectionViewController popoverPresentationController](v2, "popoverPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPermittedArrowDirections:", 2);
    objc_msgSend(v14, "setSourceView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));
    objc_msgSend(v14, "setSourceRect:", v7, v9, v11, v13);
    objc_msgSend(v14, "setDelegate:", *(_QWORD *)(a1 + 32));
    -[PULivePhotoKeyFrameSelectionViewController view](v2, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v16);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPassthroughViews:", v18);

    objc_msgSend(*(id *)(a1 + 32), "setLivePhotoKeyFramePicker:", v2);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "setLivePhotoKeyFramePickerAppearanceTimer:", 0);

  }
}

uint64_t __50__PUTrimToolController_setAdjustedStillFrameTime___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setKeyFrameTime:", &v3);
}

void __54__PUTrimToolController_trimScrubberDidLayoutSubviews___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "snapStripController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateSnapStripView");

}

void __82__PUTrimToolController_trimScrubber_didEndInteractivelyEditingElement_successful___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_didCompleteInteractiveEditForElement:atTime:state:", v3, &v4, 0);

}

void __66__PUTrimToolController__dismissKeyFramePickerAndResetToStillFrame__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetScrubberToStillPhotoFrame");

}

uint64_t __45__PUTrimToolController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrubberTimelineOverlayButtonOffset");
}

void __98__PUTrimToolController_initWithPlayerWrapper_playButtonEnabled_slomoEnabled_portraitVideoEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a2;
  objc_msgSend(a4, "delayNextInvocationByTimeInterval:", 0.5);
  objc_msgSend(v5, "_updateVideo");

}

@end
