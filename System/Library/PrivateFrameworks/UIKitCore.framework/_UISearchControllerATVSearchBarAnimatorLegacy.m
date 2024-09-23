@implementation _UISearchControllerATVSearchBarAnimatorLegacy

- (void)animateTransition:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  id v35;
  void (**v36)(_QWORD);
  id v37;
  void (**v38)(void *, uint64_t);
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double *v49;
  void *v50;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  __int128 v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  CGFloat v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  double v140;
  double MaxY;
  void *v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double v148;
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
  double MidY;
  CGFloat v165;
  void *v166;
  double v167;
  double v168;
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
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  double v191;
  CGFloat v192;
  double v193;
  CGFloat v194;
  double v195;
  CGFloat v196;
  double v197;
  CGFloat v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  void *v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  double v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  double v229;
  double v230;
  uint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t *v237;
  void *v238;
  void *v239;
  void *v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  void *v246;
  double v247;
  double v248;
  void *v249;
  double v250;
  double v251;
  double v252;
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
  double v267;
  CGFloat v268;
  double v269;
  void *v270;
  void *v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  void *v281;
  void *v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  void *v288;
  double v289;
  double v290;
  double v291;
  double v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  uint64_t v297;
  id v298;
  void (**v299)(_QWORD);
  id v300;
  void (**v301)(void *, uint64_t);
  double v302;
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
  CGFloat rect;
  void *recta;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  int v323;
  void *v324;
  void *v325;
  void *v326;
  id v327;
  id v328;
  double v329;
  void *v330;
  double v331;
  void *v332;
  void *v333;
  void *v334;
  id v335;
  void *v336;
  _UISearchControllerATVSearchBarAnimatorLegacy *v337;
  void *v338;
  void *v339;
  void *v340;
  _QWORD v341[4];
  id v342;
  _QWORD aBlock[4];
  id v344;
  id v345;
  _QWORD v346[4];
  id v347;
  id v348;
  _QWORD v349[4];
  id v350;
  _OWORD v351[3];
  _QWORD v352[4];
  _QWORD v353[2];
  _QWORD v354[4];
  _QWORD v355[4];
  CGRect v356;
  CGRect v357;
  CGRect v358;
  CGRect v359;
  CGRect v360;
  CGRect v361;
  CGRect v362;
  CGRect v363;
  CGRect v364;
  CGRect v365;
  CGRect v366;
  CGRect v367;
  CGRect v368;
  CGRect v369;

  v355[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = v7;
  else
    v9 = v6;
  v10 = v9;
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_searchPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v303, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchControllerATVSearchAnimatorLegacy.m"), 46, CFSTR("UISearchBar's presentation controller must be of type _UISearchATVPresentationController."));

  }
  v337 = self;
  objc_msgSend(v10, "_searchPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "showsScopeBar"))
  {
    objc_msgSend(v16, "_scopeBarContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v16, "_scopeBarContainerView");
      v339 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v339 = 0;
    }

  }
  else
  {
    v339 = 0;
  }
  v340 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v335 = v10;
    v336 = v6;
    objc_msgSend(v7, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finalFrameForViewController:", v7);
    objc_msgSend(v18, "setFrame:");
    objc_msgSend(v5, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v18);

    if (objc_msgSend(v7, "obscuresBackgroundDuringPresentation"))
    {
      objc_msgSend(v15, "backgroundObscuringView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "finalFrameForViewController:", v7);
      objc_msgSend(v20, "setFrame:");

    }
    v334 = v12;
    objc_msgSend(v7, "_systemInputViewControllerAfterUpdate:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v338 = v18;
    v333 = v15;
    if (objc_msgSend(v21, "resolvedKeyboardStyle") == 1)
    {
      objc_msgSend(v7, "searchBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_setDisableFocus:", 1);

      objc_msgSend(v340, "frame");
      objc_msgSend(v18, "frame");
      objc_msgSend(v340, "sizeThatFits:", v23, v24);
      v26 = v25;
      objc_msgSend(v18, "frame");
      v28 = v27 + -80.0;
      v29 = (double *)MEMORY[0x1E0C9D538];
      objc_msgSend(v15, "searchBarContainerView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v340);

      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v7, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "safeAreaInsets");
        v33 = v32;

      }
      else
      {
        v33 = 34.5;
      }
      v56 = v28 + -80.0;
      v57 = *v29;
      v329 = v29[1];
      objc_msgSend(v7, "presentationController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "presentingViewController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "tabBarController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(v7, "presentationController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "presentingViewController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "tabBarController");
        v63 = v15;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "tabBar");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "superview");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "coordinateSpace");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "frame");
        v69 = v68;
        v71 = v70;
        v73 = v72;
        v75 = v74;
        v76 = v63;
        objc_msgSend(v63, "searchBarContainerView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "superview");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "coordinateSpace");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "convertRect:toCoordinateSpace:", v79, v69, v71, v73, v75);
        v81 = v80;
        v83 = v82;
        v85 = v84;
        v87 = v86;

        if (objc_msgSend(v65, "_displayStyle") == 1)
        {
          v356.origin.x = v81;
          v356.origin.y = v83;
          v356.size.width = v85;
          v356.size.height = v87;
          v33 = CGRectGetMaxY(v356) + 43.0;
        }

        v15 = v76;
        v18 = v338;
      }
      objc_msgSend(v18, "bounds");
      v89 = v88;
      v91 = v90;
      v93 = v92;
      v95 = v94;
      objc_msgSend(v18, "_screen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "scale");
      UIRectCenteredXInRectScale(v57, v33, v56, v26, v89, v91, v93, v95, v97);
      v99 = v98;
      v101 = v100;
      v103 = v102;
      v105 = v104;

      objc_msgSend(v15, "searchBarContainerView");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setFrame:", v99, v101, v103, v105);

      objc_msgSend(v340, "setFrame:", v57, v329, v56, v26);
      objc_msgSend(v21, "view");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v351[0] = *MEMORY[0x1E0C9BAA8];
      v351[1] = v108;
      v351[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v107, "setTransform:", v351);

      objc_msgSend(v21, "view");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "layoutIfNeeded");

      objc_msgSend(v21, "view");
      v110 = 1.0;
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "setAlpha:", 1.0);
      v111 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v21, "alignmentConstraintArrayForAxis:", 0);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "deactivateConstraints:", v112);

      v113 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v21, "alignmentConstraintArrayForAxis:", 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "deactivateConstraints:", v114);

      v357.origin.x = v99;
      v357.origin.y = v101;
      v357.size.width = v103;
      v357.size.height = v105;
      v115 = CGRectGetMaxY(v357) + 34.5;
      objc_msgSend(v21, "view");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "centerXAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "centerXAnchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "constraintEqualToAnchor:", v119);
      v120 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "view");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "topAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "superview");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "topAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "constraintEqualToAnchor:constant:", v125, v115);
      v126 = objc_claimAutoreleasedReturnValue();

      v127 = (void *)v120;
      v128 = v126;

      v129 = (void *)MEMORY[0x1E0D156E0];
      v355[0] = v120;
      v355[1] = v126;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v355, 2);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "activateConstraints:", v130);

      objc_msgSend(v21, "setAlignmentConstraint:forAxis:", v120, 0);
      objc_msgSend(v21, "setAlignmentConstraint:forAxis:", v126, 1);
      objc_msgSend(v21, "view");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "frame");
      v133 = v115 + v132;

      objc_msgSend(v7, "_leftDividerView");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "frame");
      v137 = v136 + -160.0;

      objc_msgSend(v134, "setFrame:", 80.0, v133, v137, 1.0);
      objc_msgSend(v338, "addSubview:", v134);
      objc_msgSend(v7, "_rightDividerView");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "removeFromSuperview");

      objc_msgSend(v338, "frame");
      v140 = v139 + -160.0;
      v358.size.height = 1.0;
      v358.origin.x = 80.0;
      v358.origin.y = v133;
      v358.size.width = v139 + -160.0;
      MaxY = CGRectGetMaxY(v358);
      objc_msgSend(v7, "_leftDividerView");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_rightDividerView");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      v330 = (void *)v128;
      if (objc_msgSend(v340, "showsScopeBar") && v339)
      {
        v325 = v134;
        v327 = v5;
        v318 = v127;
        v320 = v21;
        objc_msgSend(v340, "_scopeBarHeight");
        v144 = v143;
        objc_msgSend(v340, "_scopeBar");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "sizeThatFits:", 10000.0, 10000.0);
        v147 = v146;

        v148 = (v140 - v147) * 0.5 + 80.0;
        objc_msgSend(v339, "setFrame:", v148, v133, v147, v144);
        objc_msgSend(v339, "setAlpha:", 1.0);
        objc_msgSend(v338, "addSubview:", v339);
        v359.origin.x = v148;
        v359.origin.y = v133;
        v359.size.width = v147;
        rect = v144;
        v359.size.height = v144;
        MaxY = CGRectGetMaxY(v359);
        objc_msgSend(v7, "_scopeBarFocusContainerGuide");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_scopeBarConstraints");
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        if (v150)
        {
          v151 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v7, "_scopeBarConstraints");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "deactivateConstraints:", v152);

        }
        objc_msgSend(v149, "topAnchor");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v339, "topAnchor");
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "constraintEqualToAnchor:", v310);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v354[0] = v308;
        objc_msgSend(v339, "bottomAnchor");
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "bottomAnchor");
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v306, "constraintEqualToAnchor:constant:", v305, -30.0);
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        v354[1] = v304;
        objc_msgSend(v149, "leftAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v149;
        v314 = v149;
        v155 = v338;
        objc_msgSend(v338, "leftAnchor");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "constraintEqualToAnchor:constant:", v156, 80.0);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v354[2] = v157;
        objc_msgSend(v338, "rightAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "rightAnchor");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "constraintEqualToAnchor:constant:", v159, 80.0);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v354[3] = v160;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v354, 4);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "set_scopeBarConstraints:", v161);

        v162 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v7, "_scopeBarConstraints");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "activateConstraints:", v163);

        objc_msgSend(v339, "frame");
        MidY = CGRectGetMidY(v360);
        v140 = v148 + -30.0 + -80.0;
        v361.origin.x = v148;
        v361.origin.y = v133;
        v361.size.width = v147;
        v361.size.height = rect;
        v165 = CGRectGetMaxX(v361) + 30.0;
        objc_msgSend(v338, "frame");
        v166 = v324;
        objc_msgSend(v324, "setFrame:", v165, MidY, CGRectGetMaxX(v362) + -80.0 - v165, 1.0);
        objc_msgSend(v338, "addSubview:", v324);

        v133 = MidY;
        v134 = v325;
        v5 = v327;
        v127 = v318;
        v21 = v320;
        v110 = 1.0;
      }
      else
      {
        v155 = v338;
        v166 = v324;
      }
      v269 = MaxY + 30.0;
      objc_msgSend(v142, "setFrame:", 80.0, v133, v140, v110);
      objc_msgSend(v155, "addSubview:", v142);
      objc_msgSend(v7, "_resultsControllerViewContainer");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "superview");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "bounds");
      v273 = v272;
      v275 = v274;

      objc_msgSend(v155, "frame");
      v277 = v276 - v269;
      objc_msgSend(v7, "_resultsControllerViewContainer");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "setFrame:", v273, v269, v275, v277);

      v236 = v321;
      v246 = v330;
    }
    else
    {
      objc_msgSend(v7, "presentationController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "presentingViewController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v323 = objc_msgSend(v42, "_shouldReverseLayoutDirection");

      objc_msgSend(v340, "frame");
      objc_msgSend(v18, "frame");
      objc_msgSend(v340, "sizeThatFits:", v43, v44);
      v46 = v45;
      objc_msgSend(v18, "frame");
      v48 = v47 + -190.0;
      v49 = (double *)MEMORY[0x1E0C9D538];
      objc_msgSend(v15, "searchBarContainerView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addSubview:", v340);

      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v7, "view");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "safeAreaInsets");
        v54 = v53;

      }
      else
      {
        v54 = 34.5;
      }
      v167 = v48 + -80.0;
      v168 = *v49;
      v331 = v49[1];
      objc_msgSend(v7, "presentationController");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "presentingViewController");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "tabBarController");
      v171 = (void *)objc_claimAutoreleasedReturnValue();

      v328 = v5;
      if (v171)
      {
        objc_msgSend(v7, "presentationController");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "presentingViewController");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "tabBarController");
        v174 = v15;
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "tabBar");
        v176 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v176, "superview");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "coordinateSpace");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "frame");
        v180 = v179;
        v182 = v181;
        v184 = v183;
        v186 = v185;
        v187 = v174;
        objc_msgSend(v174, "searchBarContainerView");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "superview");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "coordinateSpace");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "convertRect:toCoordinateSpace:", v190, v180, v182, v184, v186);
        v192 = v191;
        v194 = v193;
        v196 = v195;
        v198 = v197;

        if (objc_msgSend(v176, "_displayStyle") == 1)
        {
          v363.origin.x = v192;
          v363.origin.y = v194;
          v363.size.width = v196;
          v363.size.height = v198;
          v54 = CGRectGetMaxY(v363) + 43.0;
        }

        v15 = v187;
        v18 = v338;
      }
      objc_msgSend(v18, "bounds");
      v200 = v199;
      v202 = v201;
      v204 = v203;
      v206 = v205;
      objc_msgSend(v18, "_screen");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "scale");
      UIRectCenteredXInRectScale(v168, v54, v167, v46, v200, v202, v204, v206, v208);
      v210 = v209;
      v212 = v211;
      v214 = v213;
      v216 = v215;

      objc_msgSend(v15, "searchBarContainerView");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "setFrame:", v210, v212, v214, v216);

      objc_msgSend(v340, "setFrame:", v168, v331, v167, v46);
      objc_msgSend(v21, "view");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "layoutIfNeeded");

      v219 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v21, "alignmentConstraintArrayForAxis:", 0);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "deactivateConstraints:", v220);

      v221 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v21, "alignmentConstraintArrayForAxis:", 1);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "deactivateConstraints:", v222);

      v364.origin.x = v210;
      v364.origin.y = v212;
      v364.size.width = v214;
      v364.size.height = v216;
      v223 = CGRectGetMaxY(v364) + 34.5;
      objc_msgSend(v21, "view");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "leadingAnchor");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "superview");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "leadingAnchor");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = 190.0;
      v230 = 80.0;
      if (!v323)
        v230 = 190.0;
      objc_msgSend(v225, "constraintEqualToAnchor:constant:", v228, v230);
      v231 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "view");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "topAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "topAnchor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "constraintEqualToAnchor:constant:", v235, v223);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      v236 = (void *)v231;
      v237 = &qword_18667B000;

      v238 = (void *)MEMORY[0x1E0D156E0];
      v353[0] = v236;
      v353[1] = v127;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 2);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "activateConstraints:", v239);

      objc_msgSend(v21, "setAlignmentConstraint:forAxis:", v236, 0);
      objc_msgSend(v21, "setAlignmentConstraint:forAxis:", v127, 1);
      objc_msgSend(v21, "setUnfocusedFocusGuideOutsets:", -34.5, -40.0, -34.5, -40.0);
      if ((v323 & 1) == 0)
      {
        objc_msgSend(v21, "view");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v240, "frame");
        v229 = v241 + 70.0 + 190.0;

      }
      objc_msgSend(v18, "frame");
      v243 = v242 + -270.0;
      v244 = 1.0;
      v365.size.height = 1.0;
      v365.origin.x = v229;
      v365.origin.y = v223;
      v365.size.width = v242 + -270.0;
      v245 = CGRectGetMaxY(v365);
      objc_msgSend(v7, "_leftDividerView");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_rightDividerView");
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v340, "showsScopeBar"))
      {
        v332 = v246;
        if (v339)
        {
          v319 = v127;
          v322 = v236;
          objc_msgSend(v340, "_scopeBarHeight");
          v248 = v247;
          objc_msgSend(v340, "_scopeBar");
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "sizeThatFits:", 10000.0, 10000.0);
          v251 = v250;

          v252 = v229 + (v243 - v251) * 0.5;
          objc_msgSend(v339, "setFrame:", v252, v223, v251, v248);
          objc_msgSend(v339, "setAlpha:", 1.0);
          objc_msgSend(v18, "addSubview:", v339);
          v366.origin.x = v252;
          v366.origin.y = v223;
          v366.size.width = v251;
          v366.size.height = v248;
          v245 = CGRectGetMaxY(v366);
          objc_msgSend(v7, "_scopeBarFocusContainerGuide");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_scopeBarConstraints");
          v254 = (void *)objc_claimAutoreleasedReturnValue();

          if (v254)
          {
            v255 = (void *)MEMORY[0x1E0D156E0];
            objc_msgSend(v7, "_scopeBarConstraints");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "deactivateConstraints:", v256);

          }
          objc_msgSend(v253, "topAnchor");
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "topAnchor");
          v313 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v315, "constraintEqualToAnchor:", v313);
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          v352[0] = v311;
          objc_msgSend(v339, "bottomAnchor");
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "bottomAnchor");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "constraintEqualToAnchor:constant:", v307, -30.0);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          v352[1] = v257;
          objc_msgSend(v253, "leftAnchor");
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "leftAnchor");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v258, "constraintEqualToAnchor:constant:", v259, 190.0);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          v352[2] = v260;
          objc_msgSend(v338, "rightAnchor");
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "rightAnchor");
          recta = v253;
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v261, "constraintEqualToAnchor:constant:", v262, 80.0);
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          v352[3] = v263;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v352, 4);
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "set_scopeBarConstraints:", v264);

          v18 = v338;
          v237 = &qword_18667B000;

          v265 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v7, "_scopeBarConstraints");
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v265, "activateConstraints:", v266);

          objc_msgSend(v339, "frame");
          v267 = CGRectGetMidY(v367);
          v243 = v252 + -30.0 - v229;
          v368.origin.x = v252;
          v368.origin.y = v223;
          v368.size.width = v251;
          v368.size.height = v248;
          v268 = CGRectGetMaxX(v368) + 30.0;
          objc_msgSend(v338, "frame");
          objc_msgSend(v326, "setFrame:", v268, v267, CGRectGetMaxX(v369) + -80.0 - v268, 1.0);
          objc_msgSend(v338, "addSubview:", v326);

          v223 = v267;
          v5 = v328;
          v246 = v332;
          v236 = v322;
          v127 = v319;
          v244 = 1.0;
        }
      }
      v279 = v245 + 30.0;
      objc_msgSend(v246, "setFrame:", v229, v223, v243, v244);
      objc_msgSend(v18, "addSubview:", v246);
      objc_msgSend(v7, "_resultsControllerViewContainer");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "superview");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "bounds");

      objc_msgSend(v21, "view");
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "frame");
      v283 = *((double *)v237 + 11);
      v285 = v284 + v283 + 70.0;

      if (!v323)
        v283 = v285;
      objc_msgSend(v18, "frame");
      v287 = v286;
      objc_msgSend(v21, "view");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v288, "frame");
      v290 = v287 - v289 + -70.0 + -190.0 + -80.0;

      objc_msgSend(v18, "frame");
      v292 = v291 - v279;
      objc_msgSend(v7, "_resultsControllerViewContainer");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "setFrame:", v283, v279, v290, v292);
      v134 = v326;
    }

    objc_msgSend(v21, "view");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v293, "superview");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v294, "bringSubviewToFront:", v295);

    objc_msgSend(v7, "_resultsControllerViewContainer");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v296, "setAlpha:", 0.0);

    v297 = MEMORY[0x1E0C809B0];
    v349[0] = MEMORY[0x1E0C809B0];
    v349[1] = 3221225472;
    v349[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke;
    v349[3] = &unk_1E16B1B28;
    v298 = v7;
    v350 = v298;
    v299 = (void (**)(_QWORD))_Block_copy(v349);
    v346[0] = v297;
    v346[1] = 3221225472;
    v346[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_2;
    v346[3] = &unk_1E16B2218;
    v347 = v298;
    v300 = v5;
    v348 = v300;
    v301 = (void (**)(void *, uint64_t))_Block_copy(v346);
    if (objc_msgSend(v300, "isAnimated"))
    {
      -[_UISearchControllerAnimator transitionDuration:](v337, "transitionDuration:", v300);
      v12 = v334;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v334, "completionCurve"), v299, v301, v302, 0.0);
    }
    else
    {
      v299[2](v299);
      v301[2](v301, 1);
      v12 = v334;
    }
    v15 = v333;

    v10 = v335;
    v6 = v336;
    v16 = v340;
    v55 = v338;
  }
  else
  {
    v34 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E16B1B50;
    v344 = v6;
    v35 = v5;
    v345 = v35;
    v36 = (void (**)(_QWORD))_Block_copy(aBlock);
    v341[0] = v34;
    v341[1] = 3221225472;
    v341[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_4;
    v341[3] = &unk_1E16B3FD8;
    v37 = v35;
    v342 = v37;
    v38 = (void (**)(void *, uint64_t))_Block_copy(v341);
    if (objc_msgSend(v37, "isAnimated"))
    {
      -[_UISearchControllerAnimator transitionDuration:](v337, "transitionDuration:", v37);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v12, "completionCurve"), v36, v38, v39, 0.0);
    }
    else
    {
      v36[2](v36);
      v38[2](v38, 1);
    }

    v55 = v344;
  }

}

- (void)didRelayoutSearchBarForController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double MaxY;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double MaxX;
  void *v49;
  _BOOL4 v50;
  _BOOL4 IsIdentity;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
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
  double MidY;
  CGFloat v92;
  void *v93;
  CGFloat v94;
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
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  uint64_t *v117;
  double v118;
  void *v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  int v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
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
  double v150;
  double v151;
  void *v152;
  CGFloat v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  double v168;
  double v169;
  void *v170;
  double v171;
  double v172;
  void *v173;
  double v174;
  void *v175;
  double v176;
  double v177;
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
  CGFloat v197;
  void *v198;
  void *rect;
  void *v200;
  _BOOL4 v201;
  void *v202;
  char v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  CGAffineTransform v210;
  _QWORD v211[4];
  _QWORD v212[6];
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;

  v212[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_searchPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "_systemInputViewControllerAfterUpdate:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_searchPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchControllerATVSearchAnimatorLegacy.m"), 394, CFSTR("UISearchBar's presentation controller must be of type _UISearchATVPresentationController."));

    }
    objc_msgSend(v5, "_searchPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBarContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v5, "searchBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    objc_msgSend(v10, "searchBarContainerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    objc_msgSend(v5, "presentingViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tabBarController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tabBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 < 0.0 && objc_msgSend(v32, "_displayStyle") == 1)
    {
      objc_msgSend(v32, "frame");
      objc_msgSend(v32, "setFrame:");
    }
    objc_msgSend(v5, "searchBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_scopeBarContainerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v213.origin.x = v23;
    v213.origin.y = v25;
    v213.size.width = v27;
    v213.size.height = v29;
    MaxY = CGRectGetMaxY(v213);
    objc_msgSend(v5, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = objc_msgSend(v36, "_shouldReverseLayoutDirection");

    if (objc_msgSend(v7, "resolvedKeyboardStyle") == 1)
    {
      objc_msgSend(v7, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "frame");
      v40 = MaxY + 34.5 + v39;

      objc_msgSend(v7, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
        objc_msgSend(v41, "transform");
      else
        memset(&v210, 0, sizeof(v210));
      IsIdentity = CGAffineTransformIsIdentity(&v210);

      if (!IsIdentity)
        v40 = v40 + -34.5;
      objc_msgSend(v5, "_leftDividerView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "frame");
      v55 = v54 + -160.0;

      v56 = 1.0;
      objc_msgSend(v52, "setFrame:", 80.0, v40, v55, 1.0);
      objc_msgSend(v5, "view");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addSubview:", v52);

      objc_msgSend(v5, "_rightDividerView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "removeFromSuperview");

      objc_msgSend(v5, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "frame");
      v61 = v60 + -160.0;

      v215.size.height = 1.0;
      v215.origin.x = 80.0;
      v215.origin.y = v40;
      v215.size.width = v61;
      v62 = CGRectGetMaxY(v215);
      objc_msgSend(v5, "_leftDividerView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_rightDividerView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchBar");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "showsScopeBar");

      if (v66 && v34)
      {
        rect = v64;
        v200 = v63;
        v202 = v52;
        v204 = v32;
        v206 = v10;
        v208 = v7;
        objc_msgSend(v5, "searchBar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "_scopeBarHeight");
        v69 = v68;

        objc_msgSend(v5, "searchBar");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "_scopeBar");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "sizeThatFits:", 10000.0, 10000.0);
        v73 = v72;

        v74 = (v61 - v73) * 0.5 + 80.0;
        objc_msgSend(v34, "setFrame:", v74, v40, v73, v69);
        objc_msgSend(v34, "setAlpha:", 1.0);
        objc_msgSend(v5, "view");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addSubview:", v34);

        v216.origin.x = v74;
        v216.origin.y = v40;
        v216.size.width = v73;
        v216.size.height = v69;
        v197 = CGRectGetMaxY(v216);
        objc_msgSend(v5, "_scopeBarFocusContainerGuide");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_scopeBarConstraints");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          v78 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v5, "_scopeBarConstraints");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "deactivateConstraints:", v79);

        }
        objc_msgSend(v76, "topAnchor");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "topAnchor");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "constraintEqualToAnchor:", v191);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v212[0] = v189;
        objc_msgSend(v34, "bottomAnchor");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "bottomAnchor");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "constraintEqualToAnchor:constant:", v185, -30.0);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v212[1] = v183;
        objc_msgSend(v76, "leftAnchor");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "view");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "leftAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "constraintEqualToAnchor:constant:", v81, 80.0);
        v195 = v76;
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v212[2] = v82;
        objc_msgSend(v5, "view");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "rightAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "rightAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 80.0);
        v86 = v34;
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v212[3] = v87;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 4);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "set_scopeBarConstraints:", v88);

        v34 = v86;
        v89 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v5, "_scopeBarConstraints");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "activateConstraints:", v90);

        objc_msgSend(v86, "frame");
        MidY = CGRectGetMidY(v217);
        v61 = v74 + -30.0 + -80.0;
        v218.origin.x = v74;
        v218.origin.y = v40;
        v218.size.width = v73;
        v218.size.height = v69;
        v92 = CGRectGetMaxX(v218) + 30.0;
        objc_msgSend(v5, "view");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "frame");
        v94 = CGRectGetMaxX(v219) + -80.0 - v92;

        v64 = rect;
        objc_msgSend(rect, "setFrame:", v92, MidY, v94, 1.0);
        objc_msgSend(v5, "view");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "addSubview:", rect);

        v10 = v206;
        v7 = v208;
        v52 = v202;
        v32 = v204;
        v63 = v200;
        v56 = 1.0;
        v62 = v197;
      }
      else
      {
        objc_msgSend(v5, "_scopeBarConstraints");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
        {
          v97 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v5, "_scopeBarConstraints");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "deactivateConstraints:", v98);

        }
        objc_msgSend(v34, "removeFromSuperview");
        objc_msgSend(v5, "_leftDividerView");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setFrame:", 80.0, v40, v55, 1.0);

        objc_msgSend(v5, "_rightDividerView");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "removeFromSuperview");

        MidY = v40;
      }
      objc_msgSend(v63, "setFrame:", 80.0, MidY, v61, v56);
      objc_msgSend(v5, "view");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_leftDividerView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addSubview:", v102);

      objc_msgSend(v5, "_resultsControllerViewContainer");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "superview");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "bounds");
      v106 = v105;
      v108 = v107;

      objc_msgSend(v5, "view");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "frame");
      v111 = v110 - (v62 + 30.0);

      objc_msgSend(v5, "_resultsControllerViewContainer");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setFrame:", v106, v62 + 30.0, v108, v111);

    }
    else
    {
      if (objc_msgSend(v7, "resolvedKeyboardStyle") != 2)
      {
LABEL_43:
        objc_msgSend(v7, "view");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "superview");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "bringSubviewToFront:", v180);

        goto LABEL_44;
      }
      objc_msgSend(v7, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "frame");
      if ((_DWORD)v37)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v44);
        objc_msgSend(v5, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "frame");
        v50 = MaxX < CGRectGetMaxX(v214);

      }
      else
      {
        v50 = v44 > 0.0;
      }

      v220.origin.x = v23;
      v220.origin.y = v25;
      v220.size.width = v27;
      v220.size.height = v29;
      v113 = CGRectGetMaxY(v220);
      objc_msgSend(v5, "view");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "frame");
      v116 = v115 + -270.0;

      v117 = &qword_18667B000;
      v118 = 190.0;
      if (v50)
      {
        objc_msgSend(v7, "view");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "frame");
        v116 = v116 - (v120 + 70.0);

        if ((v37 & 1) == 0)
        {
          objc_msgSend(v7, "view");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "frame");
          v118 = v122 + 70.0 + 190.0;

        }
      }
      v123 = v113 + 34.5;
      if (v34
        && (objc_msgSend(v5, "searchBar"),
            v124 = (void *)objc_claimAutoreleasedReturnValue(),
            v125 = objc_msgSend(v124, "showsScopeBar"),
            v124,
            v125))
      {
        v201 = v50;
        v203 = v37;
        v205 = v32;
        v207 = v10;
        objc_msgSend(v5, "searchBar");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "_scopeBarHeight");
        v128 = v127;

        objc_msgSend(v5, "searchBar");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "_scopeBar");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "sizeThatFits:", 10000.0, 10000.0);
        v132 = v131;

        v133 = v118 + (v116 - v132) * 0.5;
        objc_msgSend(v34, "setFrame:", v133, v123, v132, v128);
        objc_msgSend(v34, "setAlpha:", 1.0);
        objc_msgSend(v5, "view");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addSubview:", v34);

        objc_msgSend(v5, "_scopeBarFocusContainerGuide");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_scopeBarConstraints");
        v136 = (void *)objc_claimAutoreleasedReturnValue();

        if (v136)
        {
          v137 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v5, "_scopeBarConstraints");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "deactivateConstraints:", v138);

        }
        v139 = v128 + 30.0;
        objc_msgSend(v135, "topAnchor");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "topAnchor");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "constraintEqualToAnchor:", v194);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v211[0] = v192;
        objc_msgSend(v34, "bottomAnchor");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "bottomAnchor");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "constraintEqualToAnchor:constant:", v188, -30.0);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v211[1] = v186;
        objc_msgSend(v135, "leadingAnchor");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "trailingAnchor");
        v198 = v135;
        v37 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "constraintEqualToAnchor:constant:", v37, 70.0);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v211[2] = v141;
        objc_msgSend(v5, "view");
        v209 = v7;
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "trailingAnchor");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "trailingAnchor");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "constraintEqualToAnchor:", v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v211[3] = v145;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 4);
        v146 = v34;
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "set_scopeBarConstraints:", v147);

        v34 = v146;
        v7 = v209;

        v148 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v5, "_scopeBarConstraints");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "activateConstraints:", v149);

        objc_msgSend(v146, "frame");
        v150 = CGRectGetMidY(v221);
        v151 = v133 + -30.0 - v118;
        objc_msgSend(v5, "_leftDividerView");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "setFrame:", v118, v150, v151, 1.0);

        v222.origin.x = v133;
        v222.origin.y = v123;
        v222.size.width = v132;
        v222.size.height = v128;
        v153 = CGRectGetMaxX(v222) + 30.0;
        objc_msgSend(v5, "_rightDividerView");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "setFrame:", v153, v150, v151, 1.0);

        objc_msgSend(v5, "view");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_rightDividerView");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "addSubview:", v156);

        v32 = v205;
        v10 = v207;
        LOBYTE(v37) = v203;
        v50 = v201;
        v117 = &qword_18667B000;
      }
      else
      {
        objc_msgSend(v5, "_scopeBarConstraints");
        v157 = (void *)objc_claimAutoreleasedReturnValue();

        if (v157)
        {
          v158 = (void *)MEMORY[0x1E0D156E0];
          objc_msgSend(v5, "_scopeBarConstraints");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "deactivateConstraints:", v159);

        }
        objc_msgSend(v34, "removeFromSuperview");
        objc_msgSend(v5, "_leftDividerView");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "setFrame:", v118, v123, v116, 1.0);

        objc_msgSend(v5, "_rightDividerView");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "removeFromSuperview");

        v139 = 30.0;
      }
      v162 = v123 + v139;
      objc_msgSend(v5, "view");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_leftDividerView");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "addSubview:", v164);

      objc_msgSend(v5, "_resultsControllerViewContainer");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "superview");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "bounds");

      objc_msgSend(v5, "view");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "frame");
      v169 = v168;

      if (v50)
      {
        objc_msgSend(v7, "view");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "frame");
        v172 = *((double *)v117 + 11);
        v169 = v169 - (v171 + 70.0 + v172 + 80.0);

        if ((v37 & 1) == 0)
        {
          objc_msgSend(v7, "view");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "frame");
          v172 = v174 + 70.0 + *((double *)v117 + 11);

        }
      }
      else
      {
        v172 = 0.0;
      }
      objc_msgSend(v5, "view");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "frame");
      v177 = v176 - v162;

      objc_msgSend(v5, "_resultsControllerViewContainer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFrame:", v172, v162, v169, v177);
    }

    goto LABEL_43;
  }
LABEL_44:

}

- (void)didFocusSearchBarForController:(id)a3
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
  BOOL IsIdentity;
  double v15;
  double v16;
  void *v17;
  double MinX;
  void *v19;
  char v20;
  double v21;
  double v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  CGFloat v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  UISpringTimingParameters *v65;
  UIViewPropertyAnimator *v66;
  id v67;
  UIViewPropertyAnimator *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  id v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v113;
  void *v114;
  _QWORD aBlock[4];
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  double v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  uint64_t v137;
  double v138;
  uint64_t v139;
  double v140;
  uint64_t v141;
  double v142;
  uint64_t v143;
  _QWORD v144[4];
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  double v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  double v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  uint64_t v165;
  double v166;
  CGAffineTransform v167;
  CGAffineTransform v168;
  CGAffineTransform v169;
  CGAffineTransform v170;
  CGAffineTransform v171;
  CGAffineTransform v172;
  CGRect v173;
  CGRect v174;

  v4 = a3;
  objc_msgSend(v4, "_systemInputViewControllerAfterUpdate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alignmentConstraintForAxis:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_suggestionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_leftDividerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rightDividerView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (objc_msgSend(v7, "showsScopeBar"))
  {
    objc_msgSend(v7, "_scopeBarContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "_scopeBarContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  if (objc_msgSend(v5, "resolvedKeyboardStyle") != 1)
    goto LABEL_31;
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "transform");
  else
    memset(&v172, 0, sizeof(v172));
  IsIdentity = CGAffineTransformIsIdentity(&v172);

  if (!IsIdentity)
  {
    objc_msgSend(v4, "_searchPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchControllerATVSearchAnimatorLegacy.m"), 661, CFSTR("UISearchBar's presentation controller must be of type _UISearchATVPresentationController."));

    }
    objc_msgSend(v5, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;

    objc_msgSend(v5, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v171, 0, sizeof(v171));
    CGAffineTransformMakeTranslation(&v171, 0.0, v27 * -0.5 + -1.0);
    v169 = v171;
    CGAffineTransformScale(&v170, &v169, 1.0, 1.0 / v27);
    v171 = v170;
    v168 = v170;
    objc_msgSend(v5, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v168;
    objc_msgSend(v29, "setTransform:", &v167);

    objc_msgSend(v28, "setAlpha:", 0.0);
    v30 = v27 + 34.5;
    if (v8)
    {
      objc_msgSend(v8, "frame");
      v108 = v33;
      v110 = v32;
      v106 = v34;
    }
    else
    {
      v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v108 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v110 = *MEMORY[0x1E0C9D648];
      v106 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    v105 = v30 + v31;
    if (v9)
    {
      objc_msgSend(v9, "frame");
      v101 = v71;
      v103 = v70;
      v99 = v72;
    }
    else
    {
      v69 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v101 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v103 = *MEMORY[0x1E0C9D648];
      v99 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    v73 = v30 + v69;
    objc_msgSend(v10, "frame");
    v95 = v75;
    v97 = v74;
    v77 = v76;
    v79 = v30 + v78;
    objc_msgSend(v4, "_resultsControllerViewContainer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "frame");
    v82 = v81;
    v84 = v83;
    v86 = v85;
    v88 = v87;

    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke;
    v144[3] = &unk_1E16C4A20;
    v145 = v5;
    v146 = v8;
    v151 = v110;
    v152 = v105;
    v153 = v108;
    v154 = v106;
    v147 = v9;
    v155 = v103;
    v156 = v73;
    v157 = v101;
    v158 = v99;
    v148 = v10;
    v159 = v97;
    v160 = v79;
    v161 = v77;
    v162 = v95;
    v163 = v82 + 0.0;
    v164 = v30 + v84;
    v165 = v86;
    v166 = v88 - v30;
    v149 = v4;
    v150 = v28;
    v89 = v28;
    v90 = _Block_copy(v144);
    -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", 0);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v90, 0);

  }
  else
  {
LABEL_31:
    if (objc_msgSend(v5, "resolvedKeyboardStyle") == 2)
    {
      objc_msgSend(v6, "constant");
      v16 = v15;
      objc_msgSend(v4, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      MinX = CGRectGetMinX(v173);

      if (v16 < MinX)
      {
        objc_msgSend(v4, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "_shouldReverseLayoutDirection");

        if ((v20 & 1) != 0)
        {
          v21 = 190.0;
          v22 = 80.0;
        }
        else
        {
          objc_msgSend(v5, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "frame");
          v22 = 190.0;
          v21 = v36 + 70.0 + 190.0;

        }
        v92 = v22;
        objc_msgSend(v4, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "frame");
        v39 = v38;
        objc_msgSend(v5, "view");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "frame");
        v42 = v39 - v41 + -70.0 - v22;

        objc_msgSend(v8, "superview");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "frame");
        v109 = v45;
        v111 = v44;
        v107 = v46;

        objc_msgSend(v10, "frame");
        v48 = v47;
        v50 = v49;
        v52 = v51;
        objc_msgSend(v9, "frame");
        v98 = v53;
        v100 = v54;
        v55 = (v21 + v42) * 0.5 + -30.0 - v21;
        if (!v10)
          v55 = v42;
        v93 = v55;
        objc_msgSend(v114, "frame");
        v102 = v56;
        v104 = v57;
        v174.origin.x = (v21 + v42) * 0.5;
        v174.origin.y = v48;
        v174.size.width = v50;
        v174.size.height = v52;
        v58 = CGRectGetMaxX(v174) + 30.0;
        objc_msgSend(v4, "_resultsControllerViewContainer");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "frame");
        v94 = v60;
        v96 = v61;

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke_2;
        aBlock[3] = &unk_1E16C4A48;
        v113 = v9;
        v62 = v8;
        v63 = v6;
        v116 = v6;
        v123 = v92;
        v117 = v62;
        v124 = v21;
        v125 = v111;
        v126 = v109;
        v127 = v107;
        v118 = v113;
        v128 = v21;
        v129 = v98;
        v130 = v93;
        v131 = v100;
        v119 = v10;
        v132 = (v21 + v42) * 0.5;
        v133 = v48;
        v134 = v50;
        v135 = v52;
        v120 = v114;
        v136 = v58;
        v137 = v102;
        v138 = v21 + v42 - v58;
        v139 = v104;
        v121 = v4;
        v140 = v21;
        v141 = v94;
        v142 = v42;
        v143 = v96;
        v122 = v5;
        v64 = _Block_copy(aBlock);
        v65 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 24.0, 0.0, 0.0);
        v66 = [UIViewPropertyAnimator alloc];
        v67 = objc_alloc_init(MEMORY[0x1E0CD2848]);
        objc_msgSend(v67, "settlingDuration");
        v68 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v66, "initWithDuration:timingParameters:", v65);

        v6 = v63;
        v8 = v62;
        v9 = v113;
        -[UIViewPropertyAnimator addAnimations:](v68, "addAnimations:", v64);
        -[UIViewPropertyAnimator startAnimation](v68, "startAnimation");

      }
    }
  }

}

- (void)didUnfocusSearchBarForController:(id)a3
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
  _BOOL4 IsIdentity;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  __int128 v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  double MinX;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  void *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  id v74;
  void *v75;
  void *v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  CGFloat v80;
  void *v81;
  double v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  UISpringTimingParameters *v92;
  UIViewPropertyAnimator *v93;
  id v94;
  UIViewPropertyAnimator *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  void *v119;
  void *v120;
  _QWORD v121[4];
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  uint64_t v137;
  double v138;
  CGFloat v139;
  double v140;
  CGFloat v141;
  CGFloat v142;
  uint64_t v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD aBlock[4];
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  double v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  double v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  double v174;
  uint64_t v175;
  double v176;
  _OWORD v177[3];
  CGAffineTransform v178;
  CGRect v179;
  CGRect v180;

  v4 = a3;
  objc_msgSend(v4, "_systemInputViewControllerAfterUpdate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alignmentConstraintForAxis:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_suggestionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_leftDividerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rightDividerView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (objc_msgSend(v7, "showsScopeBar"))
  {
    objc_msgSend(v7, "_scopeBarContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "_scopeBarContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  if (objc_msgSend(v5, "resolvedKeyboardStyle") == 1)
  {
    objc_msgSend(v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v178, 0, sizeof(v178));
    IsIdentity = CGAffineTransformIsIdentity(&v178);

    if (IsIdentity)
    {
      objc_msgSend(v5, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      objc_msgSend(v5, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v177[0] = *MEMORY[0x1E0C9BAA8];
      v177[1] = v26;
      v177[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v25, "setTransform:", v177);

      objc_msgSend(v15, "setAlpha:", 1.0);
      v27 = v24 + 34.5;
      if (v8)
      {
        objc_msgSend(v8, "frame");
        v101 = v30;
        v103 = v29;
        v99 = v31;
      }
      else
      {
        v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v101 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
        v103 = *MEMORY[0x1E0C9D648];
        v99 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
      }
      v119 = v6;
      v116 = v20;
      v118 = v18;
      v112 = v24;
      v114 = v22;
      v110 = v28 - v27;
      if (v9)
      {
        objc_msgSend(v9, "frame");
        v97 = v56;
        v98 = v55;
        v96 = v57;
      }
      else
      {
        v54 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v97 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
        v98 = *MEMORY[0x1E0C9D648];
        v96 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
      }
      v58 = v54 - v27;
      objc_msgSend(v10, "frame");
      v105 = v60;
      v108 = v59;
      v62 = v61;
      v64 = v63 - v27;
      objc_msgSend(v4, "_resultsControllerViewContainer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "frame");
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke;
      aBlock[3] = &unk_1E16BF688;
      v157 = v118;
      v158 = v116;
      v159 = v114;
      v160 = v112;
      v151 = v5;
      v152 = v8;
      v161 = v103;
      v162 = v110;
      v163 = v101;
      v164 = v99;
      v153 = v9;
      v165 = v98;
      v166 = v58;
      v167 = v97;
      v168 = v96;
      v154 = v10;
      v169 = v108;
      v170 = v64;
      v171 = v105;
      v172 = v62;
      v173 = v67 + 0.0;
      v174 = v69 - v27;
      v175 = v71;
      v176 = v73 - (0.0 - v27);
      v155 = v4;
      v156 = v15;
      v74 = v15;
      v75 = _Block_copy(aBlock);
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", 0);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v75, 0);

LABEL_24:
      v6 = v119;
      goto LABEL_25;
    }
  }
  if (objc_msgSend(v5, "resolvedKeyboardStyle") == 2)
  {
    objc_msgSend(v6, "constant");
    v33 = v32;
    objc_msgSend(v4, "view");
    v119 = v6;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    MinX = CGRectGetMinX(v179);

    v6 = v119;
    if (v33 >= MinX)
    {
      objc_msgSend(v4, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_shouldReverseLayoutDirection");

      objc_msgSend(v5, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v117 = -v38;

      objc_msgSend(v8, "superview");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "frame");
      v113 = v41;
      v115 = v40;
      v111 = v42;

      objc_msgSend(v10, "frame");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      objc_msgSend(v4, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "center");
      v51 = v50 + v46 * -0.5;

      objc_msgSend(v9, "frame");
      v107 = v52;
      v109 = v53;
      if (v10)
      {
        v102 = v51 + -30.0 + -190.0;
      }
      else
      {
        objc_msgSend(v4, "view");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "frame");
        v102 = v77 + -270.0;

      }
      objc_msgSend(v120, "frame");
      v104 = v78;
      v106 = v79;
      v180.origin.x = v51;
      v180.origin.y = v44;
      v180.size.width = v46;
      v180.size.height = v48;
      v80 = CGRectGetMaxX(v180) + 30.0;
      objc_msgSend(v4, "view");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "frame");
      v100 = v82 + -80.0 - v80;

      objc_msgSend(v4, "_resultsControllerViewContainer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "frame");
      v85 = v84;
      v87 = v86;

      objc_msgSend(v4, "view");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "frame");
      v90 = v89;

      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke_2;
      v121[3] = &unk_1E16C4A48;
      v122 = v119;
      v129 = v117;
      v123 = v8;
      v130 = 0;
      v131 = v115;
      v132 = v113;
      v133 = v111;
      v124 = v9;
      v134 = 0x4067C00000000000;
      v135 = v107;
      v136 = v102;
      v137 = v109;
      v125 = v10;
      v138 = v51;
      v139 = v44;
      v140 = v46;
      v141 = v48;
      v126 = v120;
      v142 = v80;
      v143 = v104;
      v144 = v100;
      v145 = v106;
      v127 = v4;
      v146 = 0;
      v147 = v85;
      v148 = v90;
      v149 = v87;
      v128 = v5;
      v91 = _Block_copy(v121);
      v92 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 24.0, 0.0, 0.0);
      v93 = [UIViewPropertyAnimator alloc];
      v94 = objc_alloc_init(MEMORY[0x1E0CD2848]);
      objc_msgSend(v94, "settlingDuration");
      v95 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v93, "initWithDuration:timingParameters:", v92);

      -[UIViewPropertyAnimator addAnimations:](v95, "addAnimations:", v91);
      -[UIViewPropertyAnimator startAnimation](v95, "startAnimation");

      v74 = v122;
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (void)willFocusOffscreenViewForController:(id)a3 withHeading:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double MaxX;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double MaxY;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  _UISearchControllerATVSearchBarAnimatorLegacy *v83;
  void *v84;
  void *v85;
  _BOOL4 IsIdentity;
  void *v87;
  double v88;
  void *v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  double v121;
  double v122;
  CGFloat v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat rect;
  CGFloat v132;
  CGFloat v133;
  void *v134;
  unsigned int v135;
  double v136;
  void *v137;
  void *v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  uint64_t v149;
  double v150;
  uint64_t v151;
  uint64_t v152;
  CGFloat v153;
  double v154;
  CGFloat v155;
  CGFloat v156;
  uint64_t v157;
  double v158;
  uint64_t v159;
  uint64_t v160;
  CGFloat v161;
  double v162;
  CGFloat v163;
  CGFloat v164;
  uint64_t v165;
  double v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  double v174;
  uint64_t v175;
  double v176;
  double v177;
  uint64_t v178;
  double v179;
  uint64_t v180;
  uint64_t v181;
  CGAffineTransform v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;

  v135 = a4;
  v6 = a3;
  objc_msgSend(v6, "_systemInputViewControllerAfterUpdate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_searchPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchControllerATVSearchAnimatorLegacy.m"), 842, CFSTR("UISearchBar's presentation controller must be of type _UISearchATVPresentationController."));

  }
  objc_msgSend(v6, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_shouldReverseLayoutDirection");

  objc_msgSend(v7, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  if (v13)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v15);
    objc_msgSend(v7, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v22 = MaxX < CGRectGetMaxX(v183);

  }
  else
  {
    v22 = v15 > 0.0;
  }

  if (objc_msgSend(v7, "resolvedKeyboardStyle") != 2 || !v22)
  {
    objc_msgSend(v6, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tabBarController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tabBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "_displayStyle") != 1)
    {

      v25 = 0;
    }
    objc_msgSend(v6, "searchBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_suggestionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "showsScopeBar"))
    {
      objc_msgSend(v26, "_scopeBarContainerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_msgSend(v26, "_scopeBarContainerView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "_leftDividerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rightDividerView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_resultsControllerViewContainer");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alignmentConstraintForAxis:", 1);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constant");
    v127 = v26;
    v121 = v32;
    if (v25)
    {
      objc_msgSend(v25, "frame");
      v117 = v33;
      v118 = v34;
      v116 = v35;
    }
    else
    {
      v117 = *MEMORY[0x1E0C9D648];
      v118 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v116 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    objc_msgSend(v7, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_msgSend(v31, "superview");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v31, "frame");
      v47 = v46;
      v49 = v48;
      v129 = v51;
      v130 = v50;
    }
    else
    {
      v47 = *MEMORY[0x1E0C9D648];
      v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v129 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v130 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    }

    objc_msgSend(v138, "superview");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v138, "frame");
      v114 = v54;
      v115 = v53;
      v105 = v55;
      v113 = v56;
    }
    else
    {
      v105 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v114 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v115 = *MEMORY[0x1E0C9D648];
      v113 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }

    objc_msgSend(v27, "frame");
    v132 = v58;
    v133 = v57;
    v60 = v59;
    rect = v61;
    if (v28)
    {
      objc_msgSend(v28, "frame");
      v111 = v63;
      v112 = v62;
      v102 = v64;
      v110 = v65;
    }
    else
    {
      v102 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
      v111 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v112 = *MEMORY[0x1E0C9D648];
      v110 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    v125 = v42;
    v126 = v38;
    v124 = v44;
    if (v30)
    {
      objc_msgSend(v30, "frame");
      v108 = v67;
      v109 = v66;
      v69 = v68;
      v107 = v70;
    }
    else
    {
      v69 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v108 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v109 = *MEMORY[0x1E0C9D648];
      v107 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    v134 = v31;
    objc_msgSend(v137, "frame");
    v119 = v71;
    v120 = v72;
    v74 = v73;
    v76 = v75;
    v77 = dbl_18667B080[v25 == 0];
    v123 = v47;
    v184.origin.x = v47;
    v184.origin.y = v49;
    v184.size.height = v129;
    v184.size.width = v130;
    MaxY = CGRectGetMaxY(v184);
    v185.size.width = v132;
    v185.origin.x = v133;
    v185.origin.y = v60;
    v185.size.height = rect;
    v79 = v77 + MaxY - CGRectGetMinY(v185) + 30.0;
    v80 = v30;
    if (objc_msgSend(v7, "resolvedKeyboardStyle") == 2)
    {
      v81 = v28;
      v82 = v27;
      v83 = self;
    }
    else
    {
      objc_msgSend(v7, "view");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      v81 = v28;
      v82 = v27;
      v83 = self;
      if (v84)
        objc_msgSend(v84, "transform");
      else
        memset(&v182, 0, sizeof(v182));
      IsIdentity = CGAffineTransformIsIdentity(&v182);

      if (IsIdentity)
      {
        objc_msgSend(v7, "view");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "frame");
        v79 = v79 - (v88 + 34.5);

      }
    }
    objc_msgSend(v6, "searchResultsToHiddenKeyboardFocusGuide", v102);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (v60 >= 0.0) & (v135 >> 1);
    if ((_DWORD)v90 == 1)
    {
      v122 = v121 - v79;
      v136 = v40 - v79;
      v91 = -v79;
      v92 = v60 - v79;
      v93 = v103 - v79;
      v94 = v49 - v79;
      v95 = v69 - v79;
      v104 = v105 - v79;
      v106 = v74 - v79;
      v96 = v76 - (0.0 - v79);
      objc_msgSend(v7, "view");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v97)
        goto LABEL_45;
    }
    else
    {
      v98 = v128;
      if ((v135 & 1) == 0 || v60 >= 0.0)
        goto LABEL_46;
      v122 = v121 + v79;
      v136 = v40 + v79;
      v92 = v60 + v79;
      v93 = v103 + v79;
      v94 = v49 + v79;
      v95 = v69 + v79;
      v104 = v105 + v79;
      v106 = v74 + v79;
      v91 = 0.0;
      v96 = v76 - (v79 + 0.0);
    }
    objc_msgSend(v89, "setEnabled:", v90, *(_QWORD *)&v104);
LABEL_45:
    -[_UISearchControllerAnimator transitionDuration:](v83, "transitionDuration:", 0);
    v100 = v99;
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __97___UISearchControllerATVSearchBarAnimatorLegacy_willFocusOffscreenViewForController_withHeading___block_invoke;
    v139[3] = &unk_1E16C4A70;
    v140 = v25;
    v149 = v117;
    v150 = v91;
    v151 = v118;
    v152 = v116;
    v141 = v82;
    v153 = v133;
    v154 = v92;
    v155 = v132;
    v156 = rect;
    v142 = v81;
    v157 = v112;
    v158 = v93;
    v159 = v111;
    v160 = v110;
    v143 = v134;
    v161 = v123;
    v162 = v94;
    v163 = v130;
    v164 = v129;
    v144 = v138;
    v165 = v115;
    v166 = v104;
    v167 = v114;
    v168 = v113;
    v145 = v80;
    v169 = v109;
    v170 = v95;
    v171 = v108;
    v172 = v107;
    v146 = v137;
    v173 = v119 + 0.0;
    v174 = v106;
    v175 = v120;
    v176 = v96;
    v98 = v128;
    v147 = v128;
    v177 = v122;
    v148 = v7;
    v178 = v126;
    v179 = v136;
    v180 = v125;
    v181 = v124;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v139, 0, v100);

LABEL_46:
  }

}

- (BOOL)collapesKeyboardWhenNotFocused
{
  return 1;
}

@end
