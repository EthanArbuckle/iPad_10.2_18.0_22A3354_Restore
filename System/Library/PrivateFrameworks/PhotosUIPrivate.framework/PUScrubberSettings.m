@implementation PUScrubberSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUScrubberSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUScrubberSettings setInteractiveLoupeBehavior:](self, "setInteractiveLoupeBehavior:", 0);
  -[PUScrubberSettings setDecelerationTargetExpansionDistance:](self, "setDecelerationTargetExpansionDistance:", 0.0);
  -[PUScrubberSettings setTapAnimationDuration:](self, "setTapAnimationDuration:", 0.5);
  -[PUScrubberSettings setSettleAnimationDuration:](self, "setSettleAnimationDuration:", 0.75);
  -[PUScrubberSettings setSettleRequiredDecelerationDistance:](self, "setSettleRequiredDecelerationDistance:", 50.0);
  -[PUScrubberSettings setSmoothingAnimationDuration:](self, "setSmoothingAnimationDuration:", 0.05);
  -[PUScrubberSettings setLemonadeSlitAspectRatio:](self, "setLemonadeSlitAspectRatio:", 0.666);
  -[PUScrubberSettings setSlitAspectRatio:](self, "setSlitAspectRatio:", 0.5);
  -[PUScrubberSettings setLemonadeInterItemSpacing:](self, "setLemonadeInterItemSpacing:", 3.0);
  -[PUScrubberSettings setLemonadeInterSectionSpacing:](self, "setLemonadeInterSectionSpacing:", 4.0);
  -[PUScrubberSettings setInterItemSpacing:](self, "setInterItemSpacing:", 1.0);
  -[PUScrubberSettings setInterSectionSpacing:](self, "setInterSectionSpacing:", 1.0);
  -[PUScrubberSettings setMaxAspectRatio:](self, "setMaxAspectRatio:", 2.0);
  -[PUScrubberSettings setLemonadeItemCornerRadius:](self, "setLemonadeItemCornerRadius:", 3.0);
  -[PUScrubberSettings setItemCornerRadius:](self, "setItemCornerRadius:", 0.0);
  -[PUScrubberSettings setVerticalMargin:](self, "setVerticalMargin:", 1.0);
  -[PUScrubberSettings setTopOutset:](self, "setTopOutset:", 32.0);
  -[PUScrubberSettings setMinVideoDuration:](self, "setMinVideoDuration:", 1.0);
  -[PUScrubberSettings setBaseVideoWidth:](self, "setBaseVideoWidth:", 150.0);
  -[PUScrubberSettings setFilmstripAspectRatio:](self, "setFilmstripAspectRatio:", 1.77777779);
  -[PUScrubberSettings setDynamicSeekTolerance:](self, "setDynamicSeekTolerance:", 1);
  -[PUScrubberSettings setUseSmoothingAnimation:](self, "setUseSmoothingAnimation:", 0);
  -[PUScrubberSettings setDefaultPlaybackIndicator:](self, "setDefaultPlaybackIndicator:", 0);
  -[PUScrubberSettings setInitialPlaybackIndicator:](self, "setInitialPlaybackIndicator:", 2);
  -[PUScrubberSettings setScrubbingPlaybackIndicator:](self, "setScrubbingPlaybackIndicator:", 1);
  -[PUScrubberSettings setChromeShownPlaybackIndicator:](self, "setChromeShownPlaybackIndicator:", 2);
  -[PUScrubberSettings setPlayingPlaybackIndicator:](self, "setPlayingPlaybackIndicator:", 0);
}

- (void)setVerticalMargin:(double)a3
{
  self->_verticalMargin = a3;
}

- (void)setUseSmoothingAnimation:(BOOL)a3
{
  self->_useSmoothingAnimation = a3;
}

- (void)setTopOutset:(double)a3
{
  self->_topOutset = a3;
}

- (void)setTapAnimationDuration:(double)a3
{
  self->_tapAnimationDuration = a3;
}

- (void)setSmoothingAnimationDuration:(double)a3
{
  self->_smoothingAnimationDuration = a3;
}

- (void)setSlitAspectRatio:(double)a3
{
  self->_slitAspectRatio = a3;
}

- (void)setSettleRequiredDecelerationDistance:(double)a3
{
  self->_settleRequiredDecelerationDistance = a3;
}

- (void)setSettleAnimationDuration:(double)a3
{
  self->_settleAnimationDuration = a3;
}

- (void)setScrubbingPlaybackIndicator:(int64_t)a3
{
  self->_scrubbingPlaybackIndicator = a3;
}

- (void)setPlayingPlaybackIndicator:(int64_t)a3
{
  self->_playingPlaybackIndicator = a3;
}

- (void)setMinVideoDuration:(double)a3
{
  self->_minVideoDuration = a3;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (void)setInteractiveLoupeBehavior:(unint64_t)a3
{
  self->_interactiveLoupeBehavior = a3;
}

- (void)setInterSectionSpacing:(double)a3
{
  self->_interSectionSpacing = a3;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (void)setInitialPlaybackIndicator:(int64_t)a3
{
  self->_initialPlaybackIndicator = a3;
}

- (void)setFilmstripAspectRatio:(double)a3
{
  self->_filmstripAspectRatio = a3;
}

- (void)setDynamicSeekTolerance:(BOOL)a3
{
  self->_dynamicSeekTolerance = a3;
}

- (void)setDefaultPlaybackIndicator:(int64_t)a3
{
  self->_defaultPlaybackIndicator = a3;
}

- (void)setDecelerationTargetExpansionDistance:(double)a3
{
  self->_decelerationTargetExpansionDistance = a3;
}

- (void)setChromeShownPlaybackIndicator:(int64_t)a3
{
  self->_chromeShownPlaybackIndicator = a3;
}

- (void)setBaseVideoWidth:(double)a3
{
  self->_baseVideoWidth = a3;
}

- (id)parentSettings
{
  return +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
}

- (int64_t)version
{
  return 1;
}

- (unint64_t)interactiveLoupeBehavior
{
  return self->_interactiveLoupeBehavior;
}

- (double)tapAnimationDuration
{
  return self->_tapAnimationDuration;
}

- (double)smoothingAnimationDuration
{
  return self->_smoothingAnimationDuration;
}

- (double)settleAnimationDuration
{
  return self->_settleAnimationDuration;
}

- (double)settleRequiredDecelerationDistance
{
  return self->_settleRequiredDecelerationDistance;
}

- (double)decelerationTargetExpansionDistance
{
  return self->_decelerationTargetExpansionDistance;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (double)topOutset
{
  return self->_topOutset;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (BOOL)useSmoothingAnimation
{
  return self->_useSmoothingAnimation;
}

- (double)minVideoDuration
{
  return self->_minVideoDuration;
}

- (double)baseVideoWidth
{
  return self->_baseVideoWidth;
}

- (double)filmstripAspectRatio
{
  return self->_filmstripAspectRatio;
}

- (BOOL)dynamicSeekTolerance
{
  return self->_dynamicSeekTolerance;
}

- (double)slitAspectRatio
{
  return self->_slitAspectRatio;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (void)setItemCornerRadius:(double)a3
{
  self->_itemCornerRadius = a3;
}

- (double)lemonadeSlitAspectRatio
{
  return self->_lemonadeSlitAspectRatio;
}

- (void)setLemonadeSlitAspectRatio:(double)a3
{
  self->_lemonadeSlitAspectRatio = a3;
}

- (double)lemonadeInterItemSpacing
{
  return self->_lemonadeInterItemSpacing;
}

- (void)setLemonadeInterItemSpacing:(double)a3
{
  self->_lemonadeInterItemSpacing = a3;
}

- (double)lemonadeInterSectionSpacing
{
  return self->_lemonadeInterSectionSpacing;
}

- (void)setLemonadeInterSectionSpacing:(double)a3
{
  self->_lemonadeInterSectionSpacing = a3;
}

- (double)lemonadeItemCornerRadius
{
  return self->_lemonadeItemCornerRadius;
}

- (void)setLemonadeItemCornerRadius:(double)a3
{
  self->_lemonadeItemCornerRadius = a3;
}

- (int64_t)defaultPlaybackIndicator
{
  return self->_defaultPlaybackIndicator;
}

- (int64_t)initialPlaybackIndicator
{
  return self->_initialPlaybackIndicator;
}

- (int64_t)scrubbingPlaybackIndicator
{
  return self->_scrubbingPlaybackIndicator;
}

- (int64_t)chromeShownPlaybackIndicator
{
  return self->_chromeShownPlaybackIndicator;
}

- (int64_t)playingPlaybackIndicator
{
  return self->_playingPlaybackIndicator;
}

+ (PUScrubberSettings)sharedInstance
{
  if (sharedInstance_onceToken_83699 != -1)
    dispatch_once(&sharedInstance_onceToken_83699, &__block_literal_global_83700);
  return (PUScrubberSettings *)(id)sharedInstance_sharedInstance_83701;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
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
  uint64_t v65;
  void *v66;
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
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;
  void *v150;
  _QWORD v151[3];
  _QWORD v152[3];
  void *v153;
  _QWORD v154[18];
  _QWORD v155[10];

  v155[8] = *MEMORY[0x1E0C80C00];
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("When Idle"), CFSTR("defaultPlaybackIndicator"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "possibleValues:titles:", &unk_1E59BA7B0, &unk_1E59BA7C8);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v135;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("When at Beginning"), CFSTR("initialPlaybackIndicator"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "possibleValues:titles:", &unk_1E59BA7B0, &unk_1E59BA7C8);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v129;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("When Scrubbing"), CFSTR("scrubbingPlaybackIndicator"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "possibleValues:titles:", &unk_1E59BA7B0, &unk_1E59BA7C8);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v123;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("When Chrome is Shown"), CFSTR("chromeShownPlaybackIndicator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E59BA7B0, &unk_1E59BA7C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v4;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("When Playing"), CFSTR("playingPlaybackIndicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E59BA7B0, &unk_1E59BA7C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v155[4] = v6;
  v7 = (void *)MEMORY[0x1E0D83010];
  v8 = MEMORY[0x1E0C809B0];
  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = __46__PUScrubberSettings_settingsControllerModule__block_invoke;
  v148[3] = &unk_1E58A8568;
  v9 = v2;
  v149 = v9;
  objc_msgSend(v7, "pu_rowWithTitle:action:", CFSTR("HI Specs"), v148);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v155[5] = v10;
  v11 = (void *)MEMORY[0x1E0D83010];
  v146[0] = v8;
  v146[1] = 3221225472;
  v146[2] = __46__PUScrubberSettings_settingsControllerModule__block_invoke_2;
  v146[3] = &unk_1E58A8568;
  v12 = v9;
  v147 = v12;
  objc_msgSend(v11, "pu_rowWithTitle:action:", CFSTR("Proposed Owned Video"), v146);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v155[6] = v13;
  v14 = (void *)MEMORY[0x1E0D83010];
  v144[0] = v8;
  v144[1] = 3221225472;
  v144[2] = __46__PUScrubberSettings_settingsControllerModule__block_invoke_3;
  v144[3] = &unk_1E58A8568;
  v138 = v12;
  v145 = v138;
  objc_msgSend(v14, "pu_rowWithTitle:action:", CFSTR("Proposed Shared Video"), v144);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v155[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "sectionWithRows:title:", v16, CFSTR("Playback Indicator"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_interactiveLoupeBehavior);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Interactive Loupe Behavior"), v136);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "possibleValues:titles:", &unk_1E59BA7E0, &unk_1E59BA7F8);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v130;
  v18 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_tapAnimationDuration);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Tap Animation Duration"), v127);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "minValue:maxValue:", 0.0, 1.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "pu_increment:", 0.0500000007);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v119;
  v19 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_smoothingAnimationDuration);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:valueKeyPath:", CFSTR("Smoothing Animation Duration"), v118);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "minValue:maxValue:", 0.0, 0.300000012);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "pu_increment:", 0.00999999978);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v115;
  v20 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_settleAnimationDuration);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Settle Animation Duration"), v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "minValue:maxValue:", 0.0, 1.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "pu_increment:", 0.0500000007);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v111;
  v21 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_settleRequiredDecelerationDistance);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Settle Required Deceleration Distance"), v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "minValue:maxValue:", 0.0, 1000.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "pu_increment:", 25.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v154[4] = v107;
  v22 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_decelerationTargetExpansionDistance);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Deceleration Target Expansion Distance"), v106);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "minValue:maxValue:", 0.0, 500.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "pu_increment:", 1.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v154[5] = v103;
  v23 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_verticalMargin);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Vertical Margin"), v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "minValue:maxValue:", 0.0, 10.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "pu_increment:", 1.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v154[6] = v99;
  v24 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_topOutset);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Top Outset"), v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "minValue:maxValue:", 0.0, 200.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "pu_increment:", 1.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v154[7] = v95;
  v25 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_slitAspectRatio);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Slit Aspect Ratio"), v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "minValue:maxValue:", 0.00999999978, 5.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "pu_increment:", 0.0500000007);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v154[8] = v91;
  v26 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maxAspectRatio);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Max Aspect Ratio"), v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "minValue:maxValue:", 0.100000001, 30.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "pu_increment:", 0.100000001);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v154[9] = v87;
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_interItemSpacing);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Inter Item Spacing"), v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "minValue:maxValue:", 0.0, 20.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "pu_increment:", 1.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v154[10] = v83;
  v28 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_itemCornerRadius);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Item Corner Radius"), v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "minValue:maxValue:", 0.0, 20.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "pu_increment:", 1.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v154[11] = v79;
  v29 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_interSectionSpacing);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Inter Section Spacing"), v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", 0.0, 40.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "pu_increment:", 1.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v154[12] = v75;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSmoothingAnimation);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Smoothing Animation"), v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v154[13] = v73;
  v31 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_baseVideoWidth);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Base Video Width"), v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "minValue:maxValue:", 10.0, 1000.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "pu_increment:", 5.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v154[14] = v69;
  v32 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_minVideoDuration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Min Video Duration"), v68);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.100000001, 10.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pu_increment:", 0.100000001);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v154[15] = v35;
  v36 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_filmstripAspectRatio);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Filmstrip Aspect Ratio"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 0.100000001, 3.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "pu_increment:", 0.00999999978);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v154[16] = v40;
  v41 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_dynamicSeekTolerance);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Dynamic Seek Tolerance"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v154[17] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 18);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "sectionWithRows:", v44);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D83078];
  v46 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:action:", CFSTR("Restore Defaults"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sectionWithRows:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v152[0] = v143;
  v152[1] = v141;
  v152[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v122 = (void *)MEMORY[0x1E0D83078];
    v137 = v50;
    v52 = (void *)MEMORY[0x1E0D830F8];
    NSStringFromSelector(sel_lemonadeSlitAspectRatio);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Slit Aspect Ratio"), v134);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "minValue:maxValue:", 0.00999999978, 5.0);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "pu_increment:", 0.0500000007);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v125;
    v53 = (void *)MEMORY[0x1E0D830F8];
    NSStringFromSelector(sel_lemonadeInterItemSpacing);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Inter Item Spacing"), v120);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "minValue:maxValue:", 0.0, 20.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "pu_increment:", 1.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v56;
    v57 = (void *)MEMORY[0x1E0D830F8];
    NSStringFromSelector(sel_lemonadeItemCornerRadius);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "rowWithTitle:valueKeyPath:", CFSTR("Item Corner Radius"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "minValue:maxValue:", 0.0, 20.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "pu_increment:", 1.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "sectionWithRows:title:", v62, CFSTR("Lemonade"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v150 = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "arrayByAddingObjectsFromArray:", v51);
    v65 = objc_claimAutoreleasedReturnValue();

    v50 = v137;
    v51 = (void *)v65;
  }
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Scrubber Settings"), v51);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

uint64_t __46__PUScrubberSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDefaultPlaybackIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitialPlaybackIndicator:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setScrubbingPlaybackIndicator:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setChromeShownPlaybackIndicator:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setPlayingPlaybackIndicator:", 0);
}

uint64_t __46__PUScrubberSettings_settingsControllerModule__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDefaultPlaybackIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitialPlaybackIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setScrubbingPlaybackIndicator:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setChromeShownPlaybackIndicator:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPlayingPlaybackIndicator:", 0);
}

uint64_t __46__PUScrubberSettings_settingsControllerModule__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDefaultPlaybackIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitialPlaybackIndicator:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setScrubbingPlaybackIndicator:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setChromeShownPlaybackIndicator:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setPlayingPlaybackIndicator:", 0);
}

void __36__PUScrubberSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrubberSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_83701;
  sharedInstance_sharedInstance_83701 = v0;

}

@end
