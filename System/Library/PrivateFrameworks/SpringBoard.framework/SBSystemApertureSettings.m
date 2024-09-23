@implementation SBSystemApertureSettings

- (BOOL)hideRemotePrototypingFallbackPill
{
  return self->_hideRemotePrototypingFallbackPill;
}

- (SBSAInterfaceElementTransitionSettings)inertInterfaceElementTransitionSettings
{
  return self->_inertInterfaceElementTransitionSettings;
}

- (SBFFluidBehaviorSettings)keyLineStyleTransition
{
  return self->_keyLineStyleTransition;
}

- (BOOL)elementShadowEnabled
{
  return self->_elementShadowEnabled;
}

- (SBSAInterfaceElementTransitionSettings)defaultInterfaceElementTransitionSettings
{
  return self->_defaultInterfaceElementTransitionSettings;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (SBSAInterfaceElementInertCollapsingTransitionSettings)inertCollapsingInterfaceElementTransitionSettings
{
  return self->_inertCollapsingInterfaceElementTransitionSettings;
}

- (double)sensorObscuringShadowApexProgress
{
  return self->_sensorObscuringShadowApexProgress;
}

- (BOOL)pulseIndicatorEnabled
{
  return self->_pulseIndicatorEnabled;
}

- (void)setDefaultValues
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
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  _QWORD v293[2];
  int v294;
  uint64_t v295;
  uint64_t v296;
  int v297;
  uint64_t v298;
  uint64_t v299;
  __int128 v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  objc_super v304;
  CAFrameRateRange v305;
  CAFrameRateRange v306;
  CAFrameRateRange v307;
  CAFrameRateRange v308;
  CAFrameRateRange v309;
  CAFrameRateRange v310;
  CAFrameRateRange v311;
  CAFrameRateRange v312;
  CAFrameRateRange v313;
  CAFrameRateRange v314;
  CAFrameRateRange v315;
  CAFrameRateRange v316;
  CAFrameRateRange v317;
  CAFrameRateRange v318;
  CAFrameRateRange v319;
  CAFrameRateRange v320;
  CAFrameRateRange v321;
  CAFrameRateRange v322;
  CAFrameRateRange v323;
  CAFrameRateRange v324;
  CAFrameRateRange v325;
  CAFrameRateRange v326;
  CAFrameRateRange v327;
  CAFrameRateRange v328;
  CAFrameRateRange v329;
  CAFrameRateRange v330;
  CAFrameRateRange v331;

  v304.receiver = self;
  v304.super_class = (Class)SBSystemApertureSettings;
  -[PTSettings setDefaultValues](&v304, sel_setDefaultValues);
  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBehaviorType:", 1);

  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.6);

  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("Jindo Bounds Oval"));

  -[SBSystemApertureSettings jindoBoundsOval](self, "jindoBoundsOval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v305 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v305.minimum, *(double *)&v305.maximum, *(double *)&v305.preferred);

  -[SBSystemApertureSettings setSensorShadowVisible:](self, "setSensorShadowVisible:", 0);
  -[SBSystemApertureSettings setSensorShadowOpacityFactor:](self, "setSensorShadowOpacityFactor:", 1.6);
  -[SBSystemApertureSettings setHighlightTransitions:](self, "setHighlightTransitions:", 0);
  -[SBSystemApertureSettings setBoundsCollisionProgress:](self, "setBoundsCollisionProgress:", 0.77);
  -[SBSystemApertureSettings setBoundsCollapsingPhaseChangeProgress:](self, "setBoundsCollapsingPhaseChangeProgress:", 0.95);
  -[SBSystemApertureSettings setBoundsCompensatingPhaseChangeProgress:](self, "setBoundsCompensatingPhaseChangeProgress:", 0.75);
  -[SBSystemApertureSettings setSensorObscuringShadowApexProgress:](self, "setSensorObscuringShadowApexProgress:", 0.5);
  -[SBSystemApertureSettings defaultInterfaceElementTransitionSettings](self, "defaultInterfaceElementTransitionSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultValues");

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultBehaviorSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerBehaviorSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundsBehaviorSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cornerRadiusBehaviorSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "alphaBehaviorSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "backgroundColorBehaviorSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings inertInterfaceElementTransitionSettings](self, "inertInterfaceElementTransitionSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setChildBehaviorSettingsNamePrefix:", CFSTR("Inert Transition"));

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDefaultValues");

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "defaultBehaviorSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerBehaviorSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "boundsBehaviorSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "cornerRadiusBehaviorSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "alphaBehaviorSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "backgroundColorBehaviorSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCollapsingInterfaceElementTransitionSettings](self, "inertCollapsingInterfaceElementTransitionSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setChildBehaviorSettingsNamePrefix:", CFSTR("Inert Collapsing Transition"));

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDefaultValues");

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "defaultBehaviorSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerBehaviorSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "boundsBehaviorSettings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "cornerRadiusBehaviorSettings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "alphaBehaviorSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "backgroundColorBehaviorSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setResponse:", 0.45);

  -[SBSystemApertureSettings inertCompensatingInterfaceElementTransitionSettings](self, "inertCompensatingInterfaceElementTransitionSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setChildBehaviorSettingsNamePrefix:", CFSTR("Inert Compensating Transition"));

  -[SBSystemApertureSettings compactInterfaceElementTransitionSettings](self, "compactInterfaceElementTransitionSettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDefaultValues");

  -[SBSystemApertureSettings compactInterfaceElementTransitionSettings](self, "compactInterfaceElementTransitionSettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setChildBehaviorSettingsNamePrefix:", CFSTR("Compact Transition"));

  -[SBSystemApertureSettings minimalInterfaceElementTransitionSettings](self, "minimalInterfaceElementTransitionSettings");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setDefaultValues");

  -[SBSystemApertureSettings minimalInterfaceElementTransitionSettings](self, "minimalInterfaceElementTransitionSettings");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setChildBehaviorSettingsNamePrefix:", CFSTR("Minimal Transition"));

  -[SBSystemApertureSettings customInterfaceElementTransitionSettings](self, "customInterfaceElementTransitionSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDefaultValues");

  -[SBSystemApertureSettings customInterfaceElementTransitionSettings](self, "customInterfaceElementTransitionSettings");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setChildBehaviorSettingsNamePrefix:", CFSTR("Custom Transition"));

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setDefaultValues");

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setChildBehaviorSettingsNamePrefix:", CFSTR("Pop To Custom Transition"));

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "defaultBehaviorSettings");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setResponse:", 0.4);

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "defaultBehaviorSettings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setDampingRatio:", 0.78);

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerBehaviorSettings");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setResponse:", 0.4);

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerBehaviorSettings");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setDampingRatio:", 0.78);

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "boundsBehaviorSettings");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setResponse:", 0.4);

  -[SBSystemApertureSettings popToCustomInterfaceElementTransitionSettings](self, "popToCustomInterfaceElementTransitionSettings");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "boundsBehaviorSettings");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setDampingRatio:", 0.78);

  -[SBSystemApertureSettings elementContentTransitionSettings](self, "elementContentTransitionSettings");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setDefaultValues");

  -[SBSystemApertureSettings elementContentTransitionSettings](self, "elementContentTransitionSettings");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "customContentBehaviorSettings");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setResponse:", 0.6);

  -[SBSystemApertureSettings elementContentTransitionSettings](self, "elementContentTransitionSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "snapshotBehaviorSettings");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setResponse:", 0.3);

  -[SBSystemApertureSettings elementContentTransitionSettings](self, "elementContentTransitionSettings");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setChildBehaviorSettingsNamePrefix:", CFSTR("Element Content"));

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setDefaultValues");

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setBehaviorType:", 1);

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setDampingRatio:");

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setResponse:");

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setRetargetImpulse:");

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v306 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v83, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v306.minimum, *(double *)&v306.maximum, *(double *)&v306.preferred);

  -[SBSystemApertureSettings contentInteractionBeginBehaviorSettings](self, "contentInteractionBeginBehaviorSettings");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setName:", CFSTR("Content Interation Settings"));

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setDefaultValues");

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setBehaviorType:", 1);

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setDampingRatio:", 0.55);

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setResponse:", 0.45);

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setName:", CFSTR("Jindo Prominent Pill Transition"));

  -[SBSystemApertureSettings transitionToProminentPillSettings](self, "transitionToProminentPillSettings");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v90, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v307.minimum, *(double *)&v307.maximum, *(double *)&v307.preferred);

  -[SBSystemApertureSettings setProminentPillScale:](self, "setProminentPillScale:", 1.55454545);
  -[SBSystemApertureSettings setProminentPillContentScale:](self, "setProminentPillContentScale:", 1.3);
  -[SBSystemApertureSettings setProminentPillVerticalOffsetProportion:](self, "setProminentPillVerticalOffsetProportion:", 0.5);
  -[SBSystemApertureSettings setTallRectWidth:](self, "setTallRectWidth:", 166.0);
  -[SBSystemApertureSettings setTallRectCornerRadius:](self, "setTallRectCornerRadius:", 71.3333333);
  -[SBSystemApertureSettings setContainerHitRectVisible:](self, "setContainerHitRectVisible:", 0);
  -[SBSystemApertureSettings setContainerHitRectTopMarginDefault:](self, "setContainerHitRectTopMarginDefault:", 10.0);
  -[SBSystemApertureSettings setContainerHitRectTopMarginWide:](self, "setContainerHitRectTopMarginWide:", 10.0);
  -[SBSystemApertureSettings setContainerHitRectHorizontalMargin:](self, "setContainerHitRectHorizontalMargin:", 10.0);
  -[SBSystemApertureSettings setContainerHitRectHorizontalMarginLimit:](self, "setContainerHitRectHorizontalMarginLimit:", 75.0);
  -[SBSystemApertureSettings setContainerHitRectHorizontalLimit:](self, "setContainerHitRectHorizontalLimit:", 45.0);
  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setDefaultValues");

  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setBehaviorType:", 1);

  v303 = 0;
  v302 = 0;
  convertDampingMassAndStiffnessToDampingRatioAndResponse();
  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setDampingRatio:", 0.141);

  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setResponse:", 0.222);

  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setRetargetImpulse:", 0.0);

  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v308 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v96, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v308.minimum, *(double *)&v308.maximum, *(double *)&v308.preferred);

  -[SBSystemApertureSettings mitosisSecondaryBoundsSettings](self, "mitosisSecondaryBoundsSettings");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setName:", CFSTR("Mitosis Secondary Bounds"));

  -[SBSystemApertureSettings setMitosisHeadstartDelay:](self, "setMitosisHeadstartDelay:", 0.13);
  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setDefaultValues");

  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setDampingRatio:", 0.6);

  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setResponse:", 0.222);

  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setRetargetImpulse:", 0.008);

  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v309 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v102, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v309.minimum, *(double *)&v309.maximum, *(double *)&v309.preferred);

  -[SBSystemApertureSettings recombinationSecondaryBoundsYSettings](self, "recombinationSecondaryBoundsYSettings");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setName:", CFSTR("Recombination Secondary Y-Bounds"));

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setDefaultValues");

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setBehaviorType:", 1);

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setDampingRatio:", 0.141);

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setResponse:", 0.222);

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v310 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v109, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v310.minimum, *(double *)&v310.maximum, *(double *)&v310.preferred);

  -[SBSystemApertureSettings jindoAuthErrorShakeInitialKick](self, "jindoAuthErrorShakeInitialKick");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setName:", CFSTR("Shake Kick"));

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setDefaultValues");

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setBehaviorType:", 1);

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setDampingRatio:", 0.141);

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setResponse:", 0.222);

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v311 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v116, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v311.minimum, *(double *)&v311.maximum, *(double *)&v311.preferred);

  -[SBSystemApertureSettings jindoAuthErrorShakeSettle](self, "jindoAuthErrorShakeSettle");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setName:", CFSTR("Shake Settle"));

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setDefaultValues");

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setBehaviorType:", 1);

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setResponse:", 0.23);

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v312 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v123, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v312.minimum, *(double *)&v312.maximum, *(double *)&v312.preferred);

  -[SBSystemApertureSettings jindoAuthErrorStretchOut](self, "jindoAuthErrorStretchOut");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setName:", CFSTR("Shake Stretch Out"));

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setBehaviorType:", 1);

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setResponse:", 0.732);

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v313 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v129, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v313.minimum, *(double *)&v313.maximum, *(double *)&v313.preferred);

  -[SBSystemApertureSettings jindoAuthErrorStretchSettle](self, "jindoAuthErrorStretchSettle");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setName:", CFSTR("Shake Stretch Settle"));

  -[SBSystemApertureSettings setShakeDisplacement:](self, "setShakeDisplacement:", 8.0);
  -[SBSystemApertureSettings setShakeSensorExpansion:](self, "setShakeSensorExpansion:", 22.0);
  -[SBSystemApertureSettings setShakeSensorOffset:](self, "setShakeSensorOffset:", 3.0);
  -[SBSystemApertureSettings setFirstShakeMilestone:](self, "setFirstShakeMilestone:", 0.923);
  -[SBSystemApertureSettings setSecondShakeMilestone:](self, "setSecondShakeMilestone:", 0.756);
  -[SBSystemApertureSettings setShakeRingerBell:](self, "setShakeRingerBell:", 1);
  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setDefaultValues");

  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setBehaviorType:", 1);

  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setDampingRatio:", 0.4);

  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setResponse:", 0.4);

  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v135, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v314.minimum, *(double *)&v314.maximum, *(double *)&v314.preferred);

  -[SBSystemApertureSettings bumpAnimationScaleUpSettings](self, "bumpAnimationScaleUpSettings");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setName:", CFSTR("Bump Scale Up"));

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setDefaultValues");

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setBehaviorType:", 1);

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setResponse:", 0.85);

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v141, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v315.minimum, *(double *)&v315.maximum, *(double *)&v315.preferred);

  -[SBSystemApertureSettings bumpAnimationScaleDownSettings](self, "bumpAnimationScaleDownSettings");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setName:", CFSTR("Bump Scale Down"));

  -[SBSystemApertureSettings setBumpAnimationXScale:](self, "setBumpAnimationXScale:", 1.015);
  -[SBSystemApertureSettings setBumpAnimationYScale:](self, "setBumpAnimationYScale:", 1.03);
  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setDefaultValues");

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "expandBehaviorSettings");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setBehaviorType:", 1);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "expandBehaviorSettings");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setDampingRatio:", 0.694);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "expandBehaviorSettings");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setResponse:", 0.525);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "expandBehaviorSettings");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "expandBehaviorSettings");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setName:", CFSTR("Pulse No Action Expand"));

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "expandBehaviorSettings");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v155, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v316.minimum, *(double *)&v316.maximum, *(double *)&v316.preferred);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setExpandDuration:", 0.2);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setExpandScale:", 1.25);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setExpandDelay:", 0.0);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "contractBehaviorSettings");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setDefaultValues");

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "contractBehaviorSettings");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "contractBehaviorSettings");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "setResponse:", 0.8);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "contractBehaviorSettings");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "setTrackingDampingRatio:", 0.86);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "contractBehaviorSettings");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "setTrackingResponse:", 0.15);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "contractBehaviorSettings");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setName:", CFSTR("Pulse No Action Contract"));

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "contractBehaviorSettings");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v172, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v317.minimum, *(double *)&v317.maximum, *(double *)&v317.preferred);

  -[SBSystemApertureSettings setPulseIndicatorEnabled:](self, "setPulseIndicatorEnabled:", 0);
  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "setDefaultValues");

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "expandBehaviorSettings");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setBehaviorType:", 1);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "expandBehaviorSettings");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "setDampingRatio:", 0.694);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "expandBehaviorSettings");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "setResponse:", 0.525);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "expandBehaviorSettings");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "expandBehaviorSettings");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "setName:", CFSTR("Pulse Indicator Expand"));

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "expandBehaviorSettings");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v185, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v318.minimum, *(double *)&v318.maximum, *(double *)&v318.preferred);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "setExpandDuration:", 0.2);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setExpandScale:", 1.125);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "setExpandDelay:", 0.1);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "contractBehaviorSettings");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setDefaultValues");

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "contractBehaviorSettings");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "contractBehaviorSettings");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "setResponse:", 0.8);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "contractBehaviorSettings");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "setTrackingDampingRatio:", 0.86);

  -[SBSystemApertureSettings pulseNoActionSettings](self, "pulseNoActionSettings");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "contractBehaviorSettings");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setTrackingResponse:", 0.15);

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "contractBehaviorSettings");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "setName:", CFSTR("Pulse Indicator Contract"));

  -[SBSystemApertureSettings pulseIndicatorSettings](self, "pulseIndicatorSettings");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "contractBehaviorSettings");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v319 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v202, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v319.minimum, *(double *)&v319.maximum, *(double *)&v319.preferred);

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "setDefaultValues");

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "setBehaviorType:", 1);

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "setResponse:", 2.0);

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v207, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v320.minimum, *(double *)&v320.maximum, *(double *)&v320.preferred);

  -[SBSystemApertureSettings inflateAnimationScaleUpSettings](self, "inflateAnimationScaleUpSettings");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "setName:", CFSTR("Inflate Scale Up"));

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "setDefaultValues");

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "setBehaviorType:", 1);

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "setResponse:", 0.35);

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v213, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v321.minimum, *(double *)&v321.maximum, *(double *)&v321.preferred);

  -[SBSystemApertureSettings inflateAnimationScaleDownSettings](self, "inflateAnimationScaleDownSettings");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setName:", CFSTR("Inflate Scale Down"));

  -[SBSystemApertureSettings setInflateAnimationScale:](self, "setInflateAnimationScale:", 1.4);
  -[SBSystemApertureSettings setInflateAnimationContentScale:](self, "setInflateAnimationContentScale:", 1.295);
  -[SBSystemApertureSettings setInflateVerticalOffsetProportion:](self, "setInflateVerticalOffsetProportion:", 0.0);
  -[SBSystemApertureSettings setExpansionToCompactBeginInflationProgress:](self, "setExpansionToCompactBeginInflationProgress:", 0.2);
  -[SBSystemApertureSettings setResizeGestureXRubberbanding:](self, "setResizeGestureXRubberbanding:", 0.8);
  -[SBSystemApertureSettings setResizeGestureYRubberbandingStretch:](self, "setResizeGestureYRubberbandingStretch:", 0.08);
  -[SBSystemApertureSettings setResizeGestureYRubberbandingCompress:](self, "setResizeGestureYRubberbandingCompress:", 0.25);
  -[SBSystemApertureSettings setResizeGestureYRangeBeginTracking:](self, "setResizeGestureYRangeBeginTracking:", 0.8);
  -[SBSystemApertureSettings setResizeGestureYRangeEndTracking:](self, "setResizeGestureYRangeEndTracking:", 1.0);
  -[SBSystemApertureSettings setResizeGestureUpOffsetFactor:](self, "setResizeGestureUpOffsetFactor:", 16.0);
  -[SBSystemApertureSettings setResizeGestureMinEdgePadding:](self, "setResizeGestureMinEdgePadding:", 0.333333333);
  -[SBSystemApertureSettings setResizeGestureSensorXSafetyMargin:](self, "setResizeGestureSensorXSafetyMargin:", 1.1);
  -[SBSystemApertureSettings setRecombineGestureXRubberbandingStretch:](self, "setRecombineGestureXRubberbandingStretch:", 0.1);
  -[SBSystemApertureSettings setRecombineGestureXRubberbandingCompress:](self, "setRecombineGestureXRubberbandingCompress:", 0.25);
  -[SBSystemApertureSettings setRecombineGestureXScaleFactorStretch:](self, "setRecombineGestureXScaleFactorStretch:", 0.5);
  -[SBSystemApertureSettings setRecombineGestureXScaleFactorCompress:](self, "setRecombineGestureXScaleFactorCompress:", 0.5);
  -[SBSystemApertureSettings setRecombineGestureTranslateFactorStretch:](self, "setRecombineGestureTranslateFactorStretch:", 100.0);
  -[SBSystemApertureSettings setRecombineGestureTranslateFactorCompress:](self, "setRecombineGestureTranslateFactorCompress:", 100.0);
  -[SBSystemApertureSettings setAcceptanceUpBounceReboundDelay:](self, "setAcceptanceUpBounceReboundDelay:", 0.12);
  -[SBSystemApertureSettings setAcceptanceUpBounceItemAppearanceDelayOffset:](self, "setAcceptanceUpBounceItemAppearanceDelayOffset:", 0.08);
  -[SBSystemApertureSettings setAcceptanceUpBounceFinishingDelay:](self, "setAcceptanceUpBounceFinishingDelay:", 1.0);
  -[SBSystemApertureSettings setAcceptanceUpBounceYStretch:](self, "setAcceptanceUpBounceYStretch:", 17.0);
  -[SBSystemApertureSettings setAcceptanceUpBounceYDownStretch:](self, "setAcceptanceUpBounceYDownStretch:", 9.0);
  -[SBSystemApertureSettings setAcceptanceUpBounceXPadding:](self, "setAcceptanceUpBounceXPadding:", 8.0);
  -[SBSystemApertureSettings setAcceptanceUpBounceFixedOvershootScaling:](self, "setAcceptanceUpBounceFixedOvershootScaling:", 1.06);
  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "setDefaultValues");

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "setDampingRatio:", 0.714);

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "setResponse:", 0.5);

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v220, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v322.minimum, *(double *)&v322.maximum, *(double *)&v322.preferred);

  -[SBSystemApertureSettings acceptanceBounceStretch](self, "acceptanceBounceStretch");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "setName:", CFSTR("Acceptance Bounce Stretch"));

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "setResponse:", 0.35);

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "setRetargetImpulse:", 0.016);

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v323 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v227, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v323.minimum, *(double *)&v323.maximum, *(double *)&v323.preferred);

  -[SBSystemApertureSettings acceptanceBounceRebound](self, "acceptanceBounceRebound");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "setName:", CFSTR("Acceptance Bounce Rebound"));

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "setDefaultValues");

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "setDampingRatio:", 0.525);

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "setResponse:", 0.513);

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v324 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v234, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v324.minimum, *(double *)&v324.maximum, *(double *)&v324.preferred);

  -[SBSystemApertureSettings acceptanceBounceLayout](self, "acceptanceBounceLayout");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "setName:", CFSTR("Acceptance Bounce Layout"));

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "setDefaultValues");

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "setResponse:", 0.513);

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v325 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v240, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v325.minimum, *(double *)&v325.maximum, *(double *)&v325.preferred);

  -[SBSystemApertureSettings acceptanceBounceLayoutY](self, "acceptanceBounceLayoutY");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "setName:", CFSTR("Acceptance Bounce LayoutY"));

  -[SBSystemApertureSettings setAcceptanceSideBounceXVelocityThreshold:](self, "setAcceptanceSideBounceXVelocityThreshold:", 300.0);
  -[SBSystemApertureSettings setAcceptanceSideBounceReboundDelay:](self, "setAcceptanceSideBounceReboundDelay:", 0.12);
  -[SBSystemApertureSettings setAcceptanceSideBounceItemAppearanceDelayOffset:](self, "setAcceptanceSideBounceItemAppearanceDelayOffset:", 0.1);
  -[SBSystemApertureSettings setAcceptanceSideBounceFinishingDelay:](self, "setAcceptanceSideBounceFinishingDelay:", 1.0);
  -[SBSystemApertureSettings setAcceptanceSideBounceXStretch:](self, "setAcceptanceSideBounceXStretch:", 80.0);
  -[SBSystemApertureSettings setAcceptanceSideBounceYPadding:](self, "setAcceptanceSideBounceYPadding:", 9.0);
  -[SBSystemApertureSettings setAcceptanceSideBounceXSensorExpansion:](self, "setAcceptanceSideBounceXSensorExpansion:", 10.0);
  -[SBSystemApertureSettings setAcceptanceSideBounceXSensorOffset:](self, "setAcceptanceSideBounceXSensorOffset:", -5.0);
  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "setResponse:", 0.6);

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setRetargetImpulse:", 0.02);

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v326 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v247, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v326.minimum, *(double *)&v326.maximum, *(double *)&v326.preferred);

  -[SBSystemApertureSettings acceptanceBounceSideStretch](self, "acceptanceBounceSideStretch");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "setName:", CFSTR("Acceptance Bounce Side Stretch"));

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "setDampingRatio:", 0.65);

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "setResponse:", 0.62);

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "setRetargetImpulse:", 0.0);

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v254, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v327.minimum, *(double *)&v327.maximum, *(double *)&v327.preferred);

  -[SBSystemApertureSettings acceptanceBounceSideRebound](self, "acceptanceBounceSideRebound");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "setName:", CFSTR("Acceptance Bounce Side Rebound"));

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "setDefaultValues");

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "setDampingRatio:", 0.512);

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "setResponse:", 0.513);

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "setRetargetImpulse:", 0.0);

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v328 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v261, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v328.minimum, *(double *)&v328.maximum, *(double *)&v328.preferred);

  -[SBSystemApertureSettings acceptanceBounceSideLayout](self, "acceptanceBounceSideLayout");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "setName:", CFSTR("Acceptance Bounce Side Layout"));

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "setDefaultValues");

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setBehaviorType:", 1);

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setResponse:", 0.513);

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v329 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v267, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v329.minimum, *(double *)&v329.maximum, *(double *)&v329.preferred);

  -[SBSystemApertureSettings acceptanceBounceSideLayoutY](self, "acceptanceBounceSideLayoutY");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "setName:", CFSTR("Acceptance Bounce Side Layout Y"));

  -[SBSystemApertureSettings setEjectionXStretch:](self, "setEjectionXStretch:", 5.33333333);
  -[SBSystemApertureSettings setEjectionYStretch:](self, "setEjectionYStretch:", 40.0);
  -[SBSystemApertureSettings setEjectionYUpOffset:](self, "setEjectionYUpOffset:", 5.33333333);
  -[SBSystemApertureSettings setEjectionStretchDuration:](self, "setEjectionStretchDuration:", 0.15);
  -[SBSystemApertureSettings setEjectionMaxCornerRadius:](self, "setEjectionMaxCornerRadius:", 38.6666667);
  -[SBSystemApertureSettings ejectionStretchSettings](self, "ejectionStretchSettings");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings ejectionStretchSettings](self, "ejectionStretchSettings");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "setBehaviorType:", 1);

  -[SBSystemApertureSettings ejectionStretchSettings](self, "ejectionStretchSettings");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v330 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v271, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v330.minimum, *(double *)&v330.maximum, *(double *)&v330.preferred);

  -[SBSystemApertureSettings ejectionStretchSettings](self, "ejectionStretchSettings");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "setName:", CFSTR("Ejection Stretch"));

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "setDefaultCriticallyDampedValues");

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "setBehaviorType:", 1);

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "setResponse:", 0.513);

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v277, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v331.minimum, *(double *)&v331.maximum, *(double *)&v331.preferred);

  -[SBSystemApertureSettings ejectionContractionSettings](self, "ejectionContractionSettings");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "setName:", CFSTR("Ejection Contraction"));

  -[SBSystemApertureSettings setKeyLineEnabled:](self, "setKeyLineEnabled:", 1);
  -[SBSystemApertureSettings keyLineStyleTransition](self, "keyLineStyleTransition");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "setDefaultValues");

  -[SBSystemApertureSettings keyLineStyleTransition](self, "keyLineStyleTransition");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "setBehaviorType:", 1);

  -[SBSystemApertureSettings keyLineStyleTransition](self, "keyLineStyleTransition");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings keyLineStyleTransition](self, "keyLineStyleTransition");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "setResponse:", 1.0);

  -[SBSystemApertureSettings keyLineDisappearToInertTransition](self, "keyLineDisappearToInertTransition");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "setDefaultValues");

  -[SBSystemApertureSettings keyLineDisappearToInertTransition](self, "keyLineDisappearToInertTransition");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "setBehaviorType:", 1);

  -[SBSystemApertureSettings keyLineDisappearToInertTransition](self, "keyLineDisappearToInertTransition");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings keyLineDisappearToInertTransition](self, "keyLineDisappearToInertTransition");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "setResponse:", 1.2);

  -[SBSystemApertureSettings keyLineAppearForSwoopTransition](self, "keyLineAppearForSwoopTransition");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "setDefaultValues");

  -[SBSystemApertureSettings keyLineAppearForSwoopTransition](self, "keyLineAppearForSwoopTransition");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "setBehaviorType:", 1);

  -[SBSystemApertureSettings keyLineAppearForSwoopTransition](self, "keyLineAppearForSwoopTransition");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "setDampingRatio:", 1.0);

  -[SBSystemApertureSettings keyLineAppearForSwoopTransition](self, "keyLineAppearForSwoopTransition");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "setResponse:", 0.75);

  -[SBSystemApertureSettings setActivityKeyLineColorEnabled:](self, "setActivityKeyLineColorEnabled:", 1);
  -[SBSystemApertureSettings setKeyLineAlpha:](self, "setKeyLineAlpha:", 0.35);
  -[SBSystemApertureSettings setKeyLineThickness:](self, "setKeyLineThickness:", 1.66666667);
  -[SBSystemApertureSettings setAdaptiveKeyLineThickness:](self, "setAdaptiveKeyLineThickness:", 1.66666667);
  -[SBSystemApertureSettings adaptiveKeyLineColorMatrix](self, "adaptiveKeyLineColorMatrix");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "setDefaultValues");

  -[SBSystemApertureSettings adaptiveKeyLineColorMatrix](self, "adaptiveKeyLineColorMatrix");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v293[0] = 0;
  v293[1] = 0;
  v294 = 1064396915;
  v295 = 0;
  v296 = 0;
  v297 = 1064396915;
  v298 = 0;
  v299 = 0;
  v300 = xmmword_1D0E8B650;
  v301 = 1039516303;
  objc_msgSend(v292, "setColorMatrix:", v293);

  -[SBSystemApertureSettings setKeyLineDarkToMixedMinLuma:](self, "setKeyLineDarkToMixedMinLuma:", 0.05);
  -[SBSystemApertureSettings setKeyLineMixedToDarkMaxLuma:](self, "setKeyLineMixedToDarkMaxLuma:", 0.05);
  -[SBSystemApertureSettings setKeyLineColorFixedLstar:](self, "setKeyLineColorFixedLstar:", 50.0);
  -[SBSystemApertureSettings setSuppressHidingOnClonedDisplayWhileEmpty:](self, "setSuppressHidingOnClonedDisplayWhileEmpty:", 0);
  -[SBSystemApertureSettings setSuppressHidingInSnapshotsWhileEmpty:](self, "setSuppressHidingInSnapshotsWhileEmpty:", 0);
  -[SBSystemApertureSettings setAlphaTransitionDurationOnClonedDisplay:](self, "setAlphaTransitionDurationOnClonedDisplay:", 0.15);
  -[SBSystemApertureSettings setHideRemotePrototypingFallbackPill:](self, "setHideRemotePrototypingFallbackPill:", 0);
  -[SBSystemApertureSettings setMinimumRequiredSymmetryInCompactLayoutMode:](self, "setMinimumRequiredSymmetryInCompactLayoutMode:", 0.75);
  -[SBSystemApertureSettings setPaddingFromScreenEdgeRequiringSymmetricLayout:](self, "setPaddingFromScreenEdgeRequiringSymmetricLayout:", 46.0);
  -[SBSystemApertureSettings setSuppressWhilePresentingControlCenter:](self, "setSuppressWhilePresentingControlCenter:", 0);
  -[SBSystemApertureSettings setElementShadowEnabled:](self, "setElementShadowEnabled:", 1);
  -[SBSystemApertureSettings setBackgroundBlurEnabled:](self, "setBackgroundBlurEnabled:", 1);
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
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
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
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  _QWORD v337[23];
  _QWORD v338[2];
  void *v339;
  _QWORD v340[2];
  _QWORD v341[7];
  _QWORD v342[21];
  _QWORD v343[6];
  _QWORD v344[8];
  void *v345;
  _QWORD v346[3];
  _QWORD v347[12];
  _QWORD v348[3];
  _QWORD v349[6];
  _QWORD v350[6];
  _QWORD v351[12];
  void *v352;
  _QWORD v353[2];
  _QWORD v354[6];
  _QWORD v355[2];
  _QWORD v356[4];
  _QWORD v357[2];
  void *v358;
  _QWORD v359[14];
  _QWORD v360[3];

  v360[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v360[0] = v294;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v360, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v336 = (void *)objc_claimAutoreleasedReturnValue();

  v334 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Highlight Transitions"), CFSTR("highlightTransitions"));
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v359[0] = v332;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Collision Progress"), CFSTR("boundsCollisionProgress"));
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "between:and:", 0.0, 1.0);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "precision:", 2);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v359[1] = v324;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inert Collapsing Layout Progress"), CFSTR("boundsCollapsingPhaseChangeProgress"));
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v322, "between:and:", 0.0, 1.0);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "precision:", 2);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v359[2] = v318;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inert Compensating Layout Progress"), CFSTR("boundsCompensatingPhaseChangeProgress"));
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "between:and:", 0.0, 1.0);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "precision:", 2);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v359[3] = v306;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Sensor Shadow Apex Progress"), CFSTR("sensorObscuringShadowApexProgress"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "between:and:", 0.0, 1.0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "precision:", 2);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v359[4] = v292;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Default Behavior Settings"), CFSTR("defaultInterfaceElementTransitionSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v359[5] = v6;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inert Default Behavior Settings"), CFSTR("inertInterfaceElementTransitionSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v359[6] = v7;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inert Collapsing Behavior Settings"), CFSTR("inertCollapsingInterfaceElementTransitionSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v359[7] = v8;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inert Compensating Behavior Settings"), CFSTR("inertCompensatingInterfaceElementTransitionSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v359[8] = v9;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("*->Compact Behavior Settings"), CFSTR("compactInterfaceElementTransitionSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v359[9] = v10;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("*->Minimal Behavior Settings"), CFSTR("minimalInterfaceElementTransitionSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v359[10] = v11;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("*->Custom Behavior Settings"), CFSTR("customInterfaceElementTransitionSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v359[11] = v12;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("User Pop to Custom Behavior Settings"), CFSTR("popToCustomInterfaceElementTransitionSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v359[12] = v13;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Element Content Behavior Settings"), CFSTR("elementContentTransitionSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v359[13] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v359, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v334, "sectionWithRows:title:", v15, CFSTR("Interface Element Transitions"));
  v335 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Oval Layout Animation Settings"), CFSTR("jindoBoundsOval"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v358 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v358, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v18, CFSTR("Resize Settings"));
  v333 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Make Sensor Shadow Visible"), CFSTR("sensorShadowVisible"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v357[0] = v20;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Sensor Shadow Opacity Factor"), CFSTR("sensorShadowOpacityFactor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 100.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v357[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v357, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v24, CFSTR("Content Settings"));
  v331 = (void *)objc_claimAutoreleasedReturnValue();

  v328 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Transition To Prominent Pill Settings"), CFSTR("transitionToProminentPillSettings"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v356[0] = v325;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prominent Pill Scale"), CFSTR("prominentPillScale"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "precision:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v356[1] = v27;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prominent Pill Content Scale"), CFSTR("prominentPillContentScale"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v356[2] = v30;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prominent Pill Vertical Offset"), CFSTR("prominentPillVerticalOffsetProportion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "between:and:", -1.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v356[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v356, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v328, "sectionWithRows:title:", v34, CFSTR("Prominent Pill"));
  v329 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius"), CFSTR("tallRectCornerRadius"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", 39.0, 56.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v355[0] = v37;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Width"), CFSTR("tallRectWidth"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 160.0, 180.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v355[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v355, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v40, CFSTR("Tall Rect"));
  v326 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Make Hit Rects Visible"), CFSTR("containerHitRectVisible"));
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Default Top Margin"), CFSTR("containerHitRectTopMarginDefault"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "precision:", 2);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Wide Top Margin"), CFSTR("containerHitRectTopMarginWide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "precision:", 2);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Margin"), CFSTR("containerHitRectHorizontalMargin"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.0, 100.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "precision:", 2);
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Margin Limit"), CFSTR("containerHitRectHorizontalMarginLimit"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "between:and:", 0.0, 100.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "precision:", 2);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Limit"), CFSTR("containerHitRectHorizontalLimit"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "between:and:", 0.0, 100.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "precision:", 2);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x1E0D83070];
  v354[0] = v293;
  v354[1] = v291;
  v354[2] = v290;
  v354[3] = v289;
  v354[4] = v288;
  v354[5] = v287;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v354, 6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sectionWithRows:title:", v52, CFSTR("Content Hit Testing"));
  v323 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Baby Split Bounds Settings"), CFSTR("mitosisSecondaryBoundsSettings"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v353[0] = v54;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby Headstart Delay"), CFSTR("mitosisHeadstartDelay"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "between:and:", 0.0, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "precision:", 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v353[1] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sectionWithRows:title:", v58, CFSTR("Mitosis"));
  v321 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Baby Recombination Y Bounds Settings"), CFSTR("recombinationSecondaryBoundsYSettings"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v352, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sectionWithRows:title:", v61, CFSTR("Mitosis Recombination"));
  v319 = (void *)objc_claimAutoreleasedReturnValue();

  v316 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shake Initial Kick Animation Settings"), CFSTR("jindoAuthErrorShakeInitialKick"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v351[0] = v312;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shake Settle Animation Settings"), CFSTR("jindoAuthErrorShakeSettle"));
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v351[1] = v307;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shake Stretch Out Animation Settings"), CFSTR("jindoAuthErrorStretchOut"));
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v351[2] = v302;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shake Stretch Settle Animation Settings"), CFSTR("jindoAuthErrorStretchSettle"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v351[3] = v296;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shake X Displacement"), CFSTR("shakeDisplacement"));
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "between:and:", -100.0, 100.0);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "precision:", 3);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v351[4] = v274;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shake Sensor Expand Width"), CFSTR("shakeSensorExpansion"));
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "between:and:", 0.0, 100.0);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "precision:", 3);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v351[5] = v255;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shake Sensor Expand Width"), CFSTR("shakeSensorExpansion"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "minValue:maxValue:", -50.0, 50.0);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v351[6] = v242;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shake Sensor Expand Offset"), CFSTR("shakeSensorOffset"));
  v235 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "between:and:", -100.0, 100.0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "precision:", 3);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v351[7] = v223;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shake Sensor Expand Offset"), CFSTR("shakeSensorOffset"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", -50.0, 50.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v351[8] = v63;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("First Shake Milestone"), CFSTR("firstShakeMilestone"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "between:and:", 0.0, 1.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "precision:", 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v351[9] = v66;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Second Shake Milestone"), CFSTR("secondShakeMilestone"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "between:and:", 0.0, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "precision:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v351[10] = v69;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Shake Ringer Bell"), CFSTR("shakeRingerBell"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v351[11] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v351, 12);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "sectionWithRows:title:", v71, CFSTR("Shake (Auth Error) Settings"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();

  v313 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Bump ScaleUp Anim. Settings"), CFSTR("bumpAnimationScaleUpSettings"));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v350[0] = v308;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Bump ScaleDown Anim. Settings"), CFSTR("bumpAnimationScaleDownSettings"));
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v350[1] = v303;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Bump Scale X"), CFSTR("bumpAnimationXScale"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "between:and:", 0.1, 1.5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "precision:", 4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v350[2] = v73;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Bump Scale X"), CFSTR("bumpAnimationXScale"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "minValue:maxValue:", 0.1, 1.5);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v350[3] = v75;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Bump Scale Y"), CFSTR("bumpAnimationYScale"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "between:and:", 0.1, 1.5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "precision:", 4);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v350[4] = v78;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Bump Scale Y"), CFSTR("bumpAnimationYScale"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minValue:maxValue:", 0.1, 1.5);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v350[5] = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v350, 6);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "sectionWithRows:title:", v81, CFSTR("Bump Animation"));
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  v309 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inflate ScaleUp Anim. Settings"), CFSTR("inflateAnimationScaleUpSettings"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v349[0] = v304;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inflate ScaleDown Anim. Settings"), CFSTR("inflateAnimationScaleDownSettings"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v349[1] = v298;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inflate Scale"), CFSTR("inflateAnimationScale"));
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "between:and:", 0.1, 5.0);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "precision:", 2);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v349[2] = v275;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inflate Vertical Offset"), CFSTR("inflateVerticalOffsetProportion"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "between:and:", -1.0, 1.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "precision:", 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v349[3] = v84;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inflate Content Scale"), CFSTR("inflateAnimationContentScale"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "between:and:", 0.1, 5.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "precision:", 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v349[4] = v87;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Expansion Begin Inflate Milestone"), CFSTR("expansionToCompactBeginInflationProgress"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "between:and:", 0.01, 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "precision:", 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v349[5] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v349, 6);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v309, "sectionWithRows:title:", v91, CFSTR("Inflate Animation"));
  v310 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pulse No Action Settings"), CFSTR("pulseNoActionSettings"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v348[0] = v93;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Indicator Enabled"), CFSTR("pulseIndicatorEnabled"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v348[1] = v94;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pulse Indicator Settings"), CFSTR("pulseIndicatorSettings"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v348[2] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v348, 3);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "sectionWithRows:title:", v96, CFSTR("Pulse Animation"));
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  v299 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Key Line"), CFSTR("keyLineEnabled"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v347[0] = v285;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Key Line Transition Animation Settings"), CFSTR("keyLineStyleTransition"));
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v347[1] = v281;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("[disabled?] Key Line Disappear to Inert Anim. Settings"), CFSTR("keyLineDisappearToInertTransition"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v347[2] = v276;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Key Line Appear for Swoop Anim. Settings"), CFSTR("keyLineAppearForSwoopTransition"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v347[3] = v270;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Key Line Session/Activity Colors"), CFSTR("activityKeyLineColorEnabled"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v347[4] = v263;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Key Line Alpha"), CFSTR("keyLineAlpha"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "between:and:", 0.0, 1.0);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "precision:", 2);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v347[5] = v243;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Key Line Thickness"), CFSTR("keyLineThickness"));
  v236 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "possibleValues:titles:", &unk_1E91CEF68, &unk_1E91CEF80);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v347[6] = v230;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Adaptive Key Line Thickness"), CFSTR("adaptiveKeyLineThickness"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "possibleValues:titles:", &unk_1E91CEF68, &unk_1E91CEF80);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v347[7] = v218;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Adaptive Key Line Color Matrix"), CFSTR("adaptiveKeyLineColorMatrix"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v347[8] = v213;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dark To Mixed Min Luma"), CFSTR("keyLineDarkToMixedMinLuma"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "between:and:", 0.0, 1.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "precision:", 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v347[9] = v99;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mixed to Dark Max Luma"), CFSTR("keyLineMixedToDarkMaxLuma"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "between:and:", 0.0, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "precision:", 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v347[10] = v102;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Color Key Fixed Lightness"), CFSTR("keyLineColorFixedLstar"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "between:and:", 0.0, 100.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "precision:", 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v347[11] = v105;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v347, 12);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "sectionWithRows:title:", v106, CFSTR("Key Line"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Hiding for Mirroring/Recording"), CFSTR("suppressHidingOnClonedDisplayWhileEmpty"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v346[0] = v108;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Hiding for Screenshots"), CFSTR("suppressHidingInSnapshotsWhileEmpty"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v346[1] = v109;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alpha Transition Duration"), CFSTR("alphaTransitionDurationOnClonedDisplay"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "between:and:", 0.0, 1.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "precision:", 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v346[2] = v112;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v346, 3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "sectionWithRows:title:", v113, CFSTR("Screen Recording/Mirroring/Screenshots"));
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Fallback Pill for Remote Prototyping"), CFSTR("hideRemotePrototypingFallbackPill"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v345 = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v345, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "sectionWithRows:title:", v116, CFSTR("Remote Prototyping"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  v277 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("X Rubberbanding"), CFSTR("resizeGestureXRubberbanding"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "between:and:", 0.0, 2.0);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "precision:", 2);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v344[0] = v257;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Rubberbanding (Stretch)"), CFSTR("resizeGestureYRubberbandingStretch"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "between:and:", 0.0, 2.0);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "precision:", 2);
  v237 = (id)objc_claimAutoreleasedReturnValue();
  v344[1] = v237;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Rubberbanding (Compress)"), CFSTR("resizeGestureYRubberbandingCompress"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "between:and:", 0.0, 2.0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "precision:", 2);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v344[2] = v219;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Begin 1-1 Tracking"), CFSTR("resizeGestureYRangeBeginTracking"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "between:and:", 0.0, 2.0);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "precision:", 2);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v344[3] = v208;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y End 1-1 Tracking"), CFSTR("resizeGestureYRangeEndTracking"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "between:and:", 0.0, 2.0);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "precision:", 2);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v344[4] = v202;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Slide Up Factor"), CFSTR("resizeGestureUpOffsetFactor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "between:and:", 0.0, 100.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "precision:", 2);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v344[5] = v119;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Edge Padding"), CFSTR("resizeGestureMinEdgePadding"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "between:and:", 0.0, 100.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "precision:", 2);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v344[6] = v122;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Compress Sensor X Safety Margin"), CFSTR("resizeGestureSensorXSafetyMargin"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "between:and:", 0.0, 100.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "precision:", 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v344[7] = v125;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v344, 8);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "sectionWithRows:title:", v126, CFSTR("Resize Gesture"));
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  v272 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby Translate Stretch"), CFSTR("recombineGestureTranslateFactorStretch"));
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "between:and:", 0.0, 300.0);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "precision:", 2);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v343[0] = v252;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby Translate Compress"), CFSTR("recombineGestureTranslateFactorCompress"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "between:and:", 0.0, 300.0);
  v238 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "precision:", 2);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v343[1] = v232;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby X Scale Stretch"), CFSTR("recombineGestureXScaleFactorStretch"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "between:and:", 0.0, 1.0);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "precision:", 2);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v343[2] = v215;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby X Scale Compress"), CFSTR("recombineGestureXScaleFactorCompress"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "between:and:", 0.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "precision:", 2);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v343[3] = v129;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby Rubberbanding Stretch"), CFSTR("recombineGestureXRubberbandingStretch"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "between:and:", 0.0, 1.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "precision:", 2);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v343[4] = v132;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Baby Rubberbanding Compress"), CFSTR("recombineGestureXRubberbandingCompress"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "between:and:", 0.0, 1.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "precision:", 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v343[5] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v343, 6);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "sectionWithRows:title:", v136, CFSTR("Recombine Gesture"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  v253 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Rebound Delay"), CFSTR("acceptanceUpBounceReboundDelay"));
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "between:and:", 0.0, 2.0);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "precision:", 2);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v342[0] = v246;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Item Appearance Delay Offset"), CFSTR("acceptanceUpBounceItemAppearanceDelayOffset"));
  v239 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "between:and:", 0.0, 2.0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "precision:", 2);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v342[1] = v227;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Finishing Delay"), CFSTR("acceptanceUpBounceFinishingDelay"));
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "between:and:", 0.0, 2.0);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "precision:", 2);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v342[2] = v211;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Y Stretch"), CFSTR("acceptanceUpBounceYStretch"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "between:and:", 0.0, 500.0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "precision:", 1);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v342[3] = v205;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Y Down Stretch"), CFSTR("acceptanceUpBounceYDownStretch"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "between:and:", 0.0, 500.0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "precision:", 1);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v342[4] = v200;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up X Padding"), CFSTR("acceptanceUpBounceXPadding"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "between:and:", 0.0, 500.0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "precision:", 1);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v342[5] = v197;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up Overshoot Scale"), CFSTR("acceptanceUpBounceFixedOvershootScaling"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "between:and:", 0.0, 2.0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "precision:", 3);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v342[6] = v194;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Up Stretch Settings"), CFSTR("acceptanceBounceStretch"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v342[7] = v193;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Up Rebound Settings"), CFSTR("acceptanceBounceRebound"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v342[8] = v192;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Up Layout Settings"), CFSTR("acceptanceBounceLayout"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v342[9] = v191;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Up/Side Velocity Threshld"), CFSTR("acceptanceSideBounceXVelocityThreshold"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "between:and:", 0.0, 10000.0);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "precision:", 1);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v342[10] = v188;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side Rebound Delay"), CFSTR("acceptanceSideBounceReboundDelay"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "between:and:", 0.0, 2.0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "precision:", 2);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v342[11] = v185;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side Item Appearance Delay Offset"), CFSTR("acceptanceSideBounceItemAppearanceDelayOffset"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "between:and:", 0.0, 2.0);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "precision:", 2);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v342[12] = v182;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side Finishing Delay"), CFSTR("acceptanceSideBounceFinishingDelay"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "between:and:", 0.0, 2.0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "precision:", 2);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v342[13] = v179;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side X Stretch"), CFSTR("acceptanceSideBounceXStretch"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "between:and:", 0.0, 500.0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "precision:", 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v342[14] = v176;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side Y Padding"), CFSTR("acceptanceSideBounceYPadding"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "between:and:", 0.0, 500.0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "precision:", 1);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v342[15] = v173;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side X Shake Sensor Expansion"), CFSTR("acceptanceSideBounceXSensorExpansion"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "between:and:", -500.0, 500.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "precision:", 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v342[16] = v139;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Side X Shake Sensor Offset"), CFSTR("acceptanceSideBounceXSensorOffset"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "between:and:", -500.0, 500.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "precision:", 1);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v342[17] = v142;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Side Stretch Settings"), CFSTR("acceptanceBounceSideStretch"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v342[18] = v143;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Side Rebound Settings"), CFSTR("acceptanceBounceSideRebound"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v342[19] = v144;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Side Layout Settings"), CFSTR("acceptanceBounceSideLayout"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v342[20] = v145;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v342, 21);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "sectionWithRows:title:", v146, CFSTR("Acceptance Bounce"));
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  v267 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("X increase"), CFSTR("ejectionXStretch"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "between:and:", 0.0, 300.0);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "precision:", 2);
  v240 = (id)objc_claimAutoreleasedReturnValue();
  v341[0] = v240;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y increase"), CFSTR("ejectionYStretch"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "between:and:", 0.0, 300.0);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "precision:", 2);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v341[1] = v222;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Up Offset"), CFSTR("ejectionYUpOffset"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "between:and:", -300.0, 300.0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "precision:", 2);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v341[2] = v147;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("ejectionStretchDuration"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "between:and:", 0.0, 1.0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "precision:", 2);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v341[3] = v150;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Corner Radius"), CFSTR("ejectionMaxCornerRadius"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "between:and:", 0.0, 200.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "precision:", 2);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v341[4] = v153;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Stretch Settings"), CFSTR("ejectionStretchSettings"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v341[5] = v154;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Contraction Settings"), CFSTR("ejectionContractionSettings"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v341[6] = v155;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v341, 7);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "sectionWithRows:title:", v156, CFSTR("Ejection Stretch"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  v157 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Min. required"), CFSTR("minimumRequiredSymmetryInCompactLayoutMode"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "minValue:maxValue:", 0.25, 1.0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v340[0] = v159;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Max symmetric padding"), CFSTR("paddingFromScreenEdgeRequiringSymmetricLayout"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "minValue:maxValue:", 0.0, 100.0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v340[1] = v161;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v340, 2);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "sectionWithRows:title:", v162, CFSTR("Compact Layout Symmetry"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Suppress during Control Center Presentation"), CFSTR("suppressWhilePresentingControlCenter"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = v164;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v339, 1);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "sectionWithRows:title:", v165, CFSTR("Suppression"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Element Shadow"), CFSTR("elementShadowEnabled"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v338[0] = v167;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Background Blur"), CFSTR("backgroundBlurEnabled"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v338[1] = v168;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v338, 2);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "sectionWithRows:title:", v169, CFSTR("Background Separation"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  v337[0] = v336;
  v337[1] = v335;
  v337[2] = v333;
  v337[3] = v331;
  v337[4] = v329;
  v337[5] = v326;
  v337[6] = v323;
  v337[7] = v321;
  v337[8] = v319;
  v337[9] = v317;
  v337[10] = v314;
  v337[11] = v310;
  v337[12] = v305;
  v337[13] = v300;
  v337[14] = v286;
  v337[15] = v282;
  v337[16] = v278;
  v337[17] = v273;
  v337[18] = v254;
  v337[19] = v268;
  v337[20] = v261;
  v337[21] = v248;
  v337[22] = v170;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v337, 23);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("System Aperture"), v171);
  v241 = (id)objc_claimAutoreleasedReturnValue();

  return v241;
}

- (double)resizeGestureXRubberbanding
{
  return self->_resizeGestureXRubberbanding;
}

- (void)setResizeGestureXRubberbanding:(double)a3
{
  self->_resizeGestureXRubberbanding = a3;
}

- (double)resizeGestureYRubberbandingStretch
{
  return self->_resizeGestureYRubberbandingStretch;
}

- (void)setResizeGestureYRubberbandingStretch:(double)a3
{
  self->_resizeGestureYRubberbandingStretch = a3;
}

- (double)resizeGestureYRubberbandingCompress
{
  return self->_resizeGestureYRubberbandingCompress;
}

- (void)setResizeGestureYRubberbandingCompress:(double)a3
{
  self->_resizeGestureYRubberbandingCompress = a3;
}

- (double)resizeGestureYRangeBeginTracking
{
  return self->_resizeGestureYRangeBeginTracking;
}

- (void)setResizeGestureYRangeBeginTracking:(double)a3
{
  self->_resizeGestureYRangeBeginTracking = a3;
}

- (double)resizeGestureYRangeEndTracking
{
  return self->_resizeGestureYRangeEndTracking;
}

- (void)setResizeGestureYRangeEndTracking:(double)a3
{
  self->_resizeGestureYRangeEndTracking = a3;
}

- (double)resizeGestureUpOffsetFactor
{
  return self->_resizeGestureUpOffsetFactor;
}

- (void)setResizeGestureUpOffsetFactor:(double)a3
{
  self->_resizeGestureUpOffsetFactor = a3;
}

- (double)resizeGestureMinEdgePadding
{
  return self->_resizeGestureMinEdgePadding;
}

- (void)setResizeGestureMinEdgePadding:(double)a3
{
  self->_resizeGestureMinEdgePadding = a3;
}

- (double)resizeGestureSensorXSafetyMargin
{
  return self->_resizeGestureSensorXSafetyMargin;
}

- (void)setResizeGestureSensorXSafetyMargin:(double)a3
{
  self->_resizeGestureSensorXSafetyMargin = a3;
}

- (double)recombineGestureXRubberbandingStretch
{
  return self->_recombineGestureXRubberbandingStretch;
}

- (void)setRecombineGestureXRubberbandingStretch:(double)a3
{
  self->_recombineGestureXRubberbandingStretch = a3;
}

- (double)recombineGestureXRubberbandingCompress
{
  return self->_recombineGestureXRubberbandingCompress;
}

- (void)setRecombineGestureXRubberbandingCompress:(double)a3
{
  self->_recombineGestureXRubberbandingCompress = a3;
}

- (double)recombineGestureXScaleFactorStretch
{
  return self->_recombineGestureXScaleFactorStretch;
}

- (void)setRecombineGestureXScaleFactorStretch:(double)a3
{
  self->_recombineGestureXScaleFactorStretch = a3;
}

- (double)recombineGestureXScaleFactorCompress
{
  return self->_recombineGestureXScaleFactorCompress;
}

- (void)setRecombineGestureXScaleFactorCompress:(double)a3
{
  self->_recombineGestureXScaleFactorCompress = a3;
}

- (double)recombineGestureTranslateFactorStretch
{
  return self->_recombineGestureTranslateFactorStretch;
}

- (void)setRecombineGestureTranslateFactorStretch:(double)a3
{
  self->_recombineGestureTranslateFactorStretch = a3;
}

- (double)recombineGestureTranslateFactorCompress
{
  return self->_recombineGestureTranslateFactorCompress;
}

- (void)setRecombineGestureTranslateFactorCompress:(double)a3
{
  self->_recombineGestureTranslateFactorCompress = a3;
}

- (double)acceptanceUpBounceReboundDelay
{
  return self->_acceptanceUpBounceReboundDelay;
}

- (void)setAcceptanceUpBounceReboundDelay:(double)a3
{
  self->_acceptanceUpBounceReboundDelay = a3;
}

- (double)acceptanceUpBounceItemAppearanceDelayOffset
{
  return self->_acceptanceUpBounceItemAppearanceDelayOffset;
}

- (void)setAcceptanceUpBounceItemAppearanceDelayOffset:(double)a3
{
  self->_acceptanceUpBounceItemAppearanceDelayOffset = a3;
}

- (double)acceptanceUpBounceXPadding
{
  return self->_acceptanceUpBounceXPadding;
}

- (void)setAcceptanceUpBounceXPadding:(double)a3
{
  self->_acceptanceUpBounceXPadding = a3;
}

- (double)acceptanceUpBounceYStretch
{
  return self->_acceptanceUpBounceYStretch;
}

- (void)setAcceptanceUpBounceYStretch:(double)a3
{
  self->_acceptanceUpBounceYStretch = a3;
}

- (double)acceptanceUpBounceYDownStretch
{
  return self->_acceptanceUpBounceYDownStretch;
}

- (void)setAcceptanceUpBounceYDownStretch:(double)a3
{
  self->_acceptanceUpBounceYDownStretch = a3;
}

- (double)acceptanceUpBounceFixedOvershootScaling
{
  return self->_acceptanceUpBounceFixedOvershootScaling;
}

- (void)setAcceptanceUpBounceFixedOvershootScaling:(double)a3
{
  self->_acceptanceUpBounceFixedOvershootScaling = a3;
}

- (double)acceptanceUpBounceFinishingDelay
{
  return self->_acceptanceUpBounceFinishingDelay;
}

- (void)setAcceptanceUpBounceFinishingDelay:(double)a3
{
  self->_acceptanceUpBounceFinishingDelay = a3;
}

- (SBFFluidBehaviorSettings)acceptanceBounceStretch
{
  return self->_acceptanceBounceStretch;
}

- (void)setAcceptanceBounceStretch:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceStretch, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceRebound
{
  return self->_acceptanceBounceRebound;
}

- (void)setAcceptanceBounceRebound:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceRebound, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceLayout
{
  return self->_acceptanceBounceLayout;
}

- (void)setAcceptanceBounceLayout:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceLayout, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceLayoutY
{
  return self->_acceptanceBounceLayoutY;
}

- (void)setAcceptanceBounceLayoutY:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceLayoutY, a3);
}

- (double)acceptanceSideBounceReboundDelay
{
  return self->_acceptanceSideBounceReboundDelay;
}

- (void)setAcceptanceSideBounceReboundDelay:(double)a3
{
  self->_acceptanceSideBounceReboundDelay = a3;
}

- (double)acceptanceSideBounceItemAppearanceDelayOffset
{
  return self->_acceptanceSideBounceItemAppearanceDelayOffset;
}

- (void)setAcceptanceSideBounceItemAppearanceDelayOffset:(double)a3
{
  self->_acceptanceSideBounceItemAppearanceDelayOffset = a3;
}

- (double)acceptanceSideBounceXStretch
{
  return self->_acceptanceSideBounceXStretch;
}

- (void)setAcceptanceSideBounceXStretch:(double)a3
{
  self->_acceptanceSideBounceXStretch = a3;
}

- (double)acceptanceSideBounceYPadding
{
  return self->_acceptanceSideBounceYPadding;
}

- (void)setAcceptanceSideBounceYPadding:(double)a3
{
  self->_acceptanceSideBounceYPadding = a3;
}

- (double)acceptanceSideBounceXVelocityThreshold
{
  return self->_acceptanceSideBounceXVelocityThreshold;
}

- (void)setAcceptanceSideBounceXVelocityThreshold:(double)a3
{
  self->_acceptanceSideBounceXVelocityThreshold = a3;
}

- (double)acceptanceSideBounceXSensorExpansion
{
  return self->_acceptanceSideBounceXSensorExpansion;
}

- (void)setAcceptanceSideBounceXSensorExpansion:(double)a3
{
  self->_acceptanceSideBounceXSensorExpansion = a3;
}

- (double)acceptanceSideBounceXSensorOffset
{
  return self->_acceptanceSideBounceXSensorOffset;
}

- (void)setAcceptanceSideBounceXSensorOffset:(double)a3
{
  self->_acceptanceSideBounceXSensorOffset = a3;
}

- (double)acceptanceSideBounceFinishingDelay
{
  return self->_acceptanceSideBounceFinishingDelay;
}

- (void)setAcceptanceSideBounceFinishingDelay:(double)a3
{
  self->_acceptanceSideBounceFinishingDelay = a3;
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideStretch
{
  return self->_acceptanceBounceSideStretch;
}

- (void)setAcceptanceBounceSideStretch:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceSideStretch, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideRebound
{
  return self->_acceptanceBounceSideRebound;
}

- (void)setAcceptanceBounceSideRebound:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceSideRebound, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideLayout
{
  return self->_acceptanceBounceSideLayout;
}

- (void)setAcceptanceBounceSideLayout:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayout, a3);
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideLayoutY
{
  return self->_acceptanceBounceSideLayoutY;
}

- (void)setAcceptanceBounceSideLayoutY:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayoutY, a3);
}

- (double)ejectionXStretch
{
  return self->_ejectionXStretch;
}

- (void)setEjectionXStretch:(double)a3
{
  self->_ejectionXStretch = a3;
}

- (double)ejectionYStretch
{
  return self->_ejectionYStretch;
}

- (void)setEjectionYStretch:(double)a3
{
  self->_ejectionYStretch = a3;
}

- (double)ejectionYUpOffset
{
  return self->_ejectionYUpOffset;
}

- (void)setEjectionYUpOffset:(double)a3
{
  self->_ejectionYUpOffset = a3;
}

- (double)ejectionStretchDuration
{
  return self->_ejectionStretchDuration;
}

- (void)setEjectionStretchDuration:(double)a3
{
  self->_ejectionStretchDuration = a3;
}

- (double)ejectionMaxCornerRadius
{
  return self->_ejectionMaxCornerRadius;
}

- (void)setEjectionMaxCornerRadius:(double)a3
{
  self->_ejectionMaxCornerRadius = a3;
}

- (SBFFluidBehaviorSettings)ejectionStretchSettings
{
  return self->_ejectionStretchSettings;
}

- (void)setEjectionStretchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_ejectionStretchSettings, a3);
}

- (SBFFluidBehaviorSettings)ejectionContractionSettings
{
  return self->_ejectionContractionSettings;
}

- (void)setEjectionContractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_ejectionContractionSettings, a3);
}

- (BOOL)highlightTransitions
{
  return self->_highlightTransitions;
}

- (void)setHighlightTransitions:(BOOL)a3
{
  self->_highlightTransitions = a3;
}

- (double)boundsCollisionProgress
{
  return self->_boundsCollisionProgress;
}

- (void)setBoundsCollisionProgress:(double)a3
{
  self->_boundsCollisionProgress = a3;
}

- (double)boundsCollapsingPhaseChangeProgress
{
  return self->_boundsCollapsingPhaseChangeProgress;
}

- (void)setBoundsCollapsingPhaseChangeProgress:(double)a3
{
  self->_boundsCollapsingPhaseChangeProgress = a3;
}

- (double)boundsCompensatingPhaseChangeProgress
{
  return self->_boundsCompensatingPhaseChangeProgress;
}

- (void)setBoundsCompensatingPhaseChangeProgress:(double)a3
{
  self->_boundsCompensatingPhaseChangeProgress = a3;
}

- (void)setSensorObscuringShadowApexProgress:(double)a3
{
  self->_sensorObscuringShadowApexProgress = a3;
}

- (void)setDefaultInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultInterfaceElementTransitionSettings, a3);
}

- (void)setInertInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inertInterfaceElementTransitionSettings, a3);
}

- (void)setInertCollapsingInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inertCollapsingInterfaceElementTransitionSettings, a3);
}

- (SBSAInterfaceElementInertCompensatingTransitionSettings)inertCompensatingInterfaceElementTransitionSettings
{
  return self->_inertCompensatingInterfaceElementTransitionSettings;
}

- (void)setInertCompensatingInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inertCompensatingInterfaceElementTransitionSettings, a3);
}

- (SBSAInterfaceElementTransitionSettings)compactInterfaceElementTransitionSettings
{
  return self->_compactInterfaceElementTransitionSettings;
}

- (void)setCompactInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_compactInterfaceElementTransitionSettings, a3);
}

- (SBSAInterfaceElementTransitionSettings)minimalInterfaceElementTransitionSettings
{
  return self->_minimalInterfaceElementTransitionSettings;
}

- (void)setMinimalInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_minimalInterfaceElementTransitionSettings, a3);
}

- (SBSAInterfaceElementTransitionSettings)customInterfaceElementTransitionSettings
{
  return self->_customInterfaceElementTransitionSettings;
}

- (void)setCustomInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_customInterfaceElementTransitionSettings, a3);
}

- (SBSAInterfaceElementTransitionSettings)popToCustomInterfaceElementTransitionSettings
{
  return self->_popToCustomInterfaceElementTransitionSettings;
}

- (void)setPopToCustomInterfaceElementTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_popToCustomInterfaceElementTransitionSettings, a3);
}

- (SBSAElementContentTransitionSettings)elementContentTransitionSettings
{
  return self->_elementContentTransitionSettings;
}

- (void)setElementContentTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_elementContentTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)contentInteractionBeginBehaviorSettings
{
  return self->_contentInteractionBeginBehaviorSettings;
}

- (void)setContentInteractionBeginBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentInteractionBeginBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)jindoBoundsOval
{
  return self->_jindoBoundsOval;
}

- (void)setJindoBoundsOval:(id)a3
{
  objc_storeStrong((id *)&self->_jindoBoundsOval, a3);
}

- (BOOL)isSensorShadowVisible
{
  return self->_sensorShadowVisible;
}

- (void)setSensorShadowVisible:(BOOL)a3
{
  self->_sensorShadowVisible = a3;
}

- (double)sensorShadowOpacityFactor
{
  return self->_sensorShadowOpacityFactor;
}

- (void)setSensorShadowOpacityFactor:(double)a3
{
  self->_sensorShadowOpacityFactor = a3;
}

- (BOOL)isContainerHitRectVisible
{
  return self->_containerHitRectVisible;
}

- (void)setContainerHitRectVisible:(BOOL)a3
{
  self->_containerHitRectVisible = a3;
}

- (double)containerHitRectTopMarginDefault
{
  return self->_containerHitRectTopMarginDefault;
}

- (void)setContainerHitRectTopMarginDefault:(double)a3
{
  self->_containerHitRectTopMarginDefault = a3;
}

- (double)containerHitRectTopMarginWide
{
  return self->_containerHitRectTopMarginWide;
}

- (void)setContainerHitRectTopMarginWide:(double)a3
{
  self->_containerHitRectTopMarginWide = a3;
}

- (double)containerHitRectHorizontalMargin
{
  return self->_containerHitRectHorizontalMargin;
}

- (void)setContainerHitRectHorizontalMargin:(double)a3
{
  self->_containerHitRectHorizontalMargin = a3;
}

- (double)containerHitRectHorizontalMarginLimit
{
  return self->_containerHitRectHorizontalMarginLimit;
}

- (void)setContainerHitRectHorizontalMarginLimit:(double)a3
{
  self->_containerHitRectHorizontalMarginLimit = a3;
}

- (double)containerHitRectHorizontalLimit
{
  return self->_containerHitRectHorizontalLimit;
}

- (void)setContainerHitRectHorizontalLimit:(double)a3
{
  self->_containerHitRectHorizontalLimit = a3;
}

- (SBFFluidBehaviorSettings)mitosisSecondaryBoundsSettings
{
  return self->_mitosisSecondaryBoundsSettings;
}

- (void)setMitosisSecondaryBoundsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mitosisSecondaryBoundsSettings, a3);
}

- (double)mitosisHeadstartDelay
{
  return self->_mitosisHeadstartDelay;
}

- (void)setMitosisHeadstartDelay:(double)a3
{
  self->_mitosisHeadstartDelay = a3;
}

- (SBFFluidBehaviorSettings)recombinationSecondaryBoundsYSettings
{
  return self->_recombinationSecondaryBoundsYSettings;
}

- (void)setRecombinationSecondaryBoundsYSettings:(id)a3
{
  objc_storeStrong((id *)&self->_recombinationSecondaryBoundsYSettings, a3);
}

- (SBFFluidBehaviorSettings)jindoAuthErrorShakeInitialKick
{
  return self->_jindoAuthErrorShakeInitialKick;
}

- (void)setJindoAuthErrorShakeInitialKick:(id)a3
{
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeInitialKick, a3);
}

- (SBFFluidBehaviorSettings)jindoAuthErrorShakeSettle
{
  return self->_jindoAuthErrorShakeSettle;
}

- (void)setJindoAuthErrorShakeSettle:(id)a3
{
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeSettle, a3);
}

- (SBFFluidBehaviorSettings)jindoAuthErrorStretchOut
{
  return self->_jindoAuthErrorStretchOut;
}

- (void)setJindoAuthErrorStretchOut:(id)a3
{
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchOut, a3);
}

- (SBFFluidBehaviorSettings)jindoAuthErrorStretchSettle
{
  return self->_jindoAuthErrorStretchSettle;
}

- (void)setJindoAuthErrorStretchSettle:(id)a3
{
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchSettle, a3);
}

- (double)shakeDisplacement
{
  return self->_shakeDisplacement;
}

- (void)setShakeDisplacement:(double)a3
{
  self->_shakeDisplacement = a3;
}

- (double)shakeSensorExpansion
{
  return self->_shakeSensorExpansion;
}

- (void)setShakeSensorExpansion:(double)a3
{
  self->_shakeSensorExpansion = a3;
}

- (double)shakeSensorOffset
{
  return self->_shakeSensorOffset;
}

- (void)setShakeSensorOffset:(double)a3
{
  self->_shakeSensorOffset = a3;
}

- (double)firstShakeMilestone
{
  return self->_firstShakeMilestone;
}

- (void)setFirstShakeMilestone:(double)a3
{
  self->_firstShakeMilestone = a3;
}

- (double)secondShakeMilestone
{
  return self->_secondShakeMilestone;
}

- (void)setSecondShakeMilestone:(double)a3
{
  self->_secondShakeMilestone = a3;
}

- (BOOL)shakeRingerBell
{
  return self->_shakeRingerBell;
}

- (void)setShakeRingerBell:(BOOL)a3
{
  self->_shakeRingerBell = a3;
}

- (SBFFluidBehaviorSettings)bumpAnimationScaleUpSettings
{
  return self->_bumpAnimationScaleUpSettings;
}

- (void)setBumpAnimationScaleUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bumpAnimationScaleUpSettings, a3);
}

- (SBFFluidBehaviorSettings)bumpAnimationScaleDownSettings
{
  return self->_bumpAnimationScaleDownSettings;
}

- (void)setBumpAnimationScaleDownSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bumpAnimationScaleDownSettings, a3);
}

- (double)bumpAnimationXScale
{
  return self->_bumpAnimationXScale;
}

- (void)setBumpAnimationXScale:(double)a3
{
  self->_bumpAnimationXScale = a3;
}

- (double)bumpAnimationYScale
{
  return self->_bumpAnimationYScale;
}

- (void)setBumpAnimationYScale:(double)a3
{
  self->_bumpAnimationYScale = a3;
}

- (SBFFluidBehaviorSettings)inflateAnimationScaleUpSettings
{
  return self->_inflateAnimationScaleUpSettings;
}

- (void)setInflateAnimationScaleUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inflateAnimationScaleUpSettings, a3);
}

- (SBFFluidBehaviorSettings)inflateAnimationScaleDownSettings
{
  return self->_inflateAnimationScaleDownSettings;
}

- (void)setInflateAnimationScaleDownSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inflateAnimationScaleDownSettings, a3);
}

- (double)inflateAnimationScale
{
  return self->_inflateAnimationScale;
}

- (void)setInflateAnimationScale:(double)a3
{
  self->_inflateAnimationScale = a3;
}

- (double)inflateAnimationContentScale
{
  return self->_inflateAnimationContentScale;
}

- (void)setInflateAnimationContentScale:(double)a3
{
  self->_inflateAnimationContentScale = a3;
}

- (double)inflateVerticalOffsetProportion
{
  return self->_inflateVerticalOffsetProportion;
}

- (void)setInflateVerticalOffsetProportion:(double)a3
{
  self->_inflateVerticalOffsetProportion = a3;
}

- (double)expansionToCompactBeginInflationProgress
{
  return self->_expansionToCompactBeginInflationProgress;
}

- (void)setExpansionToCompactBeginInflationProgress:(double)a3
{
  self->_expansionToCompactBeginInflationProgress = a3;
}

- (SBFFluidBehaviorSettings)transitionToProminentPillSettings
{
  return self->_transitionToProminentPillSettings;
}

- (void)setTransitionToProminentPillSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transitionToProminentPillSettings, a3);
}

- (double)prominentPillScale
{
  return self->_prominentPillScale;
}

- (void)setProminentPillScale:(double)a3
{
  self->_prominentPillScale = a3;
}

- (double)prominentPillContentScale
{
  return self->_prominentPillContentScale;
}

- (void)setProminentPillContentScale:(double)a3
{
  self->_prominentPillContentScale = a3;
}

- (double)prominentPillVerticalOffsetProportion
{
  return self->_prominentPillVerticalOffsetProportion;
}

- (void)setProminentPillVerticalOffsetProportion:(double)a3
{
  self->_prominentPillVerticalOffsetProportion = a3;
}

- (double)tallRectCornerRadius
{
  return self->_tallRectCornerRadius;
}

- (void)setTallRectCornerRadius:(double)a3
{
  self->_tallRectCornerRadius = a3;
}

- (double)tallRectWidth
{
  return self->_tallRectWidth;
}

- (void)setTallRectWidth:(double)a3
{
  self->_tallRectWidth = a3;
}

- (SBSystemAperturePulseSettings)pulseNoActionSettings
{
  return self->_pulseNoActionSettings;
}

- (void)setPulseNoActionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pulseNoActionSettings, a3);
}

- (void)setPulseIndicatorEnabled:(BOOL)a3
{
  self->_pulseIndicatorEnabled = a3;
}

- (SBSystemAperturePulseSettings)pulseIndicatorSettings
{
  return self->_pulseIndicatorSettings;
}

- (void)setPulseIndicatorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pulseIndicatorSettings, a3);
}

- (BOOL)keyLineEnabled
{
  return self->_keyLineEnabled;
}

- (void)setKeyLineEnabled:(BOOL)a3
{
  self->_keyLineEnabled = a3;
}

- (void)setKeyLineStyleTransition:(id)a3
{
  objc_storeStrong((id *)&self->_keyLineStyleTransition, a3);
}

- (SBFFluidBehaviorSettings)keyLineDisappearToInertTransition
{
  return self->_keyLineDisappearToInertTransition;
}

- (void)setKeyLineDisappearToInertTransition:(id)a3
{
  objc_storeStrong((id *)&self->_keyLineDisappearToInertTransition, a3);
}

- (SBFFluidBehaviorSettings)keyLineAppearForSwoopTransition
{
  return self->_keyLineAppearForSwoopTransition;
}

- (void)setKeyLineAppearForSwoopTransition:(id)a3
{
  objc_storeStrong((id *)&self->_keyLineAppearForSwoopTransition, a3);
}

- (BOOL)activityKeyLineColorEnabled
{
  return self->_activityKeyLineColorEnabled;
}

- (void)setActivityKeyLineColorEnabled:(BOOL)a3
{
  self->_activityKeyLineColorEnabled = a3;
}

- (double)keyLineAlpha
{
  return self->_keyLineAlpha;
}

- (void)setKeyLineAlpha:(double)a3
{
  self->_keyLineAlpha = a3;
}

- (double)keyLineThickness
{
  return self->_keyLineThickness;
}

- (void)setKeyLineThickness:(double)a3
{
  self->_keyLineThickness = a3;
}

- (double)adaptiveKeyLineThickness
{
  return self->_adaptiveKeyLineThickness;
}

- (void)setAdaptiveKeyLineThickness:(double)a3
{
  self->_adaptiveKeyLineThickness = a3;
}

- (SBFCAColorMatrixSettings)adaptiveKeyLineColorMatrix
{
  return self->_adaptiveKeyLineColorMatrix;
}

- (void)setAdaptiveKeyLineColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_adaptiveKeyLineColorMatrix, a3);
}

- (double)keyLineDarkToMixedMinLuma
{
  return self->_keyLineDarkToMixedMinLuma;
}

- (void)setKeyLineDarkToMixedMinLuma:(double)a3
{
  self->_keyLineDarkToMixedMinLuma = a3;
}

- (double)keyLineMixedToDarkMaxLuma
{
  return self->_keyLineMixedToDarkMaxLuma;
}

- (void)setKeyLineMixedToDarkMaxLuma:(double)a3
{
  self->_keyLineMixedToDarkMaxLuma = a3;
}

- (double)keyLineColorFixedLstar
{
  return self->_keyLineColorFixedLstar;
}

- (void)setKeyLineColorFixedLstar:(double)a3
{
  self->_keyLineColorFixedLstar = a3;
}

- (BOOL)suppressHidingOnClonedDisplayWhileEmpty
{
  return self->_suppressHidingOnClonedDisplayWhileEmpty;
}

- (void)setSuppressHidingOnClonedDisplayWhileEmpty:(BOOL)a3
{
  self->_suppressHidingOnClonedDisplayWhileEmpty = a3;
}

- (BOOL)suppressHidingInSnapshotsWhileEmpty
{
  return self->_suppressHidingInSnapshotsWhileEmpty;
}

- (void)setSuppressHidingInSnapshotsWhileEmpty:(BOOL)a3
{
  self->_suppressHidingInSnapshotsWhileEmpty = a3;
}

- (double)alphaTransitionDurationOnClonedDisplay
{
  return self->_alphaTransitionDurationOnClonedDisplay;
}

- (void)setAlphaTransitionDurationOnClonedDisplay:(double)a3
{
  self->_alphaTransitionDurationOnClonedDisplay = a3;
}

- (void)setHideRemotePrototypingFallbackPill:(BOOL)a3
{
  self->_hideRemotePrototypingFallbackPill = a3;
}

- (double)minimumRequiredSymmetryInCompactLayoutMode
{
  return self->_minimumRequiredSymmetryInCompactLayoutMode;
}

- (void)setMinimumRequiredSymmetryInCompactLayoutMode:(double)a3
{
  self->_minimumRequiredSymmetryInCompactLayoutMode = a3;
}

- (double)paddingFromScreenEdgeRequiringSymmetricLayout
{
  return self->_paddingFromScreenEdgeRequiringSymmetricLayout;
}

- (void)setPaddingFromScreenEdgeRequiringSymmetricLayout:(double)a3
{
  self->_paddingFromScreenEdgeRequiringSymmetricLayout = a3;
}

- (BOOL)suppressWhilePresentingControlCenter
{
  return self->_suppressWhilePresentingControlCenter;
}

- (void)setSuppressWhilePresentingControlCenter:(BOOL)a3
{
  self->_suppressWhilePresentingControlCenter = a3;
}

- (void)setElementShadowEnabled:(BOOL)a3
{
  self->_elementShadowEnabled = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (BOOL)showQueryIterationLabel
{
  return self->_showQueryIterationLabel;
}

- (void)setShowQueryIterationLabel:(BOOL)a3
{
  self->_showQueryIterationLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveKeyLineColorMatrix, 0);
  objc_storeStrong((id *)&self->_keyLineAppearForSwoopTransition, 0);
  objc_storeStrong((id *)&self->_keyLineDisappearToInertTransition, 0);
  objc_storeStrong((id *)&self->_keyLineStyleTransition, 0);
  objc_storeStrong((id *)&self->_pulseIndicatorSettings, 0);
  objc_storeStrong((id *)&self->_pulseNoActionSettings, 0);
  objc_storeStrong((id *)&self->_transitionToProminentPillSettings, 0);
  objc_storeStrong((id *)&self->_inflateAnimationScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_inflateAnimationScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_bumpAnimationScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_bumpAnimationScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchSettle, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchOut, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeSettle, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeInitialKick, 0);
  objc_storeStrong((id *)&self->_recombinationSecondaryBoundsYSettings, 0);
  objc_storeStrong((id *)&self->_mitosisSecondaryBoundsSettings, 0);
  objc_storeStrong((id *)&self->_jindoBoundsOval, 0);
  objc_storeStrong((id *)&self->_contentInteractionBeginBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_elementContentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_popToCustomInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_customInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_minimalInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_compactInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertCompensatingInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertCollapsingInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_defaultInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_ejectionContractionSettings, 0);
  objc_storeStrong((id *)&self->_ejectionStretchSettings, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayoutY, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayout, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideRebound, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideStretch, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceLayoutY, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceLayout, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceRebound, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceStretch, 0);
}

@end
