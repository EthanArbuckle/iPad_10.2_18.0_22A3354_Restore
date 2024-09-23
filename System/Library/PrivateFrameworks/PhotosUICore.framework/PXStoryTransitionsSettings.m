@implementation PXStoryTransitionsSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  if (PXStoryIsSlowDevice_onceToken != -1)
    dispatch_once(&PXStoryIsSlowDevice_onceToken, &__block_literal_global_1592);
  -[PXStoryTransitionsSettings setTransitionQuality:](self, "setTransitionQuality:", 3);
  -[PXStoryTransitionsSettings setSuppressUnsupportedTransitionErrors:](self, "setSuppressUnsupportedTransitionErrors:", 1);
  -[PXStoryTransitionsSettings setSuppressInvalidTransitionErrors:](self, "setSuppressInvalidTransitionErrors:", 1);
  -[PXStoryTransitionsSettings setSuppressInterruptedTransitionErrors:](self, "setSuppressInterruptedTransitionErrors:", 1);
  -[PXStoryTransitionsSettings setFadeToBlackTransitionBlackRelativeDuration:](self, "setFadeToBlackTransitionBlackRelativeDuration:", 0.2);
  -[PXStoryTransitionsSettings setFadeToBlackTransitionCueAlignment:](self, "setFadeToBlackTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setExposureBleedTransitionMidpoint:](self, "setExposureBleedTransitionMidpoint:", 0.375);
  -[PXStoryTransitionsSettings setExposureBleedTransitionExposure:](self, "setExposureBleedTransitionExposure:", 2.0);
  -[PXStoryTransitionsSettings setExposureBleedTransitionBlurRadius:](self, "setExposureBleedTransitionBlurRadius:", 20.0);
  -[PXStoryTransitionsSettings setExposureBleedTransitionCueAlignment:](self, "setExposureBleedTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setUseSplitWipeTransitionsFromOneUp:](self, "setUseSplitWipeTransitionsFromOneUp:", 1);
  -[PXStoryTransitionsSettings setDividerAnimationDurationFraction:](self, "setDividerAnimationDurationFraction:", 0.1);
  -[PXStoryTransitionsSettings setReverseDividerAnimationDurationFraction:](self, "setReverseDividerAnimationDurationFraction:", 0.18);
  -[PXStoryTransitionsSettings setWipeTransitionCueAlignment:](self, "setWipeTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setPanTransitionMaxIntensity:](self, "setPanTransitionMaxIntensity:", 0.07);
  -[PXStoryTransitionsSettings setPanTransitionBlurMidpoint:](self, "setPanTransitionBlurMidpoint:", 0.16);
  -[PXStoryTransitionsSettings setPanTransitionBlurOffset:](self, "setPanTransitionBlurOffset:", 0.35);
  -[PXStoryTransitionsSettings setPanTransitionCueAlignment:](self, "setPanTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setScaleTransitionRelativeFactor:](self, "setScaleTransitionRelativeFactor:", 1.15);
  -[PXStoryTransitionsSettings setScaleTransitionBlurMidpoint:](self, "setScaleTransitionBlurMidpoint:", 0.2);
  -[PXStoryTransitionsSettings setScaleTransitionMaxBlurIntensity:](self, "setScaleTransitionMaxBlurIntensity:", 0.4);
  -[PXStoryTransitionsSettings setScaleTransitionCueAlignment:](self, "setScaleTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setRotateTransitionAngle:](self, "setRotateTransitionAngle:", 15.0);
  -[PXStoryTransitionsSettings setRotateTransitionBlurMidpoint:](self, "setRotateTransitionBlurMidpoint:", 0.5);
  -[PXStoryTransitionsSettings setRotateTransitionMaxBlurIntensity:](self, "setRotateTransitionMaxBlurIntensity:", 0.1);
  -[PXStoryTransitionsSettings setRotateTransitionBlurAnimationRelativeDuration:](self, "setRotateTransitionBlurAnimationRelativeDuration:", 0.68);
  -[PXStoryTransitionsSettings setRotateTransitionCueAlignment:](self, "setRotateTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setZoomTransitionRelativeFactor:](self, "setZoomTransitionRelativeFactor:", 2.0);
  -[PXStoryTransitionsSettings setZoomTransitionCueAlignment:](self, "setZoomTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setCrossfadeTransitionCueAlignment:](self, "setCrossfadeTransitionCueAlignment:", 1.0);
  -[PXStoryTransitionsSettings setDisableUnsupportedTransitionsAtChapterBoundary:](self, "setDisableUnsupportedTransitionsAtChapterBoundary:", 1);
  -[PXStoryTransitionsSettings setForcedTransitionKindAtChapterBoundary:](self, "setForcedTransitionKindAtChapterBoundary:", 0);
}

- (void)setZoomTransitionRelativeFactor:(double)a3
{
  self->_zoomTransitionRelativeFactor = a3;
}

- (void)setZoomTransitionCueAlignment:(double)a3
{
  self->_zoomTransitionCueAlignment = a3;
}

- (void)setWipeTransitionCueAlignment:(double)a3
{
  self->_wipeTransitionCueAlignment = a3;
}

- (void)setUseSplitWipeTransitionsFromOneUp:(BOOL)a3
{
  self->_useSplitWipeTransitionsFromOneUp = a3;
}

- (void)setTransitionQuality:(unint64_t)a3
{
  self->_transitionQuality = a3;
}

- (void)setSuppressUnsupportedTransitionErrors:(BOOL)a3
{
  self->_suppressUnsupportedTransitionErrors = a3;
}

- (void)setSuppressInvalidTransitionErrors:(BOOL)a3
{
  self->_suppressInvalidTransitionErrors = a3;
}

- (void)setSuppressInterruptedTransitionErrors:(BOOL)a3
{
  self->_suppressInterruptedTransitionErrors = a3;
}

- (void)setScaleTransitionRelativeFactor:(double)a3
{
  self->_scaleTransitionRelativeFactor = a3;
}

- (void)setScaleTransitionMaxBlurIntensity:(double)a3
{
  self->_scaleTransitionMaxBlurIntensity = a3;
}

- (void)setScaleTransitionCueAlignment:(double)a3
{
  self->_scaleTransitionCueAlignment = a3;
}

- (void)setScaleTransitionBlurMidpoint:(double)a3
{
  self->_scaleTransitionBlurMidpoint = a3;
}

- (void)setRotateTransitionMaxBlurIntensity:(double)a3
{
  self->_rotateTransitionMaxBlurIntensity = a3;
}

- (void)setRotateTransitionCueAlignment:(double)a3
{
  self->_rotateTransitionCueAlignment = a3;
}

- (void)setRotateTransitionBlurMidpoint:(double)a3
{
  self->_rotateTransitionBlurMidpoint = a3;
}

- (void)setRotateTransitionBlurAnimationRelativeDuration:(double)a3
{
  self->_rotateTransitionBlurAnimationRelativeDuration = a3;
}

- (void)setRotateTransitionAngle:(double)a3
{
  self->_rotateTransitionAngle = a3;
}

- (void)setReverseDividerAnimationDurationFraction:(double)a3
{
  self->_reverseDividerAnimationDurationFraction = a3;
}

- (void)setPanTransitionMaxIntensity:(double)a3
{
  self->_panTransitionMaxIntensity = a3;
}

- (void)setPanTransitionCueAlignment:(double)a3
{
  self->_panTransitionCueAlignment = a3;
}

- (void)setPanTransitionBlurOffset:(double)a3
{
  self->_panTransitionBlurOffset = a3;
}

- (void)setPanTransitionBlurMidpoint:(double)a3
{
  self->_panTransitionBlurMidpoint = a3;
}

- (void)setForcedTransitionKindAtChapterBoundary:(char)a3
{
  self->_forcedTransitionKindAtChapterBoundary = a3;
}

- (void)setFadeToBlackTransitionCueAlignment:(double)a3
{
  self->_fadeToBlackTransitionCueAlignment = a3;
}

- (void)setFadeToBlackTransitionBlackRelativeDuration:(double)a3
{
  self->_fadeToBlackTransitionBlackRelativeDuration = a3;
}

- (void)setExposureBleedTransitionMidpoint:(double)a3
{
  self->_exposureBleedTransitionMidpoint = a3;
}

- (void)setExposureBleedTransitionExposure:(double)a3
{
  self->_exposureBleedTransitionExposure = a3;
}

- (void)setExposureBleedTransitionCueAlignment:(double)a3
{
  self->_exposureBleedTransitionCueAlignment = a3;
}

- (void)setExposureBleedTransitionBlurRadius:(double)a3
{
  self->_exposureBleedTransitionBlurRadius = a3;
}

- (void)setDividerAnimationDurationFraction:(double)a3
{
  self->_dividerAnimationDurationFraction = a3;
}

- (void)setDisableUnsupportedTransitionsAtChapterBoundary:(BOOL)a3
{
  self->_disableUnsupportedTransitionsAtChapterBoundary = a3;
}

- (void)setCrossfadeTransitionCueAlignment:(double)a3
{
  self->_crossfadeTransitionCueAlignment = a3;
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
  id v112;
  id v113;
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
  _QWORD v153[2];
  void *v154;
  void *v155;
  _QWORD v156[5];
  _QWORD v157[4];
  _QWORD v158[4];
  _QWORD v159[4];
  _QWORD v160[2];
  _QWORD v161[4];
  _QWORD v162[3];
  _QWORD v163[13];

  v163[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v112 = (id)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_suppressUnsupportedTransitionErrors);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Suppress Unsupported Transition Errors"), v152);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v151;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_suppressInvalidTransitionErrors);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Suppress Invalid Transition Errors"), v150);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v162[1] = v149;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_suppressInterruptedTransitionErrors);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Suppress Interrupted Transition Errors"), v148);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v147;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 3);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v146, CFSTR("Errors"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v145;
  v6 = (void *)MEMORY[0x1E0D83078];
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_exposureBleedTransitionMidpoint);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Midpoint"), v144);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "minValue:maxValue:", 0.0, 1.0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = v142;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_exposureBleedTransitionExposure);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Exposure"), v141);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "minValue:maxValue:", 0.0, 5.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v161[1] = v139;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_exposureBleedTransitionBlurRadius);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), v138);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "minValue:maxValue:", 0.0, 50.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v161[2] = v136;
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_exposureBleedTransitionCueAlignment);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "minValue:maxValue:", 0.0, 1.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v161[3] = v133;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 4);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v132, CFSTR("Exposure Bleed Transition"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v131;
  v11 = (void *)MEMORY[0x1E0D83078];
  v12 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_fadeToBlackTransitionBlackRelativeDuration);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Fade to Black % of Black"), v130);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "minValue:maxValue:", 0.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v160[0] = v128;
  v13 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_fadeToBlackTransitionCueAlignment);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "minValue:maxValue:", 0.0, 1.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v160[1] = v125;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v124, CFSTR("Fade to Black Transition"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v163[2] = v123;
  v14 = (void *)MEMORY[0x1E0D83078];
  v15 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSplitWipeTransitionsFromOneUp);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Force Split Wipes (1-Up → N-Up)"), v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v121;
  v16 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_dividerAnimationDurationFraction);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Divider Animation Duration %"), v120);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "minValue:maxValue:", 0.00999999978, 1.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v159[1] = v118;
  v17 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_reverseDividerAnimationDurationFraction);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Reverse Divider Animation Duration %"), v117);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "minValue:maxValue:", 0.00999999978, 1.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v159[2] = v115;
  v18 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_wipeTransitionCueAlignment);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v114);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "minValue:maxValue:", 0.0, 1.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v159[3] = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v109, CFSTR("Wipe Transition"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v163[3] = v108;
  v19 = (void *)MEMORY[0x1E0D83078];
  v20 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panTransitionMaxIntensity);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Blur Max Intensity"), v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "minValue:maxValue:", 0.0, 1.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = v105;
  v21 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panTransitionBlurMidpoint);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Blur Midpoint"), v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "minValue:maxValue:", 0.0, 1.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v158[1] = v102;
  v22 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panTransitionBlurOffset);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Blur Offset From End"), v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "minValue:maxValue:", 0.0, 1.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v158[2] = v99;
  v23 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_panTransitionCueAlignment);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "minValue:maxValue:", 0.0, 1.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v158[3] = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v95, CFSTR("Pan Transition"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v163[4] = v94;
  v24 = (void *)MEMORY[0x1E0D83078];
  v25 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scaleTransitionRelativeFactor);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Relative Scale Factor"), v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "minValue:maxValue:", 0.0, 5.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v91;
  v26 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scaleTransitionBlurMidpoint);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Blur Midpoint"), v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "minValue:maxValue:", 0.0, 1.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v157[1] = v88;
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scaleTransitionMaxBlurIntensity);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Blur Max Intensity"), v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "minValue:maxValue:", 0.0, 1.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v157[2] = v85;
  v28 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_scaleTransitionCueAlignment);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "minValue:maxValue:", 0.0, 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v157[3] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v81, CFSTR("Scale Transition"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v163[5] = v80;
  v29 = (void *)MEMORY[0x1E0D83078];
  v30 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotateTransitionAngle);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Angle"), v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "minValue:maxValue:", 0.0, 180.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v77;
  v31 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotateTransitionBlurMidpoint);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Blur Midpoint"), v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "minValue:maxValue:", 0.0, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = v74;
  v32 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotateTransitionMaxBlurIntensity);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Blur Max Intensity"), v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 1.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v156[2] = v71;
  v33 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotateTransitionBlurAnimationRelativeDuration);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Blur Relative Duration"), v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "minValue:maxValue:", 0.5, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v156[3] = v68;
  v34 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotateTransitionCueAlignment);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "minValue:maxValue:", 0.0, 1.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v156[4] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sectionWithRows:title:", v64, CFSTR("Rotate Transition"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v163[6] = v63;
  v35 = (void *)MEMORY[0x1E0D83078];
  v36 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_crossfadeTransitionCueAlignment);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "minValue:maxValue:", 0.0, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v59, CFSTR("Crossfade Transition"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v163[7] = v58;
  v37 = (void *)MEMORY[0x1E0D83078];
  v38 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_zoomTransitionCueAlignment);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Alignment"), v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minValue:maxValue:", 0.0, 1.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sectionWithRows:title:", v54, CFSTR("Zoom Transition"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v163[8] = v53;
  v39 = (void *)MEMORY[0x1E0D83078];
  v40 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableUnsupportedTransitionsAtChapterBoundary);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Disable Unsupported Transitions"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v42;
  v43 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_forcedTransitionKindAtChapterBoundary);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Forced Transition Kind"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "px_integersFrom:to:", 0, 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "px_possibleValues:formatter:", v46, &__block_literal_global_193515);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:title:", v48, CFSTR("Chapter Boundaries"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v163[9] = v49;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v163[10] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "moduleWithTitle:contents:", CFSTR("Transitions"), v51);
  v113 = (id)objc_claimAutoreleasedReturnValue();

  return v113;
}

const __CFString *__58__PXStoryTransitionsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 0xAu)
    return CFSTR("??");
  else
    return off_1E5136018[v2];
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
}

- (double)cueAlignmentForTransitionKind:(char)a3
{
  double result;

  switch(a3)
  {
    case 2:
      -[PXStoryTransitionsSettings crossfadeTransitionCueAlignment](self, "crossfadeTransitionCueAlignment");
      break;
    case 3:
      -[PXStoryTransitionsSettings fadeToBlackTransitionCueAlignment](self, "fadeToBlackTransitionCueAlignment");
      break;
    case 4:
      -[PXStoryTransitionsSettings exposureBleedTransitionCueAlignment](self, "exposureBleedTransitionCueAlignment");
      break;
    case 5:
      -[PXStoryTransitionsSettings panTransitionCueAlignment](self, "panTransitionCueAlignment");
      break;
    case 6:
      -[PXStoryTransitionsSettings scaleTransitionCueAlignment](self, "scaleTransitionCueAlignment");
      break;
    case 7:
      -[PXStoryTransitionsSettings rotateTransitionCueAlignment](self, "rotateTransitionCueAlignment");
      break;
    case 8:
      -[PXStoryTransitionsSettings wipeTransitionCueAlignment](self, "wipeTransitionCueAlignment");
      break;
    case 9:
      -[PXStoryTransitionsSettings zoomTransitionCueAlignment](self, "zoomTransitionCueAlignment");
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (unint64_t)transitionQuality
{
  return self->_transitionQuality;
}

- (BOOL)suppressUnsupportedTransitionErrors
{
  return self->_suppressUnsupportedTransitionErrors;
}

- (BOOL)suppressInvalidTransitionErrors
{
  return self->_suppressInvalidTransitionErrors;
}

- (BOOL)suppressInterruptedTransitionErrors
{
  return self->_suppressInterruptedTransitionErrors;
}

- (double)exposureBleedTransitionMidpoint
{
  return self->_exposureBleedTransitionMidpoint;
}

- (double)exposureBleedTransitionExposure
{
  return self->_exposureBleedTransitionExposure;
}

- (double)exposureBleedTransitionBlurRadius
{
  return self->_exposureBleedTransitionBlurRadius;
}

- (double)exposureBleedTransitionCueAlignment
{
  return self->_exposureBleedTransitionCueAlignment;
}

- (double)fadeToBlackTransitionBlackRelativeDuration
{
  return self->_fadeToBlackTransitionBlackRelativeDuration;
}

- (double)fadeToBlackTransitionCueAlignment
{
  return self->_fadeToBlackTransitionCueAlignment;
}

- (BOOL)useSplitWipeTransitionsFromOneUp
{
  return self->_useSplitWipeTransitionsFromOneUp;
}

- (double)dividerAnimationDurationFraction
{
  return self->_dividerAnimationDurationFraction;
}

- (double)reverseDividerAnimationDurationFraction
{
  return self->_reverseDividerAnimationDurationFraction;
}

- (double)wipeTransitionCueAlignment
{
  return self->_wipeTransitionCueAlignment;
}

- (double)panTransitionMaxIntensity
{
  return self->_panTransitionMaxIntensity;
}

- (double)panTransitionBlurMidpoint
{
  return self->_panTransitionBlurMidpoint;
}

- (double)panTransitionBlurOffset
{
  return self->_panTransitionBlurOffset;
}

- (double)panTransitionCueAlignment
{
  return self->_panTransitionCueAlignment;
}

- (double)scaleTransitionRelativeFactor
{
  return self->_scaleTransitionRelativeFactor;
}

- (double)scaleTransitionBlurMidpoint
{
  return self->_scaleTransitionBlurMidpoint;
}

- (double)scaleTransitionMaxBlurIntensity
{
  return self->_scaleTransitionMaxBlurIntensity;
}

- (double)scaleTransitionCueAlignment
{
  return self->_scaleTransitionCueAlignment;
}

- (double)rotateTransitionAngle
{
  return self->_rotateTransitionAngle;
}

- (double)rotateTransitionBlurMidpoint
{
  return self->_rotateTransitionBlurMidpoint;
}

- (double)rotateTransitionMaxBlurIntensity
{
  return self->_rotateTransitionMaxBlurIntensity;
}

- (double)rotateTransitionBlurAnimationRelativeDuration
{
  return self->_rotateTransitionBlurAnimationRelativeDuration;
}

- (double)rotateTransitionCueAlignment
{
  return self->_rotateTransitionCueAlignment;
}

- (double)zoomTransitionRelativeFactor
{
  return self->_zoomTransitionRelativeFactor;
}

- (double)zoomTransitionCueAlignment
{
  return self->_zoomTransitionCueAlignment;
}

- (double)crossfadeTransitionCueAlignment
{
  return self->_crossfadeTransitionCueAlignment;
}

- (BOOL)disableUnsupportedTransitionsAtChapterBoundary
{
  return self->_disableUnsupportedTransitionsAtChapterBoundary;
}

- (char)forcedTransitionKindAtChapterBoundary
{
  return self->_forcedTransitionKindAtChapterBoundary;
}

+ (PXStoryTransitionsSettings)sharedInstance
{
  if (sharedInstance_onceToken_266161 != -1)
    dispatch_once(&sharedInstance_onceToken_266161, &__block_literal_global_266162);
  return (PXStoryTransitionsSettings *)(id)sharedInstance_sharedInstance_266163;
}

+ (NSArray)supportedTransitions
{
  return (NSArray *)&unk_1E53EAB48;
}

void __44__PXStoryTransitionsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionsSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_266163;
  sharedInstance_sharedInstance_266163 = v0;

}

@end
