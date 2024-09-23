@implementation DividedMonthDayTransitionView

- (void)animateToMonthWithCompletion:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  CGFloat v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  double Height;
  uint64_t v116;
  double v117;
  uint64_t v118;
  double v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  double v135;
  void *v136;
  id v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  void *v150;
  void *v151;
  uint64_t v152;
  double v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  double v160;
  void *v161;
  id v162;
  uint64_t v163;
  void *v164;
  id v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  double v186;
  void *v187;
  id v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  double v192;
  void *v193;
  id v194;
  uint64_t v195;
  void *v196;
  void *v197;
  id v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  int64_t v205;
  dispatch_time_t v206;
  void *v207;
  id v208;
  id v209;
  void *v210;
  CGFloat v211;
  id v212;
  uint64_t v213;
  void *v214;
  void *v215;
  _QWORD block[5];
  _QWORD v217[5];
  _QWORD v218[4];
  id v219;
  _QWORD v220[4];
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  _QWORD v226[4];
  id v227;
  DividedMonthDayTransitionView *v228;
  _QWORD v229[5];
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  double v234;
  _QWORD v235[5];
  _QWORD v236[5];
  id v237;
  id v238;
  _QWORD v239[4];
  id v240;
  id v241;
  DividedMonthDayTransitionView *v242;
  CGFloat v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;

  v4 = a3;
  if (-[MonthDayTransitionView animating](self, "animating"))
    -[MonthDayTransitionView _haltAnimations](self, "_haltAnimations");
  v215 = v4;
  -[DividedMonthDayTransitionView setCompletion:](self, "setCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v5, "layoutSubviews");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v6, "viewWillLayoutSubviews");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "layoutSubviews");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v9, "viewDidLayoutSubviews");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v10, "forceUpdateListView");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v213 = v15;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  objc_msgSend(v17, "convertRect:fromView:", self);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  objc_msgSend(v27, "convertPoint:fromView:", self);
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v30, "frameOfListView");
  v211 = CGRectGetMinY(v244) - v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v31, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v19, v21, v23, v25, v29);

  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  v33 = v29 + v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "view"));
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v40, "frameOfListView");
  v42 = v33 - v41;

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
  objc_msgSend(v44, "setFrame:", 0.0, v42, v37, v39);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v45, "setHidden:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v46, "frame");
  v48 = v47;
  v50 = v49;

  -[MonthDayTransitionView dayViewDayLocation](self, "dayViewDayLocation");
  v52 = v51;
  v54 = v53;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v55, "setFrame:", v52, v54, v48, v50);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView allDayView](self, "allDayView"));
  objc_msgSend(v56, "setAlpha:", 1.0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "view"));
  objc_msgSend(v58, "setAlpha:", 1.0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));
  v61 = captureImageFromView(v60, 1);
  v62 = objc_claimAutoreleasedReturnValue(v61);

  v214 = (void *)v62;
  v63 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "subviews"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "firstObject"));
  objc_msgSend(v64, "insertSubview:belowSubview:", v63, v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "layer"));
  objc_msgSend(v69, "setMasksToBounds:", 0);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  objc_msgSend(v70, "convertRect:fromView:", self);
  v72 = v71;
  v74 = v73;

  objc_msgSend(v63, "setAlpha:", 0.0);
  objc_msgSend(v63, "frame");
  v210 = v63;
  objc_msgSend(v63, "setFrame:", v72, v74 - v21);
  objc_msgSend(v63, "setAutoresizingMask:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v75, "bounds");
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v84, v77, v79, v81, v83);

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  -[MonthDayTransitionView _topExtensionHeight](self, "_topExtensionHeight");
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "snapshotViewAfterScreenUpdates:", 0));

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  -[DividedMonthDayTransitionView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v86, v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v88, "convertPoint:toView:", self, CGPointZero.x, CGPointZero.y);
  v90 = v89;
  v92 = v91;

  v207 = v86;
  objc_msgSend(v86, "frame");
  objc_msgSend(v86, "setFrame:", v90, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "dayInitialsHeaderView"));
  objc_msgSend(v94, "frame");
  v96 = v95;
  v98 = v97;

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v99, "bounds");
  v101 = v100;

  v102 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v96, v101, v98);
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v102, "setBackgroundColor:", v103);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "dayInitialsHeaderView"));
  objc_msgSend(v104, "insertSubview:belowSubview:", v102, v106);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v107, "bounds");
  v109 = v108;
  objc_msgSend(v102, "frame");
  v110 = CGRectGetMaxY(v245) + 500.0;

  v111 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, -500.0, v109, v110);
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor](DividedMonthDayTransitionView, "dividedMonthPaletteBackgroundColor"));
  objc_msgSend(v111, "setBackgroundColor:", v112);

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v113, "insertSubview:belowSubview:", v111, v102);

  v114 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v246.origin.x = 0.0;
  v246.origin.y = v96;
  v246.size.width = v101;
  v246.size.height = v98;
  Height = CGRectGetHeight(v246);
  v117 = v96 + Height - 1.0 / EKUIScaleFactor(v116);
  v119 = 1.0 / EKUIScaleFactor(v118);
  -[DividedMonthDayTransitionView bounds](self, "bounds");
  objc_msgSend(v114, "setFrame:", 0.0, v117, CGRectGetWidth(v247), v119);
  objc_msgSend(v114, "setAlpha:", 0.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v114, "setBackgroundColor:", v120);

  objc_msgSend(v102, "addSubview:", v114);
  -[MonthDayTransitionView setAnimating:](self, "setAnimating:", 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  objc_msgSend(v121, "convertRect:fromView:", self);
  v123 = v122;

  v124 = v123 - v21;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v125, "setHidden:", 0);

  v126 = (void *)objc_claimAutoreleasedReturnValue(+[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor](DividedMonthDayTransitionView, "dividedMonthPaletteBackgroundColor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v127, "setBackgroundColor:", v126);

  v128 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "dayScrubberController"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "view"));
  objc_msgSend(v130, "setHidden:", 1);

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v131, "setVerticallyCompressedState:", 1);

  v132 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v132, "layoutIfNeeded");

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v133, "animateToMonthLayout");

  v135 = springAnimationDuration(v134);
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v239[0] = _NSConcreteStackBlock;
  v239[1] = 3221225472;
  v239[2] = sub_100065330;
  v239[3] = &unk_1001B33A0;
  v137 = v102;
  v240 = v137;
  v209 = v114;
  v241 = v209;
  v242 = self;
  v243 = v211;
  v138 = navigationAnimationsPreferringFRR(v239);
  v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
  v236[0] = _NSConcreteStackBlock;
  v236[1] = 3221225472;
  v236[2] = sub_1000653F8;
  v236[3] = &unk_1001B2560;
  v236[4] = self;
  v212 = v137;
  v237 = v212;
  v208 = v111;
  v238 = v208;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v136, v139, v236, v135, 0.0);

  v140 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "dateLabel"));
  objc_msgSend(v141, "setAlpha:", 0.0);

  -[MonthDayTransitionView weekDayInitialsDay](self, "weekDayInitialsDay");
  v143 = v142;
  v145 = v144;
  v147 = v146;
  v149 = v148;
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "dayInitialsHeaderView"));
  objc_msgSend(v151, "setFrame:", v143, v145, v147, v149);

  v153 = springAnimationDuration(v152);
  v154 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v235[0] = _NSConcreteStackBlock;
  v235[1] = 3221225472;
  v235[2] = sub_100065454;
  v235[3] = &unk_1001B2538;
  v235[4] = self;
  v155 = navigationAnimationsPreferringFRR(v235);
  v156 = (void *)objc_claimAutoreleasedReturnValue(v155);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v154, v156, 0, v153, 0.0);

  v157 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "view"));
  objc_msgSend(v158, "setHidden:", 1);

  v160 = springAnimationDuration(v159);
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v229[0] = _NSConcreteStackBlock;
  v229[1] = 3221225472;
  v229[2] = sub_10006550C;
  v229[3] = &unk_1001B33C8;
  v229[4] = self;
  v231 = v14;
  v232 = v213;
  v162 = v210;
  v230 = v162;
  v233 = v14;
  v234 = v124;
  v163 = navigationAnimationsPreferringFRR(v229);
  v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
  v226[0] = _NSConcreteStackBlock;
  v226[1] = 3221225472;
  v226[2] = sub_1000655F4;
  v226[3] = &unk_1001B2F58;
  v165 = v162;
  v227 = v165;
  v228 = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v161, v164, v226, v160, 0.0);

  v166 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v166, "frameOfListView");
  v168 = v167;
  v170 = v169;
  v172 = v171;
  v174 = v173;
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "view"));
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v176, v168, v170, v172, v174);
  v178 = v177;
  v180 = v179;
  v182 = v181;
  v184 = v183;

  v186 = springAnimationDuration(v185);
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v220[0] = _NSConcreteStackBlock;
  v220[1] = 3221225472;
  v220[2] = sub_10006564C;
  v220[3] = &unk_1001B27C0;
  v188 = v207;
  v221 = v188;
  v222 = v178;
  v223 = v180;
  v224 = v182;
  v225 = v184;
  v189 = navigationAnimationsPreferringFRR(v220);
  v190 = (void *)objc_claimAutoreleasedReturnValue(v189);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v187, v190, 0, v186, 0.0);

  v192 = springAnimationDuration(v191);
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v218[0] = _NSConcreteStackBlock;
  v218[1] = 3221225472;
  v218[2] = sub_10006565C;
  v218[3] = &unk_1001B2538;
  v194 = v188;
  v219 = v194;
  v195 = navigationAnimationsPreferringFRR(v218);
  v196 = (void *)objc_claimAutoreleasedReturnValue(v195);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v193, v196, 0, v192, 0.0);

  v197 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  -[MonthDayTransitionView dayViewMonthLocation](self, "dayViewMonthLocation");
  v198 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v197, 1);

  v217[0] = _NSConcreteStackBlock;
  v217[1] = 3221225472;
  v217[2] = sub_100065668;
  v217[3] = &unk_1001B2538;
  v217[4] = self;
  v199 = navigationAnimationsPreferringFRR(v217);
  v200 = (void *)objc_claimAutoreleasedReturnValue(v199);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v200, 0, 0.25, 0.0);

  if (UIAnimationDragCoefficient(v201, v202) <= 1.5)
    v205 = 600000000;
  else
    v205 = (uint64_t)(UIAnimationDragCoefficient(v203, v204) * 0.91 * 1000000000.0);
  v206 = dispatch_time(0, v205);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006569C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v206, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)animateToDayWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  void *v50;
  double MinY;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
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
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  CGFloat v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  double Height;
  uint64_t v109;
  double v110;
  uint64_t v111;
  double v112;
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
  uint64_t v124;
  double v125;
  void *v126;
  uint64_t v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  double v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  double v153;
  void *v154;
  id v155;
  uint64_t v156;
  void *v157;
  id v158;
  double MaxY;
  void *v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  void *v169;
  CGFloat v170;
  void *v171;
  CGFloat v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  double v181;
  void *v182;
  uint64_t v183;
  double v184;
  void *v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int64_t v192;
  dispatch_time_t v193;
  double v194;
  void *v195;
  uint64_t v196;
  void *v197;
  id v198;
  id v199;
  double v200;
  id v201;
  CGFloat v202;
  double v203;
  void *v204;
  void *v205;
  _QWORD block[5];
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  CATransform3D v210;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v213;
  _QWORD v214[5];
  id v215;
  _QWORD v216[4];
  id v217;
  CGFloat v218;
  _QWORD v219[5];
  _QWORD v220[5];
  _QWORD v221[4];
  id v222;
  id v223;
  _QWORD v224[4];
  id v225;
  DividedMonthDayTransitionView *v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;

  v4 = a3;
  if (-[MonthDayTransitionView animating](self, "animating"))
    -[MonthDayTransitionView _haltAnimations](self, "_haltAnimations");
  v205 = v4;
  -[DividedMonthDayTransitionView setCompletion:](self, "setCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v5, "forceUpdateListView");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  -[MonthDayTransitionView _topExtensionHeight](self, "_topExtensionHeight");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  objc_msgSend(v17, "convertRect:fromView:", self);
  v19 = v18;
  v203 = v18;
  v21 = v20;
  v200 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  objc_msgSend(v27, "convertPoint:fromView:", self);
  v29 = v28;

  v227.origin.x = v19;
  v227.origin.y = v21;
  v227.size.width = v23;
  v227.size.height = v25;
  v202 = CGRectGetMinY(v227) - v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v32, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v31, "convertRect:fromView:", v41, v34, v36, v38, v40);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v50, "frameOfListView");
  MinY = CGRectGetMinY(v228);
  v229.origin.x = v43;
  v229.origin.y = v45;
  v229.size.width = v47;
  v229.size.height = v49;
  v52 = MinY - CGRectGetMaxY(v229);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v53, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v203, v200, v23, v25, v29);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
  objc_msgSend(v55, "setAlpha:", 1.0);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
  v58 = captureImageFromView(v57, 1);
  v59 = objc_claimAutoreleasedReturnValue(v58);

  v204 = (void *)v59;
  v60 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "subviews"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "firstObject"));
  objc_msgSend(v61, "insertSubview:belowSubview:", v60, v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "layer"));
  objc_msgSend(v66, "setMasksToBounds:", 0);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v67, "setExtraPaletteHeight:", v52);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v68, "layoutSubviews");

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "view"));
  objc_msgSend(v69, "convertPoint:fromView:", v71, CGPointZero.x, CGPointZero.y);
  v73 = v72;
  v75 = v74;

  objc_msgSend(v60, "frame");
  objc_msgSend(v60, "setFrame:", v73, v75);
  -[MonthDayTransitionView weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "dayInitialsHeaderView"));
  objc_msgSend(v85, "setFrame:", v77, v79, v81, v83);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "dayInitialsHeaderView"));
  objc_msgSend(v87, "frame");
  v89 = v88;
  v91 = v90;

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v92, "bounds");
  v94 = v93;

  v95 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v89, v94, v91);
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor](DividedMonthDayTransitionView, "dividedMonthPaletteBackgroundColor"));
  objc_msgSend(v95, "setBackgroundColor:", v96);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "dayInitialsHeaderView"));
  objc_msgSend(v97, "insertSubview:belowSubview:", v95, v99);

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v100, "bounds");
  v102 = v101;
  objc_msgSend(v95, "frame");
  v103 = CGRectGetMaxY(v230) + 500.0;

  v104 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, -500.0, v102, v103);
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor](DividedMonthDayTransitionView, "dividedMonthPaletteBackgroundColor"));
  objc_msgSend(v104, "setBackgroundColor:", v105);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  objc_msgSend(v106, "insertSubview:aboveSubview:", v104, v60);

  v107 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v231.origin.x = 0.0;
  v231.origin.y = v89;
  v231.size.width = v94;
  v231.size.height = v91;
  Height = CGRectGetHeight(v231);
  v110 = v89 + Height - 1.0 / EKUIScaleFactor(v109);
  v112 = 1.0 / EKUIScaleFactor(v111);
  -[DividedMonthDayTransitionView bounds](self, "bounds");
  objc_msgSend(v107, "setFrame:", 0.0, v110, CGRectGetWidth(v232), v112);
  objc_msgSend(v107, "setAlpha:", 1.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v107, "setBackgroundColor:", v113);

  objc_msgSend(v95, "addSubview:", v107);
  -[MonthDayTransitionView setAnimating:](self, "setAnimating:", 1);
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "dayScrubberController"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "view"));
  objc_msgSend(v116, "setHidden:", 1);

  v117 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v117, "setHidden:", 0);

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v118, "setAlpha:", 1.0);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v119, "setVerticallyCompressedState:", 1);

  v120 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v120, "layoutIfNeeded");

  v121 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthViewController dividedModeBackgroundColor](CompactMonthViewController, "dividedModeBackgroundColor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v122, "setBackgroundColor:", v121);

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v123, "animateToDayLayout");

  v125 = springAnimationDuration(v124);
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v224[0] = _NSConcreteStackBlock;
  v224[1] = 3221225472;
  v224[2] = sub_10006655C;
  v224[3] = &unk_1001B26A0;
  v201 = v107;
  v225 = v201;
  v226 = self;
  v127 = navigationAnimationsPreferringFRR(v224);
  v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
  v221[0] = _NSConcreteStackBlock;
  v221[1] = 3221225472;
  v221[2] = sub_1000665E0;
  v221[3] = &unk_1001B2F58;
  v199 = v95;
  v222 = v199;
  v198 = v104;
  v223 = v198;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v126, v128, v221, v125, 0.0);

  -[MonthDayTransitionView weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v130 = v129;
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "dayInitialsHeaderView"));
  objc_msgSend(v138, "setFrame:", v130, v132, v134, v136);

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView paletteView](self, "paletteView"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "animatableDateLabel"));
  objc_msgSend(v140, "setAlpha:", 1.0);

  v142 = springAnimationDuration(v141);
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v220[0] = _NSConcreteStackBlock;
  v220[1] = 3221225472;
  v220[2] = sub_100066608;
  v220[3] = &unk_1001B2538;
  v220[4] = self;
  v144 = navigationAnimationsPreferringFRR(v220);
  v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v143, v145, 0, v142, 0.0);

  v147 = springAnimationDuration(v146);
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = sub_1000666C0;
  v219[3] = &unk_1001B2538;
  v219[4] = self;
  v148 = navigationAnimationsPreferringFRR(v219);
  v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v149, 0, v147, 0.0, 2.0, 300.0, 400.0, 0.0);

  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "view"));
  objc_msgSend(v151, "setHidden:", 1);

  v153 = springAnimationDuration(v152);
  v154 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v216[0] = _NSConcreteStackBlock;
  v216[1] = 3221225472;
  v216[2] = sub_100066718;
  v216[3] = &unk_1001B2838;
  v155 = v60;
  v217 = v155;
  v218 = v202;
  v156 = navigationAnimationsPreferringFRR(v216);
  v157 = (void *)objc_claimAutoreleasedReturnValue(v156);
  v214[0] = _NSConcreteStackBlock;
  v214[1] = 3221225472;
  v214[2] = sub_100066764;
  v214[3] = &unk_1001B2F58;
  v214[4] = self;
  v158 = v155;
  v215 = v158;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v154, v157, v214, v153, 0.0);

  -[DividedMonthDayTransitionView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v233);
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v160, "frame");
  v161 = MaxY - CGRectGetHeight(v234);
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "navigationController"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "toolbar"));
  objc_msgSend(v164, "frame");
  v165 = v161 - CGRectGetHeight(v235);

  v166 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  objc_msgSend(v166, "frameOfListView");
  v167 = CGRectGetMinY(v236);
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView monthViewController](self, "monthViewController"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "view"));
  objc_msgSend(v169, "frame");
  v170 = v167 / CGRectGetHeight(v237);

  v171 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v171, "frame");
  v172 = CGRectGetHeight(v238);
  CATransform3DMakeTranslation(&a, 0.0, v172 * 0.5, 0.0);
  CATransform3DMakeScale(&b, 1.0, v170, 1.0);
  CATransform3DConcat(&v213, &a, &b);
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "layer"));
  v210 = v213;
  objc_msgSend(v174, "setTransform:", &v210);

  v175 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v175, "setAlpha:", 0.0);

  v176 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v176, "setHidden:", 0);

  v177 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v177, "frame");
  v179 = v178;
  v181 = v180;

  v182 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v182, "setFrame:", 0.0, v165, v179, v181);

  v184 = springAnimationDuration(v183);
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472;
  v209[2] = sub_1000667B8;
  v209[3] = &unk_1001B2538;
  v209[4] = self;
  v186 = navigationAnimationsPreferringFRR(v209);
  v187 = (void *)objc_claimAutoreleasedReturnValue(v186);
  v208[0] = _NSConcreteStackBlock;
  v208[1] = 3221225472;
  v208[2] = sub_1000668A0;
  v208[3] = &unk_1001B25D0;
  v208[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v185, v187, v208, v184, 0.0);

  if (UIAnimationDragCoefficient(v188, v189) <= 1.5)
    v192 = 600000000;
  else
    v192 = (uint64_t)(UIAnimationDragCoefficient(v190, v191) * 0.91 * 1000000000.0);
  v193 = dispatch_time(0, v192);
  v194 = springAnimationDuration(v193);
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472;
  v207[2] = sub_1000668B0;
  v207[3] = &unk_1001B2538;
  v207[4] = self;
  v196 = navigationAnimationsPreferringFRR(v207);
  v197 = (void *)objc_claimAutoreleasedReturnValue(v196);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v195, v197, &stru_1001B3408, v194, 0.0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000668E8;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v193, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DividedMonthDayTransitionView;
  -[MonthDayTransitionView animationDidStop:finished:](&v12, "animationDidStop:finished:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  v7 = *(_OWORD *)&CATransform3DIdentity.m33;
  v11[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v11[5] = v7;
  v8 = *(_OWORD *)&CATransform3DIdentity.m43;
  v11[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v11[7] = v8;
  v9 = *(_OWORD *)&CATransform3DIdentity.m13;
  v11[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v11[1] = v9;
  v10 = *(_OWORD *)&CATransform3DIdentity.m23;
  v11[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v11[3] = v10;
  objc_msgSend(v6, "setTransform:", v11);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
