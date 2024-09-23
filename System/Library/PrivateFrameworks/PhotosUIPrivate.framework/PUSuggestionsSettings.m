@implementation PUSuggestionsSettings

- (void)createChildren
{
  PUWallpaperShortcutsPlaygroundSettings *v3;
  PUWallpaperShortcutsPlaygroundSettings *shortcutsPlaygroundSettings;

  v3 = -[PTSettings initWithDefaultValues]([PUWallpaperShortcutsPlaygroundSettings alloc], "initWithDefaultValues");
  shortcutsPlaygroundSettings = self->_shortcutsPlaygroundSettings;
  self->_shortcutsPlaygroundSettings = v3;

}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSuggestionsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUSuggestionsSettings setViewMode:](self, "setViewMode:", 0);
  -[PUSuggestionsSettings setSourceMode:](self, "setSourceMode:", 0);
  -[PUSuggestionsSettings setIncludeDebugLayers:](self, "setIncludeDebugLayers:", MEMORY[0x1AF429AF0](-[PUSuggestionsSettings setParallaxAmount:](self, "setParallaxAmount:", 30.0)));
  -[PUSuggestionsSettings setDebugRoundTripLayerStack:](self, "setDebugRoundTripLayerStack:", 0);
  -[PUSuggestionsSettings setDebugBackfillCompositing:](self, "setDebugBackfillCompositing:", 0);
  -[PUSuggestionsSettings setDebugDisableFrameUpdates:](self, "setDebugDisableFrameUpdates:", 0);
  -[PUSuggestionsSettings setEnableFRCInAssetDetails:](self, "setEnableFRCInAssetDetails:", 0);
  -[PUSuggestionsSettings setPrimarySort:](self, "setPrimarySort:", 4);
  -[PUSuggestionsSettings setSecondarySort:](self, "setSecondarySort:", 0);
  -[PUSuggestionsSettings setLivePhotoTabFetchLimit:](self, "setLivePhotoTabFetchLimit:", *MEMORY[0x1E0D78170]);
}

- (void)setViewMode:(int64_t)a3
{
  self->_viewMode = a3;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (void)setSecondarySort:(int64_t)a3
{
  self->_secondarySort = a3;
}

- (void)setPrimarySort:(int64_t)a3
{
  self->_primarySort = a3;
}

- (void)setParallaxAmount:(double)a3
{
  self->_parallaxAmount = a3;
}

- (void)setLivePhotoTabFetchLimit:(unint64_t)a3
{
  self->_livePhotoTabFetchLimit = a3;
}

- (void)setIncludeDebugLayers:(BOOL)a3
{
  self->_includeDebugLayers = a3;
}

- (void)setEnableFRCInAssetDetails:(BOOL)a3
{
  self->_enableFRCInAssetDetails = a3;
}

- (void)setDebugRoundTripLayerStack:(BOOL)a3
{
  self->_debugRoundTripLayerStack = a3;
}

- (void)setDebugDisableFrameUpdates:(BOOL)a3
{
  self->_debugDisableFrameUpdates = a3;
}

- (void)setDebugBackfillCompositing:(BOOL)a3
{
  self->_debugBackfillCompositing = a3;
}

+ (id)settingsControllerModule
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
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
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
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
  id v129;
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
  id v144;
  void *v145;
  _QWORD v147[4];
  id v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[4];
  id v152;
  _QWORD v153[4];
  id v154;
  _QWORD v155[4];
  id v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  _QWORD v168[4];
  id v169;
  _QWORD v170[5];
  void *v171;
  _QWORD v172[14];
  _QWORD v173[4];
  _QWORD v174[4];
  _QWORD v175[4];
  _QWORD v176[4];
  _QWORD v177[7];

  v177[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Top People Suggestion Generation"), &__block_literal_global_90793);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Wallpaper Nightly Suggestions"), &__block_literal_global_168);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Portrait Wallpaper Candidates"), &__block_literal_global_174_90796);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Cold Start Photos"), &__block_literal_global_179_90798);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Cold Start Photos (Device Owner)"), &__block_literal_global_182_90800);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83078];
  v137 = (void *)v4;
  v138 = (void *)v3;
  v177[0] = v3;
  v177[1] = v4;
  v135 = (void *)v6;
  v136 = (void *)v5;
  v177[2] = v5;
  v177[3] = v6;
  v134 = (void *)v7;
  v177[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("Wallpaper Generation"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Wallpaper Category Inspector"), &__block_literal_global_189_90803);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v11;
  v12 = (void *)MEMORY[0x1E0D83010];
  v13 = MEMORY[0x1E0C809B0];
  v168[0] = MEMORY[0x1E0C809B0];
  v168[1] = 3221225472;
  v168[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7;
  v168[3] = &unk_1E58A8568;
  v14 = v2;
  v169 = v14;
  objc_msgSend(v12, "pu_rowWithTitle:action:", CFSTR("Smart Album People Inspector"), v168);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v15;
  v16 = (void *)MEMORY[0x1E0D83010];
  v166[0] = v13;
  v166[1] = 3221225472;
  v166[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8;
  v166[3] = &unk_1E58A8568;
  v17 = v14;
  v167 = v17;
  objc_msgSend(v16, "pu_rowWithTitle:action:", CFSTR("Gallery Featured Photo"), v166);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v18;
  v19 = (void *)MEMORY[0x1E0D83010];
  v164[0] = v13;
  v164[1] = 3221225472;
  v164[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9;
  v164[3] = &unk_1E58A8568;
  v20 = v17;
  v165 = v20;
  objc_msgSend(v19, "pu_rowWithTitle:action:", CFSTR("Gallery Smart Album"), v164);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v22, CFSTR("Wallpaper Inspector"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = (void *)MEMORY[0x1E0D83078];
  v23 = (void *)MEMORY[0x1E0D83010];
  v161[0] = v13;
  v161[1] = 3221225472;
  v161[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_223;
  v161[3] = &unk_1E58A8590;
  v144 = v20;
  v162 = v144;
  v163 = a1;
  objc_msgSend(v23, "pu_rowWithTitle:action:", CFSTR("Picker Playground"), v161);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v142;
  v24 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_primarySort);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Primary Sort"), v139);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "possibleValues:titles:", &unk_1E59BA870, &unk_1E59BA888);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v175[1] = v26;
  v27 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_secondarySort);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Secondary Sort"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "possibleValues:titles:", &unk_1E59BA870, &unk_1E59BA888);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v175[2] = v30;
  v31 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_livePhotoTabFetchLimit);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Fetch Limit"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 50.0, 200.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pu_increment:", 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v175[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "sectionWithRows:title:", v36, CFSTR("Picker Live Photo Tab Playground"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83078];
  v38 = (void *)MEMORY[0x1E0D83010];
  v39 = MEMORY[0x1E0C809B0];
  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2_243;
  v159[3] = &unk_1E58A8568;
  v40 = v144;
  v160 = v40;
  objc_msgSend(v38, "pu_rowWithTitle:action:", CFSTR("Combined"), v159);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v41;
  v42 = (void *)MEMORY[0x1E0D83010];
  v157[0] = v39;
  v157[1] = 3221225472;
  v157[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3_246;
  v157[3] = &unk_1E58A8568;
  v43 = v40;
  v158 = v43;
  objc_msgSend(v42, "pu_rowWithTitle:action:", CFSTR("Highlight Pass FRC"), v157);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v44;
  v45 = (void *)MEMORY[0x1E0D83010];
  v155[0] = v39;
  v155[1] = 3221225472;
  v155[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4_249;
  v155[3] = &unk_1E58A8568;
  v46 = v43;
  v156 = v46;
  objc_msgSend(v45, "pu_rowWithTitle:action:", CFSTR("Highlight Candidates"), v155);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v174[2] = v47;
  v48 = (void *)MEMORY[0x1E0D83010];
  v153[0] = v39;
  v153[1] = 3221225472;
  v153[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5_252;
  v153[3] = &unk_1E58A8568;
  v49 = v46;
  v154 = v49;
  objc_msgSend(v48, "pu_rowWithTitle:action:", CFSTR("Live Photo Suggestions Only"), v153);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v174[3] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sectionWithRows:title:", v51, CFSTR("Picker Live Photo Tab Curation"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D83078];
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFRCInAssetDetails);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Enable FRC in Asset Details"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v55;
  v56 = (void *)MEMORY[0x1E0D83010];
  v151[0] = v39;
  v151[1] = 3221225472;
  v151[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6_262;
  v151[3] = &unk_1E58A8568;
  v57 = v49;
  v152 = v57;
  objc_msgSend(v56, "pu_rowWithTitle:action:", CFSTR("Settling Effect Score"), v151);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v58;
  v59 = (void *)MEMORY[0x1E0D83010];
  v149[0] = v39;
  v149[1] = 3221225472;
  v149[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7_265;
  v149[3] = &unk_1E58A8568;
  v60 = v57;
  v150 = v60;
  objc_msgSend(v59, "pu_rowWithTitle:action:", CFSTR("Autoplay Suggestion Score"), v149);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v173[2] = v61;
  v62 = (void *)MEMORY[0x1E0D83010];
  v147[0] = v39;
  v147[1] = 3221225472;
  v147[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8_268;
  v147[3] = &unk_1E58A8568;
  v129 = v60;
  v148 = v129;
  objc_msgSend(v62, "pu_rowWithTitle:action:", CFSTR("Settling Effect Suggestions"), v147);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v173[3] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:title:", v64, CFSTR("Settling Effect"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = (void *)MEMORY[0x1E0D83078];
  v65 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_viewMode);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("View Mode"), v128);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "possibleValues:titles:", &unk_1E59BA8A0, &unk_1E59BA8B8);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v126;
  v66 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_sourceMode);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Source Mode"), v125);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "possibleValues:titles:", &unk_1E59BA8D0, &unk_1E59BA8E8);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v172[1] = v123;
  v67 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_infillMode);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Infill Mode"), v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "possibleValues:titles:", &unk_1E59BA900, &unk_1E59BA918);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v172[2] = v120;
  v68 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableSegmentation);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:valueKeyPath:", CFSTR("Disable Segmentation"), v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v172[3] = v118;
  v69 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableSegmentationCache);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:valueKeyPath:", CFSTR("Disable Segmentation Cache"), v117);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v172[4] = v116;
  v70 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_parallaxAmount);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:valueKeyPath:", CFSTR("Parallax Amount"), v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "minValue:maxValue:", 0.0, 100.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v172[5] = v113;
  v71 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_manualGatingLenience);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:valueKeyPath:", CFSTR("Manual Gating Lenience"), v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "minValue:maxValue:", 0.0, 1.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v172[6] = v110;
  v72 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeDebugLayers);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Include Debug Layers"), v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v172[7] = v108;
  v73 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugRoundTripLayerStack);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Debug Round Trip Layers"), v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v172[8] = v106;
  v74 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugTintLayers);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:valueKeyPath:", CFSTR("Debug Tint Layers"), v105);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v172[9] = v104;
  v75 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugBackfillCompositing);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:valueKeyPath:", CFSTR("Debug Backfill Compositing"), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v172[10] = v77;
  v78 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_debugDisableFrameUpdates);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Debug Disable Frame Updates"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v172[11] = v80;
  v81 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCustomStyles);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "rowWithTitle:valueKeyPath:", CFSTR("Enable Custom Styles"), v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v172[12] = v83;
  v84 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableGreenScreenStyles);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rowWithTitle:valueKeyPath:", CFSTR("Enable Green-Screen Styles"), v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v172[13] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 14);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "sectionWithRows:title:", v87, CFSTR("Posters UI"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0D83078];
  v89 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_shortcutsPlaygroundSettings);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:childSettingsKeyPath:", CFSTR("Shortcuts Playground"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sectionWithRows:title:", v92, CFSTR("Shortcuts"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_debugRowsForCurrentAsset");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v94, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v94, CFSTR("Current Asset or Selection"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v95 = 0;
  }
  v96 = (void *)MEMORY[0x1E0C99DE8];
  v170[0] = v133;
  v170[1] = v132;
  v170[2] = v145;
  v170[3] = v131;
  v170[4] = v143;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 5);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "arrayWithArray:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v141)
    objc_msgSend(v98, "addObject:");
  if (v95)
    objc_msgSend(v98, "addObject:", v95);
  objc_msgSend(v98, "addObject:", v93);
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v99);

  v100 = (void *)MEMORY[0x1E0D83078];
  v101 = (void *)objc_msgSend(v98, "copy");
  objc_msgSend(v100, "moduleWithTitle:contents:", CFSTR("Suggestions"), v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  return v102;
}

+ (id)_debugRowsForCurrentAsset
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id obj;
  id v33;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(void);
  uint64_t i;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[4];
  id v55;
  id location;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F20], "pu_currentViewControllerStack");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    v33 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v31, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (!v37)
    goto LABEL_24;
  v36 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v58 != v36)
        objc_enumerationMutation(obj);
      objc_initWeak(&location, *(id *)(*((_QWORD *)&v57 + 1) + 8 * i));
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke;
      aBlock[3] = &unk_1E58A85B8;
      objc_copyWeak(&v55, &location);
      v38 = (void (**)(void))_Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v38[2]();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v51;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v51 != v5)
              objc_enumerationMutation(v3);
            v7 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * v6);
            if (v7)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_14;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (objc_class *)objc_opt_class();
              NSStringFromClass(v11);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "px_descriptionForAssertionMessage");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUSuggestionsSettings+UI.m"), 314, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v10, v12);

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (objc_class *)objc_opt_class();
              NSStringFromClass(v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUSuggestionsSettings+UI.m"), 314, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v10);
            }

LABEL_14:
            objc_msgSend(v2, "addObject:", v7);

            ++v6;
          }
          while (v4 != v6);
          v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          v4 = v13;
        }
        while (v13);
      }

      if (objc_msgSend(v2, "count"))
      {
        v14 = (void *)MEMORY[0x1E0D83010];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_2;
        v48[3] = &unk_1E58A8568;
        v15 = v2;
        v49 = v15;
        objc_msgSend(v14, "pu_rowWithTitle:action:", CFSTR("Show in Parallax Debug Viewer"), v48);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v16;
        v17 = (void *)MEMORY[0x1E0D83010];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_3;
        v46[3] = &unk_1E58A8568;
        v18 = v15;
        v47 = v18;
        objc_msgSend(v17, "pu_rowWithTitle:action:", CFSTR("Show in Wallpaper Poster Editor"), v46);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v19;
        v20 = (void *)MEMORY[0x1E0D83010];
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_4;
        v44[3] = &unk_1E58A8568;
        v21 = v18;
        v45 = v21;
        objc_msgSend(v20, "pu_rowWithTitle:action:", CFSTR("Show as Lock Screen Wallpaper"), v44);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v61[2] = v22;
        v23 = (void *)MEMORY[0x1E0D83010];
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_5;
        v42[3] = &unk_1E58A8568;
        v24 = v21;
        v43 = v24;
        objc_msgSend(v23, "pu_rowWithTitle:action:", CFSTR("Test Lock Screen Migration"), v42);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v61[3] = v25;
        v26 = (void *)MEMORY[0x1E0D83010];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_6;
        v40[3] = &unk_1E58A8568;
        v41 = v24;
        objc_msgSend(v26, "pu_rowWithTitle:action:", CFSTR("Test Home Screen Migration"), v40);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v61[4] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "addObjectsFromArray:", v28);
      }

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  }
  while (v37);
LABEL_24:

LABEL_26:
  return v33;
}

id __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id to;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "pu_debugCurrentlySelectedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_loadWeakRetained(&to);
    objc_msgSend(v3, "pu_debugCurrentAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  objc_destroyWeak(&to);
  return v2;
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PUParallaxLayerStackDebugViewController *v6;

  v3 = a2;
  v6 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController loadPHAsset:](v6, "loadPHAsset:", v4);

  objc_msgSend(v3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", v6, 1);
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  PUWallpaperPosterEditDebugViewController *v8;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUWallpaperPosterEditDebugViewController initWithAssets:posterType:photoLibrary:](v4, "initWithAssets:posterType:photoLibrary:", v5, 1, v7);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v8, 1, 0);

}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPlaygroundViewController *v4;

  v3 = a2;
  v4 = -[PUWallpaperPlaygroundViewController initWithAssets:]([PUWallpaperPlaygroundViewController alloc], "initWithAssets:", *(_QWORD *)(a1 + 32));
  -[PUWallpaperPlaygroundViewController presentPlaygroundWithPresentingViewController:](v4, "presentPlaygroundWithPresentingViewController:", v3);

}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperPosterEditDebugViewController initWithMigratorOfLegacyConfigurationType:photoLibrary:](v4, "initWithMigratorOfLegacyConfigurationType:photoLibrary:", 1, v6);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperPosterEditDebugViewController initWithMigratorOfLegacyConfigurationType:photoLibrary:](v4, "initWithMigratorOfLegacyConfigurationType:photoLibrary:", 2, v6);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PUWallpaperSmartAlbumPeopleDebugViewController *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v3 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BC10]), "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = -[PUWallpaperSmartAlbumPeopleDebugViewController initWithSpec:dataSource:]([PUWallpaperSmartAlbumPeopleDebugViewController alloc], "initWithSpec:dataSource:", v7, v4);
  objc_msgSend(v3, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  PUPassiveContentDebugViewSpec *v6;
  PUWallpaperGalleryDebugViewController *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0D77EF8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "fetchWallpaperGallerySuggestionsInPhotoLibrary:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v7 = -[PUWallpaperGalleryDebugViewController initWithSpec:]([PUWallpaperGalleryDebugViewController alloc], "initWithSpec:", v6);
  -[PUWallpaperGalleryDebugViewController setSuggestions:](v7, "setSuggestions:", v5);
  objc_msgSend(v4, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pushViewController:animated:", v7, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  PUPassiveContentDebugViewSpec *v6;
  PUWallpaperGalleryDebugViewController *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0D77EF8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "fetchWallpaperGallerySuggestionsInPhotoLibrary:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "wallpaperGallerySmartAlbumSuggestionsFromSuggestions:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v7 = -[PUWallpaperGalleryDebugViewController initWithSpec:]([PUWallpaperGalleryDebugViewController alloc], "initWithSpec:", v6);
  -[PUWallpaperGalleryDebugViewController setSuggestions:](v7, "setSuggestions:", v5);
  objc_msgSend(v4, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pushViewController:animated:", v7, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
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
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", objc_msgSend(v4, "livePhotoTabFetchLimit"));
  objc_msgSend(*(id *)(a1 + 40), "sortDescriptorForMode:", objc_msgSend(v4, "primarySort"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(*(id *)(a1 + 40), "sortDescriptorForMode:", objc_msgSend(v4, "secondarySort", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchLivePhotoTabAssetsWithOptions:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v10, "fetchedObjectIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAssetsWithObjectIDs:options:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "livePhotoTabPlaygroundViewControllerWithFetchResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pushViewController:animated:", v14, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2_243(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "livePhotoTabReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3_246(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "livePhotoTabHighlightSettlingEffectAssetsReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4_249(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "livePhotoTabHighlightCandidateAssetsReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5_252(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "livePhotoTabSuggestionReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6_262(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "settlingEffectScoreReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7_265(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "autoplayScoreReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8_268(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(getPUTesterSettlingEffectReviewUtilitiesClass(), "settlingEffectSuggestionReviewViewControllerWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  PUPassiveContentSummaryViewController *v3;
  void *v4;
  PUPassiveContentSummaryViewController *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v3 = [PUPassiveContentSummaryViewController alloc];
  +[PUPassiveContentDataSource wallpaperDataSource](PUPassiveContentDataSource, "wallpaperDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPassiveContentSummaryViewController initWithSpec:dataSource:](v3, "initWithSpec:dataSource:", v7, v4);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v5, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  PUPortraitWallpaperCandidateDebugViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v3 = -[PUPortraitWallpaperCandidateDebugViewController initWithSpec:mode:]([PUPortraitWallpaperCandidateDebugViewController alloc], "initWithSpec:mode:", v7, 2);
  -[PUPortraitWallpaperCandidateDebugViewController navigationItem](v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v3, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  PUPortraitWallpaperCandidateDebugViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v3 = -[PUPortraitWallpaperCandidateDebugViewController initWithSpec:mode:]([PUPortraitWallpaperCandidateDebugViewController alloc], "initWithSpec:mode:", v7, 1);
  -[PUPortraitWallpaperCandidateDebugViewController navigationItem](v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v3, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PUPortraitWallpaperCandidateDebugViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  PUPassiveContentDebugViewSpec *v7;

  v2 = a2;
  v7 = -[PUPassiveContentDebugViewSpec initWithViewMode:]([PUPassiveContentDebugViewSpec alloc], "initWithViewMode:", 0);
  v3 = -[PUPortraitWallpaperCandidateDebugViewController initWithSpec:mode:]([PUPortraitWallpaperCandidateDebugViewController alloc], "initWithSpec:mode:", v7, 0);
  -[PUPortraitWallpaperCandidateDebugViewController navigationItem](v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v3, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *v7;

  v2 = a2;
  v7 = objc_alloc_init(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController);
  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController navigationItem](v7, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Poster Configurations"));

  -[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController navigationItem](v7, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v7, 1);
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PUTopPeopleWallpaperSuggestionsDebugViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUTopPeopleWallpaperSuggestionsDebugViewController *v10;

  v2 = a2;
  objc_msgSend(v2, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUTopPeopleWallpaperSuggestionsDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v10 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);

  -[PUTopPeopleWallpaperSuggestionsDebugViewController navigationItem](v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("Top People Suggestion Generation"));

  -[PUTopPeopleWallpaperSuggestionsDebugViewController navigationItem](v10, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pushViewController:animated:", v10, 1);
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (void)performPostSaveActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSuggestionsSettings;
  -[PXSettings performPostSaveActions](&v7, sel_performPostSaveActions);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v3, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[PUSuggestionsSettings enableFRCInAssetDetails](self, "enableFRCInAssetDetails"))
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D78178]);
  else
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D78178]);
  objc_msgSend(v3, "setPersistentDomain:forName:", v6, v4);

}

- (int64_t)infillMode
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "segmentationInfillAlgorithm");

  return v3;
}

- (void)setInfillMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentationInfillAlgorithm:", a3);

}

- (BOOL)debugTintLayers
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "segmentationDebugTintLayers");

  return v3;
}

- (void)setDebugTintLayers:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentationDebugTintLayers:", v3);

}

- (BOOL)disableSegmentation
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableSegmentation");

  return v3;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableSegmentation:", v3);

}

- (double)manualGatingLenience
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentationManualGatingLenience");
  v4 = v3;

  return v4;
}

- (void)setManualGatingLenience:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentationManualGatingLenience:", a3);

}

- (BOOL)disableSegmentationCache
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "segmentationDisableCaching");

  return v3;
}

- (void)setDisableSegmentationCache:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentationDisableCaching:", v3);

}

- (BOOL)enableCustomStyles
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useStyleRecipeConfigDirectory");

  return v3;
}

- (void)setEnableCustomStyles:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseStyleRecipeConfigDirectory:", v3);

}

- (BOOL)enableGreenScreenStyles
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "parallaxStyleEnableGreenScreen");

  return v3;
}

- (void)setEnableGreenScreenStyles:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParallaxStyleEnableGreenScreen:", v3);

}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (BOOL)includeDebugLayers
{
  return self->_includeDebugLayers;
}

- (BOOL)debugRoundTripLayerStack
{
  return self->_debugRoundTripLayerStack;
}

- (BOOL)debugBackfillCompositing
{
  return self->_debugBackfillCompositing;
}

- (BOOL)debugDisableFrameUpdates
{
  return self->_debugDisableFrameUpdates;
}

- (BOOL)enableFRCInAssetDetails
{
  return self->_enableFRCInAssetDetails;
}

- (int64_t)primarySort
{
  return self->_primarySort;
}

- (int64_t)secondarySort
{
  return self->_secondarySort;
}

- (unint64_t)livePhotoTabFetchLimit
{
  return self->_livePhotoTabFetchLimit;
}

- (PUWallpaperShortcutsPlaygroundSettings)shortcutsPlaygroundSettings
{
  return self->_shortcutsPlaygroundSettings;
}

- (void)setShortcutsPlaygroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsPlaygroundSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsPlaygroundSettings, 0);
}

+ (PUSuggestionsSettings)sharedInstance
{
  if (sharedInstance_onceToken_97660 != -1)
    dispatch_once(&sharedInstance_onceToken_97660, &__block_literal_global_97661);
  return (PUSuggestionsSettings *)(id)sharedInstance_sharedInstance_97662;
}

+ (id)sortDescriptorForMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", off_1E58A9E30[a3], 0, v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __39__PUSuggestionsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestions");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_97662;
  sharedInstance_sharedInstance_97662 = v0;

}

@end
