@implementation PXZoomablePhotosSettings

- (double)individualLevelMinimumScreensOfContent
{
  return self->_individualLevelMinimumScreensOfContent;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25363 != -1)
    dispatch_once(&sharedInstance_onceToken_25363, &__block_literal_global_25364);
  return (id)sharedInstance_sharedInstance_25365;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (double)panoramaCompactInteritemSpacing
{
  return self->_panoramaCompactInteritemSpacing;
}

- (int64_t)maxColumnsForSaliency
{
  return self->_maxColumnsForSaliency;
}

- (BOOL)forceSaliency
{
  return self->_forceSaliency;
}

- (BOOL)enableOneColumn
{
  return self->_enableOneColumn;
}

- (BOOL)enableDecadesDensity
{
  return self->_enableDecadesDensity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)denseLevelMinimumScreensOfContent
{
  return self->_denseLevelMinimumScreensOfContent;
}

- (int64_t)simulateMinimumPhotoCount
{
  return self->_simulateMinimumPhotoCount;
}

- (int64_t)onlyPhotosFromToday
{
  return self->_onlyPhotosFromToday;
}

- (int64_t)maxPhotoCount
{
  return self->_maxPhotoCount;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXZoomablePhotosSettings setEnablePinch:](self, "setEnablePinch:", 1);
  -[PXZoomablePhotosSettings setEnableBadges:](self, "setEnableBadges:", 1);
  -[PXZoomablePhotosSettings setEnableInlineVideo:](self, "setEnableInlineVideo:", 1);
  -[PXZoomablePhotosSettings setEnableOneColumn:](self, "setEnableOneColumn:", 1);
  -[PXZoomablePhotosSettings setEnableHeaderBlur:](self, "setEnableHeaderBlur:", 0);
  -[PXZoomablePhotosSettings setEnableDecadesDensity:](self, "setEnableDecadesDensity:", 0);
  -[PXZoomablePhotosSettings setEnableCrossfadeFallback:](self, "setEnableCrossfadeFallback:", 1);
  -[PXZoomablePhotosSettings setEnableDenseLevelsInSelectMode:](self, "setEnableDenseLevelsInSelectMode:", 1);
  -[PXZoomablePhotosSettings setDecadesDensityScale:](self, "setDecadesDensityScale:", 0.5);
  -[PXZoomablePhotosSettings setIndividualLevelMinimumScreensOfContent:](self, "setIndividualLevelMinimumScreensOfContent:", 0.0);
  -[PXZoomablePhotosSettings setDenseLevelMinimumScreensOfContent:](self, "setDenseLevelMinimumScreensOfContent:", 0.4);
  -[PXZoomablePhotosSettings setHeaderSpaceMinimumScreensOfContent:](self, "setHeaderSpaceMinimumScreensOfContent:", 1.5);
  -[PXZoomablePhotosSettings setShiftingRequiredScreensTopDistance:](self, "setShiftingRequiredScreensTopDistance:", 10.0);
  -[PXZoomablePhotosSettings setTitleUseDateRange:](self, "setTitleUseDateRange:", 1);
  -[PXZoomablePhotosSettings setZoomingHeaderTintOpacity:](self, "setZoomingHeaderTintOpacity:", 0.9);
  -[PXZoomablePhotosSettings setTapsZoomsToLastIndividualDensity:](self, "setTapsZoomsToLastIndividualDensity:", 1);
  -[PXZoomablePhotosSettings setEnableAddedDateZoomingHeader:](self, "setEnableAddedDateZoomingHeader:", 0);
  -[PXZoomablePhotosSettings setForceSaliency:](self, "setForceSaliency:", 0);
  -[PXZoomablePhotosSettings setEnableDebugLayers:](self, "setEnableDebugLayers:", 0);
  -[PXZoomablePhotosSettings setEnableDebugSprites:](self, "setEnableDebugSprites:", 0);
  -[PXZoomablePhotosSettings setColumnsChoiceIndex:](self, "setColumnsChoiceIndex:", 0);
  -[PXZoomablePhotosSettings setInteritemSpacing:](self, "setInteritemSpacing:", 1.5);
  -[PXZoomablePhotosSettings setDarkModeInteritemSpacing:](self, "setDarkModeInteritemSpacing:", 6.0);
  -[PXZoomablePhotosSettings setCardsInteritemSpacing:](self, "setCardsInteritemSpacing:", 8.0);
  -[PXZoomablePhotosSettings setPanoramaCompactInteritemSpacing:](self, "setPanoramaCompactInteritemSpacing:", 2.0);
  -[PXZoomablePhotosSettings setPanoramaRegularInteritemSpacing:](self, "setPanoramaRegularInteritemSpacing:", 10.0);
  -[PXZoomablePhotosSettings setCornerRadius:](self, "setCornerRadius:", 0.0);
  -[PXZoomablePhotosSettings setDarkModeCornerRadius:](self, "setDarkModeCornerRadius:", 6.0);
  -[PXZoomablePhotosSettings setCardsCornerRadius:](self, "setCardsCornerRadius:", 8.0);
  -[PXZoomablePhotosSettings setCardsAspectRatio:](self, "setCardsAspectRatio:", 0.666666667);
  -[PXZoomablePhotosSettings setRubberBandEffect:](self, "setRubberBandEffect:", 1);
  -[PXZoomablePhotosSettings setZoomDecelerationRate:](self, "setZoomDecelerationRate:", 992.0);
  -[PXZoomablePhotosSettings setZoomSpringStiffness:](self, "setZoomSpringStiffness:", 150.0);
  -[PXZoomablePhotosSettings setZoomSpringDamping:](self, "setZoomSpringDamping:", 1.0);
  -[PXZoomablePhotosSettings setRecenterSpringStiffness:](self, "setRecenterSpringStiffness:", 100.0);
  -[PXZoomablePhotosSettings setRecenterSpringDamping:](self, "setRecenterSpringDamping:", 1.0);
  -[PXZoomablePhotosSettings setZoomOutRubberBanding:](self, "setZoomOutRubberBanding:", 5.0);
  -[PXZoomablePhotosSettings setZoomInRubberBanding:](self, "setZoomInRubberBanding:", 0.5);
  -[PXZoomablePhotosSettings setPinchSmoothingDuration:](self, "setPinchSmoothingDuration:", 0.0333333333);
  -[PXZoomablePhotosSettings setSliderSmoothingDuration:](self, "setSliderSmoothingDuration:", 0.2);
  -[PXZoomablePhotosSettings setMacPinchGestureDampening:](self, "setMacPinchGestureDampening:", 0.5);
  -[PXZoomablePhotosSettings setSimulateMinimumPhotoCount:](self, "setSimulateMinimumPhotoCount:", 0);
  -[PXZoomablePhotosSettings setMaxPhotoCount:](self, "setMaxPhotoCount:", 0);
  -[PXZoomablePhotosSettings setOnlyPhotosFromToday:](self, "setOnlyPhotosFromToday:", 0);
  -[PXZoomablePhotosSettings setEnableAutoCrossfade:](self, "setEnableAutoCrossfade:", 1);
  -[PXZoomablePhotosSettings setAlphaMaxAcceptableScale:](self, "setAlphaMaxAcceptableScale:", 2.5);
  -[PXZoomablePhotosSettings setAlphaMinAcceptableCoverage:](self, "setAlphaMinAcceptableCoverage:", 0.5);
  -[PXZoomablePhotosSettings setMinAcceptableCoverage:](self, "setMinAcceptableCoverage:", 0.3);
  -[PXZoomablePhotosSettings setAlphaDistanceForDirectionChange:](self, "setAlphaDistanceForDirectionChange:", 0.025);
  -[PXZoomablePhotosSettings setAlphaModeTransitionDuration:](self, "setAlphaModeTransitionDuration:", 0.3);
  -[PXZoomablePhotosSettings setAlphaCrossfadeMinDuration:](self, "setAlphaCrossfadeMinDuration:", 0.2);
  -[PXZoomablePhotosSettings setAlphaCrossfadeMaxDuration:](self, "setAlphaCrossfadeMaxDuration:", 1.5);
  -[PXZoomablePhotosSettings setHideBadgesDuringZoom:](self, "setHideBadgesDuringZoom:", 0);
  -[PXZoomablePhotosSettings setPreheatDenserZoomLevels:](self, "setPreheatDenserZoomLevels:", 1);
  -[PXZoomablePhotosSettings setPreheatThumbnailsWhenIdle:](self, "setPreheatThumbnailsWhenIdle:", 0);
  -[PXZoomablePhotosSettings setMaxColumnsForSaliency:](self, "setMaxColumnsForSaliency:", 7);
  -[PXZoomablePhotosSettings setMaxColumnsForSingleDate:](self, "setMaxColumnsForSingleDate:", 3);
  -[PXZoomablePhotosSettings setEnableBlurEffect:](self, "setEnableBlurEffect:", 1);
  -[PXZoomablePhotosSettings setMaxBlurRadius:](self, "setMaxBlurRadius:", 5.0);
  -[PXZoomablePhotosSettings setBlurDimmingStrength:](self, "setBlurDimmingStrength:", 1.0);
  -[PXZoomablePhotosSettings setEnableBlurDebugLayers:](self, "setEnableBlurDebugLayers:", 0);
  -[PXZoomablePhotosSettings setUnfoldInitialPercentage:](self, "setUnfoldInitialPercentage:", 0.4);
  -[PXZoomablePhotosSettings setUnfoldVerticalShiftCompensation:](self, "setUnfoldVerticalShiftCompensation:", 0.3);
  -[PXZoomablePhotosSettings setUnfoldEaseOutAmount:](self, "setUnfoldEaseOutAmount:", 1.0);
  -[PXZoomablePhotosSettings setUnfoldDebugLogging:](self, "setUnfoldDebugLogging:", 0);
}

- (void)setZoomingHeaderTintOpacity:(double)a3
{
  self->_zoomingHeaderTintOpacity = a3;
}

- (void)setZoomSpringStiffness:(double)a3
{
  self->_zoomSpringStiffness = a3;
}

- (void)setZoomSpringDamping:(double)a3
{
  self->_zoomSpringDamping = a3;
}

- (void)setZoomOutRubberBanding:(double)a3
{
  self->_zoomOutRubberBanding = a3;
}

- (void)setZoomInRubberBanding:(double)a3
{
  self->_zoomInRubberBanding = a3;
}

- (void)setZoomDecelerationRate:(double)a3
{
  self->_zoomDecelerationRate = a3;
}

- (void)setTitleUseDateRange:(BOOL)a3
{
  self->_titleUseDateRange = a3;
}

- (void)setTapsZoomsToLastIndividualDensity:(BOOL)a3
{
  self->_tapsZoomsToLastIndividualDensity = a3;
}

- (void)setSliderSmoothingDuration:(double)a3
{
  self->_sliderSmoothingDuration = a3;
}

- (void)setSimulateMinimumPhotoCount:(int64_t)a3
{
  self->_simulateMinimumPhotoCount = a3;
}

- (void)setShiftingRequiredScreensTopDistance:(double)a3
{
  self->_shiftingRequiredScreensTopDistance = a3;
}

- (void)setRubberBandEffect:(int64_t)a3
{
  self->_rubberBandEffect = a3;
}

- (void)setRecenterSpringStiffness:(double)a3
{
  self->_recenterSpringStiffness = a3;
}

- (void)setRecenterSpringDamping:(double)a3
{
  self->_recenterSpringDamping = a3;
}

- (void)setPreheatThumbnailsWhenIdle:(BOOL)a3
{
  self->_preheatThumbnailsWhenIdle = a3;
}

- (void)setPreheatDenserZoomLevels:(int64_t)a3
{
  self->_preheatDenserZoomLevels = a3;
}

- (void)setPinchSmoothingDuration:(double)a3
{
  self->_pinchSmoothingDuration = a3;
}

- (void)setPanoramaRegularInteritemSpacing:(double)a3
{
  self->_panoramaRegularInteritemSpacing = a3;
}

- (void)setPanoramaCompactInteritemSpacing:(double)a3
{
  self->_panoramaCompactInteritemSpacing = a3;
}

- (void)setOnlyPhotosFromToday:(int64_t)a3
{
  self->_onlyPhotosFromToday = a3;
}

- (void)setMinAcceptableCoverage:(double)a3
{
  self->_minAcceptableCoverage = a3;
}

- (void)setMaxPhotoCount:(int64_t)a3
{
  self->_maxPhotoCount = a3;
}

- (void)setMaxColumnsForSingleDate:(int64_t)a3
{
  self->_maxColumnsForSingleDate = a3;
}

- (void)setMaxColumnsForSaliency:(int64_t)a3
{
  self->_maxColumnsForSaliency = a3;
}

- (void)setMacPinchGestureDampening:(double)a3
{
  self->_macPinchGestureDampening = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setIndividualLevelMinimumScreensOfContent:(double)a3
{
  self->_individualLevelMinimumScreensOfContent = a3;
}

- (void)setHideBadgesDuringZoom:(BOOL)a3
{
  self->_hideBadgesDuringZoom = a3;
}

- (void)setHeaderSpaceMinimumScreensOfContent:(double)a3
{
  self->_headerSpaceMinimumScreensOfContent = a3;
}

- (void)setForceSaliency:(BOOL)a3
{
  self->_forceSaliency = a3;
}

- (void)setEnablePinch:(BOOL)a3
{
  self->_enablePinch = a3;
}

- (void)setEnableOneColumn:(BOOL)a3
{
  self->_enableOneColumn = a3;
}

- (void)setEnableInlineVideo:(BOOL)a3
{
  self->_enableInlineVideo = a3;
}

- (void)setEnableHeaderBlur:(BOOL)a3
{
  self->_enableHeaderBlur = a3;
}

- (void)setEnableDenseLevelsInSelectMode:(BOOL)a3
{
  self->_enableDenseLevelsInSelectMode = a3;
}

- (void)setEnableDecadesDensity:(BOOL)a3
{
  self->_enableDecadesDensity = a3;
}

- (void)setEnableDebugSprites:(BOOL)a3
{
  self->_enableDebugSprites = a3;
}

- (void)setEnableDebugLayers:(BOOL)a3
{
  self->_enableDebugLayers = a3;
}

- (void)setEnableCrossfadeFallback:(BOOL)a3
{
  self->_enableCrossfadeFallback = a3;
}

- (void)setEnableBadges:(BOOL)a3
{
  self->_enableBadges = a3;
}

- (void)setEnableAutoCrossfade:(BOOL)a3
{
  self->_enableAutoCrossfade = a3;
}

- (void)setEnableAddedDateZoomingHeader:(BOOL)a3
{
  self->_enableAddedDateZoomingHeader = a3;
}

- (void)setDenseLevelMinimumScreensOfContent:(double)a3
{
  self->_denseLevelMinimumScreensOfContent = a3;
}

- (void)setDecadesDensityScale:(double)a3
{
  self->_decadesDensityScale = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setColumnsChoiceIndex:(int64_t)a3
{
  self->_columnsChoiceIndex = a3;
}

- (void)setCardsInteritemSpacing:(double)a3
{
  self->_cardsInteritemSpacing = a3;
}

- (void)setCardsCornerRadius:(double)a3
{
  self->_cardsCornerRadius = a3;
}

- (void)setCardsAspectRatio:(double)a3
{
  self->_cardsAspectRatio = a3;
}

- (void)setAlphaModeTransitionDuration:(double)a3
{
  self->_alphaModeTransitionDuration = a3;
}

- (void)setAlphaMinAcceptableCoverage:(double)a3
{
  self->_alphaMinAcceptableCoverage = a3;
}

- (void)setAlphaMaxAcceptableScale:(double)a3
{
  self->_alphaMaxAcceptableScale = a3;
}

- (void)setAlphaDistanceForDirectionChange:(double)a3
{
  self->_alphaDistanceForDirectionChange = a3;
}

- (void)setAlphaCrossfadeMinDuration:(double)a3
{
  self->_alphaCrossfadeMinDuration = a3;
}

- (void)setAlphaCrossfadeMaxDuration:(double)a3
{
  self->_alphaCrossfadeMaxDuration = a3;
}

- (BOOL)preheatThumbnailsWhenIdle
{
  return self->_preheatThumbnailsWhenIdle;
}

- (double)zoomOutRubberBanding
{
  return self->_zoomOutRubberBanding;
}

- (double)zoomInRubberBanding
{
  return self->_zoomInRubberBanding;
}

- (BOOL)enableAutoCrossfade
{
  return self->_enableAutoCrossfade;
}

- (double)alphaMinAcceptableCoverage
{
  return self->_alphaMinAcceptableCoverage;
}

- (double)alphaMaxAcceptableScale
{
  return self->_alphaMaxAcceptableScale;
}

- (double)minAcceptableCoverage
{
  return self->_minAcceptableCoverage;
}

void __42__PXZoomablePhotosSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomablePhotosSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_25365;
  sharedInstance_sharedInstance_25365 = v0;

}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  _QWORD v274[5];
  _QWORD v275[8];
  _QWORD v276[3];
  _QWORD v277[41];
  _QWORD v278[10];

  v278[8] = *MEMORY[0x1E0C80C00];
  v272 = (void *)MEMORY[0x1E0D83078];
  v2 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBlurEffect);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Blur Effect"), v268);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v278[0] = v264;
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maxBlurRadius);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius Max"), v260);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "minValue:maxValue:", 0.0, 30.0);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "px_increment:", 1.0);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v278[1] = v250;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blurDimmingStrength);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Blur Dimming Strength"), v247);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "minValue:maxValue:", 0.0, 1.0);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "px_increment:", 0.05);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v278[2] = v238;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBlurDebugLayers);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Debug Blur Layers"), v235);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v278[3] = v231;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_unfoldDebugLogging);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Debug Logging"), v228);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v278[4] = v225;
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_unfoldInitialPercentage);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Unfold Initial Percentage"), v222);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "minValue:maxValue:", 0.0, 1.0);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "px_increment:", 0.01);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v278[5] = v8;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_unfoldVerticalShiftCompensation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Vertical Shift Compensation"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_increment:", 0.01);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v278[6] = v13;
  v14 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_unfoldEaseOutAmount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Ease Out Amount"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "px_increment:", 0.01);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v278[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "sectionWithRows:title:", v19, CFSTR("Cube Mode"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  v185 = (void *)MEMORY[0x1E0D83078];
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAddedDateZoomingHeader);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Recents Zoom Date Headers"), v269);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v277[0] = v265;
  v21 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableHeaderBlur);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Header Blur"), v261);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v277[1] = v257;
  v22 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomingHeaderTintOpacity);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Header Tint"), v254);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "minValue:maxValue:", 0.0, 1.0);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "px_increment:", 0.01);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v277[2] = v245;
  v23 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_titleUseDateRange);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Title Shows Date Range"), v242);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v277[3] = v239;
  v24 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBadges);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Show Badges"), v236);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v277[4] = v232;
  v25 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_hideBadgesDuringZoom);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Hide Badges During Zoom"), v229);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v277[5] = v226;
  v26 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInlineVideo);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Inline Video"), v223);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v277[6] = v220;
  v27 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableOneColumn);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("One Column"), v217);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v277[7] = v214;
  v28 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDecadesDensity);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Enable Decades Density"), v212);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v277[8] = v210;
  v29 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_decadesDensityScale);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Decades Scale"), v208);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "minValue:maxValue:", 0.1, 0.5);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "px_increment:", 0.01);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v277[9] = v203;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceSaliency);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Force Saliency"), v202);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v277[10] = v201;
  v31 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCrossfadeFallback);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Crossfade Fallback"), v200);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v277[11] = v199;
  v32 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDenseLevelsInSelectMode);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Dense Levels in Select Mode"), v198);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v277[12] = v197;
  v33 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_tapsZoomsToLastIndividualDensity);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Tap Zooms To Last Used"), v196);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v277[13] = v195;
  v34 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_individualLevelMinimumScreensOfContent);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Individ. Min Screens Of Content"), v194);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "minValue:maxValue:", 0.0, 2.0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "px_increment:", 0.05);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v277[14] = v191;
  v35 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_denseLevelMinimumScreensOfContent);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Dense Min Screens Of Content"), v190);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "minValue:maxValue:", 0.0, 3.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "px_increment:", 0.1);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v277[15] = v187;
  v36 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_headerSpaceMinimumScreensOfContent);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Header Space Min Screens Of Content"), v184);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "minValue:maxValue:", 0.0, 3.0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "px_increment:", 0.1);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v277[16] = v181;
  v37 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shiftingRequiredScreensTopDistance);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Shifting Min Screens Distance"), v180);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "minValue:maxValue:", 0.0, 30.0);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "px_increment:", 1.0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v277[17] = v177;
  v38 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enablePinch);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Enable Pinch"), v176);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v277[18] = v175;
  v39 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_pinchSmoothingDuration);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("Pinch Smoothing Duration"), v174);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "minValue:maxValue:", 0.0, 0.1);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "px_increment:", 0.0166666667);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v277[19] = v171;
  v40 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_sliderSmoothingDuration);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Slider Smoothing Duration"), v170);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "minValue:maxValue:", 0.0, 0.5);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "px_increment:", 0.0166666667);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v277[20] = v167;
  v41 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_interitemSpacing);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Interitem Spacing"), v166);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "minValue:maxValue:", 0.0, 5.0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "px_increment:", 0.5);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v277[21] = v163;
  v42 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_darkModeInteritemSpacing);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Dark Mode Interitem Spacing"), v162);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "minValue:maxValue:", 0.0, 10.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "px_increment:", 0.5);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v277[22] = v159;
  v43 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panoramaCompactInteritemSpacing);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Pano Interitem Spacing (compact)"), v158);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "minValue:maxValue:", 0.0, 17.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "px_increment:", 1.0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v277[23] = v155;
  v44 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panoramaRegularInteritemSpacing);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:valueKeyPath:", CFSTR("Pano Interitem Spacing (regular)"), v154);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "minValue:maxValue:", 0.0, 17.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "px_increment:", 1.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v277[24] = v151;
  v45 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_maxColumnsForSingleDate);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:valueKeyPath:", CFSTR("Single Date Max Cols"), v150);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXZoomablePhotosSettings validColumns](PXZoomablePhotosSettings, "validColumns");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "px_possibleValues:", v148);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v277[25] = v147;
  v46 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_rubberBandEffect);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Rubber Band Effect"), v146);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "possibleValues:titles:", &unk_1E53E8778, &unk_1E53E8790);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v277[26] = v144;
  v47 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomOutRubberBanding);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Out Rubber Banding"), v143);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "minValue:maxValue:", 1.0, 10.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "px_increment:", 0.05);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v277[27] = v140;
  v48 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomInRubberBanding);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Zoom In Rubber Banding"), v139);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "minValue:maxValue:", 0.01, 1.0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "px_increment:", 0.01);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v277[28] = v136;
  v49 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomDecelerationRate);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Deceleration Rate"), v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "minValue:maxValue:", 985.0, 999.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "px_increment:", 1.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v277[29] = v132;
  v50 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomSpringStiffness);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Spring Stiffness"), v131);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "minValue:maxValue:", 0.0, 1000.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "px_increment:", 10.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v277[30] = v128;
  v51 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomSpringDamping);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Zoom Spring Damping Factor"), v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "minValue:maxValue:", 0.0, 1.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "px_increment:", 0.01);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v277[31] = v124;
  v52 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_recenterSpringStiffness);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Recenter Spring Stiffness"), v123);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "minValue:maxValue:", 0.0, 500.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "px_increment:", 10.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v277[32] = v120;
  v53 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_recenterSpringDamping);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Recenter Spring Damping Factor"), v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "minValue:maxValue:", 0.0, 1.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "px_increment:", 0.01);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v277[33] = v116;
  v54 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateMinimumPhotoCount);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Photo Count"), v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E53E8760, "valueForKeyPath:", CFSTR("description"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "possibleValues:titles:", &unk_1E53E8760, v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v277[34] = v112;
  v55 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_maxPhotoCount);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Max Photo Count"), v111);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E53E8760, "valueForKeyPath:", CFSTR("description"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "possibleValues:titles:", &unk_1E53E8760, v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v277[35] = v108;
  v56 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_onlyPhotosFromToday);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("Only Photos from Today"), v107);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v277[36] = v57;
  v58 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_preheatDenserZoomLevels);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:valueKeyPath:", CFSTR("Preheat Denser Zoom Layers"), v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v277[37] = v60;
  v61 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_preheatThumbnailsWhenIdle);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Preheat Thumbnails When Idle"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v277[38] = v63;
  v64 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDebugLayers);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Debug Layers"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v277[39] = v66;
  v67 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDebugSprites);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Debug Sprites"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v277[40] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v277, 41);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "sectionWithRows:title:", v70, CFSTR("Main"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  v270 = (void *)MEMORY[0x1E0D83078];
  v71 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_cardsAspectRatio);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:valueKeyPath:", CFSTR("Aspect Ratio (Portrait)"), v266);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "minValue:maxValue:", 0.01, 1.0);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "px_increment:", 0.01);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v276[0] = v72;
  v73 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_cardsCornerRadius);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "minValue:maxValue:", 0.01, 10.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "px_increment:", 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v276[1] = v77;
  v78 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_cardsInteritemSpacing);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Interitem Spacing"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "minValue:maxValue:", 0.01, 20.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "px_increment:", 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v276[2] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v276, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "sectionWithRows:title:", v83, CFSTR("Cards Style"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();

  v233 = (void *)MEMORY[0x1E0D83078];
  v84 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAutoCrossfade);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rowWithTitle:valueKeyPath:", CFSTR("Auto Crossfade"), v267);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v275[0] = v263;
  v85 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaCrossfadeMinDuration);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rowWithTitle:valueKeyPath:", CFSTR("Min Crossfade Duration"), v259);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "minValue:maxValue:", 0.01, 1.0);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "px_increment:", 0.05);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v275[1] = v249;
  v86 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaCrossfadeMaxDuration);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("Max Crossfade Duration"), v246);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "minValue:maxValue:", 0.01, 5.0);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "px_increment:", 0.05);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v275[2] = v237;
  v87 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaMaxAcceptableScale);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "rowWithTitle:valueKeyPath:", CFSTR("Max Accept. Scale"), v230);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "minValue:maxValue:", 1.0, 10.0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "px_increment:", 0.01);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v275[3] = v221;
  v88 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaMinAcceptableCoverage);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rowWithTitle:valueKeyPath:", CFSTR("Min Accept. Coverage"), v218);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "minValue:maxValue:", 0.0, 1.0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "px_increment:", 0.01);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v275[4] = v211;
  v89 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_minAcceptableCoverage);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("Min Transition Dist."), v209);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "minValue:maxValue:", 0.01, 0.9);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "px_increment:", 0.01);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v275[5] = v90;
  v91 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaDistanceForDirectionChange);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "rowWithTitle:valueKeyPath:", CFSTR("Min Dist. for Direction Change"), v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "minValue:maxValue:", 0.0, 0.5);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "px_increment:", 0.005);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v275[6] = v95;
  v96 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_alphaModeTransitionDuration);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rowWithTitle:valueKeyPath:", CFSTR("Mode Transition Duration"), v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "minValue:maxValue:", 0.01, 1.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "px_increment:", 0.05);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v275[7] = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 8);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "sectionWithRows:title:", v101, CFSTR("Crossfade"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)MEMORY[0x1E0D83078];
  v274[0] = v273;
  v274[1] = v186;
  v274[2] = v271;
  v274[3] = v234;
  v274[4] = v102;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v274, 5);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "moduleWithTitle:contents:", CFSTR("Zoomable Photos"), v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  return v105;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (NSArray)columns
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  +[PXZoomablePhotosSettings columnChoices](PXZoomablePhotosSettings, "columnChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXZoomablePhotosSettings columnsChoiceIndex](self, "columnsChoiceIndex");
  v5 = objc_msgSend(v3, "count");
  if (v4 >= v5 - 1)
    v6 = v5 - 1;
  else
    v6 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (BOOL)enablePinch
{
  return self->_enablePinch;
}

- (BOOL)enableBadges
{
  return self->_enableBadges;
}

- (BOOL)enableInlineVideo
{
  return self->_enableInlineVideo;
}

- (BOOL)enableDebugLayers
{
  return self->_enableDebugLayers;
}

- (BOOL)enableDebugSprites
{
  return self->_enableDebugSprites;
}

- (BOOL)enableHeaderBlur
{
  return self->_enableHeaderBlur;
}

- (BOOL)enableCrossfadeFallback
{
  return self->_enableCrossfadeFallback;
}

- (BOOL)enableDenseLevelsInSelectMode
{
  return self->_enableDenseLevelsInSelectMode;
}

- (BOOL)titleUseDateRange
{
  return self->_titleUseDateRange;
}

- (BOOL)tapsZoomsToLastIndividualDensity
{
  return self->_tapsZoomsToLastIndividualDensity;
}

- (BOOL)hideBadgesDuringZoom
{
  return self->_hideBadgesDuringZoom;
}

- (BOOL)enableAddedDateZoomingHeader
{
  return self->_enableAddedDateZoomingHeader;
}

- (double)decadesDensityScale
{
  return self->_decadesDensityScale;
}

- (double)headerSpaceMinimumScreensOfContent
{
  return self->_headerSpaceMinimumScreensOfContent;
}

- (double)shiftingRequiredScreensTopDistance
{
  return self->_shiftingRequiredScreensTopDistance;
}

- (double)zoomingHeaderTintOpacity
{
  return self->_zoomingHeaderTintOpacity;
}

- (int64_t)columnsChoiceIndex
{
  return self->_columnsChoiceIndex;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (double)darkModeInteritemSpacing
{
  return self->_darkModeInteritemSpacing;
}

- (void)setDarkModeInteritemSpacing:(double)a3
{
  self->_darkModeInteritemSpacing = a3;
}

- (double)darkModeCornerRadius
{
  return self->_darkModeCornerRadius;
}

- (void)setDarkModeCornerRadius:(double)a3
{
  self->_darkModeCornerRadius = a3;
}

- (double)panoramaRegularInteritemSpacing
{
  return self->_panoramaRegularInteritemSpacing;
}

- (double)cardsInteritemSpacing
{
  return self->_cardsInteritemSpacing;
}

- (double)cardsCornerRadius
{
  return self->_cardsCornerRadius;
}

- (double)cardsAspectRatio
{
  return self->_cardsAspectRatio;
}

- (int64_t)rubberBandEffect
{
  return self->_rubberBandEffect;
}

- (double)zoomDecelerationRate
{
  return self->_zoomDecelerationRate;
}

- (double)zoomSpringStiffness
{
  return self->_zoomSpringStiffness;
}

- (double)zoomSpringDamping
{
  return self->_zoomSpringDamping;
}

- (double)recenterSpringStiffness
{
  return self->_recenterSpringStiffness;
}

- (double)recenterSpringDamping
{
  return self->_recenterSpringDamping;
}

- (double)pinchSmoothingDuration
{
  return self->_pinchSmoothingDuration;
}

- (double)sliderSmoothingDuration
{
  return self->_sliderSmoothingDuration;
}

- (double)macPinchGestureDampening
{
  return self->_macPinchGestureDampening;
}

- (int64_t)maxColumnsForSingleDate
{
  return self->_maxColumnsForSingleDate;
}

- (BOOL)enableBlurEffect
{
  return self->_enableBlurEffect;
}

- (void)setEnableBlurEffect:(BOOL)a3
{
  self->_enableBlurEffect = a3;
}

- (double)maxBlurRadius
{
  return self->_maxBlurRadius;
}

- (void)setMaxBlurRadius:(double)a3
{
  self->_maxBlurRadius = a3;
}

- (double)blurDimmingStrength
{
  return self->_blurDimmingStrength;
}

- (void)setBlurDimmingStrength:(double)a3
{
  self->_blurDimmingStrength = a3;
}

- (double)unfoldInitialPercentage
{
  return self->_unfoldInitialPercentage;
}

- (void)setUnfoldInitialPercentage:(double)a3
{
  self->_unfoldInitialPercentage = a3;
}

- (double)unfoldVerticalShiftCompensation
{
  return self->_unfoldVerticalShiftCompensation;
}

- (void)setUnfoldVerticalShiftCompensation:(double)a3
{
  self->_unfoldVerticalShiftCompensation = a3;
}

- (double)unfoldEaseOutAmount
{
  return self->_unfoldEaseOutAmount;
}

- (void)setUnfoldEaseOutAmount:(double)a3
{
  self->_unfoldEaseOutAmount = a3;
}

- (BOOL)unfoldDebugLogging
{
  return self->_unfoldDebugLogging;
}

- (void)setUnfoldDebugLogging:(BOOL)a3
{
  self->_unfoldDebugLogging = a3;
}

- (BOOL)enableBlurDebugLayers
{
  return self->_enableBlurDebugLayers;
}

- (void)setEnableBlurDebugLayers:(BOOL)a3
{
  self->_enableBlurDebugLayers = a3;
}

- (int64_t)preheatDenserZoomLevels
{
  return self->_preheatDenserZoomLevels;
}

- (double)alphaDistanceForDirectionChange
{
  return self->_alphaDistanceForDirectionChange;
}

- (double)alphaModeTransitionDuration
{
  return self->_alphaModeTransitionDuration;
}

- (double)alphaCrossfadeMinDuration
{
  return self->_alphaCrossfadeMinDuration;
}

- (double)alphaCrossfadeMaxDuration
{
  return self->_alphaCrossfadeMaxDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

+ (NSArray)validColumns
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validColumns_onceToken != -1)
    dispatch_once(&validColumns_onceToken, block);
  return (NSArray *)(id)validColumns_validColumns;
}

+ (NSArray)columnChoices
{
  if (columnChoices_onceToken != -1)
    dispatch_once(&columnChoices_onceToken, &__block_literal_global_6_25351);
  return (NSArray *)(id)columnChoices_columnChoices;
}

void __41__PXZoomablePhotosSettings_columnChoices__block_invoke()
{
  void *v0;

  v0 = (void *)columnChoices_columnChoices;
  columnChoices_columnChoices = (uint64_t)&unk_1E53E8898;

}

void __40__PXZoomablePhotosSettings_validColumns__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "columnChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke_2;
  v8[3] = &unk_1E511A260;
  v9 = v2;
  v7 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(v7, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)validColumns_validColumns;
  validColumns_validColumns = v5;

}

void __40__PXZoomablePhotosSettings_validColumns__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke_3;
  v3[3] = &unk_1E51348F0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

uint64_t __40__PXZoomablePhotosSettings_validColumns__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
