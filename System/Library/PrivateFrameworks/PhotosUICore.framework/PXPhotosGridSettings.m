@implementation PXPhotosGridSettings

+ (PXPhotosGridSettings)sharedInstance
{
  if (sharedInstance_onceToken_283125 != -1)
    dispatch_once(&sharedInstance_onceToken_283125, &__block_literal_global_283126);
  return (PXPhotosGridSettings *)(id)sharedInstance_sharedInstance_283127;
}

- (BOOL)enableZoomInOutButton
{
  return self->_enableZoomInOutButton;
}

- (BOOL)enableAspectFitButton
{
  return self->_enableAspectFitButton;
}

- (BOOL)enableFilterIndicatorButton
{
  return self->_enableFilterIndicatorButton;
}

- (BOOL)enableFilterDropDownButton
{
  return self->_enableFilterDropDownButton;
}

- (BOOL)enableNewActionMenu
{
  return self->_enableNewActionMenu;
}

- (double)headerGradientHeight
{
  return self->_headerGradientHeight;
}

- (double)headerGradientAlpha
{
  return self->_headerGradientAlpha;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[PXPhotosGridSettings setEnableBlurInContiguousCollections:](self, "setEnableBlurInContiguousCollections:", 1);
  -[PXPhotosGridSettings setMaximumBlurRadius:](self, "setMaximumBlurRadius:", 12.0);
  -[PXPhotosGridSettings setMaximumBlurDimmingFraction:](self, "setMaximumBlurDimmingFraction:", 0.5);
  -[PXPhotosGridSettings setBlurFadeDistance:](self, "setBlurFadeDistance:", 200.0);
  -[PXPhotosGridSettings setMaximumCommonFocus:](self, "setMaximumCommonFocus:", 1.0);
  -[PXPhotosGridSettings setEnableScrollSnapInContiguousCollections:](self, "setEnableScrollSnapInContiguousCollections:", 1);
  -[PXPhotosGridSettings setScrollSnapMaximumDecelerationFactor:](self, "setScrollSnapMaximumDecelerationFactor:", 10.0);
  -[PXPhotosGridSettings setScrollSnapMaximumAccelerationFactor:](self, "setScrollSnapMaximumAccelerationFactor:", 1.2);
  -[PXPhotosGridSettings setEnableShowMoreButtonsInEditorialLens:](self, "setEnableShowMoreButtonsInEditorialLens:", 0);
  -[PXPhotosGridSettings setEnableBlurAndScrollSnapInContiguousGrids:](self, "setEnableBlurAndScrollSnapInContiguousGrids:", 0);
  -[PXPhotosGridSettings setEmulatesEmptyLibrary:](self, "setEmulatesEmptyLibrary:", 0);
  -[PXPhotosGridSettings setDefaultAnimationDuration:](self, "setDefaultAnimationDuration:", 0.4);
  -[PXPhotosGridSettings setMatchMoveAnimationDuration:](self, "setMatchMoveAnimationDuration:", 0.75);
  -[PXPhotosGridSettings setEnableInCMM:](self, "setEnableInCMM:", 0);
  -[PXPhotosGridSettings setEnablePreviewKeyAssetFetching:](self, "setEnablePreviewKeyAssetFetching:", 1);
  -[PXPhotosGridSettings setEnableSuperzoom:](self, "setEnableSuperzoom:", 1);
  -[PXPhotosGridSettings setEnableInvisibleNavBars:](self, "setEnableInvisibleNavBars:", 1);
  -[PXPhotosGridSettings setEnableSortAction:](self, "setEnableSortAction:", 1);
  -[PXPhotosGridSettings setEnableAspectFitToggle:](self, "setEnableAspectFitToggle:", 1);
  -[PXPhotosGridSettings setEnableAspectFitButton:](self, "setEnableAspectFitButton:", 1);
  -[PXPhotosGridSettings setEnableZoomInOutButton:](self, "setEnableZoomInOutButton:", 0);
  -[PXPhotosGridSettings setEnableContentFiltering:](self, "setEnableContentFiltering:", 1);
  -[PXPhotosGridSettings setAlwaysShowFilterIndicatorButton:](self, "setAlwaysShowFilterIndicatorButton:", 0);
  -[PXPhotosGridSettings setEnableMultiSelectMenu:](self, "setEnableMultiSelectMenu:", 1);
  -[PXPhotosGridSettings setEnableNewActionMenu:](self, "setEnableNewActionMenu:", 1);
  -[PXPhotosGridSettings setEnableFilterIndicatorButton:](self, "setEnableFilterIndicatorButton:", 1);
  -[PXPhotosGridSettings setEnableFilterDropDownButton:](self, "setEnableFilterDropDownButton:", 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridSettings setEnableFilterViewControllerAnchoringToSender:](self, "setEnableFilterViewControllerAnchoringToSender:", objc_msgSend(v3, "userInterfaceIdiom") == 1);

  -[PXPhotosGridSettings setEnableDetailsMenuAction:](self, "setEnableDetailsMenuAction:", 0);
  -[PXPhotosGridSettings setExposeMoviePresentationAction:](self, "setExposeMoviePresentationAction:", 0);
  -[PXPhotosGridSettings setEnableTitleLegibilityDimmingFilter:](self, "setEnableTitleLegibilityDimmingFilter:", 0);
  -[PXPhotosGridSettings setBackdropStyleForPlacesAndImports:](self, "setBackdropStyleForPlacesAndImports:", 1);
  -[PXPhotosGridSettings setColorNavbarArea:](self, "setColorNavbarArea:", 0);
  -[PXPhotosGridSettings setHeaderTitleTopSpacing:](self, "setHeaderTitleTopSpacing:", 2.0);
  -[PXPhotosGridSettings setHeaderTitleBottomSpacing:](self, "setHeaderTitleBottomSpacing:", 12.0);
  -[PXPhotosGridSettings setUseGradientSectionHeaders:](self, "setUseGradientSectionHeaders:", 1);
  -[PXPhotosGridSettings setSectionHeaderGradientOverhang:](self, "setSectionHeaderGradientOverhang:", 60.0);
  -[PXPhotosGridSettings setSectionHeaderGradientAlpha:](self, "setSectionHeaderGradientAlpha:", 0.45);
  -[PXPhotosGridSettings setShowLivePhotoFilter:](self, "setShowLivePhotoFilter:", 0);
  -[PXPhotosGridSettings setShowPortraitFilter:](self, "setShowPortraitFilter:", 0);
  -[PXPhotosGridSettings setHeaderGradientHeight:](self, "setHeaderGradientHeight:", 150.0);
  -[PXPhotosGridSettings setHeaderGradientAlpha:](self, "setHeaderGradientAlpha:", 0.5);
  -[PXPhotosGridSettings setBehindContentBackgroundGradientAlpha:](self, "setBehindContentBackgroundGradientAlpha:", 0.25);
  -[PXPhotosGridSettings setSearchActionLocationOnPhone:](self, "setSearchActionLocationOnPhone:", 2);
  -[PXPhotosGridSettings setActionMenuGlyphName:](self, "setActionMenuGlyphName:", CFSTR("ellipsis.circle"));
  -[PXPhotosGridSettings setShowCollectionKindInPreviewHeaderToggleAction:](self, "setShowCollectionKindInPreviewHeaderToggleAction:", 0);
  -[PXPhotosGridSettings setShouldCurateEditorialLens:](self, "setShouldCurateEditorialLens:", 1);
  -[PXPhotosGridSettings setGridBadgesOnlyShowGlyph:](self, "setGridBadgesOnlyShowGlyph:", 0);
  -[PXPhotosGridSettings setGridBadgesPortraitEnabled:](self, "setGridBadgesPortraitEnabled:", 0);
  -[PXPhotosGridSettings setGridBadgesForAllMediaTypes:](self, "setGridBadgesForAllMediaTypes:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PXPhotosGridEnableStacksReviewUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  -[PXPhotosGridSettings setEnableStacksReviewUI:](self, "setEnableStacksReviewUI:", v6);

}

- (void)setUseGradientSectionHeaders:(BOOL)a3
{
  self->_useGradientSectionHeaders = a3;
}

- (void)setShouldCurateEditorialLens:(BOOL)a3
{
  self->_shouldCurateEditorialLens = a3;
}

- (void)setSectionHeaderGradientOverhang:(double)a3
{
  self->_sectionHeaderGradientOverhang = a3;
}

- (void)setSectionHeaderGradientAlpha:(double)a3
{
  self->_sectionHeaderGradientAlpha = a3;
}

- (void)setScrollSnapMaximumDecelerationFactor:(double)a3
{
  self->_scrollSnapMaximumDecelerationFactor = a3;
}

- (void)setScrollSnapMaximumAccelerationFactor:(double)a3
{
  self->_scrollSnapMaximumAccelerationFactor = a3;
}

- (void)setMaximumCommonFocus:(double)a3
{
  self->_maximumCommonFocus = a3;
}

- (void)setMaximumBlurRadius:(double)a3
{
  self->_maximumBlurRadius = a3;
}

- (void)setMaximumBlurDimmingFraction:(double)a3
{
  self->_maximumBlurDimmingFraction = a3;
}

- (void)setMatchMoveAnimationDuration:(double)a3
{
  self->_matchMoveAnimationDuration = a3;
}

- (void)setHeaderTitleTopSpacing:(double)a3
{
  self->_headerTitleTopSpacing = a3;
}

- (void)setHeaderTitleBottomSpacing:(double)a3
{
  self->_headerTitleBottomSpacing = a3;
}

- (void)setHeaderGradientHeight:(double)a3
{
  self->_headerGradientHeight = a3;
}

- (void)setHeaderGradientAlpha:(double)a3
{
  self->_headerGradientAlpha = a3;
}

- (void)setGridBadgesPortraitEnabled:(BOOL)a3
{
  self->_gridBadgesPortraitEnabled = a3;
}

- (void)setGridBadgesOnlyShowGlyph:(BOOL)a3
{
  self->_gridBadgesOnlyShowGlyph = a3;
}

- (void)setGridBadgesForAllMediaTypes:(BOOL)a3
{
  self->_gridBadgesForAllMediaTypes = a3;
}

- (void)setEnableZoomInOutButton:(BOOL)a3
{
  self->_enableZoomInOutButton = a3;
}

- (void)setEnableTitleLegibilityDimmingFilter:(BOOL)a3
{
  self->_enableTitleLegibilityDimmingFilter = a3;
}

- (void)setEnableSuperzoom:(BOOL)a3
{
  self->_enableSuperzoom = a3;
}

- (void)setEnableSortAction:(BOOL)a3
{
  self->_enableSortAction = a3;
}

- (void)setEnableShowMoreButtonsInEditorialLens:(BOOL)a3
{
  self->_enableShowMoreButtonsInEditorialLens = a3;
}

- (void)setEnableScrollSnapInContiguousCollections:(BOOL)a3
{
  self->_enableScrollSnapInContiguousCollections = a3;
}

- (void)setEnableNewActionMenu:(BOOL)a3
{
  self->_enableNewActionMenu = a3;
}

- (void)setEnableMultiSelectMenu:(BOOL)a3
{
  self->_enableMultiSelectMenu = a3;
}

- (void)setEnableInvisibleNavBars:(BOOL)a3
{
  self->_enableInvisibleNavBars = a3;
}

- (void)setEnableInCMM:(BOOL)a3
{
  self->_enableInCMM = a3;
}

- (void)setEnableFilterViewControllerAnchoringToSender:(BOOL)a3
{
  self->_enableFilterViewControllerAnchoringToSender = a3;
}

- (void)setEnableFilterIndicatorButton:(BOOL)a3
{
  self->_enableFilterIndicatorButton = a3;
}

- (void)setEnableFilterDropDownButton:(BOOL)a3
{
  self->_enableFilterDropDownButton = a3;
}

- (void)setEnableDetailsMenuAction:(BOOL)a3
{
  self->_enableDetailsMenuAction = a3;
}

- (void)setEnableContentFiltering:(BOOL)a3
{
  self->_enableContentFiltering = a3;
}

- (void)setEnableBlurInContiguousCollections:(BOOL)a3
{
  self->_enableBlurInContiguousCollections = a3;
}

- (void)setEnableBlurAndScrollSnapInContiguousGrids:(BOOL)a3
{
  self->_enableBlurAndScrollSnapInContiguousGrids = a3;
}

- (void)setEnableAspectFitToggle:(BOOL)a3
{
  self->_enableAspectFitToggle = a3;
}

- (void)setEnableAspectFitButton:(BOOL)a3
{
  self->_enableAspectFitButton = a3;
}

- (void)setEmulatesEmptyLibrary:(BOOL)a3
{
  self->_emulatesEmptyLibrary = a3;
}

- (void)setDefaultAnimationDuration:(double)a3
{
  self->_defaultAnimationDuration = a3;
}

- (void)setColorNavbarArea:(BOOL)a3
{
  self->_colorNavbarArea = a3;
}

- (void)setBlurFadeDistance:(double)a3
{
  self->_blurFadeDistance = a3;
}

- (void)setBehindContentBackgroundGradientAlpha:(double)a3
{
  self->_behindContentBackgroundGradientAlpha = a3;
}

- (void)setBackdropStyleForPlacesAndImports:(BOOL)a3
{
  self->_backdropStyleForPlacesAndImports = a3;
}

- (void)setAlwaysShowFilterIndicatorButton:(BOOL)a3
{
  self->_alwaysShowFilterIndicatorButton = a3;
}

- (void)setActionMenuGlyphName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

void __38__PXPhotosGridSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosGridSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_283127;
  sharedInstance_sharedInstance_283127 = v0;

}

- (double)defaultAnimationDuration
{
  return self->_defaultAnimationDuration;
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
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  _QWORD v221[11];
  void *v222;
  _QWORD v223[3];
  _QWORD v224[2];
  _QWORD v225[16];
  void *v226;
  _QWORD v227[2];
  _QWORD v228[2];
  _QWORD v229[11];
  _QWORD v230[10];
  _QWORD v231[3];

  v231[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldCurateEditorialLens);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Curate Editorial"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v231[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v231, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v6, CFSTR("View Modes"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  v218 = (void *)MEMORY[0x1E0D83078];
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBlurInContiguousCollections);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Blur"), v215);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v230[0] = v210;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumBlurRadius);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), v207);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "minValue:maxValue:", 0.0, 20.0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "px_increment:", 1.0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v230[1] = v196;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumBlurDimmingFraction);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Dimming"), v193);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "minValue:maxValue:", 0.0, 1.0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "px_increment:", 0.1);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v230[2] = v184;
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blurFadeDistance);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Fade Distance"), v181);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "minValue:maxValue:", 0.0, 400.0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "px_increment:", 10.0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v230[3] = v172;
  v11 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumCommonFocus);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Fade Overlap"), v169);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "minValue:maxValue:", 0.0, 1.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "px_increment:", 0.01);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v230[4] = v160;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableScrollSnapInContiguousCollections);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Snap"), v157);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v230[5] = v154;
  v13 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scrollSnapMaximumDecelerationFactor);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Max Deceleration"), v151);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "minValue:maxValue:", 1.0, 10.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "px_increment:", 0.1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v230[6] = v14;
  v15 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scrollSnapMaximumAccelerationFactor);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Max Acceleration"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 1.0, 10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "px_increment:", 0.1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v230[7] = v19;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableShowMoreButtonsInEditorialLens);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Show More Buttons"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v230[8] = v22;
  v23 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBlurAndScrollSnapInContiguousGrids);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Blur & Snap in Grids"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v230[9] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v230, 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "sectionWithRows:title:", v26, CFSTR("Contiguous Collections"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  v216 = (void *)MEMORY[0x1E0D83078];
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_headerGradientHeight);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Header Gradient Height"), v211);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "minValue:maxValue:", 0.0, 350.0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "px_increment:", 1.0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v229[0] = v201;
  v28 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_headerGradientAlpha);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Header Gradient Alpha"), v197);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "minValue:maxValue:", 0.0, 1.0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "px_increment:", 0.0500000007);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v229[1] = v188;
  v29 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_behindContentBackgroundGradientAlpha);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Behind Content Header Gradient Alpha"), v185);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "minValue:maxValue:", 0.0, 1.0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "px_increment:", 0.0500000007);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v229[2] = v176;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableTitleLegibilityDimmingFilter);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Title Legibility Dimming Filter"), v173);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v229[3] = v170;
  v31 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_colorNavbarArea);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Color NavBar area"), v167);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v229[4] = v164;
  v32 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_backdropStyleForPlacesAndImports);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Header backdrop (places/imports)"), v161);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v229[5] = v158;
  v33 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_headerTitleTopSpacing);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Header title top spacing"), v155);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "minValue:maxValue:", -20.0, 20.0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "px_increment:", 1.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v229[6] = v146;
  v34 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_headerTitleBottomSpacing);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Header title bottom spacing"), v143);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "minValue:maxValue:", 0.0, 20.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "px_increment:", 1.0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v229[7] = v137;
  v35 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useGradientSectionHeaders);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Gradient section headers"), v135);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v229[8] = v133;
  v36 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_sectionHeaderGradientOverhang);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Section header overhang"), v131);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 150.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "px_increment:", 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "conditionFormat:", CFSTR("useGradientSectionHeaders != 0"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v229[9] = v40;
  v41 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_sectionHeaderGradientAlpha);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Gradient Alpha"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "minValue:maxValue:", 0.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "px_increment:", 0.05);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "conditionFormat:", CFSTR("useGradientSectionHeaders != 0"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v229[10] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v229, 11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "sectionWithRows:title:", v47, CFSTR("Title Styles"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83078];
  v49 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInCMM);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("CMM"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = v51;
  v52 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enablePreviewKeyAssetFetching);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Preview Key Asset Fetching"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v228[1] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v228, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sectionWithRows:title:", v55, CFSTR("Enablement"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83078];
  v57 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showLivePhotoFilter);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:valueKeyPath:", CFSTR("Show Live-Photo Filter"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v227[0] = v59;
  v60 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPortraitFilter);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rowWithTitle:valueKeyPath:", CFSTR("Show Portrait Filter"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v227[1] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v227, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sectionWithRows:title:", v63, CFSTR("Filtering"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)MEMORY[0x1E0D83078];
  v65 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_emulatesEmptyLibrary);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("Emulates Empty Library"), v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v226, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sectionWithRows:title:", v68, CFSTR("Demo"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = (void *)MEMORY[0x1E0D83078];
  v69 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(a1, "_enableTungstenNewFeaturesAction");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:action:", CFSTR("Enable New Features"), v202);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_enableTungstenNewFeaturesActionPredicate");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "condition:", v195);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v225[0] = v192;
  v70 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableSuperzoom);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:valueKeyPath:", CFSTR("Superzoom"), v189);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v225[1] = v186;
  v71 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableMultiSelectMenu);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:valueKeyPath:", CFSTR("Multi-Select Menu"), v183);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v225[2] = v180;
  v72 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableNewActionMenu);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Enable New Action Menu"), v177);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v225[3] = v174;
  v73 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableInvisibleNavBars);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Enable New Transparent Style"), v171);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v225[4] = v168;
  v74 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableSortAction);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:valueKeyPath:", CFSTR("Enable Sort Action"), v162);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v225[5] = v159;
  v75 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableContentFiltering);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:valueKeyPath:", CFSTR("Enable Filter Action"), v156);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v225[6] = v153;
  v76 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAspectFitToggle);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "rowWithTitle:valueKeyPath:", CFSTR("Enable Aspect Toggle Action"), v150);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v225[7] = v147;
  v77 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAspectFitButton);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:valueKeyPath:", CFSTR("Enable Aspect Toggle Button"), v144);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v225[8] = v142;
  v78 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableZoomInOutButton);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Enable Zoom In/Out Button"), v140);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v225[9] = v138;
  v79 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDetailsMenuAction);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "rowWithTitle:valueKeyPath:", CFSTR("Enable \"Play Memory Video\" Action"), v136);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v225[10] = v134;
  v80 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_exposeMoviePresentationAction);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:valueKeyPath:", CFSTR("Expose Movie Presentation Action"), v132);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v225[11] = v81;
  v82 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFilterDropDownButton);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "rowWithTitle:valueKeyPath:", CFSTR("Enable Filter Dropdown Button"), v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v225[12] = v84;
  v85 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFilterIndicatorButton);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rowWithTitle:valueKeyPath:", CFSTR("Enable Filter Indicator Button"), v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v225[13] = v87;
  v88 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysShowFilterIndicatorButton);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rowWithTitle:valueKeyPath:", CFSTR("Always Show Filter Indicator Button"), v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v225[14] = v90;
  v91 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFilterViewControllerAnchoringToSender);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "rowWithTitle:valueKeyPath:", CFSTR("Enable Filter UI Anchor To Button"), v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v225[15] = v93;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v225, 16);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "sectionWithRows:title:", v94, CFSTR("New features"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = (void *)MEMORY[0x1E0D83078];
  v96 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultAnimationDuration);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rowWithTitle:valueKeyPath:", CFSTR("Default Duration"), v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "minValue:maxValue:", 0.0, 2.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "px_increment:", 0.05);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = v100;
  v101 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_matchMoveAnimationDuration);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Match Move Duration"), v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "minValue:maxValue:", 0.0, 2.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "px_increment:", 0.05);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v224[1] = v105;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "sectionWithRows:title:", v106, CFSTR("Animations"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = (void *)MEMORY[0x1E0D83078];
  v108 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_searchActionLocationOnPhone);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "rowWithTitle:valueKeyPath:", CFSTR("Search on Phone"), v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "px_possibleValues:formatter:", &unk_1E53E85E0, &__block_literal_global_309);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v223[0] = v111;
  v112 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_actionMenuGlyphName);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rowWithTitle:valueKeyPath:", CFSTR("Action Menu"), v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "possibleValues:titles:", &unk_1E53E85C8, &unk_1E53E85C8);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v223[1] = v115;
  v116 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showCollectionKindInPreviewHeaderToggleAction);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "rowWithTitle:valueKeyPath:", CFSTR("Collection Kind in Preview Header Toggle Action"), v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v223[2] = v118;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v223, 3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "sectionWithRows:title:", v119, CFSTR("Actions"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = (void *)MEMORY[0x1E0D83078];
  v121 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableStacksReviewUI);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "rowWithTitle:valueKeyPath:", CFSTR("Enable"), v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v222, 1);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "sectionWithRows:title:", v124, CFSTR("Stacks Review UI"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)MEMORY[0x1E0D83078];
  v221[0] = v220;
  v221[1] = v219;
  v221[2] = v217;
  v221[3] = v212;
  v221[4] = v209;
  v221[5] = v206;
  v221[6] = v214;
  v221[7] = v203;
  v221[8] = v199;
  v221[9] = v125;
  v221[10] = v126;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v221, 11);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "moduleWithTitle:contents:", CFSTR("Photos Grids"), v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  return v129;
}

+ (id)_enableTungstenNewFeaturesAction
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXPhotosGridSettings_UI___enableTungstenNewFeaturesAction__block_invoke;
  v3[3] = &__block_descriptor_48_e33_B24__0_8__PTUIModuleController_16l;
  v3[4] = a2;
  v3[5] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_enableTungstenNewFeaturesActionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("enableSuperzoom == NO || enableNewActionMenu == NO || enableInvisibleNavBars == NO || enableSortAction == NO || enableContentFiltering == NO || enableAspectFitToggle == NO || enableAspectFitButton == NO || enableZoomInOutButton == YES || enableFilterDropDownButton == YES || enableFilterIndicatorButton == YES"));
}

uint64_t __60__PXPhotosGridSettings_UI___enableTungstenNewFeaturesAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("PXPhotosGridSettings+UI.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("moduleController.settings"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXPhotosGridSettings+UI.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("moduleController.settings"), v10, v14);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v4, "setEnableSuperzoom:", 1);
  objc_msgSend(v4, "setEnableNewActionMenu:", 1);
  objc_msgSend(v4, "setEnableInvisibleNavBars:", 1);
  objc_msgSend(v4, "setEnableSortAction:", 1);
  objc_msgSend(v4, "setEnableContentFiltering:", 1);
  objc_msgSend(v4, "setEnableAspectFitToggle:", 1);
  objc_msgSend(v4, "setEnableAspectFitButton:", 1);
  objc_msgSend(v4, "setEnableZoomInOutButton:", 0);
  objc_msgSend(v4, "setEnableFilterDropDownButton:", 0);
  objc_msgSend(v4, "setEnableFilterIndicatorButton:", 1);

  return 1;
}

const __CFString *__52__PXPhotosGridSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  const __CFString *v3;

  v2 = objc_msgSend(a2, "integerValue");
  v3 = CFSTR("None");
  if (v2 == 1)
    v3 = CFSTR("Bar Button");
  if (v2 == 2)
    return CFSTR("Menu Item");
  else
    return v3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)enableBlurInContiguousCollections
{
  return self->_enableBlurInContiguousCollections;
}

- (double)maximumBlurRadius
{
  return self->_maximumBlurRadius;
}

- (double)maximumBlurDimmingFraction
{
  return self->_maximumBlurDimmingFraction;
}

- (double)blurFadeDistance
{
  return self->_blurFadeDistance;
}

- (double)maximumCommonFocus
{
  return self->_maximumCommonFocus;
}

- (BOOL)enableScrollSnapInContiguousCollections
{
  return self->_enableScrollSnapInContiguousCollections;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (BOOL)enableShowMoreButtonsInEditorialLens
{
  return self->_enableShowMoreButtonsInEditorialLens;
}

- (BOOL)enableBlurAndScrollSnapInContiguousGrids
{
  return self->_enableBlurAndScrollSnapInContiguousGrids;
}

- (BOOL)emulatesEmptyLibrary
{
  return self->_emulatesEmptyLibrary;
}

- (double)matchMoveAnimationDuration
{
  return self->_matchMoveAnimationDuration;
}

- (BOOL)enableInCMM
{
  return self->_enableInCMM;
}

- (BOOL)enableSuperzoom
{
  return self->_enableSuperzoom;
}

- (BOOL)enablePreviewKeyAssetFetching
{
  return self->_enablePreviewKeyAssetFetching;
}

- (void)setEnablePreviewKeyAssetFetching:(BOOL)a3
{
  self->_enablePreviewKeyAssetFetching = a3;
}

- (BOOL)enableInvisibleNavBars
{
  return self->_enableInvisibleNavBars;
}

- (BOOL)enableSortAction
{
  return self->_enableSortAction;
}

- (BOOL)enableMultiSelectMenu
{
  return self->_enableMultiSelectMenu;
}

- (BOOL)enableContentFiltering
{
  return self->_enableContentFiltering;
}

- (BOOL)enableAspectFitToggle
{
  return self->_enableAspectFitToggle;
}

- (BOOL)enableDetailsMenuAction
{
  return self->_enableDetailsMenuAction;
}

- (BOOL)exposeMoviePresentationAction
{
  return self->_exposeMoviePresentationAction;
}

- (void)setExposeMoviePresentationAction:(BOOL)a3
{
  self->_exposeMoviePresentationAction = a3;
}

- (BOOL)alwaysShowFilterIndicatorButton
{
  return self->_alwaysShowFilterIndicatorButton;
}

- (BOOL)enableFilterViewControllerAnchoringToSender
{
  return self->_enableFilterViewControllerAnchoringToSender;
}

- (BOOL)enableTitleLegibilityDimmingFilter
{
  return self->_enableTitleLegibilityDimmingFilter;
}

- (BOOL)backdropStyleForPlacesAndImports
{
  return self->_backdropStyleForPlacesAndImports;
}

- (BOOL)colorNavbarArea
{
  return self->_colorNavbarArea;
}

- (double)headerTitleTopSpacing
{
  return self->_headerTitleTopSpacing;
}

- (double)headerTitleBottomSpacing
{
  return self->_headerTitleBottomSpacing;
}

- (BOOL)useGradientSectionHeaders
{
  return self->_useGradientSectionHeaders;
}

- (double)sectionHeaderGradientOverhang
{
  return self->_sectionHeaderGradientOverhang;
}

- (double)sectionHeaderGradientAlpha
{
  return self->_sectionHeaderGradientAlpha;
}

- (double)behindContentBackgroundGradientAlpha
{
  return self->_behindContentBackgroundGradientAlpha;
}

- (BOOL)showLivePhotoFilter
{
  return self->_showLivePhotoFilter;
}

- (void)setShowLivePhotoFilter:(BOOL)a3
{
  self->_showLivePhotoFilter = a3;
}

- (BOOL)showPortraitFilter
{
  return self->_showPortraitFilter;
}

- (void)setShowPortraitFilter:(BOOL)a3
{
  self->_showPortraitFilter = a3;
}

- (int64_t)searchActionLocationOnPhone
{
  return self->_searchActionLocationOnPhone;
}

- (void)setSearchActionLocationOnPhone:(int64_t)a3
{
  self->_searchActionLocationOnPhone = a3;
}

- (NSString)actionMenuGlyphName
{
  return self->_actionMenuGlyphName;
}

- (BOOL)showCollectionKindInPreviewHeaderToggleAction
{
  return self->_showCollectionKindInPreviewHeaderToggleAction;
}

- (void)setShowCollectionKindInPreviewHeaderToggleAction:(BOOL)a3
{
  self->_showCollectionKindInPreviewHeaderToggleAction = a3;
}

- (BOOL)shouldCurateEditorialLens
{
  return self->_shouldCurateEditorialLens;
}

- (BOOL)gridBadgesOnlyShowGlyph
{
  return self->_gridBadgesOnlyShowGlyph;
}

- (BOOL)gridBadgesPortraitEnabled
{
  return self->_gridBadgesPortraitEnabled;
}

- (BOOL)gridBadgesForAllMediaTypes
{
  return self->_gridBadgesForAllMediaTypes;
}

- (BOOL)enableStacksReviewUI
{
  return self->_enableStacksReviewUI;
}

- (void)setEnableStacksReviewUI:(BOOL)a3
{
  self->_enableStacksReviewUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuGlyphName, 0);
}

@end
