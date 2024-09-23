@implementation PXStoryConcreteViewLayoutSpec

- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5 customGeneralChromeTitleConfiguration:(id)a6
{
  id v9;
  PXStoryViewChromeTitleConfiguration *v10;
  PXStoryConcreteViewLayoutSpec *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  char v19;
  int v20;
  unint64_t fullsizePlayerDefaultChromeItems;
  int64x2_t *p_chromeButtonSize;
  uint64_t v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  PXStoryChromeButtonSpec *v28;
  PXStoryChromeButtonSpec *chromeButtonSpec;
  PXStoryPlayButtonSpec *v30;
  PXStoryPlayButtonSpec *playButtonSpec;
  int64x2_t v32;
  int64x2_t v33;
  _OWORD *p_width;
  NSString *replayButtonImageName;
  int8x16_t v41;
  int8x16_t v42;
  int8x16_t v43;
  uint64_t v45;
  NSString *v46;
  const __CFString *v47;
  NSString *actionMenuButtonImageName;
  NSString *closeButtonImageName;
  uint64_t v50;
  uint64_t v51;
  NSString *v52;
  NSString *v53;
  double v54;
  double v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  PXStoryViewChromeTitleConfiguration *v74;
  PXStoryConcreteViewChromeTitleSpec *v75;
  uint64_t v76;
  PXStoryViewChromeTitleConfiguration *v77;
  uint64_t v78;
  PXStoryViewChromeTitleSpec *generalChromeTitleSpec;
  uint64_t v80;
  NSDictionary *chromeTitleAttributes;
  uint64_t v82;
  NSDictionary *chromeSubtitleAttributes;
  PXStoryConcreteViewChromeTitleSpec *v84;
  PXStoryViewChromeTitleSpec *browseChromeTitleSpec;
  uint64_t v86;
  NSString *chromeTitleLocalizedSongFormat;
  const __CFString *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  UIImageConfiguration *chromeTitleMusicSystemImageConfiguration;
  uint64_t v94;
  PXExtendedImageConfiguration *rightEdgeHighlightImageConfiguration;
  double v96;
  objc_class *v97;
  int v98;
  CGSize *v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  PXExtendedImageConfiguration *legibilityGradientImageConfiguration;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  CGFloat v119;
  double v120;
  _OWORD *p_top;
  uint64_t v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  uint64_t v126;
  double v127;
  double v128;
  double v129;
  id v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  NSAttributedString *relatedAttributedTitle;
  CGFloat v138;
  CGFloat v139;
  PXStoryRelatedLayoutMetrics *v141;
  PXStoryRelatedLayoutMetrics *relatedLayoutMetrics;
  double v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  double v148;
  PXStoryConcreteViewChromeTitleSpec *v149;
  PXStoryViewChromeTitleSpec *playbackEndChromeTitleSpec;
  void *v151;
  void *v152;
  uint64_t v153;
  NSDictionary *playbackEndTitleAttributes;
  uint64_t v155;
  NSDictionary *playbackEndSubtitleAttributes;
  uint64_t v157;
  NSDictionary *v158;
  uint64_t v159;
  CGFloat v160;
  NSNumberFormatter *v161;
  NSNumberFormatter *upNextCountDownFormatter;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  uint64_t v168;
  NSDictionary *upNextCountDownAttributes;
  uint64_t v170;
  id v171;
  void *v172;
  uint64_t v173;
  PXExtendedImageConfiguration *upNextCountDownDecorationImageConfiguration;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  int v180;
  id v181;
  void *v182;
  uint64_t v183;
  NSDictionary *styleSwitcherDetailsLabelAttributesA;
  id v185;
  void *v186;
  uint64_t v187;
  NSDictionary *styleSwitcherDetailsLabelAttributesAAccessory;
  id v189;
  void *v190;
  uint64_t v191;
  NSDictionary *styleSwitcherDetailsLabelAttributesB;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  NSDictionary *styleSwitcherDetailsLabelAttributesC;
  unint64_t v200;
  uint64_t v201;
  uint64_t v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  UIColor *playerBackgroundColor;
  void *v207;
  double v208;
  double v209;
  void *v210;
  double v211;
  double v212;
  CGFloat v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  UIImage *styleSwitcherColorGradeNameGlyphImage;
  double scrubberAssetCornerRadius;
  double v221;
  CGFloat v222;
  CGFloat v223;
  CGFloat v224;
  CGFloat v225;
  CGFloat v226;
  CGFloat v227;
  CGFloat v228;
  CGFloat v229;
  PXStoryConcreteViewLayoutSpec *v230;
  void *v232;
  void *v233;
  double *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  __int128 v238;
  void *v239;
  void *v240;
  __int128 v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  _BOOL4 v246;
  void *v247;
  BOOL v248;
  PXStoryViewChromeTitleConfiguration *v249;
  void *v250;
  PXStoryViewChromeTitleConfiguration *v251;
  uint64_t v252;
  void *v253;
  __int16 v254;
  uint64_t v255;
  objc_super v256;
  _QWORD v257[3];
  _QWORD v258[3];
  _QWORD v259[2];
  _QWORD v260[2];
  _QWORD v261[3];
  _QWORD v262[3];
  uint64_t v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  _QWORD v268[3];
  uint64_t v269;
  _QWORD v270[3];

  v254 = a5;
  v270[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (PXStoryViewChromeTitleConfiguration *)a6;
  v256.receiver = self;
  v256.super_class = (Class)PXStoryConcreteViewLayoutSpec;
  v11 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v256, sel_initWithExtendedTraitCollection_options_, v9, a4);

  if (!v11)
    goto LABEL_158;
  v251 = v10;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "userInterfaceIdiom");
  v14 = -[PXFeatureSpec layoutOrientation](v11, "layoutOrientation");
  v235 = objc_msgSend(v9, "layoutSizeClass");
  v15 = objc_msgSend(v9, "contentSizeCategory");
  objc_msgSend(v9, "storyChromeLayoutSpec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minimumMargins");
  v18 = v17;
  v248 = v13 == 3;
  v11->_shouldUseUnifiedButtonLayout = v13 == 3;
  v233 = v16;
  if ((unint64_t)(v13 - 1) < 2)
  {
    v19 = 1;
    goto LABEL_9;
  }
  if ((unint64_t)(v13 - 3) >= 2)
  {
    if (v13 != 5)
      goto LABEL_10;
    v19 = 0;
LABEL_9:
    v11->_canShowCloseButton = 1;
    v11->_canShowMuteToggleButton = 1;
    v11->_canShowManagePhotosAction = 1;
    v11->_wantsEdgeTapToChangeCurrentSegment = v19;
    v11->_wantsSwipeDownGestureToDismiss = v19;
    goto LABEL_10;
  }
  v11->_canShowManagePhotosAction = objc_msgSend(v12, "allowCustomUserAssets");
  v11->_canShowCloseButton = 0;
  if (v13 == 3)
  {
    v11->_fullsizePlayerDefaultChromeItems |= 0xC00020uLL;
    goto LABEL_13;
  }
LABEL_10:
  v20 = objc_msgSend(v12, "preferTopChromeItemsInAppNavigationBar");
  fullsizePlayerDefaultChromeItems = v11->_fullsizePlayerDefaultChromeItems;
  if (!v20)
    fullsizePlayerDefaultChromeItems |= 0x42uLL;
  v11->_fullsizePlayerDefaultChromeItems = fullsizePlayerDefaultChromeItems | 4;
LABEL_13:
  v252 = v14;
  v253 = v9;
  v250 = v12;
  if (objc_msgSend(v12, "wantsGridLayout"))
    v11->_fullsizePlayerDefaultChromeItems |= 0x80uLL;
  p_chromeButtonSize = (int64x2_t *)&v11->_chromeButtonSize;
  if (v13 == 3)
  {
    *p_chromeButtonSize = vdupq_n_s64(0x4050000000000000uLL);
    v23 = 4;
    v11->_defaultChromeButtonBackgroundStyle = 4;
    v24 = 24.0;
  }
  else
  {
    *p_chromeButtonSize = vdupq_n_s64(0x4046000000000000uLL);
    if ((unint64_t)(v15 - 8) <= 4)
    {
      PXSizeScale();
      PXSizeRound();
      v11->_chromeButtonSize.width = v25;
      v11->_chromeButtonSize.height = v26;
    }
    if (v13 == 5)
    {
      v11->_defaultChromeButtonBackgroundStyle = 0;
      v11->_nonblurredChromeButtonBackgroundStyle = 0;
      v11->_interChromeButtonSpacing = 16.0;
      v11->_interTopTrailingChromeButtonSpacing = 16.0;
      v11->_interTopLeadingChromeButtonSpacing = v11->_interChromeButtonSpacing;
      v11->_shareButtonExtraOffset = (CGPoint)*MEMORY[0x1E0C9D538];
      goto LABEL_23;
    }
    v23 = 0;
    v11->_defaultChromeButtonBackgroundStyle = 1;
    v24 = 20.0;
  }
  v11->_nonblurredChromeButtonBackgroundStyle = v23;
  v11->_interChromeButtonSpacing = v24;
  v11->_interTopTrailingChromeButtonSpacing = 0.0;
  v11->_interTopLeadingChromeButtonSpacing = 0.0;
  v11->_shareButtonExtraOffset = (CGPoint)xmmword_1A7BCC490;
LABEL_23:
  v246 = v14 != 1;
  v27 = v14 == 1;
  if (v13 == 4)
    v27 = 0;
  v11->_shouldHorizontallyCenterPlayButton = v27 | ((v254 & 0x80) >> 7);
  v11->_shouldVerticallyCenterPlayButton = (v254 & 0x80) != 0;
  v28 = -[PXStoryChromeButtonSpec initWithExtendedTraitCollection:]([PXStoryChromeButtonSpec alloc], "initWithExtendedTraitCollection:", v9);
  chromeButtonSpec = v11->_chromeButtonSpec;
  v11->_chromeButtonSpec = v28;

  v30 = -[PXStoryPlayButtonSpec initWithChromeButtonSpec:]([PXStoryPlayButtonSpec alloc], "initWithChromeButtonSpec:", v11->_chromeButtonSpec);
  playButtonSpec = v11->_playButtonSpec;
  v11->_playButtonSpec = v30;

  p_width = (_OWORD *)&v11->_chromeButtonPadding.width;
  v255 = v13;
  if (v13 == 3)
  {
    *p_width = xmmword_1A7C0C720;
    replayButtonImageName = v11->_replayButtonImageName;
    v11->_replayButtonImageName = (NSString *)CFSTR("arrow.counterclockwise");

  }
  else
  {
    v32.i64[0] = 5;
    v33.i64[0] = v13;
    __asm
    {
      FMOV            V2.2D, #26.0
      FMOV            V3.2D, #24.0
    }
    v41 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v33, v32).i64[0], 0), (int8x16_t)_Q3, (int8x16_t)_Q2);
    _Q2.i64[0] = 4;
    v42 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v33, _Q2).i64[0], 0);
    _Q2.i64[0] = v14;
    _Q3.i64[0] = 1;
    v43 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(_Q2, _Q3).i64[0], 0), (int8x16_t)vdupq_n_s64(0x4044000000000000uLL), v41);
    __asm { FMOV            V2.2D, #20.0 }
    *p_width = vbslq_s8(v42, _Q2, v43);
    v45 = objc_msgSend(v9, "layoutDirection");
    v46 = v11->_replayButtonImageName;
    v47 = CFSTR("backward.end.fill");
    if (v45 == 2)
      v47 = CFSTR("forward.end.fill");
    v11->_replayButtonImageName = &v47->isa;

    if (v13 == 5)
    {
      actionMenuButtonImageName = v11->_actionMenuButtonImageName;
      v11->_actionMenuButtonImageName = (NSString *)CFSTR("ellipsis");

      closeButtonImageName = v11->_closeButtonImageName;
      v11->_closeButtonImageName = (NSString *)CFSTR("chevron.backward");

      v11->_styleSwitcherButtonPlacement = 2;
      v11->_muteToggleButtonPlacement = 3;
      v50 = v14;
      if ((v254 & 0x80) != 0)
        v51 = 1;
      else
        v51 = 4;
      goto LABEL_46;
    }
  }
  v52 = v11->_actionMenuButtonImageName;
  v11->_actionMenuButtonImageName = (NSString *)CFSTR("ellipsis.circle");

  v53 = v11->_closeButtonImageName;
  v11->_closeButtonImageName = (NSString *)CFSTR("xmark");

  v11->_styleSwitcherButtonPlacement = 4;
  v11->_muteToggleButtonPlacement = 2;
  if ((v254 & 0x80) != 0)
  {
    v11->_playButtonPlacement = 1;
    v50 = v14;
    if (v13 != 4)
      goto LABEL_47;
LABEL_39:
    v11->_playbackEndButtonSystemImageWeight = *(double *)MEMORY[0x1E0DC1448];
    v11->_playbackEndButtonSystemImagePointSize = 27.0;
    v11->_playbackEndButtonSize = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
    v11->_interPlaybackEndButtonSpacing = 0.0;
    v11->_onlyShowReplayEndButtonAtTopOfTitle = 1;
    v11->_playbackEndButtonPadding = (CGSize)xmmword_1A7C0C730;
    v54 = 50.0;
    goto LABEL_53;
  }
  v50 = v14;
  if (v13 == 4)
  {
    v11->_playButtonPlacement = 5;
    goto LABEL_39;
  }
  _ZF = v14 == 1 && v235 == 1;
  v51 = 5;
  if (_ZF)
    v51 = 1;
LABEL_46:
  v11->_playButtonPlacement = v51;
LABEL_47:
  v11->_playbackEndButtonSize = (CGSize)vdupq_n_s64(0x4044000000000000uLL);
  v11->_playbackEndButtonSystemImageWeight = (double)*(uint64_t *)off_1E50B8458;
  v11->_playbackEndButtonSystemImagePointSize = *(double *)off_1E50B8450;
  v11->_interPlaybackEndButtonSpacing = 12.0;
  v11->_onlyShowReplayEndButtonAtTopOfTitle = 0;
  if (v50 == 1)
    v56 = 40.0;
  else
    v56 = 55.0;
  v54 = 31.0;
  if (v50 == 1)
    v54 = 40.0;
  v11->_playbackEndButtonPadding.width = v56;
  v11->_playbackEndButtonPadding.height = v54;
LABEL_53:
  v234 = &v11->_chromeButtonPadding.width;
  if (v54 < v18)
    v54 = v18;
  v11->_playbackEndButtonPadding.height = v54;
  objc_storeStrong((id *)&v11->_playbackEndButtonSpec, v11->_chromeButtonSpec);
  v57 = (double *)MEMORY[0x1E0DC1420];
  if (v13 == 3)
  {
    v269 = *MEMORY[0x1E0DC13C0];
    v58 = v269;
    v265 = *MEMORY[0x1E0DC1478];
    v59 = v265;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8510]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v268[0] = v60;
    v266 = *MEMORY[0x1E0DC1458];
    v61 = v266;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v57);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = *MEMORY[0x1E0DC1408];
    v63 = v267;
    v64 = *MEMORY[0x1E0DC1398];
    v268[1] = v62;
    v268[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v268, &v265, 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v270[0] = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v270, &v269, 1);
    v240 = (void *)objc_claimAutoreleasedReturnValue();

    v237 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v240);
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v237, 82.0);
    v66 = objc_claimAutoreleasedReturnValue();
    v263 = v58;
    v261[0] = v59;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8530]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v262[0] = v67;
    v261[1] = v61;
    v13 = v255;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v261[2] = v63;
    v262[1] = v68;
    v262[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v262, v261, 3);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = v69;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = (void *)v66;
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v70);
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v72, 23.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v252;
  }
  else
  {
    if (v13 == 5)
    {
      PXFontWithTextStyleAndWeight();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      PXFontWithTextStyleAndWeight();
    }
    else
    {
      PXFontWithTextStyleSymbolicTraits();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      PXFontWithTextStyleSymbolicTraits();
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v74 = objc_alloc_init(PXStoryViewChromeTitleConfiguration);
  v75 = [PXStoryConcreteViewChromeTitleSpec alloc];
  if (v50 == 1)
    v76 = 2;
  else
    v76 = 1;
  if (v251)
    v77 = v251;
  else
    v77 = v74;
  v78 = -[PXStoryConcreteViewChromeTitleSpec initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:](v75, "initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:", 2, v76, v77);
  generalChromeTitleSpec = v11->_generalChromeTitleSpec;
  v11->_generalChromeTitleSpec = (PXStoryViewChromeTitleSpec *)v78;

  v236 = v71;
  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v71, v11->_generalChromeTitleSpec, 1.0);
  v80 = objc_claimAutoreleasedReturnValue();
  chromeTitleAttributes = v11->_chromeTitleAttributes;
  v11->_chromeTitleAttributes = (NSDictionary *)v80;

  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v73, v11->_generalChromeTitleSpec, 1.0);
  v82 = objc_claimAutoreleasedReturnValue();
  chromeSubtitleAttributes = v11->_chromeSubtitleAttributes;
  v11->_chromeSubtitleAttributes = (NSDictionary *)v82;

  v11->_shouldUseAssetCollectionForTitleAndSubtitle = v248;
  v249 = v74;
  v84 = -[PXStoryConcreteViewChromeTitleSpec initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:]([PXStoryConcreteViewChromeTitleSpec alloc], "initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:", 1, 1, v74);
  browseChromeTitleSpec = v11->_browseChromeTitleSpec;
  v11->_browseChromeTitleSpec = (PXStoryViewChromeTitleSpec *)v84;

  v11->_distanceFromBottomChromeTextToGrid = 12.0;
  v11->_minimumWidthRequiredForChromeText = 100.0;
  v238 = *(_OWORD *)off_1E50B8020;
  v241 = *((_OWORD *)off_1E50B8020 + 1);
  *(_OWORD *)&v11->_browseGridLayoutMargins.top = *(_OWORD *)off_1E50B8020;
  *(_OWORD *)&v11->_browseGridLayoutMargins.bottom = v241;
  v11->_preferredUserInterfaceStyleForBrowseGridInlineAddButton = 2;
  v11->_browseGridAllowsDragGesture = 1;
  if (v50 == 1)
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryChromePortraitSongTitleFormat"), CFSTR("PhotosUICore"));
    v86 = objc_claimAutoreleasedReturnValue();
    chromeTitleLocalizedSongFormat = v11->_chromeTitleLocalizedSongFormat;
    v11->_chromeTitleLocalizedSongFormat = (NSString *)v86;
    v88 = CFSTR("PXStoryEdgeHighlightGradientPortrait");
    v89 = 0x4085480000000000;
    v90 = 0x40A3080000000000;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryChromeLandscapeSongTitleFormat"), CFSTR("PhotosUICore"));
    v91 = objc_claimAutoreleasedReturnValue();
    chromeTitleLocalizedSongFormat = v11->_chromeTitleLocalizedSongFormat;
    v11->_chromeTitleLocalizedSongFormat = (NSString *)v91;
    v88 = CFSTR("PXStoryEdgeHighlightGradientLandscape");
    v89 = 0x4088900000000000;
    v90 = 0x4091940000000000;
  }

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v73, 1);
  v92 = objc_claimAutoreleasedReturnValue();
  chromeTitleMusicSystemImageConfiguration = v11->_chromeTitleMusicSystemImageConfiguration;
  v11->_chromeTitleMusicSystemImageConfiguration = (UIImageConfiguration *)v92;

  v94 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", v88);
  rightEdgeHighlightImageConfiguration = v11->_rightEdgeHighlightImageConfiguration;
  v11->_rightEdgeHighlightImageConfiguration = (PXExtendedImageConfiguration *)v94;

  *(_QWORD *)&v11->_rightEdgeHighlightImageSize.width = v89;
  *(_QWORD *)&v11->_rightEdgeHighlightImageSize.height = v90;
  v11->_rightEdgeHighlightImageVersion = v246;
  v11->_edgeHighlightAlpha = 0.5;
  if (!objc_msgSend(v250, "overrideLegibilityGradientHeights"))
  {
    v99 = &v11->_chromeButtonSize;
    if (v13 == 3)
    {
      v98 = 520;
      v11->_topLegibilityGradientHeight = 0.0;
      v100 = 528;
      v101 = 0x4085C00000000000;
      goto LABEL_82;
    }
    if (v235 == 1)
    {
      if (v50 == 1)
      {
        v98 = 520;
        v11->_topLegibilityGradientHeight = 160.0;
        v100 = 528;
        v101 = 0x406B800000000000;
        goto LABEL_82;
      }
      v11->_bottomLegibilityGradientHeight = 120.0;
      v100 = 520;
      v101 = 0x405E000000000000;
    }
    else if (v50 == 1)
    {
      v11->_bottomLegibilityGradientHeight = 160.0;
      v100 = 520;
      v101 = 0x4064000000000000;
    }
    else
    {
      v11->_bottomLegibilityGradientHeight = 140.0;
      v100 = 520;
      v101 = 0x4061800000000000;
    }
    v98 = 520;
LABEL_82:
    *(Class *)((char *)&v11->super.super.isa + v100) = (Class)v101;
    v102 = objc_msgSend(v250, "preferTopChromeItemsInAppNavigationBar");
    v97 = 0;
    if (!v102)
      goto LABEL_84;
    goto LABEL_83;
  }
  objc_msgSend(v250, "topLegibilityGradientHeight");
  v11->_topLegibilityGradientHeight = v96;
  objc_msgSend(v250, "bottomLegibilityGradientHeight");
  v98 = 528;
  v99 = &v11->_chromeButtonSize;
LABEL_83:
  *(Class *)((char *)&v11->super.super.isa + v98) = v97;
LABEL_84:
  v11->_bottomLegibilityGradientCornerRadius = 0.0;
  v11->_topLegibilityGradientCornerRadius = 0.0;
  v11->_solidLegibilityGradientCornerRadius = 0.0;
  v103 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", CFSTR("PXHeaderGradient"));
  legibilityGradientImageConfiguration = v11->_legibilityGradientImageConfiguration;
  v11->_legibilityGradientImageConfiguration = (PXExtendedImageConfiguration *)v103;

  if (v13 == 5)
  {
    v105 = v11->_chromeButtonPadding.height + v99->height * 0.5;
    v11->_distanceFromTopEdgeToTopButtonCenter = v105;
  }
  else
  {
    v106 = 36.0;
    if (v50 == 1)
      v106 = 66.0;
    if (v235 != 1)
      v106 = 45.0;
    v11->_distanceFromTopEdgeToTopButtonCenter = v106;
    v105 = *v234 + -15.0;
    if (v50 != 1)
      v105 = *v234 * 1.5;
  }
  v11->_distanceFromLateralEdgesToTopButtonCenter = v105;
  objc_msgSend(v250, "tapNavigationAreaFraction");
  v108 = v107;
  *(_OWORD *)&v11->_tapNavigationAreaInsets.top = v238;
  *(_OWORD *)&v11->_tapNavigationAreaInsets.bottom = v241;
  v11->_tapNavigationAreaInsets.top = v11->_distanceFromTopEdgeToTopButtonCenter + v99->height * 0.5 + 20.0;
  v11->_tapNavigationAreaInsets.bottom = v11->_chromeButtonPadding.height + v11->_chromeButtonPadding.height + 20.0;
  objc_msgSend(v253, "layoutReferenceSize");
  v11->_tapNavigationAreaWidth = v108 * v109;
  objc_msgSend(v250, "scrubberLayoutSettings");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "assetCornerRadius");
  v11->_scrubberAssetCornerRadius = v111;
  objc_msgSend(v110, "defaultAssetPadding");
  v11->_scrubberRegularAssetPadding = v112;
  objc_msgSend(v110, "currentAssetPadding");
  v11->_scrubberCurrentAssetPadding = v113;
  if (v13 == 3)
  {
    objc_msgSend(v110, "scrubberHeightPortrait");
    v115 = v114;
    objc_msgSend(v110, "defaultAssetWidthPortrait");
    v11->_scrubberRegularAssetSize.width = v116;
    v11->_scrubberRegularAssetSize.height = v115;
    v11->_scrubberHorizontalLayoutMargin = 80.0;
  }
  else
  {
    if (v50 == 1)
    {
      objc_msgSend(v110, "scrubberHeightPortrait");
      v118 = v117;
      objc_msgSend(v110, "defaultAssetWidthPortrait");
    }
    else
    {
      objc_msgSend(v110, "scrubberHeightLandscape");
      v118 = v120;
      objc_msgSend(v110, "defaultAssetWidthLandscape");
    }
    v11->_scrubberRegularAssetSize.width = v119;
    v11->_scrubberRegularAssetSize.height = v118;
    if (v13 == 5)
      goto LABEL_100;
  }
  if (objc_msgSend(v250, "showMusicAndColorGradeEditor"))
    objc_msgSend(v250, "showStyleSwitcher");
LABEL_100:
  p_top = (_OWORD *)&v11->_scrubberFadeAreaInsets.top;
  v244 = v73;
  v232 = v110;
  if (v11->_shouldHorizontallyCenterPlayButton)
  {
    *p_top = v238;
    *(_OWORD *)&v11->_scrubberFadeAreaInsets.bottom = v241;
  }
  else
  {
    PXEdgeInsetsMake();
    *(_QWORD *)p_top = v122;
    v11->_scrubberFadeAreaInsets.left = v123;
    v11->_scrubberFadeAreaInsets.bottom = v124;
    v11->_scrubberFadeAreaInsets.right = v125;
  }
  v126 = 4;
  v127 = 0.0;
  if (v13 == 4)
    v128 = 1.0;
  else
    v128 = 0.0;
  if (v13 == 3)
    v129 = 30.0;
  else
    v129 = 10.0;
  v130 = objc_alloc(MEMORY[0x1E0CB3498]);
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryUpNextTitle"), CFSTR("PhotosUICore"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = *MEMORY[0x1E0DC1138];
  v259[0] = *MEMORY[0x1E0DC1138];
  PXFontWithTextStyleSymbolicTraits();
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v260[0] = v133;
  v242 = *MEMORY[0x1E0DC1140];
  v259[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v260[1] = v134;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v260, v259, 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v130, "initWithString:attributes:", v131, v135);
  relatedAttributedTitle = v11->_relatedAttributedTitle;
  v11->_relatedAttributedTitle = (NSAttributedString *)v136;

  -[NSAttributedString size](v11->_relatedAttributedTitle, "size");
  v11->_relatedTitleSize.width = v138;
  v11->_relatedTitleSize.height = v139;
  v11->_spacingBetweenRelatedTitleAndMainRelated = v129;
  v11->_spacingBetweenPlaybackEndButtonAndTitles = 10.0;
  v11->_spacingBetweenPlaybackEndTitleAndSubtitle = 0.0;
  v11->_maximumWidthForRelatedTitleAndSubtitle = 1.79769313e308;
  v11->_spacingBetweenRelatedNavigationButtonAndRelated = 16.0;
  v11->_relatedNavigationButtonFadeDuration = 0.5;
  objc_storeStrong((id *)&v11->_relatedNavigationChromeButtonSpec, v11->_chromeButtonSpec);
  __asm { FMOV            V0.2D, #28.0 }
  v11->_relatedNavigationButtonSize = _Q0;
  v11->_relatedNavigationButtonSystemImagePointSize = 22.0;
  v11->_canShowRelatedNavigationButton = v128;
  v141 = objc_alloc_init(PXStoryRelatedLayoutMetrics);
  relatedLayoutMetrics = v11->_relatedLayoutMetrics;
  v11->_relatedLayoutMetrics = v141;

  if (v13 == 3)
  {
    v143 = 80.0;
    v144 = 40.0;
    v145 = 1;
    v146 = 1;
    v147 = 80.0;
  }
  else
  {
    if (v13 == 4)
    {
      v11->_spacingBetweenRelatedTitleAndMainRelated = 12.0;
      v11->_spacingBetweenPlaybackEndButtonAndTitles = 16.0;
      v11->_spacingBetweenPlaybackEndTitleAndSubtitle = 4.0;
      v11->_maximumWidthForRelatedTitleAndSubtitle = 224.0;
      v145 = 1;
      v11->_shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView = 1;
      v144 = 13.0;
      v127 = 300.0;
      v147 = 60.0;
      v143 = 73.0;
      v126 = 3;
      v146 = 2;
      v148 = 60.0;
      goto LABEL_114;
    }
    if (v235 == 1 && v252 == 1)
    {
      -[PXStoryConcreteViewLayoutSpec playbackEndTitleAttributes](v11, "playbackEndTitleAttributes");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = 1;
      -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](v11, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v207, 1);
      v209 = v208;

      -[PXStoryConcreteViewLayoutSpec playbackEndSubtitleAttributes](v11, "playbackEndSubtitleAttributes");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](v11, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v210, 1);
      v212 = v211;

      v213 = v11->_chromeButtonPadding.height
           + v11->_chromeButtonSize.height
           + v11->_spacingBetweenRelatedTitleAndMainRelated
           + 10.0;
      v147 = v209 + v212 + v213;
      v127 = v11->_relatedTitleSize.height + v213;
      v144 = 15.0;
      v143 = 40.0;
      v126 = 2;
      v146 = 1;
    }
    else
    {
      if (v235 == 1)
        v126 = 1;
      else
        v126 = 3;
      v147 = 35.0;
      v127 = v11->_relatedTitleSize.height + 35.0 + v11->_spacingBetweenRelatedTitleAndMainRelated;
      v11->_shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView = 1;
      v144 = 10.0;
      v143 = 36.0;
      v145 = 2;
      v146 = 2;
    }
  }
  v148 = v143;
LABEL_114:
  v149 = -[PXStoryConcreteViewChromeTitleSpec initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:]([PXStoryConcreteViewChromeTitleSpec alloc], "initWithNumberOfTitleLines:numberOfSubtitleLines:configuration:", v146, v145, v249);
  playbackEndChromeTitleSpec = v11->_playbackEndChromeTitleSpec;
  v11->_playbackEndChromeTitleSpec = (PXStoryViewChromeTitleSpec *)v149;

  -[PXStoryRelatedLayoutMetrics setMargins:](v11->_relatedLayoutMetrics, "setMargins:", v127, v148, v147, v143);
  -[PXStoryRelatedLayoutMetrics setInteritemSpacing:](v11->_relatedLayoutMetrics, "setInteritemSpacing:", v144);
  -[PXStoryRelatedLayoutMetrics setLayoutMode:](v11->_relatedLayoutMetrics, "setLayoutMode:", v126);
  if (v255 == 4)
  {
    PXFontWithTextStyleSymbolicTraits();
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyleSymbolicTraits();
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v151, v11->_playbackEndChromeTitleSpec, 1.0);
    v153 = objc_claimAutoreleasedReturnValue();
    playbackEndTitleAttributes = v11->_playbackEndTitleAttributes;
    v11->_playbackEndTitleAttributes = (NSDictionary *)v153;

    __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v152, v11->_playbackEndChromeTitleSpec, 1.0);
    v155 = objc_claimAutoreleasedReturnValue();
    playbackEndSubtitleAttributes = v11->_playbackEndSubtitleAttributes;
    v11->_playbackEndSubtitleAttributes = (NSDictionary *)v155;

  }
  else
  {
    __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v236, v11->_playbackEndChromeTitleSpec, 0.9);
    v157 = objc_claimAutoreleasedReturnValue();
    v158 = v11->_playbackEndTitleAttributes;
    v11->_playbackEndTitleAttributes = (NSDictionary *)v157;

    __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v244, v11->_playbackEndChromeTitleSpec, 1.1);
    v159 = objc_claimAutoreleasedReturnValue();
    v151 = v11->_playbackEndSubtitleAttributes;
    v11->_playbackEndSubtitleAttributes = (NSDictionary *)v159;
  }

  v160 = v11->_relatedTitleSize.height * 1.2;
  v11->_upNextCountDownSize.width = v160;
  v11->_upNextCountDownSize.height = v160;
  v161 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  upNextCountDownFormatter = v11->_upNextCountDownFormatter;
  v11->_upNextCountDownFormatter = v161;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter setLocale:](v11->_upNextCountDownFormatter, "setLocale:", v163);

  -[NSNumberFormatter setNumberStyle:](v11->_upNextCountDownFormatter, "setNumberStyle:", 1);
  v257[0] = v132;
  PXSystemFontOfSizeAndWeight();
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v258[0] = v164;
  v257[1] = v242;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v258[1] = v165;
  v257[2] = *MEMORY[0x1E0DC1178];
  v166 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v166, "setAlignment:", 1);
  v167 = (void *)objc_msgSend(v166, "copy");

  v258[2] = v167;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v258, v257, 3);
  v168 = objc_claimAutoreleasedReturnValue();
  upNextCountDownAttributes = v11->_upNextCountDownAttributes;
  v11->_upNextCountDownAttributes = (NSDictionary *)v168;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, round(v11->_upNextCountDownSize.height));
  v170 = objc_claimAutoreleasedReturnValue();
  v171 = objc_alloc((Class)off_1E50B2470);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = (void *)v170;
  v173 = objc_msgSend(v171, "initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:", CFSTR("circle"), 1, 0, v172, v170, 0);
  upNextCountDownDecorationImageConfiguration = v11->_upNextCountDownDecorationImageConfiguration;
  v11->_upNextCountDownDecorationImageConfiguration = (PXExtendedImageConfiguration *)v173;

  v11->_spacingBetweenRelatedTitleAndUpNextCountDown = 10.0;
  v11->_upNextCountDownVerticalOffset = 0.0;
  v11->_upNextCountDownFadeOutDuration = 0.5;
  v11->_upNextCountDownAppearDelay = 5.0;
  v11->_upNextCountDownInitialVisibleValue = 9.0;
  v11->_upNextTargetMemoryCount = +[PXStoryRelatedLayoutGenerator preferredNumberOfItemsForExtendedTraitCollection:](PXStoryRelatedLayoutGenerator, "preferredNumberOfItemsForExtendedTraitCollection:", v253);
  v11->_upNextAnimationStyle = 1;
  v11->_upNextCountdownPlacement = 1;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "resolvedColorWithTraitCollection:", v175);
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "resolvedColorWithTraitCollection:", v175);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  v180 = (v254 & 0x10) == 0 || v246;
  if (v180 == 1)
  {
    v181 = v177;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v181 = (id)objc_claimAutoreleasedReturnValue();

  }
  PXCappedFontWithTextStyleAndWeight();
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = v181;
  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(v182, v181);
  v183 = objc_claimAutoreleasedReturnValue();
  styleSwitcherDetailsLabelAttributesA = v11->_styleSwitcherDetailsLabelAttributesA;
  v11->_styleSwitcherDetailsLabelAttributesA = (NSDictionary *)v183;

  v239 = v179;
  if (v180)
  {
    v185 = v179;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v185 = (id)objc_claimAutoreleasedReturnValue();

  }
  PXCappedFontWithTextStyleAndWeight();
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(v186, v185);
  v187 = objc_claimAutoreleasedReturnValue();
  styleSwitcherDetailsLabelAttributesAAccessory = v11->_styleSwitcherDetailsLabelAttributesAAccessory;
  v11->_styleSwitcherDetailsLabelAttributesAAccessory = (NSDictionary *)v187;

  v11->_styleSwitcherDetailsTitleAccessoryPadding = 4.0;
  v243 = v177;
  if (v180)
  {
    v189 = v177;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v189 = (id)objc_claimAutoreleasedReturnValue();

  }
  PXCappedFontWithTextStyleAndWeight();
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(v190, v189);
  v191 = objc_claimAutoreleasedReturnValue();
  styleSwitcherDetailsLabelAttributesB = v11->_styleSwitcherDetailsLabelAttributesB;
  v11->_styleSwitcherDetailsLabelAttributesB = (NSDictionary *)v191;

  if (v180
    && (objc_msgSend(v253, "traitCollection"),
        v193 = (void *)objc_claimAutoreleasedReturnValue(),
        v193,
        v193))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "resolvedColorWithTraitCollection:", v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
  }
  PXCappedFontWithTextStyleAndWeight();
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(v197, v196);
  v198 = objc_claimAutoreleasedReturnValue();
  styleSwitcherDetailsLabelAttributesC = v11->_styleSwitcherDetailsLabelAttributesC;
  v11->_styleSwitcherDetailsLabelAttributesC = (NSDictionary *)v198;

  v200 = objc_msgSend(v253, "contentSizeCategory") - 8;
  v201 = 2;
  if (v252 != 1)
    v201 = 3;
  if (v200 >= 5)
    v202 = 1;
  else
    v202 = v201;
  v11->_styleSwitcherChromeArrangement = v202;
  v11->_styleSwitcherDistanceBetweenAlbumArtAndLabels = 10.0;
  v203 = 10.0;
  if (v255 == 5)
    v203 = 16.0;
  v11->_styleSwitcherDistanceBetweenEditButtons = v203;
  if ((v254 & 0x10) != 0 || v255 == 5)
  {
    -[PXFeatureSpec defaultBackgroundColor](v11, "defaultBackgroundColor");
    v205 = objc_claimAutoreleasedReturnValue();
    playerBackgroundColor = v11->_playerBackgroundColor;
    v11->_playerBackgroundColor = (UIColor *)v205;
  }
  else
  {
    if ((v254 & 0x4000) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "px_placeholderBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v204 = objc_claimAutoreleasedReturnValue();
    playerBackgroundColor = v11->_playerBackgroundColor;
    v11->_playerBackgroundColor = (UIColor *)v204;
  }

  if ((v255 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[PXFeatureSpec defaultBackgroundColor](v11, "defaultBackgroundColor");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v214 = v11->_playerBackgroundColor;
  }
  objc_storeStrong((id *)&v11->_browseGridBackgroundColor, v214);
  if ((v255 & 0xFFFFFFFFFFFFFFFELL) == 4)

  v11->_styleSwitcherCanShowEditButtons = (v254 & 0x10) == 0;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v197, 1);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", v196);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "configurationByApplyingConfiguration:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("camera.filters"), v217);
  v218 = objc_claimAutoreleasedReturnValue();
  styleSwitcherColorGradeNameGlyphImage = v11->_styleSwitcherColorGradeNameGlyphImage;
  v11->_styleSwitcherColorGradeNameGlyphImage = (UIImage *)v218;

  scrubberAssetCornerRadius = 0.0;
  v9 = v253;
  if (v255 != 3)
    scrubberAssetCornerRadius = v11->_scrubberAssetCornerRadius;
  v11->_bufferingIndicatorCornerRadius = scrubberAssetCornerRadius;
  v11->_bufferingIndicatorWantsBackground = v255 != 3;
  -[PXStoryConcreteViewLayoutSpec _calculatePredictedBrowseChromeTextHeight](v11, "_calculatePredictedBrowseChromeTextHeight");
  v11->_predictedBrowseChromeTextHeight = v221;
  PXEdgeInsetsMake();
  v11->_infoPanelMargins.top = v222;
  v11->_infoPanelMargins.left = v223;
  v11->_infoPanelMargins.bottom = v224;
  v11->_infoPanelMargins.right = v225;
  PXEdgeInsetsMake();
  v11->_infoPanelPadding.top = v226;
  v11->_infoPanelPadding.left = v227;
  v11->_infoPanelPadding.bottom = v228;
  v11->_infoPanelPadding.right = v229;
  v11->_infoPanelHeight = 246.0;
  v11->_infoPanelAnimationDistance = 280.0;
  v11->_infoPanelAssetAspectRatio = 1.77777778;
  v11->_infoPanelButtonOffset = (CGSize)xmmword_1A7C0C740;
  v11->_infoPanelButtonHeight = 64.0;
  v11->_infoPanelDistanceBetweenAssetAndTitleLabel = 37.0;
  v11->_infoPanelAssetToSymbolCenter = 51.0;
  v11->_infoPanelAssetToMetadataLabel = 74.0;
  v11->_infoPanelTitleLabelBaselineFromTop = 64.0;
  v11->_infoPanelFooterLabelBaselineFromBottom = 34.0;
  v11->_infoPanelTitleToMetadataBaselines = 38.0;
  v11->_infoPanelMetadataToMetadataBaselines = 34.0;
  v11->_largeFormSheetSize = 670.0;

  v10 = v251;
LABEL_158:
  v230 = v11;

  return v230;
}

- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXStoryConcreteViewLayoutSpec initWithExtendedTraitCollection:options:storyConfigurationOptions:customGeneralChromeTitleConfiguration:](self, "initWithExtendedTraitCollection:options:storyConfigurationOptions:customGeneralChromeTitleConfiguration:", a3, a4, 0, 0);
}

- (id)chromeSongStringWithTitle:(id)a3 artist:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXStoryConcreteViewLayoutSpec chromeTitleLocalizedSongFormat](self, "chromeTitleLocalizedSongFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)chromeSongAttributedStringWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[PXStoryConcreteViewLayoutSpec chromeSongSymbolName](self, "chromeSongSymbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  -[PXStoryConcreteViewLayoutSpec chromeTitleMusicSystemImageConfiguration](self, "chromeTitleMusicSystemImageConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_systemImageNamed:withConfiguration:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryConcreteViewLayoutSpec chromeSubtitleAttributes](self, "chromeSubtitleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v11);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addAttributes:range:", v9, 0, objc_msgSend(v13, "length"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v9);
  objc_msgSend(v13, "appendAttributedString:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v9);
  objc_msgSend(v13, "appendAttributedString:", v15);

  return v13;
}

- (double)_calculatePredictedBrowseChromeTextHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[PXStoryConcreteViewLayoutSpec browseChromeTitleSpec](self, "browseChromeTitleSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteViewLayoutSpec chromeTitleAttributes](self, "chromeTitleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](self, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v4, objc_msgSend(v3, "numberOfTitleLines"));
  v6 = v5;

  -[PXStoryConcreteViewLayoutSpec chromeSubtitleAttributes](self, "chromeSubtitleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](self, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v7, objc_msgSend(v3, "numberOfSubtitleLines"));
  v9 = v8;

  v10 = v6 + v9;
  -[PXStoryConcreteViewLayoutSpec chromeButtonSpec](self, "chromeButtonSpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultImageSize");
  v13 = v12;

  -[PXStoryConcreteViewLayoutSpec distanceFromTopEdgeToTopButtonCenter](self, "distanceFromTopEdgeToTopButtonCenter");
  *(float *)&v14 = fmax(v14 - v13 * 0.5, v14 - v13 * 0.5 + v13 * 0.5 - v10 * 0.5);
  v15 = ceil(v10 + roundf(*(float *)&v14));

  return v15;
}

- (NSString)chromeSongSymbolName
{
  return (NSString *)CFSTR("music");
}

- (double)_predictedChromeTextBoxHeightWithAttributes:(id)a3 numberOfLines:(int64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithString:attributes:", CFSTR("L"), v6);

  objc_msgSend(v7, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a4, 1, INFINITY);
  v9 = v8;

  return v9;
}

- (UIColor)playerBackgroundColor
{
  return self->_playerBackgroundColor;
}

- (UIColor)browseGridBackgroundColor
{
  return self->_browseGridBackgroundColor;
}

- (BOOL)shouldUseUnifiedButtonLayout
{
  return self->_shouldUseUnifiedButtonLayout;
}

- (BOOL)canShowCloseButton
{
  return self->_canShowCloseButton;
}

- (BOOL)canShowMuteToggleButton
{
  return self->_canShowMuteToggleButton;
}

- (BOOL)canShowManagePhotosAction
{
  return self->_canShowManagePhotosAction;
}

- (BOOL)wantsEdgeTapToChangeCurrentSegment
{
  return self->_wantsEdgeTapToChangeCurrentSegment;
}

- (BOOL)wantsSwipeDownGestureToDismiss
{
  return self->_wantsSwipeDownGestureToDismiss;
}

- (unint64_t)fullsizePlayerDefaultChromeItems
{
  return self->_fullsizePlayerDefaultChromeItems;
}

- (UIEdgeInsets)tapNavigationAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tapNavigationAreaInsets.top;
  left = self->_tapNavigationAreaInsets.left;
  bottom = self->_tapNavigationAreaInsets.bottom;
  right = self->_tapNavigationAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)tapNavigationAreaWidth
{
  return self->_tapNavigationAreaWidth;
}

- (CGSize)chromeButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_chromeButtonSize.width;
  height = self->_chromeButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)defaultChromeButtonBackgroundStyle
{
  return self->_defaultChromeButtonBackgroundStyle;
}

- (int64_t)nonblurredChromeButtonBackgroundStyle
{
  return self->_nonblurredChromeButtonBackgroundStyle;
}

- (double)interChromeButtonSpacing
{
  return self->_interChromeButtonSpacing;
}

- (double)interTopTrailingChromeButtonSpacing
{
  return self->_interTopTrailingChromeButtonSpacing;
}

- (double)interTopLeadingChromeButtonSpacing
{
  return self->_interTopLeadingChromeButtonSpacing;
}

- (CGPoint)shareButtonExtraOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_shareButtonExtraOffset.x;
  y = self->_shareButtonExtraOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)chromeButtonPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_chromeButtonPadding.width;
  height = self->_chromeButtonPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldHorizontallyCenterPlayButton
{
  return self->_shouldHorizontallyCenterPlayButton;
}

- (BOOL)shouldVerticallyCenterPlayButton
{
  return self->_shouldVerticallyCenterPlayButton;
}

- (PXStoryChromeButtonSpec)chromeButtonSpec
{
  return self->_chromeButtonSpec;
}

- (PXStoryPlayButtonSpec)playButtonSpec
{
  return self->_playButtonSpec;
}

- (NSString)replayButtonImageName
{
  return self->_replayButtonImageName;
}

- (NSString)closeButtonImageName
{
  return self->_closeButtonImageName;
}

- (NSString)actionMenuButtonImageName
{
  return self->_actionMenuButtonImageName;
}

- (CGSize)playbackEndButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_playbackEndButtonSize.width;
  height = self->_playbackEndButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)playbackEndButtonSystemImagePointSize
{
  return self->_playbackEndButtonSystemImagePointSize;
}

- (double)playbackEndButtonSystemImageWeight
{
  return self->_playbackEndButtonSystemImageWeight;
}

- (double)interPlaybackEndButtonSpacing
{
  return self->_interPlaybackEndButtonSpacing;
}

- (BOOL)onlyShowReplayEndButtonAtTopOfTitle
{
  return self->_onlyShowReplayEndButtonAtTopOfTitle;
}

- (CGSize)playbackEndButtonPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_playbackEndButtonPadding.width;
  height = self->_playbackEndButtonPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXStoryChromeButtonSpec)playbackEndButtonSpec
{
  return self->_playbackEndButtonSpec;
}

- (double)spacingBetweenPlaybackEndButtonAndTitles
{
  return self->_spacingBetweenPlaybackEndButtonAndTitles;
}

- (int64_t)styleSwitcherButtonPlacement
{
  return self->_styleSwitcherButtonPlacement;
}

- (int64_t)muteToggleButtonPlacement
{
  return self->_muteToggleButtonPlacement;
}

- (int64_t)playButtonPlacement
{
  return self->_playButtonPlacement;
}

- (NSDictionary)chromeTitleAttributes
{
  return self->_chromeTitleAttributes;
}

- (NSDictionary)chromeSubtitleAttributes
{
  return self->_chromeSubtitleAttributes;
}

- (NSDictionary)playbackEndTitleAttributes
{
  return self->_playbackEndTitleAttributes;
}

- (NSDictionary)playbackEndSubtitleAttributes
{
  return self->_playbackEndSubtitleAttributes;
}

- (BOOL)shouldUseAssetCollectionForTitleAndSubtitle
{
  return self->_shouldUseAssetCollectionForTitleAndSubtitle;
}

- (PXStoryViewChromeTitleSpec)playbackEndChromeTitleSpec
{
  return self->_playbackEndChromeTitleSpec;
}

- (PXStoryViewChromeTitleSpec)browseChromeTitleSpec
{
  return self->_browseChromeTitleSpec;
}

- (PXStoryViewChromeTitleSpec)generalChromeTitleSpec
{
  return self->_generalChromeTitleSpec;
}

- (double)distanceFromBottomChromeTextToGrid
{
  return self->_distanceFromBottomChromeTextToGrid;
}

- (double)minimumWidthRequiredForChromeText
{
  return self->_minimumWidthRequiredForChromeText;
}

- (UIEdgeInsets)browseGridLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_browseGridLayoutMargins.top;
  left = self->_browseGridLayoutMargins.left;
  bottom = self->_browseGridLayoutMargins.bottom;
  right = self->_browseGridLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)preferredUserInterfaceStyleForBrowseGridInlineAddButton
{
  return self->_preferredUserInterfaceStyleForBrowseGridInlineAddButton;
}

- (BOOL)browseGridAllowsDragGesture
{
  return self->_browseGridAllowsDragGesture;
}

- (PXExtendedImageConfiguration)rightEdgeHighlightImageConfiguration
{
  return self->_rightEdgeHighlightImageConfiguration;
}

- (CGSize)rightEdgeHighlightImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_rightEdgeHighlightImageSize.width;
  height = self->_rightEdgeHighlightImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)rightEdgeHighlightImageVersion
{
  return self->_rightEdgeHighlightImageVersion;
}

- (double)edgeHighlightAlpha
{
  return self->_edgeHighlightAlpha;
}

- (double)topLegibilityGradientHeight
{
  return self->_topLegibilityGradientHeight;
}

- (double)bottomLegibilityGradientHeight
{
  return self->_bottomLegibilityGradientHeight;
}

- (double)solidLegibilityGradientCornerRadius
{
  return self->_solidLegibilityGradientCornerRadius;
}

- (double)topLegibilityGradientCornerRadius
{
  return self->_topLegibilityGradientCornerRadius;
}

- (double)bottomLegibilityGradientCornerRadius
{
  return self->_bottomLegibilityGradientCornerRadius;
}

- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration
{
  return self->_legibilityGradientImageConfiguration;
}

- (double)distanceFromTopEdgeToTopButtonCenter
{
  return self->_distanceFromTopEdgeToTopButtonCenter;
}

- (double)distanceFromLateralEdgesToTopButtonCenter
{
  return self->_distanceFromLateralEdgesToTopButtonCenter;
}

- (double)scrubberAssetCornerRadius
{
  return self->_scrubberAssetCornerRadius;
}

- (double)scrubberRegularAssetPadding
{
  return self->_scrubberRegularAssetPadding;
}

- (double)scrubberCurrentAssetPadding
{
  return self->_scrubberCurrentAssetPadding;
}

- (CGSize)scrubberRegularAssetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scrubberRegularAssetSize.width;
  height = self->_scrubberRegularAssetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scrubberHorizontalLayoutMargin
{
  return self->_scrubberHorizontalLayoutMargin;
}

- (UIEdgeInsets)scrubberFadeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrubberFadeAreaInsets.top;
  left = self->_scrubberFadeAreaInsets.left;
  bottom = self->_scrubberFadeAreaInsets.bottom;
  right = self->_scrubberFadeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXStoryRelatedLayoutMetrics)relatedLayoutMetrics
{
  return self->_relatedLayoutMetrics;
}

- (BOOL)shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView
{
  return self->_shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView;
}

- (CGSize)relatedTitleSize
{
  double width;
  double height;
  CGSize result;

  width = self->_relatedTitleSize.width;
  height = self->_relatedTitleSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSAttributedString)relatedAttributedTitle
{
  return self->_relatedAttributedTitle;
}

- (double)spacingBetweenRelatedTitleAndMainRelated
{
  return self->_spacingBetweenRelatedTitleAndMainRelated;
}

- (double)spacingBetweenPlaybackEndTitleAndSubtitle
{
  return self->_spacingBetweenPlaybackEndTitleAndSubtitle;
}

- (double)maximumWidthForRelatedTitleAndSubtitle
{
  return self->_maximumWidthForRelatedTitleAndSubtitle;
}

- (double)spacingBetweenRelatedNavigationButtonAndRelated
{
  return self->_spacingBetweenRelatedNavigationButtonAndRelated;
}

- (PXStoryChromeButtonSpec)relatedNavigationChromeButtonSpec
{
  return self->_relatedNavigationChromeButtonSpec;
}

- (double)canShowRelatedNavigationButton
{
  return self->_canShowRelatedNavigationButton;
}

- (double)relatedNavigationButtonFadeDuration
{
  return self->_relatedNavigationButtonFadeDuration;
}

- (double)relatedNavigationButtonSystemImagePointSize
{
  return self->_relatedNavigationButtonSystemImagePointSize;
}

- (CGSize)relatedNavigationButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_relatedNavigationButtonSize.width;
  height = self->_relatedNavigationButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)upNextCountDownSize
{
  double width;
  double height;
  CGSize result;

  width = self->_upNextCountDownSize.width;
  height = self->_upNextCountDownSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumberFormatter)upNextCountDownFormatter
{
  return self->_upNextCountDownFormatter;
}

- (NSDictionary)upNextCountDownAttributes
{
  return self->_upNextCountDownAttributes;
}

- (PXExtendedImageConfiguration)upNextCountDownDecorationImageConfiguration
{
  return self->_upNextCountDownDecorationImageConfiguration;
}

- (double)spacingBetweenRelatedTitleAndUpNextCountDown
{
  return self->_spacingBetweenRelatedTitleAndUpNextCountDown;
}

- (double)upNextCountDownVerticalOffset
{
  return self->_upNextCountDownVerticalOffset;
}

- (double)upNextCountDownFadeOutDuration
{
  return self->_upNextCountDownFadeOutDuration;
}

- (double)upNextCountDownAppearDelay
{
  return self->_upNextCountDownAppearDelay;
}

- (double)upNextCountDownInitialVisibleValue
{
  return self->_upNextCountDownInitialVisibleValue;
}

- (unint64_t)upNextTargetMemoryCount
{
  return self->_upNextTargetMemoryCount;
}

- (int64_t)upNextAnimationStyle
{
  return self->_upNextAnimationStyle;
}

- (int64_t)upNextCountdownPlacement
{
  return self->_upNextCountdownPlacement;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesA
{
  return self->_styleSwitcherDetailsLabelAttributesA;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesAAccessory
{
  return self->_styleSwitcherDetailsLabelAttributesAAccessory;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesB
{
  return self->_styleSwitcherDetailsLabelAttributesB;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesC
{
  return self->_styleSwitcherDetailsLabelAttributesC;
}

- (int64_t)styleSwitcherChromeArrangement
{
  return self->_styleSwitcherChromeArrangement;
}

- (double)styleSwitcherDetailsTitleAccessoryPadding
{
  return self->_styleSwitcherDetailsTitleAccessoryPadding;
}

- (double)styleSwitcherDistanceBetweenAlbumArtAndLabels
{
  return self->_styleSwitcherDistanceBetweenAlbumArtAndLabels;
}

- (double)styleSwitcherDistanceBetweenEditButtons
{
  return self->_styleSwitcherDistanceBetweenEditButtons;
}

- (BOOL)styleSwitcherCanShowEditButtons
{
  return self->_styleSwitcherCanShowEditButtons;
}

- (UIImage)styleSwitcherColorGradeNameGlyphImage
{
  return self->_styleSwitcherColorGradeNameGlyphImage;
}

- (double)bufferingIndicatorCornerRadius
{
  return self->_bufferingIndicatorCornerRadius;
}

- (BOOL)bufferingIndicatorWantsBackground
{
  return self->_bufferingIndicatorWantsBackground;
}

- (double)predictedBrowseChromeTextHeight
{
  return self->_predictedBrowseChromeTextHeight;
}

- (UIEdgeInsets)infoPanelMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_infoPanelMargins.top;
  left = self->_infoPanelMargins.left;
  bottom = self->_infoPanelMargins.bottom;
  right = self->_infoPanelMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)infoPanelPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_infoPanelPadding.top;
  left = self->_infoPanelPadding.left;
  bottom = self->_infoPanelPadding.bottom;
  right = self->_infoPanelPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)infoPanelHeight
{
  return self->_infoPanelHeight;
}

- (double)infoPanelAnimationDistance
{
  return self->_infoPanelAnimationDistance;
}

- (double)infoPanelAssetAspectRatio
{
  return self->_infoPanelAssetAspectRatio;
}

- (CGSize)infoPanelButtonOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_infoPanelButtonOffset.width;
  height = self->_infoPanelButtonOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)infoPanelButtonHeight
{
  return self->_infoPanelButtonHeight;
}

- (double)infoPanelDistanceBetweenAssetAndTitleLabel
{
  return self->_infoPanelDistanceBetweenAssetAndTitleLabel;
}

- (double)infoPanelAssetToSymbolCenter
{
  return self->_infoPanelAssetToSymbolCenter;
}

- (double)infoPanelAssetToMetadataLabel
{
  return self->_infoPanelAssetToMetadataLabel;
}

- (double)infoPanelFooterLabelBaselineFromBottom
{
  return self->_infoPanelFooterLabelBaselineFromBottom;
}

- (double)infoPanelTitleLabelBaselineFromTop
{
  return self->_infoPanelTitleLabelBaselineFromTop;
}

- (double)infoPanelTitleToMetadataBaselines
{
  return self->_infoPanelTitleToMetadataBaselines;
}

- (double)infoPanelMetadataToMetadataBaselines
{
  return self->_infoPanelMetadataToMetadataBaselines;
}

- (double)largeFormSheetSize
{
  return self->_largeFormSheetSize;
}

- (UIImageConfiguration)chromeTitleMusicSystemImageConfiguration
{
  return self->_chromeTitleMusicSystemImageConfiguration;
}

- (NSString)chromeTitleLocalizedSongFormat
{
  return self->_chromeTitleLocalizedSongFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeTitleLocalizedSongFormat, 0);
  objc_storeStrong((id *)&self->_chromeTitleMusicSystemImageConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSwitcherColorGradeNameGlyphImage, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesC, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesB, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesAAccessory, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesA, 0);
  objc_storeStrong((id *)&self->_upNextCountDownDecorationImageConfiguration, 0);
  objc_storeStrong((id *)&self->_upNextCountDownAttributes, 0);
  objc_storeStrong((id *)&self->_upNextCountDownFormatter, 0);
  objc_storeStrong((id *)&self->_relatedNavigationChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_relatedAttributedTitle, 0);
  objc_storeStrong((id *)&self->_relatedLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_legibilityGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_rightEdgeHighlightImageConfiguration, 0);
  objc_storeStrong((id *)&self->_generalChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_browseChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_playbackEndChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_playbackEndSubtitleAttributes, 0);
  objc_storeStrong((id *)&self->_playbackEndTitleAttributes, 0);
  objc_storeStrong((id *)&self->_chromeSubtitleAttributes, 0);
  objc_storeStrong((id *)&self->_chromeTitleAttributes, 0);
  objc_storeStrong((id *)&self->_playbackEndButtonSpec, 0);
  objc_storeStrong((id *)&self->_actionMenuButtonImageName, 0);
  objc_storeStrong((id *)&self->_closeButtonImageName, 0);
  objc_storeStrong((id *)&self->_replayButtonImageName, 0);
  objc_storeStrong((id *)&self->_playButtonSpec, 0);
  objc_storeStrong((id *)&self->_chromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_browseGridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_playerBackgroundColor, 0);
}

id __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(void *a1, void *a2, double a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC1290];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(v6, "textAlignment");
  objc_msgSend(v9, "setAlignment:", v10);
  objc_msgSend(v9, "setLineBreakMode:", 0);
  objc_msgSend(v9, "setLineHeightMultiple:", a3);
  v15[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v15[1] = *MEMORY[0x1E0DC1178];
  v12 = (void *)objc_msgSend(v9, "copy");
  v15[2] = *MEMORY[0x1E0DC1138];
  v16[1] = v12;
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setAlignment:", 0);
  v8 = *MEMORY[0x1E0DC1140];
  v14[0] = v4;
  v9 = *MEMORY[0x1E0DC1178];
  v13[0] = v8;
  v13[1] = v9;
  v10 = (void *)objc_msgSend(v7, "copy");
  v13[2] = *MEMORY[0x1E0DC1138];
  v14[1] = v10;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
