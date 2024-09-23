@implementation CACLabeledGridOverlayView

- (CACLabeledGridOverlayView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CACLabeledGridOverlayView *v7;
  uint64_t v8;
  NSMutableArray *labeledElements;
  CACZoomController *v10;
  CACZoomController *zoomController;
  void *v12;
  CACAdaptiveBackdropView *v13;
  void *v14;
  uint64_t v15;
  CACAdaptiveBackdropView *backdrop;
  void *v17;
  uint64_t v18;
  UIView *badgesContainer;
  uint64_t v20;
  UIView *contrastBadgesContainer;
  uint64_t v22;
  NSMutableArray *allBadgeViews;
  uint64_t v24;
  NSMutableArray *separatorViews;
  uint64_t v26;
  NSMutableArray *dimmingViews;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)CACLabeledGridOverlayView;
  v7 = -[CACLabeledGridOverlayView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_opt_new();
    labeledElements = v7->_labeledElements;
    v7->_labeledElements = (NSMutableArray *)v8;

    v10 = -[CACZoomController initWithContainingView:]([CACZoomController alloc], "initWithContainingView:", v7);
    zoomController = v7->_zoomController;
    v7->_zoomController = v10;

    -[CACLabeledGridOverlayView layer](v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCreatesCompositingGroup:", 1);

    v13 = [CACAdaptiveBackdropView alloc];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = -[CACAdaptiveBackdropView initWithFrame:](v13, "initWithFrame:");
    backdrop = v7->_backdrop;
    v7->_backdrop = (CACAdaptiveBackdropView *)v15;

    -[CACAdaptiveBackdropView layer](v7->_backdrop, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCaptureOnly:", 1);

    -[CACLabeledGridOverlayView insertSubview:atIndex:](v7, "insertSubview:atIndex:", v7->_backdrop, 0);
    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, x, y, width, height);
    v18 = objc_claimAutoreleasedReturnValue();
    badgesContainer = v7->_badgesContainer;
    v7->_badgesContainer = (UIView *)v18;

    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, x, y, width, height);
    v20 = objc_claimAutoreleasedReturnValue();
    contrastBadgesContainer = v7->_contrastBadgesContainer;
    v7->_contrastBadgesContainer = (UIView *)v20;

    v22 = objc_opt_new();
    allBadgeViews = v7->_allBadgeViews;
    v7->_allBadgeViews = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    separatorViews = v7->_separatorViews;
    v7->_separatorViews = (NSMutableArray *)v24;

    v26 = objc_opt_new();
    dimmingViews = v7->_dimmingViews;
    v7->_dimmingViews = (NSMutableArray *)v26;

  }
  return v7;
}

- (void)show
{
  -[CACLabeledGridOverlayView setAlpha:](self, "setAlpha:", 1.0);
}

- (void)hide
{
  -[CACLabeledGridOverlayView setAlpha:](self, "setAlpha:", 0.0);
}

- (void)clearLabeledElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_labeledElements, "removeAllObjects");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CACLabeledGridOverlayView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        -[CACLabeledGridOverlayView backdrop](self, "backdrop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          objc_msgSend(v8, "removeFromSuperview");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CACLabeledGridOverlayView badgesContainer](self, "badgesContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15++), "removeFromSuperview");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CACLabeledGridOverlayView contrastBadgesContainer](self, "contrastBadgesContainer", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "removeFromSuperview");
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

}

- (void)addLabeledElements:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  void *v45;
  float v46;
  double v47;
  void *v48;
  double MaxY;
  void *v50;
  float v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  id v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  CACLabeledGridOverlayView *v66;
  id v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  _BOOL8 v79;
  uint64_t v80;
  double v81;
  double v82;
  uint64_t j;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  CGFloat v98;
  _BOOL4 v99;
  double v100;
  CGFloat v101;
  float v102;
  double v103;
  double v104;
  float v105;
  double v106;
  double v107;
  CGFloat v108;
  CGFloat v109;
  CACLabeledBadgeView *v110;
  void *v111;
  uint64_t v112;
  CACLabeledGridOverlayView *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  double v134;
  CGFloat v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  void *v152;
  double v153;
  CACLabeledBadgeView *v154;
  void *v155;
  uint64_t v156;
  CACLabeledGridOverlayView *v157;
  double v158;
  CGFloat v159;
  double v160;
  double MinX;
  double v162;
  CGFloat v163;
  CGFloat v164;
  double v165;
  CGFloat v166;
  double MinY;
  double v168;
  void *v169;
  CACLabeledBadgeView *v170;
  void *v171;
  CACLabeledBadgeView *v172;
  void *v173;
  double v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  int v190;
  unint64_t v191;
  id v192;
  int v193;
  unint64_t v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  double v206;
  double v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  void *v213;
  double v214;
  double v215;
  void *v216;
  void *v217;
  void *v218;
  CACLabeledGridOverlayView *v219;
  float v220;
  float v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  float v226;
  uint64_t k;
  void *v228;
  float v229;
  double v230;
  float v231;
  id v232;
  float v233;
  double v234;
  float v235;
  id v236;
  double v237;
  CGFloat v238;
  double v239;
  CGFloat v240;
  double v241;
  CGFloat v242;
  double v243;
  CGFloat v244;
  void *v245;
  void *v246;
  CGFloat v247;
  CGFloat v248;
  CGFloat v249;
  CGFloat v250;
  double v251;
  CGFloat v252;
  double v253;
  CGFloat v254;
  double v255;
  CGFloat v256;
  double v257;
  CGFloat v258;
  void *v259;
  uint64_t v260;
  void *v261;
  CGFloat v262;
  CGFloat v263;
  CGFloat v264;
  CGFloat v265;
  _BOOL4 IsNull;
  float v267;
  float v268;
  void *v269;
  void *v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t m;
  float v276;
  id v277;
  id v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t n;
  float v283;
  id v284;
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
  NSMutableArray *obj;
  uint64_t v296;
  CGFloat v297;
  CGFloat v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  _BOOL4 v308;
  double v309;
  double v310;
  id v311;
  id v312;
  double v313;
  double v314;
  double v315;
  uint64_t v316;
  CGFloat rect;
  double rectb;
  uint64_t recta;
  double v320;
  uint64_t v321;
  CACLabeledGridOverlayView *v322;
  double v323;
  id v324;
  double v325;
  void *v326;
  double v327;
  id v328;
  id v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];
  uint64_t v365;
  CGRect v366;
  CGRect v367;
  CGRect v368;
  CGRect v369;
  CGRect v370;
  CGRect v371;
  CGRect v372;
  CGRect v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;
  CGRect v402;
  CGRect v403;
  CGRect v404;
  CGRect v405;
  CGRect v406;
  CGRect v407;
  CGRect v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;

  v365 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray addObjectsFromArray:](self->_labeledElements, "addObjectsFromArray:", a3);
  -[CACLabeledGridOverlayView zoomController](self, "zoomController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[CACLabeledGridOverlayView badgesContainer](self, "badgesContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CACLabeledGridOverlayView contrastBadgesContainer](self, "contrastBadgesContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_labeledElements, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rectangle");
  v15 = CACViewRectFromPortraitUpRect(self, v11, v12, v13, v14);
  v17 = v16;

  -[NSMutableArray lastObject](self->_labeledElements, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rectangle");
  v23 = CACViewRectFromPortraitUpRect(self, v19, v20, v21, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v366.origin.x = v23;
  v366.origin.y = v25;
  v366.size.width = v27;
  v366.size.height = v29;
  v30 = CGRectGetMaxX(v366) - v15;
  v367.origin.x = v23;
  v367.origin.y = v25;
  v367.size.width = v27;
  v367.size.height = v29;
  v323 = v15;
  v325 = CGRectGetMaxY(v367) - v17;
  v320 = v17;
  v327 = v30;
  -[CACLabeledGridOverlayView zoomOverRect:](self, "zoomOverRect:", v15, v17, v30);
  v356 = 0u;
  v357 = 0u;
  v354 = 0u;
  v355 = 0u;
  v322 = self;
  v31 = self->_labeledElements;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v354, v364, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v355;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v355 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v354 + 1) + 8 * i), "rectangle");
        v368.origin.x = CACViewRectFromPortraitUpRect(v322, v36, v37, v38, v39);
        x = v368.origin.x;
        y = v368.origin.y;
        width = v368.size.width;
        height = v368.size.height;
        MaxX = CGRectGetMaxX(v368);
        objc_msgSend(v8, "lastObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "floatValue");
        v47 = v46 + 1.0;

        if (MaxX > v47)
        {
          v369.origin.x = x;
          v369.origin.y = y;
          v369.size.width = width;
          v369.size.height = height;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxX(v369));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v48);

        }
        v370.origin.x = x;
        v370.origin.y = y;
        v370.size.width = width;
        v370.size.height = height;
        MaxY = CGRectGetMaxY(v370);
        objc_msgSend(v9, "lastObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "floatValue");
        v52 = v51 + 1.0;

        if (MaxY > v52)
        {
          v371.origin.x = x;
          v371.origin.y = y;
          v371.size.width = width;
          v371.size.height = height;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxY(v371));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v53);

        }
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v354, v364, 16);
    }
    while (v33);
  }

  -[CACLabeledGridOverlayView bounds](v322, "bounds");
  v55 = v54;
  v57 = v56;
  v58 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v323, v56);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setBackgroundColor:", v59);

  objc_msgSend(v58, "setAlpha:", 0.5);
  v292 = v58;
  -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v58);
  v60 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v372.origin.x = v323;
  v372.origin.y = v17;
  v372.size.width = v327;
  v372.size.height = v325;
  v61 = CGRectGetMaxX(v372);
  v373.origin.x = v323;
  v373.origin.y = v17;
  v373.size.width = v327;
  v373.size.height = v325;
  v62 = (void *)objc_msgSend(v60, "initWithFrame:", v61, 0.0, v55 - CGRectGetMaxX(v373), v57);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setBackgroundColor:", v63);

  objc_msgSend(v62, "setAlpha:", 0.5);
  v291 = v62;
  -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v62);
  v64 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), "initWithFrame:", v323, 0.0, v327, v17);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setBackgroundColor:", v65);

  objc_msgSend(v64, "setAlpha:", 0.5);
  v290 = v64;
  -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v64);
  v66 = v322;
  v67 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v374.origin.x = v323;
  v374.origin.y = v17;
  v374.size.width = v327;
  v374.size.height = v325;
  v68 = CGRectGetMaxY(v374);
  v375.origin.x = v323;
  v375.origin.y = v17;
  v375.size.width = v327;
  v375.size.height = v325;
  v69 = (void *)objc_msgSend(v67, "initWithFrame:", v323, v68, v327, v57 - CGRectGetMaxY(v375));
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundColor:", v70);

  objc_msgSend(v69, "setAlpha:", 0.5);
  v289 = v69;
  -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v69);
  v71 = objc_msgSend(v8, "count");
  v294 = v9;
  v293 = v8;
  v308 = v71 == objc_msgSend(v9, "count") && objc_msgSend(v8, "count") == 3;
  v72 = (void *)objc_opt_new();
  -[CACLabeledGridOverlayView setOutOfBoxBadgeViews:](v322, "setOutOfBoxBadgeViews:", v72);

  v73 = (void *)objc_opt_new();
  -[CACLabeledGridOverlayView setZoomedGridBadgeViews:](v322, "setZoomedGridBadgeViews:", v73);

  v74 = -[CACLabeledGridOverlayView showsElementsAsClickable](v322, "showsElementsAsClickable");
  v350 = 0u;
  v351 = 0u;
  v352 = 0u;
  v353 = 0u;
  v75 = v322->_labeledElements;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v350, v363, 16);
  if (v76)
  {
    v77 = v76;
    v78 = 0;
    v79 = !v74;
    v80 = *(_QWORD *)v351;
    v81 = *MEMORY[0x24BDBF090];
    v82 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v310 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v311 = *(id *)(MEMORY[0x24BDBF090] + 16);
    v305 = *(double *)(MEMORY[0x24BEBE588] + 8);
    v306 = *MEMORY[0x24BEBE588];
    obj = v75;
    v296 = 1;
    v307 = *MEMORY[0x24BDBF090];
    do
    {
      for (j = 0; j != v77; ++j)
      {
        if (*(_QWORD *)v351 != v80)
          objc_enumerationMutation(obj);
        v84 = *(void **)(*((_QWORD *)&v350 + 1) + 8 * j);
        objc_msgSend(v84, "rectangle");
        v89 = CACViewRectFromPortraitUpRect(v66, v85, v86, v87, v88);
        v91 = v90;
        v93 = v92;
        v95 = v94;
        +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:", 1, 0, v79, 0);
        v98 = v93;
        v99 = v308;
        if (v93 >= v96)
          v99 = 0;
        if (v99)
        {
          v100 = v96;
          v101 = v89;
          v102 = v96 - v327;
          v103 = truncf(v102);
          if (v327 >= v100)
            v104 = 0.0;
          else
            v104 = v103;
          v105 = v97 - v325;
          v106 = truncf(v105);
          v313 = v97;
          if (v325 >= v97)
            v107 = 0.0;
          else
            v107 = v106;
          v309 = v100;
          switch(v296 + j)
          {
            case 1:
              v376.origin.x = v101;
              v376.origin.y = v91;
              v376.size.width = v98;
              v376.size.height = v95;
              v297 = v95;
              v304 = CGRectGetMinX(v376) - v100 - v104;
              v108 = v101;
              v109 = v101;
              goto LABEL_48;
            case 2:
              v392.origin.x = v101;
              v392.origin.y = v91;
              v392.size.width = v98;
              v392.size.height = v95;
              v304 = CGRectGetMidX(v392) + v100 * -0.5;
              v109 = v101;
              v141 = v91;
              v143 = v95;
              v142 = v98;
              v108 = v101;
              goto LABEL_49;
            case 3:
              v393.origin.x = v101;
              v393.origin.y = v91;
              v393.size.width = v98;
              v393.size.height = v95;
              v297 = v95;
              v304 = v104 + CGRectGetMaxX(v393);
              v108 = v101;
              v109 = v101;
LABEL_48:
              v141 = v91;
              v143 = v297;
              v142 = v98;
LABEL_49:
              v144 = CGRectGetMinY(*(CGRect *)&v109) - v313 - v107;
              goto LABEL_57;
            case 4:
              v394.origin.x = v101;
              v394.origin.y = v91;
              v394.size.width = v98;
              v394.size.height = v95;
              v304 = CGRectGetMinX(v394) - v100 - v104;
              v108 = v101;
              v145 = v101;
              v146 = v91;
              v148 = v95;
              v147 = v98;
              goto LABEL_52;
            case 6:
              v395.origin.x = v101;
              v395.origin.y = v91;
              v395.size.width = v98;
              v395.size.height = v95;
              v304 = v104 + CGRectGetMaxX(v395);
              v108 = v101;
              v145 = v101;
              v146 = v91;
              v147 = v98;
              v148 = v95;
LABEL_52:
              v144 = CGRectGetMidY(*(CGRect *)&v145) + v313 * -0.5;
              goto LABEL_57;
            case 7:
              v391.origin.x = v101;
              v391.origin.y = v91;
              v391.size.width = v98;
              v391.size.height = v95;
              v298 = v95;
              v304 = CGRectGetMinX(v391) - v100 - v104;
              v108 = v101;
              v140 = v101;
              goto LABEL_55;
            case 8:
              v396.origin.x = v101;
              v396.origin.y = v91;
              v396.size.width = v98;
              v396.size.height = v95;
              v304 = CGRectGetMidX(v396) + v100 * -0.5;
              v140 = v101;
              v149 = v91;
              v151 = v95;
              v150 = v98;
              v108 = v101;
              goto LABEL_56;
            case 9:
              v397.origin.x = v101;
              v397.origin.y = v91;
              v397.size.width = v98;
              v397.size.height = v95;
              v298 = v95;
              v304 = v104 + CGRectGetMaxX(v397);
              v108 = v101;
              v140 = v101;
LABEL_55:
              v149 = v91;
              v151 = v298;
              v150 = v98;
LABEL_56:
              v144 = v107 + CGRectGetMaxY(*(CGRect *)&v140);
LABEL_57:
              v303 = v144;
              break;
            default:
              v313 = v310;
              v309 = *(double *)&v311;
              v303 = v82;
              v304 = v81;
              v108 = v101;
              break;
          }
          -[CACLabeledGridOverlayView zoomController](v66, "zoomController");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "zoomFactor");
          v302 = v153;

          v154 = [CACLabeledBadgeView alloc];
          objc_msgSend(v84, "label");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v154, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v155, 0, v79, 0, v81, v82, *(double *)&v311, v310);
          v157 = v66;
          v114 = (void *)v156;

          objc_msgSend(v114, "systemLayoutSizeFittingSize:", v306, v305);
          v159 = v158;
          v301 = v158;
          rectb = v160;
          v398.origin.x = v108;
          v398.origin.y = v91;
          v398.size.width = v98;
          v398.size.height = v95;
          MinX = CGRectGetMinX(v398);
          v162 = v82;
          v163 = v95;
          v164 = v162;
          v399.origin.x = v323;
          v399.size.height = v325;
          v399.origin.y = v320;
          v399.size.width = v327;
          v299 = MinX - CGRectGetMinX(v399);
          v400.origin.x = v108;
          v400.origin.y = v91;
          v400.size.width = v98;
          v400.size.height = v163;
          v165 = CGRectGetWidth(v400);
          v401.origin.x = v81;
          v401.origin.y = v164;
          v401.size.width = v159;
          v401.size.height = rectb;
          v166 = v302 * (v165 - CGRectGetWidth(v401) * 0.5) + v299 * v302;
          v402.origin.x = v108;
          v402.origin.y = v91;
          v402.size.width = v98;
          v402.size.height = v163;
          MinY = CGRectGetMinY(v402);
          v403.origin.x = v323;
          v403.size.height = v325;
          v403.origin.y = v320;
          v403.size.width = v327;
          v300 = MinY - CGRectGetMinY(v403);
          v404.origin.x = v108;
          v404.origin.y = v91;
          v404.size.width = v98;
          v404.size.height = v163;
          v168 = CGRectGetHeight(v404);
          v405.origin.x = v166;
          v82 = v164;
          v405.origin.y = v164;
          v405.size.width = v301;
          v405.size.height = rectb;
          objc_msgSend(v114, "setFrame:", v166, v302 * (v168 - CGRectGetHeight(v405) * 0.5) + v300 * v302, v301, rectb);
          -[CACLabeledGridOverlayView zoomedGridBadgeViews](v157, "zoomedGridBadgeViews");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "addObject:", v114);

          v406.origin.x = v304;
          v406.origin.y = v303;
          v406.size.width = v309;
          v406.size.height = v313;
          if (!CGRectIsEmpty(v406))
          {
            v170 = [CACLabeledBadgeView alloc];
            objc_msgSend(v84, "label");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v170, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v171, 0, v79, 0, v304, v303, v309, v313);

            -[CACLabeledGridOverlayView outOfBoxBadgeViews](v322, "outOfBoxBadgeViews");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "addObject:", v172);

          }
          if ((v78 & 1) == 0)
            v78 = 1;
          v81 = v307;
        }
        else
        {
          v110 = [CACLabeledBadgeView alloc];
          objc_msgSend(v84, "label");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v110, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v111, 0, v79, 0, v81, v82, *(double *)&v311, v310);
          v113 = v66;
          v114 = (void *)v112;

          objc_msgSend(v114, "systemLayoutSizeFittingSize:", v306, v305);
          v116 = v115;
          rect = v117;
          if (!-[CACLabeledGridOverlayView showsNumbersInTopLeft](v113, "showsNumbersInTopLeft"))
            goto LABEL_40;
          v377.origin.x = v89;
          v377.origin.y = v91;
          v377.size.width = v93;
          v377.size.height = v95;
          v118 = CGRectGetWidth(v377);
          v378.origin.x = v81;
          v378.origin.y = v82;
          v378.size.width = v116;
          v378.size.height = rect;
          if (v118 - CGRectGetWidth(v378) <= 10.0)
            goto LABEL_40;
          v379.origin.x = v89;
          v379.origin.y = v91;
          v379.size.width = v98;
          v379.size.height = v95;
          v119 = CGRectGetHeight(v379);
          v380.origin.x = v81;
          v380.origin.y = v82;
          v380.size.width = v116;
          v380.size.height = rect;
          if (v119 - CGRectGetHeight(v380) > 10.0)
          {
            v381.size.width = v98;
            v120 = v82;
            v381.origin.x = v89;
            v381.origin.y = v91;
            v121 = v381.size.width;
            v122 = v95;
            v381.size.height = v95;
            v123 = v91;
            v124 = CGRectGetMinX(v381) + 5.0;
            v382.origin.x = v89;
            v382.origin.y = v123;
            v382.size.width = v121;
            v382.size.height = v122;
            v125 = CGRectGetMinY(v382) + 5.0;
            -[CACLabeledGridOverlayView safeAreaInsets](v322, "safeAreaInsets");
            if (v126 >= v125)
              v125 = v126;
            v383.origin.x = v89;
            v383.origin.y = v123;
            v383.size.width = v121;
            v383.size.height = v122;
            v127 = CGRectGetMaxY(v383);
            v384.origin.x = v124;
            v384.origin.y = v125;
            v384.size.width = v116;
            v384.size.height = rect;
            v128 = v127 - CGRectGetHeight(v384);
            if (v128 >= v125)
              v129 = v125;
            else
              v129 = v128;
            v130 = rect;
          }
          else
          {
LABEL_40:
            v385.origin.x = v89;
            v385.origin.y = v91;
            v385.size.width = v98;
            v385.size.height = v95;
            v314 = CGRectGetMinX(v385);
            v386.origin.x = v89;
            v386.origin.y = v91;
            v386.size.width = v98;
            v386.size.height = v95;
            v131 = CGRectGetWidth(v386);
            v132 = v81;
            v133 = v82;
            v134 = v131;
            v387.origin.x = v132;
            v387.origin.y = v133;
            v387.size.width = v116;
            v387.size.height = rect;
            v135 = v314 + (v134 - CGRectGetWidth(v387)) * 0.5;
            v388.origin.x = v89;
            v388.origin.y = v91;
            v388.size.width = v98;
            v388.size.height = v95;
            v315 = CGRectGetMinY(v388);
            v389.origin.x = v89;
            v389.origin.y = v91;
            v124 = v135;
            v389.size.width = v98;
            v389.size.height = v95;
            v136 = CGRectGetHeight(v389);
            v390.origin.x = v135;
            v120 = v133;
            v390.origin.y = v133;
            v390.size.width = v116;
            v390.size.height = rect;
            v129 = v315 + (v136 - CGRectGetHeight(v390)) * 0.5;
            v130 = rect;
          }
          objc_msgSend(v114, "setFrame:", v124, v129, v116, v130);
          -[CACLabeledGridOverlayView badgesContainer](v322, "badgesContainer");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "addSubview:", v114);

          if (UIAccessibilityDarkerSystemColorsEnabled())
          {
            -[CACLabeledGridOverlayView contrastBadgesContainer](v322, "contrastBadgesContainer");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "contrastedCopy");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "addSubview:", v139);

          }
          v81 = v307;
          v82 = v120;
        }

        v66 = v322;
      }
      v296 += v77;
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v350, v363, 16);
    }
    while (v77);

    if ((v78 & 1) != 0)
    {
      v174 = CACZWLensInnerBorderWidth() + 1.0;
      -[CACLabeledGridOverlayView zoomController](v322, "zoomController");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "view");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v176);

      -[CACLabeledGridOverlayView backdrop](v322, "backdrop");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACLabeledGridOverlayView bringSubviewToFront:](v322, "bringSubviewToFront:", v177);

      -[CACLabeledGridOverlayView zoomController](v322, "zoomController");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "lensChromeView");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "frame");
      v181 = v180;
      v183 = v182;
      v185 = v184;
      v187 = v186;

      v188 = v174 + v181;
      v189 = v174 + v183;
      if ((unint64_t)objc_msgSend(v293, "count") >= 2)
      {
        v190 = 2;
        v191 = 1;
        do
        {
          v192 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v188 + (v185 + v174 * -2.0) * (float)((float)(int)(v190 - 6 * (v191 / 3)) / 6.0), v189, 1.0, v187 + v174 * -2.0);
          -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v192);

          ++v191;
          v190 += 2;
        }
        while (objc_msgSend(v293, "count") > v191);
      }
      if ((unint64_t)objc_msgSend(v294, "count") >= 2)
      {
        v193 = 2;
        v194 = 1;
        do
        {
          v195 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v188, v189 + (v187 + v174 * -2.0) * (float)((float)(int)(v193 - 6 * (v194 / 3)) / 6.0), v185 + v174 * -2.0, 1.0);
          -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v195);

          ++v194;
          v193 += 2;
        }
        while (objc_msgSend(v294, "count") > v194);
      }
      v340 = 0u;
      v341 = 0u;
      v338 = 0u;
      v339 = 0u;
      -[CACLabeledGridOverlayView zoomedGridBadgeViews](v322, "zoomedGridBadgeViews");
      v328 = (id)objc_claimAutoreleasedReturnValue();
      v196 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v338, v360, 16);
      if (v196)
      {
        v197 = v196;
        v198 = 0;
        v199 = *(_QWORD *)v339;
        v200 = v187 - v174 * 2.0;
        v201 = v185 - v174 * 2.0;
        do
        {
          v202 = 0;
          v203 = (2 * v198) | 1;
          do
          {
            if (*(_QWORD *)v339 != v199)
              objc_enumerationMutation(v328);
            v204 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * v202);
            v205 = (v198 + v202) / 3;
            v206 = v200 * (float)((float)((float)((float)v205 * 2.0) + 1.0) / 6.0);
            v207 = v201 * (float)((float)(v203 - 6 * v205) / 6.0);
            -[CACLabeledGridOverlayView zoomController](v322, "zoomController");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "lensChromeView");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "frame");
            v211 = v207 + v174 + v210;

            -[CACLabeledGridOverlayView zoomController](v322, "zoomController");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "lensChromeView");
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "frame");
            v215 = v206 + v174 + v214;

            objc_msgSend(v204, "setCenter:", v211, v215);
            -[CACLabeledGridOverlayView badgesContainer](v322, "badgesContainer");
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v216, "addSubview:", v204);

            if (UIAccessibilityDarkerSystemColorsEnabled())
            {
              -[CACLabeledGridOverlayView contrastBadgesContainer](v322, "contrastBadgesContainer");
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v204, "contrastedCopy");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v217, "addSubview:", v218);

            }
            ++v202;
            v203 += 2;
          }
          while (v197 != v202);
          v197 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v338, v360, 16);
          v198 += v202;
        }
        while (v197);
      }

      v336 = 0u;
      v337 = 0u;
      v334 = 0u;
      v335 = 0u;
      v312 = v293;
      v219 = v322;
      recta = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v334, v359, 16);
      if (recta)
      {
        v220 = v323;
        v316 = *(_QWORD *)v335;
        v221 = v320;
        do
        {
          v222 = 0;
          do
          {
            if (*(_QWORD *)v335 != v316)
              objc_enumerationMutation(v312);
            v321 = v222;
            v223 = *(void **)(*((_QWORD *)&v334 + 1) + 8 * v222);
            v330 = 0u;
            v331 = 0u;
            v332 = 0u;
            v333 = 0u;
            v324 = v294;
            v224 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v330, v358, 16);
            if (v224)
            {
              v225 = v224;
              v329 = *(id *)v331;
              v226 = v221;
              do
              {
                for (k = 0; k != v225; ++k)
                {
                  if (*(id *)v331 != v329)
                    objc_enumerationMutation(v324);
                  v228 = *(void **)(*((_QWORD *)&v330 + 1) + 8 * k);
                  objc_msgSend(v223, "floatValue");
                  v230 = truncf((float)(v220 + v229) * 0.5);
                  objc_msgSend(v228, "floatValue");
                  v232 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v219, "_newLineViewWithFrame:", v230, (float)(truncf((float)(v226 + v231) * 0.5) + -2.0), 1.0, 5.0);
                  objc_msgSend(v223, "floatValue");
                  v234 = (float)(truncf((float)(v220 + v233) * 0.5) + -2.0);
                  objc_msgSend(v228, "floatValue");
                  v236 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v219, "_newLineViewWithFrame:", v234, truncf((float)(v226 + v235) * 0.5), 5.0, 1.0);
                  objc_msgSend(v232, "frame");
                  v238 = v237;
                  v240 = v239;
                  v242 = v241;
                  v244 = v243;
                  -[CACLabeledGridOverlayView zoomController](v219, "zoomController");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v245, "lensChromeView");
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v246, "frame");
                  v411.origin.x = v247;
                  v411.origin.y = v248;
                  v411.size.width = v249;
                  v411.size.height = v250;
                  v407.origin.x = v238;
                  v407.origin.y = v240;
                  v407.size.width = v242;
                  v407.size.height = v244;
                  v408 = CGRectIntersection(v407, v411);
                  if (CGRectIsNull(v408))
                  {
                    objc_msgSend(v236, "frame");
                    v252 = v251;
                    v254 = v253;
                    v256 = v255;
                    v258 = v257;
                    -[CACLabeledGridOverlayView zoomController](v219, "zoomController");
                    v259 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v259, "lensChromeView");
                    v326 = v232;
                    v260 = v225;
                    v261 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v261, "frame");
                    v412.origin.x = v262;
                    v412.origin.y = v263;
                    v412.size.width = v264;
                    v412.size.height = v265;
                    v409.origin.x = v252;
                    v409.origin.y = v254;
                    v409.size.width = v256;
                    v409.size.height = v258;
                    v410 = CGRectIntersection(v409, v412);
                    IsNull = CGRectIsNull(v410);

                    v225 = v260;
                    v232 = v326;

                    v219 = v322;
                    if (IsNull)
                    {
                      -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v326);
                      -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v236);
                    }
                  }
                  else
                  {

                  }
                  objc_msgSend(v228, "floatValue");
                  v226 = v267;

                }
                v225 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v330, v358, 16);
              }
              while (v225);
            }

            objc_msgSend(v223, "floatValue");
            v220 = v268;
            v222 = v321 + 1;
          }
          while (v321 + 1 != recta);
          recta = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v334, v359, 16);
        }
        while (recta);
      }

      -[CACLabeledGridOverlayView setIsSmallEnoughForZooming:](v219, "setIsSmallEnoughForZooming:", 1);
      v269 = v293;
      v270 = v294;
      goto LABEL_116;
    }
  }
  else
  {

  }
  v269 = v293;
  objc_msgSend(v293, "removeLastObject");
  v348 = 0u;
  v349 = 0u;
  v346 = 0u;
  v347 = 0u;
  v271 = v293;
  v272 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v346, v362, 16);
  v270 = v294;
  if (v272)
  {
    v273 = v272;
    v274 = *(_QWORD *)v347;
    do
    {
      for (m = 0; m != v273; ++m)
      {
        if (*(_QWORD *)v347 != v274)
          objc_enumerationMutation(v271);
        objc_msgSend(*(id *)(*((_QWORD *)&v346 + 1) + 8 * m), "floatValue");
        v277 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v276, v320, 1.0, v325);
        -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v277);

      }
      v273 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v346, v362, 16);
    }
    while (v273);
  }

  objc_msgSend(v294, "removeLastObject");
  v344 = 0u;
  v345 = 0u;
  v342 = 0u;
  v343 = 0u;
  v278 = v294;
  v279 = objc_msgSend(v278, "countByEnumeratingWithState:objects:count:", &v342, v361, 16);
  if (v279)
  {
    v280 = v279;
    v281 = *(_QWORD *)v343;
    do
    {
      for (n = 0; n != v280; ++n)
      {
        if (*(_QWORD *)v343 != v281)
          objc_enumerationMutation(v278);
        objc_msgSend(*(id *)(*((_QWORD *)&v342 + 1) + 8 * n), "floatValue");
        v284 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v323, v283, v327, 1.0);
        -[CACLabeledGridOverlayView addSubview:](v322, "addSubview:", v284);

      }
      v280 = objc_msgSend(v278, "countByEnumeratingWithState:objects:count:", &v342, v361, 16);
    }
    while (v280);
  }

  v219 = v322;
  -[CACLabeledGridOverlayView setIsSmallEnoughForZooming:](v322, "setIsSmallEnoughForZooming:", 0);
  -[CACLabeledGridOverlayView zoomController](v322, "zoomController");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "view");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "removeFromSuperview");

LABEL_116:
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[CACLabeledGridOverlayView contrastBadgesContainer](v219, "contrastBadgesContainer");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledGridOverlayView addSubview:](v219, "addSubview:", v287);

  }
  -[CACLabeledGridOverlayView badgesContainer](v219, "badgesContainer");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledGridOverlayView addSubview:](v219, "addSubview:", v288);

}

- (id)_newLineViewWithFrame:(CGRect)a3
{
  CACAdaptiveBackdropView *v3;
  void *v4;

  v3 = -[CACAdaptiveBackdropView initWithFrame:]([CACAdaptiveBackdropView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CACAdaptiveBackdropView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureOnly:", 0);

  return v3;
}

- (void)zoomOverRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CACZoomController *v8;
  void *v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CACZoomController initWithContainingView:]([CACZoomController alloc], "initWithContainingView:", self);
  -[CACLabeledGridOverlayView setZoomController:](self, "setZoomController:", v8);

  -[CACLabeledGridOverlayView zoomController](self, "zoomController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hide");

  -[CACLabeledGridOverlayView zoomController](self, "zoomController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moveZoomRegion:", x, y, width, height);

  -[CACLabeledGridOverlayView zoomController](self, "zoomController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "show");

}

- (BOOL)showsNumbersInTopLeft
{
  return self->_showsNumbersInTopLeft;
}

- (void)setShowsNumbersInTopLeft:(BOOL)a3
{
  self->_showsNumbersInTopLeft = a3;
}

- (BOOL)showsElementsAsClickable
{
  return self->_showsElementsAsClickable;
}

- (void)setShowsElementsAsClickable:(BOOL)a3
{
  self->_showsElementsAsClickable = a3;
}

- (BOOL)isSmallEnoughForZooming
{
  return self->_isSmallEnoughForZooming;
}

- (void)setIsSmallEnoughForZooming:(BOOL)a3
{
  self->_isSmallEnoughForZooming = a3;
}

- (CACZoomController)zoomController
{
  return self->_zoomController;
}

- (void)setZoomController:(id)a3
{
  objc_storeStrong((id *)&self->_zoomController, a3);
}

- (CACAdaptiveBackdropView)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_backdrop, a3);
}

- (UIView)badgesContainer
{
  return self->_badgesContainer;
}

- (void)setBadgesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_badgesContainer, a3);
}

- (UIView)contrastBadgesContainer
{
  return self->_contrastBadgesContainer;
}

- (void)setContrastBadgesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_contrastBadgesContainer, a3);
}

- (NSMutableArray)outOfBoxBadgeViews
{
  return self->_outOfBoxBadgeViews;
}

- (void)setOutOfBoxBadgeViews:(id)a3
{
  objc_storeStrong((id *)&self->_outOfBoxBadgeViews, a3);
}

- (NSMutableArray)zoomedGridBadgeViews
{
  return self->_zoomedGridBadgeViews;
}

- (void)setZoomedGridBadgeViews:(id)a3
{
  objc_storeStrong((id *)&self->_zoomedGridBadgeViews, a3);
}

- (NSMutableArray)allBadgeViews
{
  return self->_allBadgeViews;
}

- (void)setAllBadgeViews:(id)a3
{
  objc_storeStrong((id *)&self->_allBadgeViews, a3);
}

- (NSMutableArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (NSMutableArray)dimmingViews
{
  return self->_dimmingViews;
}

- (void)setDimmingViews:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_allBadgeViews, 0);
  objc_storeStrong((id *)&self->_zoomedGridBadgeViews, 0);
  objc_storeStrong((id *)&self->_outOfBoxBadgeViews, 0);
  objc_storeStrong((id *)&self->_contrastBadgesContainer, 0);
  objc_storeStrong((id *)&self->_badgesContainer, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_zoomController, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end
